#!/usr/bin/env bash
# Detached worker — backfills missing daily logs from transcripts on disk.
# For each unique date STRICTLY BEFORE today that has transcript(s) but no
# daily-logs/<date>-convo.md, concatenate that day's transcripts chronologically
# and generate the log via headless Claude.
#
# Safety: never overwrites an existing log, never touches today's log (the live
# session owns it via SessionEnd), recursion-guarded via CC_AUTO_SHUTDOWN=1,
# lock-protected against concurrent session starts.
#
# Written for bash 3.2 (macOS default): no associative arrays; uses a sorted
# text index + awk instead.

tdir="$1"       # transcripts directory (contains *.jsonl)
project="$2"    # installing project/repo root
scriptdir="$3"  # this plugin's hooks/ dir (where the prompt file ships)

[ -d "$tdir" ] || exit 0
[ -d "$project" ] || exit 0

command -v jq >/dev/null 2>&1 || exit 0
CLAUDE_BIN="$(command -v claude 2>/dev/null || echo "$HOME/.local/bin/claude")"
[ -x "$CLAUDE_BIN" ] || exit 0

prompt="$scriptdir/auto-shutdown-prompt.md"
[ -f "$prompt" ] || exit 0

logdir="$project/daily-logs"
mkdir -p "$logdir"

# Lock so two sessions opening at once don't double-generate. A lock dir older
# than 2 hours is presumed stale (machine died mid-run) and is reclaimed.
lock="$HOME/.claude/.catch-up-logs-$(printf '%s' "$project" | tr '/' '-').lock"
if [ -d "$lock" ] && [ -n "$(find "$lock" -maxdepth 0 -mmin +120 2>/dev/null)" ]; then
  rmdir "$lock" 2>/dev/null
fi
mkdir "$lock" 2>/dev/null || exit 0

index="$(mktemp)"
trap 'rmdir "$lock" 2>/dev/null; rm -f "$index"' EXIT

today="$(date +%F)"

# Index every transcript as: date <TAB> full-timestamp <TAB> file,
# sorted by timestamp so same-day sessions merge chronologically.
for f in "$tdir"/*.jsonl; do
  [ -f "$f" ] || continue
  ts="$(head -1 "$f" 2>/dev/null | jq -r '.timestamp // empty' 2>/dev/null)"
  [ -n "$ts" ] || continue
  d="$(printf '%s' "$ts" | cut -c1-10)"
  printf '%s\t%s\t%s\n' "$d" "$ts" "$f"
done | sort -t "$(printf '\t')" -k2,2 > "$index"

[ -s "$index" ] || exit 0

# Unique dates strictly before today, oldest first.
awk -F '\t' -v today="$today" '$1 < today { print $1 }' "$index" | sort -u | while IFS= read -r d; do
  out="$logdir/$d-convo.md"
  [ -e "$out" ] && continue   # never overwrite an existing log

  tmp="$(mktemp)"
  {
    cat "$prompt"
    printf "\n\nToday's date: %s\n\n=== SESSION TRANSCRIPT (JSONL, one message per line) ===\n" "$d"
    awk -F '\t' -v d="$d" '$1 == d { print $3 }' "$index" | while IFS= read -r f; do
      cat "$f"
      printf '\n'
    done
  } | CC_AUTO_SHUTDOWN=1 "$CLAUDE_BIN" -p --model sonnet > "$tmp" 2>/dev/null

  # Write only if we actually got content back (and nothing raced us to it).
  if [ -s "$tmp" ] && [ ! -e "$out" ]; then
    mv "$tmp" "$out"
  else
    rm -f "$tmp"
  fi
done

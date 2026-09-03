#!/usr/bin/env bash
# Detached worker — generates the daily log from the session transcript via
# headless Claude and writes it to daily-logs/<date>-convo.md (overwriting).

transcript="$1"
out="$2"
prompt_file="$3"
today="$4"

[ -f "$transcript" ] || exit 0
[ -f "$prompt_file" ] || exit 0
mkdir -p "$(dirname "$out")"

CLAUDE_BIN="$(command -v claude 2>/dev/null || echo "$HOME/.local/bin/claude")"
[ -x "$CLAUDE_BIN" ] || exit 0

tmp="$(mktemp)"
{
  cat "$prompt_file"
  printf "\n\nToday's date: %s\n\n=== SESSION TRANSCRIPT (JSONL, one message per line) ===\n" "$today"
  cat "$transcript"
} | CC_AUTO_SHUTDOWN=1 "$CLAUDE_BIN" -p --model sonnet > "$tmp" 2>/dev/null

# Only overwrite the log if we actually got content back.
if [ -s "$tmp" ]; then
  mv "$tmp" "$out"
else
  rm -f "$tmp"
fi

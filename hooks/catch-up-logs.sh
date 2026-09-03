#!/usr/bin/env bash
# SessionStart hook — backfill daily logs for sessions that ended uncleanly.
# SessionEnd never fires when the process is killed (terminal closed, editor
# quit, crash, sleep, SSH drop), so those days have transcripts but no log.
# This detaches a worker that generates the missing logs from transcripts on
# disk. Prints NOTHING to stdout (SessionStart stdout is injected into model
# context) and exits immediately so startup is never blocked.

# Prevent recursion from the headless `claude -p` calls (they set CC_AUTO_SHUTDOWN=1).
[ -n "$CC_AUTO_SHUTDOWN" ] && exit 0

# Self-locate: this script ships inside the plugin's hooks/ dir, so sibling
# scripts (catch-up-logs-run.sh, auto-shutdown-prompt.md) live alongside it
# regardless of where the plugin is installed.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

input="$(cat)"
tpath="$(printf '%s' "$input" | jq -r '.transcript_path // empty' 2>/dev/null)"
if [ -n "$tpath" ]; then
  tdir="$(dirname "$tpath")"
else
  # Fallback: derive the project slug the way Claude Code does (every / -> -).
  slug="$(printf '%s' "$CLAUDE_PROJECT_DIR" | tr '/' '-')"
  tdir="$HOME/.claude/projects/$slug"
fi
[ -d "$tdir" ] || exit 0

run="$SCRIPT_DIR/catch-up-logs-run.sh"
[ -f "$run" ] || exit 0

# Portable detach: setsid (Linux/WSL) -> nohup (macOS/Git Bash) -> bare subshell.
if command -v setsid >/dev/null 2>&1; then
  setsid bash "$run" "$tdir" "$CLAUDE_PROJECT_DIR" "$SCRIPT_DIR" >/dev/null 2>&1 </dev/null &
elif command -v nohup >/dev/null 2>&1; then
  nohup bash "$run" "$tdir" "$CLAUDE_PROJECT_DIR" "$SCRIPT_DIR" >/dev/null 2>&1 </dev/null &
else
  ( bash "$run" "$tdir" "$CLAUDE_PROJECT_DIR" "$SCRIPT_DIR" >/dev/null 2>&1 </dev/null & )
fi
disown 2>/dev/null || true
exit 0

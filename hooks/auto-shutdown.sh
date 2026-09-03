#!/usr/bin/env bash
# SessionEnd hook — launch auto daily-log generation in a detached process
# so closing the session isn't blocked by the LLM call.

# Prevent recursion: the headless `claude -p` call below sets CC_AUTO_SHUTDOWN=1,
# and that child's own SessionEnd would otherwise re-trigger this hook forever.
[ -n "$CC_AUTO_SHUTDOWN" ] && exit 0

input="$(cat)"
transcript="$(printf '%s' "$input" | jq -r '.transcript_path // .transcript // empty' 2>/dev/null)"
[ -n "$transcript" ] && [ -f "$transcript" ] || exit 0

# Self-locate: this script ships inside the plugin's hooks/ dir, so sibling
# scripts (auto-shutdown-run.sh, auto-shutdown-prompt.md) live alongside it
# regardless of where the plugin is installed.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT="$CLAUDE_PROJECT_DIR"
out="$PROJECT/daily-logs/$(date +%F)-convo.md"
run="$SCRIPT_DIR/auto-shutdown-run.sh"
prompt="$SCRIPT_DIR/auto-shutdown-prompt.md"
today="$(date +%F)"

# Detach so the session can close immediately; the summary finishes in the background.
# setsid is Linux-only (missing on macOS / not guaranteed on Git Bash), so fall
# back to nohup, then a plain backgrounded subshell.
if command -v setsid >/dev/null 2>&1; then
  setsid bash "$run" "$transcript" "$out" "$prompt" "$today" >/dev/null 2>&1 </dev/null &
elif command -v nohup >/dev/null 2>&1; then
  nohup bash "$run" "$transcript" "$out" "$prompt" "$today" >/dev/null 2>&1 </dev/null &
else
  ( bash "$run" "$transcript" "$out" "$prompt" "$today" >/dev/null 2>&1 </dev/null & )
fi
disown 2>/dev/null || true
exit 0

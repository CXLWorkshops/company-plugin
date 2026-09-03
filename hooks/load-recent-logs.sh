#!/usr/bin/env bash
# SessionStart hook — inject the most recent daily logs into context
# so each session starts with continuity. Stdout is added to the session.

# Skip when invoked by the headless auto-shutdown call (avoids extra context cost).
[ -n "$CC_AUTO_SHUTDOWN" ] && exit 0

DIR="$CLAUDE_PROJECT_DIR/daily-logs"
[ -d "$DIR" ] || exit 0

# Newest 2 logs by filename (YYYY-MM-DD sorts lexically).
files="$(ls "$DIR"/*.md 2>/dev/null | sort | tail -2)"
[ -z "$files" ] && exit 0

echo "## Recent daily logs (auto-loaded at session start)"
echo
while IFS= read -r f; do
  [ -n "$f" ] || continue
  echo "### $(basename "$f")"
  cat "$f"
  echo
done <<< "$files"

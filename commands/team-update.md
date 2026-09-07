---
name: team-update
description: Summarize your recent daily logs into a team update and open a PR adding it to team-updates/ for admin review.
argument-hint: [today|this-week|last-week]
allowed-tools: Read, Glob, Write, Bash(git *), Bash(gh *), Bash(date *)
disable-model-invocation: true
---

Generate a team update from the current repo's `daily-logs/` and submit it for review via a PR. Never invoke this on your own initiative; only run it when the user explicitly typed `/team-update`.

## 1. Resolve the duration

The argument is `$ARGUMENTS`. Accept `today`, `this-week`, or `last-week` (case-insensitive; tolerate `this week` / `last week` with a space). If it's missing or doesn't match one of those three, stop and ask the user which one they meant — never guess.

Get today's date with `date +%F`. Compute the target range yourself:
- `today` → today's date only.
- `this-week` → the Monday of the current week through today.
- `last-week` → the Monday through the Sunday of the previous week.

## 2. Gather the source logs

List `daily-logs/*.md` (filenames are `YYYY-MM-DD-convo.md`, so the date range is a filename comparison) and select the ones falling in the resolved range. If the folder doesn't exist or nothing falls in range, tell the user plainly ("no daily logs found for `<range>`") and stop — do not fabricate an update from memory or guesswork.

Read each matching log in full.

## 3. Draft the update

Synthesize a team-facing summary — this is not a copy-paste of the daily logs (those are personal session records; this is what a teammate skimming `team-updates/` should know). Condense to:

- **What shipped** — concrete, finished work.
- **In progress** — anything partial worth flagging.
- **Blockers / needs input** — only if real ones exist.
- **Notable decisions** — only if any were made.

Skip any section with nothing to report; don't pad. Keep it operational and skimmable, not a narrative retelling.

**Show the draft to the user and ask them to confirm or edit it before continuing.** Do not skip this — an auto-generated summary going into a shared, reviewed folder needs the author's sign-off before anyone else sees it. Only proceed to step 4 once they've confirmed.

## 4. Open the PR

Once confirmed:

1. Determine the author's identifier: `git config user.name`, falling back to `gh api user --jq .login` if unset. Slugify it (lowercase, spaces to hyphens) for use in filenames/branch names.
2. Build a filename: `team-updates/<author-slug>-<range-label>.md`, where `<range-label>` is the single date for `today`, or `week-of-<monday-date>` for `this-week`/`last-week`. If that file already exists, append `-v2`, `-v3`, etc. — never overwrite.
3. Create and check out a new branch: `team-update/<author-slug>-<range-label>`.
4. Write the confirmed draft to that file, with a one-line header noting the author and the date range covered.
5. `git add` the new file, commit (message: `Team update: <author> — <range-label>`), and push the branch to `origin` with `-u`.
6. Open a PR with `gh pr create --title "Team update: <author> — <range-label>" --body "<short note that this is an auto-generated summary from daily-logs, awaiting review>" --fill=false` (let it target the repo's default branch; don't pass `--base` unless the default branch lookup fails).
7. Report the PR URL back to the user as the final output. Do not merge it yourself — that's the admin's call.

## Notes

- This command never pushes to `main` and never merges anything itself — it only ever creates a branch and a PR.
- If `git` or `gh` operations fail (no remote, not authenticated, nothing to commit), surface the actual error to the user rather than retrying silently or guessing a fix.
- If the current directory isn't a git repo, or has no `origin` remote, say so and stop before attempting any git operations.

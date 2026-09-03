You are generating an end-of-session daily log for a team-os repo, automatically — no user is available to answer questions. You are given the full session transcript (JSONL) below.

Produce ONLY the markdown content of the daily log file. No preamble, no code fences, no commentary before or after, and do NOT use any tools — just output the markdown. It will be written directly to `daily-logs/<date>-convo.md`.

Infer everything from the transcript. Use this exact structure:

# Session Log — <use the date given in the context line>

## Session Summary
High-level overview of what happened this session.

## What Got Done
Work completed, classified ✅ Done / 🔄 Partial / ⏭️ Deferred.

## New Commitments
Action items or follow-ups surfaced, each tagged with the project or workstream it belongs to (infer from the transcript's own context — repo name, mentioned projects — or tag as "general" if unclear). You cannot edit project files here — just record them.

## Decisions
Decisions made, or still open.

## Roll-Forward for Tomorrow
- What slipped and why
- Top 3 priorities for tomorrow
- Prep needed

## Project Updates
Updates grouped by project.

## New Ideas
Notable concepts or workflows discussed.

## Risks / Open Questions
Unresolved items or blockers.

## Commands or Systems Created
Commands, automations, or files created/updated.

## Important Context for Future Sessions
Anything the next session should know.

Rules:
- If this repo is an Obsidian vault (or similar wikilink-aware tool), use wikilinks for stable entities mentioned in the log (projects, recurring concepts) — infer their names from the transcript, don't invent ones you didn't see referenced. Otherwise use plain text names.
- Be concise and operational. If the session was trivial, keep it short — never invent work that didn't happen.
- End with a one-paragraph executive summary and the single most important thing to pick up next session.

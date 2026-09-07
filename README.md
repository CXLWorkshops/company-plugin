# Company Plugin

The shared Claude Code plugin for CXLWorkshops — the "how we work" layer that every `<team>-os` repo installs, so teams get the same baseline capabilities without copying files into every repo.

Part of the [Company OS](https://github.com/CXLWorkshops/company-os) setup. This repo self-hosts as its own marketplace, so it can be installed directly.

## What's bundled

**Agents and skills are currently empty placeholders** (`agents/.gitkeep`, `skills/.gitkeep`) — this plugin ships frameworks and hooks only for now. Add agent/skill files to those folders and they'll be picked up automatically (no manifest changes needed); see [Contributing changes](#contributing-changes).

**Frameworks** (reference playbooks at `${CLAUDE_PLUGIN_ROOT}/frameworks/`, readable directly or referenced by any agent/skill added later — see [frameworks/README.md](frameworks/README.md) for the full list and sourcing; three of the five are operational distillations of CXL Institute courses, credited in each file's frontmatter):

- `geo-optimization-best-practices.md`, `seo-geo-revamp-frameworks.md` — GEO/AEO optimization and large-site SEO revamp
- `content-recycling-best-practices.md`, `content-repurposing-frameworks.md` — repurposing and topic-arc planning
- `b2b-content-funnels-with-ai-best-practices.md` — conversion copy, content quality checklist, AI-phrasing blocklist

**Hooks** (automatic, no invocation needed once installed):

| Hook | Event | What it does |
|---|---|---|
| `load-recent-logs.sh` | SessionStart | Loads the 2 most recent `daily-logs/*.md` files into context, so every session starts with continuity |
| `catch-up-logs.sh` + `catch-up-logs-run.sh` | SessionStart | Backfills any missing daily logs from transcripts on disk (covers sessions that ended uncleanly — closed terminal, crash, sleep) |
| `auto-shutdown.sh` + `auto-shutdown-run.sh` | SessionEnd | Summarizes the session transcript via a headless `claude -p` call and writes/overwrites `daily-logs/<date>-convo.md`, detached so closing the session isn't blocked |

**Requirements for the hooks to work:** `jq` and the `claude` CLI must be on `PATH` for whoever's running the session (both are standard for anyone using Claude Code already). No configuration needed beyond installing the plugin — the hooks fire automatically in any repo that has it installed, writing into that repo's own `daily-logs/` folder. Customize the summary structure by editing `hooks/auto-shutdown-prompt.md` in this repo.

**Commands:**

| Command | What it does |
|---|---|
| `/team-update today` \| `this-week` \| `last-week` | Reads your `daily-logs/` for that range, drafts a team-facing summary, shows it to you for confirmation, then opens a PR adding it to `team-updates/` — it never pushes to `main` or merges on its own. |

`/team-update` requires the org/repo settings below to actually enforce "an admin has to approve it" — on its own it only opens a PR; without branch protection, someone could still push directly to `main` around it.

## Adding agents/skills later

Drop a `.md` agent file into `agents/`, or a `<skill-name>/SKILL.md` into `skills/`, and it's auto-discovered — no manifest edit needed (`plugin.json` doesn't hardcode paths to them). If you're rebuilding a multi-client content system like the one this plugin previously carried, the convention worth keeping: resolve a **client** from the request, ground each agent/skill in that client's `wiki/<Client>/tone-of-voice.md` plus example folders inside the installing repo, and have it stop and offer to scaffold the client folder if that file's missing rather than defaulting to one client's voice for another. Reference `${CLAUDE_PLUGIN_ROOT}/frameworks/` for the bundled playbooks — that path resolves correctly regardless of where the plugin is installed from.

## Org/repo settings to make `/team-update` mean what it says

The command itself only ever opens a PR — the "admin has to approve it" part is enforced by GitHub settings, not by the command. Per `<team>-os` repo:

1. **Auto-delete branches after merge** (keeps the repo tidy — no pile of stale `team-update/*` branches):
   ```
   gh repo edit CXLWorkshops/<team>-os --delete-branch-on-merge
   ```
2. **Require PR review before merging to `main`:**
   ```
   gh api repos/CXLWorkshops/<team>-os/branches/main/protection -X PUT \
     -f required_pull_request_reviews.required_approving_review_count=1 \
     -f enforce_admins=true
   ```
   `enforce_admins=true` makes the rule apply even to org owners — without it, admins can bypass their own review requirement.
3. **(Optional, sharper) Restrict who counts as a reviewer** to a specific admin group rather than "any collaborator," via a `CODEOWNERS` file at the repo root:
   ```
   team-updates/* @CXLWorkshops/<team>-admins
   ```
   plus `required_pull_request_reviews.require_code_owner_reviews=true` in the same API call above. This needs a GitHub Team to exist first:
   ```
   gh api orgs/CXLWorkshops/teams -f name='<team>-admins' -f privacy='closed'
   gh api orgs/CXLWorkshops/teams/<team>-admins/memberships/<github-username> -X PUT -f role=member
   ```

Without step 2, `/team-update` still works exactly as designed (drafts, confirms, opens a PR) — it just means anyone with write access *could* merge their own PR immediately, or push to `main` directly, bypassing review. Step 2 is what actually makes "admin approval" real rather than a convention.

## Installing this plugin into a team-os repo

From inside a `<team>-os` repo, in Claude Code:

```
/plugin marketplace add CXLWorkshops/company-plugin
/plugin install company-plugin@company-plugin
```

## Contributing changes

This repo is read-only for day-to-day team use — it's the shared baseline, not a place to freelance. If a team develops an agent, skill, or command locally that would benefit everyone, open a PR here. Once approved by a repo admin, it ships to every team on their next `/plugin update`.

## Versioning

Bump `version` in `.claude-plugin/plugin.json` (semver) on any change that alters agent/skill behavior, so teams can tell what changed between updates.

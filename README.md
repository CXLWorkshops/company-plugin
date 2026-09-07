# Company Plugin

The shared Claude Code plugin for CXLWorkshops — the "how we work" layer that every `<team>-os` repo installs, so teams get the same baseline capabilities without copying files into every repo.

Part of the [Company OS](https://github.com/CXLWorkshops/company-os) setup. This repo self-hosts as its own marketplace, so it can be installed directly.

## What's bundled

Adapted from an existing multi-client content system (originally built in a personal Obsidian vault, generalized here to work in any `<team>-os` repo).

**Agents:**

| Agent | Job |
|---|---|
| `copywriter` | Write new content in a resolved client's voice: newsletters, LinkedIn posts/carousels, blog posts, webinar landing pages |
| `blog-update` | Revamp existing blog posts: fix outdated info, then optimize for AEO/GEO (LLM answer-engine citations) |
| `qa-reviewer` | Last gate before publish — fact-checks drafts via web search, checks tone-of-voice compliance, checks reference conventions |

**Skills** (invoked by the agents above, or standalone):

- `write-newsletter`, `write-linkedin`, `write-blog`, `write-webinar-landing` — format-specific writing
- `content-freshness` — audit and fix outdated claims in a post
- `aeo-geo-optimization` — restructure a post so LLMs can extract and cite it
- `qa-draft` — the three-gate QA checklist the `qa-reviewer` agent runs

**Frameworks** (reference playbooks the agents/skills above read at `${CLAUDE_PLUGIN_ROOT}/frameworks/`, see [frameworks/README.md](frameworks/README.md) for the full list and sourcing — three of the five are operational distillations of CXL Institute courses, credited in each file's frontmatter):

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

## How it works: multi-client by design

Every agent/skill here resolves a **client** from the request (e.g. "write a blog for company Y"), defaulting to **CXL** when unnamed, and grounds everything in that client's `wiki/<Client>/` folder inside the installing repo:

```
<team>-os/
└── wiki/
    └── <Client>/
        ├── tone-of-voice.md              ← required: the voice contract
        ├── Newsletter examples/
        ├── Linkedin captions examples/
        ├── Carousel examples/
        ├── Blog Examples/
        └── Webinar landing page copy examples/
```

If a client's `tone-of-voice.md` is missing, the agents stop and offer to scaffold it rather than falling back to CXL's voice. Onboarding a new client is just creating its `wiki/<Client>/` folder — the plugin picks it up automatically. Example folders are optional calibration aids; the skills degrade gracefully (and say so) when they're missing. The `frameworks/` playbooks above are bundled with the plugin itself (not per-client), so they're always present regardless of which client a draft is for.

All drafts save to `drafts/` in the installing repo. Sources are never overwritten.

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

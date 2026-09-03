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
        ├── Webinar landing page copy examples/
        └── frameworks/                    ← optional: deeper playbooks (GEO, content recycling, etc.)
```

If a client's `tone-of-voice.md` is missing, the agents stop and offer to scaffold it rather than falling back to CXL's voice. Onboarding a new client is just creating its `wiki/<Client>/` folder — the plugin picks it up automatically. Example folders and `frameworks/` notes are optional calibration aids; the skills degrade gracefully (and say so) when they're missing.

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

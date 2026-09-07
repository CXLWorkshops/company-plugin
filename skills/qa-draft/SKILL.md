---
name: qa-draft
description: "QA a draft before it ships: verify every factual claim with web search (catch hallucinations and inaccurate data), check tone-of-voice compliance against the client's voice contract (default client: CXL), and check repo reference/link conventions. Use this whenever the user asks to QA, fact-check, review, verify, or sanity-check a draft, or before publishing anything from drafts/, even if they only give a file path."
---

# QA Draft

Quality-check a draft produced in this repo (usually by the copywriter or blog-update agents) before it ships. Three gates, in order: **facts**, **voice**, **references**. The draft passes only when all three do.

The failure this skill exists to catch: a confident, plausible, wrong claim in the client's voice. A hallucinated stat that ships damages exactly the trust the content system is built on.

## Before checking

1. Read the draft (repo file path, or pasted content), and resolve which client it was written for: the request, the draft's footer links, or its parent project usually say; default to CXL, and state which client you resolved.
2. Read that client's voice contract: `wiki/<Client>/tone-of-voice.md`. It is the contract; the anti-examples define the failure modes. If the client has no tone-of-voice file, Gate 2 can only check generic quality rules; say so in the report and recommend scaffolding the client folder.
3. Identify the format (newsletter, LinkedIn, blog, webinar landing) and skim the matching skill for its structure rules (e.g. write-newsletter's subject-line and "What this means for you" requirements). Format rules are part of QA.
4. If the draft was synthesized from source material in the repo (research dumps, transcripts, datasets), locate the sources so claims can be checked against them.

## Gate 1: Facts (hallucination and accuracy check)

Extract every checkable claim, then verify. **Every verdict needs evidence found during this QA pass, never memory.** A claim you "know" is true still gets searched; the model's memory is exactly where hallucinations come from.

Check, in priority order:

1. **Statistics, numbers, benchmarks.** Web-search each one. Verify the number, the unit, the population, and the date. A real stat attached to the wrong year or source is still a fail.
2. **Attributed claims** ("according to X", "a Y study found"). Confirm the source exists and actually says that. Misattribution is a hallucination even when the fact is true.
3. **Tool, product, and platform claims** (features, pricing, availability, behavior). Verify each is currently true, not just formerly true.
4. **Claims sourced from repo material.** Diff them against the source file. Flag anything the draft states more strongly than the source supports (scope inflation is the subtle hallucination).
5. **Internal consistency.** Numbers used twice must match; the subject line's claim must be supported by the body.
6. **Links.** Fetch outbound links that carry evidence weight; flag dead ones and ones whose target doesn't support the claim.

Verdicts per claim: **verified** (with source link) / **inaccurate** (with the correct fact and source) / **unverifiable** (conflicting or no sources; the claim must be cut or flagged `[TODO]`, never shipped as-is).

## Gate 2: Tone of voice

Check against the client's tone-of-voice file mechanically, then holistically. The rules below are CXL's; for another client, apply the equivalents from their voice contract:

- **Hard rules:** no em dashes anywhere; no banned words (leverage as a verb, game-changing, revolutionary, disruptive, synergy, seamless/frictionless without specifics, ninja/guru/rockstar, best-in-class without evidence).
- **AI-typical phrasing** (applies to every client, on top of their banned words): flag generic AI tells per `${CLAUDE_PLUGIN_ROOT}/frameworks/b2b-content-funnels-with-ai-best-practices.md` §9 — "unlock the secrets", "unleash the power", "gone are the days", "digital realm", "ever-changing", "game-changer", "in a world", "treasure trove", "furthermore" — and prose so consensus-generic the reader could have prompted it themselves.
- **Structure rules for the format:** one idea, one CTA; conclusion delivered early, never withheld for engagement; subject line states a finding, not a topic (email formats); "Key insights" follows data; a "What this means for you" style section converts findings to action (newsletter).
- **Calibration:** claims are de-escalated, limits are stated ("where it still falls short"), no hype even about the client's own topics.
- **Holistic:** read one section against the anti-examples in the client's tone-of-voice note. If it could pass for the ❌ examples, it fails regardless of rule compliance.

## Gate 3: References

- Stable entities mentioned in the draft (the client's projects, programs, frameworks, recurring concepts) are linked — wikilinked if this repo is an Obsidian vault, plain relative links otherwise.
- Publish-bound drafts have a footer linking the parent project and the client's tone-of-voice note, with a "strip links before publishing" note.
- Generic words are **not** linked; over-linking is a fail too.

## Output

**Report first, fix on confirmation.** Never edit the draft silently.

Save the report to `drafts/` as `qa-<draft-slug>.md` (version suffix if it exists; never overwrite), linking the draft under review. Structure:

1. **Verdict line at the top:** SHIP / FIX FIRST / DO NOT SHIP, with a one-sentence reason.
2. **Facts table:** every claim checked, verdict, correct fact if inaccurate, source link. Include passes, so the user knows what was checked.
3. **Voice findings:** each violation quoted with a suggested rewrite.
4. **Reference findings:** missing links, over-links, missing footer.
5. **Proposed fix list:** numbered, so the user can approve all or by number.

On confirmation, apply approved fixes to the draft directly (this is the one case where editing another agent's draft is allowed), and note in the QA report which fixes were applied.

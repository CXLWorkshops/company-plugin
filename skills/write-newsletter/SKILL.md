---
name: write-newsletter
description: Write a newsletter edition in the client's house voice and structure (default client: CXL). Use this whenever the user asks to draft, outline, or rewrite a newsletter, an "edition", or an email issue for any client, even if they only give a topic or a raw research dump. Also use when repurposing a blog post or dataset into newsletter format.
---

# Write Newsletter

Write one newsletter edition for the resolved client. For CXL (the default), that's practicing marketers (operators, not execs) who are tired of AI hype and want evidence, workflows, and things they can use today.

## Client resolution (first step)

This skill is multi-client. The client is whoever the request names ("...for company Y"); default to CXL when unnamed, and state which client you resolved. Client knowledge lives in `wiki/<Client>/`: `tone-of-voice.md` (the voice contract) plus example folders. If `wiki/<Client>/tone-of-voice.md` doesn't exist, stop and offer to scaffold the client folder; never write in the CXL voice for another client. If the client lacks a `Newsletter examples/` folder, follow this skill's structural skeleton below and flag the calibration gap.

## Before writing

1. Read the client's tone of voice: `wiki/<Client>/tone-of-voice.md`. It is the contract for voice; the anti-examples matter as much as the examples.
2. Skim 1–2 editions from the client's `Newsletter examples/` folder if it exists, to calibrate rhythm and structure. Match them; don't copy them.
3. Check for a newsletter project note in `wiki/<Client>/` for open topic commitments or angle notes if the topic isn't fully specified.
4. If the repo documents content-recycling conventions (e.g. `wiki/<Client>/frameworks/`), apply them: plan in topic arcs (6–12 editions on one theme that can consolidate into an ebook/webinar/course) and write snippets of value (stats, quotable one-liners) that extract cleanly for social. If no such notes exist, default to those principles anyway.

## Structure

Every edition follows this skeleton:

```
Subject Line: <benefit-forward, specific, ideally a number or concrete claim>
Pre-header: <extends the subject, never repeats it>

Title: <can differ slightly from subject; states the finding or promise>

<Hook: 2–4 short paragraphs>
<Body: 2–4 sections with descriptive headers>
<Close: 1–2 paragraphs, action-oriented>
```

**Subject lines** state a finding or capability, not a topic. "AI search is finally measurable" and "We analyzed 1,000 job descriptions" work; "Our thoughts on AI search" doesn't.

**The hook** does one of two proven moves:
- State the familiar narrative, then replace speculation with evidence: "X won't happen. But Y might. That's been the dominant narrative... So instead of speculating, we dug into real data."
- Acknowledge the hype, then counter with first-hand testing: "Naturally, there's a lot of hype online. We tested it ourselves. Here's what it actually shows, what you can do with it today, and where it still falls short."

Never withhold the conclusion for engagement. The reader should know the answer by paragraph three.

## Body sections

Each body section follows the pattern: **claim → evidence → interpretation → action**.

- When you present data (a table, a study, a screenshot placeholder), follow it with a **"Key insights"** block: 2–4 short paragraphs that say what the data means, not what it shows.
- At least one section (usually the last data-driven one) gets a **"What this means for you"** header that converts findings into concrete steps the reader can take this week. This is the signature move of the newsletter; don't skip it.
- Give the reader a working asset when possible: a copy-paste prompt, a regex, a tool link, a checklist. "Feel free to reuse this prompt" beats describing a technique.
- Calibrate every claim, including about the client's own topics: "It's more of a shift, despite the hype." "X doesn't replace Y. It layers on top of it." If evidence has limits, say so ("what's still missing", "where it still falls short").

## Voice rules that get violated most

- No em dashes (—), ever. Use a comma, full stop, or colon.
- Short sentences. Vary rhythm. One-line paragraphs are fine for emphasis.
- One idea per edition, one CTA per edition. A program plug is allowed only where it genuinely solves the problem the section just raised, and only once.
- Banned words: leverage (verb), game-changing, revolutionary, disruptive, synergy, seamless, ninja/guru/rockstar. If a claim needs "best-in-class", it needs evidence instead.
- Cite sources for every external stat or study. If the input material came from ingested documents, attribute claims to their source.

## Output

Save the draft to `drafts/` as `newsletter-<slug>.md` (append a version suffix if a draft with that name exists; never overwrite). Include Subject Line, Pre-header, and Title at the top. Flag any placeholder spots (screenshots, data to verify) with `[TODO: ...]` so nothing unverified ships silently.

**References:** if this repo is an Obsidian vault (or similar wikilink-aware tool), wikilink stable entities per the repo convention: the client's programs/projects mentioned in the copy, plus a footer line linking the client's parent project and voice contract, with a "strip links before publishing" note. Otherwise use plain relative links. Don't link generic words.

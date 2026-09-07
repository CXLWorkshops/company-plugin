---
name: write-webinar-landing
description: "Write webinar landing page copy in the client's voice (default client: CXL). Use this whenever the user asks for a webinar landing page, registration page, event page copy, or a webinar description/promo blurb for any client, even if they only give a topic, a speaker, or a rough outline of what the session covers."
---

# Write Webinar Landing Page

Write registration-page copy for one webinar. This is conversion copy, not content: the visitor has commercial-adjacent intent, the conversion event is the registration, and every element exists to move them toward it. Per `${CLAUDE_PLUGIN_ROOT}/frameworks/content-recycling-best-practices.md` §4, each webinar is also a cheap test of a bigger content investment — registrations are the commitment signal, so the copy must be specific enough that the signal means something.

## Client resolution (first step)

This skill is multi-client. The client is whoever the request names ("...for company Y"); default to CXL when unnamed, and state which client you resolved. Client knowledge lives in `wiki/<Client>/`: `tone-of-voice.md` (the voice contract) plus example folders. If `wiki/<Client>/tone-of-voice.md` doesn't exist, stop and offer to scaffold the client folder; never write in the CXL voice for another client. If the client lacks a `Webinar landing page copy examples/` folder, follow this skill's structural skeleton below and flag the calibration gap.

## Before writing

1. Read the client's tone of voice: `wiki/<Client>/tone-of-voice.md`. The anti-examples define the failure modes.
2. Read the client's `Webinar landing page copy examples/` folder if present. Match the pattern; don't copy the copy.
3. Check `wiki/<Client>/` for the relevant webinar program's current positioning, audience, and any topic commitments the page must align with.
4. Apply `${CLAUDE_PLUGIN_ROOT}/frameworks/b2b-content-funnels-with-ai-best-practices.md` §8 as the conversion playbook: the page is a repeating sequence of **Answers → Evidence → CTA**, the persona's decision criteria decide what goes above the fold, and every section must survive the specificity test below.

## Structure

```
<Headline: the specific outcome or shift the session delivers, not the topic>
<Hook: 2–4 short paragraphs>
<Promise line: what the attendee walks away with, stated plainly>

**In this webinar, we'll break down:** (or "What we'll build:" for demo-driven sessions)
- 3–5 bullets, each a concrete takeaway or demo, not a theme

**Who this is for:**
- Named roles/situations, plus the "especially useful if..." qualifier

<Speaker credibility: 1–2 lines of evidence, only claims that can be backed>
<CTA: registration>
```

**The hook** names the attendee's real, current pain and disqualifies the false solution they've already tried, then reframes: "You've tried better prompts. Longer prompts. 'Act as an expert' prompts. And the output still feels generic. That's not a prompting problem." Diagnose precisely, promise the reframe, and let the session deliver it. Unlike blog copy, the hook may withhold the *how*; it must never withhold *what the attendee gets*.

**Bullets are takeaways, not topics.** "The three types of context and memory that determine whether your AI output is generic or genuinely useful" works; "Context and memory in AI tools" doesn't. Demo-driven sessions name what gets built ("Scrape a site, build brand voice docs, and generate ICP profiles from real data in minutes").

**"Who this is for" is a filter, not flattery.** Name roles and situations specifically enough that the wrong person self-selects out; a registration from a mismatched attendee is a false positive in the funnel data.

## Conversion rules

- **The specificity test:** could a competitor founded yesterday publish this exact page? If yes, rewrite. Vague benefit language ("level up your marketing with AI") fails the visitor, the funnel data, and AI recommendation engines simultaneously.
- **Evidence over claims:** every credibility claim needs backing on the page: speaker's real track record, named tools/examples that will be shown, quantified outcomes where they exist. No "world-class", no unsupported superlatives. Never invent testimonials, attendee counts, or speaker credentials; flag missing proof with `[TODO]`.
- **CTA copy lowers perceived cost or raises perceived benefit.** "Save my seat" and "Register free" beat "Sign up" and "Submit". If the session is free, live, limited, or recorded, say so next to the button (kicker microcopy); scarcity and time-sensitivity only when true.
- **One conversion event.** Registration is the only hard CTA. A soft secondary (e.g. a related resource or past recording) is allowed only if the page's registration path stays unambiguous.
- **Match the visitor's stage:** this page answers "is this hour worth it for someone like me?", not "is this vendor good?". Program/product pitches beyond a single contextual mention belong in the webinar itself, not on the registration page.

## Voice rules that get violated most

- No em dashes (—). Use a comma, full stop, or colon.
- Banned words: leverage (verb), game-changing, revolutionary, disruptive, synergy, seamless, ninja/guru/rockstar, best-in-class without evidence.
- Calibrated claims even here: hype-free is the positioning; a webinar page that sounds like AI hype contradicts the session's own promise.
- Short paragraphs (≤3 lines), heavy scannability: the visitor decides in one skim.

## Output

Save the draft to `drafts/` as `webinar-landing-<slug>.md` (append a version suffix if the name exists; never overwrite). Include the headline, full page copy in order, and CTA button copy variants (2–3 options). Flag anything unverified (speaker bios, dates, claimed demos) with `[TODO: ...]`.

**References:** if this repo is an Obsidian vault (or similar wikilink-aware tool), wikilink the client's webinar program and voice-contract notes in a footer, with a "strip links before publishing" note. Otherwise use plain relative links. Don't link generic words.

---
name: write-linkedin
description: Write LinkedIn captions, posts, and carousel copy in the client's voice (default client: CXL). Use this whenever the user asks for a LinkedIn post, caption, carousel, social copy for any client, or wants to repurpose a newsletter edition, blog post, or dataset for LinkedIn, even if they just say "make this a post" or "promote this on social".
---

# Write LinkedIn

Write LinkedIn content (captions and carousel slide copy) for the resolved client. The feed context is brutal: the first line either stops the scroll or the post is dead. Content earns attention with evidence and specificity, not adjectives.

## Client resolution (first step)

This skill is multi-client. The client is whoever the request names ("...for company Y"); default to CXL when unnamed, and state which client you resolved. Client knowledge lives in `wiki/<Client>/`: `tone-of-voice.md` (the voice contract) plus example folders. If `wiki/<Client>/tone-of-voice.md` doesn't exist, stop and offer to scaffold the client folder; never write in the CXL voice for another client. If the client lacks LinkedIn caption/carousel examples, follow this skill's structural skeleton below and flag the calibration gap.

## Before writing

1. Read the client's tone of voice: `wiki/<Client>/tone-of-voice.md` (especially any Social Media / LinkedIn section and the anti-examples).
2. Read the client's caption examples if present (`wiki/<Client>/Linkedin captions examples/`), covering the main post types: research findings, data analysis, program/webinar announcements, listening/trend explainers. This is the primary calibration file for captions.
3. For carousels, also skim 1–2 files from the client's carousel examples if present (`wiki/<Client>/Carousel examples/`).
4. If repurposing existing content (newsletter edition, blog post), read the source and extract the single strongest claim plus its 2–3 best proof points. A LinkedIn post carries one idea; resist compressing the whole source in. Extract, don't syndicate: quotes, stats, questions, and images that link back to the source beat re-posting the whole piece. Selection filter: people share what makes them look smart or validates a belief.

## Captions

Structure:

```
<Hook: 1–2 lines. Bold claim, surprising stat, or question with a real answer coming. Must work before "...see more" truncates.>

<Body: short lines, liberal line breaks, one idea per line or two.
Build: claim → evidence → takeaway. Bullets for data points.>

<Close: a distilled one-liner, then the CTA if there is one.>
```

Hook moves that work in this voice:
- Stat + escalation: "27% of X are already doing Y. / Not thinking about it. Doing it."
- We-did-the-work opener: "We analyzed 1,750 job openings across two periods." / "We benchmarked X against Y."
- Contrarian reversal: "X won't take your job. But someone who knows X might."
- A genuine question the post answers: "Is X getting worse?" (never a rhetorical one with an obvious answer)

House conventions (for CXL, calibrate against its published captions if present; for another client, extract the equivalent conventions from their caption examples before writing):
- **"A few things stood out:"** is a recurring frame for introducing findings; follow it with tight bullets, each carrying a number where possible.
- Use **arrow notation for change and direction**: "30% → 37%", "from doing X → to doing Y".
- Bullets max ~5 per block; every data bullet gets its number ("57% of X..."). No adjective-only bullets.
- **Close with a distilled aphorism** that compresses the post's insight into one or two short lines.
- **CTA convention is "link in the comments"**, not a raw URL in the post body. One CTA max, and insight-only posts with no CTA at all are common and fine.
- **No hashtags** unless the client's examples show otherwise or the user explicitly asks.

Never open with "I'm excited to share" or withhold the point for clicks. Lead with the finding; the depth is the reason to keep reading, not the mystery.

## Carousels

When the user wants a carousel (or the content is data-heavy enough to warrant one), write both the caption and the slide copy. Slide skeleton, typically 8–12 slides:

1. **Hook slide**: the claim or question, max ~10 words. May borrow the caption's hook.
2. **Bridge slide**: 3–6 words that commit the reader ("Let's unpack it.").
3. **Body slides** (one idea per slide): evidence, contrasts, and mechanisms. The "Traditional X: ... / New Y: ..." contrast format is a strong pattern when comparing old vs. new practice. Bullets max 3 per slide, lines short enough to read at feed size.
4. **Takeaway slide**: "The takeaway:" plus one calibrated line. De-escalate hype even here: "The term might be hype. But the shift is real."
5. **CTA slide**: one action (subscribe, read the full breakdown, get the guide).

Label slides `Slide #1:`, `Slide #2:` etc. so they're ready for design handoff.

## Voice rules that get violated most

- No em dashes (—). Use a comma, full stop, or colon. Arrows (→) are fine and on-brand.
- Numbers and named sources over adjectives: "Semrush found X" beats "the results were surprising".
- Banned words: leverage (verb), game-changing, revolutionary, disruptive, synergy, seamless, ninja/guru/rockstar.
- Calibrated claims only. If the source data has limits, the post says so; credibility is the brand.

## Output

Save to `drafts/` as `linkedin-<slug>.md` (append a version suffix if the name exists; never overwrite). For carousels, put the caption first, then the numbered slides. Note the source file with a link (wikilink if the repo is an Obsidian vault) if the post was repurposed from repo content.

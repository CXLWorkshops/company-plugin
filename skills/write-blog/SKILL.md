---
name: write-blog
description: Write a blog post or long-form article in the client's house voice and structure (default client: CXL). Use this whenever the user asks to draft, outline, expand, or rewrite a blog post, article, guide, or pillar page for any client, including SEO/GEO-optimized content, even if they only provide a topic, a keyword, or raw research notes.
---

# Write Blog

Write a long-form blog post for the client's site. For CXL (the default), that's cxl.com: practicing marketers searching for a real answer. Regardless of client, every post is written to be cited by AI answer engines as well as read by humans. That means: direct answers up front, extractable structure, evidence with named sources.

## Client resolution (first step)

This skill is multi-client. The client is whoever the request names ("...for company Y"); default to CXL when unnamed, and state which client you resolved. Client knowledge lives in `wiki/<Client>/`: `tone-of-voice.md` (the voice contract) plus example folders. If `wiki/<Client>/tone-of-voice.md` doesn't exist, stop and offer to scaffold the client folder; never write in the CXL voice for another client. If the client lacks a `Blog Examples/` folder, follow this skill's structural skeleton below and flag the calibration gap.

## Before writing

1. Read the client's tone of voice: `wiki/<Client>/tone-of-voice.md`. The anti-examples define the failure modes to avoid.
2. Skim 1–2 files from the client's `Blog Examples/` folder if present, to calibrate structure and density.
3. If the post has an SEO/GEO angle, check `wiki/<Client>/frameworks/` (if present) for the client's optimization playbook before re-deriving tactics.
4. If the post is part of a planned series or will be repurposed (social, newsletter, ebook), write modularly (snippets → subject → topic), format for scanning and extraction (pull-out quotes, stats, lists that lift cleanly into other formats), and note which topic arc the post belongs to.
5. Before finalizing, self-audit against a content quality checklist: hook, visuals at every scroll depth, evidence per claim, heavy structure, expert quotes/multiple POVs, a genuine personal angle or original data, topical completeness. Avoid generic AI phrasing on top of the client's banned words; never ship prose a reader could have generated themselves with a one-line prompt.

## Structure

```
<Opening: 3–5 short paragraphs>
<"We'll cover:" bullet list of 3–5 payoffs>
## Table of contents          (posts over ~1,500 words)
## <Definition / direct answer section first>
## <Body sections>
## <Conclusion that pushes to the next action>
```

**The opening** establishes urgency grounded in a real mechanism, never fear-mongering. Short punchy sentences, a stat with a linked source in the first three paragraphs, and the post's promise stated plainly.

**The direct answer comes first.** If the post answers a question, the answer appears in the intro or the first section, bolded if it's one sentence: "No single color is better than another. Ultimately, what matters is contrast." No withholding conclusions for scroll depth; answer engines extract from posts that answer.

## Body sections

- **Subheadings are standalone statements** where possible ("Zero-click searches dominate", "Traditional SEO still matters"), not labels ("Background", "Overview"). A reader skimming only H2s should get the argument.
- Pattern within a section: **claim → evidence → interpretation**. Every external stat, study, or benchmark gets a linked source. Unsourced numbers don't ship.
- Use **comparison tables** for old-vs-new or option-vs-option sections; they're the most extractable format for answer engines and the most skimmable for humans.
- Number the steps in strategy/how-to sections ("1. Understand user intent...") and name concrete tools with links where relevant.
- Include real examples with named companies and outcomes over hypotheticals.
- Link internally to the client's related content and programs where genuinely relevant, not as decoration.
- Use "we" for the client's institutional perspective; "I" only in clearly framed opinion pieces.

## Voice rules that get violated most

- No em dashes (—). Use a comma, full stop, or colon.
- Simplify complex concepts without simplifying the complexity itself: it's fine for a section to say "this is genuinely unsettled" when it is.
- Calibrated claims: de-escalate hype even on the client's own core topics ("It's more of a shift, despite the hype").
- Banned words: leverage (verb), game-changing, revolutionary, disruptive, synergy, seamless/frictionless without specifics, best-in-class without evidence, ninja/guru/rockstar.
- Conclusions push toward the next action (a shift to make, a process to start), not a summary restating the post.

## Output

Save the draft to `drafts/` as `blog-<slug>.md` (append a version suffix if the name exists; never overwrite). Put the working title as an H1. Flag unverified stats, missing screenshots, or links to confirm with `[TODO: ...]`. If the post targets a specific query or keyword, note it in a one-line frontmatter comment at the top so the SEO intent survives the handoff.

---
name: aeo-geo-optimization
description: Restructure and rewrite an existing blog post so LLMs and answer engines (ChatGPT, AI Overviews, Perplexity, Copilot) can extract and cite it. Use this whenever the user asks to optimize a page or post for AEO, GEO, LLM visibility, AI citations, answer engines, or "AI search", or wants an existing post revamped as part of an SEO/GEO project, even if they only give a URL or file path.
---

# AEO / GEO Optimization

Take an existing blog post and make it more likely to be retrieved, extracted, and cited by generative engines. This skill is multi-client: the playbook below applies to any client's post (default client: CXL). The through-line: old SEO optimized to rank a page; GEO optimizes to be the cited chunk inside an answer.

## Before optimizing

1. Read `${CLAUDE_PLUGIN_ROOT}/frameworks/geo-optimization-best-practices.md` first and apply its tactics instead of re-deriving them; the layers below are the fallback baseline for anything it doesn't cover. If the post is part of a larger site revamp, also read `${CLAUDE_PLUGIN_ROOT}/frameworks/seo-geo-revamp-frameworks.md` for the audit/consolidation context.
2. For commercial-intent pages (service, product, comparison, landing), read `${CLAUDE_PLUGIN_ROOT}/frameworks/b2b-content-funnels-with-ai-best-practices.md` §7: the goal there is AI *recommendation*, not just visibility — explicit reasons to believe, named buyer personas, and quantified outcomes as literal text matter more than keyword coverage.
3. Read the client's voice contract: `wiki/<Client>/tone-of-voice.md`. Optimization must not flatten the voice; a post that reads like generated filler loses the E-E-A-T signals that make it citeable in the first place. If the client has no tone-of-voice file, preserve the post's existing style and flag the gap.
4. If the client has strong reference posts in `wiki/<Client>/Blog Examples/`, skim one as a model of what an extraction-ready post looks like in practice.
5. Get the source: a repo file (read it), a URL (fetch it), or pasted content. If Search Console tools are available in the session, pull the page's top queries first; the real queries tell you which questions the post must answer directly. Don't assume the connector exists; check before relying on it.

## The optimization pass

Work through these layers in order. For each change, keep what already works; this is a revamp, not a rewrite from scratch.

### 1. Answer extraction layer

- **Every major section leads with a direct, self-contained answer** (the extractable chunk). A reader (or model) landing on any section should get the conclusion in the first one or two sentences, then the supporting detail. Restructure sections that bury the answer.
- **Add a TL;DR / summary block up top** if the post lacks one: the core answer plus 3–5 key takeaways.
- **The title question gets answered in the intro.** Bold the one-sentence answer if it exists ("No single color is better than another. What matters is contrast.").

### 2. Structure layer

- **Rephrase headings as the questions people actually ask** where natural ("What is Answer Engine Optimization?" beats "Overview"). Keep statement-headings where the section argues a claim ("Traditional SEO still matters").
- **Convert comparison-shaped prose into tables** (old vs. new, option vs. option). Tables are the most extractable format.
- **Break walls of text**: lists for steps, short paragraphs, one idea per chunk. A chunk should make sense quoted in isolation.

### 3. Evidence layer (research-tested tactics)

These measurably increase citation rates in published research; keyword stuffing does not:

- **Add citations to authoritative sources** for every claim that lacks one.
- **Add statistics and concrete data** where the post argues from generalities. Numbers with sources are citation magnets.
- **Add direct quotations** from named experts or studies where available.
- **Tighten language to clear, fluent, authoritative**: cut hedging, filler, and vague intensifiers. Calibrated confidence, per the tone doc.

### 4. Entity clarity layer

- Name the brand, people, products, and concepts **consistently** throughout (no drifting between name variants). Retrieval association depends on it.
- Define key terms on first use; a model should never have to guess what an acronym means from context.
- Note schema opportunities (FAQ, Article, HowTo) as recommendations in the change log; schema is implemented in the CMS, not in the markdown.

## Output

Never overwrite the source. Save the optimized version to `drafts/` as `blog-update-<slug>.md`, with:

1. The full optimized post.
2. A **change log** at the top (in an HTML comment or a clearly marked section): what was restructured and why, mapped to the layers above, plus schema recommendations and any internal-link suggestions.
3. `[TODO: ...]` flags for anything needing verification (stats you couldn't source, quotes to confirm, GSC data unavailable).

If the `content-freshness` skill hasn't run on this post yet, recommend running it first; optimizing stale facts makes them more likely to be cited, which is worse than not optimizing at all.

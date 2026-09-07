---
type: framework
domain: seo-geo
related: "[[seo-geo revamp frameworks]], [[content recycling best practices]]"
source: CXL course "Optimizing pages with GEO" (Steve Toth, SEO Notebook / Notebook Agency), 13 lessons, distilled July 2026. Transcripts no longer kept in the vault — this note is the canonical record. §7 is vault-added, not from the course.
tags: [framework, geo, aeo, llm-citations, content-optimization]
---

# GEO Optimization Best Practices

Operational distillation of the 13-lesson CXL GEO course, plus vault-added practices the course didn't cover (§7). This is the playbook the `aeo-geo-optimization` skill (and the blog-update agent) follows when optimizing a page.

## 1. The mental model

- **Search engines became answer engines.** Users ask once and refine in conversation instead of opening ten tabs; the 10-blue-links era is over. Optimizing for a ranking position is optimizing for a shrinking surface — the new surface is being *the source the answer is built from*.
- **AI retrieves passages, not pages.** Ranking a page for a keyword no longer guarantees inclusion; selection happens at the passage level, contextually and personalized. A page can rank #1 and still contribute nothing to the answer if no individual passage is quotable, and a page that ranks nowhere can get cited because one section answers a sub-question perfectly.
- **Query fan-out.** One user query expands into dozens of synthetic sub-queries: reformulations, comparisons, entity expansions, personalized variants ("best payroll software" fans out into pricing questions, integration questions, "X vs Y for companies like mine"). Don't chase every fan-out query; identify the recurring core themes and write passages that satisfy them.
- **Fewer clicks, higher intent.** AI-referred visitors arrive pre-qualified and pre-compared — the model already did the shortlisting. Expect fewer clicks with higher conversion and engagement, and sell stakeholders on quality over volume before the traffic graph scares them.
- **Being cited = having retrievable content.** Case in point from the course: Deel got recommended over Oyster for a query both companies objectively fit, because Deel's pages had clear, extractable passages (integrations, pricing, dates) and Oyster's didn't. Fit is necessary; retrievability decides.
- **Models verify externally.** Frontier models consult the live web before answering, so citation-based visibility is the foundation of discoverability — this is not a "wait for the next training run" game.

## 2. Passage-level writing rules

The checklist for every important section of a page:

- **One idea per paragraph**, self-contained enough to be quoted in isolation. If a paragraph only makes sense after reading the one before it, it can't be extracted.
- **Short, declarative, complete-sentence answers** to key questions: "A Formula One car can reach speeds of up to 230 miles per hour" — subject, claim, number, in one sentence — not a vague build-up that pays off three sentences later.
- **Semantic density over brevity**: "Vitamin D, also known as calciferol, helps the body absorb calcium, supports bone density, and prevents osteoporosis" beats "Vitamin D regulates calcium and bone health". Rich, connected detail creates more vector-space matches for more fan-out queries.
- **Semantic redundancy**: express key ideas two or three different ways in natural language. Different phrasings match different query variants; this is the passage-level version of covering fan-out.
- **Clarity beats cleverness**: phrase subheadings as the queries people actually ask, not catchy headlines. "How much does enterprise onboarding cost?" outperforms "The price of getting started".
- **Claim + supporting source in the same section**, not a references block far away. The passage gets extracted alone; its evidence must travel with it.
- **Authority signals on-page**: author bios, credentials, citations, and visible recent dates. Recency in titles and metadata measurably helps selection.
- **Extraction-friendly formats**: FAQs, step-by-step guides, tables, glossaries, comparison sections, bolded key points, section summaries.
- **Open access**: no paywalls, no content locked behind interaction (tabs, accordions that require JS, gated PDFs). If a crawler can't read it, it doesn't exist.

## 3. Site-level structure

- **Treat the site as a knowledge graph, not a sitemap**: content clusters with internal links that define conceptual relationships, using consistent anchor text so the relationship between entities is machine-legible.
- **Semantic HTML** with a clear heading hierarchy that comprehensively covers the topic — the heading tree is the model's map of what the page claims to answer.
- **Schema markup** (FAQ, Article, Organization) helps classification accuracy. It's fundamentals, not a magic citation trigger; don't expect schema alone to move anything.
- **Backlinks still matter, but the "why" shifted**: less raw authority transfer, more being discoverable *inside* sources AI already trusts — listicles, comparison roundups, frequently-cited articles. A mention in a page that LLMs routinely retrieve is worth more than a high-DR link nobody cites.
- **One page or many?** Search the topic first: if a single long-form page gets cited for it, go comprehensive; if only fragments get cited, build a dedicated AEO-tuned page per sub-question.

## 4. Content types that win citations

- **Comparison pages are the strongest AEO asset.** LLMs prefer referencing a ready comparison over assembling one from two separate sites. Go beyond "X vs. Y": multi-option ("ClickUp vs. Asana vs. Monday"), feature-level ("Asana time tracking vs. ClickUp time tracking"), and ICP-specific ("...for SEO agencies").
- **Decisive-factor content**: the reasons buyers actually choose or reject a product — integrations, pricing model, compliance, support coverage. Surface them, validate the list with the sales team, and answer each explicitly on product, feature, and comparison pages.
- **FAQs on product pages and the homepage**, prioritized by the deal-breaker questions that come up in sales conversations, not by what's easy to answer.
- **An AI information page**: a plain-text/markdown page (footer-linked) with the company's key facts — who, what, services, clients, positioning, official domains — plus light instructions for AI assistants. Gives models a first-party source instead of third-party guesswork.
- **Pricing information even when custom**: ranges or worked examples let the model pull accurate numbers from you rather than stale ones from a review site.

## 5. Truth alignment (accuracy is a trust factor)

- **Audit what models say about the brand**: ask "what do you know about [brand]?", inventory the cited sources, and chart how much comes from your own site vs. third parties. In the course's Teal case, only ~5% came from their own site — the brand narrative was effectively outsourced.
- **Outdated content distorts brand perception.** Common Room de-indexed ~80 stale pieces and the AI's description of the company changed from wrong to accurate. Stale pages aren't neutral; they're active misinformation about you. This is why the `content-freshness` pass runs before optimization.
- **Test retrievability**: ask the brand-neutral version of a key buyer question, then the brand-specific version ("Is [brand] an enterprise payroll system that integrates with BambooHR?"). If the brand is missing from the neutral answer but confirmed in the specific one, the facts exist but aren't retrievable — that's the content gap to fill.
- **Consolidate the truth**: keep capabilities, integrations, ICP fit, and positioning clearly and currently stated on-site; correct third-party inaccuracies via outreach.

## 6. Measurement expectations

- **Citation tracking is early and directional, not a leaderboard.** Prompt-visibility scores are noisy and personalization makes them unstable. Prefer engagement and conversions from AI-referred traffic, and qualitative checks on how models represent the brand.
- **Well-structured factual answers can surface almost immediately** because models search live; no need to constantly republish or wait for retraining.
- **"How did you hear about us?" open-text fields** capture AI-driven discovery that attribution tools miss — AI referrals often arrive as direct traffic or generic search.

## 7. Beyond the course — vault additions (July 2026)

Practices the course didn't cover but that now belong in any GEO pass. These are additions from operating experience, not course claims:

- **Crawler access is step zero.** Check `robots.txt` (and any bot-blocking at the CDN/WAF level) for GPTBot, ClaudeBot, PerplexityBot, Google-Extended and friends. Blocking AI crawlers while doing GEO is rowing with the anchor down; whether to allow training bots vs. search/retrieval bots is a policy decision to make explicitly, not by default.
- **Server-side rendering for key content.** Most LLM retrieval crawlers execute little or no JavaScript. Content that only exists after client-side hydration is invisible to them; critical passages, FAQs, and comparison tables must be in the initial HTML.
- **Bing matters again.** ChatGPT's browsing runs substantially on Bing's index. Verify indexing in Bing Webmaster Tools, not just Google Search Console.
- **`llms.txt` is cheap insurance.** A root-level markdown map of the site's key pages for LLM consumption. Adoption by models is unproven — treat it like schema: fundamentals-grade, low cost, no miracle.
- **Off-site presence is half the game.** Answer engines lean heavily on Reddit, review platforms (G2, Capterra), YouTube, and industry listicles. Being accurately represented in those sources often moves brand answers more than another on-site page. Same discipline as §5: audit, then fix the highest-cited sources first.
- **Entity consistency everywhere.** Same company description, category language, and key facts across the site, LinkedIn, G2, Crunchbase, directories. Conflicting descriptions make the model hedge or pick a third party's version.

## 8. How the agent applies this

Order of operations for a page revamp (maps to the `aeo-geo-optimization` skill's layers):

1. Fix freshness first (`content-freshness`); stale facts that get cited spread the error (§5).
2. Confirm crawler access and rendering aren't blocking retrieval (§7).
3. Identify the page's core fan-out themes and decisive factors; write passages that answer them directly (§1, §4).
4. Apply the passage-level checklist to every important section (§2).
5. Restructure headings, tables, and internal links for extraction (§2, §3).
6. Recommend (don't silently implement) site-level moves: schema, comparison/alternative page spin-offs, AI information page, FAQ additions, off-site fixes (§3, §4, §7).

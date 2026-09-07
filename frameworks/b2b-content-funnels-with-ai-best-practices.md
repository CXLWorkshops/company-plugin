---
type: framework
domain: content
related: "[[geo optimization best practices]], [[content recycling best practices]], [[content repurposing frameworks]], [[seo-geo revamp frameworks]]"
source: CXL course "Build optimized B2B content funnels with AI" (Andy Crestodina, Orbit Media Studios), Sessions 1–2, recapped July 2026. Final "How this vault applies it" section is vault-added, not from the course.
tags: [framework, content-strategy, ai-workflows, geo, conversion-optimization, prompting]
---

# B2B Content Funnels with AI — Best Practices

Consolidated rulebook of best practices, mental models, and reusable prompt patterns for using AI in content strategy, content marketing, GEO/AI search optimization, and conversion optimization. Written to be followed directly by AI agents performing content and marketing work — treat every "Rule" and "Prompt Pattern" below as an operating instruction, not just a suggestion to consider.

## 1. Core philosophy

- **Rule: Optimize for quality and outcomes, not just speed.** AI should not be used primarily to save time. The job of marketing is to drive outcomes (leads, rankings, revenue), not to produce more content faster. A tiny percentage of anything (URLs, social posts, influencers, pages) gets the majority of results — the "hockey stick" distribution is the norm in marketing. This means the highest-value use of AI is making things better, not making more things.
- **Rule: Use AI for gap analysis above all else.** The single most powerful and repeatable use case for AI in content and marketing is auditing existing work against a checklist of best practices and finding what's missing. Humans are bad at spotting absence (the "availability heuristic" — we overvalue what we can see and struggle to notice what isn't there). AI has no such bias and will readily list what's missing if asked.
- **Rule: Never publish a lazy, one-shot AI output.** A short prompt like "write an article about X best practices" produces generic, average content — literally the statistical average of the internet. The target audience could generate the same output themselves by typing the same prompt into Google/ChatGPT. There is no reason to publish anything a reader could trivially generate themselves.
- **Rule: Stay human-in-the-loop and skeptical.** Treat AI output as a draft, a hypothesis, or a starting point for judgment — never as ground truth. Expect to disregard roughly 80% of any AI brainstorm. AI is generative: it will always produce something, even when it should say "I don't know." Verify, don't blindly trust ("AI" can stand for "Assuming Correct" — don't).
- **Rule: Best practices are hypotheses, not laws.** Any best practice (including the ones in this document) should be treated as a testable hypothesis. What works depends on the specific audience, brand, and data. When first-party data contradicts a best practice, trust the data.
- **Rule: Differentiate content from AI by being human.** AI has no lived experience, no real opinions, no sensory memory (it has never felt a room's temperature or smelled reheated fish in a microwave). The parts of content that make it memorable and link-worthy are the human elements: personal opinion, anecdote, controversy, original research, and lived experience. Actively look for places to inject a genuine point of view.

## 2. The AI proficiency ladder

Recognize where you (or the workflow you're building) sit on this progression, and aim to move up it:

1. **User** — casual use (e.g., a poem, a birthday song). Passive use of AI Overviews in search counts here too.
2. **Better inputs** — realizing that uploading more context (reports, personas, screenshots) dramatically improves outputs. "Better inputs, more inputs = better outputs."
3. **Prompt engineer** — understanding that every prompt is a draft. Prompts should be tested, iterated, and refined like code, not fired once and trusted.
4. **Workflow builder** — chaining multiple prompts into a repeatable process, where the output of one prompt feeds the next.
5. **Automation builder** — turning a repeatable prompt sequence into a Custom GPT / Gemini Gem / Claude Project / Copilot agent that can be reused or shared.
6. **Agent builder** — building agents that act outside the model (pull reports, send emails, check external tools, produce deliverables like PDFs).
7. **Manager of agents** — overseeing a portfolio of automations and delegating tasks across multiple AI systems, the way one would manage a small team.

**Rule: Don't build a Custom GPT for a one-off task.** Build one only once you find yourself running the same 2–3 prompts in sequence repeatedly — that repetition is the signal it's worth systematizing.

## 3. Prompt construction standard

**Rule: Every non-trivial prompt should include these five elements** (not just a bare instruction):

1. **Role** — who the AI should act as (e.g., "You are an expert content strategist skilled at crafting headlines that get readers to click").
2. **Skills** — the specific expertise to draw on.
3. **Task** — the precise, specific action requested (not vague — "write 5 email subject lines for this article," not "help with subject lines").
4. **Context** — why this matters, what's already known, what "good" looks like for this brand/audience (e.g., "the best subject lines are short because mobile inboxes truncate at ~55 characters").
5. **Input/Output spec** — what you're handing it (a screenshot, a report, a persona) and exactly what format you want back (a table, a rating scale, a color-coded matrix).

- **Rule: Always ask AI to improve your own prompt before relying on it.** Use a "prompt improvement prompt": "Improve the following prompt for clarity and structure. Your goal is to make a reusable prompt: [paste prompt]." AI is the master of the language of prompts and will typically produce a more concise, more effective version than a first human draft. Test the revised prompt side-by-side against the original before adopting it.
- **Rule: Never trust a prompt until it has been tested.** Run it, evaluate the output critically, revise, and re-run. Only promote a prompt to a shared prompt library once it has been vetted and validated as reliably performant.
- **Rule: Prefer tables over charts/images in prompt outputs.** Asking for a chart triggers image-generation mode, which is slower, more resource-intensive, and less reliable. Ask for tables — they are text, fast, and consistently well-formatted.
- **Rule: Feed AI full-page screenshots, not just URLs or pasted text, when auditing UX or conversion elements.** Copy/pasting text or supplying only a link means AI never "sees" what a human visitor sees — no layout, no visual hierarchy, no images. For anything related to conversion, visual UX, or persuasion, use a full-page screenshot (browser extensions like "GoFullPage" or desktop tools like Snagit) so the model can use computer vision the way a human eye would scan the page. For pure technical SEO analysis, HTML/code extraction is appropriate instead.
- **Rule: Maintain a shared prompt library.** Any tool the team already uses for sharing documents (Notion, SharePoint, Google Drive, etc.) is sufficient — the specific tool doesn't matter. What matters is that only vetted, tested prompts go in, functioning like small reusable pieces of software ("prompts are like functions — like code").
- **Rule: Build and reuse detailed personas as prompt inputs.** A well-built synthetic persona (with goals, fears, decision criteria, emotional triggers) can be saved as a document/PDF and dropped into many different downstream prompts (content audits, CTA suggestions, topic research). Treat the persona as a reusable asset, not a one-off.
- **Rule: When training AI on brand voice, feed it volume, not just instructions.** Being prescriptive about tone in a prompt is a weak method. A much stronger method: build a Custom GPT and upload 50–100 real pieces of your own published content (articles, transcripts, sales copy) as training data. With enough real examples, the model infers tone and style patterns a written style guide can't fully capture.

## 4. Content strategy foundations

**Rule: Every content program needs a documented Content Marketing Mission Statement** — distinct from the company mission. It must specify three things explicitly:

1. **Target audience** — who this content is for.
2. **Topics** — what will be published.
3. **Reader benefit** — what's in it for them.

**Rule: Test a mission statement by repurposing it as an email-signup CTA.** If [audience] + [topic] + [benefit] can't be compressed into a compelling newsletter opt-in line, the mission statement isn't sharp enough yet. Iterate with a prompt-improvement pass until it can.

**Rule: Understand the two-visitor-intent model and design content accordingly.**

- **Information intent** ("question mark" queries) → blog posts / articles → job is to teach, build awareness, earn a subscribe.
- **Commercial/transactional intent** ("dollar sign" queries) → service/sales pages → job is to convert, build trust, earn a lead.
- These require different writing skills (content marketer vs. conversion copywriter), different CTAs (subscribe/download vs. contact/demo), and different structural elements (author/date/share buttons vs. testimonials/case studies/pricing).
- Putting a hard lead-gen CTA on a blog post is a mismatch of intent and under-converts; align the CTA to the visitor's stage.

**Rule: Search and social are opposite channels, not just different ones.**

- **Search visitors are busy and have a plan** (they came to satisfy a specific need) → win with long-form, comprehensive, well-structured, natural-language content that fully answers the query.
- **Social visitors are bored and have no plan** (they're scrolling) → win with compelling visuals, emotional triggers, multiple points of view, and unexpectedness.
- Search's job: meet expectations. Social's job: be unexpected.
- Not every topic works in both channels — learn to predict, before publishing, whether a topic idea is a "search opportunity" or a "social opportunity," and tune the format accordingly.

**Rule: Analyze topic × channel performance with GA4 and let AI find the pattern.** Pull a GA4 report (page title as primary dimension, session source as secondary dimension, filtered to exclude direct traffic and scoped to your content directory), export it, clean it (strip header/comment rows, remove near-zero-traffic rows, remove noise), and hand it to AI with a clear prompt (role: content strategist/analytics expert; input: the report; output: N new topic ideas mapped to the channel where they're likely to perform, with a promotion angle for each).

**Rule: Long-form content should be mined for social-native fragments, not just linked to.** Feed AI a full transcript (of a video, podcast, or webinar) and ask for: the most surprising/provocative statements, the best sound bites, counter-narratives, and specific candidate social posts. Long-form video/audio content is otherwise very hard to promote in social feeds.

## 5. Content quality checklist (use as an audit rubric)

High-performing digital content consistently has these elements — treat this list as an auditable checklist, and write/commission content to satisfy all of it:

- A strong opening hook (not a slow windup).
- Visuals at every scroll depth (not just a hero image).
- Evidence and examples that support every claim made.
- Heavy structural formatting: subheads, bullet lists, bolding, internal links.
- Expert quotes / contributor collaboration / multiple points of view.
- A personal angle or stated opinion (not neutral, faceless prose).
- Topical completeness — no gaps or unaddressed subtopics/questions relative to what a thorough treatment of the topic requires.

**Rule:** These same elements roughly describe what makes social streams addictive. The more a piece of content resembles a good social feed (strong opinions, visuals at every scroll, multiple voices), the more engaging it tends to be — to the extent that fits your audience and format.

**Rule: Never write a paragraph longer than three lines.** Visitors are scan-readers; white space and short paragraphs materially improve readability and engagement.

**Rule: Content audits should output a scored, color-coded table plus a list of missed opportunities.** When building or running a content-quality audit prompt, request: a rating/score per checklist element, a color-coded matrix (color visibly increases stakeholder buy-in in meetings), and an explicit "missed opportunities" section with remedies.

### Content audit prompt pattern

```
Role: You are an expert content strategist and editor.
Task: Audit this article/page against the following quality criteria:
strong opening hook; visuals at every scroll depth; evidence and
examples; structural formatting (subheads, bullets, bold, internal
links); expert quotes/collaboration; personal angle/opinion; topical
completeness.
Input: [full-page screenshot of the content]
Output: A scored table (1-5) per criterion, a color-coded matrix,
a list of missed opportunities with specific remedies, and a short
summary.
```

## 6. AI-only / AI-native research methods

These are techniques that are difficult or impossible to do reliably without AI — prioritize them, since they generate differentiated value rather than just efficiency.

- **Rule: Run "knowledge gap" audience research.** People don't know what they don't know, so you can't reliably surface this through interviews alone. Prompt pattern: "What are the most important things that [job title / audience] don't know that they don't know?" Use the results as content topic candidates — they tend to produce high engagement because they're surprising and useful, not because they were asked for.
- **Rule: Run "mundane but provocative opinions" research for social content ideation.** Prompt pattern: "What are some relatively mundane, almost trivial topics that [job title/audience] have strong opinions about?" These generate content angles no competitor is covering, because they come from lived, human specificity (AI itself cannot "have" these opinions — it can only surface where audiences are likely to hold them).
- **Rule: Also probe contrarian/uncomfortable angles directly.** Useful prompt variants:
  - "What widely accepted best practices does [audience] reject?"
  - "What common advice does [audience] think might be harmful?"
  - "What seemingly unrelated topics might have crucial lessons for [audience]'s industry?"
  - "What commonly held fears does [audience] think are overblown or misguided?"
  - "What are unpopular opinions [audience] holds about a trending topic?"
  - "What questions are people in [industry] afraid to answer?"
  - "What false things do people in [industry] believe to be true?"
  - "What are the most important topics in [industry] that are least likely to be covered by major publications?" (a true gap-analysis-of-the-internet question no human could answer by reading everything).
- **Rule: Apply the thought-leadership test before labeling content "thought leadership."** Per Seth Godin's test: if a reasonable person cannot disagree with it, it is not thought leadership. Most useful content is "how-to" teaching, which is valuable but is not the same category as thought leadership. Thought leadership requires taking a defensible, disagreeable stance — and should be used deliberately, understanding it will generate some negative reaction as a side effect of driving engagement and memorability.
- **Rule: Use AI to identify original-research opportunities, but conduct the research yourself.** AI cannot run surveys or generate genuinely new primary data. It can identify white space: frequently-asserted-but-rarely-supported claims in an industry, missing statistics, and unanswered questions the field keeps citing without evidence. Prompt pattern: "You're a content strategist. Your goal is to create original research that attracts links and mentions. In [vertical], what are the frequently asserted but rarely supported claims?" Original, citable data (the kind AI cannot fabricate legitimately) is one of the highest-leverage link-attraction and differentiation assets available — repeat and update the study annually to compound its value.
- **Rule: Use AI to find where your audience congregates ("watering holes") for organic PR/influencer strategy.** Prompt pattern: request a table of where [job title/audience] learns, engages, and interacts (communities, publications, podcasts, conferences, forums), to identify partnership, guest-content, and relationship-building targets. Influencer/creator relationships remain one of the few genuine shortcuts in content marketing, because they provide access to an already-built audience.

## 7. GEO / AI search optimization

- **Rule: Understand why organic click traffic has been declining — it predates AI and is structural, not a temporary dip.** Google has progressively added SERP features (featured snippets in 2016, "People Also Ask" in 2018, AI Overviews in 2024+) that answer queries directly on the results page, reducing the need to click through for information-intent queries specifically. Ranking #1 no longer guarantees a real, visible position on the page — track pixel distance from the top of the viewport, not just rank position.
- **Rule: Segment traffic impact by intent before reacting to traffic declines.** Commercial/transactional-intent queries (the "money phrases" that drive service-page and homepage traffic) remain click-worthy and high-value. Information-intent queries are the ones most cannibalized by SERP/AI features — and those visitors historically converted poorly anyway. Don't panic-react to aggregate traffic drops; segment first.
- **Rule: The fundamental shift is that AI provides recommendations, while traditional search provided options.** Traditional SEO's job was to get you into the option set; the user did their own evaluation afterward via the website. Now the evaluation ("who is the best option for my specific need") increasingly happens inside the AI conversation, before the user ever reaches a website. This means: AI referral traffic tends to convert at meaningfully higher rates (visitors arrive with pre-established trust), and the goal must expand from AI **visibility** to AI **recommendation**.
- **Rule: Prompts are much longer and more detailed than search queries** (often 20–70+ words vs. ~4 words for a search query), and typically encode role, problem, and desired outcome. Reverse-engineer likely prompts for your category and ensure your content explicitly addresses the elements those prompts imply: target job titles, industries, geographies, specific outcomes/use cases/results/metrics achieved, and named comparisons.
- **Rule: To get recommended by AI, include far more explicit "reasons to believe" than classic SEO copywriting typically includes.** This goes beyond keyword coverage and E-E-A-T basics: buyer personas addressed by name/title, specific quantified outcomes, case studies, proof points as literal text (not just as images/logos, which AI-as-text-crawler can't read as well), comparisons, and clear specific claims. What's good for classic SEO supports AI visibility; what's good for CRO supports AI recommendation — pursue both together.

### AI-recommendation audit prompt pattern

```
Role: You are an AI visibility and conversion auditor.
Task: Evaluate the website at [URL] only — do not draw on general
knowledge about this category.
Criteria: Does the content clearly state the business category,
buyer personas (job titles, industries, geographies), specific
outcomes/use cases/product types, and quantified results/metrics?
Are there sufficient reasons to believe (proof points, comparisons,
testimonials, credentials)? Is the copy clear, specific, and
prominent?
Output: A scored table, gap analysis, and specific recommendations
to increase the likelihood this brand is recommended by AI.
```

- **Rule: Directly interrogate what AI already believes about your brand — this is now possible and should be done routinely.** Ask an AI search mode (e.g., Google AI Mode, or a general-purpose model) to compare your brand against named competitors and produce a pros/cons buyer's guide table. This exposes exactly where the model perceives you as weak, which becomes a direct to-do list for content and page updates. Screenshot the output and feed it back into a second prompt asking for specific website content changes to close the gaps. Treat this as a recurring competitive-intelligence exercise, not a one-time check — re-run it periodically and from varied simulated-user angles.
- **Rule: Track AI-referred traffic in GA4 explicitly — most sites don't yet do this.** Build a GA4 Exploration using Page Referrer + Landing Page + Sessions, filtered by a regex matching AI referrer domains (ChatGPT, Claude, Gemini, Perplexity, Copilot, Mistral, etc.). Ensure data retention is set to 14 months (not the 2-month default) so Explorations have enough history to be useful. Export this report and feed it to AI with a prompt asking it to identify which topics/content types AI sources favor (commonly: research reports and well-evidenced pieces, since AI systems and their users are validating claims), then apply those findings to prioritize future content and refresh candidates.
- **Rule: Don't over-optimize for individual LLM platforms.** Chasing per-model differences (ChatGPT vs. Claude vs. Perplexity, etc.) is not a good use of time given how fast the underlying technology changes; anchor strategy in stable human behavior and decision psychology instead, and default to optimizing for Google's AI surfaces first simply because Google's audience share dwarfs the alternatives.
- **Rule: Don't worry about content cannibalization in the traditional SEO sense.** Search engines evaluate each page on its own merits against user intent; they do not "demote" pages for having a similar sibling page. If two planned page ideas return heavily overlapping search results when tested side by side, that's a signal to consolidate into one stronger, more comprehensive page rather than splitting into several thinner ones — especially relevant for AI answer generation, which is unlikely to synthesize across many near-duplicate URLs.
- **Rule: Do not expect AI-generated blog content, on its own, to be a strong SEO strategy.** There's no evidence of an "AI content" ranking penalty per se, but low-effort AI content is undifferentiated by definition, and search/AI systems are optimizing for comprehensive, evidenced, differentiated content. If AI is used to draft content, expect — and budget for — substantial human editing, added specificity, and added evidence before publishing; low-effort AI drafts should carry low performance expectations.

## 8. Conversion optimization / bottom-of-funnel framework

**Rule: Prioritize conversion-rate work on existing traffic before chasing more traffic.** There are visitors on key pages right now; a page with a broken conversion path wastes all current and future traffic to it. "There is no amount of cheese that fixes a broken mousetrap." Start optimization at the bottom of the funnel and work upward.

**Rule: Every high-performing page is built from three repeating elements, in this order of function: Answers → Evidence → Call to Action.** A page is a visual hierarchy that should guide the eye through a sequence of (answer a question → support it with evidence → prompt an action), repeated as the visitor scrolls. Audit and improve each of the three elements independently.

### 8.1 Personas as the foundation for conversion work

- **Rule: Build a detailed synthetic persona before auditing or writing conversion copy.** Persona-building prompt should request: role/responsibilities/company context; hopes and dreams; fears and concerns; emotional triggers; and explicit **decision criteria** (what specifically determines whether they choose a vendor). Decision criteria are the non-negotiable input — without them, you cannot judge whether a page provides sufficient confidence to convert.
- **Rule: Treat the persona as a living, reusable, queryable asset, not a static document.** Save it and reuse it across many prompts (content ideas, page audits, CTA generation, sales-deck gap analysis). It can even be "interviewed" directly (e.g., "What do you hate about looking for vendors in this category?").
- **Rule: A persona is only as useful as it is accurate** — validate and enrich it with real data (sales call transcripts, stakeholder interviews, support tickets) rather than treating a first AI draft as final.

### 8.2 Auditing Answers (persona-alignment audit)

**Rule: Audit whether a page actually answers the specific unmet information needs of a defined persona, not generic best practices.** Feed AI the persona plus a full-page screenshot; ask for a color-coded matrix of which of the persona's key information needs were vs. weren't addressed, plus a list of missed opportunities with example copy. This can be run comparatively across your page and competitor pages to benchmark relative completeness.

### 8.3 Auditing Evidence

**Rule: Assume every page is under-evidenced until proven otherwise** — most pages are "piles of unsupported marketing claims." Reasons-to-believe/evidence types to check for: logos, awards, partners, testimonials (including video), data/statistics, case studies, comparisons, trust seals, certifications/memberships. Run an evidence-audit prompt requesting a claim-support table (each claim mapped to whether it's backed by evidence), a color-coded heatmap, and a list of unsupported claims.

### 8.4 Auditing and writing Calls to Action

- **Rule: Treat CTA click-through rate as a distinct, trackable, and highly leverageable metric** — improving it alone, with zero additional traffic, can materially increase leads. It is measurable directly from a GA4 path exploration; most marketers never check it.
- **Rule: Design for (at minimum) three CTA tiers on a key page:**
  1. **Global/header CTA** — short (aim for ~3 words), typically top-right, primary action.
  2. **Primary hero CTA** — more room; can include supporting microcopy/"kicker" text (e.g., a response-time promise or extra reason to believe) directly beside the button.
  3. **Secondary/soft CTA** — for visitors not ready to convert yet (e.g., download a guide, view case studies) — sales-adjacent content rather than a direct commitment ask.
- **Rule: CTA copy should trigger specific cognitive biases deliberately** — certainty, loss aversion, social proof, time-sensitivity — and should be persona-specific rather than generic ("click here," "learn more," "submit").
- **Rule: Every click decision is a split-second cost/benefit calculation by the visitor.** There are exactly two levers to raise CTA performance: **lower the perceived cost/commitment** (e.g., "Schedule a quick call" instead of "Get in touch," "Get pricing" instead of a vague "Contact us"), or **raise the perceived benefit** (specific outcome language). Favor high-effort/high-specificity verbs over generic ones ("click," "learn," "read" tend to be weak); test against your own first-party CTR data once you have it, and let data override this default.

### 8.5 Specificity audit

**Rule: Audit headers, subheads, navigation labels, and images for genericness** — a page that "any competitor could have written" is a conversion and AI-training failure, not just a branding weakness. A vague tagline (e.g., "Unmatched talent leads to extraordinary results") fails three ways simultaneously: it doesn't confirm to the visitor they're in the right place, it gives AI nothing to train on for category/recommendation purposes, and it wastes a keyword-relevance opportunity. **Test: could a brand-new competitor, founded yesterday, publish this exact same page? If yes, rewrite for specificity.** This applies to subheads (e.g., replace "Who We Are / Services / Culture" with descriptive, specific labels) and to imagery (avoid generic stock concepts like stacked hands for "teamwork"; use imagery specific to the actual work/industry).

### Master bottom-of-funnel audit prompt pattern (run three times, once per element)

```
Role: You are a conversion optimization and persuasion-science expert.
Input: [persona], [full-page screenshot of the target page]
Task (Answers pass): Identify which of the persona's key questions
and information needs are, and are not, addressed on this page.
Task (Evidence pass): Identify every claim made on this page and
whether it is backed by concrete evidence (data, testimonial, case
study, credential, etc.).
Task (CTA pass): Evaluate each call to action for specificity,
psychological trigger used, and perceived cost vs. benefit; propose
3 alternates per CTA slot (global, hero, secondary).
Output: A color-coded scoring matrix, a list of missed opportunities
per pass, and concrete example copy/remedies.
```

## 9. AI-assisted writing workflow

- **Rule: Do not rely on default AI writing style — actively suppress "AI-typical" language.** Maintain and apply a running blocklist of generic AI phrasing (e.g., "unlock the secrets," "unleash the power," "synergy," "furthermore," "gone are the days," "digital realm," "ever-changing," "game-changer," "in a world," "treasure trove"). Configure this as a standing instruction/custom instruction wherever the tool supports persistent preferences, not as a one-off note per prompt.
- **Rule: Draft collaboratively in an iterative "canvas"/document mode, not as a single generate-and-publish call.** Treat AI writing as an editing conversation: submit an outline/rough draft, review, give specific corrective feedback (fix a misunderstood section, shorten paragraphs to 3 lines max, sharpen the opening hook, add internal links to specific real articles — and verify those links/citations aren't hallucinated), request contributor quotes from real named experts (and then actually reach out to those experts for a real quote rather than lifting one — this also creates a promotion ally), and request visual/table treatments for list-heavy sections.
- **Rule: Verify every AI-suggested factual element before publishing** — suggested articles to link to, quotes attributed to real people, statistics, and named sources are all realistic hallucination risks and must be checked against reality.
- **Rule: For durable brand voice, invest in a Custom GPT trained on 50–100 pieces of your actual published content** (articles, call transcripts, video transcripts) rather than trying to fully specify tone through prose instructions. This produces edits that structurally match real writing habits (e.g., converting embedded lists into bullet lists, adding numbered subheads) without needing to specify each rule explicitly.

## 10. Governance: shared prompts vs. Custom GPTs

- **Rule: Use a shared prompt library for single, standalone, vetted prompts** that different people run manually as needed (e.g., "the content audit prompt," "the specificity audit prompt").
- **Rule: Graduate a prompt sequence to a Custom GPT / Gem / Project only once you're chaining 2–3 prompts in sequence repeatedly.** The custom-automation format is justified by repeated multi-step sequences, not by single-shot use cases — building one prematurely adds overhead without benefit. Custom GPTs can also be shared publicly, unlike a private shared prompt library, which is a relevant factor when the automation should reach an external audience.

## 11. Operating checklist summary (quick reference)

Before publishing or shipping any content/page work, confirm:

- [ ] Content mission statement (audience, topics, benefit) is documented and reflected in this piece.
- [ ] Piece is deliberately built for its target channel (search = comprehensive/answer-first; social = visual/emotional/opinionated) — not generically for both.
- [ ] Passes the content-quality checklist: hook, visuals at every scroll depth, evidence, heavy structure/formatting, expert quotes, personal angle, topical completeness.
- [ ] Contains a genuine human point of view or original data — not just a restatement of consensus information.
- [ ] AI-typical phrasing has been stripped out; paragraphs are ≤3 lines.
- [ ] All AI-suggested facts, links, quotes, and citations have been human-verified.
- [ ] If a key/landing page: has been audited against a real persona for Answers, Evidence, and CTA gaps, and against a specificity audit.
- [ ] Page copy explicitly states buyer personas, industries/geographies, specific outcomes and metrics, and comparisons — not just generic taglines — to support AI recommendation, not just keyword ranking.
- [ ] CTAs are tiered (global/hero/secondary), specific, and psychologically tuned (cost lowered or benefit raised, not generic verbs).
- [ ] GA4 is tracking AI-referrer traffic (14-month retention enabled) so this content's AI-driven performance can be measured going forward.
- [ ] Any reusable prompt used to produce this work has been tested, refined, and — if proven — added to the shared prompt library.

## 12. How this vault applies it (vault-added)

- **§7 (GEO/AI search) is the strategy-layer companion to [[geo optimization best practices]]**: that note carries the page-level how (passage rules, retrievability), this one carries the funnel-level why (visibility → recommendation, intent segmentation, reasons-to-believe). The AI-recommendation audit and brand-interrogation exercises apply directly to [[seo-geo cxl.com]] — especially when deciding which of the top-traffic pages earn a revamp. No contradictions between the two notes; where this course says "don't fear cannibalization, consolidate," it reinforces the archive/consolidate workstream.
- **§5 (content quality checklist) and §9 (AI-writing rules)** are audit rubrics for the `write-blog` and `qa-draft` skills; the AI-phrasing blocklist overlaps with, and extends, the CXL tone-of-voice banned-words list.
- **§8 (Answers → Evidence → CTA, CTA tiers, specificity audit)** is the playbook for webinar landing pages feeding [[ai native marketer webinars]] — registrations are the conversion event, and the "founded-yesterday" specificity test is the fastest QA pass on any landing draft.
- **§4's search-vs-social opposition** refines [[content recycling best practices]] §7's native-first rule: when recycling, don't just re-package — re-tune for the channel's opposite psychology (meet expectations vs. be unexpected).
- **§6 (AI-native research)** feeds topic selection for [[b2b ai tactics newsletter]]: knowledge-gap and contrarian-angle prompts fit its practical, anti-hype positioning; the original-research rule matches its data-study edition format.
- **Persona assets (§8.1)** should live in `Wiki/<Client>/` alongside the tone-of-voice note when built, so the content skills can reuse them.

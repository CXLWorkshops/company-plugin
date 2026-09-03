---
name: content-freshness
description: Audit an existing blog post for outdated information and fix it: stale statistics, dead or changed tools, superseded features, old dates, broken links, and claims that no longer hold. Use this whenever the user asks to check if a post is still accurate, refresh or update an old article, fix outdated content, or before an AEO/GEO optimization pass, even if they only give a URL or file path.
---

# Content Freshness

Audit a blog post's factual claims against the current state of the world and fix what's outdated. This skill is multi-client: it works on any client's post (default client: CXL). Stale content quietly destroys reader trust and citeability, and an LLM that cites an outdated stat attributes the error to the brand that published it.

## Before auditing

1. Get the source: a repo file (read it), a URL (fetch it), or pasted content.
2. If fixes will involve rewriting more than numbers, read the client's voice contract: `wiki/<Client>/tone-of-voice.md`; replacement text must match the client's voice. If the client has no tone-of-voice file, match the post's existing style and flag the gap.
3. Note the post's publication/update date if visible. It calibrates suspicion: an older post about a fast-moving domain is presumed outdated until verified; a recent post gets spot-checks.

## The audit pass

Extract every perishable claim, then verify each with web search. Perishable claims, in priority order:

1. **Statistics and data points** ("69% of searches are zero-click", "800 million weekly users"). Search for the current figure. Stats older than ~18 months in fast-moving domains (AI, search) are presumed stale.
2. **Tool and product claims**: names, features, pricing, availability. Tools get renamed, acquired, discontinued, or transformed (features that were paid become free, models get replaced). Verify each named tool still exists and does what the post says.
3. **Platform behavior claims** ("Google shows featured snippets for...", "ChatGPT can't browse the web"). These flip silently and are the most embarrassing category when wrong.
4. **Dates and recency framing** ("as of 2024", "recently launched", "the new X"). Anything the post calls "new" or "recent" needs a check; "this year" needs an absolute year.
5. **Links**: fetch outbound links that carry evidence weight. Flag dead links and links whose target no longer supports the claim.
6. **Screenshots and UI references**: can't verify visually, but flag references to UI that has likely changed ("click the three-dot menu...") as `[TODO: verify screenshot]`.

Verification discipline:

- Every fix needs a source found during the audit, linked inline. No fixing a stale number with a plausible-sounding newer one from memory; a confident wrong update is worse than the stale original.
- If verification is inconclusive (conflicting sources, paywalled data), keep the original claim and flag it `[TODO: could not verify — conflicting sources]` rather than guessing.
- Distinguish **wrong** from **aged**: a study accurately labeled with its year isn't outdated, it may just need a newer companion stat. Don't strip historical evidence that's honestly dated.

## Output

Never overwrite the source. Save to `drafts/` as `blog-update-<slug>.md` (if an AEO/GEO pass will follow or already exists for this post, work in that same draft so changes accumulate in one file), with:

1. The corrected post.
2. A **freshness report** at the top: a table of every claim checked with columns for original claim, verdict (current / outdated / unverifiable), the fix applied, and the source. Include claims that passed, so the user knows what was checked, not just what changed.
3. `[TODO: ...]` flags for everything unverifiable.

End by recommending the `aeo-geo-optimization` skill if it hasn't run yet; fresh facts are the prerequisite, extractable structure is the multiplier.

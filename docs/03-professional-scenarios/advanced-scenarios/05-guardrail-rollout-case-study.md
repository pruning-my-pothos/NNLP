---
title: "Case Study: Rolling Out Guardrails in a Product Team"
archetype: "scenario"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["scenario", "guardrails", "governance", "product"]
last_reviewed: "2025-12-28"
---

:::info[Value Proposition]
How a product squad added lightweight guardrails to an AI feature without slowing delivery.
:::

## Context

- Feature: AI-assisted release notes generator in a web app.
- Risk: Possible leakage of internal issue text; hallucinated features.
- Constraint: Two-week sprint; no new vendor approvals.
- Team: 1 PM, 2 engineers, 1 QA; existing CI already running lint/tests.

## Approach (Week-by-Week)

- **Week 1**  
  - Added `data-boundaries.md` rules to prompts (no internal ticket IDs in outputs).  
  - Switched to local embeddings + Chroma; cloud LLM kept for generation.  
  - Enabled logging with redaction; model/version recorded per request.
- **Week 2**  
  - Added schema-first generation (JSON) + stop tokens.  
  - CI hook: run PII scan + JSON schema validation on generated notes fixtures.  
  - Human review checklist: grounding check vs. issue summaries; refusal if context missing.

## Outcomes

- Reduced review defects: hallucinated features dropped from ~30% to under 5% in spot checks.
- No internal ticket IDs leaked; redaction + prompt rules blocked them.
- Cycle time unchanged; most guardrails were prompts + CI checks.

## Artifacts Used

- Prompt rules (data boundaries, refusals).
- Schema + stop tokens for JSON output.
- CI checks: secret scan, JSON schema validation, unit tests for notes formatter.
- Logging: model/version + redacted prompt/output for audit.

## What We’d Do Next

- Add automated hallucination checks using retrieval overlap.
- Move generation to a smaller local model for drafts; keep hosted model as fallback.

## Next Step

- See `guardrail-checklist.md` to apply the same pattern on your next AI feature.

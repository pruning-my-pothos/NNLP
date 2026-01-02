---
title: "Explainable AI"
archetype: "standard"
status: "draft"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["genai-llm"]
last_reviewed: "2025-12-20"
---
# Explainable AI

:::info[Value Proposition]
Explainability builds trust: show what context was used, how the answer was produced, and where the limits are.
:::

## Practical Techniques

- **Show sources**: Cite retrieved documents/lines in answers.
- **Reveal assumptions**: Include a short “assumptions” list when context is thin.
- **Structured rationales**: Ask for a brief reasoning trace (when safe), then post-filter for PII/secrets.
- **Input/Output logs**: Keep prompts + outputs (with redaction) for audit.
- **Versioning**: Note the model/version used in user-facing outputs where appropriate.

## Checklist

- Retrieval responses include **citations** or file/section references.
- UI shows **last updated** and **model/version** where decisions matter.
- High-impact flows provide a **“why am I seeing this?”** explanation or link.
- Reasoning traces are **kept internal** for review unless scrubbed for sensitive data.

## Pitfalls

- Exposing raw model chain-of-thought can leak sensitive data—sanitize or summarize.
- Over-long explanations harm UX; keep it skimmable.

## Next Step

Combine with `human-review-protocols.md` for oversight and `data-boundaries.md` to ensure traces/citations don’t leak sensitive inputs.

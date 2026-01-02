---
title: "Ethical AI"
archetype: "standard"
status: "draft"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["genai-llm"]
last_reviewed: "2025-12-20"
---
# Ethical AI

:::info[Value Proposition]
Ethical AI is about intent, transparency, and informed consent. Keep a light checklist to avoid avoidable harm.
:::

## Principles (practical)

- **Purpose clarity**: Be explicit about why the model is used and for whose benefit.
- **Consent & notice**: Inform users when AI is involved and how data is used.
- **Proportionality**: Match model power to task risk; avoid over-collection of data.
- **Accountability**: A human owns outcomes; document decisions.
- **Recourse**: Provide a way to challenge or correct AI-driven outputs.

## Quick Checklist

- State the **intended use** and **out-of-scope** cases in the spec.
- Record **data sources** and retention expectations.
- Add **disclaimers** where output is advisory, not authoritative.
- Provide a **human escalation path** in user-facing flows.
- Log decisions to support audits and user questions.

## Anti-Patterns

- Dark patterns that hide AI use.
- Collecting more data than necessary “just in case.”
- Blindly trusting model output for high-impact decisions.

## Next Step

Pair this with `governance-and-accountability.md` and `guardrails-index.md` to operationalize these principles.

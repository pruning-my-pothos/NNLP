---
title: "Hallucinations and Failure Modes"
archetype: "foundation"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "hallucination", "failure-modes", "risk"]
last_reviewed: "2025-12-20"
---

# Hallucinations and Failure Modes

:::info[Purpose]
Identify common failures, why they occur, and how NNLP mitigates them.
:::

## Why Hallucinations Happen

- Probabilistic guessing when context is thin or misaligned.
- Over-recall/under-recall in retrieval; stale or wrong sources.
- Prompt ambiguity; missing constraints or refusals.

## Common Failure Modes

- **Fabrication**: inventing facts, URLs, code paths.
- **Truncation**: silent loss of important instructions/context.
- **Overconfidence**: authoritative tone without support.
- **Spec drift**: ignoring constraints/non-goals.

## Mitigations

- Grounding with verified sources; enforce citations/refusals.
- Keep prompts concise; prioritize critical instructions.
- Verify outputs with tests/checks; require evidence before acceptance.
- Track residual risk; refuse on insufficient context.

## Anti-Patterns

- Shipping “plausible” output without checks.
- Expanding context blindly instead of fixing retrieval/intent.
- Ignoring stale embeddings or source freshness.

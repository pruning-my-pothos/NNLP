---
title: "How LLMs Work (Enough for Practice)"
archetype: "foundation"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "llm", "fundamentals", "probabilistic", "transformer"]
last_reviewed: "2025-12-20"
---

# How LLMs Work (Enough for Practice)

:::info[Purpose]
Give practitioners the minimum mental model to avoid misuse and set correct expectations for NNLP.
:::

## Quick Model

- **Transformer decoder** predicts the next token from a probability distribution conditioned on context.
- **Training** is pattern fitting on large corpora; it does not memorize perfectly nor reason symbolically.
- **Inference** samples from a distribution; sampling params (temperature/top-p) change behavior.

## What to Remember

- **Probabilistic, not authoritative**: output is the most likely continuation, not ground truth.
- **Context-bound**: only sees provided context + frozen weights; nothing outside that window.
- **Tokenized**: counts subwords/bytes, not words; long inputs cost more and risk truncation.
- **No agency**: it does not “decide” priorities; it completes patterns you set.

## How to Apply in NNLP

- State intent and constraints explicitly to narrow the distribution.
- Provide only relevant context; avoid over-long prompts that risk truncation or dilution.
- Set sampling conservatively (low temperature) for deterministic tasks; allow diversity only where needed.
- Always verify with evidence; treat output as draft.

## Anti-Patterns

- Assuming model output is factual or authoritative.
- Relying on “it said it checked” without independent verification.
- Ignoring context length, leading to silent truncation.

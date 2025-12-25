---
title: "Prompting vs Specifying"
archetype: "foundation"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "prompting", "specification", "constraints"]
last_reviewed: "2025-12-20"
---

# Prompting vs Specifying

:::info[Purpose]
Contrast ad-hoc prompting with disciplined specification so NNLP stays predictable.
:::

## Core Idea

- **Prompting**: conversational, open-ended, often ambiguous → higher variance.
- **Specifying**: intent + constraints + context + format → lower variance, reviewable outputs.

## Specify with NNLP

- Declare **intent** (what success looks like) and **non-goals**.
- State **constraints** (tech, safety, compliance, cost, scope).
- Provide **structured context** (facts, references) and **output format** (schemas/examples).
- Add **refusals/stop conditions** for out-of-scope asks.

## Anti-Patterns

- One-shot prompts with no constraints; “try again” loops without changing inputs.
- Asking for decisions (judgment) instead of drafts; delegating acceptance to the model.
- Missing acceptance criteria or review plan before generating.

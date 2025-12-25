---
title: "Model Selection and Tradeoffs"
archetype: "foundation"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "model-selection", "tradeoffs", "capacity", "cost"]
last_reviewed: "2025-12-20"
---

# Model Selection and Tradeoffs

:::info[Purpose]
Choose the right model class and size for the task while managing cost, latency, and risk.
:::

## Dimensions to Balance

- **Quality vs cost/latency**: larger models cost more and respond slower.
- **Context length**: longer contexts help grounding but increase cost and risk truncation.
- **Safety/guardrails**: built-in policies vary; may require additional controls.
- **Domain fit**: general vs fine-tuned models; embeddings for retrieval quality.

## Practical Choices

- Use **smaller/faster models** for deterministic, structured tasks with strong constraints.
- Use **larger models** when reasoning depth or open-ended synthesis is required.
- For grounding-heavy tasks, prioritize **embedding quality** and **retrieval** over sheer model size.
- Consider **cost caps** and **latency budgets**; test with real prompts and contexts.

## Anti-Patterns

- Always choosing the largest model “for safety.”
- Ignoring latency or cost until after rollout.
- Using a weak embedding model with strong generation and blaming the generator.

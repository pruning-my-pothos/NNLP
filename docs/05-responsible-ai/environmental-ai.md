---
title: "Environmental AI"
archetype: "standard"
status: "draft"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["genai-llm"]
last_reviewed: "2025-12-20"
---
# Environmental AI

:::info[Value Proposition]
AI workloads consume energy and hardware; a few choices reduce footprint without sacrificing outcomes.
:::

## Practical Steps

- **Right-size models**: Use smaller/lower-latency models when quality is sufficient.
- **Batching**: Batch requests when possible to reduce overhead.
- **Context discipline**: Shorter prompts and outputs cut tokens and energy.
- **Local vs cloud**: Prefer efficient local inference when it avoids extra data transfer; otherwise, use cloud regions close to data/users.
- **Cache**: Reuse embeddings/results where permissible to avoid recomputation.

## Metrics to Watch

- Tokens generated/ingested per task.
- Latency and retries (wasted cycles).
- GPU/CPU utilization for local runs.

## Checklist

- Set **max_tokens** and enforce **stop** sequences.
- Log and review **token spend** regularly.
- Evaluate a **smaller model** as a fallback for non-critical tasks.

## Next Step

See `cost-intuition.md` for cost/efficiency tradeoffs and `latency-profiling-mini` (Code & Snippets) for local efficiency checks.

---
title: "Retrieval and Grounding (RAG)"
archetype: "foundation"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "rag", "retrieval", "grounding", "context"]
last_reviewed: "2025-12-20"
---

# Retrieval and Grounding (RAG)

:::info[Purpose]
Explain how to ground generation in authoritative context, reduce hallucinations, and keep traceability.
:::

## Key Concepts

- **Retrieval**: fetch relevant chunks based on embeddings/metadata.
- **Grounding**: require answers to cite or stay within retrieved context.
- **Freshness**: keep sources current; stale context leads to stale answers.
- **Traceability**: link citations back to sources; log what was retrieved.

## Practice Guidelines

- Define **source of truth** and metadata (owner, freshness, version).
- Keep **chunks concise**; include titles/anchors for better retrieval.
- Limit **top-k** and use reranking to avoid over-recall and dilution.
- Enforce **citation/grounding** in prompts; refuse when no support exists.

## Failure Modes

- Over-stuffed context → the model ignores key facts (“lost in the middle”).
- Unvetted sources → grounded in wrong or stale data.
- Missing trace → cannot audit or reproduce an answer.

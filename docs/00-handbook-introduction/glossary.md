---
title: "Glossary"
archetype: "terminology"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["genai-llm", "glossary", "terminology"]
last_reviewed: "2025-12-28"
---

# Glossary

:::info[Precision matters]
Clear, consistent terminology is fundamental for effective communication with both humans and AI. This glossary defines key terms used throughout the GenAI & LLM Handbook.
:::

## Key Terms

| Term                                            | Definition                                                                                                                                                                                                                                                                                                                      | Reference                                                                      |
| :---------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------- |
| **GenAI & LLM Handbook** (Generative AI & Large Language Model Handbook) | A method that treats language as executable infrastructure, with AI assisting and humans accountable. | `/docs/00-handbook-introduction/what-is-genai-llm` |
| **GenAI & LLM Handbook Loop**              | The execution rhythm from discovery through iteration.                                                                                                                                                                                                                                                    | `/docs/01-handbook-method/the-genai-llm-loop`                                        |
| **Discovery Brief**                             | Short artifact capturing problem, context, and success markers without prescribing solutions.                                                                                                                                                                                                               | `/docs/01-handbook-method/discovery-brief`                                      |
| **Intent Spec**                                 | Statement of goals and desired outcomes, independent of implementation.                                                                                                                                                                                                                                     | `/docs/01-handbook-method/intent-spec`                                          |
| **Constraint Spec**                             | Non-negotiables, trade-offs, and guardrails the solution must honor.                                                                                                                                                                                                                                      | `/docs/01-handbook-method/constraint-spec`                                      |
| **Delegation Contract**                         | Explicit permissions and prohibitions for AI assistance.                                                                                                                                                                                                                                                  | `/docs/01-handbook-method/delegation-contract`                                  |
| **Generation Request**                          | Structured ask to an AI system, scoped by prior artifacts.                                                                                                                                                                                                                                                | `/docs/01-handbook-method/generation-requests`                                  |
| **Review & Interrogation**                      | Systematic verification that outputs match intent, constraints, and acceptance criteria.                                                                                                                                                                                                                  | `/docs/01-handbook-method/review-and-interrogation`                             |
| **Acceptance Criteria**                         | Observable conditions that define “done.”                                                                                                                                                                                                                                                                 | `/docs/01-handbook-method/acceptance-criteria`                                  |
| **Artifact**                                    | A concrete, reviewable output from a stage of the GenAI & LLM Handbook Loop (e.g., spec, plan, code, test, documentation).                                                                                                                                                                    | `/docs/01-handbook-method/artifact-contracts`                                   |
| **Human-in-the-Loop (HITL)**                    | A workflow where human input and decision-making are intentionally integrated at critical junctures of an automated or AI-driven process.                                                                                                                                                             | `/docs/01-handbook-method/08-evaluation/03-human-review-protocols`                                |
| **Grounding**                                   | Providing an LLM with relevant, accurate, and up-to-date information (e.g., from a vector database or specific documents) to inform its response and prevent hallucinations. Often achieved via Retrieval Augmented Generation (RAG).                                                                 | `/docs/foundations/02-llm-deep-dive/fundamentals/04-retrieval-and-grounding-rag`               |
| **Hallucination**                               | An LLM output that is factually incorrect, makes false claims, or presents non-existent information as truth, often without external supporting evidence.                                                                                                                                               | `/docs/foundations/02-llm-deep-dive/fundamentals/07-hallucinations-and-failure-modes`          |
| **Context Window**                              | The maximum number of tokens (prompt + history + retrieved text) the model can process at once.                                                                                                                                                                                                           | `/docs/08-code-and-snippets/04-model-management/context-window-basics`          |
| **Quantization**                                | Reducing model precision (e.g., q4/q5/q8) to fit local hardware at some quality cost.                                                                                                                                                                                                                    | `/docs/08-code-and-snippets/04-model-management/quantization-basics`           |
| **Structured Output**                           | Forcing the model to return well-formed JSON or schema-constrained data for easier validation.                                                                                                                                                                                                           | `/docs/08-code-and-snippets/08-structured-output`                               |
| **Function Calling / Tools**                    | Asking the model to select and call defined functions/tools with arguments instead of generating free-form text.                                                                                                                                                                                         | `/docs/08-code-and-snippets/08-structured-output/function-calling-minimal`      |
| **Prompt Injection**                            | An adversarial input that tries to override instructions or exfiltrate data.                                                                                                                                                                                                                             | `/docs/08-code-and-snippets/06-context-hygiene/prompt-injection-red-flags`      |
| **Deterministic-ish Settings**                  | Low temperature/top_p, fixed seed, stable ordering to reduce randomness for testing/regression.                                                                                                                                                                                                           | `/docs/08-code-and-snippets/09-output-validation-and-guards/deterministic-settings` |
| **RAG (Retrieval Augmented Generation)**        | Retrieve relevant chunks from a knowledge base and have the model answer only from that context, with citations.                                                                                                                                                                                         | `/docs/08-code-and-snippets/10-rag-mini/retrieve-and-cite`                      |
| **Reranking**                                   | Reordering retrieved chunks by relevance using a secondary model or heuristic to boost precision.                                                                                                                                                                                                         | `/docs/08-code-and-snippets/10-rag-mini/rerank-minimal`                         |
| **Embedding**                                   | Vector representation of text used for semantic search and retrieval.                                                                                                                                                                                                                                    | `/docs/08-code-and-snippets/11-embeddings-and-vector-ops/embeddings-local-ollama` |
| **Vector Store**                                | Database optimized for storing and searching embeddings.                                                                                                                                                                                                                                                 | `/docs/08-code-and-snippets/10-rag-mini/local-vector-store-options`             |
| **Safety/Privacy Guardrails**                   | Input/output checks, redaction, allowlists, and policies to prevent data leakage and unsafe behavior.                                                                                                                                                                                                    | `/docs/05-responsible-ai`                                                       |
| **Evaluation (Golden Set / Regression)**        | Fixed set of prompts/expected behaviors used to measure quality over time.                                                                                                                                                                                                                               | `/docs/08-code-and-snippets/12-eval-and-regression-mini/golden-prompts-set`     |

---

## Core Formula

**The GenAI & LLM Handbook = Logic × Language × Systems × Sentences**. If any factor is zero, reliability collapses.

---

## Symbols and Labels Used in the GenAI & LLM Handbook

We use a set of visual cues and icons to convey information density, warnings, and calls to action.

-   `💡` (Tip): Helpful advice, best practices.
-   `⚠️` (Warning): Important considerations, potential pitfalls.
-   `🛑` (Stop): Critical risks, do not proceed without addressing.
-   `✅` (Good): Example of a good practice or output.
-   `❌` (Bad): Example of a bad practice or output.

---

## Next Steps

Review the [Core Formula](#core-formula) to understand the foundational elements of the GenAI & LLM Handbook.

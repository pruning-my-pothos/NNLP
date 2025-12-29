---
title: "The GenAI & LLM Documentation Map"
archetype: "guide"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["genai-llm", "map", "navigation", "learning-path", "genai"]
last_reviewed: "2025-12-28"
---

# The GenAI & LLM Handbook Map

:::info[Visual Guide]
This map provides a visual overview of how the different components of the GenAI & LLM Handbook connect, guiding your learning and application.
:::

## Overview

The GenAI & LLM Handbook is a layered system:

-   **Core Skills** (Logic, Language, Systems, Sentences) are the human capabilities.
-   **Fundamentals** provide the necessary theoretical background on GenAI/LLMs.
-   **Method** (The GenAI & LLM Handbook Loop + artifacts) turns intent into executable language.
-   **Execution Patterns** are reusable recipes for common tasks.
-   **Professional Scenarios** show real-world application for different roles.
-   **Guardrails & Governance** ensure safe and compliant operation.
-   **Evaluation** provides objective measurement and feedback.
-   **Tooling** covers how to interact with AI models (CLIs, IDEs, frameworks).

---

## Visual Flow

```mermaid
flowchart TB
    A[Start Here] --> B[Core Skills]
    B --> C[Fundamentals]
    C --> D[The GenAI & LLM Handbook Method]
    D --> E[Execution Patterns]
    E --> F[Professional Scenarios]
    D --> G[Templates]
    F --> H[Experiments]
    F --> I[Evaluation]
    I --> J[Iteration & Versioning]
    J --> D

    classDef block fill:#FFF4E5,stroke:#E6A23C,color:#2D1B0E;
    class A,B,C,D,E,F,G,H,I,J block;
```

> Mermaid source: `assets/diagrams/genai-llm-scenario-map.mmd`

---

## How it All Connects

| Section                      | Focus                                     | Key Documents                                                                                     |
| :--------------------------- | :---------------------------------------- | :------------------------------------------------------------------------------------------------ |
| **Start Here**               | What is GenAI & LLM? Who is it for? | `00-introduction/what-is-genai-llm.md`, `00-introduction/who-this-is-for.md`                                                 |
| **Core Skills**              | The human foundation for AI-assisted work | `../01-core-skills/00-core-skills-overview.md`                                                    |
| **Fundamentals**             | Essential GenAI/LLM theory                | `../foundations/02-llm-deep-dive/fundamentals/00-fundamentals-index.md`                                           |
| **The GenAI & LLM Handbook Method** | How do the artifacts fit together?    | `../01-handbook-method/the-genai-llm-loop.md`                                                       |
| **Execution Patterns**       | How do I apply the GenAI & LLM Handbook to tasks? | `../02-execution-patterns/00-pattern-index.md`                                                |
| **Professional Scenarios**   | Real-world use cases by role              | `../05-scenarios/00-scenarios-index.md`                                              |
| **Guardrails & Governance**  | Safety, compliance, accountability        | `../07-guardrails/guardrails-index.md`                                             |
| **Evaluation**               | Measuring quality and effectiveness       | `../08-evaluation/00-eval-overview.md`                                                            |
| **Templates**                | Reusable artifacts for common tasks       | `../06-templates/00-templates-index.md`                                                           |
| **Tooling**                  | How to interact with AI models            | `../06-tooling/00-tooling-index.md`                                                |
| **Experiments**              | What happened in practice?            | External: [Experiments (repo)](https://github.com/pruning-my-pothos/GenAI-LLM-Docs/tree/main/experiments) |

---

## Next Steps

Explore the foundational concepts of Generative AI in [Introduction to Generative AI](../foundations/01-generative-ai-introduction/introduction.md).

## Related Diagrams

-   Visual: `assets/diagrams/genai-llm-loop.mmd`
-   Visual: `assets/diagrams/genai-llm-skill-matrix.mmd`

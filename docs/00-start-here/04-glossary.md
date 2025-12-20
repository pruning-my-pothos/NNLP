---
title: "Glossary"
archetype: "foundation"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "glossary", "terminology"]
last_reviewed: "2025-12-20"
---

# Glossary

:::info[How to use]
Keep this open when writing specs or reviews. Consistent language reduces drift and rework.
:::

## Core Terms

| Term                                            | Definition                                                                                            | Where It Lives                                     |
| ----------------------------------------------- | ----------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| **NNLP** (Nuanced Natural Language Programming) | A method that treats language as executable infrastructure, with AI assisting and humans accountable. | `00-what-is-nnlp.md`                               |
| **NNLP Loop**                                   | The execution rhythm from discovery through iteration.                                                | `../03-nnlp-method/00-the-nnlp-loop.md`            |
| **Discovery Brief**                             | Short artifact capturing problem, context, and success markers without prescribing solutions.         | `../03-nnlp-method/01-discovery-brief.md`          |
| **Intent Spec**                                 | Statement of goals and desired outcomes, independent of implementation.                               | `../03-nnlp-method/02-intent-spec.md`              |
| **Constraint Spec**                             | Non-negotiables, trade-offs, and guardrails the solution must honor.                                  | `../03-nnlp-method/03-constraint-spec.md`          |
| **Delegation Contract**                         | Explicit permissions and prohibitions for AI assistance.                                              | `../03-nnlp-method/04-delegation-contract.md`      |
| **Generation Request**                          | Structured ask to an AI system, scoped by prior artifacts.                                            | `../03-nnlp-method/05-generation-requests.md`      |
| **Review & Interrogation**                      | Systematic verification that outputs match intent, constraints, and acceptance criteria.              | `../03-nnlp-method/06-review-and-interrogation.md` |
| **Acceptance Criteria**                         | Observable conditions that define “done.”                                                             | `../03-nnlp-method/07-acceptance-criteria.md`      |

---

## Skill Language

| Term          | Definition                                                     | Notes                                     |
| ------------- | -------------------------------------------------------------- | ----------------------------------------- |
| **Logic**     | Reasoning about cause/effect, invariants, and dependencies.    | Weak logic → plausible but wrong outputs. |
| **Language**  | Precise wording that minimizes interpretation variance.        | Treat words as an interface.              |
| **Systems**   | Awareness of architecture, boundaries, and long-term behavior. | Protects against regressions.             |
| **Sentences** | Single units of meaning; one instruction per sentence.         | Small wording shifts change behavior.     |

:::warning[Reminder]
**NNLP = Logic × Language × Systems × Sentences**. If any factor is zero, reliability collapses.
:::

---

## Guardrails and Governance Terms

- **Data Boundaries**: What data AI can and cannot see or move. (`../07-guardrails-and-governance/data-boundaries.md`)
- **Threat Model Lite**: Focused assessment of likely abuse paths for AI-assisted changes. (`../07-guardrails-and-governance/threat-model-lite.md`)
- **Accountability Model**: Who owns decisions, review, and risk. (`../07-guardrails-and-governance/accountability-model.md`)

---

## Evaluation Terms

- **Quality Rubric**: Criteria to judge completeness, correctness, and clarity. (`../08-evaluation/01-quality-rubric.md`)
- **Scenario Scorecard**: Structured checklist for end-to-end scenarios. (`../08-evaluation/05-scenario-scorecards.md`)
- **Hallucination**: Model-generated content not grounded in provided context or facts.

---

## Symbols and Labels Used in NNLP Docs

- 🟦 **Info**: Context or rationale.
- 🟧 **Warning**: Risk hotspots or common pitfalls.
- 🟩 **Tip**: Practical shortcuts or best practices.
- 🟥 **Stop**: Do-not-proceed conditions until resolved.

:::tip[Pro tip]
Reuse these labels in your own specs to keep intent legible when collaborating.
:::

---

## Last Reviewed / Last Updated

- Last reviewed: 2025-12-20
- Version: 0.1.0

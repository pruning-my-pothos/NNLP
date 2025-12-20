---
title: "Common Skill Gaps"
archetype: "core-skill"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "skill-gaps", "failure-modes", "professional-practice"]
last_reviewed: "2025-12-20"
---

# Common Skill Gaps

:::warning[Purpose]
Skill gaps are normal. Leaving them hidden is not. Use this list to spot and fix them before they become production incidents.
:::

## Overview

Most NNLP failures are not caused by bad tools or weak models.
They are caused by **predictable gaps in human skill**.

This document makes those gaps explicit so they can be addressed deliberately, not discovered through production incidents.

The goal is not blame.
The goal is **early detection and correction**.

---

## Why Skill Gaps Matter

AI amplifies intent, not competence.

When skill gaps exist:

- ambiguity scales
- incorrect assumptions persist
- review becomes superficial
- risk shifts downstream

NNLP assumes gaps are normal and fixable, but only if they are visible.

---

## Common Gaps by Skill Area

### Logic Gaps

- **Missing preconditions**
  Failing to state what must be true before execution.
  Impact: models assume defaults; failures surface late.
  Correction: explicitly list prerequisites and invariants.

- **Happy-path bias**
  Only describing ideal scenarios.
  Impact: brittle systems; unhandled errors.
  Correction: state failure modes and fallback behavior.

- **Outcome-only thinking**
  Describing what you want without how constraints interact.
  Impact: inconsistent behavior; conflicting interpretations.
  Correction: separate goals from conditions.

---

### Language Gaps

- **Ambiguous vocabulary**
  Using words with wide interpretation ranges.
  Impact: model invents intent; review becomes subjective.
  Correction: replace adjectives with conditions.

- **Blended concerns**
  Mixing intent, constraints, and implementation.
  Impact: instructions collapse into noise.
  Correction: separate sections clearly.

- **Implicit context**
  Assuming shared understanding that does not exist.
  Impact: hallucinated dependencies; incorrect integrations.
  Correction: state environment and assumptions explicitly.

---

### Systems Gaps

- **Local optimization**
  Solving the immediate task without system context.
  Impact: regressions; broken integrations.
  Correction: restate system boundaries in discovery.

- **Boundary leakage**
  Allowing AI to operate outside intended scope.
  Impact: unintended changes; architectural drift.
  Correction: enforce delegation contracts.

- **Operational blindness**
  Ignoring runtime and maintenance concerns.
  Impact: failures in production; brittle deployments.
  Correction: include operational constraints early.

---

### Sentence-Level Gaps

- **Overloaded sentences**
  Multiple instructions per sentence.
  Impact: merged or ignored constraints.
  Correction: one instruction per sentence.

- **Hidden conditionals**
  Using vague qualifiers (“if needed”, “where appropriate”).
  Impact: AI decides when to act.
  Correction: specify explicit conditions or remove discretion.

- **Priority ambiguity**
  Unclear ordering of importance.
  Impact: constraints overridden; unexpected trade-offs.
  Correction: order sentences intentionally.

---

## Cross-Cutting Gaps

- **Over-delegation**
  Handing decisions to AI prematurely.
  Impact: loss of control; silent errors.
  Correction: tighten delegation until skill improves.

- **Under-review**
  Trusting output because it looks good.
  Impact: latent defects; production surprises.
  Correction: review against explicit criteria.

- **Tool fixation**
  Blaming tools instead of improving skill.
  Impact: constant tool switching; no skill growth.
  Correction: focus on artifacts and outcomes.

:::danger[Stop gap]
If you cannot name the weakest skill for this task, pause generation until you can. Blind spots are where risk hides.
:::

---

## How to Use This Document

Use this document as:

- a self-assessment checklist
- a review aid after failures
- a teaching reference for teams
- a pre-generation sanity check

Revisit it often.

---

## When Gaps Are Closing

You will notice:

- fewer surprises
- clearer specs
- shorter review cycles
- more predictable outputs
- increased confidence grounded in evidence

This is NNLP working as intended.

---

## Next Section

We now resume the original order.

Proceed to:
**`docs/02-genai-llm-fundamentals/00-fundamentals-index.md`**

This begins the GenAI and LLM fundamentals layer.

---

## Last Reviewed / Last Updated

- Last reviewed: 2025-12-20
- Version: 0.1.0

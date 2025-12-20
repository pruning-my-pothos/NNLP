---
title: "Logic"
archetype: "core-skill"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "logic", "reasoning", "constraints", "causality", "genai"]
last_reviewed: "2025-12-20"
---

# Logic

:::info[Why it matters]
AI will happily generate plausible output. Logic is what makes it correct, consistent, and reviewable.
:::

## At a Glance

| Focus                      | Use Logic To                    | Failure If Missing                    |
| -------------------------- | ------------------------------- | ------------------------------------- |
| Cause and effect           | State what must be true and why | Models invent dependencies            |
| Preconditions & invariants | Protect non-negotiables         | Hidden assumptions leak into output   |
| Dependencies & ordering    | Make sequencing explicit        | Steps run out of order; regressions   |
| Failure modes              | Define how to degrade           | Errors surface late and unpredictably |

---

## Overview

Logic is the backbone of NNLP.

When you program with natural language, logic determines whether your sentences describe a **coherent system** or just plausible text. AI models are very good at sounding correct. Logic is what ensures they _are_ correct.

In NNLP, logic governs:

- what must be true
- what depends on what
- what happens if something fails
- what trade-offs are acceptable

Without logic, language execution becomes guesswork.

:::warning[Signal to pause]
If you cannot state what would make the output _wrong_, you have not finished the logic yet.
:::

---

## What Logic Means in NNLP

Logic in NNLP is **not formal proofs or math-heavy reasoning**.
It is applied, operational logic.

Specifically, it means:

- reasoning about cause and effect
- defining invariants and non-negotiables
- understanding conditions and branching
- recognizing hidden assumptions
- anticipating second-order effects

Logic is what turns intent into something executable and reviewable.

---

## Why Logic Matters More with AI

AI systems:

- infer missing steps
- interpolate between instructions
- optimize for plausibility, not truth

If your logic is incomplete:

- the model will fill gaps incorrectly
- errors will look reasonable
- failures will surface late

NNLP treats logical clarity as a **preventative control**.

:::danger[Do not proceed]
If preconditions, invariants, and failure modes are not written, stop writing prompts and finish them.
:::

---

## Common Logical Constructs in NNLP

### Preconditions

What must be true before execution begins.

Examples:

- input data must be validated
- authentication must be present
- schema must be known

If preconditions are not stated, AI will assume defaults.

---

### Invariants

What must remain true regardless of changes.

Examples:

- data integrity constraints
- backward compatibility
- security guarantees

Invariants are rarely inferred correctly unless stated explicitly.

---

### Dependencies

What relies on what.

Examples:

- service A depends on service B
- this step must run before that step
- configuration precedes deployment

NNLP logic requires ordering to be explicit.

---

### Failure Modes

What can go wrong and how it should be handled.

Examples:

- retries vs hard failures
- fallback behavior
- error visibility

Ignoring failure logic shifts risk downstream.

---

## Logic Across the NNLP Method

Logic appears at every stage of NNLP:

- **Discovery Brief**
  Clarifying the actual problem and success conditions

- **Intent Spec**
  Defining goals and boundaries logically

- **Constraint Spec**
  Encoding non-negotiables and trade-offs

- **Delegation Contract**
  Stating what AI may and may not decide

- **Review and Interrogation**
  Checking consistency and implications

Logical gaps at early stages compound later.

---

## Anti-Patterns to Avoid

- **Implicit assumptions**
  Assuming context the model does not have.

- **Overloaded instructions**
  Multiple logical branches crammed into one sentence.

- **Missing edge cases**
  Only describing the happy path.

- **Outcome-only thinking**
  Stating what you want without specifying conditions.

:::warning[Fix first]
Convert each anti-pattern into explicit preconditions, invariants, or failure behaviors before generating.
:::

---

## Practical Checklist

Before generating anything, answer:

- What must be true for this to work?
- What cannot change?
- What depends on what?
- What happens if this fails?
- How will I know this is correct?

If you cannot answer these, do not generate yet.

---

## Logic and Review

Logic is the primary lens during review.

When reviewing AI output:

- check invariants first
- trace dependencies
- look for unstated assumptions
- test failure paths

Do not start with style or performance.

---

## How to Practice Logic in NNLP

- Write constraints before instructions
- Use bullet points to isolate conditions
- Separate goals from implementation
- Review logic aloud or line by line
- Compare generated behavior against acceptance criteria

:::tip[Fast drill]
Take any request you plan to send to an AI. Write three failure modes and how to handle them. Then send the request.
:::

Logic improves with deliberate practice.

---

## Next Skill

Proceed to:
**`docs/01-core-skills/02-language.md`**

This will focus on how wording, structure, and vocabulary shape execution.

---

## Last Reviewed / Last Updated

- Last reviewed: 2025-12-20
- Version: 0.1.0

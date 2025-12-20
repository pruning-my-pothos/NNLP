---
title: "Systems"
archetype: "core-skill"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags:
  [
    "nnlp",
    "systems-thinking",
    "architecture",
    "dependencies",
    "failure-modes",
    "genai",
  ]
last_reviewed: "2025-12-20"
---

# Systems

:::info[Core idea]
Systems thinking keeps AI-generated changes from working only locally and failing when they meet the real world.
:::

## At a Glance

| Focus           | Use Systems To                        | Failure If Missing                    |
| --------------- | ------------------------------------- | ------------------------------------- |
| Boundaries      | Define what is and is not in scope    | AI bleeds into neighboring components |
| Interfaces      | Keep contracts explicit and stable    | Integrations break silently           |
| Dependencies    | Order work and assumptions            | Hidden coupling and regressions       |
| State & runtime | Consider operations, scaling, failure | “Works on my machine” surprises       |

---

## Overview

Systems thinking is what separates **locally correct output** from **globally reliable outcomes**.

In NNLP, systems thinking ensures that language-driven execution does not produce isolated solutions that break when integrated, scaled, or maintained.

AI is very good at solving _the task in front of it_.
Systems thinking is what ensures the task belongs in the larger whole.

---

## What “Systems” Means in NNLP

Systems in NNLP refers to understanding **how components interact over time**.

This includes:

- architecture and boundaries
- data flow and control flow
- dependencies and integration points
- operational and failure behavior
- long-term maintainability

Systems thinking is not about drawing diagrams.
It is about anticipating consequences beyond the immediate change.

:::tip[Quick visual]
Sketch components and arrows in 90 seconds before generating. It uncovers hidden dependencies fast.
:::

---

## Why Systems Thinking Is Critical with AI

LLMs optimize for:

- local coherence
- immediate task success
- plausibility within context

They do **not** inherently reason about:

- downstream integrations
- deployment environments
- organizational constraints
- cumulative technical debt

Without systems awareness:

- AI-generated changes regress other parts of the system
- “working” solutions fail in production
- fixes introduce new classes of bugs

NNLP treats systems thinking as a safety mechanism.

---

## Core System Concepts in NNLP

### Boundaries

Where responsibility begins and ends.

Examples:

- service boundaries
- module ownership
- data ownership
- trust zones

If boundaries are not explicit, AI will blur them.

---

### Interfaces

How systems communicate.

Examples:

- APIs
- schemas
- contracts
- events

Interfaces must be treated as stable commitments, not suggestions.

---

### Dependencies

What must exist for something else to work.

Examples:

- service dependencies
- library versions
- configuration order
- infrastructure prerequisites

Dependencies require explicit ordering and assumptions.

---

### State

What persists across execution.

Examples:

- databases
- caches
- user sessions
- configuration state

State-related issues are a common source of AI-induced bugs.

---

### Failure Modes

How the system behaves under stress or error.

Examples:

- partial outages
- timeout behavior
- degraded modes
- retries and backoff

Failure behavior must be designed, not assumed.

---

## Systems Across the NNLP Method

- **Discovery Brief**
  Identify the system context, not just the task

- **Intent Spec**
  Clarify which part of the system is affected

- **Constraint Spec**
  Protect boundaries, compatibility, and invariants

- **Delegation Contract**
  Prevent AI from crossing architectural lines

- **Review**
  Look for unintended side effects and regressions

Systems thinking shows up at every stage.

---

## Common Systems Anti-Patterns

- **Local optimization**
  Fixing one part while degrading another.

- **Boundary leakage**
  Allowing AI to modify or assume behavior outside scope.

- **Hidden coupling**
  Introducing dependencies without documenting them.

- **Ignoring operations**
  Treating runtime behavior as someone else’s problem.

:::warning[Preventative step]
Write “Out of scope: …” and “Interfaces touched: …” before every generation request.
:::

---

## Practical Systems Checklist

Before generating:

- What system does this change belong to?
- What does it integrate with?
- What assumptions does it make?
- What state does it touch?
- What happens if this component fails?

If you cannot answer these, you are not ready to generate.

---

## Systems During Review

During review, ask:

- does this respect existing boundaries?
- are interfaces stable and explicit?
- are dependencies documented?
- does this change introduce hidden coupling?
- is failure behavior reasonable?

Review for system impact before code style.

---

## How to Practice Systems Thinking in NNLP

- Always state system context in discovery
- Name boundaries explicitly
- Treat interfaces as contracts
- Think about operations early
- Review changes as part of the whole, not in isolation

:::tip[Fast drill]
Describe the smallest and largest blast radius for your change. Ensure the spec matches the smaller one.
:::

Systems thinking improves reliability more than any tool choice.

---

## Next Skill

Proceed to:
**`docs/01-core-skills/04-sentences.md`**

This will focus on sentence-level precision and why small wording changes matter disproportionately in NNLP.

---

## Last Reviewed / Last Updated

- Last reviewed: 2025-12-20
- Version: 0.1.0

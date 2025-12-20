---
title: "Template: Intent Spec"
archetype: "template"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "template", "intent"]
last_reviewed: "2025-12-20"
---

# Intent Spec: [Feature/Change Name]

:::info[Instructions]
Use this spec to define **what** success looks like, not **how** to build it.
If you find yourself writing code or implementation details, stop and move that to the Constraint Spec.
:::

## 1. Primary Objective

**What is the single most important outcome?**
_(State the goal in terms of user value or system behavior.)_

> [One clear sentence describing the goal.]

---

## 2. Scope (In Bounds)

**What specific parts of the system will change?**
_(Be explicit about boundaries.)_

- **Components**: [e.g., User Profile Service, Frontend Settings Page]
- **Data**: [e.g., User metadata table]
- **User Types**: [e.g., Admin users only]

---

## 3. Exclusions (Out of Bounds)

**What are we explicitly NOT changing?**
_(This prevents "while I'm at it" refactoring.)_

- [ ] We are NOT touching [e.g., Authentication logic]
- [ ] We are NOT refactoring [e.g., The legacy billing module]

---

## 4. Expected Behavior (User/System View)

**How does the system behave when this is done?**
_(Describe the "happy path" and key alternative paths.)_

### Scenario A: [Name]

1. User does [Action]
2. System responds with [Result]
3. Data is updated to [State]

### Scenario B: [Name]

1. System receives [Event]
2. System processes [Logic]
3. System emits [Output]

---

## Last Reviewed / Last Updated

- Date: YYYY-MM-DD

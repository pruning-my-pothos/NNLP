---
title: "Template: Generation Request"
archetype: "template"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "template", "generation"]
last_reviewed: "2025-12-20"
---

# Generation Request Structure

:::info[Instructions]
Copy and paste this structure into your LLM chat or IDE prompt. Replace the bracketed sections with your actual content.
:::

## 1. The Primer

> **Role**: [e.g., Senior Backend Engineer] > **Goal**: [e.g., Implement the feature defined in the specs below.]

---

## 2. The Context (Artifacts)

### Intent Spec

```markdown
[PASTE INTENT SPEC HERE]
```

### Constraint Spec

```markdown
[PASTE CONSTRAINT SPEC HERE]
```

### Delegation Contract

```markdown
[PASTE DELEGATION CONTRACT HERE]
```

---

## 3. The Task

**Instruction**:
[Specific action to take right now. e.g., "Generate the `UserService.ts` file."]

**Relevant Files**:

- `src/models/User.ts`
- `src/services/OldService.ts`

---

## 4. Output Format

- [ ] Return **only** the code.
- [ ] Do not explain the code unless asked.
- [ ] Ensure all imports are relative to the project root.

---

## Last Reviewed / Last Updated

- Date: YYYY-MM-DD

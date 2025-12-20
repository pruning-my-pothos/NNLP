---
title: "Template: Constraint Spec"
archetype: "template"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "template", "constraints"]
last_reviewed: "2025-12-20"
---

# Constraint Spec: [Feature Name]

:::info[Instructions]
Use this to lock down the solution space. Be specific. "Fast" is not a constraint; "Response < 100ms" is.
:::

## 1. Non-Negotiables (Must / Must Not)

**What are the hard rules?**
_(Binary conditions. Pass/Fail.)_

- **Must Use**: [e.g., React Query for data fetching]
- **Must Not Use**: [e.g., `useEffect` for data fetching]
- **Must Not Introduce**: [e.g., New npm dependencies]

---

## 2. Technical Context

**What is the environment?**
_(Prevent version mismatches and hallucinated APIs.)_

- **Language**: [e.g., TypeScript 5.0]
- **Framework**: [e.g., Next.js 14 (App Router)]
- **Key Libraries**: [e.g., Tailwind CSS, Zod]

---

## 3. Architecture & Patterns

**How should the code look?**
_(Enforce consistency with existing codebase.)_

- **Pattern**: [e.g., Repository pattern for DB access]
- **File Structure**: [e.g., Colocate tests with components]
- **Naming Convention**: [e.g., `use[Feature]Hook`]

---

## 4. System Invariants (Security & Performance)

**What must remain true?**
_(Guardrails for quality.)_

- **Security**: [e.g., All inputs must be sanitized via Zod]
- **Performance**: [e.g., No blocking operations on the main thread]
- **Data**: [e.g., No schema migrations allowed in this change]

---

## 5. Trade-offs

**If conflicts arise, what wins?**

- [ ] Prioritize **Readability** over **Performance**
- [ ] Prioritize **Consistency** over **Modernity**

---

## Last Reviewed / Last Updated

- Date: YYYY-MM-DD

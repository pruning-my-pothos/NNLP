---
title: "Template: Acceptance Criteria"
archetype: "template"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "template", "acceptance", "qa"]
last_reviewed: "2025-12-20"
---

# Acceptance Criteria: [Feature Name]

:::info[Instructions]
Define "done" before you start. These criteria must be observable, binary (pass/fail), and agreed upon by the reviewer.
:::

## 1. Functional Correctness (The "Happy Path")

**Does it do what we asked?**
_(Verify against the Intent Spec.)_

- [ ] **Input**: When provided [X], the system accepts it.
- [ ] **Process**: The system performs [Y] logic correctly.
- [ ] **Output**: The system returns [Z] in the expected format.

---

## 2. System Integrity (The "Safety Check")

**Did we break anything else?**
_(Verify against the Constraint Spec.)_

- [ ] **Regressions**: Existing tests for [Related Feature] still pass.
- [ ] **Performance**: Latency remains under [X]ms.
- [ ] **Logs**: No new error logs or warnings generated during execution.

---

## 3. Negative Scenarios (The "Edge Cases")

**Does it handle failure gracefully?**

- [ ] **Invalid Input**: System rejects [Bad Data] with a clear error message.
- [ ] **Missing Dependencies**: If [Service] is down, the system [Degrades/Fails Safely].
- [ ] **Boundaries**: Inputs at the limit (max size, max length) are handled.

---

## 4. Code & Artifact Standards

**Is the work professional?**

- [ ] **Tests**: New unit/integration tests are included and passing.
- [ ] **Docs**: README or inline documentation is updated.
- [ ] **Cleanliness**: No commented-out code or debug print statements.

---

## 5. Sign-off

**Status**:

- [ ] **Accepted**: Meets all criteria.
- [ ] **Conditional**: Accepted pending [Minor Fix].
- [ ] **Rejected**: Failed critical criteria.

---

## Last Reviewed / Last Updated

- Date: YYYY-MM-DD

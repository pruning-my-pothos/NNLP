---
title: "CLI Agents: Aider & Claude Code"
archetype: "pattern"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "tooling", "cli", "aider", "automation"]
last_reviewed: "2025-12-20"
---

# CLI Agents: Aider & Claude Code

:::info[Why CLI Agents?]
IDE tools are "Co-Pilots" (they help you type). CLI Agents are "Engineers" (they do the work while you supervise). They are best for large refactors, migrations, or test generation.
:::

## Overview

CLI agents like **Aider** or **Claude Code** run in your terminal. They have direct access to your file system and git.

In NNLP, we use them to execute **Generation Requests** autonomously.

---

## Workflow: The "Spec-Driven" Agent

Unlike chat interfaces, CLI agents need explicit file handling.

### 1. Add the Artifacts

You must explicitly "add" your specs to the agent's chat session so it knows what to build.

```bash
# Aider Example
/add docs/03-nnlp-method/02-intent-spec.md
/add docs/03-nnlp-method/03-constraint-spec.md
```

### 2. Add the Target Files

Add the files you want the agent to modify.

```bash
/add src/legacy/auth.js
```

### 3. The Prompt

Since the context is already loaded, the prompt can be simple.

> "Refactor `auth.js` according to the Intent and Constraint specs provided. Do not change logic outside the specs."

---

## Best Practices for CLI NNLP

### The "ReadOnly" Pattern

When using Aider, add your specs as **read-only** files if the tool supports it, or simply instruct the model not to edit them.

:::warning[Risk]
Agents love to "fix" your specs. Explicitly tell them: "Do not edit the markdown files. Only edit the code."
:::

### The "Lint Loop"

Configure your agent to run your linter/tests after every change.

```bash
# Aider startup with auto-test
aider --test-cmd "npm test"
```

This automates **Step 6 (Review)** at the functional level. If tests fail, the agent self-corrects.

---

## When to Use CLI vs. IDE

| Feature     | IDE (Cursor)              | CLI (Aider)                  |
| :---------- | :------------------------ | :--------------------------- |
| **Latency** | Low (Interactive)         | High (Batch)                 |
| **Scope**   | Single file / Small diffs | Whole repo / Large refactors |
| **Control** | Line-by-line              | Outcome-based                |

---

## Last Reviewed / Last Updated

- Last reviewed: 2025-12-20
- Version: 0.1.0

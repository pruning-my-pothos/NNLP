---
title: "Experiments & Labs"
archetype: "foundation"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "experiments", "lab", "research"]
last_reviewed: "2025-12-20"
---

# Experiments & Labs

:::info[The Laboratory]
This directory contains the raw data of NNLP. It is where we test hypotheses, break models, and validate new patterns before using them in production.
:::

## Overview

NNLP is an empirical practice. We don't guess what works; we test it.

Use this directory to:

- Test a new model (e.g., "Can Llama 3 handle our SQL schema?")
- Test a new prompt strategy (e.g., "Does Chain-of-Thought improve refactoring?")
- Document failure modes (e.g., "When does Claude 3.5 hallucinate imports?")

---

## Directory Structure

We organize experiments by **Topic** or **Date**.

```text
experiments/
├── README.md               # You are here
├── 00-template.md          # Copy of the experiment template
├── 2024-Q1/                # Chronological archive
└── topics/
    ├── local-llm-limits/   # Topic-specific deep dives
    └── rust-refactoring/
```

---

## How to Run an Experiment

1. **Copy the Template**
   Use `docs/09-templates/experiment-template.md`.

2. **Define the Hypothesis**
   "I believe [Model X] can write [Language Y] if I provide [Constraint Z]."

3. **Execute & Log**
   Paste the prompts and the results. Be honest about failures.

4. **Synthesize**
   Write the "Key Learnings" section. This is the only part most people will read.

---

## Current Active Labs

| Experiment                      | Status         | Owner    |
| :------------------------------ | :------------- | :------- |
| **Local LLM for Red Zone Data** | 🟡 In Progress | Shailesh |
| **Cursor Composer vs. Aider**   | 🟢 Complete    | Shailesh |

:::tip[Contribution]
If you find a new failure mode or a reliable pattern, submit a PR adding it to this folder.
:::

---

## Last Reviewed / Last Updated

- Last reviewed: 2025-12-20
- Version: 0.1.0

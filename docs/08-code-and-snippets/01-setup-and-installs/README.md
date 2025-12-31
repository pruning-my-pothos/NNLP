---
title: "Setup & Installs"
archetype: "index"
status: "active"
owner: "NNLP"
maintainer: "NNLP"
version: "1.0.0"
tags: ["setup", "installation", "environment", "index"]
last_reviewed: "2025-12-31"
---

# Setup & Installs

This section provides a series of actionable guides for setting up a robust and efficient local development environment for Generative AI engineering. These snippets cover everything from running local models to managing your Python and Node.js dependencies.

:::info[Goal: A Reproducible Local Environment]
The goal is to enable you to run, test, and develop GenAI applications entirely on your local machine. This is crucial for rapid iteration, offline development, and cost management.
:::

---

## Local Language Model Runtimes

-   [**LM Studio Setup**](./lm-studio-setup.md): GUI-friendly; browse/download models; spin up an OpenAI-compatible server.
-   [**Ollama Setup**](./ollama-setup.md): CLI-friendly; pull/run models fast; exposes a local API by default.
-   [**llama.cpp Setup**](./llama-cpp-setup.md): Build/run the core engine from source for maximum control.
-   [**MLX Setup**](./mlx-setup.md): Apple Silicon–optimized inference with MLX.

## Programming Environment Setup

-   [**Python (uv)**](./python-uv-venv.md): Recommended; fast install/resolve; manages venv + deps in one tool.
-   [**Python (venv + pip)**](./python-venv-pip.md): Standard built-in flow; no extra tooling.
-   [**Node.js (nvm + pnpm)**](./node-nvm-pnpm.md): Manage Node versions and install deps efficiently.

## Sanity Checks

-   [**Sanity Checks**](./sanity-checks.md): Quick commands to confirm installs and API endpoints are working locally.

:::tip[Recommended Path for Beginners]
1) Start with **LM Studio** to pull a small model.  
2) Set up Python with **uv** (or venv+pip if you prefer built-in).  
3) Run **Sanity Checks** to confirm installs.  
4) Try **Ollama** when you’re ready for a streamlined CLI workflow.
:::

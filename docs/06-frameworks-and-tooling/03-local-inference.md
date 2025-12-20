---
title: "Local Inference: Ollama"
archetype: "pattern"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "tooling", "local-llm", "privacy", "ollama"]
last_reviewed: "2025-12-20"
---

# Local Inference: Ollama

:::info[Why Local?]
When working with **Red Zone** data (PII, secrets, core IP), you cannot send code to the cloud. Local inference allows you to execute NNLP safely on your own hardware.
:::

## Overview

Tools like **Ollama** or **LM Studio** allow you to run models like Llama 3, Mistral, or DeepSeek Coder locally.

**Trade-off**: Local models are generally "dumber" than GPT-4 or Claude 3.5.
**NNLP Implication**: You must write **tighter constraints** and **simpler sentences** to get good results.

---

## Adjusting NNLP for Local Models

Local models struggle with complex, multi-step reasoning. You must break the loop down further.

### 1. Simplify the Logic

Instead of one big "Refactor this" prompt, split it:

1. "Add types to function A."
2. "Add types to function B."
3. "Update the export."

### 2. Increase Explicitness

Cloud models infer context. Local models need it spelled out.

- **Bad**: "Use standard error handling."
- **Good**: "Wrap the database call in a try/catch block. Log the error to stderr."

---

## Setup Guide (Ollama)

### 1. Install & Pull

```bash
brew install ollama
ollama pull llama3
```

### 2. Connect to IDE

Most IDEs (VS Code, Cursor) allow you to point the API endpoint to `localhost:11434`.

### 3. The "System Prompt" Trick

Local models often forget instructions. Paste your **Delegation Contract** at the top of _every_ prompt, or use a custom Modelfile.

**Example Modelfile:**

```dockerfile
FROM llama3
SYSTEM "You are a coding assistant. You must follow the constraints provided in the prompt exactly. Do not be conversational."
```

---

## Visual: The Air Gap

```mermaid
flowchart LR
    User[Developer] -->|Prompt| Local[Local LLM (GPU)]
    Local -->|Code| Repo[Local Repo]

    subgraph Internet [The Internet]
        Cloud[OpenAI / Anthropic]
    end

    Local -.->|❌ No Connection| Cloud

    classDef safe fill:#E6F7FF,stroke:#1B75BB,color:#0F1F2E;
    class User,Local,Repo safe;
```

---

## Last Reviewed / Last Updated

- Last reviewed: 2025-12-20
- Version: 0.1.0

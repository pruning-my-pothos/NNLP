---
title: "Threat Model Lite"
archetype: "method"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "security", "risk", "threat-modeling", "method"]
last_reviewed: "2025-12-20"
---

# Threat Model Lite

:::info[Purpose]
Traditional threat modeling takes days. "Threat Model Lite" takes 10 minutes. It focuses exclusively on the unique risks introduced by AI components.
:::

## Overview

AI introduces new attack vectors that traditional security reviews often miss:

- **Prompt Injection**: Users tricking the model into ignoring instructions.
- **Hallucination**: The model confidently inventing libraries or facts.
- **Data Leakage**: The model repeating sensitive data from its context window.

You cannot patch these risks later. You must design for them.

---

## The 3-Question Assessment

Before shipping any AI-assisted feature, answer these three questions:

### 1. What context does the AI have?

Does it see PII? Secrets? Internal docs?
_Risk: Data Leakage._

### 2. What can the AI output touch?

Does it write SQL? HTML? Shell commands?
_Risk: Injection / Execution._

### 3. Who controls the input?

Is the prompt fixed by us, or can users type into it?
_Risk: Prompt Injection / Jailbreaking._

---

## Visual: Risk Flow

```mermaid
flowchart LR
    User[User Input] -->|Injection?| AI[AI Model]
    Context[Private Data] -->|Leakage?| AI
    AI -->|Hallucination?| Output[System Action]

    classDef risk fill:#FFE6E6,stroke:#D32F2F,color:#0F1F2E;
    class User,Context,Output risk;
    class AI fill:#E6F7FF,stroke:#1B75BB,color:#0F1F2E;
```

---

## Common AI Threats & Mitigations

| Threat                    | Description                         | Mitigation                                                    |
| :------------------------ | :---------------------------------- | :------------------------------------------------------------ |
| **Prompt Injection**      | User overrides system instructions. | Treat all AI output as untrusted user input. Sanitize it.     |
| **Hallucinated Packages** | AI suggests a malicious package.    | Verify existence and reputation of all dependencies manually. |
| **Insecure Code**         | AI writes vulnerable SQL/Regex.     | Use static analysis (SAST) on generated code.                 |

:::danger[The Golden Rule]
Never allow an LLM to execute actions (delete, buy, ban) without a human confirmation step or strict deterministic validation.
:::

---

## When to Use This

- **Every time** you add an AI feature to production.
- **Every time** you change the data access level of an AI tool.
- **Every time** you switch models (safety profiles vary).

---

## Checklist: Is It Safe?

- [ ] Inputs are sanitized before reaching the prompt.
- [ ] Outputs are validated/sanitized before execution.
- [ ] The model has the minimum necessary context (Principle of Least Privilege).
- [ ] A human is in the loop for high-stakes actions.

---

## Next Step

Apply this method using the template:
**`docs/09-templates/threat-model-lite-template.md`**

---

## Last Reviewed / Last Updated

- Last reviewed: 2025-12-20
- Version: 0.1.0

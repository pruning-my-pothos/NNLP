---
title: "Deterministic Settings for LLM Output"
archetype: "code-snippet"
status: "active"
owner: "NNLP"
maintainer: "NNLP"
version: "1.0.0"
tags: ["prompt-engineering", "determinism", "parameters", "reliability"]
last_reviewed: "2025-12-31"
---

# Deterministic Settings for LLM Output

Large Language Models are inherently probabilistic, meaning they can generate different outputs for the same input. While this creativity is valuable, for many applications (e.g., code generation, data extraction, specific task automation), you often need predictable, consistent, or even exactly reproducible results. This guide explains how to control an LLM's randomness using key generation parameters.

:::info[The Goal: Predictable Results]
The objective is to minimize variability in the model's output, making your application's behavior more stable, testable, and reliable.
:::

---

## Key Parameters for Controlling Determinism

Most LLM APIs expose parameters that allow you to fine-tune the randomness of the generation process.

### 1. `temperature` (Randomness Control)

-   **What it does**: Controls the "creativity" or "randomness" of the model's output. Higher values (e.g., `0.7` - `1.0`) lead to more diverse and creative outputs, while lower values (e.g., `0.0` - `0.3`) make the model more deterministic and focused on the most probable tokens.
-   **Recommendation for Determinism**: Set `temperature` to `0.0` or a very low value (e.g., `0.1`). This instructs the model to always pick the most probable next token.

### 2. `top_p` (Nucleus Sampling)

-   **What it does**: Controls the "breadth" of the model's sampling pool. The model only considers tokens whose cumulative probability sum up to `top_p`. For example, `top_p=0.9` means it will consider the smallest set of tokens whose sum of probabilities is 90%.
-   **Recommendation for Determinism**: Use a low `top_p` value (e.g., `0.1` or `0.05`). This restricts the model's choices to only the very highest probability tokens, reducing variability.

### 3. `top_k` (Top-K Sampling)

-   **What it does**: Controls the "number" of choices the model considers. The model samples from the `top_k` most likely next tokens.
-   **Recommendation for Determinism**: Use a low `top_k` value (e.g., `1` or `5`). Setting `top_k=1` means the model will always pick the single most probable token, making it very deterministic.

### 4. `seed` (Reproducibility)

-   **What it does**: Provides a fixed "seed" to the pseudo-random number generator used by the LLM. If all other parameters (`temperature`, `top_p`, `top_k`) are also fixed, using a consistent `seed` can make outputs exactly reproducible across multiple identical API calls.
-   **Recommendation for Determinism**: Always set a `seed` value when you need reproducible results, especially for testing, debugging, or critical applications.

---

## Python Example: Deterministic Call (OpenAI SDK)

```python
# pip install openai
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ["OPENAI_API_KEY"])

def ask(prompt: str) -> str:
    resp = client.chat.completions.create(
        model="gpt-4o-mini",
        temperature=0.0,   # deterministic
        top_p=0.1,
        max_tokens=120,
        seed=42,           # reproducible
        messages=[
            {"role": "system", "content": "Answer factually and concisely."},
            {"role": "user", "content": prompt},
        ],
    )
    return resp.choices[0].message.content

print(ask("What is the capital of France?"))
print(ask("List three HTTP methods."))
```

---

:::warning[The Creativity-Determinism Trade-off]
While highly deterministic settings are great for reliability, they can stifle the model's creativity and ability to explore novel solutions. For tasks requiring brainstorming, creative writing, or diverse outputs, you'll want to use higher `temperature` values and potentially remove `seed`.
:::

:::tip[Testing and Debugging]
Always use deterministic settings (fixed `temperature=0.0`, `seed`) during development and testing. This makes it much easier to reproduce bugs, debug prompt changes, and run automated evaluations, as the model's responses will be consistent.
:::

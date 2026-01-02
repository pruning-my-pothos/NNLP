---
title: "Bias and Fairness"
archetype: "standard"
status: "draft"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["genai-llm"]
last_reviewed: "2025-12-20"
---
# Bias and Fairness

:::info[Value Proposition]
Bias shows up in data, prompts, and outputs. A lightweight checklist reduces harm and reputational risk.
:::

## What to Watch For

- **Stereotyping**: Role, demographic, or location biases in generated text or decisions.
- **Representation gaps**: Underrepresented groups missing in training or retrieval data.
- **Feedback loops**: Using model output to retrain without checks.

## Minimal Checklist

- **Define sensitive attributes**: Which fields must never drive decisions? (e.g., gender, race, health, religion).
- **Constrain prompts**: Specify neutrality and scope; avoid loaded descriptors.
- **Grounding**: Use retrieval from vetted sources instead of open-ended generation for facts.
- **Red-team queries**: Probe for biased phrasing and exclusions.
- **Human review**: Required for decisions impacting people (hiring, lending, moderation).

## Mitigations

- Strip sensitive fields before passing to the model when not needed.
- Use **few-shot counterexamples** to show desired neutral behavior.
- Add **post-filters** to remove disallowed terms or slurs.
- Log and escalate bias incidents; update prompts/policies accordingly.

## Next Step

See `data-boundaries.md` for input controls and `red-teaming-guide.md` for structured probes.

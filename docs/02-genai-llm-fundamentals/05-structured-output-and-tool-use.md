---
title: "Structured Output and Tool Use"
archetype: "foundation"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["nnlp", "structured-output", "tools", "schema", "apis"]
last_reviewed: "2025-12-20"
---

# Structured Output and Tool Use

:::info[Purpose]
Show how to get reliable, schema-bound outputs and when to invoke tools/APIs safely.
:::

## Structured Output

- Use **explicit schemas** (JSON, tables, key-value) and examples.
- Require **field-level constraints** (types, ranges, enums) and refusals on uncertainty.
- Validate outputs (JSON parsing, schema checks) before use; fail closed on errors.

## Tool Use

- Define **tooling contracts**: allowed actions, parameters, and side-effect boundaries.
- Provide **minimal context** per call; avoid free-form tool access.
- Log tool calls and responses for auditability.

## Anti-Patterns

- Free-form answers when a schema is required.
- Letting the model invent fields or call tools without guardrails.
- Consuming unvalidated structured output.

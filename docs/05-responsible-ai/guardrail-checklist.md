---
title: "Guardrail Checklist (Operational)"
archetype: "guardrail"
status: "active"
owner: "Shailesh (Shaily)"
maintainer: "Shailesh (Shaily)"
version: "0.1.0"
tags: ["genai-llm", "guardrails", "safety", "governance"]
last_reviewed: "2025-12-28"
---

# Guardrail Checklist (Operational)

:::info[Value Proposition]
A compact, repeatable checklist to keep AI-assisted work safe, auditable, and policy-aligned. Use it before you ship or enable write-access.
:::

## Pre-Flight (Inputs)

- Data boundaries defined; sensitive fields stripped/masked; `.env` in use.
- Model + endpoint approved (license, region, retention reviewed).
- Prompts include constraints: scope, tone, refusal rules, no open-web unless approved.
- Context from vetted sources only; retrieval index is documented and current.

## In-Flight (Generation)

- Deterministic for structure: low temp, stop tokens, schema validation for JSON/code.
- Logging on: prompts/outputs redacted; model/version recorded.
- Tool use constrained: allowlists for commands/APIs; token/time budgets set.
- Automated checks: lint/static analysis/tests run on AI-generated code.

## Post-Flight (Review & Release)

- Human review complete (owner named); diff + tests inspected.
- Safety review: PII/secret scan, license scan (if new deps), security checklist for code changes.
- RAG outputs: citations/grounding present; hallucination risk assessed/refusals allowed.
- Rollback plan and monitoring in place if shipping to users.

## Quick Actions When Risk Is High

- Downshift to smaller/local model; narrow context.
- Gating: approvals before write-access; run read-only dry runs first.
- Redundancy: second-model check or heuristic filters on outputs.

## Quick Prompt Skeleton (Policy Reminder)

```
You are assisting with <task>. Respect these rules:
- Do not include secrets, PII, or internal ticket IDs.
- If context is insufficient, say "I don’t have enough context" and stop.
- Follow the provided schema exactly; no extra fields.
- Cite sources for any factual claims using [file:line] when available.
```

## CI / Automation Hooks

- Fail build if: schema validation fails, secret scan fails, or required checklist items are unchecked.
- Record model + version in build metadata.
- Keep an audit log (redacted) for prompts/outputs tied to the change.

## RACI (suggested)

- **Owner (O)**: Human who merges/ships.
- **Reviewer (R)**: Performs safety/PII/license checks.
- **Observer (I)**: Audit/log consumer (compliance/lead).

## Next Step

- Pair with `guardrails-index.md` for deeper policy artifacts.
- Add this checklist to your CI or PR template so builds fail without attestations.

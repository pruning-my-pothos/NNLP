# Documentation Restructure Plan

This plan outlines the steps to reorganize the `docs` directory, fix the website navigation, and repair all broken links. The goal is to create a clean, logical, and user-friendly structure for the "GenAI & LLM Handbook."

## 1. Proposed `docs` Directory Structure

The current `docs` directory contains a mix of old and new content with conflicting numbering. I will create the following structure, which separates the "GenAI & LLM Handbook" from the foundational NLP content.

```
docs/
├── 00-handbook-introduction/       (From current /00-introduction)
├── 01-handbook-core-method/      (From current /06-genai-project-lifecycle-and-method)
├── 02-execution-patterns/          (From current /04-execution-patterns)
├── 03-professional-scenarios/      (From current /05-professional-scenarios)
├── 04-responsible-ai/              (From current /07-responsible-ai-and-governance)
├── 05-tooling-and-frameworks/      (From current /06-frameworks-and-tooling)
├── 06-templates/                   (From current /09-templates)
└── foundations/
    ├── 01-generative-ai-introduction/  (From current /04-generative-ai-introduction)
    ├── 02-llm-deep-dive/               (From current /02-llm-deep-dive)
    ├── 03-nlp-basics/                  (From current /01-natural-language-processing)
    ├── 04-sequential-models/           (From current /02-sequential-models)
    └── 05-attention-and-transformers/  (From current /03-attention-and-transformers)
```

## 2. Update Website Navigation (`sidebars.js`)

I will rewrite `website/sidebars.js` to reflect the new structure. The sidebar will be organized logically, starting with the Handbook and providing a clear "Foundations" section for those who want to go deeper.

**Proposed Sidebar Structure:**

1.  **GenAI & LLM Handbook** (Main Category)
    *   Introduction
    *   Core Method (The Loop)
    *   Execution Patterns
    *   Professional Scenarios
    *   Responsible AI
    *   Tooling & Frameworks
    *   Templates
2.  **Foundations** (Collapsible Category)
    *   Generative AI Introduction
    *   LLM Deep Dive
    *   NLP Basics
    *   Sequential Models
    *   Attention & Transformers
3.  Top-level links (Changelog, etc.)

## 3. Fix Broken Links

I will perform a project-wide search and replace to fix all broken internal links in markdown files and configuration files, including:
- Links within the `docs/**/*.md` files.
- The GitHub repository link in `website/docusaurus.config.ts`.
- Any broken paths in `AGENTS.md` and other root-level documentation.

By following this plan, we can fully realize the potential of your excellent content.
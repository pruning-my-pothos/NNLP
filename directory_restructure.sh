#!/bin/bash

# This script restructures the /docs directory according to the plan in docs_restructure_plan.md

# Exit on any error
set -e

# Define base docs directory
DOCS_DIR="docs"

# 1. Create the new directory structure
echo "Creating new directory structure..."
mkdir -p "$DOCS_DIR/00-handbook-introduction"
mkdir -p "$DOCS_DIR/01-handbook-method"
mkdir -p "$DOCS_DIR/02-execution-patterns"
mkdir -p "$DOCS_DIR/03-professional-scenarios"
mkdir -p "$DOCS_DIR/05-responsible-ai"
mkdir -p "$DOCS_DIR/04-tooling-and-frameworks"
mkdir -p "$DOCS_DIR/06-templates"
mkdir -p "$DOCS_DIR/foundations"
mkdir -p "$DOCS_DIR/foundations/01-generative-ai-introduction"
mkdir -p "$DOCS_DIR/foundations/02-llm-deep-dive"
mkdir -p "$DOCS_DIR/foundations/03-nlp-basics"
mkdir -p "$DOCS_DIR/foundations/04-sequential-models"
mkdir -p "$DOCS_DIR/foundations/05-attention-and-transformers"

# 2. Move files from old directories to new directories
# Use 'shopt -s dotglob' to ensure hidden files (like .gitkeep) are also moved.
shopt -s dotglob

echo "Moving files..."
# Move contents, then the directory will be removed later.
mv "$DOCS_DIR"/00-introduction/* "$DOCS_DIR/00-handbook-introduction/"
mv "$DOCS_DIR"/06-genai-project-lifecycle-and-method/* "$DOCS_DIR/01-handbook-method/"
mv "$DOCS_DIR"/04-execution-patterns/* "$DOCS_DIR/02-execution-patterns/"
mv "$DOCS_DIR"/05-professional-scenarios/* "$DOCS_DIR/03-professional-scenarios/"
mv "$DOCS_DIR"/07-responsible-ai-and-governance/* "$DOCS_DIR/05-responsible-ai/"
mv "$DOCS_DIR"/06-frameworks-and-tooling/* "$DOCS_DIR/04-tooling-and-frameworks/"
mv "$DOCS_DIR"/09-templates/* "$DOCS_DIR/06-templates/"
mv "$DOCS_DIR"/04-generative-ai-introduction/* "$DOCS_DIR/foundations/01-generative-ai-introduction/"
mv "$DOCS_DIR"/05-large-language-models-deep-dive/* "$DOCS_DIR/foundations/02-llm-deep-dive/"
mv "$DOCS_DIR"/01-natural-language-processing/* "$DOCS_DIR/foundations/03-nlp-basics/"
mv "$DOCS_DIR"/02-sequential-models/* "$DOCS_DIR/foundations/04-sequential-models/"
mv "$DOCS_DIR"/03-attention-and-transformers/* "$DOCS_DIR/foundations/05-attention-and-transformers/"

# 3. Remove the old, now-empty directories
echo "Removing old directories..."
rm -rf "$DOCS_DIR/00-introduction"
rm -rf "$DOCS_DIR/01-natural-language-processing"
rm -rf "$DOCS_DIR/02-introduction-to-generative-ai"
rm -rf "$DOCS_DIR/02-sequential-models"
rm -rf "$DOCS_DIR/03-attention-and-transformers"
rm -rf "$DOCS_DIR/03-introduction-to-large-language-models"
rm -rf "$DOCS_DIR/04-execution-patterns"
rm -rf "$DOCS_DIR/04-genai-project-lifecycle"
rm -rf "$DOCS_DIR/04-generative-ai-introduction"
rm -rf "$DOCS_DIR/05-large-language-models-deep-dive"
rm -rf "$DOCS_DIR/05-professional-scenarios"
rm -rf "$DOCS_DIR/05-responsible-ai"
rm -rf "$DOCS_DIR/06-execution-patterns"
rm -rf "$DOCS_DIR/06-frameworks-and-tooling"
rm -rf "$DOCS_DIR/06-genai-project-lifecycle-and-method"
rm -rf "$DOCS_DIR/07-professional-scenarios"
rm -rf "$DOCS_DIR/07-responsible-ai-and-governance"
rm -rf "$DOCS_DIR/08-frameworks-and-tooling"
rm -rf "$DOCS_DIR/09-templates"

echo "Directory restructuring complete."
shopt -u dotglob

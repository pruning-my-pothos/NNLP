#!/bin/bash

# This script moves files into the new directory structure.

# Exit on any error
set -e

# Define base docs directory
DOCS_DIR="docs"

# Use 'shopt -s dotglob' to ensure hidden files (like .gitkeep) are also moved.
shopt -s dotglob

echo "Moving files..."
# Move contents.
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

echo "File move complete."

shopt -u dotglob

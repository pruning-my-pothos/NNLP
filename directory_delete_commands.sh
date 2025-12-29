#!/bin/bash

# This script removes the old, now-empty directories.

# Exit on any error
set -e

# Define base docs directory
DOCS_DIR="docs"

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

echo "Old directories removed."

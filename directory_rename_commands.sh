#!/bin/bash

# This script prepares the /docs directory for restructuring.

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

echo "New directory structure created."
echo "Now, please run the move commands."

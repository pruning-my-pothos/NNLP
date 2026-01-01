SHELL := /bin/bash

.PHONY: check-node install dev build serve push status clean pages-build pages-serve pages-deploy

NODE_CHECK=node -e "const v=process.versions.node.split('.')[0]; if(+v<20){console.error('Node 20+ required. Found', process.version); process.exit(1);} else {console.log('Using Node', process.version);}"

# Install site deps
install:
	$(NODE_CHECK)
	cd website && npm ci

# Run dev server
dev:
	$(NODE_CHECK)
	cd website && npm run start

# Build static site
build:
	$(NODE_CHECK)
	cd website && npm run build

# Serve built site
serve:
	$(NODE_CHECK)
	cd website && npm run serve

# Build static site for GitHub Pages
pages-build:
	$(NODE_CHECK)
	cd website && npm run build

# Serve the built site locally (after pages-build)
pages-serve:
	$(NODE_CHECK)
	cd website && npm run serve

# Deploy to GitHub Pages via GitHub Actions (no local gh-pages branch needed)
pages-deploy:
	$(NODE_CHECK)
	cd website && npm run build
	@echo "Build finished. Push main to trigger the GitHub Pages workflow (see .github/workflows/pages.yml)."

# Show git status
status:
	@git status -sb

# Push current branch safely (add, fetch, rebase, push)
push:
	@if [ -n "$$(git status --porcelain)" ]; then \
		echo "Working tree is dirty. Commit or stash before pushing."; \
		exit 1; \
	fi
	@if ! git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then \
		echo "No upstream set. Set it with: git branch --set-upstream-to origin/$$(git branch --show-current)"; exit 1; \
	fi
	git fetch --prune origin
	git rebase --rebase-merges @{u}
	git push origin $$(git branch --show-current)

# Clean docusaurus cache/build
clean:
	cd website && npm run clean

# Contributing Guide

Guidelines for contributing to `jarvis-copilot-engine`.

---

## Architecture Overview

This repository maintains modular specification files, platform adapters, and shell installation scripts:

```
├── AGENTS.md                  # Root configuration template for agents
├── SKILL.md                   # Open Skill 1.0 manifest
├── install.sh / uninstall.sh  # POSIX shell deployment & cleanup scripts
├── core/                      # Cognitive rules, security heuristics, & defect classes
└── adapters/                  # Tool-specific configuration guides & snippets
```

---

## Development & Local Testing

### Prerequisites
* POSIX-compliant shell (`bash` 3.2+ or `zsh`)
* `git` 2.0+

### Validation Checks
Run local sanity checks before submitting changes:

```bash
# 1. Verify shell script syntax
bash -n install.sh
bash -n uninstall.sh

# 2. Test installer & uninstaller in an isolated sandbox directory
mkdir -p .test_sandbox
./install.sh --target .test_sandbox --all
./uninstall.sh --target .test_sandbox --force
rmdir .test_sandbox

# 3. Check for broken relative links
# Ensure all referenced markdown files exist under core/ and adapters/
```

---

## Contribution Areas

### 1. Adding or Updating Adapters (`adapters/<tool>.md`)
When adding support for a new AI tool or IDE (e.g., Continue.dev, Aider, Zed):
* Document the default configuration path (e.g., `.continue/config.json`, `.aiderrules`).
* Provide both a modular inclusion snippet and a standalone drop-in method.
* Update `install.sh` and `uninstall.sh` to add the corresponding CLI flags.
* Add the adapter to the platform matrix in `README.md` and CI checks in `.github/workflows/ci.yml`.

### 2. Generalization Defect Classes (`core/generalization-engine.md`)
* Abstract concrete bugs into reusable defect patterns.
* Every entry must define:
  1. **Abstract Pattern:** The failure structure across modules or languages.
  2. **Systemic Invariant:** The programmatic assertion or test invariant that eliminates the failure class repo-wide.

### 3. Core Behavioral Vectors (`core/behavioral-vectors.md`)
* Focus on actionable prompt engineering directives rather than cosmetic prose.
* Keep instructions deterministic, testable, and concise.

---

## Commit Guidelines

We use [Conventional Commits](https://www.conventionalcommits.org/):

* `feat:` New adapters, cognitive modules, or installer capabilities
* `fix:` Bug fixes in scripts, typos, or path resolutions
* `docs:` Documentation improvements and README updates
* `refactor:` Code or protocol restructuring without behavior changes
* `test:` Test scripts and CI workflow modifications
* `chore:` Maintenance tasks and metadata updates

> Do not include automated co-author trailers (`Co-authored-by: ...`), tool signatures, or AI generation footers in commit messages or pull requests.

---

## Pull Request Workflow

1. Fork the repository and create a branch from `main`:
   ```bash
   git checkout -b feat/add-aider-adapter
   ```
2. Make minimal, focused changes.
3. Validate scripts locally (`bash -n` and sandbox test).
4. Push your branch and open a Pull Request using the repository's PR template.
5. Ensure CI validation passes.

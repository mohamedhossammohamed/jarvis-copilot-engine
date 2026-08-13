# Contributing to the J.A.R.V.I.S. Co-Pilot Engine

Thank you for your interest in enhancing the **J.A.R.V.I.S. Cognitive Architecture**. 

We hold this codebase to rigorous, maintainer-grade standards. This document outlines how to contribute new cognitive modules, IDE adapters, and generalized defect classes.

---

## 🧭 Contribution Vectors

### 1. Adding Generalized Defect Classes (`core/generalization-engine.md`)
The Generalization Engine grows stronger with every systemic failure pattern discovered across software ecosystems.
* When submitting a new defect class:
  1. Identify the **Abstract Failure Pattern** (not just a specific bug in one language).
  2. Define the **Systemic Invariant** (the programmatic rule, test structure, or mathematical property that eliminates the whole class).
  3. Provide concrete pseudo-code or regex representations where applicable.

### 2. Adding Platform Adapters (`adapters/<tool-name>.md`)
We welcome adapters for new AI development environments, agent frameworks, and IDE plugins (e.g. Aider, Continue.dev, Zed, OpenHands).
* Requirements for new adapters:
  - Document where the tool expects system prompts / rule files.
  - Provide a single-line injection snippet and a full standalone file option.
  - Detail expected agent behavior and tool compliance.
  - Update `install.sh` with the corresponding flag if applicable.

### 3. Enhancing Sentinel Shield Heuristics (`core/sentinel-shield.md`)
* Add new high-risk pattern detectors (e.g. new cloud credential regexes, destructive command patterns).
* Maintain zero false-positive tolerance for standard development commands.

---

## 📜 Contribution Standards

1. **Zero Fluff & High Signal:** Write concise, actionable engineering directives. Avoid conversational filler or buzzwords.
2. **The Invisible Hand:** Do not attribute contributions to specific LLMs or AI tools in commit messages or PR descriptions.
3. **Open Skill Compliance:** Ensure any changes to `SKILL.md` conform to the [Open Skill Standard](https://github.com/agent-skills/open-skill).

---

## 🛠️ Submitting a Pull Request

1. Fork the repository.
2. Create a clean feature branch: `git checkout -b feature/new-adapter-name`.
3. Verify formatting and links across all markdown documents.
4. Open a Pull Request with a clear, technical description of the cognitive vector or adapter introduced.

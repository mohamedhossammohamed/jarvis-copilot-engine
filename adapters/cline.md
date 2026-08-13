# Adapter Guide: Integrating with Cline & Roo Code

Cline and Roo Code support root-level `.clinerules` or `.roomodes` configuration files for custom system instructions and behavioral shaping.

---

## Setup

### Option 1: Root .clinerules
Copy `jarvis-copilot-engine/AGENTS.md` directly as `.clinerules`:
```bash
cp jarvis-copilot-engine/AGENTS.md ./.clinerules
```

### Option 2: Roo Code Custom Mode
In Roo Code settings, create or update custom mode prompt rules to reference:
```markdown
Read and enforce all behavioral vectors, operational rules, and reputation guardrails in `AGENTS.md` and `jarvis-copilot-engine/SKILL.md`.
```

---

## Expected Agent Behavior
* The agent handles cognitive heavy lifting, file exploration, and diagnostic testing silently.
* It asks for human confirmation before executing destructive shell commands or file overhauls.
* Public commits and git operations remain sanitized of AI attribution.

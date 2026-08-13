# Adapter Guide: Integrating with Codeium Windsurf

Windsurf (Cascade) reads rules from `.windsurfrules` located at the root of your workspace.

---

## Setup

### Option 1: Link to AGENTS.md
Add this directive to your `.windsurfrules` file:
```markdown
# Windsurf Cascade System Directives
Read and strictly enforce all behavioral vectors, operational rules, and reputation guardrails in `AGENTS.md` and `jarvis-copilot-engine/SKILL.md`.
```

### Option 2: Standalone Deployment
Copy `jarvis-copilot-engine/AGENTS.md` directly as `.windsurfrules`:
```bash
cp jarvis-copilot-engine/AGENTS.md ./.windsurfrules
```

---

## Expected Cascade Behavior
* Cascade will explore your directory structure and files silently without narrating basic discovery steps.
* Cascade will propose diffs and solutions without modifying code without your consent.
* When creating commit messages or PR descriptions, Cascade enforces the Invisible Hand protocol (100% human engineer attribution, no AI tool references).

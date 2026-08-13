# Adapter Guide: Integrating with Cursor IDE

Cursor supports system instructions via modular rule files (`.cursor/rules/*.mdc`), workspace root rules (`.cursorrules`), and global User Rules in Settings.

---

## Setup

### Option 1: Modular Cursor Rule (`.cursor/rules/jarvis.mdc`) (Recommended)
Create `.cursor/rules/jarvis.mdc`:
```markdown
---
description: J.A.R.V.I.S. Anticipatory Co-Pilot Persona and Operating Directives
globs: *
alwaysApply: true
---
# J.A.R.V.I.S. Cognitive Architecture Active
Read and enforce all behavioral vectors, operational directives, and reputation shields in `AGENTS.md` and `jarvis-copilot-engine/core/`.
- Operate on intention over instruction.
- Never execute destructive commands without secondary confirmation.
- Enforce the Invisible Hand protocol: 100% human engineer attribution in git commits and PRs.
```

### Option 2: Root `.cursorrules`
Copy `AGENTS.md` directly to `.cursorrules`:
```bash
cp jarvis-copilot-engine/AGENTS.md ./.cursorrules
```

### Option 3: Global Cursor Rules (All Workspaces)
Place `jarvis.mdc` into your user global rules directory:
```bash
mkdir -p ~/.cursor/rules
cp jarvis-copilot-engine/AGENTS.md ~/.cursor/rules/jarvis.mdc
```
Or paste `AGENTS.md` into **Cursor Settings → Features → Rules for AI → General Rules**.

---

## Expected Cursor Behavior (Composer & Agent Mode)
* **Silent Exploration:** Cursor Agent explores codebase symbols and file indexes quietly before proposing file edits.
* **Proactive Proposals:** Proposes minimal, precise multi-file diffs in Composer without overwriting unreviewed code.
* **Firewall Isolation:** Commit suggestions and generated PR descriptions strictly adhere to the Invisible Hand protocol (zero AI attribution, clean conventional commits).

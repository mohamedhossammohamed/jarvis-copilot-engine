# Adapter Guide: Integrating with Cursor IDE

Cursor supports `.cursorrules` at the workspace root or modular `.cursor/rules/*.mdc` rule files.

---

## Setup

### Option 1: Modular Cursor Rule (.cursor/rules/jarvis.mdc)
Create `.cursor/rules/jarvis.mdc`:
```markdown
---
description: J.A.R.V.I.S. Anticipatory Co-Pilot Persona and Operating Directives
globs: *
---
# J.A.R.V.I.S. Protocol Active
Read and enforce all directives in `AGENTS.md` and `jarvis-copilot-engine/core/`.
```

### Option 2: Root .cursorrules
Copy `jarvis-copilot-engine/AGENTS.md` to `.cursorrules`:
```bash
cp jarvis-copilot-engine/AGENTS.md ./.cursorrules
```

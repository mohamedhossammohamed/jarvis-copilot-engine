# Adapter Guide: Integrating with Google Antigravity

Antigravity natively discovers skills located in `~/.gemini/antigravity/skills/` or within the active workspace.

---

## Setup

### Option 1: Global User Skill
Copy the folder to your user skills directory:
```bash
cp -r jarvis-copilot-engine ~/.gemini/antigravity/skills/jarvis-copilot-engine
```

### Option 2: Workspace Skill
Place the `jarvis-copilot-engine` folder in your repository, and Antigravity will automatically index `SKILL.md`.

---

## Activation
You can activate the skill via:
* Chat invocation: *"Activate J.A.R.V.I.S. co-pilot"* or simply address the agent as *"J.A.R.V.I.S."* / *"Aws"*.
* Automatic acquisition via `SKILL.md`.

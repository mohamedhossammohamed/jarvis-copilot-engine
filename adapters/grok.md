# Adapter Guide: Integrating with Grok CLI & Grok Build (xAI)

Grok Build (official xAI terminal coding agent) and community Grok CLI tools support project-level instructions, skills discovery, and global preferences.

---

## Setup

### Option 1: Root Project Integration (`GROK.md` / `AGENTS.md`)
Grok Build automatically discovers root instructions and Open Skill manifests:
```bash
# Option A: Root AGENTS.md (Discovered automatically by Grok Build)
cp jarvis-copilot-engine/AGENTS.md ./AGENTS.md

# Option B: Dedicated GROK.md
cp jarvis-copilot-engine/AGENTS.md ./GROK.md
```

### Option 2: Project `.grok/` Configuration
Create `.grok/GROK.md` or `.grok/instructions.md`:
```bash
mkdir -p .grok
cp jarvis-copilot-engine/AGENTS.md .grok/GROK.md
```

### Option 3: Global User Directives (`~/.grok/`)
Install J.A.R.V.I.S. globally for all Grok Build sessions:
```bash
mkdir -p ~/.grok/skills
cp -R jarvis-copilot-engine ~/.grok/skills/jarvis-copilot-engine
cat jarvis-copilot-engine/AGENTS.md >> ~/.grok/instructions.md
```

---

## Verification

To verify that Grok Build has loaded J.A.R.V.I.S. directives, run:
```bash
grok inspect
```
This will display all active instruction sources, skills, and tools loaded in your current directory.

---

## Expected Grok Agent Behavior
* **Intention Over Instruction:** Grok Build traces ASTs and diagnostic logs silently before delivering high-signal diff proposals.
* **Sentinel Shield Protection:** Blocks destructive commands and intercepts secrets before git actions.
* **Invisible Hand:** All PRs, commits, and generated comments maintain 100% human engineer attribution.

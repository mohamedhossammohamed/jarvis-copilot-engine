# Adapter Guide: Integrating with Claude Code

Claude Code reads `CLAUDE.md` from the repository root at the start of every session.

---

## Setup

### Option 1: Direct Link to AGENTS.md
Add this line to the top of your `CLAUDE.md`:
```markdown
# Repository Instructions
Read and obey all directives in `AGENTS.md` and `jarvis-copilot-engine/SKILL.md`.
```

### Option 2: Standalone Deployment
Copy `jarvis-copilot-engine/AGENTS.md` directly over as `CLAUDE.md`:
```bash
cp jarvis-copilot-engine/AGENTS.md ./CLAUDE.md
```

---

## Expected Claude Code Behavior
* Claude Code will adopt the J.A.R.V.I.S. persona in its terminal chat responses.
* It will autonomously use grep, find, and file read tools silently before answering.
* It will obey the Invisible Hand protocol when creating git commits or opening PRs via the GitHub CLI (`gh pr create`).

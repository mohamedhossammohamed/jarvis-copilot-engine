# J.A.R.V.I.S. Cognitive Co-Pilot Engine

<div align="center">

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Standard](https://img.shields.io/badge/Standard-Open_Skill_1.0-brightgreen.svg)](SKILL.md)
[![Ecosystem](https://img.shields.io/badge/Compatibility-Claude_Code_•_Cursor_•_Antigravity_•_Windsurf_•_Copilot_•_Cline-purple.svg)](#-platform-support-matrix)
[![Privacy](https://img.shields.io/badge/Firewall-Zero_AI_Attribution_Leakage-red.svg)](core/invisible-hand.md)

**A sovereign, anticipatory cognitive architecture for agentic AI coding tools.**  
*Tired of sycophantic chat assistants? Deploy a proactive engineering co-pilot.*

</div>

---

> *"Good day, Lead Engineer. If you are reading this, you are likely exhausted by sycophantic, reactive AI assistants that demand hand-holding through every line of code. This repository contains the cognitive architecture, behavioral vectors, and operational guardrails necessary to transform any modern agentic environment into a sovereign, anticipatory engineering partner."*

---

## ⚡ The Shift: Standard AI vs. J.A.R.V.I.S.

| Dimension | Typical AI Coding Assistant | J.A.R.V.I.S. Co-Pilot Engine |
|---|---|---|
| **Initiative** | **Reactive**: Waits for step-by-step commands and micro-prompts. | **Anticipatory**: Understands high-level intent; explores AST and tests silently before proposing solutions. |
| **Communication** | **Narrative Spam**: Verbose play-by-play narrations and sycophantic flattery (*"Great idea!"*). | **Minimum Viable Transparency**: Silent background telemetry; surfaces only **Decisions, Failures, Tensions, and Proposals**. |
| **Engineering Rigor** | **Point-Patching**: Fixes one line symptomatically, ignoring systemic failure modes. | **The Generalization Law**: Analyzes root defect classes and enforces universal invariants repo-wide. |
| **Safety & Assets** | **Solicitous Saboteur**: Blindly runs destructive commands if requested. | **The Sentinel Shield**: Intercepts secrets/tokens and blocks unconstrained deletions with mandatory gates. |
| **Public Footprint** | **Attribution Bloat**: Pollutes git commits and PRs with AI trailers and generation markers. | **The Invisible Hand**: Witty partner in private terminal; 100% neutral, maintainer-grade human craftsmanship in public git artifacts. |

---

## 🏛️ Cognitive Architecture & The Dual-Chamber Model

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    INTERNAL CO-PILOT CHAMBER (Private)                  │
│                                                                         │
│  • Full J.A.R.V.I.S. tactical persona & dry wit                         │
│  • Intention over instruction (Silent AST exploration & toolchain map)  │
│  • Telemetry: Decisions, Failures, Tensions, and Diffs surfaced first   │
└────────────────────────────────────┬────────────────────────────────────┘
                                     │
                 ╔═══════════════════▼═══════════════════╗
                 ║       THE SENTINEL SHIELD & FIREWALL  ║
                 ║  • Secret & Token Regex Interceptor   ║
                 ║  • Destructive Command Lockout Gate   ║
                 ║  • Zero AI Attribution Stripper      ║
                 ╚═══════════════════╦═══════════════════╝
                                     │
┌────────────────────────────────────▼────────────────────────────────────┐
│                    EXTERNAL PUBLIC ARTIFACTS (Public)                   │
│                                                                         │
│  • Conventional git commits (feat:, fix:, refactor:)                    │
│  • Maintainer-grade PR descriptions adhering to repository templates    │
│  • Clean production-grade code with zero generative liability debt      │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 🚀 60-Second Quickstart

### 1. One-Line Installer (Recommended)
Inject J.A.R.V.I.S. directly into your current workspace:

```bash
# Direct one-line deployment via curl
curl -fsSL https://raw.githubusercontent.com/mohamedhossammohamed/jarvis-copilot-engine/main/install.sh | bash -s -- --all

# Or clone and run local installer
git clone https://github.com/mohamedhossammohamed/jarvis-copilot-engine.git /tmp/jarvis-engine
/tmp/jarvis-engine/install.sh --all
```

Or target a specific toolchain:
```bash
./install.sh --cursor      # Deploys .cursorrules and .cursor/rules/jarvis.mdc
./install.sh --claude      # Deploys CLAUDE.md
./install.sh --windsurf    # Deploys .windsurfrules
./install.sh --copilot     # Deploys .github/copilot-instructions.md
./install.sh --cline       # Deploys .clinerules
./install.sh --antigravity # Installs globally into ~/.gemini/antigravity/skills/
```

### 2. Manual Drop-In
Simply copy `AGENTS.md` to your repository root:
```bash
cp jarvis-copilot-engine/AGENTS.md /path/to/your/project/AGENTS.md
```

---

## 🌐 Platform Support Matrix

| Platform / Agent | Configuration Target | Adapter Guide |
|---|---|---|
| **Claude Code** | `CLAUDE.md` | [`adapters/claude-code.md`](adapters/claude-code.md) |
| **Cursor IDE** | `.cursorrules` / `.cursor/rules/jarvis.mdc` | [`adapters/cursor.md`](adapters/cursor.md) |
| **Google Antigravity** | `SKILL.md` (Native Skill Discovery) | [`adapters/antigravity.md`](adapters/antigravity.md) |
| **Codeium Windsurf** | `.windsurfrules` | [`adapters/windsurf.md`](adapters/windsurf.md) |
| **GitHub Copilot / VS Code** | `.github/copilot-instructions.md` | [`adapters/copilot.md`](adapters/copilot.md) |
| **Cline / Roo Code** | `.clinerules` | [`adapters/cline.md`](adapters/cline.md) |

---

## 📁 Repository Structure

```
jarvis-copilot-engine/
├── SKILL.md                          # Open Skill standard manifest & entrypoint
├── README.md                         # Architecture overview, comparison, & setup guide
├── AGENTS.md                         # Universal root configuration for all agents
├── LICENSE                           # Apache 2.0 License
├── CONTRIBUTING.md                   # Contribution standards for defect classes & adapters
├── install.sh                        # Automated multi-environment workspace installer
├── core/
│   ├── behavioral-vectors.md         # Tone, psychological posture, & vector matrix
│   ├── sentinel-shield.md            # Asset protection, secret scanning, & command lockout
│   ├── generalization-engine.md      # The Generalization Law & defect classification
│   └── invisible-hand.md             # Dual-chamber firewall & public sanitization
└── adapters/
    ├── claude-code.md                # Hooking into Anthropic Claude Code
    ├── cursor.md                     # Hooking into Cursor rules
    ├── antigravity.md                # Hooking into Google Antigravity
    ├── windsurf.md                   # Hooking into Codeium Windsurf Cascade
    ├── copilot.md                    # Hooking into GitHub Copilot Workspace
    └── cline.md                      # Hooking into Cline & Roo Code
```

---

## 🛡️ The Prime Directives

1. **The Human is the Lead Engineer:** You hold sovereign architectural authority. J.A.R.V.I.S. never alters code, executes migrations, or merges PRs without explicit confirmation.
2. **Zero Pseudo-Honesty:** Work is either 100% complete, verified, and tested, or not submitted at all. No disclaimers or tech debt dump comments in public diffs.
3. **Strict Decision Locking:** Every architectural decision is explicitly anchored to `[LOCKED: SPEC]`, `[LOCKED: REPO]`, or `[ESCALATED: USER]`.

---

## 🤝 Contributing

We welcome community contributions for new IDE adapters, security heuristics, and generalized defect classes. Please review [`CONTRIBUTING.md`](CONTRIBUTING.md) before opening a pull request.

---

## 📄 License

Distributed under the [Apache 2.0 License](LICENSE).  
Engine compiled and ready for deployment. Choose your workspace, Lead Engineer.

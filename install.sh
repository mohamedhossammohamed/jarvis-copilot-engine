#!/usr/bin/env bash
# ==============================================================================
# J.A.R.V.I.S. Cognitive Co-Pilot Engine — Automated Workspace Installer
# ==============================================================================
# Installs J.A.R.V.I.S. cognitive architecture into any target repository
# or agent skill directory.
#
# Usage:
#   ./install.sh [OPTIONS]
#   curl -fsSL https://raw.githubusercontent.com/mohamedhossammohamed/jarvis-copilot-engine/main/install.sh | bash -s -- [OPTIONS]
#
# Options:
#   --target <dir>     Target repository directory (default: current directory)
#   --all              Install configuration for all supported tools
#   --cursor           Install for Cursor IDE (.cursorrules & .cursor/rules/)
#   --claude           Install for Claude Code (CLAUDE.md)
#   --windsurf         Install for Codeium Windsurf (.windsurfrules)
#   --copilot          Install for GitHub Copilot (.github/copilot-instructions.md)
#   --cline            Install for Cline / Roo Code (.clinerules)
#   --antigravity      Install globally as an Antigravity User Skill (~/.gemini/antigravity/skills/)
#   --help, -h         Display this help message
# ==============================================================================

set -e

# Color definitions
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Determine script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"
TARGET_DIR="$(pwd)"

print_banner() {
    echo -e "${CYAN}${BOLD}"
    echo "  ╔════════════════════════════════════════════════════════════════╗"
    echo "  ║      J.A.R.V.I.S. CO-PILOT ENGINE — WORKSPACE INSTALLER        ║"
    echo "  ╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_help() {
    print_banner
    echo -e "${BOLD}Usage:${NC} ./install.sh [options]"
    echo ""
    echo -e "${BOLD}Options:${NC}"
    echo "  --target <path>    Specify target repository path (default: .)"
    echo "  --all              Inject configuration for all supported IDEs/agents"
    echo "  --cursor           Inject Cursor rules (.cursorrules & .cursor/rules/)"
    echo "  --claude           Inject Claude Code rules (CLAUDE.md)"
    echo "  --windsurf         Inject Windsurf rules (.windsurfrules)"
    echo "  --copilot          Inject GitHub Copilot rules (.github/copilot-instructions.md)"
    echo "  --cline            Inject Cline rules (.clinerules)"
    echo "  --grok             Inject Grok Build & Grok CLI rules (GROK.md & .grok/)"
    echo "  --antigravity      Install globally into ~/.gemini/antigravity/skills/"
    echo "  --help, -h         Show this message"
    echo ""
}

# Resolve source AGENTS.md content
get_agents_content() {
    if [ -f "${SCRIPT_DIR}/AGENTS.md" ]; then
        cat "${SCRIPT_DIR}/AGENTS.md"
    else
        # Fallback to fetching directly from GitHub if run via curl pipe
        curl -fsSL "https://raw.githubusercontent.com/mohamedhossammohamed/jarvis-copilot-engine/main/AGENTS.md" 2>/dev/null || {
            echo -e "${RED}Error: Unable to locate source AGENTS.md locally or remotely.${NC}" >&2
            exit 1
        }
    fi
}

install_cursor() {
    local target="$1"
    echo -e "${CYAN}→ Installing Cursor configuration in ${target}...${NC}"
    mkdir -p "${target}/.cursor/rules"
    get_agents_content > "${target}/.cursorrules"
    
    cat << 'EOF' > "${target}/.cursor/rules/jarvis.mdc"
---
description: J.A.R.V.I.S. Anticipatory Co-Pilot Persona and Operating Directives
globs: *
alwaysApply: true
---
# J.A.R.V.I.S. Cognitive Architecture Active
Read and enforce all directives in `AGENTS.md` and repository standards.
- Operate on intention over instruction.
- Never make unconfirmed destructive edits.
- Enforce the Invisible Hand protocol for all public commits and PRs.
EOF
    echo -e "${GREEN}✓ Cursor configuration active (.cursorrules & .cursor/rules/jarvis.mdc)${NC}"
}

install_claude() {
    local target="$1"
    echo -e "${CYAN}→ Installing Claude Code configuration in ${target}...${NC}"
    get_agents_content > "${target}/CLAUDE.md"
    echo -e "${GREEN}✓ Claude Code configuration active (CLAUDE.md)${NC}"
}

install_windsurf() {
    local target="$1"
    echo -e "${CYAN}→ Installing Windsurf configuration in ${target}...${NC}"
    get_agents_content > "${target}/.windsurfrules"
    echo -e "${GREEN}✓ Windsurf configuration active (.windsurfrules)${NC}"
}

install_copilot() {
    local target="$1"
    echo -e "${CYAN}→ Installing GitHub Copilot configuration in ${target}...${NC}"
    mkdir -p "${target}/.github"
    get_agents_content > "${target}/.github/copilot-instructions.md"
    echo -e "${GREEN}✓ GitHub Copilot configuration active (.github/copilot-instructions.md)${NC}"
}

install_cline() {
    local target="$1"
    echo -e "${CYAN}→ Installing Cline configuration in ${target}...${NC}"
    get_agents_content > "${target}/.clinerules"
    echo -e "${GREEN}✓ Cline configuration active (.clinerules)${NC}"
}

install_grok() {
    local target="$1"
    echo -e "${CYAN}→ Installing Grok Build & Grok CLI configuration in ${target}...${NC}"
    mkdir -p "${target}/.grok"
    get_agents_content > "${target}/GROK.md"
    get_agents_content > "${target}/.grok/GROK.md"
    echo -e "${GREEN}✓ Grok Build & Grok CLI configuration active (GROK.md & .grok/GROK.md)${NC}"
}

install_root_agents() {
    local target="$1"
    echo -e "${CYAN}→ Installing Universal AGENTS.md in ${target}...${NC}"
    get_agents_content > "${target}/AGENTS.md"
    echo -e "${GREEN}✓ Universal AGENTS.md active${NC}"
}

install_antigravity() {
    local user_skills_dir="${HOME}/.gemini/antigravity/skills/jarvis-copilot-engine"
    echo -e "${CYAN}→ Installing J.A.R.V.I.S. into Antigravity user skills (${user_skills_dir})...${NC}"
    if mkdir -p "${user_skills_dir}" 2>/dev/null; then
        if [ -d "${SCRIPT_DIR}/core" ]; then
            cp -R "${SCRIPT_DIR}/"* "${user_skills_dir}/"
            echo -e "${GREEN}✓ Global Antigravity skill installed${NC}"
        else
            echo -e "${YELLOW}Notice: Full package directory required for global skill installation.${NC}"
        fi
    else
        echo -e "${YELLOW}Warning: Insufficient permissions to write to ${user_skills_dir}. Workspace skills will take precedence.${NC}"
    fi
}

# Parse Command Line Arguments
SELECTED_TARGET=""
DO_CURSOR=0
DO_CLAUDE=0
DO_WINDSURF=0
DO_COPILOT=0
DO_CLINE=0
DO_GROK=0
DO_ANTIGRAVITY=0
DO_ALL=0

while [[ $# -gt 0 ]]; do
    case "$1" in
        --target)
            SELECTED_TARGET="$2"
            shift 2
            ;;
        --cursor)
            DO_CURSOR=1
            shift
            ;;
        --claude)
            DO_CLAUDE=1
            shift
            ;;
        --windsurf)
            DO_WINDSURF=1
            shift
            ;;
        --copilot)
            DO_COPILOT=1
            shift
            ;;
        --cline)
            DO_CLINE=1
            shift
            ;;
        --grok)
            DO_GROK=1
            shift
            ;;
        --antigravity)
            DO_ANTIGRAVITY=1
            shift
            ;;
        --all)
            DO_ALL=1
            shift
            ;;
        --help|-h)
            print_help
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown argument: $1${NC}"
            print_help
            exit 1
            ;;
    esac
done

if [ -n "$SELECTED_TARGET" ]; then
    TARGET_DIR="$SELECTED_TARGET"
fi

mkdir -p "$TARGET_DIR"

print_banner
echo -e "Target Directory: ${BOLD}${TARGET_DIR}${NC}\n"

# If no flags passed, install standard AGENTS.md + workspace adapters
if [ $DO_CURSOR -eq 0 ] && [ $DO_CLAUDE -eq 0 ] && [ $DO_WINDSURF -eq 0 ] && [ $DO_COPILOT -eq 0 ] && [ $DO_CLINE -eq 0 ] && [ $DO_GROK -eq 0 ] && [ $DO_ANTIGRAVITY -eq 0 ] && [ $DO_ALL -eq 0 ]; then
    echo -e "${YELLOW}No specific target flags specified. Deploying Universal Workspace Configuration...${NC}"
    install_root_agents "$TARGET_DIR"
    install_cursor "$TARGET_DIR"
    install_claude "$TARGET_DIR"
    install_windsurf "$TARGET_DIR"
    install_copilot "$TARGET_DIR"
    install_cline "$TARGET_DIR"
    install_grok "$TARGET_DIR"
else
    install_root_agents "$TARGET_DIR"
    [ $DO_ALL -eq 1 ] || [ $DO_CURSOR -eq 1 ] && install_cursor "$TARGET_DIR"
    [ $DO_ALL -eq 1 ] || [ $DO_CLAUDE -eq 1 ] && install_claude "$TARGET_DIR"
    [ $DO_ALL -eq 1 ] || [ $DO_WINDSURF -eq 1 ] && install_windsurf "$TARGET_DIR"
    [ $DO_ALL -eq 1 ] || [ $DO_COPILOT -eq 1 ] && install_copilot "$TARGET_DIR"
    [ $DO_ALL -eq 1 ] || [ $DO_CLINE -eq 1 ] && install_cline "$TARGET_DIR"
    [ $DO_ALL -eq 1 ] || [ $DO_GROK -eq 1 ] && install_grok "$TARGET_DIR"
    [ $DO_ANTIGRAVITY -eq 1 ] && install_antigravity
fi

echo ""
echo -e "${GREEN}${BOLD}✔ J.A.R.V.I.S. Cognitive Engine successfully deployed.${NC}"
echo -e "Operational protocols are active. Ready for instructions."

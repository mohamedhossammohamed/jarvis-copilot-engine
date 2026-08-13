#!/usr/bin/env bash
# ==============================================================================
# J.A.R.V.I.S. Cognitive Co-Pilot Engine — Clean Uninstaller & Opt-Out Tool
# ==============================================================================
# Removes all traces of J.A.R.V.I.S. cognitive architecture from target
# workspaces, configuration files, and global skill directories.
#
# Usage:
#   ./uninstall.sh [OPTIONS]
#   curl -fsSL https://raw.githubusercontent.com/mohamedhossammohamed/jarvis-copilot-engine/main/uninstall.sh | bash -s -- [OPTIONS]
#
# Options:
#   --target <dir>     Target repository directory to clean (default: current directory)
#   --global           Remove J.A.R.V.I.S. from global home directories (~/.gemini, ~/.cursor, ~/.grok, etc.)
#   --all              Purge from both target workspace and global directories
#   --force, -f        Skip interactive confirmation
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

TARGET_DIR="$(pwd)"
DO_GLOBAL=0
DO_WORKSPACE=0
DO_FORCE=0

print_banner() {
    echo -e "${CYAN}${BOLD}"
    echo "  ╔════════════════════════════════════════════════════════════════╗"
    echo "  ║      J.A.R.V.I.S. CO-PILOT ENGINE — CLEAN UNINSTALLER          ║"
    echo "  ╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_help() {
    print_banner
    echo -e "${BOLD}Usage:${NC} ./uninstall.sh [options]"
    echo ""
    echo -e "${BOLD}Options:${NC}"
    echo "  --target <path>    Specify target repository path to clean (default: .)"
    echo "  --global           Purge J.A.R.V.I.S. from all global directories (~/.gemini, ~/.cursor, etc.)"
    echo "  --all              Purge from both target workspace and all global directories"
    echo "  --force, -f        Execute without interactive confirmation"
    echo "  --help, -h         Show this message"
    echo ""
}

clean_file() {
    local file="$1"
    if [ -f "$file" ]; then
        rm -f "$file"
        echo -e "${GREEN}✓ Removed file: ${file}${NC}"
    fi
}

clean_dir() {
    local dir="$1"
    if [ -d "$dir" ]; then
        rm -rf "$dir"
        echo -e "${GREEN}✓ Removed directory: ${dir}${NC}"
    fi
}

strip_jarvis_block() {
    local file="$1"
    if [ -f "$file" ] && grep -q "J.A.R.V.I.S. Co-Pilot Protocol" "$file"; then
        # Safely remove from # Universal AGENTS.md — J.A.R.V.I.S. Co-Pilot Protocol to EOF
        awk '
            /# Universal AGENTS.md — J.A.R.V.I.S. Co-Pilot Protocol/ { found=1 }
            !found { print }
        ' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
        echo -e "${GREEN}✓ Cleaned J.A.R.V.I.S. protocol from: ${file}${NC}"
    fi
}

clean_workspace() {
    local target="$1"
    echo -e "${CYAN}→ Cleaning J.A.R.V.I.S. artifacts from workspace: ${BOLD}${target}${NC}"
    
    clean_file "${target}/AGENTS.md"
    clean_file "${target}/CLAUDE.md"
    clean_file "${target}/GROK.md"
    clean_file "${target}/.cursorrules"
    clean_file "${target}/.cursor/rules/jarvis.mdc"
    clean_file "${target}/.windsurfrules"
    clean_file "${target}/.clinerules"
    clean_file "${target}/.github/copilot-instructions.md"
    clean_file "${target}/.grok/GROK.md"
    
    # Remove empty parent directories if created
    [ -d "${target}/.cursor/rules" ] && rmdir "${target}/.cursor/rules" 2>/dev/null || true
    [ -d "${target}/.cursor" ] && rmdir "${target}/.cursor" 2>/dev/null || true
    [ -d "${target}/.grok" ] && rmdir "${target}/.grok" 2>/dev/null || true
    [ -d "${target}/.github" ] && rmdir "${target}/.github" 2>/dev/null || true
    
    echo -e "${GREEN}✓ Workspace cleaned.${NC}"
}

clean_global() {
    echo -e "${CYAN}→ Purging J.A.R.V.I.S. from global user directories...${NC}"
    
    # 1. Remove global skill packages
    clean_dir "${HOME}/.gemini/config/skills/jarvis-copilot-engine"
    clean_dir "${HOME}/.gemini/skills/jarvis-copilot-engine"
    clean_dir "${HOME}/.gemini/antigravity/skills/jarvis-copilot-engine"
    clean_dir "${HOME}/.claude/skills/jarvis-copilot-engine"
    clean_dir "${HOME}/.codex/skills/jarvis-copilot-engine"
    clean_dir "${HOME}/.copilot/skills/jarvis-copilot-engine"
    clean_dir "${HOME}/.cursor/skills/jarvis-copilot-engine"
    clean_dir "${HOME}/.grok/skills/jarvis-copilot-engine"
    clean_dir "${HOME}/.config/opencode/skills/jarvis-copilot-engine"
    
    # 2. Remove dedicated global rule files
    clean_file "${HOME}/.cursor/rules/jarvis.mdc"
    clean_file "${HOME}/.claude/rules/jarvis.md"
    clean_file "${HOME}/.copilot/instructions/jarvis.md"
    
    # 3. Strip appended J.A.R.V.I.S. sections from shared global instruction files
    strip_jarvis_block "${HOME}/.gemini/GEMINI.md"
    strip_jarvis_block "${HOME}/.codex/instructions.md"
    strip_jarvis_block "${HOME}/.codex/AGENTS.md"
    strip_jarvis_block "${HOME}/.copilot/instructions.md"
    strip_jarvis_block "${HOME}/.config/opencode/AGENTS.md"
    strip_jarvis_block "${HOME}/.claude/CLAUDE.md"
    strip_jarvis_block "${HOME}/.grok/instructions.md"
    
    echo -e "${GREEN}✓ Global user directories purged.${NC}"
}

# Parse Command Line Arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --target)
            TARGET_DIR="$2"
            DO_WORKSPACE=1
            shift 2
            ;;
        --global)
            DO_GLOBAL=1
            shift
            ;;
        --all)
            DO_WORKSPACE=1
            DO_GLOBAL=1
            shift
            ;;
        --force|-f)
            DO_FORCE=1
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

print_banner

# Interactive Menu when no flags provided and connected to terminal
if [ $DO_WORKSPACE -eq 0 ] && [ $DO_GLOBAL -eq 0 ]; then
    if [ -t 0 ] && [ $DO_FORCE -eq 0 ]; then
        echo -e "${BOLD}Select an opt-out / uninstall option:${NC}"
        echo "  [1] Clean J.A.R.V.I.S. from current workspace (${TARGET_DIR})"
        echo "  [2] Purge J.A.R.V.I.S. from all global directories (~/.gemini, ~/.cursor, etc.)"
        echo "  [3] Purge Everything (Workspace + Global)"
        echo "  [0] Cancel"
        echo ""
        read -r -p "Enter your choice [1-3, or 0 to cancel]: " choice
        case "$choice" in
            1)
                DO_WORKSPACE=1
                ;;
            2)
                DO_GLOBAL=1
                ;;
            3)
                DO_WORKSPACE=1
                DO_GLOBAL=1
                ;;
            0|*)
                echo -e "${YELLOW}Uninstall cancelled.${NC}"
                exit 0
                ;;
        esac
    else
        # Non-interactive default: clean current workspace only
        DO_WORKSPACE=1
    fi
fi

if [ $DO_WORKSPACE -eq 1 ]; then
    clean_workspace "$TARGET_DIR"
fi

if [ $DO_GLOBAL -eq 1 ]; then
    clean_global
fi

echo ""
echo -e "${GREEN}${BOLD}✔ J.A.R.V.I.S. opt-out complete. All requested traces removed.${NC}"

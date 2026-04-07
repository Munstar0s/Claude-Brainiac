#!/usr/bin/env bash
set -e

BRAINIAC_DIR="$HOME/Brainiac"
CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "================================================"
echo "  Brainiac — Setup"
echo "================================================"
echo ""

# --- Check Claude Code is installed ---
if ! command -v claude &>/dev/null; then
    echo "[ERROR] Claude Code CLI not found. Install it first:"
    echo "        https://claude.ai/code"
    exit 1
fi
echo "[OK] Claude Code found: $(which claude)"

# --- Create Brainiac directory tree ---
echo ""
echo "[*] Creating Brainiac directory structure at $BRAINIAC_DIR ..."
mkdir -p \
    "$BRAINIAC_DIR/investigations/Report" \
    "$BRAINIAC_DIR/investigations/Findings-observables" \
    "$BRAINIAC_DIR/archive" \
    "$BRAINIAC_DIR/procedures" \
    "$BRAINIAC_DIR/CTH/Hypothesis" \
    "$BRAINIAC_DIR/CTH/Completed-Hunts" \
    "$BRAINIAC_DIR/CTH/Queries" \
    "$BRAINIAC_DIR/CTH/LogFile-Analysis"
echo "[OK] Directory tree created."

# --- Copy CLAUDE.md ---
if [ -f "$SCRIPT_DIR/CLAUDE.md" ]; then
    cp "$SCRIPT_DIR/CLAUDE.md" "$BRAINIAC_DIR/CLAUDE.md"
    echo "[OK] CLAUDE.md installed to $BRAINIAC_DIR/"
else
    echo "[WARN] CLAUDE.md not found in $SCRIPT_DIR — copy it manually to $BRAINIAC_DIR/CLAUDE.md"
fi

# --- Install global slash command ---
echo ""
echo "[*] Installing /brainiac slash command to $CLAUDE_COMMANDS_DIR ..."
mkdir -p "$CLAUDE_COMMANDS_DIR"

if [ -f "$SCRIPT_DIR/slash-commands/brainiac.md" ]; then
    cp "$SCRIPT_DIR/slash-commands/brainiac.md" "$CLAUDE_COMMANDS_DIR/brainiac.md"
    echo "[OK] /brainiac command installed globally."
else
    echo "[WARN] slash-commands/brainiac.md not found — skipping slash command install."
fi

# --- Done ---
echo ""
echo "================================================"
echo "  Setup complete."
echo ""
echo "  To start Brainiac:"
echo "    cd $BRAINIAC_DIR && claude"
echo ""
echo "  To invoke from any session:"
echo "    /brainiac <your investigation, hunt, or tool request>"
echo "================================================"
echo ""

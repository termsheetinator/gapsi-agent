#!/bin/bash
# gapsi-agent — v1.0.0
# B2B Sales Intelligence Agent for Claude Code
# https://github.com/termsheetinator/gapsi-agent

set -e

# ── Colors ────────────────────────────────────────────────────────────────────
GREEN='\033[1;32m'
DIM='\033[2m'
WHITE='\033[1;37m'
CYAN='\033[0;36m'
RESET='\033[0m'

# ── Helpers ───────────────────────────────────────────────────────────────────
type_out() {
  local text="$1"
  local delay="${2:-0.02}"
  local i=0
  while [ $i -lt ${#text} ]; do
    printf '%s' "${text:$i:1}"
    sleep "$delay"
    i=$((i + 1))
  done
  printf '\n'
}

spinner() {
  local pid=$1
  local label="$2"
  local frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
  local i=0
  while kill -0 "$pid" 2>/dev/null; do
    printf "\r  ${GREEN}${frames[$((i % 10))]}${RESET}  ${DIM}%s${RESET}" "$label"
    sleep 0.08
    i=$((i + 1))
  done
  printf "\r  ${GREEN}✓${RESET}  %s\n" "$label"
}

# ── Banner ────────────────────────────────────────────────────────────────────
clear

printf "${GREEN}"
cat << 'BANNER'

   ██████╗  █████╗ ██████╗ ███████╗██╗
  ██╔════╝ ██╔══██╗██╔══██╗██╔════╝██║
  ██║  ███╗███████║██████╔╝███████╗██║
  ██║   ██║██╔══██║██╔═══╝ ╚════██║██║
  ╚██████╔╝██║  ██║██║     ███████║██║
   ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝

BANNER
printf "${RESET}"

printf "  ${DIM}Gap + Sales Intelligence  ·  by termsheetinator  ·  B2B Sales Coach${RESET}\n"
printf "  ${DIM}──────────────────────────────────────────────────────────────────${RESET}\n\n"

type_out "  Installing Gapsi Agent..." 0.02
echo ""

# ── Variables ─────────────────────────────────────────────────────────────────
SKILL_DIR="$HOME/.claude/skills"
PROJECT_DIR="$(pwd)"
BASE_URL="https://raw.githubusercontent.com/termsheetinator/gapsi-agent/main"
HOOK_PATH="$PROJECT_DIR/.claude/hooks/gapsi-active.sh"

# ── Step 1: Install Skill File ─────────────────────────────────────────────────
mkdir -p "$SKILL_DIR/gapsi-agent"
(
  curl -fsSL "$BASE_URL/gapsi-agent.md" -o "$SKILL_DIR/gapsi-agent/SKILL.md"
) &
spinner $! "/gapsi-agent  — B2B sales coach skill installed to ~/.claude/skills/"

# ── Step 2: Install Hook ───────────────────────────────────────────────────────
mkdir -p "$PROJECT_DIR/.claude/hooks"
(
  curl -fsSL "$BASE_URL/.claude/hooks/gapsi-active.sh" -o "$HOOK_PATH"
  chmod +x "$HOOK_PATH"
) &
spinner $! ".claude/hooks  — memory context hook installed and activated"

# ── Step 3: Create Memory Directory ───────────────────────────────────────────
mkdir -p "$PROJECT_DIR/memory/deals"
(
cat > "$PROJECT_DIR/memory/MEMORY.md" << 'MEMINDEX'
---
last-updated: —
---

# Gapsi Memory Index

## User Profile
- File: memory/user-profile.md
- Status: pending

## Offers
[No offers yet — complete onboarding to add offers]

## Active Deals
[No deals yet — start a deal to track a prospect]

## Session Log
- File: memory/session-log.md
- Sessions logged: 0
- Last session: —
MEMINDEX
) &
spinner $! "memory/        — persistent memory + deals directory created"

# ── Step 4: Write settings.json ────────────────────────────────────────────────
mkdir -p "$PROJECT_DIR/.claude"
(
cat > "$PROJECT_DIR/.claude/settings.json" << SETTINGS
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "bash $HOOK_PATH"
          }
        ]
      }
    ]
  }
}
SETTINGS
) &
spinner $! ".claude/settings.json  — hook registered for this project"

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
printf "  ${DIM}──────────────────────────────────────────────────────────────────${RESET}\n"
echo ""
type_out "  Done. Open Claude Code in this directory." 0.02
echo ""
printf "  ${WHITE}/gapsi-agent${RESET}${DIM}  →  first run starts onboarding${RESET}\n"
printf "  ${DIM}subsequent runs load your offers and session history automatically${RESET}\n"
echo ""

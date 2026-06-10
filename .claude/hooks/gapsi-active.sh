#!/bin/bash
# gapsi-agent — v2.6.1
# UserPromptSubmit hook — injects memory context into every session.
# Profile, offers, and session log are injected in full. Deals are injected
# as frontmatter summaries only — the skill Reads the full deal file on demand.

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"
MEMORY_DIR="$PROJECT_DIR/memory"
MEMORY_INDEX="$MEMORY_DIR/MEMORY.md"
PROFILE="$MEMORY_DIR/user-profile.md"
SESSION_LOG="$MEMORY_DIR/session-log.md"
DEALS_DIR="$MEMORY_DIR/deals"

if [ ! -d "$MEMORY_DIR" ] || [ ! -f "$MEMORY_INDEX" ]; then
  echo "Gapsi is active. No memory found in this directory."
  echo "When the user invokes /gapsi-agent, begin with onboarding (Step 1)."
  exit 0
fi

if grep -q "Status: pending" "$MEMORY_INDEX"; then
  echo "Gapsi is active. Memory is initialized but onboarding has not been completed."
  echo "When the user invokes /gapsi-agent, begin with onboarding (Step 1)."
  exit 0
fi

echo "--- GAPSI MEMORY (loaded) ---"
echo "Read all sections before responding."
echo "Do not ask for information already present in memory."
echo "Deals below show frontmatter only — Read the full deal file before working a specific deal."
echo ""

echo "## Memory Index"
cat "$MEMORY_INDEX"
echo ""

if [ -f "$PROFILE" ]; then
  echo "## User Profile"
  cat "$PROFILE"
  echo ""
fi

for offer_file in "$MEMORY_DIR"/offer-*.md; do
  if [ -f "$offer_file" ]; then
    echo "## Offer — $(basename "$offer_file" .md)"
    cat "$offer_file"
    echo ""
  fi
done

if [ -d "$DEALS_DIR" ]; then
  for deal_file in "$DEALS_DIR"/deal-*.md; do
    if [ -f "$deal_file" ]; then
      echo "## Deal — $(basename "$deal_file" .md)  (summary — full file: memory/deals/$(basename "$deal_file"))"
      # Print YAML frontmatter only (up to and including the second --- line)
      awk '{ print } /^---$/ { c++; if (c == 2) exit }' "$deal_file"
      echo ""
    fi
  done
fi

if [ -f "$SESSION_LOG" ]; then
  echo "## Session Log"
  cat "$SESSION_LOG"
  echo ""
fi

echo "--- END GAPSI MEMORY ---"

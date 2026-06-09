#!/bin/bash
# gapsi-agent — v1.1.0
# UserPromptSubmit hook — injects full memory context into every session

MEMORY_DIR="$(pwd)/memory"
MEMORY_INDEX="$MEMORY_DIR/MEMORY.md"
PROFILE="$MEMORY_DIR/user-profile.md"
SESSION_LOG="$MEMORY_DIR/session-log.md"
DEALS_DIR="$MEMORY_DIR/deals"

if [ ! -d "$MEMORY_DIR" ] || [ ! -f "$MEMORY_INDEX" ]; then
  echo "Gapsi is active. No memory found in this directory."
  echo "When the user invokes /gapsi-agent, begin with onboarding (Step 1)."
  exit 0
fi

echo "--- GAPSI MEMORY (loaded) ---"
echo "Read all sections before responding."
echo "Do not ask for information already present in memory."
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
      echo "## Deal — $(basename "$deal_file" .md)"
      cat "$deal_file"
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

#!/bin/sh
# inventory.sh — List all posts and their status
# Usage: ./inventory.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
WORK_DIR="$REPO_ROOT/work"
INDEX_FILE="$WORK_DIR/INDEX.md"
ACTIVE_LINK="$WORK_DIR/_active"

echo "=== Post Inventory ==="
echo ""

# Show active post
if [ -L "$ACTIVE_LINK" ]; then
    ACTIVE_TARGET="$(readlink "$ACTIVE_LINK")"
    echo "Active: $ACTIVE_TARGET"
    echo ""
fi

# Show INDEX.md table
if [ -f "$INDEX_FILE" ]; then
    cat "$INDEX_FILE"
else
    echo "No INDEX.md found"
fi

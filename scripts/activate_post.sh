#!/bin/sh
# activate_post.sh — Set a post as the active working post
# Usage: ./activate_post.sh <slug>
# Example: ./activate_post.sh ai-aviation-labor

set -e

SLUG="$1"

if [ -z "$SLUG" ]; then
    echo "Usage: $0 <slug>"
    echo ""
    echo "Available posts:"
    ./scripts/inventory.sh
    exit 1
fi

# Paths
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
WORK_DIR="$REPO_ROOT/work"
ACTIVE_LINK="$WORK_DIR/_active"

# Find the post folder (may have date prefix)
POST_DIR=""
for dir in "$WORK_DIR"/*"$SLUG"*/; do
    if [ -d "$dir" ]; then
        POST_DIR="$dir"
        break
    fi
done

if [ -z "$POST_DIR" ] || [ ! -d "$POST_DIR" ]; then
    echo "Error: No post found matching slug: $SLUG"
    echo ""
    echo "Available posts:"
    "$SCRIPT_DIR/inventory.sh"
    exit 1
fi

# Remove trailing slash for cleaner symlink
POST_DIR="${POST_DIR%/}"

# Remove existing symlink
if [ -L "$ACTIVE_LINK" ]; then
    rm "$ACTIVE_LINK"
elif [ -e "$ACTIVE_LINK" ]; then
    echo "Error: $ACTIVE_LINK exists but is not a symlink"
    exit 1
fi

# Create relative symlink (basename only since both are in work/)
POST_BASENAME="$(basename "$POST_DIR")"
cd "$WORK_DIR"
ln -s "$POST_BASENAME" "_active"

echo "Activated: $POST_DIR"
echo ""

# Show current status
if [ -f "$POST_DIR/meta.md" ]; then
    echo "--- meta.md ---"
    cat "$POST_DIR/meta.md"
fi

#!/bin/sh
# new_post.sh — Create a new post folder from templates
# Usage: ./new_post.sh <slug> [framework]
# Example: ./new_post.sh ai-aviation-labor CTE

set -e

# Defaults
DEFAULT_FRAMEWORK="CTE"

# Arguments
SLUG="$1"
FRAMEWORK="${2:-$DEFAULT_FRAMEWORK}"

# Validation
if [ -z "$SLUG" ]; then
    echo "Usage: $0 <slug> [framework]"
    echo "Example: $0 my-post-slug CTE"
    echo ""
    echo "Frameworks: CTE, Minto, Dialectic, FieldNotes"
    exit 1
fi

# Paths
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
TEMPLATES_DIR="$REPO_ROOT/templates"
WORK_DIR="$REPO_ROOT/work"
INDEX_FILE="$WORK_DIR/INDEX.md"

# Generate folder name
DATE_PREFIX="$(date +%Y-%m-%d)"
POST_DIR="$WORK_DIR/${DATE_PREFIX}__${SLUG}"

# Check if post already exists
if [ -d "$POST_DIR" ]; then
    echo "Error: Post folder already exists: $POST_DIR"
    exit 1
fi

# Create post folder
mkdir -p "$POST_DIR"

# Generate title from slug (replace hyphens with spaces, capitalize)
TITLE=$(echo "$SLUG" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')

# Copy and populate templates
TODAY="$(date +%Y-%m-%d)"

# Validate framework exists
if [ ! -d "$TEMPLATES_DIR/$FRAMEWORK" ]; then
    echo "Error: Unknown framework '$FRAMEWORK'"
    echo "Available: CTE, Minto, Dialectic, FieldNotes"
    rmdir "$POST_DIR"
    exit 1
fi

# Copy shared templates
cp "$TEMPLATES_DIR/shared/"* "$POST_DIR/"

# Copy framework-specific draft.md
cp "$TEMPLATES_DIR/$FRAMEWORK/draft.md" "$POST_DIR/draft.md"

# Copy post.yaml (manifest)
cp "$TEMPLATES_DIR/post.yaml" "$POST_DIR/post.yaml"

# Populate placeholders in all files
sed -i "s/{{title}}/$TITLE/g" "$POST_DIR"/*.md "$POST_DIR"/post.yaml
sed -i "s/{{slug}}/$SLUG/g" "$POST_DIR"/post.yaml
sed -i "s/{{date}}/$TODAY/g" "$POST_DIR"/*.md "$POST_DIR"/post.yaml
sed -i "s/{{framework}}/$FRAMEWORK/g" "$POST_DIR"/*.md "$POST_DIR"/post.yaml
sed -i "s/{{one_liner}}//g" "$POST_DIR"/*.md

# Add to INDEX.md
echo "| $SLUG | $TITLE | Requires Interview | $FRAMEWORK | | $TODAY |" >> "$INDEX_FILE"

echo "Created post: $POST_DIR"
echo "Slug for activation: $SLUG"
echo ""
echo "Next: ./scripts/activate_post.sh $SLUG"

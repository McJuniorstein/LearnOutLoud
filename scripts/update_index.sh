#!/bin/bash
set -e
WORK_DIR="$(dirname "$(dirname "$0")")/work"
echo "| Slug | Title | Status | Framework | Confidence | Created |" > "$WORK_DIR/INDEX.md"
echo "|------|-------|--------|-----------|------------|---------|" >> "$WORK_DIR/INDEX.md"
for dir in "$WORK_DIR"/*__*/; do
    if [ -f "$dir/post.yaml" ]; then
        SLUG=$(grep '^slug:' "$dir/post.yaml" | cut -d' ' -f2)
        STATUS=$(grep '^status:' "$dir/post.yaml" | cut -d' ' -f2)
        FRAMEWORK=$(grep '^framework:' "$dir/post.yaml" | cut -d' ' -f2)
        CONFIDENCE=$(grep '^confidence:' "$dir/post.yaml" | cut -d' ' -f2)
        CREATED=$(grep '^created:' "$dir/post.yaml" | cut -d' ' -f2)
        TITLE="$SLUG"  # Placeholder; pull from meta.md if needed
        echo "| $SLUG | $TITLE | $STATUS | $FRAMEWORK | $CONFIDENCE | $CREATED |" >> "$WORK_DIR/INDEX.md"
    fi
done
echo "INDEX.md updated."

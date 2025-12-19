#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
ACTIVE_DIR="$REPO_ROOT/work/_active"
if [ -L "$ACTIVE_DIR" ] && [ -f "$ACTIVE_DIR/post.yaml" ]; then
    HASH=$(md5sum "$REPO_ROOT/SYSTEM_COMPILER.md" | awk '{print $1}')
    sed -i "s/^compiler_version: .*/compiler_version: $HASH/" "$ACTIVE_DIR/post.yaml"
    echo "Compiler version set: $HASH"
else
    echo "No active post."
fi

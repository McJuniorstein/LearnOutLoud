#!/bin/bash
# set_llm_used.sh — Record which LLM is being used for this post
set -e

REPO_ROOT="$(cd "$(dirname "$(dirname "$0")")" && pwd)"
ACTIVE_LINK="$REPO_ROOT/work/_active"
LLM="$1"

if [ -z "$LLM" ]; then
    echo "Usage: ./scripts/set_llm_used.sh <model-name>  (e.g., grok-4)"
    exit 1
fi

if [ ! -L "$ACTIVE_LINK" ] || [ ! -d "$(readlink -f "$ACTIVE_LINK")" ]; then
    echo "Error: No active post. Run ./scripts/activate_post.sh first."
    exit 1
fi

TARGET_DIR="$(readlink -f "$ACTIVE_LINK")"
POST_YAML="$TARGET_DIR/post.yaml"

if [ ! -f "$POST_YAML" ]; then
    echo "Error: post.yaml not found."
    exit 1
fi

sed -i "s/^llm_used: .*/llm_used: $LLM/" "$POST_YAML"
echo "LLM recorded: $LLM in $POST_YAML"

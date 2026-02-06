#!/bin/bash

# Target directory for OpenClaw workspaces
TARGET_DIR="$HOME/.openclaw"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🐙 Octopus Ops: Linking Brains to OpenClaw..."
echo "Source (Repo): $REPO_DIR"
echo "Target (OpenClaw): $TARGET_DIR"

mkdir -p "$TARGET_DIR"

# Function to link a workspace
link_workspace() {
    SRC_NAME=$1   # e.g., "brain"
    DEST_NAME=$2  # e.g., "workspace-brain"
    
    SRC_PATH="$REPO_DIR/$SRC_NAME"
    DEST_PATH="$TARGET_DIR/$DEST_NAME"

    if [ -d "$SRC_PATH" ]; then
        # Check if destination exists and is not already the correct symlink
        if [ -e "$DEST_PATH" ] || [ -L "$DEST_PATH" ]; then
            CURRENT_LINK=$(readlink -f "$DEST_PATH")
            if [ "$CURRENT_LINK" == "$SRC_PATH" ]; then
                echo "✅ $DEST_NAME is already linked correctly."
                return
            fi

            echo "⚠️  Existing $DEST_NAME found. Backing up..."
            mv "$DEST_PATH" "$DEST_PATH.bak.$(date +%s)"
        fi

        echo "🔗 Linking $SRC_NAME -> $DEST_NAME..."
        ln -s "$SRC_PATH" "$DEST_PATH"
    else
        echo "❌ Warning: Source folder $SRC_NAME not found in repo."
    fi
}

link_workspace "brain" "workspace-brain"
link_workspace "arm-1" "workspace-arm-1"
link_workspace "arm-2" "workspace-arm-2"
link_workspace "arm-3" "workspace-arm-3"

echo "🎉 Done! Your OpenClaw is now running directly from this git repository."
echo "   Changes made by the agent will appear in 'git status' here."


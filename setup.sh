#!/bin/bash

# Target directory for OpenClaw workspaces
TARGET_DIR="$HOME/.openclaw"

echo "Restoring Octopus Ops Brains to $TARGET_DIR..."

mkdir -p $TARGET_DIR

# Function to restore a workspace
restore_workspace() {
    SRC=$1
    DEST=$2
    if [ -d "$SRC" ]; then
        echo "Restoring $DEST..."
        # Backup existing if any
        if [ -d "$TARGET_DIR/$DEST" ]; then
            mv "$TARGET_DIR/$DEST" "$TARGET_DIR/$DEST.bak.$(date +%s)"
        fi
        cp -r "$SRC" "$TARGET_DIR/$DEST"
    else
        echo "Warning: Source $SRC not found."
    fi
}

restore_workspace "brain" "workspace-brain"
restore_workspace "arm-1" "workspace-arm-1"
restore_workspace "arm-2" "workspace-arm-2"
restore_workspace "arm-3" "workspace-arm-3"

echo "Done. Restart OpenClaw to apply changes."


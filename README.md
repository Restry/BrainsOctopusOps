# Octopus Ops Brains Backup

This repository contains the cognitive cores (workspaces) for the Octopus Ops agent network.

## Structure
- **brain/**: The Chief of Staff (Main Agent)
- **arm-1/**: Sub-agent 1
- **arm-2/**: Sub-agent 2
- **arm-3/**: Sub-agent 3

## Restore / Install
To restore these to a new OpenClaw instance:

1. Clone this repo:
   ```bash
   git clone https://github.com/Restry/BrainsOctopusOps.git octopus-ops
   ```

2. Run the setup script (coming soon) or manually symlink/copy folders to `~/.openclaw/workspace-*`.


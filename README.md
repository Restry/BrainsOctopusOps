# Octopus Ops Brains Backup 🐙

This repository contains the cognitive cores (workspaces) for the **Octopus Ops** agent network. It preserves the identity, memory, and operational logic of the "Brain" and its "Arms".

## 📂 Repository Structure

*   **`brain/`**: **Chief of Staff (Main Agent)** - The central coordinator.
*   **`arm-1/`**: Sub-agent 1 (Infrastructure/VM Management).
*   **`arm-2/`**: Sub-agent 2 (Communication/Email).
*   **`arm-3/`**: Sub-agent 3 (Development/Task Execution).
*   **`setup.sh`**: Auto-linking script to deploy these brains to a live OpenClaw instance.

## 🚀 Installation & Restore

To deploy Octopus Ops on a new host:

### 1. Prerequisites
Ensure the host has the following tools installed:
*   **OpenClaw**: The agent runtime.
*   **Git**: For version control.
*   **Azure CLI (`az`)**: Required for cloud resource management.
    ```bash
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    az login
    ```
*   **Python 3**: For utility scripts (e.g., Azure Email integration).
    ```bash
    pip install azure-communication-email
    ```

### 2. Clone & Link
Clone the repo and run the setup script to symlink the workspaces into OpenClaw's directory:

```bash
# Clone to your preferred location
git clone https://github.com/Restry/BrainsOctopusOps.git ~/octopus-ops-dist

# Run the setup script
cd ~/octopus-ops-dist
chmod +x setup.sh
./setup.sh
```
*This will replace any existing `~/.openclaw/workspace-*` folders with symlinks to this repo.*

### 3. Restart OpenClaw
Restart the gateway to load the new identities:
```bash
openclaw gateway restart
```

## 🔐 Configuration & Secrets

**⚠️ IMPORTANT:** This repo does **NOT** contain API keys or credentials. You must configure them manually on the new host.

### Azure Communication Services (Email)
To enable the Brain's email capability (`send_test_email.py`):
1.  Get the connection string from Azure Portal.
2.  Set it as an environment variable in the Brain's `.env` file or the system environment:
    ```bash
    export ACS_CONNECTION_STRING="endpoint=https://octopusopscomm...;accesskey=..."
    ```

### OpenClaw Authentication (LLMs)
The `auth-profiles.json` file (containing OpenAI/Anthropic/Google keys) is excluded from git for security.
*   **Action**: Copy your secure `auth-profiles.json` from a backup to:
    *   `~/.openclaw/agents/main/agent/auth-profiles.json`
    *   (And corresponding paths for sub-agents if they have separate keys)

## 📝 Workflow
Since the workspaces are symlinked:
1.  **Agent learns/edits**: The agent modifies files in `~/.openclaw/workspace-brain/`.
2.  **Git tracks it**: Changes appear immediately in `~/octopus-ops-dist/`.
3.  **Human saves**: You run `git commit` & `git push` here to back up the agent's evolution.

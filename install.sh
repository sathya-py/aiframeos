#!/usr/bin/env bash

set -e

echo "🚀 Bootstrapping AIFrameOS..."

# Define the repository URL (Replace with your actual GitHub repo once published)
REPO_URL="https://github.com/sathya-py/AIFrameOS"
AIFRAME_DIR=".aiframe"

# Check if .aiframe already exists
if [ -d "$AIFRAME_DIR" ]; then
    echo "⚠️  AIFrameOS is already installed in this directory."
    echo "To re-initialize, run your AI assistant and say: 'Run the /init protocol'"
    exit 0
fi

echo "📦 Downloading AIFrameOS core components..."

# Create necessary directories
mkdir -p "$AIFRAME_DIR/core"
mkdir -p "$AIFRAME_DIR/commands"
mkdir -p "$AIFRAME_DIR/prompts/templates"
mkdir -p "$AIFRAME_DIR/dev-docs/architecture"
mkdir -p "$AIFRAME_DIR/dev-docs/ssot"
mkdir -p "$AIFRAME_DIR/dev-docs/docs-of-interest"
mkdir -p "$AIFRAME_DIR/dev-docs/commentaries"
mkdir -p "$AIFRAME_DIR/prps"
mkdir -p "$AIFRAME_DIR/status"
mkdir -p "$AIFRAME_DIR/skills"
mkdir -p "$AIFRAME_DIR/examples"

# Base Github Raw URL (Change this to main branch when published)
# RAW_BASE="https://raw.githubusercontent.com/sathya-py/AIFrameOS/main"

# --- MOCK DOWNLOADS FOR LOCAL DEVELOPMENT ---
# In a real environment, we would use curl here. Since we are building locally, 
# we will just instruct the user on how this script will work once pushed to Git.
echo "Creating default configurations..."

# Initialize empty state files so the system doesn't error out before /init is run
echo '{"version": "1.0", "tasks": []}' > "$AIFRAME_DIR/status/catalog.json"
echo 'audit: { project_status: "Pending Init" }' > "$AIFRAME_DIR/status/project_state.yaml"

echo "✅ AIFrameOS directory structure created."
echo ""
echo "========================================================"
echo "🎉 INSTALLATION COMPLETE!"
echo ""
echo "Next Steps:"
echo "1. Open your AI IDE (Cursor, Windsurf, Claude Code, or Gemini)."
echo "2. Paste the following command into the AI chat to finish setup:"
echo ""
echo "   Read and execute the instructions in .aiframe/commands/init.md"
echo ""
echo "========================================================"

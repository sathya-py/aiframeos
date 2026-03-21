#!/usr/bin/env bash

set -e

echo "🚀 Bootstrapping AIFrameOS..."

AIFRAME_DIR=".aiframe"

if [ -d "$AIFRAME_DIR" ]; then
    echo "⚠️  AIFrameOS is already installed in this directory."
    echo "To re-initialize, run your AI assistant and say: 'Run the /init protocol'"
    exit 0
fi

echo "📦 Downloading AIFrameOS core components..."

# Download and extract the .aiframe directory directly from the repository tarball
curl -sSL "https://github.com/sathya-py/aiframeos/archive/refs/heads/main.tar.gz" | tar -xz "aiframeos-main/.aiframe" --strip-components=1

# Ensure tracking folders exist (Git does not track empty directories)
mkdir -p "$AIFRAME_DIR/dev-docs/docs-of-interest"
mkdir -p "$AIFRAME_DIR/dev-docs/architecture"
mkdir -p "$AIFRAME_DIR/dev-docs/commentaries"
mkdir -p "$AIFRAME_DIR/prps"

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
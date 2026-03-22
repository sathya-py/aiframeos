#!/usr/bin/env bash

set -e

echo "🚀 Bootstrapping AIFrameOS..."

AIFRAME_DIR=".aiframe"

IS_UPDATE=0
if [ -d "$AIFRAME_DIR" ]; then
    echo "🔄 AIFrameOS is already installed. Performing non-destructive update..."
    IS_UPDATE=1
fi

echo "📦 Downloading AIFrameOS core components..."

if [ $IS_UPDATE -eq 1 ]; then
    TMP_DIR=$(mktemp -d)
    curl -sSL "https://github.com/sathya-py/aiframeos/archive/refs/heads/main.tar.gz" | tar -xz -C "$TMP_DIR" "aiframeos-main/.aiframe" --strip-components=1
    
    # Overwrite kernel core and commands
    cp -R "$TMP_DIR/.aiframe/core" "$AIFRAME_DIR/"
    cp -R "$TMP_DIR/.aiframe/commands" "$AIFRAME_DIR/"
    cp -R "$TMP_DIR/.aiframe/prompts" "$AIFRAME_DIR/"
    
    # Safely merge default skills and examples without overwriting custom ones
    cp -Rn "$TMP_DIR/.aiframe/skills" "$AIFRAME_DIR/" 2>/dev/null || true
    cp -Rn "$TMP_DIR/.aiframe/examples" "$AIFRAME_DIR/" 2>/dev/null || true
    
    rm -rf "$TMP_DIR"
    echo "✅ Core engine updated. User configurations and PRPs preserved."
else
    # Greenfield install
    curl -sSL "https://github.com/sathya-py/aiframeos/archive/refs/heads/main.tar.gz" | tar -xz "aiframeos-main/.aiframe" --strip-components=1
    # Ensure tracking folders exist (Git does not track empty directories)
    mkdir -p "$AIFRAME_DIR/dev-docs/docs-of-interest"
    mkdir -p "$AIFRAME_DIR/dev-docs/architecture"
    mkdir -p "$AIFRAME_DIR/dev-docs/commentaries"
    mkdir -p "$AIFRAME_DIR/prps"
    echo "✅ AIFrameOS directory structure created."
fi
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
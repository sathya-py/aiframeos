Write-Host "🚀 Bootstrapping AIFrameOS..."

$AIFRAME_DIR = ".aiframe"

If (Test-Path $AIFRAME_DIR) {
    Write-Host "⚠️  AIFrameOS is already installed in this directory."
    Write-Host "To re-initialize, run your AI assistant and say: 'Run the /init protocol'"
    Exit
}

Write-Host "📦 Downloading AIFrameOS core components..."

New-Item -Path "$AIFRAME_DIR/core" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/commands" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/prompts/templates" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/dev-docs/architecture" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/dev-docs/ssot" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/dev-docs/docs-of-interest" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/dev-docs/commentaries" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/prps" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/status" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/skills" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/examples" -ItemType Directory -Force | Out-Null

Write-Host "Creating default configurations..."

Set-Content -Path "$AIFRAME_DIR/status/catalog.json" -Value '{ "version": "1.0", "tasks": [] }'
Set-Content -Path "$AIFRAME_DIR/status/project_state.yaml" -Value 'audit: { project_status: "Pending Init" }'

Write-Host "✅ AIFrameOS directory structure created."
Write-Host ""
Write-Host "========================================================"
Write-Host "🎉 INSTALLATION COMPLETE!"
Write-Host ""
Write-Host "Next Steps:"
Write-Host "1. Open your AI IDE (Cursor, Windsurf, Claude Code, or Gemini)."
Write-Host "2. Paste the following command into the AI chat to finish setup:"
Write-Host ""
Write-Host "   Read and execute the instructions in .aiframe/commands/init.md"
Write-Host ""
Write-Host "========================================================"

Write-Host "🚀 Bootstrapping AIFrameOS..."

$AIFRAME_DIR = ".aiframe"

If (Test-Path $AIFRAME_DIR) {
    Write-Host "⚠️  AIFrameOS is already installed in this directory."
    Write-Host "To re-initialize, run your AI assistant and say: 'Run the /init protocol'"
    Exit
}

Write-Host "📦 Downloading AIFrameOS core components..."

$TMP_DIR = Join-Path $env:TEMP "aiframeos-install-$(Get-Random)"
New-Item -Path $TMP_DIR -ItemType Directory -Force | Out-Null
$ZIP_FILE = Join-Path $TMP_DIR "main.zip"

Invoke-WebRequest -Uri "https://github.com/sathya-py/aiframeos/archive/refs/heads/main.zip" -OutFile $ZIP_FILE

Expand-Archive -Path $ZIP_FILE -DestinationPath $TMP_DIR -Force

Move-Item -Path (Join-Path $TMP_DIR "aiframeos-main\.aiframe") -Destination "."

Remove-Item $TMP_DIR -Recurse -Force

# Create empty directories not tracked by git
New-Item -Path "$AIFRAME_DIR/dev-docs/docs-of-interest" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/dev-docs/architecture" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/dev-docs/commentaries" -ItemType Directory -Force | Out-Null
New-Item -Path "$AIFRAME_DIR/prps" -ItemType Directory -Force | Out-Null

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
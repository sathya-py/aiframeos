Write-Host "🚀 Bootstrapping AIFrameOS..."

$AIFRAME_DIR = ".aiframe"

$IS_UPDATE = $false
If (Test-Path $AIFRAME_DIR) {
    Write-Host "🔄 AIFrameOS is already installed. Performing non-destructive update..."
    $IS_UPDATE = $true
}

Write-Host "📦 Downloading AIFrameOS core components..."

$TMP_DIR = Join-Path $env:TEMP "aiframeos-install-$(Get-Random)"
New-Item -Path $TMP_DIR -ItemType Directory -Force | Out-Null
$ZIP_FILE = Join-Path $TMP_DIR "main.zip"

Invoke-WebRequest -Uri "https://github.com/sathya-py/aiframeos/archive/refs/heads/main.zip" -OutFile $ZIP_FILE
Expand-Archive -Path $ZIP_FILE -DestinationPath $TMP_DIR -Force

If ($IS_UPDATE) {
    $EXTRACTED = Join-Path $TMP_DIR "aiframeos-main\.aiframe"
    
    # Overwrite Core OS files
    Copy-Item -Path (Join-Path $EXTRACTED "core") -Destination $AIFRAME_DIR -Recurse -Force
    Copy-Item -Path (Join-Path $EXTRACTED "commands") -Destination $AIFRAME_DIR -Recurse -Force
    Copy-Item -Path (Join-Path $EXTRACTED "prompts") -Destination $AIFRAME_DIR -Recurse -Force
    
    # Merge skills and examples (do not overwrite existing)
    $skills = Get-ChildItem -Path (Join-Path $EXTRACTED "skills") -File
    foreach ($s in $skills) {
        $dest = Join-Path $AIFRAME_DIR "skills\$($s.Name)"
        If (-Not (Test-Path $dest)) { Copy-Item $s.FullName -Destination $dest }
    }
    
    $examples = Get-ChildItem -Path (Join-Path $EXTRACTED "examples") -File
    foreach ($e in $examples) {
        $dest = Join-Path $AIFRAME_DIR "examples\$($e.Name)"
        If (-Not (Test-Path $dest)) { Copy-Item $e.FullName -Destination $dest }
    }
    
    Write-Host "✅ Core engine updated. User configurations and PRPs preserved."
} Else {
    Move-Item -Path (Join-Path $TMP_DIR "aiframeos-main\.aiframe") -Destination "." -Force
    
    # Create empty directories not tracked by git
    New-Item -Path "$AIFRAME_DIR/dev-docs/docs-of-interest" -ItemType Directory -Force | Out-Null
    New-Item -Path "$AIFRAME_DIR/dev-docs/architecture" -ItemType Directory -Force | Out-Null
    New-Item -Path "$AIFRAME_DIR/dev-docs/commentaries" -ItemType Directory -Force | Out-Null
    New-Item -Path "$AIFRAME_DIR/prps" -ItemType Directory -Force | Out-Null
    
    Write-Host "✅ AIFrameOS directory structure created."
}

Remove-Item $TMP_DIR -Recurse -Force
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
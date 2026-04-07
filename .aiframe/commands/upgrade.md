# /upgrade
# Description: Migrate or update the AIFrameOS Kernel to the latest version.

## Discovery
1. Check current version: `cat .aiframe/core/wisc_engine.yaml | grep version`
2. Audit for legacy structure: Check if `.aiframe/rules/` or `.aiframe/status/HANDOFF.md` exist.

## Upgrade Protocol
If an upgrade is needed:
1. **Explain:** Tell the user what the new version brings (e.g., "WISC v2.0 brings 25x token efficiency via HANDOFF.md").
2. **Execute:** 
   - **Option A (Shell Script - Recommended):**
     - Linux/Mac/WSL: `curl -sSL https://raw.githubusercontent.com/sathya-py/aiframeos/main/install.sh | bash`
     - Windows (PS): `irm https://raw.githubusercontent.com/sathya-py/aiframeos/main/install.ps1 | iex`
   - **Option B (Surgical Sub-agent Update):** Use a sub-agent to fetch latest files from `https://github.com/sathya-py/aiframeos/archive/refs/heads/main.tar.gz`.
3. **Migrate:** 
   - Move relevant files from old structure to new (e.g., `user-docs/prds/glossary.yaml` -> `.aiframe/ai-data/glossary.yaml`).
   - Create missing directories: `rules/`, `ai-data/`, `status/plans/`, `validators/`.

## Post-Upgrade
1. Run `/status` to confirm the new kernel is operational.
2. Commit changes with `Context: AIFrameOS Kernel Upgrade to v[version]`.

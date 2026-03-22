# Command: `/defrag`

## Objective
Garbage collect and compress the AIFrameOS memory (status logs and SSOT YAMLs) to recover token space and prevent the OS from becoming bloated over time.

## Execution Steps

1. **Catalog Pruning**:
   - Scan `.aiframe/status/catalog.json`.
   - Take all `COMPLETED` PRPs older than 7 days (or immediately if requested) and move them to an archive file (`.aiframe/status/archive.json`).
   - Leave only a heavily summarized "changelog" of what those PRPs achieved in the active catalog.

2. **SSOT Consolidation**:
   - Read through the `.aiframe/dev-docs/ssot/*.yaml` files.
   - Look for duplicated rules, redundant data structures, or orphaned constraints that no longer apply to the current architecture.
   - Rewrite the YAML files to be as terse and token-efficient as possible without losing strict "Machine Law" meaning.

3. **Output**:
   - Report the estimated token savings and cleanup actions to the user.

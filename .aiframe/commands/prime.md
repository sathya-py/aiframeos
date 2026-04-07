# /prime-[subsystem]
# Description: Scoped context loading for a specific part of the codebase.

## Use Cases
- `/prime-core`: Only core kernel files.
- `/prime-ui`: Only frontend components.
- `/prime-api`: Only backend/integration logic.

## Steps
1. **Locate**: Scan for files in the `[subsystem]` directory.
2. **Surface**: `rg "pub fn|export function|class " [key files] -l`
3. **History**: `git log --oneline -3 -- [subsystem/]`
4. **Load**: Load Tier 2 rules for this subsystem from `.aiframe/rules/`.
5. **Report**: Summarize subsystem state in <100 words.

## Subsystem Definition
Subsystems are defined by their root directory under `src/` or similar.
If a subsystem isn't found, default to broad search within that folder.

# Command: `/tempwipe`

## Objective
Safely clean and prune the `.tmp/` directory at the project root to prevent accumulation
of explorative downloads, transient AI scratchpads, and temporary files.

## Trigger
Invoked periodically by the main agent or manually by the user to free up workspace clutter.

## Execution Steps

1. **Target Identification**:
   - Resolve the absolute path to `.tmp/` at the project root.
   - If `.tmp/` does not exist, notify the user and exit gracefully.

2. **Deletion**:
   - Delete all contents (files and subdirectories) inside `.tmp/`.
   - The `.tmp/` directory itself must be retained, or recreated immediately if removed.
   - Preserve `.gitkeep` and `.gitignore` files if present.

3. **Confirmation**:
   - Output a compressed one-line summary: files deleted, bytes freed (approximate).

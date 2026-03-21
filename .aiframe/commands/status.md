# Command: `/status`

## Objective
Provide the user with a highly readable, bird's-eye view of the current AIFrameOS task execution state. This acts as the "Operating System Dashboard."

## Execution Steps

1. **Read Status Data**: 
   - Load `.aiframe/status/catalog.json`.
   - Load `.aiframe/status/project_state.yaml`.

2. **Format Output**:
   - Do NOT modify any files.
   - Generate a Markdown response directly in the chat interface.

3. **Output Structure**:
   Output the data in the following exact format:

   ```markdown
   ## 📊 AIFrameOS Status Report
   **Stack Detected:** [Read from project_state.yaml]
   **Active Rules:** [Read from project_state.yaml]

   ### Task Catalog
   | Task ID | Intent | Status |
   |---------|--------|--------|
   | [task_id] | [intent summary] | 🟡 PENDING / 🟢 COMPLETED / 🔴 FAILED |
   
   *(If the catalog is empty, output: "No tasks currently registered. Run `/generate-prp` to create your first blueprint.")*
   ```

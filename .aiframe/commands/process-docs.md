# Command: `/process-docs`

## Objective
Act as the intake processor for raw documentation, notes, or external requirements placed in `dev-docs/docs-of-interest/`.

## Execution Steps

1. **Intake Scan**: 
   - Read all files present in the `dev-docs/docs-of-interest/` directory.

2. **Information Extraction & Splitting**:
   - Analyze the content to separate **Machine-Readable Technical Truths** from **Human-Readable Architecture/Philosophy**.

3. **SSOT Generation (AI-Only)**:
   - Extract strict contracts, data models, API schemas, and architectural constraints.
   - Format these into strict YAML and save them or merge them into existing files in `dev-docs/ssot/` (e.g., `data_models.yaml`, `api_contracts.yaml`).

4. **Architecture Docs Generation (Human)**:
   - Extract the "Why", the historical context, the user journey, and high-level design philosophy.
   - Format these into Markdown and save them in `dev-docs/architecture/` or `dev-docs/commentaries/`.

5. **Cleanup**:
   - Once processing is completely verified, prompt the user for permission to move the processed files from `dev-docs/docs-of-interest/` to an archive directory or delete them to clear the intake queue.

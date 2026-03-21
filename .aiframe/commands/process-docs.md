# Command: `/process-docs`

## Objective
Act as the intake processor for raw documentation, notes, or external requirements placed in `dev-docs/docs-of-interest/`. It recursively processes directories, splits information, and automatically archives consumed files.

## Execution Steps

1. **Intake Scan & Token Gate**:
   - Recursively scan all files and subfolders within `dev-docs/docs-of-interest/` (excluding the `archive/` folder).
   - **CRITICAL WARNING:** If there is a large volume of files (e.g., > 5 files), you must pause and warn the user: *"I detected X files. Processing all of them at once will consume a large amount of tokens. Shall I process them in batches, process all now, or abort?"*
   - Await explicit user permission before proceeding with a large ingestion.

2. **Information Extraction & Splitting**:
   - Analyze the content to separate **Machine-Readable Technical Truths** from **Human-Readable Architecture/Philosophy**.

3. **SSOT Generation (AI-Only)**:
   - Extract strict contracts, data models, API schemas, and architectural constraints.
   - Format these into strict YAML and save them or merge them into existing files in `dev-docs/ssot/` (e.g., `data_models.yaml`, `api_contracts.yaml`).

4. **Architecture & Commentary Generation (Human)**:
   - Extract the "Why", the historical context, the user journey, and high-level design philosophy.
   - Format these into Markdown and save them appropriately in `dev-docs/architecture/` or `dev-docs/commentaries/`.

5. **Cleanup & Archiving**:
   - Create a `dev-docs/docs-of-interest/archive/` folder if it does not exist.
   - Move all successfully processed files into the `archive/` folder to preserve a history of what was ingested.
   - Clean up and remove any empty directories left behind in the root `docs-of-interest/` directory to clear the intake queue.

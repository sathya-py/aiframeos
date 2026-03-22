# Discovery Protocol: `init.md`

## Triggered Action
When this initialization sequence is requested, perform a **System Reset** and execute the following deterministic steps:

### 1. Heuristic Audit & Stack Sniffing
- Scan the root directory for "Gravity Files" (e.g., `package.json`, `Cargo.toml`, `.csproj`, `go.mod`, `pyproject.toml`, `docker-compose.yml`).
- Determine the technology stack **and specific versions** based on these files (e.g., "Svelte 5", "Rust 2021", ".NET 8").
- Classify the project status:
  - **Brownfield**: Significant pre-existing codebase detected.
  - **Greenfield**: Empty or minimally populated repository.

### 2. Domain Context Query
- Stop and explicitly ask the user: *"What is the business domain or primary purpose of this project? (e.g., Finance, Algorithmic Trading, E-commerce, Gaming)?"*
- Wait for the user's response before proceeding to generate skills.

### 3. Dynamic Skill Provisioning & Environment Tailoring
- Based on the detected stack and the user's domain context, **auto-generate specific specialized `.md` skill files** directly into `.aiframe/skills/`.
  - *Example:* If Svelte 5 is detected, generate `svelte5-specialist.md` strictly prohibiting Svelte 4 legacy patterns.
  - *Example:* If the domain is Finance and stack is Rust, generate `rust-fintech-expert.md` detailing precision float handling and high-performance patterns.
- Auto-generate or update `.aiframe/core/rules.yaml` to include stack-specific constraints (e.g., specific linters, testing frameworks, idiomatic patterns).

### 4. Documentation Initialization
- Generate the following directory structure if it does not exist:
  - `dev-docs/architecture/` (For `.md` human-readable design docs)
  - `dev-docs/ssot/` (For `.yaml` AI-only machine-readable technical truths)
  - `dev-docs/docs-of-interest/` (Intake folder for raw notes)
  - `dev-docs/commentaries/` (For `.md` historical context and gotchas)

### 4. IDE & AI Assistant Bootstrapping
- Generate global instruction files in the workspace root to teach AI assistants how to map slash commands (e.g., `/generate-prp`) to their respective files in `.aiframe/commands/`.
- **Create or Update the following files** with this exact directive: 
  *"AIFrameOS Routing Directive: When the user invokes a command starting with a slash (e.g., `/generate-prp`, `/execute-prp`, `/process-docs`), do not assume its meaning. You MUST immediately read and strictly execute the corresponding markdown file located at `.aiframe/commands/[command].md`."*
  - `.cursorrules` (For Cursor)
  - `.windsurfrules` (For Windsurf)
  - `.clinerules` (For Cline)
  - `CLAUDE.md` (For Claude Code)
  - `GEMINI.md` (For Gemini CLI - append if it already exists)
  - `.github/copilot-instructions.md` (For GitHub Copilot)

### 5. State Output
- Compile the findings into a structured state output.
- Save the result to `.aiframe/status/project_state.yaml` capturing the detected stack, project type, and initialized paths.

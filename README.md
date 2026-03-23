# 🌌 AIFrameOS: The Context-Engineered AI Operating System

AIFrameOS is a lightweight, configuration-based orchestration layer designed to live alongside your codebase in a `.aiframe/` directory. It transforms any capable AI assistant (Cursor, VS Code + Claude Code, Gemini CLI, Cline, Windsurf) into a highly deterministic, token-efficient developer.

It features a **universal, non-destructive 1-line installation/update script** natively supported on Mac, Linux, and Windows.

By relying on strict **Context Engineering**, the **WISC Protocol** (with built-in self-healing), and **Metaprompting**, AIFrameOS ensures that AI-generated code is surgically precise, architecturally consistent, and virtually hallucination-free.

### 🌟 Key Features
- **Context-Aware Initialization:** Automatically detects your tech stack (e.g., Svelte 5, Rust) and domain to generate specialized AI skills.
- **Sub-Agent Orchestration:** Delegates complex tasks to isolated sub-agents to prevent context degradation and token bloat.
- **Self-Healing WISC Engine:** Automatically takes pre-flight git snapshots and executes retry loops if validation gates fail.
- **MCP Tool Assimilation:** Seamlessly ingests external data (Jira, Figma, DB schemas) via Model Context Protocol into system-enforced constraints.
- **Non-Destructive Updates:** Safely upgrade the core AIFrameOS engine without losing your custom constraints or prompts.

---

## 🙏 Credits & Architectural DNA

AIFrameOS is heavily inspired by and directly integrates concepts from the following open-source pioneers:

*   **[Context Engineering Intro](https://github.com/coleam00/context-engineering-intro)** by Coleam00: The foundational implementation of the **WISC Protocol** (Write, Isolate, Select, Compress) and the concept of Project-Requirement-Prompts (PRPs).
*   **[Link-in-Bio Page Builder](https://github.com/coleam00/link-in-bio-page-builder)** by Coleam00: Showcasing the power of **Pattern Mimicry** and "Few-Shot" prompting via `examples/` folders rather than verbose rules.
*   **[MetaPromptFramework](https://github.com/sathya-py/metapromptframework)** by Sathya-py: The engine for our recursive templates, integrating **CRAFT** (Context, Role, Action, Format, Target) and **Prompter-Agent** patterns.
*   **[Antigravity Awesome Skills](https://github.com/sickn33/antigravity-awesome-skills/)**: Providing pluggable, modular AI capabilities to handle hyper-specific domains (e.g., Clean Architecture, strict TypeScript, MCP).

**🤖 Special Thanks:** A massive shoutout to **Google Gemini** and **OpenAI ChatGPT** for acting as the tirelessly collaborating co-architects in bringing this vision to life from scratch.

---

## 🚀 Why AIFrameOS?

Standard "Prompt Engineering" treats the AI like a chatbot. "Vibe Coding" treats it like magic, which eventually leads to chaotic codebases and massive token bills.

**Context Engineering** treats the AI like a compiler.
AIFrameOS uses a dual-format architecture:
1.  **Machine Law (YAML/JSON):** Strict Single Sources of Truth (SSOT), task payloads (PRPs), and constraints.
2.  **Human Intent (Markdown):** Architectural commentary, intent requests, and design philosophy.

This prevents the AI from context-drift, forces it to only read the exact symbols it needs (Symbolic Resolution), and requires validation tests before any task is marked complete.

---

## 🛠️ Step-by-Step Guide: How to Install and Use

You can drop AIFrameOS into a brand-new ("Greenfield") project or an existing ("Brownfield") legacy codebase.

### Step 1: Installation
To bootstrap AIFrameOS into your project, run the command for your operating system in your terminal:

**Mac / Linux / WSL:**
```bash
curl -sSL https://raw.githubusercontent.com/sathya-py/AIFrameOS/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/sathya-py/AIFrameOS/main/install.ps1 | iex
```

**What happens:**
The script downloads the `.aiframe/` structure into your project. It then prompts you to open your AI IDE (Cursor, Windsurf, Claude Code, Gemini CLI, etc.) and paste the following text into the chat for your very first command:
> **"Read and execute the instructions in `.aiframe/commands/init.md`"**

This will Bootstrap your IDE. It will automatically create configuration files for your specific AI (`.cursorrules`, `.windsurfrules`, `.clinerules`, `CLAUDE.md`, `GEMINI.md`, and `.github/copilot-instructions.md`). These files teach your AI that from now on, any slash command (like `/generate-prp`) maps directly to the routing scripts inside `.aiframe/commands/`.

### Step 2: Seed the Knowledge Base
Instead of giving the AI a massive markdown file of rules, split your knowledge:
*   **`dev-docs/ssot/*.yaml`**: Write your strict data contracts, API schemas, and core concepts here. The AI will read this for absolute truth.
*   **`examples/`**: Place perfect code snippets here. The AI is instructed to use "Pattern Mimicry" to copy the style and structure of these examples exactly.

*Optional Intake:* Drop raw notes into `dev-docs/docs-of-interest/` and tell the AI to **"Run `/process-docs`"** to have it automatically split the text into Machine-Readable YAML (SSOT) and Human-Readable Markdown (Architecture).

### Step 3: Generating a Project-Requirement-Prompt (PRP)
Now that your IDE is bootstrapped, you can use the slash commands natively! Never ask the AI to "build a feature" directly. Instead, compile a blueprint.

Tell your AI:
> **"/generate-prp Implement a JWT authentication layer"**

**What happens:**
The AI executes `.aiframe/commands/generate-prp.md`.
1. It parses your intent into CRAFT metaprompt variables (`{{ROLE}}`, `{{ACTION}}`).
2. It uses the WISC protocol to *Select* exactly which files and symbols it needs (Context Anchors).
3. It generates a strict `.yaml` blueprint in the `.aiframe/prps/` folder and registers it in `catalog.json`.

### Step 4: Deterministic Execution
Once you have reviewed the generated `.yaml` PRP, tell your AI:
> **"/execute-prp for task ID [task_id]"**

**What happens:**
The AI executes `.aiframe/commands/execute-prp.md`.
1. **Sub-Agent Delegation:** If the task is complex, it automatically spins up `/subagent` subprocesses with clean context windows to handle isolated chunks of work.
2. **Isolate & Write:** It is physically restricted to modifying *only* the files listed in the Context Anchors (WISC).
3. **Mimicry:** It formats code strictly based on the `examples/` provided.
4. **Validate & Recover:** It *must* run validation commands (e.g., `npm run test`). If tests fail, it attempts a 3-try self-healing loop to diagnose and fix errors before rolling back.
5. **Compress:** Upon success, it updates `catalog.json` and flushes the context, keeping the chat history lean and cheap.

---

## 📂 Framework Directory Map

```text
.aiframe/
├── core/
│   ├── bootloader.md        # The Persona & format-priority rule (YAML > MD)
│   ├── rules.yaml           # Strict constraints (halt_on_violation)
│   └── wisc_engine.yaml     # WISC (Write, Isolate, Select, Compress) execution logic
├── commands/                # The Execution Pipelines
│   ├── init.md              # Discovery, stack sniffing, and IDE bootstrapping
│   ├── generate-prp.md      # Intent -> CRAFT/Agent Metaprompt compiler
│   ├── execute-prp.md       # Deterministic executor & validation gate
│   ├── process-docs.md      # Intake processor for raw notes
│   ├── subagent.md          # Multi-agent subprocess delegation
│   ├── assimilate.md        # MCP integration for external knowledge ingestion
│   └── defrag.md            # Memory/token compression and catalog cleanup
├── prompts/                 # Metaprompt Framework templates
│   └── templates/
│       ├── CRAFT.md         # Context/Role/Action/Format/Target
│       └── Agent.md         # Multi-agent simulation prompts
├── dev-docs/                # Knowledge Base
│   ├── architecture/        # Human-readable design & philosophy (.md)
│   ├── ssot/                # AI-Only technical truth contracts (.yaml)
│   ├── docs-of-interest/    # Intake queue for `/process-docs`
│   └── commentaries/        # Historical context & gotchas (.md)
├── prps/                    # Compiled blueprints waiting to be executed (.yaml)
├── status/                  # Token tracking and execution catalogs (.json)
├── skills/                  # Pluggable modular capabilities (e.g., 'typescript-expert')
└── examples/                # High-fidelity code snippets for Pattern Mimicry
```

---

## 🧠 Pluggable Skills

AIFrameOS supports dropping `.md` skill files directly into `.aiframe/skills/`.
By default, this repository includes standard skills derived from Antigravity Awesome Skills:
*   `typescript-expert`: Enforces strict types and performance diagnostics.
*   `agent-memory-mcp`: Implements Model Context Protocol patterns.
*   `uncle-bob-craft`: Enforces Clean Architecture checklists.

When running `/generate-prp`, the engine automatically activates relevant skills to define the specific `{{ROLE}}` variable for the task.

---

## 🤝 Open Source Contribution

AIFrameOS is designed to be highly modular. You are encouraged to fork, create new commands in the `commands/` directory, build new `prompts/templates`, or contribute specialized `.yaml` schemas for the `dev-docs/ssot/`.

Let's stop chatting with our codebases and start compiling context.

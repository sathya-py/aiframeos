# GEMINI.md — aiframeos (AI Kernel Engine)

## Project Overview
**aiframeos** is a framework for managing Large Language Model (LLM) resources, agent scheduling, and context engineering. It implements the **WISC 3-Tier Architecture** to minimize token waste and maximize agentic precision.

### Core Concepts (WISC v2)
- **Tier 1 (Core):** Bootloader, Rules, and Session Bridges. (Always Loaded)
- **Tier 2 (Rules):** Path-triggered technology/layer rules. (Auto-Activated)
- **Tier 3 (Docs):** Deep reference, scout-gated with headers. (Scout-Gated)
- **Session Bridge:** `HANDOFF.md` replaces conversation history, saving ~25x tokens.

## Running the Framework
The framework is controlled through specific commands in `.aiframe/commands/`.

### Commands (Simplified)
- `/status`: Check current state, next action, and context health.
- `/handoff`: Bridge current session to the next (Writes `HANDOFF.md`).
- `/prime-[subsystem]`: Scoped priming for a specific codebase area.
- `/plan-task [ID]`: Research and generate a Plan-Execution separation.
- `/execute-task [ID]`: Perform surgical changes based on a READY plan.

## AI Kernel Rules
- **Surgical Updates:** Never overwrite files; use precise replacements.
- **SSOT Enforcement:** Data structures must follow `dev-docs/ssot/` definitions.
- **Invariants (INV-XX-XX):** Hard architectural constraints.
- **Git Memory:** Every framework change includes a `Context:` block in the commit.

## Development Strategy
1. **Plan (Session A):** Noise-heavy exploration, culminating in a `status/plans/*.md` file.
2. **Execute (Session B):** Clean context, reading only the Plan and `HANDOFF.md`.
3. **Validate:** Automated gates in `.aiframe/validators/`.

---
*Status: WISC v2.0 Active*

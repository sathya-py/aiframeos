# 🌌 AIFrameOS: The Context-Engineered AI Kernel (v2.0)

> **"Stop paying for AI noise. Start using an AI Kernel."**

AIFrameOS is a lightweight, configuration-based orchestration layer that lives in your project's `.aiframe/` directory. It transforms standard AI assistants (Cursor, Gemini, Claude, Windsurf) into **High-Precision Engineering Agents** using the **WISC v2 Architecture**.

---

## 🚀 The "Novice" Path: AI that Remembers

If you've ever felt your AI "getting stupid" or "forgetting the plan" after a long conversation, AIFrameOS is for you.

### 1. Installation (1-Line)
Run this in your terminal to drop the Kernel into any project:
```bash
# Mac / Linux / WSL
curl -sSL https://raw.githubusercontent.com/sathya-py/AIFrameOS/main/install.sh | bash
```

### 2. The Magic Command: `/handoff`
When you're done for the day, or the AI starts getting confused, just type `/handoff`.
*   **What it does:** The AI writes a tiny "Save Game" file (`HANDOFF.md`) and clears its own "brain."
*   **The Result:** Your next session starts with a clean slate but 100% of the memory. No more re-explaining your code!

### 3. Scoped Work: `/prime-[subsystem]`
Don't let the AI read everything. Tell it `/prime-ui` or `/prime-backend`. It only loads what it needs, keeping it fast and accurate.

---

## 🧠 The "Expert" Path: WISC v2 Architecture

For the AI Architect and Integrator, AIFrameOS implements a formal **3-Tier Context Architecture** to solve the "Session-Growth Problem."

### Token ROI: History vs. State
| Approach | Token Cost (Avg) | Reliability |
|----------|------------------|-------------|
| **Standard Chat History** | 50,000 - 150,000+ | 📉 (Drift/Hallucination) |
| **WISC v2 (State-Bridged)** | **2,000 - 5,000** | 🎯 (Deterministic) |

### The 3-Tier Context System
1.  **Tier 1 (Core):** Always loaded. System Law & Session Bridges (< 500 lines).
2.  **Tier 2 (Rules):** Path-triggered. Technology-specific rules (TS, Rust, CSS) auto-activate based on the files you edit.
3.  **Tier 3 (Docs):** Scout-Gated. Deep references. The AI reads only "Headers" first; full docs are loaded only if a "Scout" confirms relevance.

### Deterministic Execution (Plan → Execute)
We separate **Planning** (Noise-heavy research) from **Execution** (Surgical code changes).
*   **Session A (Planning):** Results in a `.aiframe/status/plans/task-plan.md`.
*   **Session B (Execution):** A fresh session that reads *only* the Plan and `HANDOFF.md`. Zero noise. Zero drift.

---

## 📂 Kernel Directory Map

```text
.aiframe/
├── core/                # Tier 1: Machine Law & WISC v2 Engine
├── commands/            # The Execution Pipelines (/handoff, /prime, /plan)
├── rules/               # Tier 2: Path-triggered technology rules
├── dev-docs/            # Tier 3: Deep architecture & SSOT (Single Source of Truth)
├── ai-data/             # AI-Managed stable reference (Glossaries, Terms)
├── status/              # Session artifacts (HANDOFF.md, Plans, Catalogs)
├── skills/              # Pluggable modular expertises
└── examples/            # High-fidelity code for Pattern Mimicry
```

---

## 🛠️ Advanced Integration

AIFrameOS is designed to be the "Standard Library" for your AI.
*   **SSOT (Single Source of Truth):** Keep your API schemas in `dev-docs/ssot/*.yaml`. The AI is instructed to treat these as "The Truth" over its own training data.
*   **Invariants (INV-XX):** Define hard rules (e.g., "No floats for currency"). The AI will halt execution if a plan violates an invariant.

### Credits & DNA
Heavily inspired by the pioneers of Context Engineering:
*   **[coleam00/context-engineering-intro](https://github.com/coleam00/context-engineering-intro)** (WISC Protocol)
*   **[sathya-py/metapromptframework](https://github.com/sathya-py/metapromptframework)** (CRAFT/Agent Metaprompts)
*   **[Antigravity Awesome Skills](https://github.com/sickn33/antigravity-awesome-skills/)** (Modular AI Skills)

---

**Ready to start?** Run `ls .aiframe/index.md` to see your internal navigation hub.

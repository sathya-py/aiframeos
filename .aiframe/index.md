# AIFrameOS Index — Navigation Hub

## Quick Start for New AI Sessions
1. **[.aiframe/status/HANDOFF.md](./status/HANDOFF.md)** — Start here for session bridge.
2. **[.aiframe/core/bootloader.md](./core/bootloader.md)** — System initialization and overview.
3. **[.aiframe/core/rules.yaml](./core/rules.yaml)** — Constraints and Invariants.
4. **[.aiframe/core/wisc_engine.yaml](./core/wisc_engine.yaml)** — WISC v2 Protocol.

## Navigation Layers

### Tier 1: Core System (Always Loaded)
| Path | Purpose |
|------|---------|
| [core/](./core/) | Bootloader, rules, and WISC engine |
| [status/HANDOFF.md](./status/HANDOFF.md) | Current session state |

### Tier 2: Domain Rules (Path-Triggered)
| Path | Purpose |
|------|---------|
| [rules/](./rules/) | Technology-specific rules (TS, Rust, UI) |

### Tier 3: Architecture & Reference (Scout-Gated)
| Path | Purpose |
|------|---------|
| [dev-docs/](./dev-docs/) | Deep architecture docs, SSOTs, schemas |
| [skills/](./skills/) | Compressed domain expertise |

## AI-Managed Data (Stable)
| Path | Purpose |
|------|---------|
| [ai-data/](./ai-data/) | Glossaries, canonical terms, and validation history |

## Workspace (Volatile)
| Path | Purpose |
|------|---------|
| [status/plans/](./status/plans/) | Execution plans for active tasks |
| [prps/](./prps/) | Task specifications and tracking |

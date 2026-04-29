# AIFrameOS Index — Navigation Hub

## Quick Start for New AI Sessions
1. **[.aiframe/status/HANDOFF.md](./status/HANDOFF.md)** — Start here for session bridge.
2. **[.aiframe/core/bootloader.md](./core/bootloader.md)** — System initialization and directives.
3. **[.aiframe/core/rules.yaml](./core/rules.yaml)** — Constraints and Invariants (TIER 0).
4. **[.aiframe/core/wisc_engine.yaml](./core/wisc_engine.yaml)** — WISC v2 Context Protocol.
5. **[.aiframe/core/command-manifest.yaml](./core/command-manifest.yaml)** — All commands at a glance.

---

## Navigation Layers

### Tier 1: Core System (Always Loaded)
| Path | Purpose |
|------|---------|
| [core/bootloader.md](./core/bootloader.md) | Persona, directives, Hierarchy of Truth |
| [core/rules.yaml](./core/rules.yaml) | Machine law — non-negotiable |
| [core/wisc_engine.yaml](./core/wisc_engine.yaml) | 3-tier context architecture |
| [core/command-manifest.yaml](./core/command-manifest.yaml) | Command index + model assignments |
| [core/model-router.yaml](./core/model-router.yaml) | Automatic model selection rules |
| [status/HANDOFF.md](./status/HANDOFF.md) | Current session state |

### Tier 2: Domain Rules (Path-Triggered)
| Path | Purpose |
|------|---------|
| [rules/](./rules/) | Technology-specific rules (TypeScript, Rust, UI, etc.) |

### Tier 3: Architecture & Reference (Scout-Gated)
| Path | Purpose |
|------|---------|
| [dev-docs/architecture/](./dev-docs/architecture/) | Human-readable design docs |
| [dev-docs/commentaries/](./dev-docs/commentaries/) | Historical context, gotchas |
| [dev-docs/ssot/](./dev-docs/ssot/) | Machine-readable contracts and schemas |
| [skills/](./skills/) | Compressed domain expertise modules |

### Tier 3.5: Curated Extracts (Legacy Reference Only)
| Path | Purpose |
|------|---------|
| [dev-docs/extracts/](./dev-docs/extracts/) | Curated legacy code — reference for algorithms and patterns; never authoritative over SSOT |

---

## Commands Reference

### Planning
| Command | Purpose |
|---------|---------|
| `/init` | Bootstrap new project — stack detection, skill generation |
| `/generate-prd` | Broad feature → structured PRD (supports autonomous batch mode) |
| `/generate-prp` | Specific task → machine-optimized PRP YAML |

### Execution
| Command | Purpose |
|---------|---------|
| `/execute-prp` | Deterministically run a PRP with WISC enforcement |
| `/subagent` | Delegate isolated work to a parallel sub-agent |

### Migration
| Command | Purpose |
|---------|---------|
| `/salvage` | 4-stage pipeline to port legacy code without importing architectural debt |

### Context Management
| Command | Purpose |
|---------|---------|
| `/status` | Dashboard — pending tasks, catalog state |
| `/prime` | Load scoped context for a specific subsystem |
| `/handoff` | Save session state to HANDOFF.md for next session |
| `/defrag` | Garbage-collect stale catalog entries, compress memory |
| `/tempwipe` | Safely clean `.tmp/` scratch directory |

### Knowledge Ops
| Command | Purpose |
|---------|---------|
| `/process-docs` | Intake raw docs → SSOT YAML + architecture Markdown |
| `/assimilate` | Merge external knowledge via MCP into SSOT |
| `/extract-excerpts` | Export decisions as audience-ready excerpts (business/marketing/technical/regulatory) |

### System
| Command | Purpose |
|---------|---------|
| `/upgrade` | Migrate AIFrameOS config to a newer version |

---

## Workspace Paths

| Path | Purpose |
|------|---------|
| [status/plans/](./status/plans/) | Execution plans for active tasks |
| [prps/](./prps/) | PRP YAML specifications |
| [prds/](./prds/) | PRD Markdown files |
| [user-docs/](./user-docs/) | Salvage configs, PRD trackers, excerpt collections |
| [.tmp/](../.tmp/) | Transient scratchpad — wiped by `/tempwipe` |

---

## Workflow Pipelines

| Scenario | Pipeline |
|----------|---------|
| New feature | `/generate-prd` → `/generate-prp` → `/execute-prp` |
| Bug fix | `/generate-prp` → `/execute-prp` |
| Legacy migration | `/salvage <path>` → `/salvage --prd` → `/salvage --prp <mod>` → `/salvage --exec <mod>` |
| Knowledge intake | `/process-docs` → `/assimilate` |
| Stakeholder docs | `/extract-excerpts` |
| End of session | `/handoff` |
| Maintenance | `/defrag` → `/tempwipe` |

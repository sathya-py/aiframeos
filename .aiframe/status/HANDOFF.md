# HANDOFF — 2026-04-29

## Mandatory Initialization Sequence
On next session start, read in order:
1. `.aiframe/core/bootloader.md`
2. `.aiframe/status/HANDOFF.md` (this file)
3. `.aiframe/core/rules.yaml`

## Project Context
- **What this project is**: AIFrameOS — a portable AI-agent OS framework providing WISC v2 context architecture, memory tiers, and command protocols for any software project
- **Current phase**: v3.0 — Memory + Salvage + Documentation layer upgrade COMPLETE

## Completed This Session
- Added `command-manifest.yaml` — compact boot reference for all 15 commands with model routing
- Added `model-router.yaml` — automatic opus/sonnet/haiku selection with force-prefix override (`!opus`, `!sonnet`, `!haiku`)
- Added `/salvage` command — generalized 4-stage legacy code migration pipeline (Archaeologist → Architect → Engineer → Executor); requires user-authored `salvage-config.md` per project
- Added `/tempwipe` command — safe `.tmp/` directory pruning
- Added `/extract-excerpts` command — audience-ready docs in 4 variants (BUSINESS / MARKETING / TECHNICAL / REGULATORY); also called internally by `/generate-prd` and `/assimilate`
- Added `/generate-prd` command — full PRD generation with autonomous batch orchestration mode via `consolidated-prd.yaml` tracker
- Upgraded `bootloader.md` — added Tier 3.5 (Curated Extracts) to Hierarchy of Truth
- Upgraded `wisc_engine.yaml` to v2.1 — added Tier 3.5 definition + `command-manifest.yaml` to Tier 1 load list
- Upgraded `index.md` — complete navigation hub with all new commands, tiers, and workflow pipelines
- Upgraded `handoff.md` — robust template with Mandatory Init Sequence and Build Health sections

## Pending (Next Session)
- **First Action**: `/status` to verify catalog is clean
- Consider adding a `memory` sub-system: tiered `MarkdownIndex` + `VectorRag` backends as described in memory-enhancement notes
- Consider creating starter Tier 2 rules for common stacks (TypeScript, Python, Rust, Go)
- Consider adding a `wiki` sub-system for LLM-maintained cross-referenced knowledge base

## Key Constraints (Active)
- `/salvage` requires `salvage-config.md` before Stage 1 — intentional; no hard-coded project constraints
- `/extract-excerpts` must derive from current SSOT only; never from `dev-docs/extracts/`
- Tier 3.5 extracts are reference-only — must never override SSOT content

## Dead Ends
- Loading all skills/rules globally (too expensive; stick to Tier 2 path-triggered loading)
- None new this session

## Build Health
- No build artifacts in this repo (documentation/config-only framework)

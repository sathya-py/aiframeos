# Command: `/salvage`

## Objective
Port battle-tested code from a legacy or external codebase into the current project without
importing architectural debt, stale patterns, or constraint violations.

Runs one of four pipeline stages depending on the argument passed.

## Setup (Before First Use)
Create `.aiframe/user-docs/salvage-config.md` to define:
- `source_root`: Absolute path to the old/source project
- `skip_patterns`: File/folder names to skip entirely (generated code, build artifacts, stubs)
- `landing_map`: Table mapping old module paths → new project paths
- `hard_constraints`: Project-specific rules to enforce (e.g., no `f64` at boundaries, no mutable globals)
- `banned_symbols`: Token/pattern list that must never cross into the new codebase

If this file does not exist, the Archaeologist stage will prompt you to create it before proceeding.

---

## Argument Forms

| Invocation | Stage | Produces |
|-----------|-------|---------|
| `/salvage <rel-path>` | 1 — Archaeologist | `.aiframe/user-docs/salvage-ssot-<module>.yaml` |
| `/salvage --prd` | 2 — Architect | `.aiframe/user-docs/salvage-prd.md` |
| `/salvage --prp <module>` | 3 — Engineer | `.aiframe/prps/<module>_salvage_v1.yaml` |
| `/salvage --exec <module>` | 4 — Executor | Code files in new project |
| `/salvage --status` | Status | Print pipeline progress summary |

`<rel-path>` is relative to `source_root` defined in `salvage-config.md`.

---

## Stage 1 — Archaeologist (`/salvage <rel-path>`)

### Steps
1. Derive `<module>` from the last non-trivial path segment (e.g., `auth/src` → `auth`).
2. Read `.aiframe/user-docs/salvage-config.md` — load `skip_patterns`, `hard_constraints`, `landing_map`, `banned_symbols`.
3. Scout all source files under the given path (first 20 lines; full read only if SALVAGE candidate).
4. Skip any file matching `skip_patterns` (build artifacts, generated code, stubs, boilerplate).
5. Perform a three-pass analysis:

   **PASS 1 — INVENTORY**: For each code unit (class/struct/function/trait/interface), classify:
   - `SALVAGE` — logic correct, constraint-compliant, directly portable
   - `ADAPT` — logic correct but violates ≥1 hard constraint (state which)
   - `STRIP` — domain-wrong, obsolete, or belongs to a skipped module
   - `IGNORE` — boilerplate, generated, build artifact, test fixture not worth porting

   **PASS 2 — CONSTRAINT AUDIT**: For every SALVAGE/ADAPT item, check all hard constraints
   from `salvage-config.md`. Flag violations by constraint ID and exact location.

   **PASS 3 — LANDING MAP**: For each SALVAGE/ADAPT item, assign `target_file` in the new
   project using the landing map from `salvage-config.md`.

6. Self-review before output:
   - [ ] Every SALVAGE item has a non-empty `target_file`
   - [ ] Every ADAPT item has non-empty `adapt_notes` explaining the required change
   - [ ] Every STRIP item has a non-empty `strip_reason`
   - [ ] No banned symbol appears in any SALVAGE item
   - [ ] No item maps to a skipped module

7. Write output to `.aiframe/user-docs/salvage-ssot-<module>.yaml`:

```yaml
ssot_version: "1.0"
source_module: <module>
source_root: "<path from salvage-config>"
analysis_date: <today>
salvage_modules:
  - id: <snake_case unique id>
    source_file: <relative path within old project>
    code_unit: <ClassName / fn_name / trait_name>
    language: <language>
    verdict: <SALVAGE | ADAPT | STRIP | IGNORE>
    constraint_violations: []   # list constraint IDs from salvage-config
    adapt_notes: ""             # exact change required if ADAPT
    strip_reason: ""            # why excluded if STRIP
    target_file: ""             # destination path in new project
    target_module: ""
    salvage_value: ""           # one sentence: what this contributes
    dependencies: []            # other ids this depends on
```

8. Print: path to the written file + summary table (SALVAGE / ADAPT / STRIP / IGNORE counts).

---

## Stage 2 — Architect (`/salvage --prd`)

### Steps
1. Glob `.aiframe/user-docs/salvage-ssot-*.yaml` — load all produced SSOT files.
2. Read `.aiframe/user-docs/salvage-config.md` hard constraints section.
3. Scout current project SSOT files (first 60 lines each — scout gate).
4. Reason in a `<reasoning>` block (stripped before saving):
   - Group SALVAGE/ADAPT items by `target_module`
   - Identify what capability each group restores or adds
   - Resolve cross-module dependencies from `dependencies` fields
   - Sequence modules in dependency order (foundational → leaf)
   - Flag any item where the new project already has a superseding implementation
5. Write `.aiframe/user-docs/salvage-prd.md` with sections:
   - §1 Executive Summary
   - §2 Salvage Scope (table: Module | SALVAGE | ADAPT | STRIP | Net value)
   - §3 Hard Constraints (verbatim from salvage-config)
   - §4 Module Delivery Plan — one self-contained block per module:
     ```
     **Module:** <name>
     **Restores:** <one sentence>
     **SSOT refs:** <relevant ssot files>
     **Salvage items:** <bulleted list: code_unit + source_file + verdict>
     **Adapt work:** <specific changes per ADAPT item, or "None">
     **Target files:** <new repo paths>
     **Acceptance criteria:** <3–5 testable statements + test commands>
     **Blocked by:** <module names or "None">
     ```
   - §5 What Is Left Behind (table: Item | Reason | Risk if included)
   - §6 Cross-Cutting Concerns (shared types, configs, migrations, test infrastructure)
6. Print: path to `salvage-prd.md` + recommended delivery order.

---

## Stage 3 — Engineer (`/salvage --prp <module>`)

### Steps
1. Read `.aiframe/user-docs/salvage-prd.md` — extract only the §4 block for `<module>`.
2. Load hard constraints from `salvage-config.md`.
3. Scout current project files that are pattern-mimicry candidates (first 20 lines each).
4. Run ReAct loop internally:
   - **T1**: What exact files in the new project will be created or modified?
   - **T2**: Which symbols are being ported? Which need adaptation? What exactly must change?
   - **T3**: What are the minimal dependencies? Any transitive constraint violations?
   - **T4**: What exact test commands constitute the validation gate?
5. Write `.aiframe/prps/<module>_salvage_v1.yaml`:

```yaml
prp_id: <module>_salvage_v1
title: "Salvage: <Module>"
version: "1.0"
status: ready
priority: <1=critical|2=high|3=normal>
blocked_by: []
context_anchors:
  read_only: []
  write_targets: []
hard_constraints: []        # from salvage-config; list constraint IDs
symbols_to_port:
  - symbol: ""
    from: ""                # source_file::OldName
    to: ""                  # target_file::NewName
    verdict: ""             # SALVAGE | ADAPT
    adapt_delta: ""         # exact change required, or "none"
new_symbols:
  - symbol: ""
    file: ""
    purpose: ""
dependencies:
  packages: []
validation_gate:
  commands: []
  must_pass: []
pattern_mimicry:
  reference_files: []
strip_guard:
  banned_symbols: []        # from salvage-config
  banned_patterns: []       # regex patterns that must not appear in output
```

6. Register `<module>_salvage_v1` in `.aiframe/status/catalog.json` with `status: PENDING`.
7. Quality gate before output:
   - [ ] Every `write_target` is listed in `context_anchors`
   - [ ] No banned symbol appears in `adapt_delta` or `new_symbols.purpose`
   - [ ] `validation_gate` has at least one runnable command
   - [ ] `blocked_by` is empty OR references valid prp_ids that are `COMPLETED`
8. Print: PRP path + symbols-to-port summary + instruction to run `/salvage --exec <module>`.

---

## Stage 4 — Executor (`/salvage --exec <module>`)

### Steps
Delegates to `/execute-prp <module>_salvage_v1` with these additional guardrails:

1. Before writing any file, re-read `strip_guard` from the PRP.
2. For each `write_target`:
   - **SALVAGE** symbol: copy logic verbatim; update only namespace/module path.
   - **ADAPT** symbol: apply `adapt_delta` exactly as specified. Change nothing else.
3. After writing each file, scan output for any `banned_symbols` token and any `banned_patterns` match. If found: HALT, report line + pattern, rewrite that section.
4. After all files: run validation commands and report pass/fail with reason for each.
5. Compression summary: one paragraph, past tense, factual. What was ported, what was adapted, what was excluded and why.
6. Update `catalog.json` entry to `COMPLETED` on all-pass.

---

## Status Check (`/salvage --status`)

1. Check if `.aiframe/user-docs/salvage-config.md` exists; warn if missing.
2. Glob `.aiframe/user-docs/salvage-ssot-*.yaml` → list modules analysed with counts.
3. Check if `.aiframe/user-docs/salvage-prd.md` exists → print §2 scope table if yes.
4. Glob `.aiframe/prps/*_salvage_v1.yaml` → list with status from `catalog.json`.
5. Print pending modules in recommended delivery order.

---

## Quick Reference

| Stage | Command | Input | Output |
|-------|---------|-------|--------|
| 0 — Config | *(manual)* | — | `salvage-config.md` |
| 1 — Archaeologist | `/salvage <path>` | source files | `salvage-ssot-<module>.yaml` |
| 2 — Architect | `/salvage --prd` | all ssot files | `salvage-prd.md` |
| 3 — Engineer | `/salvage --prp <module>` | prd + ssot | `<module>_salvage_v1.yaml` |
| 4 — Executor | `/salvage --exec <module>` | prp yaml | code in new project |

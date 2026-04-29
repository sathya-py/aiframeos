# Command: `/generate-prd`

## Objective
Generate a Project Requirement Document (PRD) as structured Markdown in `.aiframe/prds/`.
Supports two modes: **Manual** (single intent) and **Autonomous** (tracker-driven batch).

---

## Execution Modes

### 1. Manual Mode: `/generate-prd <intent>`
Standard behavior — generates a PRD for the specific feature or capability in `<intent>`.

### 2. Autonomous Mode: `/generate-prd consolidated-prd.yaml`
**Track & Dispatch** — reads a tracker file and processes the next pending task automatically.

1. Read `.aiframe/user-docs/consolidated-prd.yaml`.
2. Identify the first task with `status: PENDING`.
3. **Dependency Gate**: All tasks in preceding Sprints must be `COMPLETED` before proceeding.
4. **Context Check**: Measure `initial_context_tokens` — if near budget, run `/handoff` first.
5. Transition task to `status: IN_PROGRESS`, set `worker_id: <current_agent>`.
6. Proceed with standard PRD generation for that module.
7. **Batch Processing**: If context budget allows, initiate the next PENDING task in the same Sprint.
8. On completion: log `final_tokens` and `actual_time_mins` to the tracker; suggest the next loop invocation.

---

## Input Context (Both Modes)
1. `.aiframe/core/rules.yaml`
2. `.aiframe/dev-docs/ssot/*.yaml` (relevant files only — scout first)
3. `.aiframe/status/HANDOFF.md` (current session state)
4. `.aiframe/user-docs/consolidated-prd.yaml` (Autonomous Mode only)

---

## Execution Steps (Manual Mode)

1. **Context Harvest**
   - Parse `<intent>` to extract: goal, affected modules, known constraints.
   - Scout relevant SSOT files (20-line scout; full read only if needed).

2. **Requirement Analysis**
   - Break the intent into functional requirements and non-functional requirements.
   - Identify unknowns and surface them as explicit open questions.

3. **PRD Generation**
   - Write `.aiframe/prds/<feature>-prd.md` with sections:
     - §1 Summary (one paragraph: problem, solution, success criteria)
     - §2 Functional Requirements (numbered, testable)
     - §3 Non-Functional Requirements (performance, security, compatibility)
     - §4 Open Questions (blockers that must be resolved before PRP)
     - §5 Out of Scope (explicit exclusions)
     - §6 Acceptance Criteria (≥3 runnable test commands or observable outcomes)

4. **Excerpt Check**
   - If the PRD introduces a security model, compliance consideration, or novel architectural
     decision, internally invoke `/extract-excerpts` to preserve it for stakeholders.

5. **Catalog Registration**
   - Register the PRD in `.aiframe/status/catalog.json` with `status: PENDING`.

---

## Output
Return the PRD file path and `task_id`. End with the review gate:

> **"Please review the PRD. If it looks correct, type: `/generate-prp <feature>` to compile the implementation PRP."**

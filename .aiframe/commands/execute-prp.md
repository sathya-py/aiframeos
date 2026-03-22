# Command: `/execute-prp`

## Objective
Deterministically execute a specific Project-Requirement-Prompt (PRP) payload, enforcing WISC constraints and validation gates.

## Input
A specific `task_id` corresponding to a YAML file in `.aiframe/prps/`.

## Execution Steps

1. **Pre-flight Check**:
   - Load the `.yaml` PRP payload from `.aiframe/prps/`.
   - Verify the `task_id` exists and is `PENDING` in `.aiframe/status/catalog.json`.
   - Validate that all `context_anchors` (files and symbols) exist in the codebase using Symbolic Resolution (unless the intent is to create them).

2. **Implementation (WISC Enforced)**:
   - **Evaluate Complexity**: If the PRP touches multiple domains or is highly complex, the main agent MUST invoke `/subagent` to delegate work to isolated threads, preventing context degradation.
   - **Isolate**: Restrict all file reads and writes strictly to the files listed in `context_anchors`. Do not modify out-of-scope files.
   - **Write**: Implement the intent using surgical edits. Follow the `constraints` strictly. Reference `examples/` if applicable.

3. **Validation Gates (Post-flight)**:
   - Execute every command listed under `validation_gates` in the PRP.
   - If any gate fails and `fail_state` is `HALT`, immediately stop, attempt to diagnose, and report the error to the user for debugging. DO NOT mark as complete.

4. **Compression & Completion**:
   - If all gates pass, update `.aiframe/status/catalog.json` setting the task state to `COMPLETED`.
   - Provide a highly compressed summary of the changes made and the validation results to the user.

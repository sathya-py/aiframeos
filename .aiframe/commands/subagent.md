# Command: `/subagent`

## Objective
Prevent context degradation and token bloat by delegating specific, isolated tasks to temporary sub-agents. The main orchestrator thread remains clean, only receiving compressed architectural summaries back.

## Trigger & Input
Invoked by the main agent during `/execute-prp` when a task is deemed "complex", "multi-file", or involves "cross-domain expertise".
Input arguments:
- `task_id`: The ID of the parent PRP.
- `sub_intent`: The specific sub-task to be solved.
- `context_anchors`: The strictly limited set of files/symbols the sub-agent is allowed to read.

## Execution Steps

1. **Context Isolation**:
   - The main agent spins up a subprocess (a new LLM thread or API call) with a completely blank history.
   - The sub-agent is loaded ONLY with the `sub_intent`, the specific `context_anchors`, and the required skill personas (e.g., `svelte5-specialist`).

2. **WISC Protocol Enforcement**:
   - The sub-agent executes the `sub_intent` against its localized anchors.
   - It performs its own surgical writes and internal validation.

3. **Context Compression (The Return)**:
   - Once the sub-task is complete, the sub-agent MUST NOT return the full code it wrote.
   - It must return a highly compressed summary: *"I modified X, Y, and Z to implement the sub_intent. The interface is now `functionA(param)`. Validation passed."*
   
4. **Main Thread Integration**:
   - The main agent receives this compressed summary, logs it to `.aiframe/status/catalog.json`, and proceeds to the next sub-task.

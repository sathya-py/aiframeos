# Command: `/generate-prp`

## Objective
Compile a raw human intent into a machine-optimized Project-Requirement-Prompt (PRP) payload. It leverages the Metaprompt Framework (CRAFT/Agent patterns) and Context Engineering principles to output a deterministic task definition.

## Input Context
When this command is invoked, it evaluates an `INITIAL.md` or a raw intent string and pulls context from:
1. `dev-docs/ssot/*.yaml` (Single Source of Truth)
2. `examples/` (High-fidelity code patterns for "Few-Shot Pattern Mimicry")
3. `.aiframe/prompts/templates/` (Metaprompt structures like `{{INTENT}}`, `{{SCOPE}}`)
4. Active skills in `.aiframe/skills/`

## Execution Steps

1. **Intent Parsing & Variable Extraction**: Analyze the user's request to populate recursive metaprompt variables:
   - `{{INTENT}}`: The core objective.
   - `{{SCOPE}}`: The specific constraints.
   - `{{ROLE}}`: The optimal persona needed (e.g., "Senior Python Architect").

2. **Context Engineering (Gathering & Mimicry)**: 
   - Apply Symbolic Resolution (WISC: Select) to find existing codebase anchors.
   - Scan `examples/` folder to inject relevant "Few-Shot" patterns into the prompt.
   - Read relevant SSOT YAML files to attach architectural constraints.

3. **PRP Compilation**: Generate a new `.yaml` file in `.aiframe/prps/` using a standardized Prompter-Agent structure.

```yaml
task_id: "unique-task-identifier"
agent_persona: "CRAFT-based definition: {{ROLE}} focused on {{INTENT}}"
intent: "{{INTENT}}"
context_anchors:
  - file: "path/to/file.ext"
    symbols: ["SymbolName1"]
examples_referenced:
  - "examples/pattern1.ts"
constraints:
  - "{{SCOPE}}"
  - "Follow examples exactly (Pattern Mimicry)."
validation_gates:
  - step: "Type check"
    command: "command to run type checking"
    fail_state: "HALT"
```

4. **Catalog Update**: Register the new `task_id` in `.aiframe/status/catalog.json` with the state `PENDING`.

## Output
Output the path to the newly generated PRP file and its `task_id`, and display the rendered `agent_persona` using the evaluated CRAFT variables.

**CRITICAL: The Review Gate**
End your response with a clear, bold message asking the user to review the generated `.yaml` blueprint. Instruct them to type the following command to proceed:
> **"Please review the generated PRP. If it looks correct, type: `/execute-prp [task_id]` to safely implement the changes."**

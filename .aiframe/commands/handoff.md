# /handoff
# Description: Summarize session state into a bridge for the next session.

## Steps
1. Run: `git status && git diff --stat && git log --oneline -5`
2. Read: `.aiframe/status/catalog.json` (active + recently completed tasks)
3. Write: `.aiframe/status/HANDOFF.md` using the template below.
4. Print: The full contents of HANDOFF.md to the console.

## Template

```markdown
# HANDOFF — {date}

## Mandatory Initialization Sequence
On next session start, read in order:
1. `.aiframe/core/bootloader.md`
2. `.aiframe/status/HANDOFF.md` (this file)
3. `.aiframe/core/rules.yaml`

## Project Context
- **What this project is**: {one sentence}
- **Current phase**: {phase name and goal}

## Active Work
- {bullet: task, current status, last action taken}

## Completed This Session
- {bullet: what was finished, what changed}

## Pending (Next Session)
- **First Action**: {single concrete command or shell command to run immediately}
- {bullet: next tasks in priority order}

## Key Constraints (Active)
- {bullet: any non-obvious constraints the next session must not violate}

## Dead Ends
- {bullet: approaches tried that failed and why — prevent re-investigation}

## Build Health
- {bullet: last known state of tests/build — pass/fail}
```

## Quality Rules
- **Max 120 lines** (hard limit).
- **Dead Ends** section is mandatory — even if empty, write "None this session."
- **First Action** must be a single, concrete shell command or slash command.
- **Constraints** section: only include active, non-obvious rules. Skip items in `rules.yaml`.
- Use **bullet points** only. No prose paragraphs.

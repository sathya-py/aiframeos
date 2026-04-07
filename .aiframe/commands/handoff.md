# /handoff
# Description: Summarize session state into a bridge for the next session.

## Steps
1. Run: `git status && git diff --stat && git log --oneline -5`
2. Analyze: Current task state in `.aiframe/status/catalog.json` (if exists)
3. Write: `.aiframe/status/HANDOFF.md` using the template.
4. Finalize: Output the contents of HANDOFF.md to the console for the user to copy/see.

## Quality Rules
- **Max 100 lines** (hard limit).
- **Dead Ends** section is mandatory (list what didn't work).
- **First Action** must be a single, concrete shell command or slash command.
- Use **bullet points** only. No prose.

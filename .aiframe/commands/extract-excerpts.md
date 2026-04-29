# Command: `/extract-excerpts`

## Purpose
Extract high-value architectural, security, and product decisions from the current working
context and write them as structured, audience-ready excerpt collections to
`.aiframe/user-docs/documentation-excerpts/`.

Excerpts bridge SSOT engineering truth and external documents — business decks, marketing
copy, technical integration guides, compliance submissions. Written once from the
authoritative source; reused many times downstream.

**This command is also called internally** by `/generate-prd`, `/generate-prp`, and
`/assimilate` when significant architectural or security decisions warrant preservation
for external communication.

---

## When to Invoke

**User invokes directly** when:
- A feature, security model, or architectural decision has just been designed or documented
- Preparing for a PRD, partner brief, marketing document, or compliance filing
- After `/execute-prp` completes a significant module — preserve the "why" before context flushes

**Internal invocation** when:
- `/generate-prd` detects a security, compliance, or novel architectural section worth preserving
- `/assimilate` merges knowledge with marketing or stakeholder value
- `/generate-prp` documents constraints or guarantees beyond implementation detail

---

## Input Context

Read in order — stop at the smallest set needed to write confidently:

1. `.aiframe/status/HANDOFF.md` — current session state and active feature
2. `.aiframe/dev-docs/ssot/*.yaml` — only files relevant to the feature being excerpted
3. Active plan documents in `.aiframe/user-docs/` — if one exists for this feature
4. User message — the specific topic or decision to excerpt (if directly invoked)

Do **not** read historical extracts or archived docs. Excerpts must derive from current SSOT truth.

---

## Output

### File Naming
```
.aiframe/user-docs/documentation-excerpts/{feature}-excerpts-{###}.md
```
- `{feature}`: kebab-case feature or domain name (e.g. `auth-model`, `api-design`, `data-pipeline`)
- `{###}`: zero-padded sequence starting at `001`; increment if a file for this feature already exists

### File Structure

```markdown
# Excerpt Collection: {Human-Readable Title}
**Feature:** {feature name and module}
**Excerpt Set:** {###}
**Audience Use:** {comma-separated list of audience types}
**Source SSOTs:** {comma-separated list of SSOT files used}

---

## How to Use This File
[One short paragraph explaining the audience labels and pull-verbatim intent]

| Label | Audience |
|---|---|
| `[BUSINESS]` | Executives, investors, product stakeholders |
| `[MARKETING]` | Product marketing, sales, partner materials |
| `[TECHNICAL]` | Engineers, architects, integration partners |
| `[REGULATORY]` | Compliance, legal, audit teams |

---

## {N}. {Excerpt Title}

### [BUSINESS]
{Plain language, outcome-focused, no jargon. 2-4 sentences.}

### [MARKETING]
{Punchy, differentiated, benefit-first. 2-3 sentences. May use comparisons.}

### [TECHNICAL]
{Precise. May include code, schemas, system references. Full detail.}

### [REGULATORY]
{Compliance-framing. References applicable standards. Audit-ready language.}

---

## Excerpt Index
| # | Topic | Audiences |
|---|---|---|
...
```

### Excerpt Content Rules
- Every major point gets all four audience variants — never omit one
- `[TECHNICAL]` excerpts may reference SSOT field names, code snippets, and file paths
- `[REGULATORY]` excerpts name specific standards (ISO, SOC2, GDPR, etc.) where relevant
- `[MARKETING]` excerpts must be factually grounded — no claims not supported by SSOT
- `[BUSINESS]` excerpts explain *why it matters*, not how it works
- Write as if each excerpt may be pulled in isolation — no cross-references between excerpts

---

## Topics to Always Consider

When extracting for any feature, check whether it has material to say about:

| Topic | Extract if... |
|---|---|
| Security model | Feature introduces a new trust boundary or auth mechanism |
| Compliance / privacy | Feature has regulatory implications (data handling, audit, AI oversight) |
| AI/human agency boundary | Feature involves AI-initiated actions or decisions |
| Failsafe / circuit breaker | Feature adds new failure modes or recovery paths |
| Audit trail | Feature extends logging, observability, or causation chains |
| Correctness guarantee | Feature makes a precision, ordering, or determinism promise |
| Performance guarantee | Feature introduces SLA or latency commitments |
| API / integration contract | Feature exposes a public interface consumed by others |

---

## Execution Steps

1. **Identify scope** — What feature or decision is being excerpted? What SSOTs are authoritative?
2. **Scout SSOTs** — Read only relevant SSOT sections (20-line scout first for files >100 lines)
3. **Identify excerpt topics** — Use the checklist above; add feature-specific topics
4. **Draft all four audience variants per topic** — Write `[BUSINESS]` first (forces plain-language clarity), then `[REGULATORY]`, then `[MARKETING]`, then `[TECHNICAL]`
5. **Determine filename** — Check for existing files with the same feature prefix; increment `###`
6. **Write file** — Use the structure template above
7. **Report** — Tell the user: file path, excerpt count, audiences covered, and any topics with insufficient SSOT grounding (flag for future SSOT updates)

---

## Internal Call Contract

When called internally by another command, return:
```
excerpt_file: .aiframe/user-docs/documentation-excerpts/{feature}-excerpts-{###}.md
excerpt_count: {N}
topics: [{list of topic titles}]
```
The calling command may surface this to the user or silently record it in HANDOFF.

---

## Model
`haiku` — excerpt writing is structurally guided; context is already loaded by the calling command.
Override with `!sonnet` if the feature involves novel security or compliance reasoning not yet in SSOT.

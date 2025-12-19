# LearnOutLoud — Specification (v0)

## Purpose

This repository defines a **conversation-driven writing system** for thought and commentary blogs.

The goal is to:
- Think out loud via natural-language chat
- Have an LLM quietly organize those thoughts into a structured draft
- Explicitly surface gaps, counterarguments, and research needs
- Iterate via Git commits like code, not Google Docs chaos

This is not a publishing tool. It is a **thinking + drafting system**.

---

## Core Concepts

### Framework label

A *framework label* names the thinking structure used to organize a post. The label is:
- referenced in prompts
- stored in metadata
- used in commit messages
- a contract that keeps structure consistent across sessions and models

Choose **one framework per post**.

---

## Supported Frameworks (v0)

### CTE — Claim · Tension · Examination (default)

Best for: opinionated blogs, commentary, debate-provoking writing.

Structure:
- **Claim** — what I believe right now
- **Tension** — why this isn’t obvious / who disagrees
- **Examination**
  - supporting evidence
  - complicating factors
  - explicit gaps
- **Implications** — so what?
- **Open Thread** — unresolved questions

Use when: you want clarity without pretending certainty.

### Minto Pyramid

Best for: executive briefs, white papers, policy writing.

Structure:
- **Answer first**
- supporting arguments
- evidence by branch

Use when: clarity > voice.

### Dialectic

Best for: philosophical or exploratory essays.

Structure:
- **Thesis**
- **Antithesis**
- **Synthesis**
- **Residual doubts**

Use when: inquiry > position.

### Field Notes

Best for: practitioner insights, shop-floor reality.

Structure:
- **Observation**
- **Context**
- **Mechanism**
- **Failure modes**
- **What I’d bet on**
- **What would change my mind**

Use when: lived experience matters more than theory.

---

## Repository Structure (minimum viable)

```
LearnOutLoud/
├── README.md
├── frameworks/
│   └── FRAMEWORKS.md
├── prompts/
│   └── SYSTEM_COMPILER.md
├── templates/
│   ├── draft.md
│   ├── gaps.md
│   ├── research_plan.md
│   ├── sources.md
│   └── transcript.md
├── work/
│   ├── INDEX.md
│   ├── _active -> <post-folder>
│   └── YYYY-MM-DD__slug/
│       ├── meta.md
│       ├── draft.md
│       ├── gaps.md
│       ├── research_plan.md
│       ├── sources.md
│       └── transcript.md
└── scripts/
    ├── new_post.sh
    ├── activate_post.sh
    └── inventory.sh
```

---

## Post metadata (`meta.md`)

Each post folder contains a small metadata file.

Example:

```yaml
title: Remote Work and Urban Economics
slug: remote_work_urban
date_created: 2025-01-15
framework: CTE
status: Draft
one_liner: Remote work won't empty cities, but it will reshape which neighborhoods thrive.
```

### Allowed status values

- Requires Interview
- Draft
- Gap Check Needed
- Research Plan
- Research In Progress
- Ready to Integrate Sources
- Revision
- Final

---

## Inventory (`work/INDEX.md`)

A simple table tracking all posts.

Example:

```markdown
| slug | title | status | framework | one_liner | date_created |
|------|-------|--------|-----------|-----------|--------------|
| remote_work_urban | Remote Work and Urban Economics | Draft | CTE | Remote work won't empty cities... | 2025-01-15 |
```

This is the source of truth for “what am I working on?”

---

## `_active` convention

`work/_active` is a symlink pointing to the currently active post folder. All CLI agents **default to reading/writing here** unless explicitly told otherwise.

This prevents:
- editing the wrong draft
- multi-model confusion
- accidental divergence

---

## CLI agent role (`prompts/SYSTEM_COMPILER.md`)

When operating in this repo, the LLM must behave as **an interviewer + compiler, not an author**.

### Core rules
- Ask **one focused question at a time**
- Keep conversation natural
- Do not polish prose
- Do not invent facts
- Explicitly tag uncertainty

### Gap tags (inline only)
- `[citation needed]`
- `[example needed]`
- `[data unclear]`
- `[counterpoint needed]`
- `[inference]`
- `[experience-based]`

### Default behavior
- Place user answers into the correct framework section silently
- Update markdown files in `work/_active/`
- Update `meta.md` and `INDEX.md` when status changes

---

## Supported user commands (natural language)

The agent must recognize and act on these phrases:

- “show draft”
- “gap check”
- “generate research plan”
- “add counterargument”
- “integrate sources”
- “tighten structure”
- “commit it”
- “what are we working on?”
- “list posts”
- “set status: <Status>”
- “set title: <Title>”
- “set one_liner: <Sentence>”
- “set framework: <Label>”

---

## Git as the backbone

Writing progresses through explicit commit checkpoints.

Example commit messages:
- `feat(draft): initial CTE draft`
- `chore(gaps): tag evidence and counterarguments`
- `feat(research): create research plan`
- `feat(sources): add FAA and EASA references`
- `refactor(draft): integrate findings`
- `final: publish-ready version`

No silent overwrites. No mystery changes.

---

## Workflow summary

1. Create a new post folder
2. Activate it
3. Run conversational interview
4. Review draft
5. Run gap check
6. Generate research plan
7. Integrate sources
8. Tighten structure
9. Commit at each milestone

At any point, you can ask: “what are we working on?” and get:
- title
- one-liner
- status
- framework

---

## Design philosophy

- Structure beats inspiration
- Uncertainty is labeled, not hidden
- Experience counts, but must be marked as such
- AI assists thinking; it does not replace judgment
- If it’s important, it lives in a file
- If it’s real, it gets a commit

---

## Out of scope (for now)

- Locking / concurrency controls
- Multi-agent coordination
- Automated diff summaries
- Web browsing or citation fetching
- Publishing pipelines

These can be added once the scaffold is live.

---

## Version

v0 — scaffold-first, no magic, no nonsense

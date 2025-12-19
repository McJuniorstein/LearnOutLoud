# LearnOutLoud

A conversation-driven writing system for thought and commentary blogs.

## What This Is

A **thinking + drafting system** that:
- Captures thinking via natural-language conversation
- Organizes thoughts into structured drafts using explicit frameworks
- Surfaces gaps, counterarguments, and research needs
- Iterates via Git commits, not document chaos

This is **not** a publishing tool.

## Quick Start

```bash
# Create a new post
./scripts/new_post.sh "my-post-slug" "CTE"

# Activate it
./scripts/activate_post.sh my-post-slug

# Start a conversation with your LLM CLI
# The system prompt is in SYSTEM_COMPILER.md
```

## Repository Structure

```
LearnOutLoud/
├── scripts/            # Workflow automation
├── templates/          # Blank templates for post files
├── frameworks/         # Framework definitions
├── work/               # Active work (posts live here)
│   └── INDEX.md        # Inventory of all posts
├── LICENSE             # MIT License
├── README.md
├── SYSTEM_COMPILER.md  # LLM system prompt
└── .gitignore
```

## Frameworks

Choose one framework per post:

- **CTE** (Claim-Tension-Examination) — opinionated commentary
- **Minto Pyramid** — executive briefs, policy writing
- **Dialectic** — philosophical exploration
- **Field Notes** — practitioner insights

See `frameworks/FRAMEWORKS.md` for details.

## Workflow

1. `new_post.sh` — create post folder
2. `activate_post.sh` — set as current working post
3. Conversational interview with LLM
4. Review draft, run gap check
5. Generate research plan
6. Integrate sources
7. Tighten structure
8. Commit at each milestone

## Commands (Natural Language)

Say these to your LLM:
- "show draft"
- "gap check"
- "generate research plan"
- "what are we working on?"
- "set status: Draft"
- "commit it"

## Design Philosophy

- Structure beats inspiration
- Uncertainty is labeled, not hidden
- Experience counts, but must be marked as such
- AI assists thinking; it does not replace judgment
- If it's important, it lives in a file
- If it's real, it gets a commit

## Version

v0 — scaffold-first, no magic, no nonsense

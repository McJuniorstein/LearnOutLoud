# LearnOutLoud

A local, Git-backed system that forces you to learn a topic deeply while you write about it.

Force yourself to learn a subject deeply by trying to explain it.

This is my personal learning rig. Rough, opinionated, and deliberately manual.
Primary use: structured, publishable commentary.
Secondary (often better) use: private deep dives into complex topics — even if you never publish.

Status: Experimental personal tool. Depends on pasting the system prompt into your LLM of choice (Grok, Claude, etc.). No automation, no publishing built-in.

## Quick start

```bash
./scripts/new_post.sh my-topic-slug [CTE|Minto|Dialectic|FieldNotes]
./scripts/activate_post.sh my-topic-slug
# → paste contents of SYSTEM_COMPILER.md into your AI chat
```

## Features

- Conversation-driven drafting
- Built-in thinking frameworks
- Gap tracking
- Manual fact-check guidance (primary sources + archives only)
- Full history via Git

MIT Licensed — fork and evolve freely.

# LearnOutLoud

A local, Git-backed system that forces you to learn a topic deeply while you write about it.

Force yourself to learn a subject deeply by trying to explain it.

The real magic isn't the published post—it's that you end up understanding the topic orders of magnitude better than when you started, even if you delete the draft afterward.

This is my personal learning rig. Rough, opinionated, and deliberately manual.
Primary use: structured, publishable commentary.
Secondary (often better) use: private deep dives into complex topics — even if you never publish.

Status: Experimental personal tool. Depends on pasting the system prompt into your LLM of choice (Grok, Claude, etc.). No automation, no publishing built-in.

## Quick start

```bash
./scripts/new_post.sh my-topic-slug [CTE|Minto|Dialectic|FieldNotes]
./scripts/activate_post.sh my-topic-slug
./scripts/set_llm_used.sh grok-4           # Optional: track model for comparison
./scripts/set_compiler_version.sh          # Optional: record compiler hash
# → paste contents of SYSTEM_COMPILER.md into your AI chat
```

**Test it:** Create a throwaway post, activate it, paste SYSTEM_COMPILER.md into your LLM, and say "hello".
Delete the post folder when done—no harm.

## Features

- Conversation-driven drafting
- Built-in thinking frameworks
- Gap tracking
- Manual fact-check guidance (primary sources + archives only)
- Full history via Git

MIT Licensed — fork and evolve freely.

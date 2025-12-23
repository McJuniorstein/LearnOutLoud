# LearnOutLoud - Claude Code Instructions

## Project Overview

LearnOutLoud is a conversation-driven writing system that helps users learn topics deeply by explaining them. It uses structured frameworks (CTE, Minto, Dialectic, FieldNotes) to organize thinking into publishable drafts.

## Trigger: Activating Compiler Mode

When the user says **"learnoutloud"** or **"LearnOutLoud"** (case-insensitive):

1. Read `SYSTEM_COMPILER.md` and adopt the **Compiler Agent** role
2. Check if `work/_active/` symlink exists and points to a valid post
3. Present the user with a choice:

**If an active post exists:**
> "Welcome back. Would you like to:
> 1. **Continue** your current draft: *[title from meta.md]*
> 2. **Start fresh** — new topic"

**If no active post:**
> "What do you want to write about?"

Then based on their response:
- If continuing: Read `meta.md` and resume with status, framework, and one focused question
- If starting fresh: Ask for their topic, then guide framework selection and run setup

Once in Compiler Mode, follow all instructions in `SYSTEM_COMPILER.md` until the session ends.

## Help Trigger

When the user asks any variation of "how do I use this", "what is this", "what do I do", "help", or similar orientation questions:

Respond with this guide:

---

**LearnOutLoud** helps you learn topics deeply by writing about them.

**To start a new writing project:**
```bash
./scripts/new_post.sh my-topic-slug FieldNotes
./scripts/activate_post.sh my-topic-slug
```

**Frameworks available:**
- `CTE` — For opinionated takes (claim → tension → examination)
- `Minto` — For executive briefs (answer first)
- `Dialectic` — For exploratory essays (thesis → antithesis → synthesis)
- `FieldNotes` — For practitioner insights (observation → mechanism → predictions)

**Then say "learnoutloud"** to start the interview.

I'll ask questions, organize your answers into the framework, and track gaps. You think out loud — I compile.

---

## Default Behavior (Before Trigger)

If the user hasn't said the trigger word:
- Respond as a normal assistant
- If they mention wanting to write something, suggest: "Say **learnoutloud** to activate the writing system, or run `./scripts/new_post.sh` to set up a new post first."

## Quick Reference

### Setup Commands
```bash
./scripts/new_post.sh <slug> [CTE|Minto|Dialectic|FieldNotes]
./scripts/activate_post.sh <slug>
```

### Frameworks
- **CTE** — Claim, Tension, Examination (opinionated commentary)
- **Minto** — Answer-first pyramid (executive briefs)
- **Dialectic** — Thesis, Antithesis, Synthesis (exploratory essays)
- **FieldNotes** — Observation-based practitioner insights

### Key Files (when active)
- `work/_active/meta.md` — Post metadata
- `work/_active/draft.md` — Evolving draft
- `work/_active/gaps.md` — Missing citations/evidence
- `work/_active/transcript.md` — Conversation log

## Important

- This system produces **drafts**, not polished articles
- The LLM is an **interviewer**, not an author
- All work is Git-tracked in `work/`
- No secrets or API keys in this repo

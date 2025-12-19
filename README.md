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

**Tip:** Open `work/_active/` in your editor while chatting—see the draft evolve live.

## Monitoring Progress in Real-Time

This system is deliberately file-based and multi-file—that's how it enforces structure and transparency.

While chatting with your LLM:
- Open the post folder in your IDE (VS Code, Vim, Sublime, etc.)
- Or use the convenience symlink: open `work/_active/` (points to your current post)

You'll see in near real-time:
- `draft.md` — Your structured post building section by section
- `transcript.md` — Full conversation history appending chronologically
- `gaps.md` — Consolidated checklist of [citation needed], counterpoints, etc.
- `post.yaml` — Metadata like status, framework, confidence

No blind trust—watch the "compilation" happen as you talk. This visibility is the core of the learning loop: ignorance becomes explicit, progress becomes auditable.

## Features

- Conversation-driven drafting
- Built-in thinking frameworks
- Gap tracking
- Manual fact-check guidance (primary sources + archives only)
- Full history via Git

## Example Session (CTE framework)

After setup + activate, paste the entire `SYSTEM_COMPILER.md` into a new LLM chat. Then:

**You:** Let's write about "Why remote work can fail"

**LLM:** Got it. Framework: CTE (Claim-Tension-Examination).

What's your core claim—why do you believe remote work can fail?

**You:** I think remote work fails when companies don't adjust their management style. They keep expecting office behaviors in a non-office setting.

**LLM:** Strong claim. I've added it to the Claim section:

> Remote work fails when companies expect office behaviors without adjusting management style. [experience-based]

Who disagrees with this? What's the tension?

**You:** Managers who think "if I can't see you, you're not working." They believe presence equals productivity.

**LLM:** Added to Tension. Now let me ask: what evidence supports your claim? Any specific failures you've seen?

**You:** gap check

**LLM:** Scanning draft... Found 3 gaps:
- [experience-based] on main claim — could strengthen with external examples
- [citation needed] on presence-equals-productivity belief
- [counterpoint needed] — no opposing view yet

Updated `gaps.md`.

---

See `examples/completed-cte-example/` for what a finished post looks like.

MIT Licensed — fork and evolve freely.

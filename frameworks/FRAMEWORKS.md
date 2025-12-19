# Supported Frameworks (v0)

A *framework label* names the thinking structure used to organize a post. Choose **one framework per post**.

The label is:
- Referenced in prompts
- Stored in metadata (`meta.md`)
- Used in commit messages
- A contract that keeps structure consistent across sessions and models

---

## CTE — Claim-Tension-Examination (default)

**Best for:** Opinionated blogs, commentary, debate-provoking writing.

### Structure

- **Claim** — What I believe right now
- **Tension** — Why this isn't obvious / who disagrees
- **Examination**
  - Supporting evidence
  - Complicating factors
  - Explicit gaps
- **Implications** — So what?
- **Open Thread** — Unresolved questions

**Use when:** You want clarity without pretending certainty.

---

## Minto Pyramid

**Best for:** Executive briefs, white papers, policy writing.

### Structure

- **Answer first** — Lead with the conclusion
- **Supporting arguments** — Key reasons
- **Evidence by branch** — Data backing each argument

**Use when:** Clarity > voice.

---

## Dialectic

**Best for:** Philosophical or exploratory essays.

### Structure

- **Thesis** — Initial position
- **Antithesis** — Counterposition
- **Synthesis** — Resolution or evolved understanding
- **Residual doubts** — What remains unresolved

**Use when:** Inquiry > position.

---

## Field Notes

**Best for:** Practitioner insights, shop-floor reality.

### Structure

- **Observation** — What I saw/experienced
- **Context** — Why this matters
- **Mechanism** — How it works (as I understand it)
- **Failure modes** — What goes wrong
- **What I'd bet on** — My prediction
- **What would change my mind** — Falsifiable conditions

**Use when:** Lived experience matters more than theory.

---

## Adding New Frameworks

To add a new framework:

1. Document it here with structure and use case
2. Create a corresponding template section pattern
3. Update `SYSTEM_COMPILER.md` to recognize the label

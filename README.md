# Gapsi — B2B Sales Intelligence Agent

<!-- Banner image — add to assets/ and update path -->
<!-- ![Gapsi Banner](assets/banner.png) -->

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Skill-blue)](https://claude.ai/code)
[![Built by termsheetinator](https://img.shields.io/badge/Built%20by-termsheetinator-black)](https://github.com/termsheetinator)

---

## What This Is

Gapsi is a persistent B2B sales coach that lives inside Claude Code. You paste a real call transcript, and it gives you a structured analysis of every gap, missed loss aversion angle, stalled commitment, and unhandled objection — then builds the exact script you take into your next call. It remembers your offers, your sales process, and your patterns across every session. One install, zero reconfiguration.

---

## What It Covers

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TRANSCRIPT ANALYSIS          5 analysis vectors per call
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Commitment Advancement        Did the call move to the next rung?
Loss Aversion Gaps            Which angles were missed?
Objection Handling            Every objection + sharper response
Qualification Coverage        What BANT signals are still missing?
Call Structure                Did the rep hold frame?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SCRIPT GENERATION            Adapts to call type + offer
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Discovery calls               Gap-opening questions + commitment close
Review / Proposal calls       Loss aversion deployment + objection branches
Closing calls                 Commitment sequence + hesitation bridges
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PERSISTENT MEMORY            Remembers across every session
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Multiple offers               One file per offer — price, deliverables, ICP
Objection library             Builds from real transcripts over time
Confirmed angles              Tracks what actually works for your offer
Session log                   Rolling history of last 5 sessions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## How It Works

1. **Install once** — run the curl command in your project directory
2. **Onboard once** — `/gapsi-agent` walks you through offers and sales process (2 min)
3. **Paste a transcript** — Gapsi runs 5-vector analysis and surfaces every gap
4. **Get your script** — one command generates the next-call script using your actual offer details and the prospect's specific gaps
5. **It remembers** — offers, objections, what worked, session history — all persisted locally in `memory/`

---

## Output Format

**After transcript analysis:**
```
CALL ANALYSIS REPORT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Offer: SDR Outbound Program  |  Call type: Discovery  |  Date: June 3

COMMITMENT ADVANCEMENT
Rep got agreement that current outbound isn't working. Did not advance to
commitment on timeline or consequence of staying with current approach.

LOSS AVERSION GAPS
Used: cost-of-delay angle (weak execution)
Missed: competitor-velocity angle, headcount-opportunity-cost angle

OBJECTION HANDLING
"We're not ready yet" → Rep said "I understand" → 
Sharper: "What would need to be true for you to feel ready?"

QUALIFICATION COVERAGE
Surfaced: knows budget exists, decision-maker confirmed
Missing: timeline, what "not ready" actually means, prior attempts

CALL STRUCTURE
Lost frame at 14-min mark when prospect redirected to features.
Should have bridged back to consequence of current state.

PRIORITY FIX
Extract a specific timeline before ending the call — without it
the follow-up has no anchor and the deal goes cold.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## How It Remembers

Gapsi stores everything in a `memory/` folder in your project directory — plain markdown files you can read, edit, or version control. No external database, no API keys, no cloud sync. Everything lives on your machine.

```
memory/
├── MEMORY.md              ← index of everything in memory
├── user-profile.md        ← your sales process, style notes, what works
├── offer-[slug].md        ← one file per offer you sell
└── session-log.md         ← rolling log of last 5 sessions
```

The hook reads these files on every prompt and injects them into Claude's context automatically. You never have to re-explain your offers.

---

## Tips for Users

- **Trigger:** Type `/gapsi-agent` in Claude Code — first run starts onboarding, subsequent runs load your memory
- **Transcripts:** Paste the raw transcript directly into the chat — Gapsi will ask which offer it was about
- **Multiple offers:** Add new offers anytime — just tell Gapsi you want to add one
- **After a call:** Report what happened — Gapsi updates your objection library and session log
- **What works:** When an angle or script closes a deal, tell Gapsi — it tracks it in your offer file

---

## Install

Run this command in the directory where you work with Claude Code:

```bash
curl -fsSL https://raw.githubusercontent.com/termsheetinator/gapsi-agent/main/install.sh | bash
```

Then open Claude Code in that directory and type `/gapsi-agent`.

---

## Update

Re-run the same install command — it overwrites the skill and hook with the latest version:

```bash
curl -fsSL https://raw.githubusercontent.com/termsheetinator/gapsi-agent/main/install.sh | bash
```

Your `memory/` files are never touched by the installer.

---

## Files

| File | What It Does |
|---|---|
| `gapsi-agent.md` | Main skill file — installs to `~/.claude/skills/gapsi-agent/SKILL.md` |
| `install.sh` | One-command installer — downloads skill, hook, creates memory dir |
| `.claude/hooks/gapsi-active.sh` | UserPromptSubmit hook — injects memory into every session |
| `memory/MEMORY.md` | Memory index — created at install, populated during onboarding |
| `memory/user-profile.md` | Your sales process and what works — created during onboarding |
| `memory/offer-[slug].md` | One file per offer — created during onboarding or when you add an offer |
| `memory/session-log.md` | Rolling log of last 5 sessions — updated after every analysis |

---

## Requirements

- [Claude Code](https://claude.ai/code) (CLI or desktop app)
- Anthropic account

---

*Built by [termsheetinator](https://github.com/termsheetinator) · Part of the InfraSuite · Advisory Incubator™*

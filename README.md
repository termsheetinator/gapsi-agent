# Gapsi — B2B Sales Intelligence Agent

![Gapsi Banner](assets/banner.png)

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
Reference Point               Was the prospect's goal anchored?
Current Reality               Was their actual state quantified?
Gap Calculation               Did the prospect do the math — or the rep?
Inaction Cost                 Which of the 5 frames were missed?
Positioning                   Loss prevention or premature pitch?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SCRIPT GENERATION            Adapts to call type + offer
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Discovery calls               Full audit-posture script + funnel audit
One-call-close                Compressed 5-step + hesitation handlers
Review calls                  Gap deepening, admissions, scope feedback
Closing calls                 Push-to-close built from their own math
Script rebuilds               Diagnostic + surgical upgrade of your script
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
DEAL INTELLIGENCE            Per-prospect tracking
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
MEDDPICC mapping              Full decision-maker map per deal
Admissions log                Their exact words, captured per call
Close readiness               7-point checklist before any push
Objection doctrine            Every objection answered with a question
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PERSISTENT MEMORY            Remembers across every session
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Multiple offers               One file per offer — price, deliverables, ICP
Deal files                    One file per prospect — gaps, admissions, stage
Objection library             Builds from real calls over time
Confirmed angles              Tracks what actually works for your offer
Session log                   Rolling history of last 5 sessions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## How It Works

1. **Install once** — run the curl command in your project directory
2. **Onboard once** — `/gapsi-agent` walks you through offers and sales process (3 min)
3. **Paste a transcript** — Gapsi runs 5-vector analysis and surfaces every gap
4. **Get your script** — one command generates the next-call script using your actual offer details and the prospect's specific gaps
5. **It remembers** — offers, objections, what worked, session history — all persisted locally in `memory/`

---

## Output Format

**After transcript analysis:**
```
╔══════════════════════════════════════════════════════════════╗
║  CALL ANALYSIS REPORT                                        ║
║  Acme Industrial  ·  Discovery  ·  June 3                    ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  REFERENCE POINT               [~ Weak]                      ║
║  Prospect said "we want to grow outbound" — never anchored   ║
║  to a number. No target = no gap = no urgency.               ║
║                                                              ║
║  CURRENT REALITY               [✓]                           ║
║  14 qualified meetings/month, 2 SDRs, no consistent channel. ║
║                                                              ║
║  GAP CALCULATION               [~ Rep-stated]                ║
║  Target: 40/mo  ·  Current: 14/mo  ·  Gap: 26/mo            ║
║  Rep asserted the math — prospect never confirmed it.        ║
║                                                              ║
║  INACTION COST                 [✗ Invisible]                 ║
║  Frames used:   none                                         ║
║  Frames missed: Cost, Timing, Goal                           ║
║                                                              ║
║  POSITIONING                   [✗ Premature]                 ║
║  Price introduced before the gap was confirmed or costed.    ║
║                                                              ║
║  ADMISSIONS CAPTURED                                         ║
║  · "We've known outbound was broken since Q4."               ║
║                                                              ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  FLAGS                                                       ║
║  GAP NOT OWNED · INACTION INVISIBLE · PREMATURE CLOSE        ║
║                                                              ║
║  PRIORITY FIX                                                ║
║  Open the next call by making the prospect confirm the       ║
║  26-meeting gap out loud — nothing else lands until the      ║
║  math is theirs.                                             ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

---

## How It Remembers

Gapsi stores everything in a `memory/` folder in your project directory — plain markdown files you can read, edit, or version control. No external database, no API keys, no cloud sync. Everything lives on your machine.

```
memory/
├── MEMORY.md              ← index of everything in memory
├── user-profile.md        ← your sales process, style notes, what works
├── offer-[slug].md        ← one file per offer you sell
├── session-log.md         ← rolling log of last 5 sessions
└── deals/
    └── deal-[slug].md     ← one file per prospect — MEDDPICC, gaps, admissions
```

The hook reads these files on every prompt and injects them into Claude's context automatically — your profile, offers, and session log in full, plus a summary of every active deal. You never have to re-explain your offers.

If your project is a git repository, the installer adds `memory/` to your `.gitignore` automatically so prospect data never gets committed.

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

Your `memory/` files are never touched by the installer, and an existing `.claude/settings.json` is merged into — not overwritten.

---

## Files

| File | What It Does |
|---|---|
| `gapsi-agent.md` | Main skill file — installs to `~/.claude/skills/gapsi-agent/SKILL.md` |
| `install.sh` | One-command installer — downloads skill, hook, creates memory dir |
| `.claude/hooks/gapsi-active.sh` | UserPromptSubmit hook — injects memory into every session |
| `.claude/settings.json` | Hook wiring — written or merged by the installer |
| `memory/MEMORY.md` | Memory index — created at install, populated during onboarding |
| `memory/user-profile.md` | Your sales process and what works — created during onboarding |
| `memory/offer-[slug].md` | One file per offer — created during onboarding or when you add an offer |
| `memory/session-log.md` | Rolling log of last 5 sessions — updated after every session |
| `memory/deals/deal-[slug].md` | One file per prospect — MEDDPICC map, gaps, admissions, feedback log |

---

## Requirements

- [Claude Code](https://claude.ai/code) (CLI or desktop app)
- Anthropic account

---

*Built by [termsheetinator](https://github.com/termsheetinator) · Part of the InfraSuite · Advisory Incubator™*

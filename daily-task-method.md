# How to get each day's tasks without thinking about them every day

## 0. Why "make a list every day" fails

Deciding every morning what to do today means **paying the cost of a decision every single day**. On tired days the judgment gets weak, and you fill the list with easy items (reviewing cards) while the heavy one (writing the spec) disappears. With only 13 hours a week during term, that scattered self-management is the main enemy.

**Invert it.**

> **Decide once a week (15 minutes on Sunday). Every day you only "expand" the plan; you do not choose.**

---

## 1. Five principles

| # | Principle | Why |
|---|---|---|
| 1 | **Decide weekly, never daily** | All judgment collapses into one session a week. The daily layer only executes |
| 2 | **Fix one "this one thing" per day first** | Even a broken day keeps one item. No zero days |
| 3 | **Write deliverables, not hours** | Not "2h of theory" but "one A4 page of the unit 15 pipeline diagram". You can tell whether it is done |
| 4 | **Prepare the bad-day minimum up front** | Deciding to scale down on the day is itself a burden |
| 5 | **Carry a task over twice at most. On the third time, drop it** | A task carried three times does not fit your current life. Drop it and rebuild the week |

---

## 2. A day has only three layers

```
★ must : the one thing (exactly one, 60-90 min)
  task : normal tasks (1-3, 15-45 min)
  min  : the bad-day minimum (1, 5-15 min)
```

**Fix must at one item.** Two items means both end up half-done.

**Example min**: "write one page of summary" -> "write only the summary headings". It is the escape hatch that keeps the number from reaching zero, and that is why the streak survives.

---

## 3. Sunday planning in 15 minutes (5 steps)

| Step | Time | What |
|---|---|---|
| 1 | 2 min | Look at last week's log and compute the **completion rate** (musts done / 7) |
| 2 | 3 min | Sort the weekly test's wrong answers into **four buckets** (missing knowledge / carelessness / design error / missed verification) |
| 3 | 3 min | Check next week's **gate** (which milestone is this week approaching?) |
| 4 | 5 min | Set the seven `must`s, using the mapping table below |
| 5 | 2 min | Look at the term calendar and decide whether to **switch to a light week** (midterm, final, paper due) |

If the completion rate stays under 70% for two weeks in a row, **cut the next week's tasks by 30%** (same rule as the roadmap). Cut from `task`. Keep the `must`.

---

## 4. Mapping table: weekday slot -> how to write the task

Each weekday has a **fixed kind of slot**, so filling it in decides the day.

| Day | Slot | How to write the must (example) | Task examples | Min example |
|---|---|---|---|---|
| Mon | Theory | Watch the first half of unit 15, then **draw the pipeline diagram on blank paper** | Turn three terms into cards / reread the relevant slides | Watch one video only (15 min) |
| Tue | Implementation drill | **7 MUX and decoder problems** (HDLBits) | One card per problem / one commit | Solve 2 problems |
| Wed | Verification | **Write and pass one self-checking testbench** | Get verilator `-Wall` to zero / one-line waveform note | Just run the linter |
| Thu | Project | **Write the "non-goals" section of the spec** | I/O table / state diagram | Write the headings only |
| Fri | Review | **30 minutes of blank-paper recall** (last week's circuit) | Review cards +1/+3/+7 / one error-log entry | Just look at the cards |
| Sat | Long block + extracurricular | **3 hours on the project** (spec -> implementation -> debug) | 2h extracurricular + one activity-log line / measure area with Yosys | Do 90 minutes |
| Sun | Weekly test | **45-minute test, 6 problems** (3 from this week + 3 from 2-4 weeks ago) | 30 min error log / 15 min next week's plan / 1 hour transfer work | Cards and the plan only |

**Term vs break**: during term, shrink the technical slots in this table to **6-8 hours a week** (Tue, Wed, Thu to one hour each). On long breaks, grow Saturday to 8 hours and make each `must` one feature of the project.

---

## 5. Granularity rules

- **Each item must finish in 15-90 minutes.** "Implement RV32I" is not a task (it is a two-month project).
- **Start with a verb** (write / measure / pass / explain / compare). "Understand X" is not a task.
- **Make it decidable** ("the test passes", "there is one diagram", "the table is filled in").
- **At most 3 tasks a day.** With 4 or more, all of them get shallow.

---

## 6. Broken days and carry-overs

| Situation | What to do |
|---|---|
| It is 22:00 and nothing is done | Do only the `min` (5-15 min). **Do not let it reach zero** |
| The must did not finish | Drop one of tomorrow's `task`s and put the must first |
| The same task slipped three times | **Drop it.** Ask in the weekly review why it does not fit, then split it or let it go |
| A class assignment is due within 48 hours | Drop every technical task that day (do not reschedule them) |
| You feel unwell | Switch to light mode (cards only). On the day you come back, one must only |

---

## 7. Three lines of log a day

```
2026-11-16 Mon  / must: done / 02:10 / stuck: where the pipeline registers go
2026-11-17 Tue  / must: missed (3 of 7 problems) / 00:40 / why: a class assignment ran long
2026-11-18 Wed  / must: done (testbench passes) / 02:00 / learned: forgot to initialize the expected value
```

With these three lines, **the Sunday review takes five minutes**. Without them you reconstruct the week from scratch every time.

---

## 8. Tooling (three options, all work)

| Method | Good for | Effort |
|---|---|---|
| **Script + Markdown** (included in this repo) | People who open a terminal daily | Write one file a week |
| Paper cards (one a day) | People who need screen-free days | Write 7 cards a week |
| Notion / Todoist template | People who want it on a phone | Copy once a week |

**This repo ships the first one.** Write one weekly file and `today` prints the rest.

```bash
# This week (11/16-11/22) is already prepared
python3 tools/daily.py today
python3 tools/daily.py week

# Create next week's template (do this on Sunday, then rewrite the musts)
python3 tools/daily.py new 2026-11-23

# Log one of the three lines
python3 tools/daily.py log "must: done / 02:10 / stuck: pipeline register placement"
```

**The point**: `today` only **looks up the block for today's date**. It decides nothing. If the block is missing it prints the weekday default template, so a forgotten day does not stop the streak.

---

## 9. How daily, weekly, monthly, and quarterly connect

```
Daily (three log lines)
  -> 7 days roll up
Weekly (Sunday, 15 min: completion rate, error buckets, next week's 7 musts)
  -> 4 weeks roll up
Monthly (30 min: month review, push the artifact to GitHub, three English sentences)
  -> 3 months
Quarterly (60 min: gate check G1-G6, a sample of 20 job postings)
```

**The higher the layer, the more judgment; the lower, the more execution.** The trick is not to judge at the daily layer.

---

## 10. Working with me (Buffy)

| When | You | Me |
|---|---|---|
| Sunday | Paste the seven days of log | Compute the completion rate, sort the errors into four buckets, propose next week's 7 `must`s |
| Sunday | Paste the weekly test answers | Grade them (is the reasoning sound) and name the weak units |
| End of month | Paste links to the artifacts | Edit the three README sentences and translate the activity log into English |
| Any time | Paste Verilog | Run lint, simulation, synthesis and comment |

**I cannot remind you** (there is no notification channel). That is why the daily list is **generated on your own machine without me**. That is what "accompaniment" realistically looks like.

---

## 11. The first week is ready

`plan/week-2026-11-16.md` holds **all seven days of W2 (11/16-11/22)**, expanded from the roadmap: 25 combinational-logic drills, review of weak spots in units 1-6, the 30-minute Sunday test, and blank-paper recall.

```bash
python3 tools/daily.py week     # all seven days at once
python3 tools/daily.py today    # just today
```

On Sunday 11/22, rebuild W3 (11/23-11/29, with diagnostic mock #1 on 11/29) the same way.

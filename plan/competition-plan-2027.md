# 2027 competition + study plan (optimized)

Created 2026-11-16. Supersedes the hour table in `rtl-roadmap-2026-11-12.md` section 2 for the period 2026-11-30 to 2027-08-22.

## 0. What "achieved" means (the definition of success)

This plan is a success only if all five hold on 2027-08-22:

1. **GPA 3.70 or higher** for Fall 2026, Spring 2027, Summer 2027. (Nothing below may cost this.)
2. **G2 (1/10), G4 (3/21 or the 4/4 reserve), G5 (4/18)** all passed.
3. **At least two solo competition submissions are public** (SMACD Open-Source Design Challenge and Tiny Tapeout, or GSoC if selected).
4. **GhostGate submitted** and, if shortlisted, presented.
5. **G6 checklist complete** (public repo, English README, bug tickets, tradeoff tables).

Anything not on this list is optional and is dropped first when the week goes wrong.

## 1. Why the hours go up, and by how much

Competitions need artefacts (GDS, DRC/LVS, papers, docker-run toolchains). Those cannot be produced in 2-hour evenings. The extra hours go to **winter break and summer**, not to the term.

| Period | Weeks | Hours/week | Total | Notes |
|---|---|---|---|---|
| 11/30 - 12/20 | 3 | 18 / 8 (finals) / 14 | ~40 | W4 mini project, W5 finals, W6 kickoff |
| 12/21 - 1/24 | 5 | **24** | **120** | the OpenLane block; cap was 25, so this is at the edge |
| 1/26 - 5/21 | 17 | **15** | **255** | 17 units at LMC; +2h over the old 13h ceiling |
| 5/24 - 8/22 | 13 | 26 during the summer session, 20 after | ~290 | CHEM 025 + GSoC |
| **Total** | 38 | | **~705** | old plan was ~600 |

**Where the extra hours come from**: the Saturday "extracurricular 2h" slot becomes a competition slot (no net change in term), and winter break rises from 18-22h to 24h.

## 2. Three weekly templates

### Winter (24h) - 12/21 to 1/24
| Day | Hours | Content |
|---|---|---|
| Mon | 3 | Unit 15 / theory or OpenLane learning |
| Tue | 3 | Design work (FIFO, UART) |
| Wed | 3 | Verification (self-checking TB, cocotb) |
| Thu | 3 | OpenLane flow: synthesis, floorplan, DRC/LVS |
| Fri | 3 | Review + error log + **1h buffer** |
| Sat | 6 | Long block: GDS clean + GhostGate practice |
| Sun | 3 | Mock exam / gate work / next-week plan |

### Term (15h) - 1/26 to 5/21
| Day | Hours | Content |
|---|---|---|
| Mon-Fri | 2 each (10) | Theory / drills / verification / project / review |
| Sat | 3 | 2h project + **1h competition** |
| Sun | 2 | 45-min test + 15-min plan + 1h transfer work |
| Buffer | 2.5 | Inside Friday and Sunday; not a separate slot |

### Summer (26h then 20h)
- Summer session weeks (CHEM 025): **8h class + 20h GSoC** = 28h.
- After the session: **20h GSoC** + 4h review.

## 3. Competition calendar (verified 2026-11-16)

| Item | Solo? | Deadline | Cost | Work |
|---|---|---|---|---|
| **GhostGate** (IEEE HOST 2027, hardware hacking) | **Yes - "Insertion is individual only"** | Register **12/18/2026**; practice modules 1/8/2027; shortlist 3/8; finals 5/3-6 (remote allowed) | free | 28h (8 practice + 20 challenge) |
| **AI-HDL 2027** (Arizona State) | Register alone, compete in a team of 3-5 | Register **12/18/2026**; league 1/14-4/29 | free | 0-26h (optional) |
| **SMACD Open-Source Design Challenge** | **Yes - open to everyone incl. independents** | Paper + repo **2/19/2027** | free | 57h (20 OpenLane + 25 design + 12 paper) |
| **Tiny Tapeout** | Yes | shuttle ~March / April 2027 | **EUR 385** | 12h (reuses the SMACD design) |
| **GSoC 2027** | **Yes - individual only** | 2027 dates unannounced; 2026 pattern: apply 3/16-3/31 | free | 25h prep + 240h if selected |
| XOHW | Yes (needs a faculty supervisor) | not announced | free | deferred to 2028 |
| Hackster / Tindie / EasyEDA | Yes | 12/20, 12/31, 1/31 | free | deferred (the SMACD repo covers the documentation skill) |

## 4. The single design that serves four purposes

The W7 deliverables are **FIFO and UART Tx**. Those exact blocks satisfy:

| Purpose | Requirement met |
|---|---|
| **G2** (1/10) | "write a synchronous FIFO with full/empty and a UART transmitter from memory" |
| **SMACD OSDC** | a digital design with GDS, clean DRC/LVS, public repo, reproducible |
| **Tiny Tapeout** | the same GDS through the TT template |
| **AI-HDL** (phase 1) | base design expansion |

So: **do not design three things.** Design one FIFO+UART, harden it in OpenLane, publish it, and submit it three times. This is the whole optimisation.

## 5. Winter block, week by week (12/21 - 1/24)

### W7 (12/21-12/27) - 24h
- must: get the **FIFO** through OpenLane to GDS (synthesis, floorplan, place, route)
- task: unit 15 second half (control hazards) - 3h
- task: GhostGate practice module 1 - 4h
- min: run the OpenLane demo design once

### W8 (12/28-1/3) - 24h
- must: **DRC and LVS clean** on the FIFO GDS (this is the SMACD entry requirement)
- task: UART Tx through the same flow - 6h
- task: 90-minute mock #2 (units 1-15) - 2h
- task: SMACD paper outline (4 pages: design, flow, results, reproducibility) - 3h
- min: read the DRC report and fix one violation

### W9 (1/4-1/10) - 24h
- must: **G2 gate** - blank-paper writing of the 5 blocks + mock score 85%+ (8h)
- task: repo polish: README, Makefile that reproduces, tool versions - 6h
- task: GhostGate practice module 2 - 4h
- **DECISION 1/10**: GDS + clean DRC/LVS exists? If no -> SMACD moves to 2028 and the winter hours revert to phase A.
- min: mock exam only

### W10 (1/11-1/17) - 24h
- must: SMACD paper first draft (4 pages) - 8h
- must: GhostGate challenge work - 8h
- task: phase B start (SystemVerilog style guide, instruction table v1.0) - 4h
- min: paper skeleton

### W11 (1/18-1/24) - 24h
- must: SMACD submission package complete (paper + repo + reproducibility check on a clean checkout) - 8h
- must: GhostGate challenge work - 12h
- task: spring semester setup (print the 11/24 registration sheet, confirm CHEM 006 0052 times) - 2h
- min: submit nothing broken; the repo must clone and build

## 6. Spring term (1/26 - 5/21): 15h/week

| Dates | Competition work inside the Saturday 1h + Friday buffer | Gate |
|---|---|---|
| 1/26 - 2/19 | SMACD: final polish, submit by **2/19** (2h/wk) + GhostGate (3h/wk) | **G3 1/31** (single-cycle RV32I runs 3 programs) |
| 2/20 - 3/8 | Tiny Tapeout submission from the same GDS (2h/wk) + GhostGate close (3h/wk) | - |
| 3/9 - 3/31 | **GSoC application** 3/16-3/31 (3h/wk); if GhostGate shortlisted, +5h/wk | **G4 3/21** |
| 4/1 - 4/18 | GSoC prep / AI-HDL (optional, 1h/wk) | **G5 4/18** (reserve G4 date: 4/4) |
| 4/19 - 5/21 | **No new competition.** Finals and phase C spec only | - |

**Gate protection rule**: if GhostGate shortlists you on 3/8, G4 moves to **4/4** and G5 stays at 4/18. Nothing else moves.

## 7. Summer (5/24 - 8/22)

| Case | Plan | Hours/week |
|---|---|---|
| **GSoC selected** | CHEM 025 (summer session) + GSoC 20h. **GSoC replaces the phase C flagship project** - it is a mentored, paid, public artefact | 28 for 6 weeks, then 20 |
| **GSoC not selected** | CHEM 025 + phase C project (RV32I public release) + Tiny Tapeout in the August shuttle | 22 |

Either way, the G6 checklist is filled by the end of August.

## 8. Two decision points and the drop order

**Decision A (1/10)**: is there a GDS with clean DRC/LVS? If not, drop SMACD (keep the hours for phase A/B).
**Decision B (3/8)**: was GhostGate shortlisted? If yes, G4 -> 4/4. If no, the 20h goes to GSoC prep.

**Drop order when a week collapses** (top first, never touch gates):
1. AI-HDL (-26h, team-dependent, the least reliable)
2. Tiny Tapeout (-12h, EUR 385) - the public repo alone still counts
3. SMACD (-57h) - but only at Decision A
4. GhostGate (-28h) - free, short, solo: keep to the end

**If the completion rate stays under 70% for two weeks**: cut competition work to 1h/week and keep only the gate musts. Do not cut the gates.

## 9. Arithmetic check

- Winter: 24h x 5 weeks = 120h. Needs 57 (SMACD) + 28 (GhostGate practice + start) + phase A leftovers (~35h) = 120h. **Fits exactly with no slack** - so the Friday 1h buffer is not optional.
- Spring: 15h x 17 = 255h. Inside it, competition = 3h/week x 12 weeks = 36h, technical = 7h x 17 = 119h, review/planning = 3h x 17 = 51h, buffer = 2h x 17 = 34h.
- Summer: 20h x 12 = 240h (GSoC) + CHEM 025.
- Deadlines in order: 12/18 (register) -> 2/19 (SMACD) -> 3/8 (GhostGate) -> 3/16-31 (GSoC) -> 4/18 (G5) -> 4/29 (AI-HDL) -> 5/6 (HOST finals) -> 5/21 (finals) -> 5/25 (GSoC starts).

## 10. Not confirmed

- GhostGate difficulty and real time cost (revealed 1/8) - the 28h estimate may be low.
- Whether SMACD winners must present in Seville (travel cost, F-1 travel signature).
- GSoC 2027 official dates.
- Whether AI-HDL actually matches an independent registrant to a team.
- Whether the March/April 2027 Tiny Tapeout shuttle dates are open for new submissions.

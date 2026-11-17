# Roadmap to an RTL design engineer (revision v2)

**Start: Thursday 2026-11-12. Assumes MIT 6.004 has been studied through unit 14.**

The shape has not changed: first year at community college -> transfer to a four-year university in
Fall 2028 -> graduate June 2030 -> new-graduate RTL design engineer in 2030. What changed is **how the
hours are allocated and how unit 15 onward is handled**.

---

## 0. What changed in this revision

| Item | Previous | This revision | Why |
|---|---|---|---|
| Start date | 2026-11-02 (Mon) | **2026-11-12 (Thu)** | Given. W1 is a short four-day week |
| Theory position | Units 1-7 watched, not reviewed | **Units 1-14 studied** | Given. The only remaining core unit is 15, "Pipelining the Beta" |
| W1-W4 | Review sprint (theory-heavy, 11h/week) | **Review becomes "write it and check it", plus implementation drills** | If 1-14 is in, hands-on beats re-watching lectures |
| 11h/week breakdown | Theory 6 : implementation 5 | **Theory 2 : implementation 4 : verification 3 : synthesis and measurement 2** | Move the hours freed by less theory into work that produces artifacts |
| Phase A | 10 weeks (W0-W10) | **9 weeks (W1-W9)** | Theory no longer needs pulling forward |
| Phase B start | 2027-01-11, first 2-3 weeks reviewing theory | **2027-01-11, SystemVerilog implementation from week one** | Unit 13 (building the Beta) is done, so implementation can start |
| Gates | Four 90-minute mocks | **Six 90-minute mocks (G1-G6) plus entry/exit judgement per phase** | Pin the criteria to dates |
| Units 16-19 | Not planned | **Unit 15 mandatory; units 18 and 19 optional in summer** (interrupts and synchronisation feed directly into RTL) | 18 = devices and interrupts, 19 = concurrency and synchronisation (the basis of CDC and handshakes) |

---

## 1. Assumptions

| Item | Assumption |
|---|---|
| Target role | New-graduate RTL design engineer: defining design intent, verification, design decisions. Physical design only to the level of knowing the whole picture |
| Employer | Japan first, the US prepared in parallel |
| Transfer | First-choice group = top universities (Ivy League etc.), apply March 2028. Safe tier = UC Davis (TAG) and other UCs, apply November 2027. Both start Fall 2028 |
| Graduation | June 2030 (junior transfer, two years; to be confirmed) |
| Study hours | **11-13 h/week in term (cap 18) / 4 h/week during midterms and finals / 22 h/week in long breaks (cap 25)**. Corrected in v3: 18 h/week in term does not coexist with GPA |
| Current skill | Some Verilog/VHDL. MIT 6.004 units 1-14 (combinational and sequential logic, FSM, performance measures, trade-offs, ISA, the Beta, caches) |
| Environment | WSL2 (Ubuntu) + Icarus Verilog / Verilator / GTKWave / Yosys (+ SymbiYosys, OpenSTA as needed) |
| Week boundary | Monday. **W1 = 2026-11-12 (Thu) to 11-15 (Sun), four days**; W2 onward is Monday-Sunday |
| Highest priority | Coursework and GPA. The plan sits on top of that |

### When these assumptions break

- **If units 1-14 are only "watched" and not solid** -> the W3 diagnostic (11/29) will show it. Below 80%,
  spend all of W4 on weak spots and shift W5 onward back one week. Phase B may start as late as 1/18
  (absorbed by the spare weeks W39-W40 in summer).
- **If LMC finals collide with mid-December** -> W6 (12/14-12/20) is already fixed as a light week (8 h).
  If more room is needed, lighten W5.
- **If the Tiny Tapeout cost or deadline does not fit** -> downgrade submission to "if possible". The
  artifact is the design plus a generated GDS, published (decided in W35).

---

## 2. Time design

### Standard week (18 h)

| Day | Hours | Content | Artifact for the day |
|---|---|---|---|
| Mon | 2h | Theory: unit 15 lecture (slides + video), or an overview of units 16-19 | One-page summary, written without the material |
| Tue | 2h | Implementation drill: HDLBits, or a small module from spec to code | One commit + a 10-minute card |
| Wed | 2h | Verification: testbenches, randomised tests, SVA, reading waveforms | A record of a failing test becoming a passing one |
| Thu | 2h | Project: spec first -> implementation -> debug | Spec or implementation moved forward |
| Fri | 2h | Review: cards (30 min) + blank-page recall (30) + error log (30) + spare (30) | One blank-page reproduction |
| Sat | 5h | Long project block 3h + extracurricular 2h | Something that runs / one line in the activity log |
| Sun | 3h | Weekly test 45 min + error log 30 + next week's plan 15 + transfer prep 1h + spare 30 | Test result and next week's plan |

**The 11 technical hours break down as: theory 2 / implementation 4 / verification 3 / synthesis and
measurement 2.** This is the core of the revision.

**v3 correction (important)**: the 18-hour shape is for **long breaks**. In term, cut to **11-13 hours**:
6-8 technical, 2 review, 2 extracurricular, 1 planning. What counts in transfer admission is GPA and
completed major preparation, not RTL hours during term (see `transfer-strategy-v3.md` section 9).

> The previous revision gave theory 6h. With units 1-14 in place, those four hours move directly into
> verification and synthesis, because **what separates candidates for new-graduate RTL roles is not
> "it runs" but the record of verification and judgement**. Lecture review is batched before mocks
> (W3, W8, W19 and similar).

### Light week (8 h)

Midterm and finals weeks, and weeks when you are unwell. No new material; only four things: card review
(30 min x 4 days) + one 90-minute exercise + coursework. **W6 (12/14-12/20) is fixed as a light week.**

### Long break (up to 25 h)

Winter break (W7, W8) and summer (parts of W24-W41). 25 is a ceiling, not a weekly target.

### Rules for when it falls apart

1. If two consecutive weeks fall below 70% of plan (12.6 h), cut the volume by 30% from the next week.
   **Not stopping is the priority.**
2. If a course assignment is due within 48 hours, set technical study to zero that day and give it to the
   course (do not reschedule; drop it).
3. In a week where the weekly test is failed, remove one new item the following week and spend it on review.

---

## 3. Overall map

| Phase | Period | Weeks | Main purpose | Main artifacts | Gates |
|---|---|---|---|---|---|
| **A: re-confirm the foundations, raise implementation volume** | 2026-11-12 to 2027-01-10 | W1-W9 | Confirm units 1-14 stick, make Verilog something you can *write*, get ahead on unit 15 | ALU, register file, FIFO, UART Tx, RV32I parts | G1 (11/29), G2 (1/10) |
| **B: RV32I CPU, verification, synthesis** | 2027-01-11 to 04-18 | W10-W23 | Single cycle -> 5-stage pipeline, hazards, verification, Yosys, STA | 5-stage pipelined RV32I (all tests passing, synthesises) | G3 (1/31), G4 (3/21), G5 (4/18) |
| **C: summer public artifacts** | 2027-04-19 to 08-22 | W24-W41 | A flagship artifact that can be published, Tiny Tapeout, AI supervision report | English-README repository, bug tickets, trade-off tables, submission if possible | G6 (8/22) |
| **D: transfer applications** | 2027-08-23 to 2028-06 | monthly | TAG, UC application, top-university applications, keep grades | Full application set, four PIQs, two letters | Applications complete (2028-03-15) |
| **E: after transfer and into employment** | 2028-09 to 2030-06 | quarterly | Upper-division courses, research, internship, recruiting | Offer, graduation | Graduation 2030-06 |

---

## 4. Phase A: re-confirm the foundations and raise implementation volume (W1-W9, 2026-11-12 to 2027-01-10)

### 4.1 Purpose

A period for confirming by **writing** that units 1-14 are actually in place. Not re-watching lectures:
blank-page summaries and implementations expose the gaps, and only the gaps go back to lectures. In
parallel, unit 15 (pipelining) is pulled forward into December so the January CPU work does not stall.

### 4.2 Exit criteria (G2, 2027-01-10)

1. **85% or better** on a 90-minute mock covering units 1-15 (higher than the previous 80% because 1-14 is already studied).
2. Write the following five **without notes, each in 60 minutes**: 4-bit adder + testbench / 8-bit ALU /
   2R1W register file / synchronous FIFO with full and empty / Moore FSM (state diagram + code).
3. Three mini artifacts published on GitHub, each with a **1-2 page spec, a self-checking testbench, a
   Yosys synthesis result, and an English explanation of 3-5 sentences**.
4. **Zero inferred latches and zero combinational loops** in the synthesis log.

### 4.3 Weekly plan

| Week | Period | Theory (2h) | Implementation and verification (9h) | Review and artifacts |
|---|---|---|---|---|
| **W1** | 11/12(Thu)-11/15(Sun), 4 days | Blank-page summary of units 1-7 (60 min) | Record tool versions, repository conventions, half adder -> 4-bit adder through spec, testbench, waveform and synthesis in one pass | Learning log and card format fixed. 10h total is fine for W1 |
| **W2** | 11/16-11/22 | Return to lectures only for weak spots in units 1-6 | 25 combinational drills (MUX, decoder, priority encoder, adder, comparator), one 10-minute card each | 30-minute mini test on Sunday (6 questions). Blank-page recall: 4-bit adder |
| **W3** | 11/23-11/29 | Summary of units 7-9 (performance, trade-offs, ISA) | 15 sequential drills + 2 FSMs (sequence detector, traffic light) | **11/29 diagnostic mock #1: units 1-14, 90 min, no notes (G1)**. Rebuild cards from the wrong answers |
| **W4** | 11/30-12/06 | Repair mock weak spots (up to 2h) | **Mini artifact 1: 8-bit ALU** (add/sub, logic, compare, shift). Spec -> test plan -> self-checking TB -> implementation -> Yosys area | README (English, 3-5 sentences) + area table. Whole-picture day: one pass over the ASIC flow |
| **W5** | 12/07-12/13 | **Unit 15, first half** (pipelining, stage splitting, data hazards) | **3-stage pipelined adder**. Measure cell count and logic depth with Yosys before and after pipelining | **Trade-off table #1** (area, depth, rough fmax) + why it was chosen, in English, 3-5 sentences |
| **W6** | 12/14-12/20 | Light week: cards only | **2R1W register file** (write-first, combinational read) + unit testbench | Light mode. If there are no finals, return to normal |
| **W7** | 12/21-12/27 | **Unit 15, second half** (control hazards, branches, the idea of exceptions) | **Synchronous FIFO** (full/empty, compare two depth choices) + **UART transmitter** | FIFO depth comparison table + the reason for the choice. README with a waveform screenshot |
| **W8** | 12/28-01/03 | Unit 15 exercises (worksheets) | **RV32I parts pulled forward**: ALU for RV32I, immediate generation, decoder as standalone units | **90-minute mock #2: units 1-15** (no notes). Tidy the error log |
| **W9** | 01/04-01/10 | Units 16-19 **overview only** (reading, 20 min each) | Rewrite 30% of mini artifacts 1-3 from a blank page | **Gate G2**. Below 80%: give Phase B's first week to review |

### 4.4 W1, day by day

| Date | Hours | Content | Definition of done |
|---|---|---|---|
| 11/12 (Thu) | 2h | Record `iverilog -V`, `verilator --version`, `yosys -V`. Create `rtl-journey` on GitHub. Fix the directory convention (`rtl/ tb/ syn/ docs/ notes/`) and the commit convention | Versions in `notes/env.md`, one empty commit pushed |
| 11/13 (Fri) | 2h | Blank-page summary of units 1-7 (60 min) -> 20 cards from the errors. Cards must ask you to *explain* | 20 cards in `notes/cards/`, first interval date written |
| 11/13 (Fri) | +20 min | **Check ASSIST for "LMC -> Davis PHY 9D" and "LMC -> SJSU Math 30/31, Physics 50, CMPE/EE 30"** (added in v3: the fatal point for transfer) | One mapping table in `notes/admissions/articulation.md`. If absent, look at neighbouring community colleges |
| 11/14 (Sat) | 4h | Half adder -> 4-bit adder: one-page I/O table -> TB -> waveform -> `yosys` synthesis -> README | The four-part set (spec, TB, waveform, synthesis log) in one commit |
| 11/15 (Sun) | 2h | Units 8-14 **listed only** (two lines each; blank-page summaries move to W2, corrected in v3) -> next week's plan -> first-pass transfer requirements (one page) | Next week is on the calendar |

### 4.5 How to work through unit 15 (W5, W7)

Unit 15 has the largest gap between "understood when read" and "can write it". Work in this order:

1. **Lecture** (Mon 2h): why pipeline -> stage splitting -> pipeline registers -> data hazards
   (stall/forwarding) -> control hazards (branch flush).
2. **Summary** (remaining 30 min on Mon): one A4 page without the material. **Draw the pipeline diagram
   yourself**; if you cannot, it is not in yet.
3. **Confirm by building** (Tue-Sat): 3-stage pipelined adder -> a test that deliberately causes a hazard.
4. **Blank-page recall** (Fri): draw only the positions of the inter-stage registers.
5. **Explain out loud** (Sun): two minutes, recording allowed. Anything that stalls goes into the error log.

**Note**: the Beta in 6.004 is a course-specific ISA. Learn the concept from unit 15, implement it in
RV32I (W8 onward). There is no need to reproduce the Beta implementation assignments.

### 4.6 Where this phase gets stuck

| Symptom | Cause | Fix |
|---|---|---|
| Mock below 80% | Timing vocabulary in units 4-5 (combinational, sequential) is vague | Go back until tPD/tCD/setup/hold can be written as equations and diagrams on blank paper (2h in W4) |
| Can write an ALU, cannot write verification | Using testbenches to *look at waveforms* | Always convert to self-checking: compare against an expected value and `$display` PASS/FAIL |
| Synthesis produces something that does not work | Inferred latches, asynchronous reset handling, dependence on initial values | Run `yosys -p "read_verilog ...; synth; stat"` every time and drive warnings to zero |
| Unit 15 feels heavy | Trying to memorise the hazard classification | Build the table "which stage needs which stage's result" first; a table beats memory |

---

## 5. Phase B: RV32I CPU, pipeline, verification, synthesis (W10-W23, 2027-01-11 to 04-18)

### 5.1 Purpose and exit criteria

Build single-cycle -> 5-stage pipeline in steps, and satisfy **both** "my tests all pass" and "Yosys
synthesises it" (simulation passing does not mean it is correct after synthesis).

- G3 (1/31): single-cycle RV32I subset executes three programs (sum loop, Fibonacci, `memcpy`).
- G4 (3/21): 5-stage pipeline passes all instruction tests, and Yosys synthesis shows zero inferred latches.
- G5 (4/18): randomised instruction tests and assertions are in place, and area and critical-path
  candidates are in a table.

### 5.2 RV32I subset (spec v1.0 scope)

Decide and document the scope in W10 (do not widen it):

- **R-type**: add, sub, and, or, xor, sll, srl, sra, slt, sltu
- **I-type**: addi, andi, ori, xori, slli, srli, srai, slti, sltiu, lb, lh, lw, lbu, lhu, jalr
- **S-type**: sb, sh, sw
- **B-type**: beq, bne, blt, bge, bltu, bgeu
- **U-type**: lui, auipc
- **J-type**: jal
- **Excluded**: FENCE / ECALL / EBREAK / CSR instructions, multiply and divide (M extension), floating point

### 5.3 Weekly plan

| Week | Period | Theory (2h) | Implementation and verification (9h) | Artifact / gate |
|---|---|---|---|---|
| **W10** | 01/11-01/17 | Unit 13 review (how the Beta is built) | Move to SystemVerilog (`logic`/`always_ff`/`always_comb`/`enum`/`package`). Rewrite 5 HDLBits exercises in SV | **Instruction table = spec v1.0**, verification plan v1 |
| **W11** | 01/18-01/24 | Unit 9 (ISA) review | Decoder + immediate generation (all of I/S/B/U/J). Unit testbench per format | Sign-extension tests all pass |
| **W12** | 01/25-01/31 | Rest of unit 13 | Connect register file + ALU + PC + instruction memory. Run three programs | **G3 (1/31)**: single-cycle works |
| **W13** | 02/01-02/07 | Unit 13 (control logic, branches) | Control unit, loads and stores, branches. Initialise memory with `$readmemh` | Unit tests for every instruction + two more programs |
| **W14** | 02/08-02/14 | Review week (no new material) | Re-implement the datapath on blank paper (split by function) | **AI supervision #1**: have an AI review your decoder, decide yourself whether each comment is right, record it |
| **W15** | 02/15-02/21 | Unit 14 review (caches) | Direct-mapped cache (write-through) + tests | Derive the AMAT formula yourself; sweep the parameters into a table |
| **W16** | 02/22-02/28 | Unit 15 refresh | **5-stage pipeline skeleton** (no hazard handling): IF/ID/EX/MEM/WB + inter-stage registers | **Trade-off table #2** (single-cycle vs 5-stage: cells, logic depth, rough fmax) |
| **W17** | 03/01-03/07 | - | Data hazards: forwarding + stalling. A table of every hazard pattern and a test per pattern | On Friday, write the patterns out without the table |
| **W18** | 03/08-03/14 | - | Control hazards (branch flush), load-use hazard. All instruction tests passing | **AI supervision #2**: have an AI implement the 5-stage from spec v1.1, diff it against your tests |
| **W19** | 03/15-03/21 | Review week | Gate preparation. Re-implement inter-stage registers on blank paper from the block diagram alone | **G4 (3/21)**: all tests + synthesis pass |
| **W20** | 03/22-03/28 | - | Verification hardening: self-checking TBs, an expected-value model in Python, randomised instruction streams, instruction coverage metric | Coverage table (instruction type x test type) |
| **W21** | 03/29-04/04 | SVA concepts (reading) | Get Verilator `-Wall` clean. Formally verify a small circuit with SymbiYosys (e.g. FIFO full detection) | Log of one formal verification |
| **W22** | 04/05-04/11 | Static timing analysis concepts | Synthesise with Yosys, experiment with latches and combinational loops. Read OpenSTA / OpenROAD reports | Synthesis report + table of critical-path candidates |
| **W23** | 04/12-04/18 | Review week | 90-minute mock on units 1-15. Skeleton of the Phase C spec v2 | **G5 (4/18)**: judgement and the summer plan fixed |

### 5.4 Columns of the hazard table (built in W17)

| Instruction i (producer) | Instruction i+1 (consumer) | Value needed | Source | Handling | Test name |
|---|---|---|---|---|---|
| `lw x1, 0(x2)` | `add x3, x1, x4` | x1 | MEM/WB | 1-cycle stall + forward | `t_load_use` |
| `add x1, x2, x3` | `sub x4, x1, x5` | x1 | EX/MEM | Forward only | `t_ex_forward` |
| `beq x1, x2, L` | `add ...` (target) | PC | ID | Flush (1 instruction) | `t_branch_flush` |

> This table becomes both the README and the interview material. The goal is to be able to say "I turned
> every hazard into a row and a test", not "I memorised the hazards".

---

## 6. Phase C: summer public artifacts (W24-W41, 2027-04-19 to 08-22)

### 6.1 Purpose

Build technical skill and the **public evidence** that anchors the transfer application, at the same time.

1. Publish the 5-stage pipelined RV32I with a spec, verification, synthesis results and an English README.
2. **Prepare** a small design for Tiny Tapeout (submit if cost and deadline allow).
3. Write the AI supervision report (implement from your own spec via an AI, then verify the differences).

### 6.2 Weekly plan

| Week | Period | Artifact work | Learning / extracurricular | Result |
|---|---|---|---|---|
| **W24** | 04/19-04/25 | Planning: RV32I integer subset (optionally cache) | Clear Phase B leftovers | Spec v2 (1-2 pages) + block diagram |
| **W25** | 04/26-05/02 | Microarchitecture document (stages, signal table, hazard table) | Compare two options (e.g. branch handling) | Comparison table + reason, English 3-5 sentences |
| **W26** | 05/03-05/09 | IF and ID implementation and tests | One code review per week | Blank-page recall |
| **W27** | 05/10-05/16 | EX, MEM, WB implementation and tests | Light mode if finals approach | Card review |
| **W28** | 05/17-05/23 | Integration, all per-instruction tests passing | One code review per week | Error log tidied |
| **W29** | 05/24-05/30 | Review week (Phases A-B in full) | Mid-review: explain the design to a third party | 90-minute mock + explanation note |
| **W30** | 05/31-06/06 | Verification: self-checking TBs, randomised instruction streams, coverage metric | One code review per week | Coverage table |
| **W31** | 06/07-06/13 | Obtain and run public RISC-V tests (`riscv-tests` etc.; source to be confirmed) | Put the bug-ticket format to work | Three or more bug tickets on GitHub |
| **W32** | 06/14-06/20 | Synthesis: area (cells) and critical-path candidates | Whole-picture day (physical design flow) | Synthesis results table |
| **W33** | 06/21-06/27 | Pick one performance improvement and compare before/after (e.g. branch handling or splitting the ALU stage) | - | Comparison table + English 3-5 sentences |
| **W34** | 06/28-07/04 | AI supervision report proper (bugs found, kinds, what it missed) | - | Report draft |
| **W35** | 07/05-07/11 | Tiny Tapeout preparation: implement a small design (UART Tx etc.) on their template, confirm the GDS generation steps | Check deadline and price on the official site | Note deciding whether to submit |
| **W36** | 07/12-07/18 | Review week | Mock interview: 30 RTL basics aloud | Unanswered questions into the error log |
| **W37** | 07/19-07/25 | Documentation: README in English (purpose, block diagram, verification results, synthesis results, constraints, known bugs) | Tidy figures and reports | README complete |
| **W38** | 07/26-08/01 | Publish: tidy GitHub, waveforms, figures, demo | Announce in an article or LinkedIn | Public URL |
| **W39** | 08/02-08/08 | Spare week (absorb delays) | Essay material: 800 characters (Japanese and English) on the artifact's key points | Material saved |
| **W40** | 08/09-08/15 | Spare + overview of units 18-19 (devices, interrupts, synchronisation) | Widen the SoC picture | One-page summary |
| **W41** | 08/16-08/22 | Autumn course plan, confirm TAG conditions (updated in August) | Switch to monthly planning | **G6 (8/22)**: publication checklist complete |

### 6.3 Publication checklist (G6)

- [ ] Repository has `README.md` (English), `docs/spec.md`, `docs/verification.md`, `docs/synthesis.md`, `docs/bugs.md`
- [ ] The spec states instruction scope, performance targets and non-goals (what it will not do)
- [ ] Tests run with a single `make test` and summarise PASS/FAIL
- [ ] The random test seed and the reproduction steps are written down
- [ ] A Yosys synthesis script and log exist, with area and depth in a table
- [ ] Two or more trade-off tables (stages, branch scheme, etc.) with the reason written in English
- [ ] Three or more bug tickets (symptom, cause, fix, regression test)
- [ ] Known limitations are stated (unimplemented instructions, timing constraints, unverified assumptions)
- [ ] At least three waveform screenshots or figures
- [ ] Steps a third party can follow in 30 minutes (including dependency versions)
---

## 7. Phase D: transfer applications (2027-08-23 to 2028-06)

In this period **the main work shifts to application documents**. RTL goes into maintenance mode
(4-6 h/week); grades and documents come first.

### 7.1 Monthly calendar

| Period | To do | Done when |
|---|---|---|
| 2027-08-23 to 08-31 | Register for autumn courses. Confirm the TAG condition update (revised every August). Final check of required-course articulation in ASSIST | Course table and TAG checklist |
| 2027-09-01 to 09-30 | **TAG application (one school only: Davis)**. UCSC Baskin does not accept TAG, and UCI's TAG excludes EE/CPE, so in practice Davis is the only engineering TAG available | Screenshot of the completed application |
| 2027-10-01 to 11-30 | **UC application** (Davis, Berkeley and others). Four PIQs plus the activities section | Submitted |
| 2027-12 | Ask two recommenders (plus one backup). Give them grades, artifact links and a one-page statement of purpose | Two acceptances |
| 2028-01 | Update grades (TAU, priority deadline 1/31). Columbia essay (400-600 words) first draft | TAU submitted, essay drafted |
| 2028-02 | Finalise Columbia / Princeton / Cornell documents. Columbia's Curriculum Report goes in once mid-term grades exist (accepted until 4/15) | Ready to submit |
| 2028-03-01 | **Columbia, Princeton and others** applications | Submitted |
| 2028-03-15 | **Cornell (Engineering)** application | Submitted |
| 2028-04 | UC results. Columbia Curriculum Report deadline (4/15) | Results recorded |
| 2028-05 | Compare all results (cost, credit transfer, terms to graduation, research access) | One comparison table |
| 2028-06-01 | **UC Statement of Intent to Register (SIR) deadline**, Columbia decision deadline | SIR submitted |

### 7.2 Maintenance-mode RTL (4-6 h/week)

Stopping entirely makes the transfer courses painful. Keep **exactly one small thing** moving.

- Subject: one of SPI master, I2C master, AXI4-Lite slave, PWM with dead-time generation.
- Conditions: one-page spec + self-checking TB + Yosys synthesis. **Two to three months is fine.**
- Use: a concrete example for the transfer essay, an interview topic, preparation for transfer courses.

---

## 8. Phase E: after transfer and into employment (2028-09 to 2030-06)

### 8.1 Quarterly focus

| Period | Coursework | RTL / research | Recruiting |
|---|---|---|---|
| 2028-09 to 12 | Upper-division courses (digital system design, computer architecture, intro VLSI, signal processing). **GPA first** | Approach research groups (1-2). RTL 6-8 h/week | **Summer 2029 internship applications open** (US cycle is the previous autumn to winter). Build the resume in August |
| 2029-01 to 03 | Winter quarter | Continue research; keep small tapeouts or OSS contributions going | Japan: new-graduate recruiting opens (usually March; confirm). Internship interviews |
| 2029-04 to 06 | Spring quarter | Prepare for the summer internship | Japanese early selection, US internship results |
| 2029-07 to 09 | Summer | **Internship (US or Japan)**. Aim for a return offer | The internship's assessment is the strongest recruiting material |
| 2029-10 to 12 | Autumn quarter | Start the senior project | Main recruiting (Japan autumn-winter, US fall). If applying to a master's: GRE and letters |
| 2030-01 to 03 | Winter quarter | Senior project | Offer fixed, negotiate terms |
| 2030-04 to 06 | Spring quarter | Write up the senior project | **Graduate June 2030, start work** |

### 8.2 Whether to do a master's (decide December 2028)

This plan assumes **bachelor's in June 2030 and direct entry to industry**, but it is reviewed **once,
in December 2028**. The inputs are actual job postings and the university's own office, not rumour.

| Question | What to check | Where |
|---|---|---|
| Degree requirement for design roles in Japan | How often "master's or above" appears in new-graduate RTL postings at major semiconductor firms, design subsidiaries and foreign companies' Japan sites (sample 20) | Company career pages, job sites |
| Working in the US | OPT / STEM OPT duration, H-1B treatment, the difference between bachelor's and master's | University International Office |
| Entry to research or advanced design | Whether master's is needed for architecture, DFT, low power | Postings, faculty |
| Cost versus benefit | Two years of tuition against starting salary and promotion speed with a bachelor's | University cost pages, alumni |

**So that this decision is not deferred**, put those four points on one page during the autumn 2028 quarter and save it.

### 8.3 Decomposing the job title (the range to aim at as a new graduate)

Do not treat "RTL design engineer" as one thing; aim at adjacent roles too.

| Role | Content | Weak spot in this plan | How to cover it |
|---|---|---|---|
| RTL design | Spec -> microarchitecture -> RTL -> unit verification | Large-design experience, constraint files | Raise the scale with the summer artifact |
| Design verification (DV) | Testbenches, UVM, coverage, formal | Class-based verification with UVM/SystemVerilog | A UVM introduction after transfer |
| DFT | Scan insertion, ATPG, design for testability | No experience | Lectures plus tool concepts only (whole-picture day) |
| Physical design | Floorplan, place and route, STA | No experience (deliberately shallow) | One OpenROAD tutorial, no more |
| Tool development / FAE | EDA vendors, CAD teams at semiconductor firms | Software engineering training | One or two CS courses after transfer |
| Architecture | Performance analysis, spec definition | Mostly master's and PhD | Decide together with the master's question |

### 8.4 Interview preparation (start W36, finish autumn 2029)

Thirty questions (answer aloud in 30 seconds to 2 minutes):

1. Explain the difference between setup time and hold time with a timing diagram.
2. Blocking versus non-blocking assignment, and the danger of mixing them.
3. Coding styles that infer a latch, and how to avoid them.
4. What causes a combinational loop.
5. Moore versus Mealy FSM, and when to use each.
6. Trade-offs of one-hot versus binary state encoding.
7. Throughput versus latency in a pipeline.
8. The three kinds of data hazard and the handling for each.
9. Why a load-use hazard needs only one stall cycle.
10. Three ways to reduce branch penalty.
11. How to find a critical path and how to shorten it.
12. Illustrate the area/speed/power trade-off with your own design.
13. Dangers when passing a signal between asynchronous clocks, and the countermeasures.
14. How to detect FIFO full and empty using only the pointers.
15. What metastability is, and why two flip-flops mitigate it.
16. When to use synchronous versus asynchronous reset.
17. Three examples of non-synthesizable coding.
18. The AMAT formula for a cache and what each term means.
19. Direct-mapped versus set-associative.
20. The bug in your own CPU that cost you the most, and its cause.
21. How you defined "correct" in your testbench.
22. Why fix the seed of a random test.
23. How you measured coverage (instruction type, hazard type).
24. If you could write only one assertion, what would it be.
25. When to use formal verification versus simulation.
26. What you read from a Yosys synthesis result.
27. Name three known limitations of your design.
28. If you built the same spec a different way, what would you change.
29. When you had an AI implement a design, what did it fail to catch.
30. Explain this design to a non-specialist in three minutes.

---

## 9. Gates and what happens if one is missed

| ID | Date | Criterion | If missed |
|---|---|---|---|
| **G1** | 2026-11-29 | 75% or better on a 90-minute mock of units 1-14 | Spend W4 on weak spots, shift W5 onward back one week. Phase B may start as late as 1/18 |
| **G2** | 2027-01-10 | 85% on units 1-15 / five circuits on blank paper in 60 min / three mini artifacts published / zero synthesis warnings | Cover the shortfall in the W10-W11 theory slots. Missing mini artifacts are recovered in the W14 review week |
| **G3** | 2027-01-31 | Single-cycle executes three programs | Give W13 to implementation, move G4 to 3/28. Absorbed by the summer spare weeks |
| **G4** | 2027-03-21 | 5-stage passes all instruction tests + Yosys synthesis | Clear the failures in the W20-W22 verification weeks. Extend W24-W25 of the summer phase |
| **G5** | 2027-04-18 | Randomised tests + assertions + area/critical-path table | Carry forward into W30-W32 of the summer phase (cut spare weeks W39-W40) |
| **G6** | 2027-08-22 | Every item of the publication checklist (6.3) | It collides with September application preparation, so **use W39 and W40 entirely** to finish. If still incomplete, publish anyway **stating that it is incomplete** (do not hide it) |

---

## 10. Review and recording system (the concrete procedure)

### 10.1 Card format

One row per card (Markdown is fine). The question must **ask you to explain**, not ask for a definition.

| ID | Unit | Question (explain) | Key points (max 3) | First | +1 | +3 | +7 | +30 | Wrong count |
|---|---|---|---|---|---|---|---|---|---|
| A-012 | 4 | Explain the difference between setup and hold time, drawing the timing diagram | Setup is the stable window before the clock edge, hold is the window after it, and violations are different failures | 11/13 | 11/14 | 11/16 | 11/20 | 12/13 | 1 |
| A-047 | 15 | With the pipeline diagram, explain why a load-use hazard needs one stall cycle | Data is only final at the end of MEM, so it cannot reach the start of EX in time | 12/09 | 12/10 | 12/12 | 12/16 | 01/08 | 0 |
| A-058 | 13 | Why is the B-type immediate 12 bits with an implicit zero LSB | Branch targets are 2-byte aligned and instructions are 4 bytes, which buys range | 01/27 | 01/28 | 01/30 | 02/03 | 02/26 | 0 |

**The interval starts from the day you reviewed, not the day you studied.** A wrong card returns the
next day and its +3/+7/+30 schedule is reset.

### 10.2 How to build the weekly test

- 45 minutes, six questions = **three on this week's topic + three from two to four weeks ago**. No notes.
- Record where each question came from (`W12: unit 15 x2, unit 13 x1 / 2-4 weeks back: unit 14 x2, unit 9 x1`).
- Mark on "**was the explanation valid**", not "was the number right". Equations without a diagram is half marks.
- Below 50%: remove one new item from the following week.

### 10.3 Blank-page recall (Friday, 30 minutes)

1. Pick one circuit from last week (e.g. FIFO).
2. Without the material, draw the block diagram and signals on paper (10 min).
3. Write the code on blank paper (15 min).
4. Diff against the original and write one line on **why you forgot it** (5 min).

### 10.4 Error log classification (four classes)

| Class | Example | Action |
|---|---|---|
| Knowledge gap | The definition of setup time was vague | Rebuild the card |
| Carelessness | Wrong bit width, mixing `<=` and `=` | Add it to the lint checklist |
| Design error | Missed hazard, reset not synchronised | Add it to the design review checklist |
| **Verification gap** | The test passed, but a path was never tested | Build a coverage metric (the class added in this revision) |

Once a month, spend 30 minutes looking only at "has the same kind of mistake appeared twice or more".

### 10.5 Where the review weeks sit

W9, W14, W19, W23, W29, W36. **Every four to five weeks**, stop new material and use the week for full
review, re-implementation and a 90-minute mock.

---

## 11. The artifact template (the same shape every time)

### 11.1 Repository layout

```
repo/
├── README.md              # English: purpose, structure, how to run, results, limitations
├── docs/
│   ├── spec.md            # spec, 1-2 pages
│   ├── verification.md    # test plan and results
│   ├── synthesis.md       # area, depth, constraints
│   ├── tradeoffs.md       # comparison tables and the reason for the choice
│   └── bugs.md            # bug tickets
├── rtl/                   # synthesisable files only
├── tb/                    # testbenches (not synthesised)
├── syn/                   # Yosys scripts and logs
├── sw/                    # test programs, expected-value models (Python allowed)
└── Makefile               # lint / sim / wave / syn / test
```

A single `make test` runs everything and prints `PASS n / FAIL m` at the end.

### 11.2 Spec template (headings)

1. Purpose (what it is for, who uses it)
2. Functional requirements (I/O, register map, instruction scope)
3. Non-functional requirements (target frequency, area budget, latency)
4. **Non-goals (what this version will not do)** <- the most important one
5. Assumptions and open questions
6. Verification approach (what counts as correct)

### 11.3 Bug ticket template

| Field | Content |
|---|---|
| Symptom | What happened (with reproduction steps) |
| Expected | What should have happened |
| Cause | Where in the code, and why |
| Fix | What was changed |
| Regression test | Name of the test added |
| Class | Design error / verification gap / carelessness |

### 11.4 Trade-off table template

| Option | Area (cells) | Logic depth | Rough fmax | Complexity (subjective 1-5) | Ease of verification |
|---|---|---|---|---|---|
| A: single-stage ALU | | | | | |
| B: split into two stages | | | | | |

Always add **the reason for the choice in English, 3-5 sentences**. Measure with Yosys, and write
"not measurable" for anything you cannot measure.

---

## 12. AI supervision protocol

### 12.1 Procedure (the same every time)

1. Prepare your own spec (fix the version).
2. **Implement it yourself first**, before looking at the AI's output.
3. Give the same spec to an AI and have it implement. Record the prompt too.
4. Run your own testbench against both.
5. Classify the differences (function, area, readability, unverified assumptions).
6. Write down **what you learned from the AI's output** and **what it failed to catch**.
7. Turn any bug found into a bug ticket.

### 12.2 Record table

| Date | Spec version | Target | AI output | My test result | Bugs found (kind) | What it missed | Verdict |
|---|---|---|---|---|---|---|---|

### 12.3 Rules

- Coursework follows **the course's own AI policy**. AI practice is limited to personal artifacts.
- To eliminate "the AI wrote it, so it is correct", **always judge with your own tests**.
- When accepting or rejecting an AI comment, leave one line of reasoning (the decision itself is the practice).

### 12.4 Report structure (W34)

1. Purpose and method (fixed spec, identical tests)
2. Designs covered (three or four)
3. Results: number and kinds of bugs found, and what you failed to catch
4. Discussion: where the AI was strong and weak (only where your tests support it)
5. Limitations: sample size, scale, what does not generalise

---

## 13. Transfer package

> The following is based on research as of **October 2026**. Re-check the official pages in
> **August 2027**, especially the TAG conditions, which are revised every August.

### 13.1 Key points by school

| University | Application | Verified requirements | Cost (international) |
|---|---|---|---|
| UC Davis (EE) | UC application 10/1-11/30, TAG 9/1-9/30 | Required: CHE 2A, ENG 17, EEC 7, MAT 21A/B/C/D, MAT 22A/B, PHY 9A/B/C/D. Letter grade C or better, completed by the end of spring (summer does not count). Minimum GPA 2.80. TAG needs 3.50 cumulative and major preparation; without TAG, 3.10 cumulative and 3.20 major preparation | Not confirmed |
| UC Berkeley (Engineering) | UC application | California community college students prioritised. Engineering minimum GPA 3.5. For 2022 transfers the middle 50% was 3.62-3.95, and 96.3% came from California community colleges | Not confirmed |
| Cornell (Engineering) | 3/15 (fall only) | Weighs course content, rigour and grades most. Four required subjects: two calculus courses, multivariable calculus, mechanics with lab, and general chemistry for engineers with lab. ECE also wants circuits or digital logic, programming, and two English composition courses. Admitted students generally have a 3.3+ college GPA | Not confirmed |
| Columbia (Engineering) | 3/1 (Coalition) | 24 credits required. Two letters from **college faculty** (research supervisors and employers do not count). A 400-600 word essay on why you are transferring. Minimum GPA 3.5; for engineering, 3.5 in maths and science strongly recommended. A plan to graduate in eight terms is assumed. Spring grades of the application year are normally not considered. Admit rate usually below 10% | Support for international students is "extremely limited" |
| Princeton | 3/1 | Actively welcomes community college students (26 in 2024). EE required courses not confirmed | Officially: aid is available to international students if need is demonstrated |
| Harvard / Yale / Brown / Dartmouth / Penn | Mostly 3/1; Penn 3/15 (third-party) | Admit rates: Harvard under 1%, Yale about 1-2%, Brown about 3.5-7.5%, Dartmouth about 5-7%, Penn about 3-5% (third-party aggregates) | Not confirmed |

**Credit treatment (corrected in v3)**: Cornell accepts **up to 66 credits including AP/IB** and requires
**at least 60 credits taken at Cornell**. **There is no official per-year cap** (the previous revision's
"33 credits per year" was wrong). The ECE degree is 126 credits, so 66 + 60 = 126 works out exactly in
four terms on paper (course sequencing can still extend it). Columbia allows up to 68 points (of which
up to 16 from standardised tests). The UC system has a **system-wide cap of 70 lower-division semester
units** (excess units can still satisfy subject requirements). **MOOCs carry no credit**, so self-study
of MIT 6.004 is only evidence of ability.

**UC general education (added in v3)**: UC requires the **seven-course pattern (two English composition,
one maths, four from arts/humanities, social sciences, or physical/biological sciences)**, and **IGETC is
not advised for engineering**. Berkeley Engineering does **not accept IGETC** as completing breadth
(Davis does not advise it for a B.S.; UCSC Baskin neither). **Do not chase IGETC; prioritise the
seven-course pattern plus major preparation.**

**English requirement (added in v3)**: UC waives TOEFL/IELTS if you take two transferable English
composition courses with C or better (B or better at UCLA/UCSD). **Cornell does not waive it: TOEFL 100 /
IELTS 7.5 / Duolingo 130 is required** (exemptions are limited to cases such as four years of
English-medium instruction). -> Sit it once in **August-September 2027**.

### 13.2 Grade targets

Aim for **3.8 or above** in both cumulative and major preparation, with **3.5 as the floor**. Columbia
does not look at the spring of the application year, so the grades that count are autumn 2026, spring
2027 and autumn 2027. Aim for A in maths (Cornell has had wording that does not accept maths transfer
credit below A- for MATH 1910/1920/2930/2940 equivalents; confirm the current version).

### 13.3 Extracurriculars (two hours a week or less, three or four activities)

| Period | Activity | Numbers to record |
|---|---|---|
| 2026-11 to 2027-01 | Survey clubs, tutoring and academic societies. Build relationships with faculty in office hours. Start publishing on GitHub | Candidate list, names of faculty visited and dates |
| 2027-02 to 04 | Approach research groups (three to five, with artifact links). Write a study-group proposal | Contacts made and replies, the proposal |
| 2027-05 to 08 | Study group once a month (introductory Verilog and digital circuits). Publish the pipelined CPU | Sessions held, attendance, published material |
| 2027-09 to 2028-02 | Continue the study group or tutoring. If involved in research, hours per week and output. Share progress with the two recommenders | Duration, number of sessions |
| 2028-02 to 03 | Write the Activities section in English (period, hours per week, output numbers) | English activity descriptions |

**Record format (one line every Sunday)**: `2027-05-15 / 2.0h / study group #1 (intro Verilog, 8 attending) / 12 slides published on GitHub`

### 13.4 Recommenders (two plus one backup)

- Candidates are faculty who taught you maths, physics or engineering. Columbia does not accept research
  supervisors or employers, so **secure course instructors**.
- Ask in December 2027 to January 2028. Give them: grades, artifact links, a one-page statement of purpose.
- Before finals, tell each one "what I put the most into in this course" once (it becomes letter material).

### 13.5 Essay material

| Target | Prompt | Material |
|---|---|---|
| Columbia | Why transfer (400-600 words) | What LMC gave you plus the environment you need next (research, facilities, peers), tied to the artifacts |
| Cornell | Your interests and their connection to Cornell Engineering (confirm the current prompt) | The pipelined CPU and its connection to ECE courses and labs |
| UC | Four PIQs | Origami creases and spatial constraints -> chip placement -> designing by deciding intent and verifying it |

**The common narrative**: "origami creases and spatial constraints" -> "chip placement and design" ->
"RTL design where you decide the intent and verify it". Never leave it abstract: back it with concrete
scenes containing dates and numbers.

---

## 14. Weekly and monthly checklists

### Sunday (15 minutes)

- [ ] Ran the weekly test and recorded the score and where the questions came from
- [ ] Classified this week's mistakes into the error log
- [ ] Checked which cards are due at +1, +3, +7 and +30 days
- [ ] Put next week's seven days on the calendar
- [ ] Wrote one line in the activity log

### End of month (30 minutes)

- [ ] Tidied the GitHub artifacts and added an English explanation of 3-5 sentences
- [ ] Checked whether the same kind of mistake appeared twice or more
- [ ] Calculated the plan completion rate (below 70% two weeks running -> cut 30% next month)
- [ ] Moved one transfer-related task forward
- [ ] Scheduled next month's "whole-picture day" (once a month)

### Quarterly (60 minutes)

- [ ] Checked the gate dates and applied the branch rule if one was missed
- [ ] Sampled 20 job postings to see how the required skills are shifting (every November is mandatory)
- [ ] Updated tool versions and corrected `notes/env.md`

---

## 15. Risks and responses

| Risk | Signal | Response |
|---|---|---|
| Grades drop | B or below at midterm | Cut technical study to 8 h/week and push one gate back that term. **GPA is the premise of transfer** |
| Transfer does not happen | April 2028 results | Re-plan: stay at LMC for a third year, or go to a CSU, or apply again the following year. Do not let one rejection end the plan |
| Extracurriculars get heavy | More than two hours a week | Drop one activity. Depth over count |
| Health or family | Two consecutive weeks missed | Prioritise **not stopping**: drop to light mode (8 h/week) |
| Tiny Tapeout cost or deadline | The official deadline does not fit | Prices are published (**1 tile €70 + DevKit €300 + shipping €15 = €385**). Shuttles run every two to three months, with **March 2027 (TTIHP27a) and April 2027 (TTGF27a)** as candidates. Budget €400; if it does not fit, the artifact becomes the GDS plus the published design |
| **Not enough funding** | Admitted but cannot attend | **The largest risk.** UC gives no need-based aid to international students (about 27.4 million yen for two years at Davis). Cornell meets 100% of need if the aid application is filed by 3/15. **Fix the funding plan in December 2026** to prevent "admitted but unable to go" (see `transfer-strategy-v3.md` section 4) |
| **A required course is missing** | No LMC equivalent of PHY 9D (waves and quantum) | TAG major preparation stays incomplete and the safety net disappears. **Check ASSIST in December 2026** and take it at a neighbouring community college if absent |
| **Graduation slips past June 2030** | Five terms turn out to be needed after transfer | Only about 60% of UC transfers graduate within two years. **Make December 2030 / June 2031 an explicit buffer** and confirm the four-term finish in the autumn 2028 degree audit |

---

## 16. Unconfirmed items (with the date to confirm)

| # | Item | When | Where |
|---|---|---|---|
| 1 | LMC term dates (midterm and final weeks) | November 2026 | Syllabus |
| 2 | Articulation of LMC courses to each school's requirements (ASSIST) | December 2026 | ASSIST, counsellor |
| 3 | TAG conditions for Fall 2028 entry | August 2027 | UC official TAG pages |
| 4 | Application dates for Fall 2028 at each school | August 2027 | Each school's site |
| 5 | Cornell's current maths credit conditions (A- or better) | August 2027 | Cornell official |
| 6 | Columbia / Princeton current prompts and letter requirements | October 2027 | Each school's site |
| 7 | Tiny Tapeout 2027 deadlines and prices | May 2027 (W24) and W35 | Official price calculator |
| 8 | Source and licence of public RISC-V test programs | June 2027 (before W31) | riscv-tests etc. |
| 9 | Degree requirement in new-graduate RTL postings (master's or not) | Every November, especially December 2028 | Company career pages |
| 10 | Japanese recruiting schedule for 2030 graduates (when publicity and selection open) | January 2029 | Job sites, university career centre |
| 11 | Work authorisation if working in the US (OPT/STEM OPT, H-1B) | December 2028 | University International Office |
| 12 | Summer 2029 internship application timing (US and Japan) | August 2028 | Company sites, career centre |
| 13 | What financial support for international students actually exists (by school) | August 2027 to February 2028 | Each school's financial aid office |
| 14 | Whether LMC has clubs and tutoring schemes | December 2026 | Student services |

---

## 17. References (basis for the assumptions)

- MIT 6.004 Computation Structures (Spring 2017), unit list: unit 14 = Caches and the Memory Hierarchy,
  unit 15 = Pipelining the Beta, unit 16 = Virtual Memory, unit 18 = Devices and Interrupts,
  unit 19 = Concurrency and Synchronization. <https://ocw.mit.edu/courses/6-004-computation-structures-spring-2017/resources/6/>
- The same course's calendar (unit order and quiz placement): <https://ocw.mit.edu/courses/6-004-computation-structures-spring-2017/pages/calendar/>
- Unit 15 lecture slides (Pipelining the Beta, three data-hazard strategies): <https://computationstructures.org/videos/pipelined_beta/lecture.pdf>
- Transfer requirements and dates: carried over from the previous revision (research of 2026-10-28).
  **Re-confirm officially in August 2027.**

---

## Appendix: what to finish this month (2026-11-12 to 12-06)

| Week | The only things that must be done |
|---|---|
| W1 (11/12-11/15) | Environment and repository conventions, blank-page summary of units 1-7, the four-part adder set |
| W2 (11/16-11/22) | 25 combinational problems, Sunday's 30-minute test |
| W3 (11/23-11/29) | 15 sequential problems, 2 FSMs, **11/29 diagnostic mock #1** |
| W4 (11/30-12/06) | 8-bit ALU from spec to publication, one trade-off template built |

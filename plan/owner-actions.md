# Owner actions - everything only you can do (2026-11-17)

Anything not on this list is either already written or can be done without you. This page is the
handover: **no item here can be delegated to me**, because each one needs a login, a payment, a
signature, your voice, or your own machine.

Legend: **[B]** = blocking (something else cannot start until this is done) / **[D]** = has a hard date

---

## A. Today to 11/24 - the irreversible week [B][D]

| # | What | When | Why it cannot wait | Done when |
|---|---|---|---|---|
| A1 | **`git pull` the new bundle** on your PC | today | Everything I wrote (registration one-pager, roster of communities, the English roadmap) exists only in this workspace until you pull | `git log --oneline -1` shows `91868c1` or later |
| A2 | **Read `plan/registration-day-2026-11-24.md` and pick your GE from the Friday list** | by 11/23 | The GE is the only slot that works in every CHEM branch, so it must be decided before, not during | One GE CRN written on the printout |
| A3 | **Print the one-pager and write your appointment time on it** | 11/23 | It is built to be followed top to bottom | Paper in hand |
| A4 | **InSite: check seats, waitlist counts and the 4-digit CRNs** for MATH 220 / CHEM 006 / ENGL C1000 / COMSC 122 / your GE | 11/23, evening | Group 3b day 1 has already run by then, so this is the real remaining inventory. I cannot log in | A list of CRNs and "open / full / waitlist n" |
| A5 | **Register at 08:00 on 11/24**, in this order: MATH 220 7411 -> CHEM 006 0052 (tree 0052/1789/9524/1784) -> ENGL -> COMSC 122 6944 -> Friday GE | 11/24 | Sections fill between groups; your group is the largest and last of the priority tiers | 17 units registered |
| A6 | **Post-registration checks**: 17 units / 14+ in person / exactly one online / CHEM 006 not 025 | 11/24 | A quiet mistake here costs a term | Four boxes ticked |
| A7 | **Screenshot the ASSIST "EEC 007 / PHY 009D: No Course Articulated" page** | 11/24 | This is the evidence for the Davis waiver; the ASSIST display changes by year | PNG saved |
| A8 | **Screenshot the final schedule**; save CRNs; screenshot any waitlist position | 11/24 | Needed for the waiver mail and for the counselor meeting | Saved |
| A9 | **Log it**: `python3 tools/daily.py log "registration: ..."` | 11/24 | The plan only knows what is logged | Log entry exists |
| A10 | **Put the Summer 2027 CHEM 025 reminder in your phone** (June, 6 weeks) | 11/24 | Summer registration opens while you are not thinking about it | Calendar entry |

## B. Rest of November to December

| # | What | Deadline | Notes |
|---|---|---|---|
| B1 | **Send the Davis waiver email** and ask, in the same mail, whether Summer 2027 CHEM 025 counts toward TAG | 11/30 | Written answer needed by June 2027; the reply takes weeks. Draft the text and I will review it |
| B2 | **Email Melissa Pon (LMC STEM counselor)**: the four questions below | 11/30 | One mail, four questions - it saves three separate trips |
| B3 | **UC Davis AvenueE**: Interest Form, then UC TAP with the AvenueE box ticked, then the district liaison mail, then the **scholar award application** | December | `plan/avenuee-interest-form.md` has every draft. The award is money, not a formality |
| B4 | **Register for GhostGate and AI-HDL** (individual tracks) | **12/18** | 20 minutes. Both are free and both are individual-eligible |
| B5 | **Import `cards/deck.tsv` into Anki** | December | 21 cards; only you can import into your own deck |
| B6 | **Verify your PC runs the winter stack**: WSL2 or OSS CAD Suite, Docker, **16 GB RAM**, and room for an OpenLane PDK (tens of GB) | before 12/21 | The whole winter block assumes this. If it fails, decide the alternative *before* the break, not during it |
| B7 | **Publish `rtl-journey`**: fill the licence name, the handle, paste the real `ALL PASS (512/512)`, push, confirm CI is green | before 12/21 | `plan/rtl-journey-publish.md`. This is the only checkable claim in the OS3 mail |
| B8 | **Send the OS3 message** (web form, Subject: Other) - one time only | after 12/21 | `plan/os3-outreach.md` |
| B9 | **Write the funding plan on one page** (family conversation included) | December | The "admitted but cannot afford it" risk is the largest one in the plan |
| B10 | **Record final grades** (LMC finals around 12/11) and check the GPA line | by 12/20 | If the GPA slips, the winter hours are what gets cut, not the GPA |
| B11 | **Push `study-plan` to GitHub** | whenever | I cannot push: no token is injected into this workspace. Bundle -> pull -> push on your side |

**The four questions for Melissa Pon (mpon@losmedanos.edu, SS4-421, 925-473-7464):**

1. MESA applications reopen in April 2027 - is there anything I should do before then to be ready?
2. Is the Transfer Academy still accepting students this term, and can it coexist with a 17-unit spring?
3. Are the Math Lab / Center for Academic Support tutoring positions open, and what is the hiring path?
4. When do UC Davis representatives next visit the Transfer Center, and can I book a slot?

## C. Every week and every day (the routine only you can run)

| Cadence | What | Command or place |
|---|---|---|
| Every morning | Get the day's three items and do them | `python3 tools/daily.py today` |
| Every day | Compile and simulate on **your** PC - this VM has no iverilog, verilator or yosys | `make sim TOP=<module>` |
| Every day | One line about what actually happened | `python3 tools/daily.py log "..."` |
| Sunday, 15 min | Weekly test (45 min is the plan; 15 if the week was bad), error log, card intervals, next week on the calendar, one activity-log line | `rtl-roadmap-2026-11-12.md` section 14 |
| Sunday | Move one transfer-related task forward | see section B |
| Month end, 30 min | Tidy GitHub artifacts, check for repeat mistakes, completion rate, one whole-picture day | roadmap section 14 |
| Every term | Confirm the next term's registration group and date in InSite | - |

## D. Fixed dates in 2027 (put these in the phone now)

| Date | What | Source |
|---|---|---|
| 1/10 | **DECISION A**: clean GDS or SMACD moves to 2028 | `plan/competition-plan-2027.md` |
| 1/14 - 4/29 | AI-HDL league (only if registered) | competition plan |
| 1/28 | MCM/ICM (needs a team and an advisor - only if you want it) | competition plan |
| **2/19** | **SMACD paper + repository** | competition plan |
| 3/8 | GhostGate shortlist announced - decides whether G4 moves | competition plan |
| 3/16 | GSoC proposal window (2027 dates not yet published) | competition plan |
| 4/4 | GhostGate finals window opens | competition plan |
| 4/18 | G5 | roadmap |
| Aug-Sep 2027 | **TOEFL/IELTS** (Cornell needs 100 / 7.5; UC does not) | roadmap section 13 |
| 9/1-9/30 2027 | TAG application (Davis only) | roadmap section 7 |
| 10/1-11/30 2027 | UC application | roadmap section 7 |

## E. What I genuinely cannot do, so stop waiting on it

| Limitation | Consequence |
|---|---|
| No InSite / ASSIST / UC TAP login | Seat counts, articulation checks and applications are yours |
| No `git push` (no token in this workspace) | Bundle -> `git pull` -> push on your PC |
| No iverilog, verilator, yosys, OpenLane, and no root | Every simulation and synthesis runs on your PC |
| No payments | Tiny Tapeout EUR 385, application fees, tuition deposits |
| No email, forms or phone | Davis waiver, AvenueE, OS3, competition registrations, LMC counselor |

---

## The one-line version

**This week**: pull, decide the GE, print, check seats on 11/23, register at 08:00 on 11/24, screenshot
everything. **By 12/18**: GhostGate + AI-HDL, publish `rtl-journey`, verify the winter machine can run
OpenLane. **By 12/31**: Davis waiver mail, AvenueE set, funding page, grades recorded.

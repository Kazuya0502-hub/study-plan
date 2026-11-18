# Runbook: every step, in order (2026-11-17)

One step = one action. Each step says what you should see. If you do not see it, the "if not" line tells
you what to do instead. **Do not skip forward**; the steps are ordered so a failure is cheap.

If a label in InSite differs from what is written here, use whatever your portal calls it - the order
of the steps still holds.

---

## Phase 0 - Today, 10 minutes: get the files onto your PC

| # | Do this | You should see | If not |
|---|---|---|---|
| 0.1 | Open a terminal on your PC and `cd` into your `study-plan` clone | `pwd` prints the folder | If the folder is gone, re-clone from your own GitHub repo first |
| 0.2 | `git status` | "nothing to commit, working tree clean" | If files are modified, `git stash` first; do not lose local edits |
| 0.3 | Put the new `study-plan.bundle` where you can reach it, then `git pull /path/to/study-plan.bundle main` | "Fast-forward" and a list of changed files | If it says "already up to date", you pulled an old bundle - re-download |
| 0.4 | `ls plan/` | `registration-day-2026-11-24.md`, `runbook.md`, `owner-actions.md`, `avenuee-interest-form.md`, `os3-outreach.md`, `rtl-journey-publish.md` | Wrong bundle |
| 0.5 | `git log --oneline -3` | The newest commit is `98882f5` or later | Old bundle |
| 0.6 | Print `plan/registration-day-2026-11-24.md` (one page, portrait) | One sheet of paper | Print at 90% scale if it spills onto two pages |

---

## Phase 1 - 11/23 (Mon) evening, 25 minutes: the seat check

This is the only information that changes the plan, and only you can see it.

| # | Do this | You should see | If not |
|---|---|---|---|
| 1.1 | Open InSite in a browser and sign in | The student home page | Password reset takes time - do it now, not on 11/24 |
| 1.2 | Open the class search (Search for Classes / Register for Classes -> search) | A term selector | If the term defaults to Fall 2026, switch it to **Spring 2027** |
| 1.3 | Search `MATH 220`. For **7411** write down: status, seats left, waitlist count | Numbers in the margin of the printout | If 7411 is not listed, it was cancelled - move to 7011 |
| 1.4 | Same for **CHEM 006** in this order: **0052**, **7480**, **9524**, **1784**, **9542**, **7479** (there is no 1789 - it does not exist) | Six lines of numbers | Any section missing = cancelled, cross it out |
| 1.5 | Same for **ENGL C1000 0312**, **9611**, **0180** | Three lines | - |
| 1.6 | Same for **COMSC 122 6944**, and **6940** as backup | Two lines | If 6944 is not "online", tell me - the F-1 count changes |
| 1.7 | Search your chosen GE on the Friday list: **9579**, **0716**, **0132**, **0034** | Which ones are open | If all four are closed, search GE courses with `F` (Friday) and take the first 3-unit UC-transferable one |
| 1.8 | Write at the top of the printout: date, time, and the single GE CRN you will take | One CRN circled | - |
| 1.9 | Photograph the printout (in case you lose it) | Photo in your phone | - |

**Decision rule for 1.7**: prefer 9579 (Brentwood, 08:00-11:10) because your Friday is otherwise empty.
Any Friday-only, in-person, 3+ unit, UC-transferable section is equally acceptable.

---

## Phase 2 - 11/23 (Mon) evening, 10 minutes: pre-decide the branches

| # | Do this | You should see |
|---|---|---|
| 2.1 | On the printout, mark the CHEM branch you expect (0052 is first choice) | One branch circled |
| 2.2 | Read the ENGL column of that branch and circle that ENGL CRN | One ENGL CRN circled |
| 2.3 | Circle the GE CRN from step 1.8 | One GE CRN circled |
| 2.4 | Write the order at the top: `1 MATH 7411 -> 2 CHEM 0052 -> 3 ENGL 0312 -> 4 COMSC 6944 -> 5 GE 9579` | Five numbers in order |
| 2.5 | Set an alarm for 07:45 on 11/24 and put the printout next to the keyboard | Alarm set |

---

## Phase 3 - 11/24 (Tue) 08:00: registration, screen by screen

**Golden rule**: if a section is full, do not stop to think. Go to the next line of that row and continue.

| # | Do this | You should see | If not |
|---|---|---|---|
| 3.1 | Sign in to InSite (already signed in is better) | Home page | Slow login at 08:00 is normal; do not reload repeatedly |
| 3.2 | Open registration and add **MATH 220 7411** by CRN | "Added" or a green check | Full: add **7011**. Full too: **9605**, then **9575**. Never **7407** (online) |
| 3.3 | Add **CHEM 006 0052** | Added | Full: **7480**, then **9524**, then **1784**, then **9542**, then **7479**, then the extras. **Remember which row you landed in - it decides steps 3.4 and 3.5** |
| 3.4 | Add the ENGL CRN **for your row**: 0052 / 7480 / 1784 / 7479 -> **0312**; 9524 -> **9611**; 9542 -> **0180** | Added | Full: search ENGL C1000 and pick any section clear of TTh 09:35-11:25 and of your CHEM block. Confirm the title on screen |
| 3.5 | Add **COMSC 122**: **6940 (asynchronous) if your CHEM is 0052 or 9702**, otherwise **6944** | Added | **Never both.** 0052 meets T 12:45-14:10 and 6944 meets TTh 12:45-14:10 - they collide. Full: the other one |
| 3.6 | Add the GE CRN from step 1.8 | Added | Full: another Friday-only 3-unit section. Not a TTh 14:20+ one if you are in branch 1 |
| 3.7 | Open your schedule view | Five courses, **17 units** | If it says 14 or 16, a course did not add - check the list |
| 3.8 | Check each meeting time against the printout | No overlap warnings | Any clash means a wrong branch - drop the ENGL and use the branch's ENGL |
| 3.9 | **Screenshot the schedule** (full week view, times visible) | PNG saved | - |
| 3.10 | If any course is waitlisted: open it and screenshot the position number | PNG saved | - |

**If CHEM 006 is completely unavailable**: do not take a placeholder course. Register the other four,
then join the waitlist for the first two open-looking sections, and email the instructors the same day. Bring it to me and we
change the summer chain.

---

## Phase 4 - 11/24, after registering, 20 minutes

| # | Do this | You should see |
|---|---|---|
| 4.1 | Tick the four checks on the printout: 17 units / 14+ in person / exactly one online / CHEM 006 not 025 | Four ticks |
| 4.2 | Open ASSIST (assist.org), select LMC -> UC Davis, and find **EEC 007** and **PHY 009D** | "No Course Articulated" rows |
| 4.3 | Screenshot each row **including the year selector** in the image | Two PNGs |
| 4.4 | Save them where you keep transfer documents (not on the Desktop) | Files exist |
| 4.5 | Add the Summer 2027 CHEM 025 reminder to your phone: June, repeating weekly for 6 weeks | Three reminder entries |
| 4.6 | Run `python3 tools/daily.py log "registration: <what you actually got>"` | Log entry saved |
| 4.7 | Tell me what you actually got (CRNs and any waitlist) | - |

---

## Phase 5 - by 11/30: two emails

**5A. The Davis waiver email** (draft it, send, keep the reply)

| # | Do this |
|---|---|
| 5.1 | Write to the Transfer Opportunity Program (top-soa@ucdavis.edu; phone 530-752-2971 if no reply in a week) |
| 5.2 | Ask two things only: (a) confirm in writing that a required major course with "no course articulated" at my CCC is waived for TAG, attaching the ASSIST screenshots; (b) does a Summer 2027 CHEM 025 count toward the TAG requirements? |
| 5.3 | Keep the reply as a PDF in the same folder as the screenshots |
| 5.4 | If the answer is "no" on (a), tell me - the Davis-only strategy changes |

**5B. The LMC counselor email** (Melissa Pon, mpon@losmedanos.edu)

| # | Do this |
|---|---|
| 5.5 | One email, four questions: MESA readiness before April 2027; Transfer Academy availability this term; tutoring hiring path; the date UC Davis representatives next visit |
| 5.6 | Ask for a 30-minute appointment and offer two time windows |

---

## Phase 6 - December: AvenueE, five steps in order

| # | Do this | Note |
|---|---|---|
| 6.1 | Submit the AvenueE Interest Form using the drafts in `plan/avenuee-interest-form.md` | Screenshot the confirmation |
| 6.2 | Create UC TAP, then About me -> Support program involvement -> tick **AvenueE** | Easy to forget; this is a separate step |
| 6.3 | Ask your counselor to review a Comprehensive Educational Plan (bring `master-course-plan.md`) | Required step 3 |
| 6.4 | Email the **Contra Costa district liaison** (template in the same file) | Includes the F-1 question |
| 6.5 | Submit the **community college scholar award** application | This is money, not a formality |

---

## Phase 7 - by 12/21: publish `rtl-journey` (details in `plan/rtl-journey-publish.md`)

| # | Do this | You should see |
|---|---|---|
| 7.1 | Replace `<your name>` in `rtl-journey/LICENSE` line 3 | Your name |
| 7.2 | Replace `<your-handle>` in `rtl-journey/README.md` | Your GitHub user |
| 7.3 | Run `make sim TOP=adder4` (or the PowerShell equivalent) | `ALL PASS (512/512)` |
| 7.4 | Paste that terminal output into the README block and change the caption to date + OS + iverilog version | No "expected output" wording left |
| 7.5 | `git subtree split --prefix=rtl-journey -b rtl-journey-export` | A new branch |
| 7.6 | Create an **empty** GitHub repo `rtl-journey` (no README, no licence) | Empty repo page |
| 7.7 | `git push git@github.com:<handle>/rtl-journey.git rtl-journey-export:main` then `git branch -D rtl-journey-export` | Push succeeded |
| 7.8 | Wait for the Actions run | Green check |
| 7.9 | `git clone` it somewhere else and run `make sim TOP=adder4` | Passes from a fresh clone |

**If 7.3 fails**: fix the RTL or the testbench first. Do not publish a claim that does not reproduce.

---

## Phase 8 - by 12/18: two competition registrations (20 minutes total)

| # | Do this |
|---|---|
| 8.1 | Register for **GhostGate** (individual track) and save the confirmation |
| 8.2 | Register for **AI-HDL**, note that it is a 3-5 person team league, and decide later whether to play |
| 8.3 | Put both deadlines in the phone: practice material 1/8, shortlist 3/8, league 1/14-4/29 |
| 8.4 | `python3 tools/daily.py log "competitions: GhostGate + AI-HDL registered"` |

---

## Phase 9 - by 12/21: confirm the winter machine, 30 minutes

| # | Do this | You should see |
|---|---|---|
| 9.1 | Check RAM: Task Manager -> Performance | 16 GB or more. Below that, OpenLane will crawl |
| 9.2 | Check free disk space on the drive you will use | 100 GB+ free |
| 9.3 | Install Docker Desktop (with WSL2 backend) and run `docker run hello-world` | The hello message |
| 9.4 | If you prefer no Docker: install OSS CAD Suite and run `yosys -V` | A version string |
| 9.5 | Run `iverilog -V`, `verilator --version` | Two version strings |
| 9.6 | Write all versions into `notes/env.md` | File updated |
| 9.7 | If 9.1 or 9.2 fails, tell me now - the winter plan changes |

---

## Phase 10 - December: three small tasks

| # | Do this |
|---|---|
| 10.1 | Import `cards/deck.tsv` into Anki (tab-separated: front, back, tags) and review 21 cards once |
| 10.2 | Write the funding page: cost per school, what the family can cover, what is missing, the one decision needed |
| 10.3 | After finals (~12/11), record the grades and check the GPA against the 3.5 floor |

---

## Phase 11 - the daily loop (this repeats; do not plan it again)

1. `python3 tools/daily.py today` - read the three items.
2. Do the `must` item first.
3. Compile and simulate **on your PC**.
4. `python3 tools/daily.py log "<what actually happened>"`.
5. On Sunday: weekly test, error log, cards, next week on the calendar, one activity-log line.

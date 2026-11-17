# UC Davis AvenueE - Interest Form pack (2026-11-17)

**Why this matters**: AvenueE is the only UC Davis engineering program whose own instructions name the **Contra Costa district** (LMC's district) as eligible *while you are still at community college*. It is a Davis engineering support program, a scholarship, and a named staff contact, reachable now - two years before transfer.

**Verified steps** (avenuee.engineering.ucdavis.edu/students):

| Step | Action | Where |
|---|---|---|
| 1 | Submit the **AvenueE Interest Form** (this document drafts it) | <https://avenuee.engineering.ucdavis.edu/apply/community-college-student> |
| 2 | Create **UC TAP**, then tick **AvenueE** under About me -> Support program involvement -> "UC Davis Transfer Prep Programs" | <https://uctap.universityofcalifornia.edu/students/> |
| 3 | Develop a **Comprehensive Educational Plan** with an LMC counselor (use `master-course-plan.md`) | LMC Transfer Center |
| 4 | Contact the **Contra Costa district liaison** for AvenueE | <https://avenuee.engineering.ucdavis.edu/contact-us> |
| 5 | Submit the **AvenueE community college scholar award application** | <https://ucdavis.co1.qualtrics.com/jfe/form/SV_1L0Beo3inmEeVv0> |

Questions: avenuee@ucdavis.edu

**Eligibility** (must be a first-time enrollee in the College of Engineering for the fall term, plus at least one of):
first-generation / EOP / low-income / prior involvement in a UC-recognised prep program (MESA, TOP, CAMP, Upward Bound, Puente, Umoja) / demonstrated leadership or a commitment to expanding access in engineering.

**Which criterion to claim**: check the box(es) that are actually true for you. If you join MESA in April 2027 (applications open then), "prior involvement in MESA" becomes true and is the strongest single line you can have. Do not claim one you cannot document.

---

## Draft answers

Fill the blanks in angle brackets. Keep every answer under 120 words unless the form allows more.

### 1. Academic goal / intended major

> Electrical Engineering, B.S., UC Davis, Fall 2028. My target is RTL design: digital logic, computer architecture, and the ASIC flow from RTL through synthesis, place and route, and timing closure.

### 2. Where you are now

> I am a continuing student at Los Medanos College (Contra Costa Community College District) in my second year, carrying 13 units this term. My transfer plan is four terms at LMC: Spring 2027, Summer 2027, Fall 2027, and Spring 2028, totalling 69 semester units, with the UC Davis TAG as the primary route and UC Transfer Admission Planner already in use for tracking.

### 3. Why AvenueE

> I am applying because the part of this path I cannot build alone is the transition itself: knowing which lower-division engineering courses to sequence, how to enter undergraduate research, and how to turn a community college record into a competitive engineering application. AvenueE's early-community-college track, Transfer Bridge, and peer network are exactly the structure I am missing, and I would use them from the first quarter rather than after arrival.

### 4. Leadership / expanding access (pick one and make it concrete)

> <Option A - tutoring> I want to become a peer tutor in LMC's Math Lab or Center for Academic Support, where tutors are recommended by faculty. Transfer students in calculus and chemistry sequences at LMC are often one bad week from dropping; a tutor who took the same sequence at the same college is the cheapest intervention available.
>
> <Option B - hardware club> I am building an open-source hardware practice at LMC: a small Verilog repository with a testbench per module, published openly, so that the next student does not start from zero. My goal is to leave behind a documented path from "no digital logic" to a first chip submission, and to hand it to the Brentwood Engineering Club.

### 5. First-generation / EOP / low-income / prep program

> <state only what is true; e.g. "I am a first-generation college student." / "I am an F-1 international student supporting myself; I am not eligible for federal aid.">

**Note for an F-1 student**: eligibility wording says "first-time enrollees in the College of Engineering" and "low-income background" - it does not require federal aid eligibility. If a field asks about FAFSA/CADAA, answer accurately; do not skip the form because of it. Ask avenuee@ucdavis.edu directly: *"I am an F-1 student at a California community college. Am I eligible for the community college scholar award, and which criterion should I document?"*

### 6. Intended transfer term and courses in progress

> Fall 2028. Spring 2027: MATH 220 (Calculus II), CHEM 006, ENGL C1000, COMSC 122, and one general education course - 17 units, 14 of them in person, which satisfies the F-1 in-person requirement.

### 7. Anything else (150 words maximum)

> I am optimizing for one outcome: graduating in June 2030 with an RTL design offer, which means arriving at Davis with the lower-division sequence genuinely finished rather than mostly finished. My plan puts PHYS 041 and PHYS 042 in Spring 2028 and nothing else heavy, because that term is where transfer students usually lose their GPA. Outside class I am working toward two solo, publicly verifiable hardware submissions in 2027 - a FIFO/UART design carried through an open-source synthesis flow to a clean GDS, and a Tiny Tapeout fabrication slot - because a repository with a passing testbench is the only evidence of RTL ability I can produce before I have a research position. What I want from AvenueE is the sequencing advice and the peer network that make the first Davis quarter a continuation instead of a restart.

---

## Email to the Contra Costa district liaison (Step 4)

**Subject**: Los Medanos College student - AvenueE Interest Form submitted (Fall 2028 transfer)

> Hello,
>
> I am a continuing student at Los Medanos College in the Contra Costa district, planning to transfer to UC Davis Electrical Engineering in Fall 2028. I have submitted the AvenueE Interest Form and created my UC TAP account with AvenueE selected under support program involvement.
>
> Two questions:
> 1. Is there a Comprehensive Educational Plan review I should schedule now, or after my Spring 2027 registration on 11/24?
> 2. I am an F-1 student. Does that affect eligibility for the community college scholar award, and is there anything I should document differently?
>
> My planned course sequence is four terms, 69 units, with PHYS 041 and PHYS 042 in Spring 2028. I can send it as a one-page table if that helps.
>
> Thank you,
> <name> | LMC ID <number> | <email>

---

## What to check before sending

- [ ] Interest Form actually submitted (screenshot the confirmation)
- [ ] UC TAP created **and** the AvenueE box ticked (this is a separate step and easy to miss)
- [ ] District liaison emailed
- [ ] Scholar award application submitted - **this is money, not just a form**
- [ ] Log it: `python3 tools/daily.py log "AvenueE: form + TAP + liaison email sent"`

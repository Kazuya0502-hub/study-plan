# OS3 (Open Source Silicon @ Stanford) - outreach (2026-11-17, rev 4)

**Site facts** (checked 2026-11-17): Join form asks Name / Email / Year (…/Other) / "core project?" Yes-No / subteams (Digital, Analog, Physical Design, Board Level, Software, PM). Contact form asks Name / Email / Subject (**Sponsorship** or **Other**) / Message. **No email address is published** (`Email: coming soon...`); the only channels are the **web form** and **LinkedIn** (<https://www.linkedin.com/company/open-source-silicon-stanford/>). Slack is Stanford-workspace only. Their wording ties membership to Stanford students. 20 members, 6 subteams, 2 ongoing projects, all projects published.

**Purpose**: state the materials and the level precisely, then say plainly that you want to be part of the community and take part in what it does - and make a no cheap for them.

---

## A. Message for the contact form (Subject: Other)

> **Subject: A student outside Stanford - may I join your community and help with a project?**
>
> Hello OS3,
>
> I am a Japanese student studying electrical engineering at Los Medanos College in the East Bay. I came to California on a homestay because I wanted to learn this subject where the industry actually is - the companies I am aiming at are Intel and AMD - rather than from a distance.
>
> I have been teaching myself from MIT 6.004 (Computation Structures), which I have taken through unit 14, caches; unit 15, pipelining, is next. I have also worked through HDLBits end to end. What that has produced so far is a 4-bit ripple-carry adder of my own, built structurally with no `+` operator, verified by a self-checking testbench that sweeps all 512 combinations of `a`, `b` and `cin`. I work in Icarus Verilog and Verilator, and I am learning to read Yosys synthesis output. My current project is an 8-bit ALU; over the winter break I am taking a FIFO and then a UART through an open-source flow to a clean GDS for a Tiny Tapeout submission.
>
> What I do not have is people. Most of my studying happens alone, and that is where it stops: finishing HDLBits taught me the syntax, but it did not teach me what a real project looks like from the inside - how a design is decided, reviewed, and thrown away.
>
> That is what I am asking for. I would like to join your community and take part in its activities: attend whatever is open, take a small piece of a real project, and be corrected when I am wrong. I know I am not a Stanford student and that this may simply not be possible - I am asking directly rather than assuming either answer.
>
> If there is a way in - a public channel to follow, issues or pull requests I could send on your published repositories, or any external track - I would take it seriously. And if the answer is that participation is Stanford-only, that is a fine answer; I would still be glad to know what you are building.
>
> Thank you for reading.
>
> <name> | <email> | github.com/<handle>

## A2. Short version (~180 words)

> Hello OS3,
>
> I am a Japanese student studying electrical engineering at Los Medanos College in the East Bay. I came to California on a homestay to learn this near where the industry is - I am aiming at Intel and AMD - but I have no connections here, and most of my studying happens alone.
>
> I study from MIT 6.004 (through unit 14, caches; pipelining is next) and I have worked through HDLBits end to end. On my own I have built a 4-bit ripple-carry adder with no `+` operator, verified against all 512 combinations, and I am now building an 8-bit ALU. Over the winter break I am taking a FIFO and a UART to a clean GDS for Tiny Tapeout.
>
> What I am missing is the part you cannot get from exercises: I would like to join your community and take part in a real project - attend what is open, take a small piece of work, and be corrected. I am not a Stanford student, so this may not be possible; I would rather ask than assume.
>
> <name> | <email> | github.com/<handle>

## B. LinkedIn message (~120 words)

> Hi - I am a Japanese student studying electrical engineering at Los Medanos College in the East Bay. I came here on a homestay to be near the industry (I am aiming at Intel and AMD), but I have no connections here. I study from MIT 6.004 and I have worked through HDLBits end to end; I have built a 4-bit adder verified over all 512 combinations, and I am taking a FIFO/UART design to GDS for Tiny Tapeout this winter. I am not at Stanford, but I would like to join the OS3 community and take part in a real project. Is there a way in - a public channel, or issues and pull requests on your published repos? Either answer helps. Thanks.

---

## C. The skills inventory behind those paragraphs

Update monthly; this is what the message is built from, and it is also what you paste into the Join form or a README.

| Area | **Now** | Evidence | **Next** (with date) |
|---|---|---|---|
| Materials worked through | **MIT 6.004 units 1-14** (unit 15, pipelining, is W5/W7 - not yet); **HDLBits end to end** | Cards and notes in `notes/`; HDLBits solutions | Unit 15 (W5, W7); units 16-19 as an overview (W9) |
| Verilog RTL | Combinational modules with a self-checking testbench each; 4-bit ripple-carry adder passing **512/512** exhaustive vectors | `rtl-journey/rtl/adder4.v` + `tb/tb_adder4.v` | 8-bit ALU (W4, 12/6), FSM, FIFO (W5-W7) |
| Digital logic theory | Number systems, combinational and sequential basics, performance measures, ISA, the Beta, caches | 6.004 units 1-14; diagnostic 33/50 on units 8-14 | Close the bit-budget gap (W4); unit 15 properly |
| Verification | Hand-written self-checking testbenches; no cocotb, no formal yet | same repo | cocotb and SymbiYosys via the GhostGate image (winter) |
| EDA tools | Icarus Verilog and Verilator locally, `make`, git | `Makefile`, commit history, GitHub Actions | **OpenLane over the winter break**, reading timing and area reports |
| Physical design | **None** | - | FIFO to GDS, clean DRC and LVS (**by 1/10**) |
| Programming | **No formal course yet** | - | COMSC 122, Spring 2027 |
| Public work | One small public repo, no submissions yet | `rtl-journey` | Tiny Tapeout submission, SMACD paper (2/19) |

**How to use it**: name the materials (they are a shared yardstick, so a reader can place you instantly), then **one** artifact with a number, then **one** real gap. HDLBits does the placing; the 512-vector testbench does the proving; the gap makes both believable.

---

## D. Why it is written this way

- **Materials are named because they are shared reference points.** "MIT 6.004 through unit 14" and "HDLBits end to end" let a Stanford reader calibrate you in one second - they know exactly what those cover and what they do not. That is worth more than any adjective about passion.
- **The claims must match the roadmap exactly**: units **1-14** (unit 15 is scheduled for W5/W7), HDLBits **complete**. Never write "through unit 15" - it is a claim the plan contradicts, and it would be the first thing a hardware reader tests.
- **"Finishing HDLBits taught me the syntax, but it did not teach me what a real project looks like"** is the pivot of the whole message. It says: I finished the exercises, I know their ceiling, and I want the thing above them. That is the most credible form of "I want to join".
- **The wish to join is stated in plain words** ("I would like to join your community and take part in its activities") and then *specified* - attend, take a small piece, be corrected. A vague wish is easy to ignore; three concrete forms of participation are not.
- **"I am asking directly rather than assuming either answer"** pre-empts the awkwardness. It says you know the rules and are not trying to get around them.
- **Intel and AMD once, together.** Direction without a wish list.
- **Nothing about visas, grades, or transfer plans.** None of it changes their answer.
- **The no is cheap and the door stays open**: "I would still be glad to know what you are building."

## E. What not to write

| Do not write | Why |
|---|---|
| "I have completed HDLBits" as the main claim | It is an exercise site. Stated alone it says "I am a student"; paired with the 512-vector artifact it says "I finish things". Keep the pair. |
| "I am passionate about semiconductors" | The materials and the artifact are the evidence. |
| "I have no friends here" | Makes the reader responsible for your situation. "Most of my studying happens alone" says it about the work. |
| Visa, I-20, work authorisation | They are a student club, not an employer. |
| "I will do anything, even for free" | Reads as low value and hands them the task of finding you work. |
| Asking for a mentor or a letter in the first message | Bigger asks than "may I send a pull request". |
| Listing every course you have taken | Three names maximum: 6.004, HDLBits, and the artifact. |

## F. If yes - Join form answers

| Field | Answer |
|---|---|
| Year | **Other** (do not dress up as a Stanford year) |
| Core project? | **No** at first - it assumes lab access and weekly in-person work |
| Subteams | **Digital** (first), **Software** (second: CI, scripts, reproducibility) |

Then close one small issue in the first week. That is how an outside contributor becomes a known quantity.

## G. If no

Do not argue, do not re-send. Open equivalents: **ASIC Network** (<https://asicnetwork.net/>, a network of university ASIC/VLSI clubs with a Discord - ask whether a community college can be a member club), **Tiny Tapeout** Discord, **YosysHQ Discourse**, **1BitSquared Discord**, **FOSSi Foundation** / **CHIPS Alliance** open mailing lists.

## Before sending

- [ ] Web form, Subject **Other** (no published email address exists)
- [ ] Replace `<name>`, `<email>`, `<handle>`
- [ ] **Publish `rtl-journey` first** - without the link, the only checkable claim in this mail disappears. See the publish steps in this repo's history; the README must show `make sim TOP=adder4` and the real `ALL PASS (512/512)` output from your own machine
- [ ] Send after **12/21**, not during finals week
- [ ] Log it: `python3 tools/daily.py log "OS3: contact form sent"`

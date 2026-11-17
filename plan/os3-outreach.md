# OS3 (Open Source Silicon @ Stanford) - outreach (2026-11-17, rev 3)

**Site facts** (checked 2026-11-17): Join form asks Name / Email / Year (…/Other) / "core project?" Yes-No / subteams (Digital, Analog, Physical Design, Board Level, Software, PM). Contact form asks Name / Email / Subject (**Sponsorship** or **Other**) / Message. **No email address is published** (`Email: coming soon...`); the only channels are the **web form** and **LinkedIn** (<https://www.linkedin.com/company/open-source-silicon-stanford/>). Slack is Stanford-workspace only. Their wording ties membership to Stanford students, so external participation is unconfirmed. 20 members, 6 subteams, 2 ongoing projects, all projects published.

**Purpose of the message**: not a membership application. It states the level precisely, states the direction with dates, says what is actually missing (people who would catch mistakes), asks what OS3 builds, and offers one small thing.

---

## A. Message for the contact form (Subject: Other)

> **Subject: A student outside Stanford - what are you building, and may I help?**
>
> Hello OS3,
>
> I am a Japanese student studying electrical engineering at Los Medanos College in the East Bay. I came to California on a homestay because I wanted to learn this subject near where the industry actually is - the companies I am aiming at are Intel and AMD - rather than from a distance.
>
> Here is exactly where I am, so you can judge it. I write Verilog: combinational RTL, plus a self-checking testbench for each module, and I have a 4-bit ripple-carry adder that passes all 512 exhaustive input vectors. I am working through digital logic properly - datapath and control, performance measures, the ISA layer - and my current project is an 8-bit ALU. I use Icarus Verilog and Verilator at home and I am learning to read synthesis output.
>
> Here is where I am going. Over the winter break I am carrying a FIFO and then a UART through an open-source flow - synthesis, floorplan, place and route - until the GDS is clean on DRC and LVS, and submitting the result to Tiny Tapeout. In January I want to be debugging a real design, not reading about one.
>
> What I did not bring with me is any connection to people doing this work. Most of my studying happens alone, and that has a ceiling: I can get through a tutorial by myself, but I cannot tell whether what I build is any good, and there is no one to tell me. I am not looking for another course. I am looking for work that can be wrong.
>
> I am not a Stanford student, so I am not asking to join your team. What I want is smaller, and I am writing to you because you publish your projects openly:
>
> 1. May I follow what you are working on - a public repository, issue tracker, or mailing list?
> 2. Would you tell me what the projects actually are? I want to know what a real chip project looks like from the inside, not from a course description.
> 3. If it is useful, may I contribute something small - a testbench, documentation, a reproducibility check - on a published repository?
>
> If participation is Stanford-only, that is a fine answer - I would still be glad to know what you are building. I would rather send this now than wait until my English is perfect. Thank you for reading.
>
> <name> | <email> | github.com/<handle>

## A2. Short version (~180 words)

> Hello OS3,
>
> I am a Japanese student studying electrical engineering at Los Medanos College in the East Bay. I came to California on a homestay to learn this near the industry - I am aiming at Intel and AMD - but I have no connections here.
>
> Where I am: I write Verilog with a self-checking testbench per module, I have a 4-bit ripple-carry adder passing all 512 exhaustive vectors, and I am building an 8-bit ALU while working through digital logic properly. Where I am going: over the winter break I am taking a FIFO and a UART through an open-source flow to a clean GDS and submitting it to Tiny Tapeout.
>
> Most of my studying happens alone, and that has a ceiling - I can finish a tutorial, but I cannot tell whether what I build is good, and there is no one to tell me. I am not looking for another course; I am looking for work that can be wrong.
>
> I am not a Stanford student, so I am not asking to join. I would like to know what OS3 actually builds, and whether outside contributors can send issues or pull requests on the published repos.
>
> <name> | <email> | github.com/<handle>

## B. LinkedIn message (~110 words)

> Hi - I am a Japanese student studying electrical engineering at Los Medanos College in the East Bay. I came here on a homestay to be near the industry (I am aiming at Intel and AMD), but I have no connections here. I write Verilog with self-checking testbenches, and I am taking a FIFO/UART design through an open-source flow to a clean GDS for Tiny Tapeout this winter. I am not at Stanford, so I am not asking to join - I want to know what OS3 is actually building, and whether outside contributors can send issues or pull requests on the published repos. Either answer helps. Thanks.

---

## C. The skills inventory behind those paragraphs (keep this honest and current)

Update this every month; it is what the message is built from, and it is also what you paste into the Join form or a README.

| Area | **Now** | Evidence | **Next** (with date) |
|---|---|---|---|
| Verilog RTL | Combinational modules with a self-checking testbench each; 4-bit ripple-carry adder passing **512/512** exhaustive vectors (a x b x cin) | `rtl-journey/rtl/adder4.v` + `tb/tb_adder4.v` | 8-bit ALU (**W4, 12/6**), FSM, FIFO with testbench (**W5-W7**) |
| Digital logic theory | Number systems, combinational and sequential basics, performance measures, ISA layer; **weak on bit budgeting** (datapath width allocation) | diagnostic 33/50 on units 8-14; bit budgeting 3/10 | close the bit-budget gap (**W4**), units 15-16 |
| Verification | Hand-written self-checking testbenches; no cocotb, no formal yet | same repo | cocotb and SymbiYosys via the GhostGate image (winter) |
| EDA tools | Icarus Verilog and Verilator locally, `make`, git | `Makefile`, commit history | **OpenLane in the winter break**, reading timing and area reports |
| Physical design | **None** | - | FIFO to GDS, clean DRC and LVS (**by 1/10**) |
| Programming | **No formal course yet** | - | COMSC 122, Spring 2027 |
| Public work | One small repo, no submissions yet | - | Tiny Tapeout submission, SMACD paper (2/19) |

**How to use this in the mail**: pick **two** rows that are true (RTL + what is next) and one gap (bit budgeting, verification at scale). Naming a real gap makes the rest credible; claiming breadth does the opposite.

---

## D. Why it is written this way

- **Exact level, not adjectives.** "A 4-bit ripple-carry adder passing all 512 exhaustive vectors" is checkable and small - and 512 is the whole input space, not a sample. It tells them you know what done means, which is the actual signal.
- **The dates do the work of enthusiasm.** "Over the winter break I am carrying a FIFO and then a UART through a flow until the GDS is clean" is heat expressed as a schedule. Adjectives would be weaker and less believable.
- **"I am not looking for another course. I am looking for work that can be wrong."** This is the whole message in two sentences. It also flatters the reader correctly: it says their work is the thing that can catch you.
- **"There is no one to tell me"** states isolation as a fact about the work, not a feeling about you.
- **Intel and AMD are named once, together.** Concrete aim, not a wish list.
- **"I would rather send this now than wait until my English is perfect."** Turning the language gap into evidence of seriousness is better than apologising for it.
- **Nothing about visas, grades, or transfer plans.** None of it changes their answer.

## E. What not to write

| Do not write | Why |
|---|---|
| "I am passionate about semiconductors" | With the FIFO sentence in the same mail, this adds nothing and reads as filler. |
| "I have no friends here" | Makes the reader responsible for your situation. "There is no one to tell me" says it about the work. |
| Skills you cannot demonstrate in one sentence | A reader who tests one claim and finds it thin stops reading. |
| "I will do anything, even for free" | Reads as low value and hands them the task of finding you work. |
| Asking for a mentor, a letter, or an introduction | Bigger asks than "may I send a pull request". Earn the first. |
| A long account of moving countries | One sentence is context; a paragraph buries the question. |

## F. If yes - Join form answers

| Field | Answer |
|---|---|
| Year | **Other** |
| Core project? | **No** at first (lab access and weekly in-person work assumed) |
| Subteams | **Digital**, then **Software** (CI, scripts, reproducibility) |

Close one small issue in the first week. That is how an outside contributor becomes a known quantity.

## G. If no

Do not argue and do not re-send. Open equivalents: **ASIC Network** (<https://asicnetwork.net/>, university ASIC/VLSI club network with a Discord), **Tiny Tapeout** Discord, **YosysHQ Discourse**, **1BitSquared Discord**, **FOSSi Foundation** / **CHIPS Alliance** open mailing lists.

## Before sending

- [ ] Web form, Subject **Other** (no published email address exists)
- [ ] Replace `<name>`, `<email>`, `<handle>`; the GitHub link matters more than the rest
- [ ] **Publish the repo first.** `rtl-journey/` is not yet a public GitHub repo; without a link, the only checkable claim in this mail disappears. Move it to its own public repo with `rtl/`, `tb/`, `Makefile` and a README showing `make sim TOP=adder4` and the `ALL PASS (512/512)` line
- [ ] Send after **12/21**, not during finals week
- [ ] Log it: `python3 tools/daily.py log "OS3: contact form sent"`

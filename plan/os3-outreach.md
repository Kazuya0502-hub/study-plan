# OS3 (Open Source Silicon @ Stanford) - outreach (2026-11-17)

**What the site actually offers** (checked 2026-11-17):

- Join form fields: Name / Email / **Year** (Freshman ... Master's / PhD / **Other**) / "participate on the core project?" Yes-No / **subteams**: Digital, Analog, Physical Design, Board Level Design, Software, Project Management.
- Contact form: Name / Email / Subject (**Sponsorship** or **Other**) / Message.
- **There is no email address on the site** - `Contact Information: Email: coming soon...`. So the only channels are the **web form (Subject: Other)** and **LinkedIn** (<https://www.linkedin.com/company/open-source-silicon-stanford/>).
- Their Slack is `stanford.enterprise.slack.com` (Stanford-workspace only), so Slack access is not something to ask for.
- Self-description: "We are a community of **Stanford students**" and "give **Stanford students** the opportunity" - external participation is **not** stated anywhere. Assume the answer may be no; write so that a no costs them nothing.

---

## A. Message for the contact form (Subject: Other)

> **Subject: A student outside Stanford - may I contribute to your published projects?**
>
> Hello OS3,
>
> I am a Japanese student who came to California to study hardware. I am at Los Medanos College in the Contra Costa district, planning to transfer into UC Davis Electrical Engineering in Fall 2028, and I am working toward RTL design.
>
> Most of what I know I have taught myself: Verilog, self-checking testbenches, and now an open-source synthesis and place-and-route flow. That is also the limit of it. Working alone, I can finish a tutorial, but I cannot tell whether what I have built is any good - and I would like to work on a real project with people who would notice if it were wrong.
>
> I am not a Stanford student, so I am not asking to join your team. I am asking a narrower question, and I have read that you publish every project openly, which is why I am writing to you rather than to anyone else.
>
> 1. Is there a **public channel** (issue tracker, mailing list, blog feed) I can follow without being a member?
> 2. Do you accept **issues and pull requests** from non-Stanford contributors on published repositories - testbenches, documentation, CI, reproducibility checks?
> 3. Is there any **external or mentored track**, even a remote reading group?
>
> What I can offer now is small and real: I am taking a FIFO/UART design through an open-source flow toward a clean GDS for a Tiny Tapeout submission this winter. Verification and documentation are the parts I can do carefully and unsupervised. I would rather be given one boring task and finish it than a large one I cannot.
>
> If the answer is "Stanford students only", that is a fine answer and I will not follow up. Either way, thank you for reading.
>
> <name> | <email> | github.com/<handle>

**Why it is written this way**

- **The "came from Japan" line goes first, and the disqualifier second.** The nationality explains the motive in one clause; the very next sentence removes any implication that it is a request for special treatment. Reversed, the mail reads as an appeal. In this order it reads as context.
- **"I cannot tell whether what I have built is any good"** is the sentence that carries the intent. It says *I am already doing the work, and I want it checked*, which is a different thing from *I want to be taught* - and it is the reason a student club would answer.
- **Three questions that each allow a cheap no**, so one refusal does not end the conversation.
- **"one boring task and finish it"** is deliberate: it is the actual shape of the work an outside contributor gets, and saying it out loud shows you know that.
- **"I will not follow up"** removes the fear of a correspondence.

---

## A2. Short version, if the form has a character limit (~150 words)

> Hello OS3,
>
> I am a Japanese student who came to California for this. I am at Los Medanos College, transferring to UC Davis EE in Fall 2028, working toward RTL design, and I have taught myself Verilog, testbenches and an open-source flow. Working alone I can finish a tutorial, but I cannot tell whether what I build is any good - I would like to work on a real project with people who would notice if it were wrong.
>
> I am not a Stanford student, so I am not asking to join. Do you accept issues or pull requests from outside contributors on your published repositories? Is there a public channel I can follow?
>
> I am taking a FIFO/UART design to GDS for a Tiny Tapeout submission this winter. Verification and documentation are what I can do unsupervised.
>
> If the answer is Stanford-only, that is fine and I will not follow up. Thank you.
>
> <name> | <email> | github.com/<handle>

## B. LinkedIn message (shorter, to the OS3 page or a team member)

> Hi - I am a Japanese student in the East Bay, at Los Medanos College, transferring to UC Davis EE in Fall 2028. I am teaching myself RTL and taking a FIFO/UART design to GDS for a Tiny Tapeout submission this winter, and I would like to work on something real rather than another tutorial. I am not at Stanford, so I am not asking to join - I am asking whether OS3 takes issues or pull requests from outside contributors on its published repos. Either answer helps. Thanks.

---

## C. If they say yes - what to put in the Join form

| Field | Answer |
|---|---|
| Year | **Other** (do not misrepresent as a Stanford year) |
| Participate on the core project? | **No** at first. The core project assumes lab access and weekly in-person work. Ask for a subteam task instead. |
| Subteams | **Digital** (first), **Software** (second - CI, scripts, reproducibility) |

Then, in the first week, take one small task and finish it: a failing test, a missing README section, a Makefile target. Being the person who closes small issues is how an outside contributor becomes a known quantity.

---

## D. If they say no

Do not argue. The equivalent, open-to-everyone options are already identified and are strictly better for a resume you can defend:

- **ASIC Network** - a network of university ASIC/VLSI clubs with a shared Discord (<https://asicnetwork.net/>); ask whether a community college can be a member club.
- **Tiny Tapeout** - submission is open to individuals; the Discord is where shuttle questions get answered.
- **YosysHQ Discourse** and **1BitSquared Discord** - the toolchain developers answer directly, and a public answer with a reproducible case is itself a portfolio artifact.
- **FOSSi Foundation** / **CHIPS Alliance** workgroups - open mailing lists and public meetings.

---

## E. What not to write

| Do not write | Why |
|---|---|
| "I am passionate about semiconductors" | It is a claim, not evidence. The FIFO/GDS sentence is the evidence; one is enough. |
| Anything about visas, I-20, or work authorization | They are a student club, not an employer. It invites a "we cannot help with that" reply. |
| "I will do anything, even for free" | It reads as low value and puts the burden of finding work on them. Name the task you can do instead. |
| A long story about moving countries | One clause is context; a paragraph is a request for sympathy, and it buries the question. |
| Asking for a mentor, a letter, or an introduction | All three are bigger asks than "may I send a pull request". Earn the first, then ask. |

## Before sending

- [ ] Use the web form (Subject: **Other**), not email - there is no published address
- [ ] Replace `<name>`, `<email>`, `<handle>`; the GitHub link matters more than the rest
- [ ] Send after the Winter break starts (12/21), not during finals week - a student-run club reads mail when the term ends
- [ ] Log the date sent, and the date you will stop waiting: `python3 tools/daily.py log "OS3: contact form sent"`

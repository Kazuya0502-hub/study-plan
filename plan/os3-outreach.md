# OS3 (Open Source Silicon @ Stanford) - outreach (2026-11-17, rev 2)

**What the site actually offers** (checked 2026-11-17):

- Join form fields: Name / Email / **Year** (Freshman ... Master's / PhD / **Other**) / "participate on the core project?" Yes-No / **subteams**: Digital, Analog, Physical Design, Board Level Design, Software, Project Management.
- Contact form: Name / Email / Subject (**Sponsorship** or **Other**) / Message.
- **There is no email address on the site** - `Contact Information: Email: coming soon...`. The only channels are the **web form (Subject: Other)** and **LinkedIn** (<https://www.linkedin.com/company/open-source-silicon-stanford/>).
- Their Slack is `stanford.enterprise.slack.com` (Stanford workspace only), so do not ask for Slack access.
- Self-description: "We are a community of **Stanford students**" and "give **Stanford students** the opportunity". External participation is **not** stated anywhere. Write so that a no costs them nothing.
- 20 members, 6 subteams, 2 ongoing projects, funded by Apple and Stanford EE, all projects published publicly.

**What this message is for**: not a membership application. It says who you are, why you came to California, what is missing (people, not information), asks what OS3 actually builds, and offers one small concrete thing.

---

## A. Message for the contact form (Subject: Other)

> **Subject: A student outside Stanford - what are you building, and may I help?**
>
> Hello OS3,
>
> I am a Japanese student studying electrical engineering at Los Medanos College in the East Bay. I came to California on a homestay because I wanted to learn this subject near where the industry actually is - the companies I am aiming at are Intel and AMD - rather than from a distance.
>
> What I did not bring with me is any connection to people doing this work. Most of my studying happens alone, and that has a ceiling: I can get through a tutorial by myself, but I cannot tell whether what I build is any good.
>
> I am not a Stanford student, so I am not asking to join your team. What I want is smaller than that, and I am writing to you because you publish your projects openly:
>
> 1. May I follow what you are working on - a public repository, issue tracker, or mailing list?
> 2. Would you tell me what the projects actually are? I would like to know what a real chip project looks like from the inside, not from a course description.
> 3. If it is useful, may I contribute something small - a testbench, documentation, a reproducibility check - on a published repository?
>
> What I have to offer is modest: I am taking a FIFO/UART design through an open-source flow toward a clean GDS for a Tiny Tapeout submission this winter. Verification and documentation are the parts I can do carefully and unsupervised.
>
> If participation is Stanford-only, that is a fine answer - I would still be glad to know what you are building. Thank you for reading.
>
> <name> | <email> | github.com/<handle>

## A2. Short version, if the form has a character limit (~150 words)

> Hello OS3,
>
> I am a Japanese student studying electrical engineering at Los Medanos College in the East Bay. I came to California on a homestay to learn this close to where the industry is - I am aiming at companies like Intel and AMD - but I have no connections here, so most of my studying is done alone.
>
> I am not a Stanford student, so I am not asking to join. I would like to know what projects OS3 actually works on, and if it is useful, to help with one - a testbench, documentation, a reproducibility check. I am taking a FIFO/UART design to GDS for a Tiny Tapeout submission this winter.
>
> If it is Stanford-only, that is fine; I would still like to hear what you are building. Thank you.
>
> <name> | <email> | github.com/<handle>

## B. LinkedIn message (to the OS3 page or a team member)

> Hi - I am a Japanese student studying electrical engineering at Los Medanos College in the East Bay. I came to California on a homestay to be near the industry (I am aiming at Intel and AMD), but I have no connections here and most of my studying is done alone. I am not at Stanford, so I am not asking to join - I would like to know what OS3 is actually building, and whether outside contributors can send issues or pull requests on the published repos. Either answer helps. Thanks.

---

## Why it is written this way

- **The homestay line does the work of explaining the whole situation in one sentence.** It says *I moved countries for this* without asking for credit for it, and it explains why the next paragraph is true.
- **"I cannot tell whether what I build is any good"** is the centre of the message. It says *I am already doing the work; I want it checked* - which is a different thing from *I want to be taught*, and it is the only reason a student club would reply.
- **Intel and AMD are named once, together.** It makes the ambition concrete and gives them a frame for what to tell you about. More than two names reads like a wish list; none reads like no direction.
- **"I would still be glad to know what you are building"** keeps the door open after a no. It is also honest - the information is worth having on its own.
- **Nothing about transfer plans, visas, or grades.** None of it changes their answer, and each one invites a "we cannot help with that" reply.
- **"I will not follow up" was dropped in this revision** because the closing now asks for something they can give for free (tell me what you are building), so there is no need to promise silence. Keep the one-message discipline anyway: send once, and wait.

## What not to write

| Do not write | Why |
|---|---|
| "I am passionate about semiconductors" | A claim, not evidence. The FIFO/GDS sentence is the evidence. |
| "I have no friends here" / "I am lonely" | True, but it makes the reader responsible for your situation. "Most of my studying happens alone" says the same thing as a fact. |
| Visa, I-20, work authorization | They are a student club, not an employer. |
| "I will do anything, even for free" | Reads as low value and hands them the work of finding you a task. |
| Asking for a mentor, a letter, or an introduction | All three are bigger asks than "may I send a pull request". |
| A long account of moving countries | One sentence is context; a paragraph is a request for sympathy and buries the question. |

## If they say yes - what to put in the Join form

| Field | Answer |
|---|---|
| Year | **Other** (do not dress up as a Stanford year) |
| Participate on the core project? | **No** at first - the core project assumes lab access and weekly in-person work |
| Subteams | **Digital** (first), **Software** (second: CI, scripts, reproducibility) |

Then close one small issue in the first week. Being the person who finishes small tasks is how an outside contributor becomes a known quantity.

## If they say no

Do not argue, and do not re-send. The open-to-everyone equivalents are already identified:

- **ASIC Network** - a network of university ASIC/VLSI clubs with a shared Discord (<https://asicnetwork.net/>); ask whether a community college can join as a club.
- **Tiny Tapeout** - open to individuals; the Discord is where shuttle questions get answered.
- **YosysHQ Discourse** and **1BitSquared Discord** - toolchain developers answer directly, and a public answer with a reproducible case is itself a portfolio artifact.
- **FOSSi Foundation** / **CHIPS Alliance** workgroups - open mailing lists and public meetings.

## Before sending

- [ ] Use the web form (Subject: **Other**) - there is no published email address
- [ ] Replace `<name>`, `<email>`, `<handle>`; the GitHub link matters more than the rest
- [ ] Send after 12/21, not during finals week - a student club reads mail when the term ends
- [ ] Log it: `python3 tools/daily.py log "OS3: contact form sent"`

# OS3 (Open Source Silicon @ Stanford) - outreach (2026-11-17)

**What the site actually offers** (checked 2026-11-17):

- Join form fields: Name / Email / **Year** (Freshman ... Master's / PhD / **Other**) / "participate on the core project?" Yes-No / **subteams**: Digital, Analog, Physical Design, Board Level Design, Software, Project Management.
- Contact form: Name / Email / Subject (**Sponsorship** or **Other**) / Message.
- **There is no email address on the site** - `Contact Information: Email: coming soon...`. So the only channels are the **web form (Subject: Other)** and **LinkedIn** (<https://www.linkedin.com/company/open-source-silicon-stanford/>).
- Their Slack is `stanford.enterprise.slack.com` (Stanford-workspace only), so Slack access is not something to ask for.
- Self-description: "We are a community of **Stanford students**" and "give **Stanford students** the opportunity" - external participation is **not** stated anywhere. Assume the answer may be no; write so that a no costs them nothing.

---

## A. Message for the contact form (Subject: Other)

> **Subject: Non-Stanford student - may I contribute to your published projects?**
>
> Hello OS3,
>
> I am a community college student at Los Medanos College (Contra Costa district, California), planning to transfer into UC Davis Electrical Engineering in Fall 2028, working toward RTL design. I am not a Stanford student, so I am asking a narrow question rather than applying to join.
>
> I have read that you publish all projects publicly and contribute back to the open-source ecosystem. Three things, in the order I would hope for them:
>
> 1. Is there a **public channel** (mailing list, issue tracker, blog feed) I can follow without being a member?
> 2. Do you accept **issues and pull requests** from non-Stanford contributors on published repositories - testbenches, documentation, CI, reproducibility checks?
> 3. Is there any **external or mentored track**, even a remote reading group?
>
> What I can actually offer now: Verilog with self-checking testbenches, and a FIFO/UART design I am carrying through an open-source flow to a clean GDS for a Tiny Tapeout submission this winter. Verification and documentation are the parts I can do well and unsupervised.
>
> A one-line "no, we are Stanford-only" is a completely fine answer, and I will not follow up.
>
> Thank you,
> <name> | <email> | github.com/<handle>

**Why it is written this way**: it states the disqualifier first (not a Stanford student) so they do not spend time on it, asks three questions that each allow a cheap no, names a concrete contribution instead of asking to be taught, and promises not to chase them.

---

## B. LinkedIn message (shorter, to the OS3 page or a team member)

> Hi - I am a community college student in the East Bay (Los Medanos College), transferring to UC Davis EE in Fall 2028, aiming at RTL design. I saw that OS3 publishes its projects openly. Do you accept pull requests or issues from non-Stanford contributors on those repositories, or is participation limited to Stanford students? Either answer is useful - I am trying to work out where an outside student can legitimately plug in. Thanks.

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

## Before sending

- [ ] Use the web form (Subject: **Other**), not email - there is no published address
- [ ] Replace `<name>`, `<email>`, `<handle>`; the GitHub link matters more than the rest
- [ ] Send after the Winter break starts (12/21), not during finals week - a student-run club reads mail when the term ends
- [ ] Log the date sent, and the date you will stop waiting: `python3 tools/daily.py log "OS3: contact form sent"`

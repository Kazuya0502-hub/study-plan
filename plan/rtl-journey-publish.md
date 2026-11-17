# Publishing `rtl-journey` as its own repository (2026-11-17)

**Why before 12/21**: the OS3 message (`plan/os3-outreach.md`) has exactly one checkable claim, and it
is a link to this repository. Without the link the mail is only adjectives.

**Already in place**: `README.md`, `LICENSE` (MIT), `.gitignore`, `.github/workflows/sim.yml`,
`Makefile`, `rtl/adder4.v`, `tb/tb_adder4.v`, `docs/adder4.md`.

**Still yours to fill in**: the licence name, the GitHub handle, and the **real** simulation output.

---

## 1. The three slots to fill in

### 1.1 `LICENSE`, line 3

```
Copyright (c) 2026 <your name>
```

Replace `<your name>` with your legal name. Nothing else in the file changes.

### 1.2 `README.md`, clone line

Find, under `## Quick start`:

```
git clone https://github.com/<your-handle>/rtl-journey.git
```

Replace `<your-handle>` with your GitHub username.

### 1.3 `README.md`, the output block

Find the fenced block directly under `make sim TOP=adder4` that currently reads:

```
$ make sim TOP=adder4
iverilog -g2012 -Wall -o build/adder4.vvp rtl/adder4.v tb/tb_adder4.v
vvp build/adder4.vvp
VCD info: dumpfile build/adder4.vcd opened for output.
ALL PASS (512/512)
```

**This block is labelled "expected output" on purpose - it has not been run on a machine with
Icarus Verilog.** Replace the whole block with what your own terminal prints, and replace the
notice under it with:

```
> Captured on <date> on <OS>, Icarus Verilog <version>.
```

**How to capture it on Windows** (so the text is exact, not retyped):

```powershell
cd rtl-journey
make sim TOP=adder4 2>&1 | Tee-Object -FilePath sim-output.txt
notepad sim-output.txt
```

Without `make`:

```powershell
New-Item -ItemType Directory -Force build
iverilog -V                                   # note the version for the caption
iverilog -g2012 -Wall -o build\adder4.vvp rtl\adder4.v tb\tb_adder4.v
vvp build\adder4.vvp
```

If it does **not** print `ALL PASS (512/512)`, do not publish the claim. The testbench compares every
case against a reference sum, so a failure means the RTL or the testbench is wrong - fix it first, then
publish the passing output. (`sim-output.txt` is ignored by `.gitignore` only if it ends in `.txt` at
the repository root, so delete it or add it to `.gitignore` before committing.)

---

## 2. Publish, keeping history (recommended)

Run on your own PC, in the `study-plan` clone, **after** pulling the latest bundle.

```bash
cd study-plan
git status                       # must be clean
git pull                         # take the new commits from the bundle first

# 1) extract the folder as its own branch (keeps its history)
git subtree split --prefix=rtl-journey -b rtl-journey-export

# 2) create the empty repo on GitHub:  name rtl-journey
#    IMPORTANT: add no README, no .gitignore, no licence - they would collide

# 3) push that branch as main
git push git@github.com:<your-handle>/rtl-journey.git rtl-journey-export:main

# 4) tidy up locally
git branch -D rtl-journey-export
```

Then:

```bash
git clone git@github.com:<your-handle>/rtl-journey.git
cd rtl-journey
make sim TOP=adder4              # confirm it passes from a fresh clone
```

**If `git subtree split` says `prefix 'rtl-journey' not found`**, you are not in the repository root -
`cd` there and retry. `git subtree` ships with Git for Windows and with macOS Git.

## 3. If you prefer no history

```bash
# elsewhere on disk
cp -r study-plan/rtl-journey rtl-journey-publish
cd rtl-journey-publish
rm -rf .git
git init -b main
git add .
git commit -m "add: 4-bit ripple-carry adder with exhaustive testbench"
git remote add origin git@github.com:<your-handle>/rtl-journey.git
git push -u origin main
```

This is fine. The history of a four-file repository carries little weight; a clean first commit with an
honest message is enough.

---

## 4. Repository settings worth 2 minutes

| Field | Value |
|---|---|
| Description | `Learning RTL design from scratch: one module at a time, spec -> testbench -> synthesis.` |
| Topics | `verilog`, `rtl`, `digital-design`, `asic`, `fpga`, `learning-in-public` |
| About / website | leave empty (do not point at anything you do not control) |
| Visibility | Public |

**Check before you announce it**: no secrets, no absolute paths with your username, no `.vcd` files,
`sim-output.txt` deleted.

---

## 5. Verification checklist

- [ ] `LICENSE` shows your name, not `<your name>`
- [ ] `README.md` has no `<your-handle>` left (`grep -n "<your-" README.md LICENSE` returns nothing)
- [ ] The output block shows your **own** run, with a date and tool version in the caption
- [ ] The Actions run is **green** (`.github/workflows/sim.yml` runs every testbench and greps for `ALL PASS`)
- [ ] A fresh `git clone` + `make sim TOP=adder4` passes locally
- [ ] The repository renders correctly in a browser (README tables and code blocks)
- [ ] The link in `plan/os3-outreach.md` matches the real URL

## 6. Optional, after it is green

Add the CI badge as the first line of `README.md`:

```markdown
![sim](https://github.com/<your-handle>/rtl-journey/actions/workflows/sim.yml/badge.svg)
```

A green badge is the cheapest possible proof that the tests pass, and it is the thing a reader clicks
after the link.

## 7. Order of operations from here

1. Fill in the three slots (section 1).
2. Publish (section 2 or 3).
3. Confirm CI is green (section 5).
4. Only then send the OS3 message, **after 12/21**.
5. Log it: `python3 tools/daily.py log "rtl-journey published: <url>"`

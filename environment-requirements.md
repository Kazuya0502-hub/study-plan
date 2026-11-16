# The environment you actually need - one list

Six layers, one page: what you need and when. Layers 1-3 are **needed now**, layers 4-5 are **needed after transfer and after hiring**, and layer 6 is paperwork and cost.

- Scope: as of 2026-11-13
- Assumes Windows 11 + WSL2 (Ubuntu), as in the plan
- Bottom line: **the whole self-study environment is free open-source software.** The only paid items are Tiny Tapeout (EUR 385) and exam, application, and visa fees.

---

## Layer 1: needed now (W1-W9, November 2026 to January 2027)

### 1.1 Hardware

| Item | Minimum | Recommended | Why |
|---|---|---|---|
| RAM | 8 GB | **16 GB (32 GB if buying new)** | Building Verilator and running OpenROAD get comfortable above 16 GB |
| CPU | 4 cores | 6-8 cores | Simulation and synthesis are mostly single-threaded. Single-core speed beats core count |
| Storage | 30 GB free | **100 GB free (SSD)** | The WSL2 virtual disk grows on its own. OpenLane plus the PDK uses 40 GB |
| GPU | Not needed | Not needed | Logic design does not use one |
| OS | Windows 11 (WSLg required) | Same | WSLg is how GUI tools like GTKWave reach the screen |

> **Should you buy anything?** If WSL2 already runs and you have 8 GB or more, **do not buy**. If 8 GB becomes the bottleneck, add RAM (or replace the laptop). **An FPGA board is not needed yet** (it is an optional item in layer 3).

### 1.2 WSL2 setup (three things, first)

```bash
# On the Windows side (PowerShell, as administrator)
wsl --install -d Ubuntu-24.04
wsl --set-default-version 2
```

`C:\Users\<name>\.wslconfig` (cap the memory explicitly, or Windows will freeze):
```ini
[wsl2]
memory=8GB
processors=4
swap=4GB
```

`/etc/wsl.conf` (systemd is needed for Docker in layer 3):
```ini
[boot]
systemd=true
```

**Important**: keep projects in `~/work`. `/mnt/c/...` is 5-10x slower on I/O, and building `iverilog` there is painful.

### 1.3 What to install (all free)

```bash
sudo apt update && sudo apt install -y \
  build-essential git make python3 python3-venv python3-pip \
  iverilog verilator gtkwave yosys \
  zlib1g-dev libreadline-dev pkg-config clang \
  jq ripgrep
```

| Tool | Use | Alternative |
|---|---|---|
| **Icarus Verilog** | Fast functional simulation, beginner friendly | Verilator (faster but stricter) |
| **Verilator 5.x** | Lint (`-Wall`) and fast simulation | - |
| **Yosys** | Logic synthesis, area and cell counts, latch detection | - |
| **GTKWave** | Waveform viewer | **Surfer** (Rust, nicer UX, handles large waveforms) |
| **Verible** | SystemVerilog lint and format (CHIPS Alliance) | - |
| **OSS CAD Suite** (YosysHQ) | yosys, sby, yosys-smtbmc, nextpnr, gtkwave **at pinned versions**, in one download | The apt versions drift and break synthesis scripts |

**Recommendation**: install `yosys` and `sby` (formal verification) from **OSS CAD Suite**. The apt Yosys is old and `read_verilog -sv` behaviour changes between versions.
<https://github.com/YosysHQ/oss-cad-suite-build/releases>

### 1.4 Editor and accounts

| Item | Detail |
|---|---|
| Editor | **VS Code + the WSL extension** (`ms-vscode-remote.remote-wsl`) |
| Extensions | `mshr-h.veriloghdl` (wires Verilator into lint), `Surfer` or WaveTrace |
| Accounts | **GitHub** (with an SSH key), **ASSIST** (required to check transfer requirements); UC and Cal State Apply accounts come in 2027 |
| Repo layout | `rtl/ tb/ syn/ docs/ notes/` plus a `Makefile` with five targets: `lint / sim / wave / syn / test` |
| `.gitattributes` | `* text=auto eol=lf` (stops CRLF creeping in from Windows) |

### 1.5 Check

Run `env/setup-check.sh` from this repo to list which tools are present and at what version.

```bash
bash env/setup-check.sh
```

**W1's "record the environment versions" task is complete once you paste that output into `notes/env.md`.**

---

## Layer 2: CPU and verification (W10-W23, January to April 2027)

Adds to layer 1. This is where RV32I gets written, so you need a cross compiler.

```bash
sudo apt install -y gcc-riscv64-unknown-elf binutils-riscv64-unknown-elf
```

| Tool | Use | Note |
|---|---|---|
| **riscv64-unknown-elf-gcc** | Compile C and assembly test programs, produce hex for `$readmemh` | `-march=rv32i -mabi=ilp32` |
| **riscv-tests** | The official ISA tests (used in W31) | From GitHub; check the licence |
| **spike / pk** (optional) | Reference implementation; a stand-in for your expected-value model | A Python model is enough |
| **cocotb** (optional) | Write testbenches in Python | Connects to Verilator or Icarus. Moderate learning cost |
| **SymbiYosys (sby) + z3 / yices / boolector** | Formal verification (W21) | Bundled with OSS CAD Suite |
| **Surfer** | Waveforms | More comfortable than GTKWave |

### The reality of SVA (assertions)

- **Icarus supports very little SVA** (some concurrent assertions only).
- **Verilator 5 supports a subset** (needs `--assert`).
- Full SVA (`|->`, `##`, properties) is **commercial tool** territory (VCS, Questa).
- **Substitutes**: immediate assertions (`assert (...)`), and proving properties with SymbiYosys.

> Not knowing this gets you stuck the first time someone says "write an SVA". Being able to say **"in open source I substituted immediate assertions plus formal verification"** is actually a strong interview answer.

---

## Layer 3: synthesis, timing, tapeout (W24-W41, April to August 2027)

| Tool | Use | How | Typical size |
|---|---|---|---|
| **Yosys + abc** | Logic synthesis, area and depth | OSS CAD Suite | 1 GB |
| **OpenSTA** | Static timing analysis (works standalone, light) | Build or OSS CAD Suite | 1 GB |
| **OpenROAD** | Floorplan to place-and-route to STA in one flow | Build (heavy) | 10 GB+ |
| **OpenLane 2 + sky130 PDK** | A production-shaped flow in Docker | `pip install openlane` + `volare` for the PDK | **40 GB** |
| **Docker Desktop** | Runs OpenLane | WSL2 backend plus systemd | 5 GB |
| **magic / klayout / netgen** | DRC, LVS, GDS viewing | Inside the OpenLane image | - |
| **GitHub Actions** | Build the Tiny Tapeout GDS in the cloud | The free tier is enough | - |

### What Tiny Tapeout needs

| Item | Detail |
|---|---|
| Account | <https://app.tinytapeout.com> |
| Template | Fork the Verilog submission template (`ttsky-verilog-template` or `ttgf-verilog-template`) |
| Cost | **1 tile EUR 70 + DevKit EUR 300 + shipping EUR 15 = EUR 385** (cheaper when the shuttle includes a carrier PCB) |
| Shuttle timing | Every 2-3 months. **March 2027 (TTIHP27a) and April 2027 (TTGF27a)** are the candidates |
| Deliverables | A GitHub repo, the GDS (built by Actions), and docs (README, pinout, how it works) |

### Optional (the plan works without them)

- **FPGA board**: Tang Nano 9K (about JPY 2,000-3,000) or DE10-Lite. Running on real hardware is a good interview story but **is not a substitute for ASIC work**.
- **Vivado / Quartus (free WebPACK)**: only if you go the FPGA route. Tens of GB to install, so **later**.

### Resource reality

- OpenROAD wants **16 GB of RAM**. At 8 GB it dies.
- If your machine cannot do it, use the **university cluster (after transfer)** or **GitHub Codespaces**. For now, "Yosys plus OpenSTA" is enough.

---

## Layer 4: the university environment after transfer (from September 2028)

These are **not things you buy**. They are things you use hard.

| Environment | Contents | When |
|---|---|---|
| **Linux cluster** | SSH, VPN, `module load`, Slurm/LSF batch jobs, storage quotas | Classwork, research, large synthesis |
| **Commercial EDA licences** (via the university programme) | Cadence (Virtuoso, Genus, Innovus, Tempest), Synopsys (VCS, Design Compiler, PrimeTime, IC Compiler), Siemens (Questa, Calibre), Ansys, MATLAB | Classes and research. **Licences are campus-only and cannot leave** |
| **FPGA boards and instruments** | Xilinx and Intel boards, scopes, logic analysers, supplies | Lab courses, capstone |
| **Papers** | IEEE Xplore, ACM DL (library subscriptions) | Capstone, interview research |
| **People** | Office hours, research groups | Recommendation letters, joining a lab |

> **Strategy**: commercial tools arrive **after transfer**, so **learn the principles on open source now**. Having run Yosys and OpenSTA makes the commercial tools much faster to learn. Doing only FPGA work now would leave the ASIC flow (synthesis, STA, DFT) missing.

---

## Layer 5: the professional environment (from 2030)

| Category | Concrete items |
|---|---|
| RTL and verification | Verilog, SystemVerilog, UVM, VCS / Xcelium / Questa, Verdi / DVE |
| Lint, CDC, formal | SpyGlass / VC SpyGlass, JasperGold / VC Formal |
| Synthesis and STA | Design Compiler / Genus, PrimeTime / Tempus |
| Physical design | Innovus / ICC2, Calibre, StarRC |
| Scripting | **Tcl** (effectively mandatory), Python, Perl, Make, bash |
| Infrastructure | Linux CLI, Git / Perforce, Jenkins / CI, Jira, corporate VPN, licence servers |
| Compute | LSF / Slurm job submission, large storage |
| Language | English reviews, specs, and meetings |

**What pays off now**: Tcl, Make, the Linux CLI, and Git discipline. Those four **separate people the most after hiring**, yet they are the easiest to postpone. **Writing the W22 synthesis script in Tcl and Make** is the shortest route.

---

## Layer 6: paperwork, accounts, and cost

### 6.1 Accounts (with timing)

| When | Create |
|---|---|
| 2026/11 | GitHub, ASSIST (requirement checks), LinkedIn (where public artifacts live) |
| 2027/6-8 | IELTS or TOEFL account, College Board (if Yale needs an SAT) |
| 2027/9 | UC application, Cal State Apply, Common App (Cornell), Coalition/Scoir (Columbia), CSS Profile (Cornell aid) |
| 2027/12 | Each school's portal (to track recommendation letters) |
| 2028/4-6 | I-20 receipt, SEVIS transfer |
| 2029/1- | Japanese job-hunting sites and company career pages |

### 6.2 Visa and immigration (assuming F-1)

| Item | Fact | Note |
|---|---|---|
| **SEVIS I-901** | **$350** for F-1 | **Transferring a SEVIS record from a CCC to a UC does not require paying again** (8 CFR 214.13(b): a transfer is not a new payment) |
| **Visa application fee (MRV)** | **$185** | Only when a new visa is needed (for example, renewing in Japan) |
| Campus visa administration fee | e.g. UCSD charges **$200** once, at first enrolment | Varies by campus |
| Health insurance | SHIP is normally mandatory; about $3,000-5,000 a year (inside the cost of attendance) | Waivers are hard to get |
| SSN | Needed for on-campus work and OPT | On-campus jobs are allowed on F-1 |

### 6.3 Real costs (the self-study itself is free)

| Item | Amount | When |
|---|---|---|
| Self-study environment (layers 1-3, open source) | **JPY 0** | Now |
| Tiny Tapeout | **EUR 385** (about JPY 60,000) | 2027/5-7 |
| IELTS | JPY 25,000-28,000 (**verify**) | 2027/8 |
| TOEFL iBT | about US$200 (**verify**) | 2027/8 (for Cornell) |
| UC application fee | **$95 per campus** (international) x 5 = **$475** | 2027/10-11 |
| Cal State Apply | about $70 per campus (**verify**) x 2-3 | 2027/10-11 |
| Cornell application | $85 | 2028/3 |
| Columbia / Princeton | about $85 / $75 (**verify**) | 2028/3 |
| CSS Profile (Cornell aid) | $25 + $16 per campus (**verify**) | 2028/2 |
| SEVIS repeat payment | **$0** (transfer) | - |
| Visa renewal (if needed) | $185 | Summer 2028 |
| **Tuition and living costs after transfer** | **$176,000-$202,000 for two years** | 2028/9-2030/6 |

> **The only point that matters in this table**: the self-study environment costs about JPY 60,000 and the tuition costs about JPY 27 million. That is why the funding plan in `transfer-strategy-v3.md` section 4 is the top priority.

---

## Minimum vs recommended setup

| Setup | Contents | Cost | What it enables |
|---|---|---|---|
| **Minimum** | Existing PC + WSL2 + apt open source | **JPY 0** | Everything in phases A and B (ALU, FIFO, UART, RV32I, 5-stage pipeline, Yosys synthesis) |
| **Recommended** | The above + OSS CAD Suite + Surfer + Verible + 16 GB RAM | JPY 0 (unless adding RAM) | The above plus formal verification, lint discipline, and comfortable waveforms |
| **Tapeout** | The above + Docker + OpenLane + sky130 PDK + a TT submission | **EUR 385 + 40 GB** | GDS generation and a real chip submission |
| **Luxury** | The above + an FPGA board + 32 GB RAM | + JPY 10,000 or more | Running on real hardware (optional) |

**Phases A and B fit entirely within the minimum setup.** Most likely the only things your current machine lacks are RAM and disk.

---

## Pitfalls (close these before they bite)

| Symptom | Cause | Fix |
|---|---|---|
| Simulation is absurdly slow | The project lives in `/mnt/c/` | Move it to `~/work` |
| `iverilog` fails on CRLF | A Windows editor saved CRLF | `* text=auto eol=lf` in `.gitattributes` |
| No GTKWave window | No WSLg (Windows 10 or older) | Upgrade to Windows 11, or use VcXsrv |
| `yosys` behaves differently from the docs | The apt build is old | Switch to OSS CAD Suite |
| SVA will not compile | Icarus supports very little SVA | Immediate assertions plus SymbiYosys |
| Docker will not start | systemd is disabled | `systemd=true` in `/etc/wsl.conf`, then `wsl --shutdown` |
| The WSL2 disk keeps growing | The virtual disk does not shrink | `wsl --manage <distro> --set-sparse true`, or compact manually with `diskpart` |
| Verilator runs out of memory | `-j` is too high | Drop to `-j2` or `-j4`, raise `memory` in `.wslconfig` |

---

## Three commands for today

```bash
# 1) Check (this repo)
bash env/setup-check.sh

# 2) Install what is missing (Ubuntu)
sudo apt update && sudo apt install -y build-essential git make python3 python3-venv \
  iverilog verilator gtkwave yosys zlib1g-dev libreadline-dev pkg-config

# 3) Paste the output straight into notes/env.md (finishes one W1 task)
mkdir -p notes && bash env/setup-check.sh | tee notes/env.md
```

---

## Sources

- SEVIS I-901 amount, and no repeat payment on transfer: <https://www.ice.gov/sevis/i901> and <https://www.ecfr.gov/current/title-8/section-214.13>
- Visa application fee (MRV) $185: US Department of State fee schedule (checked October 2026)
- UC application fee $80, $95 for international: <https://admissions.berkeley.edu/apply-to-berkeley>
- Example campus visa fee (UCSD $200): <https://students.ucsd.edu/_files/registrar/international-student-visa-admin-fee-2026.pdf>
- Tiny Tapeout pricing: <https://app.tinytapeout.com/calculator?tiles=1&pcbs=1>, shuttle dates <https://tinytapeout.com/chips>
- OSS CAD Suite: <https://github.com/YosysHQ/oss-cad-suite-build/releases>
- OpenLane 2 / sky130: <https://github.com/efabless/openlane2>
- Verible: <https://github.com/chipsalliance/verible>

# rtl-journey

A public record of learning RTL design from the beginning: one module at a time, each taken from
specification through verification and synthesis, with the mistakes left in.

Every module here has three things: a written spec with explicit non-goals, a self-checking
testbench, and a synthesis result. Nothing is added without all three.

## Status

| Module | What it is | Verification | Synthesis |
|---|---|---|---|
| [`adder4`](rtl/adder4.v) | 4-bit ripple-carry adder built from half adders and full adders, no `+` operator | **512/512 exhaustive vectors** (a x b x cin) | see [`docs/adder4.md`](docs/adder4.md) |

Next: 8-bit ALU, 2R1W register file, synchronous FIFO, UART transmitter, then a single-cycle
RV32I, then a 5-stage pipeline.

## Quick start

Requires [Icarus Verilog](https://github.com/steveicarus/iverilog) (simulation),
[Verilator](https://www.veripool.org/verilator/) (lint), [Yosys](https://yosyshq.net/yosys/)
(synthesis) and optionally GTKWave.

```bash
git clone https://github.com/<your-handle>/rtl-journey.git
cd rtl-journey
make sim TOP=adder4
```

```
$ make sim TOP=adder4
iverilog -g2012 -Wall -o build/adder4.vvp rtl/adder4.v tb/tb_adder4.v
vvp build/adder4.vvp
VCD info: dumpfile build/adder4.vcd opened for output.
ALL PASS (512/512)
```

> This is the **expected** output: the testbench sweeps all 512 combinations of `a`, `b` and `cin`,
> compares the 5-bit result `{cout, sum}` against a reference value computed inside the testbench,
> prints every mismatch, and ends with either `ALL PASS (n/n)` or `FAILED m / n`.
> Paste your own terminal output over this block on the first run - a repository should show what
> actually happened on the machine that ran it.

Other targets:

```bash
make lint TOP=adder4   # verilator --lint-only -Wall
make syn  TOP=adder4   # yosys synthesis, cell count and logic depth into build/
make wave TOP=adder4   # simulate and open the waveform in GTKWave
make help              # list targets
make clean
```

### Windows

`make` is not installed by default. Either install it, or run the tools directly in PowerShell:

```powershell
New-Item -ItemType Directory -Force build
iverilog -g2012 -Wall -o build\adder4.vvp rtl\adder4.v tb\tb_adder4.v
vvp build\adder4.vvp
```

The simplest way to get all the tools at once is
[OSS CAD Suite](https://github.com/YosysHQ/oss-cad-suite-build/releases) (unzip, add `bin` to PATH).
No installation needed: [EDA Playground](https://www.edaplayground.com/) runs Icarus Verilog in a browser.

## Layout

```
rtl/       design files, one module per file
tb/        testbenches, tb_<module>.v, always self-checking
docs/      one page per module: ports, structure, non-goals, results
syn/       synthesis scripts and logs
Makefile   sim / lint / syn / wave / clean
```

## Conventions

- File name equals module name: `rtl/adder4.v` contains `module adder4`.
- A testbench must **decide** pass or fail by itself. A waveform is for debugging, not for judging.
- One commit is one working unit: spec + testbench + implementation together.
- Commit message says what changed and the result:
  `add: 4-bit ripple-carry adder (tb 512/512 pass)`.
- Synthesis warnings are treated as defects. No inferred latches, no combinational loops.

## What this repository is not

- Not a library. Nothing here is meant to be reused as IP.
- Not complete. It is a snapshot of a learning sequence, and the early modules are deliberately primitive
  (a ripple-carry adder is not how anyone adds numbers in real hardware).
- Not a claim of professional experience. The point of publishing it is that the work can be checked
  and corrected by someone who knows more.

## Log

The dated learning log, error log and spaced-repetition cards that go with this repository live outside it,
in a private planning repository. Only the circuits, their tests and their documentation are published here.

## License

MIT - see [LICENSE](LICENSE).

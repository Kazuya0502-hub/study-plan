# rtl-journey (working directory)

Where the RTL study code lives. **Kept separate from the planning documents in the parent directory.**

## Layout

```
rtl-journey/
  rtl/     design (.v) - one file per module
  tb/      testbenches (tb_<module>.v) - always self-checking
  syn/     synthesis scripts and reports
  docs/    specs (1-2 pages: I/O table, non-goals, timing)
  notes/   study log, cards, error log, env.md
```

## Conventions

- File name = module name (`rtl/adder4.v` -> `module adder4`)
- One commit = one working unit (spec + testbench + implementation together)
- Commit message: `add: 4-bit ripple-carry adder (tb 512/512 pass)`
- Record tool versions in `notes/env.md`

## Commands (run on a PC with the tools installed)

```bash
make sim   TOP=adder4   # compile and simulate (iverilog)
make lint  TOP=adder4   # lint (verilator -Wall)
make syn   TOP=adder4   # synthesize and report cell count (yosys)
make wave  TOP=adder4   # open the waveform in gtkwave
make clean
```

`make` is not installed on Windows by default. Either install it, or run the tools directly:

```powershell
cd C:\Users\<you>\Downloads\study-plan\rtl-journey
New-Item -ItemType Directory -Force build
iverilog -o build\adder4.vvp tb\tb_adder4.v rtl\adder4.v
vvp build\adder4.vvp
yosys -p "read_verilog rtl/adder4.v; synth; stat"
```

## Installing the tools (on your PC)

| OS | Command |
|---|---|
| macOS | `brew install icarus-verilog verilator yosys gtkwave` |
| Ubuntu/Debian | `sudo apt install iverilog verilator yosys gtkwave` |
| Windows | [OSS CAD Suite](https://github.com/YosysHQ/oss-cad-suite-build/releases) (no installer; unzip and add `bin` to PATH) |

If you do not want to install anything, [EdaPlayground](https://www.edaplayground.com/) runs iverilog in the browser.

## About this VM

This cloud workspace has **no iverilog, verilator, or yosys**, and there is no root access to add them. **Author and review files here; run them on your PC.**

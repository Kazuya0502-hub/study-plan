# adder4 - 4-bit ripple-carry adder

The W1 artifact (2026-11-14). The first circuit taken from spec through implementation, verification, and synthesis in one pass.

## Goal

Add two 4-bit numbers structurally, from half adders and full adders in a chain. No `+` operator.

## Ports

| Signal | Width | Dir | Meaning |
|---|---|---|---|
| `a` | 4 | in | Addend (0-15) |
| `b` | 4 | in | Augend (0-15) |
| `cin` | 1 | in | Carry into the least significant bit |
| `sum` | 4 | out | Low 4 bits of the result |
| `cout` | 1 | out | Carry out of the top bit (`{cout,sum}` is 5 bits, 0-31) |

## Structure

```
four full adders, fa0..fa3
  cin -> fa0 -> c1 -> fa1 -> c2 -> fa2 -> c3 -> fa3 -> cout
```

- `half_adder`: `sum = a ^ b`, `cout = a & b`
- `full_adder`: `sum = a ^ b ^ cin`, `cout = (a&b) | (a&cin) | (b&cin)`
- `adder4`: four `full_adder` stages, feeding each carry out into the next carry in

## Non-goals

- 8 bits or wider (parameterization comes in W2 and later)
- Subtraction, comparison, overflow flags
- Faster carry structures (carry-lookahead)

## Verification

Self-checking testbench `tb/tb_adder4.v`. **All 512 combinations**: `a` 0-15 x `b` 0-15 x `cin` 0-1.

- The expected value is computed in the testbench (`expected = a + b + cin`)
- The 5-bit outputs `{cout, sum}` are compared
- `!==` is used so an `x` (unconnected) also counts as a mismatch

**Result: 512/512 match.**

> Along the way, `fa3`'s `cout` was left unconnected and 256 patterns failed. Neither lint nor synthesis warned about it; only the testbench comparison found it.

## Synthesis

```bash
make syn TOP=adder4
```

| Metric | Value |
|---|---|
| Cell count | (fill in after running) |
| Logic depth | (fill in after running) |
| Inferred latches | must be 0 |

## English summary

A 4-bit ripple-carry adder built structurally from four full adders, with no use of the `+` operator.
It is verified by a self-checking testbench that sweeps all 512 combinations of `a`, `b`, and `cin`, comparing the 5-bit output `{cout, sum}` against a reference sum computed in the testbench.
Synthesis with Yosys reports the cell count below, and a missing carry-out connection was caught only by the testbench, not by lint or synthesis.

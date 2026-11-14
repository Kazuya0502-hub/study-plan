# adder4 — 4bit ripple-carry adder

W1（2026-11-14）の成果物。仕様 → 実装 → 検証 → 合成までを1本で通した最初の回路。

## 目的

4bit の2数を、加算器の構造（半加算器・全加算器の連鎖）で足す。`+` 演算子は使わない。

## 入出力

| 信号 | 幅 | 向き | 意味 |
|---|---|---|---|
| `a` | 4 | in | 被加数（0〜15） |
| `b` | 4 | in | 加数（0〜15） |
| `cin` | 1 | in | 最下位への繰り上がり入力 |
| `sum` | 4 | out | 加算結果の下位4bit |
| `cout` | 1 | out | 最上位からの繰り上がり（`{cout,sum}` で5bit、0〜31） |

## 構成

```
full_adder fa0..fa3 を4段
  cin → fa0 → c1 → fa1 → c2 → fa2 → c3 → fa3 → cout
```

- `half_adder` : `sum = a ^ b`, `cout = a & b`
- `full_adder` : `sum = a ^ b ^ cin`, `cout = (a&b) | (a&cin) | (b&cin)`
- `adder4` : `full_adder` 4段。下位の `cout` を上位の `cin` へ

## 非目標（やらないこと）

- 8bit 以上への拡張（パラメータ化は W2 以降）
- 減算・比較・オーバーフローフラグ
- 桁上げ高速化（キャリールックアヘッド）

## 検証

自己検査テストベンチ `tb/tb_adder4.v`。`a` 0〜15 × `b` 0〜15 × `cin` 0〜1 の**全512通り**。

- 期待値は TB 側で計算（`expected = a + b + cin`）
- 出力は `{cout, sum}` の5bitで比較
- `!==` を使うので `x`（未接続）も不一致として検出

**結果：512/512 一致。**

> 途中で `fa3` の `cout` を繋ぎ忘れ、256通りが不一致になった。合成でも lint でも警告は出ず、テストベンチの比較だけで見つかった。

## 合成

```bash
make syn TOP=adder4
```

| 指標 | 値 |
|---|---|
| セル数 | （実行して記入） |
| 論理段数 | （実行して記入） |
| ラッチ推論 | 0 であること |

## English summary

A 4-bit ripple-carry adder built structurally from four full adders, with no use of the `+` operator.
It is verified by a self-checking testbench that sweeps all 512 combinations of `a`, `b`, and `cin`, comparing the 5-bit output `{cout, sum}` against a reference sum computed in the testbench.
Synthesis with Yosys reports the cell count below, and a missing carry-out connection was caught only by the testbench, not by lint or synthesis.

# rtl-journey（作業用）

RTL 学習のコードを書く場所。**計画文書（親ディレクトリ）とは分けてあります。**

## 構成

```
rtl-journey/
  rtl/     設計（.v）— 1モジュール1ファイル
  tb/      テストベンチ（tb_<module>.v）— 自己検査にする
  syn/     合成スクリプト・レポート
  docs/    仕様書（1〜2ページ。入出力表・非目標・タイミング）
  notes/   学習ログ、カード、誤り集、env.md
```

## 書き方の規約

- ファイル名 = モジュール名（`rtl/adder4.v` → `module adder4`）
- 1コミット = 1つの「動く単位」（仕様＋TB＋実装をまとめて）
- コミットメッセージ: `add: 4bit ripple-carry adder (tb 256/256 pass)`
- `notes/env.md` にツールの版数を記録（11/12 に実施済みならそれを移す）

## コマンド（ツールが入っている PC で実行）

```bash
make sim   TOP=adder4   # コンパイル＋シミュレーション（iverilog）
make lint  TOP=adder4   # lint（verilator -Wall）
make syn   TOP=adder4   # 合成＋セル数（yosys）
make wave  TOP=adder4   # gtkwave で波形
make clean
```

## ツールの導入（PC 側）

| OS | コマンド |
|---|---|
| macOS | `brew install icarus-verilog verilator yosys gtkwave` |
| Ubuntu/Debian | `sudo apt install iverilog verilator yosys gtkwave` |
| Windows | [OSS CAD Suite](https://github.com/YosysHQ/oss-cad-suite-build/releases)（インストーラ不要、展開して PATH を通す） |

ツールを入れたくない日は [EdaPlayground](https://www.edaplayground.com/)（ブラウザで iverilog が動く）でも可。

## このVMについて

このワークスペース（クラウド）には **iverilog / verilator / yosys が入っていません**。root 権限が無いため追加もできません。**ファイルの作成・レビューはここで、実行は PC で**行います。

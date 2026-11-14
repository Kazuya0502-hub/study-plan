# 実際に必要になる環境 — 一式

「いつ・何が要るか」を6層に分けて1枚にまとめました。前半（第1〜3層）は**今日から必要**、後半（第4〜5層）は**編入後・就職後**に必要になります。第6層は手続きと費用です。

- 対象：2026年11月13日時点
- 前提：Windows 11 + WSL2(Ubuntu) を使っている（計画書の前提どおり）
- 結論：**自習環境はすべて無料の OSS で足ります。** 有料なのは Tiny Tapeout（€385）と、試験料・出願料・ビザ関連だけです。

---

## 第1層：今すぐ必要（W1〜W9／2026年11月〜2027年1月）

### 1.1 ハードウェア

| 項目 | 最低 | 推奨 | 理由 |
|---|---|---|---|
| RAM | 8 GB | **16 GB（新規購入なら32 GB）** | Verilator のビルドと OpenROAD は 16 GB を超えると楽 |
| CPU | 4 コア | 6〜8 コア | シミュレーションと合成はシングルスレッド寄り。コア数より**シングル性能** |
| ストレージ | 空き 30 GB | **空き 100 GB（SSD）** | WSL2 の仮想ディスクは自動で肥大化する。OpenLane/PDK で 40 GB 使う |
| GPU | 不要 | 不要 | 論理設計に GPU は要らない |
| OS | Windows 11（WSLg 必須） | 同左 | GTKWave などの GUI を WSL から出すのに WSLg が要る |

> **買い足しの判断**：今の PC で WSL2 が動き、RAM が 8 GB 以上なら**買わない**。8 GB で詰まったら RAM 増設（ノートなら買い替え）を検討。**FPGA ボードは今は不要**です（第3層の任意項目）。

### 1.2 WSL2 の設定（最初にやる3つ）

```bash
# Windows 側（PowerShell・管理者）
wsl --install -d Ubuntu-24.04
wsl --set-default-version 2
```

`C:\Users\<name>\.wslconfig`（メモリ上限を明示。放置すると Windows 側が固まる）:
```ini
[wsl2]
memory=8GB
processors=4
swap=4GB
```

`/etc/wsl.conf`（Docker を使う第3層で systemd が要る）:
```ini
[boot]
systemd=true
```

**重要**：プロジェクトは `~/work` に置く。`/mnt/c/...` は I/O が 5〜10倍遅く、`iverilog` のビルドが体感で壊滅します。

### 1.3 インストールするもの（すべて無料）

```bash
sudo apt update && sudo apt install -y \
  build-essential git make python3 python3-venv python3-pip \
  iverilog verilator gtkwave yosys \
  zlib1g-dev libreadline-dev pkg-config clang \
  jq ripgrep
```

| ツール | 用途 | 代替 |
|---|---|---|
| **Icarus Verilog** | 高速な機能シミュレーション、初心者向け | Verilator（速いが制約が多い） |
| **Verilator 5.x** | lint（`-Wall`）＋高速シミュレーション | — |
| **Yosys** | 論理合成、面積・セル数の測定、ラッチ推論の検出 | — |
| **GTKWave** | 波形閲覧 | **Surfer**（Rust 製。UX が良く、大きい波形に強い） |
| **Verible** | SystemVerilog の lint・format（CHIPS Alliance） | — |
| **OSS CAD Suite**（YosysHQ） | yosys / sby / yosys-smtbmc / nextpnr / gtkwave を**バージョン固定で一括**導入 | apt 版は版差で synth スクリプトが壊れやすい |

**推奨**：`yosys` と `sby`（形式検証）は **OSS CAD Suite** から入れる。apt の Yosys は古く、`read_verilog -sv` の挙動が版で変わります。
<https://github.com/YosysHQ/oss-cad-suite-build/releases>

### 1.4 エディタとアカウント

| 項目 | 内容 |
|---|---|
| エディタ | **VS Code + WSL 拡張**（`ms-vscode-remote.remote-wsl`） |
| 拡張 | `mshr-h.veriloghdl`（Verilator を lint に接続）、`Surfer` または WaveTrace |
| アカウント | **GitHub**（SSH 鍵を登録）、**ASSIST**（編入要件の確認に必須）、UC／Cal State Apply は2027年に作成 |
| リポジトリ規約 | `rtl/ tb/ syn/ docs/ notes/` と `Makefile`（`lint / sim / wave / syn / test` の5ターゲット） |
| `.gitattributes` | `* text=auto eol=lf`（Windows 側の CRLF 混入を防ぐ） |

### 1.5 点検

このリポジトリの `env/setup-check.sh` を実行すると、上のツールが入っているかと版数が一覧で出ます。

```bash
bash env/setup-check.sh
```

**W1（11/12）の「環境の版数記録」はこのスクリプトの出力を `notes/env.md` に貼るだけで完了**します。

---

## 第2層：CPU と検証のフェーズ（W10〜W23／2027年1月〜4月）

第1層に**追加**するもの。ここで RV32I を書くので、クロスコンパイラが要ります。

```bash
sudo apt install -y gcc-riscv64-unknown-elf binutils-riscv64-unknown-elf
```

| ツール | 用途 | 備考 |
|---|---|---|
| **riscv64-unknown-elf-gcc** | テストプログラム（C/アセンブリ）を機械語に変換、`$readmemh` 用の hex 生成 | `-march=rv32i -mabi=ilp32` |
| **riscv-tests** | 公式の ISA テスト（W31 で使う） | GitHub から取得。ライセンス確認 |
| **spike / pk**（任意） | 参照実装。期待値モデルの代わりになる | 無くても Python モデルで足りる |
| **cocotb**（任意） | Python でテストベンチを書く | Verilator/Icarus と接続。学習コストは中 |
| **SymbiYosys（sby）+ z3 / yices / boolector** | 形式検証（W21） | OSS CAD Suite に同梱 |
| **Surfer** | 波形 | GTKWave より快適 |

### SVA（アサーション）の現実

- **Icarus の SVA 対応は限定的**（同時アサーションの一部のみ）。
- **Verilator 5 はサブセット対応**（`--assert` が必要）。
- 本格的な SVA（`|->`、`##`、プロパティ）は**商用（VCS / Questa）**の領域。
- **代替**：①即時アサーション（`assert (...)`）で書く、②SymbiYosys で性質を証明する、の2つで代替できます。

> この制約を知らずに「SVA を書け」と言われると詰まります。**「OSS では即時アサーション＋形式検証で代替した」と説明できることが、むしろ面接で強い**です。

---

## 第3層：合成・タイミング・tapeout（W24〜W41／2027年4月〜8月）

| ツール | 用途 | 導入方法 | 目安容量 |
|---|---|---|---|
| **Yosys + abc** | 論理合成、面積・段数 | OSS CAD Suite | 1 GB |
| **OpenSTA** | 静的タイミング解析（単体で動く。軽い） | ビルド or OSS CAD Suite | 1 GB |
| **OpenROAD** | フロアプラン〜配置配線〜STA の一気通貫 | ビルド（重い） | 10 GB+ |
| **OpenLane 2 + sky130 PDK** | 実務に近いフローを Docker で再現 | `pip install openlane` + `volare`（PDK 取得） | **40 GB** |
| **Docker Desktop** | OpenLane の実行 | WSL2 バックエンド＋systemd | 5 GB |
| **magic / klayout / netgen** | DRC・LVS・GDS 閲覧 | OpenLane のイメージに同梱 | — |
| **GitHub Actions** | Tiny Tapeout の GDS ビルド（クラウドで実行） | 無料枠で足りる | — |

### Tiny Tapeout に必要なもの

| 項目 | 内容 |
|---|---|
| アカウント | <https://app.tinytapeout.com> |
| テンプレート | Verilog 提出用（`ttsky-verilog-template` / `ttgf-verilog-template`）を fork |
| 費用 | **1タイル €70 ＋ DevKit €300 ＋ 送料 €15 ＝ €385**（補助 PCB が出る回は安くなる） |
| 締切の目安 | シャトルは2〜3か月ごと。**2027年3月（TTIHP27a）／4月（TTGF27a）**が候補 |
| 提出物 | GitHub リポジトリ＋GDS（Actions が生成）＋ドキュメント（README、ピン配置、動作説明） |

### 任意（無くても計画は成立する）

- **FPGA ボード**：Tang Nano 9K（¥2,000〜3,000）や DE10-Lite。実機で動かす体験は面接で話せるが、**ASIC の代替にはならない**。
- **Vivado / Quartus（無料の WebPACK 版）**：FPGA をする場合のみ。インストールが数十 GB なので**後回し**。

### リソースの現実

- OpenROAD は **16 GB RAM を要求**します。8 GB だと落ちます。
- 手元が厳しければ、**大学のクラスタ（編入後）**か **GitHub Codespaces** で回す。今は「Yosys＋OpenSTA まで」で十分。

---

## 第4層：編入後の大学環境（2028年9月〜）

ここは**自分で買うものではありません**。大学が提供するものを「使い倒す」対象です。

| 環境 | 中身 | いつ使うか |
|---|---|---|
| **Linux クラスタ** | SSH、VPN、`module load`、Slurm/LSF のバッチ投入、ストレージ割当 | 授業の課題、研究、大きい合成 |
| **商用 EDA ライセンス**（大学プログラム経由） | Cadence（Virtuoso、Genus、Innovus、Tempest）、Synopsys（VCS、Design Compiler、PrimeTime、IC Compiler）、Siemens（Questa、Calibre）、Ansys、MATLAB | 授業・研究。**ライセンスは学内限定で持ち出せない** |
| **FPGA / 測定器** | Xilinx・Intel のボード、オシロ、ロジックアナライザ、電源 | 実験科目、卒研 |
| **論文** | IEEE Xplore、ACM DL（図書館契約） | 卒研、面接の下調べ |
| **教室・研究室** | 教員のオフィスアワー、研究グループ | 推薦状、研究参加 |

> **戦略**：商用ツールは「編入後に触れる」ので、**今は OSS で原理を理解しておく**のが正解。OSS で Yosys/OpenSTA を回した経験は、商用ツールに移ったときの理解速度に直結します。逆に、今から Vivado を入れて FPGA だけやると、ASIC のフロー（合成・STA・DFT）が抜けたままになります。

---

## 第5層：就職後の実務環境（2030年〜）

| 分類 | 具体的なもの |
|---|---|
| RTL / 検証 | Verilog、SystemVerilog、UVM、VCS / Xcelium / Questa、Verdi / DVE |
| lint / CDC / 形式 | SpyGlass / VC SpyGlass、JasperGold / VC Formal |
| 合成 / STA | Design Compiler / Genus、PrimeTime / Tempus |
| 物理設計 | Innovus / ICC2、Calibre、StarRC |
| スクリプト | **Tcl**（ほぼ必須）、Python、Perl、Make、bash |
| 開発基盤 | Linux CLI の操作、Git / Perforce、Jenkins / CI、Jira、社内 VPN、ライセンスサーバ |
| 計算基盤 | LSF / Slurm のジョブ投入、大容量ストレージ |
| 語学 | 英語のレビュー・仕様書・会議（日英併記の現場が多い） |

**今のうちに効くもの**：Tcl と Make、Linux CLI、Git の規律。この4つは**就職後に一番差がつく**のに、計画に入れると地味で後回しにされがちです。**W22 の合成スクリプトを Tcl/Make で書く**のが最短の投資になります。

---

## 第6層：手続き・アカウント・費用

### 6.1 アカウント（作る時期つき）

| 時期 | 作るもの |
|---|---|
| 2026/11 | GitHub、ASSIST（要件確認用）、LinkedIn（公開制作物の置き場） |
| 2027/6〜8 | IELTS または TOEFL の受験アカウント、College Board（Yale 用 SAT が必要な場合） |
| 2027/9 | UC 出願アカウント、Cal State Apply、Common App（Cornell）、Coalition/Scoir（Columbia）、CSS Profile（Cornell の aid） |
| 2027/12 | 各校のポータル（推薦状の送付状況の確認） |
| 2028/4〜6 | I-20 の受領、SEVIS の移管手続き |
| 2029/1〜 | マイナビ／リクナビ等（日本就活）、各社の採用サイト |

### 6.2 ビザ・移民（F-1 を持っている前提）

| 項目 | 事実 | 注意 |
|---|---|---|
| **SEVIS I-901** | F-1 は **$350** | **CCC → UC の SEVIS レコード移管なら再納付は不要**（8 CFR 214.13(b)：transfer は新規納付の対象外） |
| **ビザ申請料（MRV）** | **$185** | 新しいビザが必要なとき（日本に一時帰国して再取得する場合など） |
| ビザ管理費（キャンパス独自） | 例：UCSD は留学生の初回入学時に**$200**の一回限り | 校ごとに有無と額が違う |
| 健康保険 | 留学生は SHIP 加入が原則。年 $3,000〜5,000 程度（COA に含まれる） | 免除申請は条件が厳しい |
| SSN | キャンパス内就労・OPT で必要 | 学内ジョブは F-1 でも可 |

### 6.3 実費（自習そのものは無料）

| 項目 | 金額 | 時期 |
|---|---|---|
| 自習環境（第1〜3層の OSS） | **¥0** | 今すぐ |
| Tiny Tapeout | **€385**（≒¥60,000） | 2027/5〜7 |
| IELTS | ¥25,000〜28,000（**要確認**） | 2027/8 |
| TOEFL iBT | US$200 前後（**要確認**） | 2027/8（Cornell 用） |
| UC 出願料 | **$95/校**（留学生） × 5校 = **$475** | 2027/10〜11 |
| Cal State Apply | $70/校 前後（**要確認**）× 2〜3校 | 2027/10〜11 |
| Cornell 出願料 | $85 | 2028/3 |
| Columbia / Princeton | $85 / $75 前後（**要確認**） | 2028/3 |
| CSS Profile（Cornell の aid） | $25 ＋ $16/校（**要確認**） | 2028/2 |
| SEVIS 再納付 | **$0**（移管のため） | — |
| ビザ再取得（必要時） | $185 | 2028/夏 |
| **編入後の学費・生活費** | **2年で $176,000〜$202,000** | 2028/9〜2030/6 |

> **学費が桁違い**であることが、この表の唯一の重要点です。**自習環境は6万円で済み、学費は2,700万円**。だから `transfer-strategy-v3.md` §4 の資金計画が最優先になります。

---

## 最小構成と推奨構成

| 構成 | 中身 | 費用 | これで何ができるか |
|---|---|---|---|
| **最小** | 既存 PC＋WSL2＋apt の OSS のみ | **¥0** | フェーズA〜B のすべて（ALU、FIFO、UART、RV32I、5段パイプライン、Yosys 合成） |
| **推奨** | 上記＋OSS CAD Suite＋Surfer＋Verible＋16 GB RAM | ¥0〜（RAM 増設時のみ） | 上記＋形式検証＋lint 規律＋波形の快適化 |
| **tapeout** | 上記＋Docker＋OpenLane＋sky130 PDK＋TT 提出 | **€385＋40 GB** | GDS 生成と実チップ提出 |
| **贅沢** | 上記＋FPGA ボード＋32 GB RAM | ＋¥10,000〜 | 実機での動作確認（任意） |

**フェーズAとBは、最小構成で完全に足ります。** 今の環境で足りないのは RAM とディスクだけ、という可能性が高いです。

---

## つまずきポイント（先に潰しておく）

| 症状 | 原因 | 対処 |
|---|---|---|
| シミュレーションが異常に遅い | プロジェクトが `/mnt/c/` にある | `~/work` に移す |
| `iverilog` が CRLF でエラー | Windows 側のエディタが CRLF 保存 | `.gitattributes` に `* text=auto eol=lf` |
| GTKWave の窓が出ない | WSLg が無い（Win10 以前） | Windows 11 に上げる、または VcXsrv |
| `yosys` の挙動が資料と違う | apt 版が古い | OSS CAD Suite に切り替える |
| SVA がコンパイルできない | Icarus の SVA 対応が限定的 | 即時アサーション＋SymbiYosys で代替 |
| Docker が起動しない | systemd が無効 | `/etc/wsl.conf` に `systemd=true`、`wsl --shutdown` で再起動 |
| WSL2 のディスクが肥大化 | 仮想ディスクが自動縮小しない | `wsl --manage <distro> --set-sparse true`、または手動で `diskpart` 圧縮 |
| Verilator のビルドがメモリ不足 | `-j` を上げすぎ | `-j2`〜`-j4` に落とす、`.wslconfig` の memory を増やす |

---

## 今日やる3コマンド

```bash
# 1) 点検（このリポジトリ）
bash env/setup-check.sh

# 2) 不足分の導入（Ubuntu）
sudo apt update && sudo apt install -y build-essential git make python3 python3-venv \
  iverilog verilator gtkwave yosys zlib1g-dev libreadline-dev pkg-config

# 3) 出力をそのまま notes/env.md に貼る（W1 のタスクが1つ終わる）
mkdir -p notes && bash env/setup-check.sh | tee notes/env.md
```

---

## 根拠

- SEVIS I-901 の額と、transfer 時の再納付不要：<https://www.ice.gov/sevis/i901>／<https://www.ecfr.gov/current/title-8/section-214.13>
- ビザ申請料（MRV）$185：米国国務省の手数料表（2026年10月確認）
- UC 出願料 $80／留学生 $95：<https://admissions.berkeley.edu/apply-to-berkeley>
- キャンパス独自のビザ管理費の例（UCSD $200）：<https://students.ucsd.edu/_files/registrar/international-student-visa-admin-fee-2026.pdf>
- Tiny Tapeout の料金：<https://app.tinytapeout.com/calculator?tiles=1&pcbs=1>／シャトル日程 <https://tinytapeout.com/chips>
- OSS CAD Suite：<https://github.com/YosysHQ/oss-cad-suite-build/releases>
- OpenLane 2 / sky130：<https://github.com/efabless/openlane2>
- Verible：<https://github.com/chipsalliance/verible>

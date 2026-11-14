# 編入戦略 v3 — 指摘・再設計・伴奏の設計

対象：2026年11月13日時点／2028年秋編入（UC出願 2027年11月、私立 2028年3月）

---

## 0. 結論（先に3つ）

1. **「確実に編入」は、合格率100%を狙うことでは達成できません。** 達成できるのは「(a) 必ず行ける学校を1校確保する、(b) 第1志望群の合格確率を最大化する、(c) 資金で詰まない」の3点を確定させることです。前版は (a) を UC Davis TAG に置いていましたが、**TAG は1校にしか出せず、工学部で使えるのは実質 Davis だけ**なので、保険が1本しかありませんでした。
2. **最大の穴は資金です。** UC は留学生にニードベース援助を出しません。Davis $88,279/年、Berkeley 約 $93,944/年、Cornell $99,734/年、Columbia $100,884/年。**2年で 1,800〜2,000万円**（円換算155円）。これが計画に存在していませんでした。逆に、**Princeton・Harvard・Yale・MIT・Dartmouth は留学生も need-blind で全額ニード援助**なので、資金面の勝ち筋はアイビー側にあります。
3. **GPA の想定が甘く、履修量が過大です。** Davis CPE の合格者 middle 50% は 3.65–3.92、Berkeley は 3.68–4.00。前版の「目標3.8・下限3.5」では **TAG の 3.50 が下限ギリギリ**です。しかも4学期で必修20科目前後をこなす必要があり、**週18時間の自習と両立しません**。

---

## 1. 私にできる伴奏／できない伴奏

### できること（毎回のセッションで実際に回せる）

| 場面 | 具体的に何をするか |
|---|---|
| 日曜の週次テスト | 答案を貼ってもらえば採点し、「説明が成立しているか」で部分点を付ける。誤りを4分類（知識不足／不注意／設計ミス／検証漏れ）に振り分ける |
| 仕様書レビュー | 1ページ仕様の「非目標」「前提」「検証方針」の抜けを指摘する。曖昧な入出力定義を潰す |
| RTL レビュー | Verilog/SystemVerilog を貼ってもらえば、このワークスペースの iverilog / Verilator / Yosys で **lint・シミュレーション・合成まで実行**して、ラッチ推論・組み合わせループ・ビット幅を指摘する |
| テストベンチ設計 | 自己検査TBの雛形を書き、カバレッジ指標（命令種別×ハザード種別）を設計する |
| トレードオフ表 | Yosys の面積・段数の測定スクリプトを用意し、表と英語3〜5文の選定理由を添削する |
| 模擬面接 | 30問を1問ずつ出し、30秒〜2分の回答に対して「何が抜けたか」を返す |
| エッセイ | Columbia の400〜600語、Cornell の supplement、UC の PIQ 4本を、事実の具体性で添削する |
| 編入要件の再確認 | 毎年8月の TAG 更新、各校の設問変更を調べ直す（今回そうしたように） |
| 進捗の維持 | ワークスペースに置いた計画・カード・誤り集・活動ログを次回読んで続きから進める |

### できないこと（ここを期待されると計画が壊れる）

- **通知・リマインドはできません。** 私から「今週やりましたか」と送ることはできません。ターンが終われば私は止まります。**催促の代わりはカレンダー**（Google カレンダー等）に任せてください。
- **LMC のポータル、成績、履修登録、締切提出**は触れません。書類の提出も本人作業です。
- **記憶はファイルに書いた分だけ。** 会話をまたぐと別ワークスペースになるため、`notes/` に残っていないことは引き継げません。
- **商用ツール（VCS、Design Compiler、PrimeTime、Innovus）**や実機・FPGA での検証はできません。OSS（iverilog/Verilator/Yosys/SymbiYosys/OpenSTA）の範囲です。
- **合格を保証する助言はできません。** 出典のない「受かる」は言いません。

> 運用の提案：週1回（日曜）に「今週の記録」を貼ってもらい、私が採点・分類・翌週の計画を返す。月1回（月末）にゲート判定。これを20か月続ける形が、私がいちばん役に立つ使い方です。

---

## 2. おかしなポイント（根拠つき・優先度順）

### A. 編入の成否に直結するもの

> **v3.1 修正（2026/11/13、本人確認と再調査による）**
> - **UCSC の Baskin 工学部は TAG 対象外ではありません。** EE/CE も TAG 対象で、TAG 3.0＋スクリーニング 2.8。
> - **UCI の EE/CE 除外は「2028年秋入学から」**なので、あなたのサイクルでは使えない（Fall 2027 では使えた）。
> - **UCR は TAG が EE 3.00／CE 3.30、UC Merced は 3.0** で、**Davis の 3.50 より確度が高い**。
> - **LMC には PHY 9D（現代物理）相当がない**ことが確認された。Davis EE は 9D 必須なので、**専攻準備は外部調達が必要**（→ `course-plan-3-semesters.md` §3）。
> - **UC Davis は「編入前の夏学期の履修は入学要件に数えない」と明記**している。必修を夏に置けないため、**MATH 210 が2026秋に終わっていることが事実上の必須条件**。



| # | 指摘 | 根拠 | 影響 | 修正 |
|---|---|---|---|---|
| A1 | **TAG は1校にしか出せない。** しかも工学部で TAG が使えるのは実質 UC Davis だけ | 6校が TAG 実施（Davis/Irvine/Merced/Riverside/Santa Barbara/Santa Cruz）。**UCSC の Baskin 工学部は TAG 対象外**、**UCI の TAG は EE/CPE を除外**。Davis 工学部 TAG は累積・専攻準備とも **3.50**。[TAG matrix](https://admission.universityofcalifornia.edu/counselors/_files/documents/uc-tag-matrix.pdf)／[Davis TAG](https://www.ucdavis.edu/admissions/undergraduate/transfer/transfer-admission-guarantee/requirements)／[UCI TAG](https://admissions.uci.edu/tag) | 「確実枠」が1本しかない。Davis の 3.50 を割ると保険が消える | **真の安全校を UC の外に置く**（下の A2） |
| A2 | **真の安全校は SJSU。** 「要件科目を満たした CSU 適格者は全員合格」と公式が明記 | SJSU EE：Math 30・31・Physics 50 を完了した適格者は全員合格。CPE は同上＋CMPE/EE 30。[SJSU impaction](https://www.sjsu.edu/admissions/impaction/transfer-impaction-results/index.php) | これがあるから難関校に出られる。しかもシリコンバレーのハードウェア採用に最强 | 出願リストに必ず入れる。**GPA 3.0 台でも成立する唯一の枠** |
| A3 | **GPA 目標が低い。** Berkeley 合格者の middle 50% は 3.68–4.00、Davis CPE は 3.65–3.92、UCI EE は 3.66–3.93 | [UC 編入データ](https://admission.universityofcalifornia.edu/campuses-majors/davis/transfer-admit-data.html)（Davis 全体58.3%、3.45–3.92）／専攻別は UC InfoCenter「Transfers by major」由来の第三者抽出（Davis CPE 29%、UCI EE 37%、UCSC CPE 75%） | 「目標3.8」では Davis CPE・UCI EE の中央値に届かない | **目標 3.90、下限 3.70**。TAG の 3.50 は「床」ではなく「余裕を持って超える線」 |
| A4 | **4学期で必修20科目は過大。** しかも UC は「専攻準備は春学期末まで、夏学期は数えない」 | Davis EE 必修：CHE 2A、ENG 17、EEC 7、MAT 21A–D、MAT 22A/B、PHY 9A–D（13科目）＋7科目パターン（英作文2・人文社科4等） | 1学期5科目×4学期。GPA 3.9 と両立しにくい | **2027年夏学期を圧力弁に使う＋学期中の RTL を週6–8時間に落とす**（下の §5・§9） |
| A5 | **IGETC を取る前提になっている。** 工学部では IGETC は非推奨、Berkeley 工学部は**受理しない** | 「IGETC は入学要件ではない」。[campus guidance](https://admission.universityofcalifornia.edu/admission-requirements/transfer-requirements/preparing-to-transfer/general-education-igetc/campus-guidance.html)：Berkeley 工学部は「IGETC を breadth の完成として受理しない」、Davis は「B.S. と selective major には非推奨」、UCSC Baskin も非推奨 | IGETC に時間を取られて専攻準備が薄くなる＝致命傷 | **7科目パターン（必須）＋専攻準備を優先。IGETC は追わない** |
| A6 | **英語要件の見落とし。** UC は CCC の英作文2科目で TOEFL 不要だが、**Cornell は別** | UC：「UC 転送可能な英作文2科目を C 以上（UCLA/UCSD は B 以上）で取れば IELTS/DET/TOEFL は不要」[UC ELP](https://admission.universityofcalifornia.edu/admission-requirements/international-applicants/english-language-proficiency-toefl-ielts.html)。Cornell：免除は「過去4年間 English が教授言語」等に限られ、**TOEFL 100／IELTS 7.5／Duolingo 130** が必要 | 2028年1月になって Cornell 出願不可、が起こり得る | **2027年8〜9月に IELTS 7.5 または TOEFL 100 を取得**（1回で足りなければ2回） |
| A7 | **Penn 工学部は「1年分の単位で2年次入学」が原則**、Harvard は「2年超の在籍は不可」、Columbia は「4学期超は出願非推奨」 | [Penn eligibility](https://admissions.upenn.edu/how-to-apply/transfer-applicants/eligibility-credit-guidelines)／[Harvard](https://college.harvard.edu/admissions/apply/transfer-applicants)／[Columbia](https://undergrad.admissions.columbia.edu/apply/transfer) | 「10校に出せば10校で2年卒業」は成り立たない。**出願校ごとに卒業年が変わる** | 出願リストに「編入後の年数」列を必ず持つ（下の §3） |
| A8 | **Columbia の推薦は「大学教員2名」で、研究指導者・雇用主は不可。** 依頼が12月では遅い | [Columbia transfer](https://undergrad.admissions.columbia.edu/apply/transfer) | 大規模講義で顔が見えない教員に12月に頼むのは不利 | **2027年前半から、推薦候補2名の授業を取り、オフィスアワーに通う**（計画に組み込む） |
| A9 | **卒業 2030年6月 は 60% 程度。** UC 編入生の平均在籍は 2.32年 | [UC Accountability](https://accountability.universityofcalifornia.edu/2025/chapters/chapter-3.html)：2年以内卒業 約60%、4年以内 約89%。UCI は公式に「2年を超える場合がある」と明記 | 2030年6月卒で「2030年卒」として日本就活する前提が崩れると、内定辞退・再就職活動になる | **2030年12月／2031年6月を明示的なバッファ**に。2028年秋に「4学期で出る計画」を履修表で確認 |

### B. 事実誤り・過大な想定

| # | 前版の記述 | 正しい内容 | 出典 |
|---|---|---|---|
| B1 | 「Cornell は1年あたり最大33単位、合計66単位まで認定」 | **年間上限は公式に存在しない**。合計 **66単位（AP/IB 込み）**、Cornell で **最低60単位**の在籍が必要。ECE の学位は **126単位** なので 66＋60＝126 で4学期が算術上ちょうど成立（履修順序次第で延びる） | [Cornell transfer credit](https://catalog.cornell.edu/policies-disclosures/transfer-credit-policy/)／[ECE BS](https://catalog.cornell.edu/programs/electrical-computer-engineering-bs/) |
| B2 | 「Berkeley は最大70単位を移せる」 | 70 semester は **UC 全体の下位 division 上限**。超過分も**科目単位としては要件に使える**が、学位単位には加算されない | [UC transfer credit practice](https://admission.universityofcalifornia.edu/counselors/preparing-transfer-students/transfer-credit-practice.html) |
| B3 | 「自習は標準 週18時間」 | 学期中に18時間は過大。**学期中13時間（上限18）／テスト期4時間／長期休暇22時間**が現実的 | — （GPA 優先の設計判断） |
| B4 | 「Tiny Tapeout は費用次第で見送り」 | 料金は公開されている：**1タイル €70＋DevKit €300＋送料 €15＝€385**。シャトルは2〜3か月ごと（直近は SKY26d/e が 2026/11/30、GF26c/d が 2026/12/7、**2027年3月 TTIHP27a・4月 TTGF27a**） | [calculator](https://app.tinytapeout.com/calculator?tiles=1&pcbs=1)／[chips](https://tinytapeout.com/chips) |
| B5 | 「AI を使う練習は W13・W19 の2回」 | AI 時代の設計者像を掲げるなら年2回は少ない。**年4回（1月・3月・6月・10月）** | — |
| B6 | 「3年次編入」 | 米国に「3年次編入」という制度はなく、**junior standing（60 semester units）での入学**。呼び方の混同が「2年で必ず卒業」という過大な期待を生む | [UC basic requirements](https://admission.universityofcalifornia.edu/admission-requirements/transfer-requirements/preparing-to-transfer/basic-requirements.html) |
| B7 | 「単元1〜14学習済み → W1 で1〜7と8〜14を白紙要約」 | 2時間で両方は無理。**W1 は1〜7、W2 に8〜14** | — |
| B8 | 資金の記載が「今回は未確認」で終わっている | **UC は留学生に連邦・州・大学ニード援助を一切出さない**（UCOP の適格表で International は全項目 No）。Davis は **3.25 GPA 以上なら留学生も奨学金の対象**という唯一の明示。さらに **Cal. Ed. Code §66021.9 が 2027/6/30 でサンセット**（非州費のキャンパス奨学金の根拠） | [UCOP 適格表](https://www.law.berkeley.edu/wp-content/uploads/2023/12/Updated-AB350-Eligibility-Chart-1.pdf)／[Berkeley FA](https://financialaid.berkeley.edu/apply-now/international-students)／[Davis scholarships](https://financialaid.ucdavis.edu/frequently-asked-questions/scholarships) |

### C. 整合性の細部

| # | 指摘 | 修正 |
|---|---|---|
| C1 | フェーズC（夏の制作物）が2027年夏学期と全面衝突する | 夏学期の履修を**午前固定**、プロジェクトを**午後・夜**に置く。夏学期の単位数を12単位以下に抑える |
| C2 | 週次テストの「2〜4週前から3問」が、復習週と重なると負担過多 | 復習週は模試のみ（週次テストは休み） |
| C3 | 「2週続けて70%未達なら3割減」の判定が、テスト期と重なると必ず発動する | テスト期は判定を除外する（学期カレンダーに基づく除外週を先に決める） |
| C4 | 面接30問に「CDC・メタスタビリティ」が入っているが、計画にCDCの学習がない | W40 の単元19（並行性と同期）で補い、W21 で非同期FIFOの簡単な実装を1つ入れる |

---

## 3. 確実性の設計 — 4層ピラミッドと出願ポートフォリオ

「確実に編入する」を、確率の問題ではなく**構造の問題**に置き換えます。

```
第4層  宝くじ枠（ただし資金の勝ち筋）  Princeton / Yale / Harvard / MIT / Dartmouth
第3層  本命（GPA 3.7〜3.9 で勝負）      Berkeley / Cornell / Columbia / UCI
第2層  条件付き保証                     UC Davis TAG（3.50、1校のみ）
第1層  必ず行ける（GPA 3.0 台でも成立）  SJSU CPE / Cal Poly Pomona CPE
第0層  財務の実行可能性                 資金計画（§4）
```

### 出願ポートフォリオ（11校・5つの出願システム）

| 層 | 学校・専攻 | 出願 | 締切 | 編入後の年数 | 合格の見立て（公表値） |
|---|---|---|---|---|---|
| 1 | **SJSU Computer Engineering** | Cal State Apply | 2027/10〜11（要確認） | 2〜2.5年 | 要件科目4つで**全員合格**（公式） |
| 1 | Cal Poly Pomona CPE | Cal State Apply | 同上 | 2〜2.5年 | index 3,941 ≒ GPA 3.07 |
| 2 | **UC Davis EE または CPE**（TAG） | UC + TAG | TAG 9/1–30、UC 10/1–11/30 | 2年 | TAG 3.50（累積・専攻準備） |
| 3 | **UC Berkeley EECS/EE** | UC | 10/1–11/30 | 2〜2.5年 | 全体20.0%、GPA 3.68–4.00 |
| 3 | **UC Irvine EE** | UC | 同上 | 2〜3年 | EE 37%、3.66–3.93 |
| 3 | **Cornell ECE** | Common App | **3/15** | 2年（66＋60＝126） | 11.7%（864/7,381） |
| 3 | **Columbia Engineering** | Coalition | **3/1** | 2年（最大68pt） | 9.2%（453/4,909） |
| 4 | **Princeton**（工学部） | 独自 | **3/1** | 2年 | 1.8%（42/2,274）。**2026-27 の編入35人のうち32人がコミカレ** |
| 4 | Yale | 独自 | 3/1 | 2年 | 2.6%（45/1,747）。**SAT/ACT 必須** |
| 4 | MIT | 独自 | 3/1 | 2年 | 2.0%（35/1,713）。**在籍は最大5学期** |
| 4 | Dartmouth | 独自 | 3/1 | 2年 | 9.9%（68/689） |
| — | UC Santa Cruz CPE / UC Riverside EE（滑り止めの第2保険） | UC | 10/1–11/30 | 2〜3年 | UCSC CPE 75%／UCR EE 39% |

**出願システムは5つだけ**：UC（1本で複数校）／Cal State Apply（1本）／Common App（Cornell）／Coalition（Columbia）／独自（Princeton・Yale・MIT・Dartmouth のうち2校に絞る）。エッセイ本数が現実的なのは**11校が上限**です。

### なぜ UC を全部受けられるのか

UC は**1本の出願で複数キャンパスに出せる**ため、追加コストは出願料（留学生 $95/校）だけ。**Berkeley・UCI・UCSC・UCR を同時に出さない理由がありません**。

### TAG をどこに出すか（1校だけ）

| 選択肢 | 判定 |
|---|---|
| **UC Davis（EE または CPE）** | **本命**。3.50 を満たせば条件付き保証。工学部で TAG が使える実質唯一の有力校 |
| UC Riverside / UC Merced | 次点。競争が緩いので TAG なしでも通りやすい。**TAG 枠をここに使うのは機会損失** |
| UC Santa Cruz | **Baskin 工学部は TAG 対象外**（使えない） |
| UC Irvine | **TAG は EE/CPE を除外**（使えない） |

→ **TAG は Davis に出す。** ただし Davis は UC 出願でも併願するので、TAG が外れても通常審査で拾われる可能性が残ります（Davis 全体の編入合格率は 58.3%）。

---

## 4. 資金計画（計画の最大の穴）

### 4.1 数字を直視する

| 学校 | 年間総費用（非居住者） | 2年 | 留学生へのニード援助 |
|---|---|---|---|
| UC Davis | **$88,279** | 約 $176,600（約2,740万円） | **なし**（連邦・州・大学ニード援助すべて不可）。3.25 GPA 以上で奨学金の対象にはなる |
| UC Berkeley | **約 $93,944** | 約 $187,900（約2,910万円） | **なし**（一部の国際生向け奨学金は自動審査） |
| Cornell | **$99,734** | 約 $199,500（約3,090万円） | **あり**。need-aware だが、3/15 までに aid 申請すれば**100% need 充足** |
| Columbia | **$100,884** | 約 $201,800（約3,130万円） | 「extremely limited」。申請時に aid 希望を出した場合のみ |
| Princeton | 公表額は要確認 | — | **need-blind（留学生含む）＋全額ニード充足** |
| Harvard / Yale / MIT / Dartmouth | 同左 | — | **need-blind（留学生含む）＋全額ニード充足** |

出典：Davis [cost](https://financialaid.ucdavis.edu/undergraduate/cost/2627-entering)／Berkeley [cost](https://admissions.berkeley.edu/cost)＋NRST $39,270／Cornell [cost](https://finaid.cornell.edu/cost-to-attend)／Columbia [facts](https://cc-seas.financialaid.columbia.edu/eligibility/facts)／Princeton [FAQs](https://finaid.princeton.edu/faqs)／Harvard [transfer](https://college.harvard.edu/admissions/apply/transfer-applicants)／Yale [international](https://admissions.yale.edu/international-student-questions)／MIT [SFS](https://sfs.mit.edu/financial-aid-mit)／Dartmouth [need-blind](https://admissions.dartmouth.edu/glossary-term/need-blind-0)

### 4.2 三つの含意

1. **UC・Columbia は「合格しても行けない」可能性が高い。** 資金の裏づけがないまま第1志望に置くのは危険です。
2. **Cornell は例外的に「合格すれば行ける」。** need-aware（aid 希望が不利に働く）だが、**3/15 の aid 締切までに申請すれば 100% need 充足**。しかも「部分援助はしない」と明記。→ **資金面で最も現実的な上位校は Cornell**。
3. **Princeton の編入は「コミカレからのアクセス」を掲げている**（2026-27 の編入35人中32人がコミカレ）。**need-blind＋全額援助**なので、費用の心配なく受けられる唯一の超難関。出願する価値が最も高い「宝くじ」。

### 4.3 資金チェックリスト（2026年12月までに）

- [ ] 家庭の年間拠出可能額を、**4年分ではなく2年分**で確定する（UC は2年で約2,700万円）
- [ ] 日本の奨学金（JASSO 海外留学支援、企業奨学金、地方自治体）の**応募資格と時期**を調べる（多くは渡航1年前）
- [ ] 各校の Financial Aid に、**「international transfer は need-blind か」を書面で確認**する（Princeton・Harvard・MIT・Dartmouth は「全出願者」レベルでの表明しかなく、編入への適用は明記がない）
- [ ] **Cal. Ed. Code §66021.9 のサンセット（2027/6/30）**の扱いを、2027年8月に再確認する（延長されないと、UC の非居住者向けキャンパス奨学金の根拠が消える）
- [ ] 為替を ¥145 / ¥155 / ¥165 の3シナリオで試算する
- [ ] **「UC に受かったが資金が足りない」場合の順位**を、事前に決めておく（例：Cornell の aid 結果 → Princeton → SJSU）

---

## 5. 履修と成績の現実（4学期に何科目入るか）

### 5.1 UC Davis EE の必修を4学期に割る（案）

| 学期 | 科目（LMC 候補） | 単位数 | 備考 |
|---|---|---|---|
| 2026 秋 | 微積 I、英作文 I、化学＋実験、プログラミング入門 | 15–16 | GPA の土台。ここで A を落とすと後が苦しい |
| 2027 春 | 微積 II、英作文 II、物理（力学）＋実験、人文 | 16 | 7科目パターンの英作文を**この学期で完了**（UC の英語要件も同時に満たす） |
| 2027 夏 | 微積 III、物理（電磁気）＋実験 | 9–10 | **圧力弁**。夏学期は TAG の専攻準備に数えられないが、2028年春より前なので**単位としては有効**（要確認） |
| 2027 秋 | 線形代数、微分方程式、回路理論、人文/社科 | 16 | 専攻準備の山 |
| 2028 春 | 物理（波動・量子）＋実験、デジタル論理（あれば）、社科、予備 | 14–15 | **TAG の専攻準備はこの学期末で完了が条件** |

※ LMC の科目番号と各校の対応は ASSIST で確認（`MATH-210/220/230`、`PHYS-040/041/042`、`CHEM-025`、`ENGIN-045` が候補として挙がっているが、**Davis の PHY 9D（波動・量子）に対応する科目があるかは要確認**。ここが無いと TAG の専攻準備が完成しない）。

### 5.2 この履修表から出る3つの帰結

1. **学期中の RTL は週6–8時間が上限。** 16単位＋実験＋RTL 11時間は、GPA 3.9 と両立しません。**プロジェクトは夏と冬に集中**。
2. **2027年夏は「夏学期＋プロジェクト」で最も過密。** 夏学期を12単位以下に抑え、プロジェクトは午後・夜に置く。ここで体調を崩すと全体が崩れます。
3. **PHY 9D 相当（波動・量子）が LMC に無い場合、TAG は成立しない。** 近隣のコミカレ（Los Medanos から Diablo Valley、Contra Costa など）で取る必要が出ます。**2026年12月に ASSIST で確認**。

---

## 6. 英語要件（見落とすと出願できない）

| 出願先 | 要件 | 対応 |
|---|---|---|
| UC（Berkeley/Davis/UCI/UCSC/UCR） | **CCC の英作文2科目を C 以上**（UCLA/UCSD は B 以上）で TOEFL 不要 | 2027年春学期で完了（§5の履修表どおり） |
| Cornell | 免除は「過去4年間 English が教授言語」等のみ。**TOEFL 100／IELTS 7.5／Duolingo 130** | **2027年8〜9月に受験**。LMC 2年では免除されない |
| Columbia | 公式ページで個別確認が必要（未確認） | 2027年8月に確認。必要なら同一スコアを流用 |
| Princeton / Yale / MIT / Dartmouth | 各校の international ページで確認（Yale は SAT/ACT 必須） | 2027年8月に一括確認 |

> **行動**：**2027年8月に IELTS または TOEFL を1回受ける。** 英作文2科目で UC は通るので、負担は「私立5校のためだけ」の1回です。9月に再受験の余地を残します。

---

## 7. 出願カレンダー（確定日と要確認日を分ける）

| 日付 | やること | 状態 |
|---|---|---|
| 2026/12 | 資金計画の確定、ASSIST で PHY 9D 相当の有無を確認、LMC の学期日程確定 | **今すぐ** |
| 2027/5〜8 | 夏学期の履修＋プロジェクト。**エッセイ素材を集める**（PIQ の素材は夏に書く） | — |
| 2027/8 | **TAG 条件の更新確認**（毎年8月）。IELTS/TOEFL 受験。各校の2028年向け日程確認 | 要確認 |
| 2027/9/1〜30 | **TAG 申請（Davis）** | 確定（年次で変動） |
| 2027/10/1〜11/30 | **UC 出願**（Davis/Berkeley/UCI/UCSC/UCR）。PIQ 4本 | 確定 |
| 2027/10〜11 | **Cal State Apply**（SJSU・Cal Poly Pomona・Cal Poly SLO） | 要確認（CSU の締切は例年10〜12月） |
| 2027/12 | 推薦者2名に依頼（Columbia 用は**授業の教員**）。Cornell の College Report 依頼 | — |
| 2028/1 | **TAU（成績更新）1/31**。Columbia エッセイ初稿。Cornell supplement 初稿 | 確定 |
| 2028/2 | 私立の書類最終化。**Cornell の financial aid 申請（3/15 厳守）** | — |
| 2028/3/1 | **Columbia・Princeton・Yale・MIT・Dartmouth** | 確定（MIT は 3/1） |
| 2028/3/15 | **Cornell**（+ aid 締切）。Columbia の Curriculum Report は中間成績後に提出（4/15まで） | 確定 |
| 2028/4 | UC 結果。Columbia は 6/1 までに結果 | — |
| 2028/5 | 全結果を「費用・編入後の年数・卒業見込み」で比較 | — |
| 2028/6/1 | **UC の SIR 期限**（Columbia の結果発表期限と同日） | 確定 |

---

## 8. 卒業時期のバッファ

| シナリオ | 確率の目安 | 対応 |
|---|---|---|
| 2030年6月卒（4学期） | 約60%（UC 全体の2年以内卒業率） | 本計画。日本では「2030年卒」 |
| 2030年12月卒（5学期） | 約30% | 「2031年卒」扱い。**2029年秋の選考で「卒業時期未定」として応募し、確定後に更新**する運用にする |
| 2031年6月以降 | 約10% | インターン→return offer で拾う。新卒一括採用に依存しない |

**2028年9月（編入直後）に、履修表を組んで「4学期で出られるか」を学位監査（degree audit）で確認する。** ここで5学期と判明すれば、日本就活のスケジュールを1年後ろにずらす判断を、2028年12月までに行います。

---

## 9. 週の時間設計の修正

| 学期の種類 | 技術 | 復習 | 課外 | 計画・編入 | 合計 |
|---|---|---|---|---|---|
| 通常学期 | 6–8h | 2h | 2h | 1h | **11–13h** |
| 中間・期末 | 0–2h | 2h | 0–1h | 0.5h | **4h** |
| 長期休暇（冬・夏） | 18–20h | 2h | 1h | 1h | **22h**（上限25） |

前版の「標準18時間」は**長期休暇の数字**でした。学期中に18時間を課すと、GPA 3.9 の目標と正面衝突します。**学期中は「技術6–8時間」で十分**です。理由：編入審査で効くのは GPA と専攻準備の完成度であり、学期中の RTL 時間ではないからです。

---

## 10. 修正した週次（W1〜W9 の差分のみ）

| 週 | 前版v2 | v3 の修正 |
|---|---|---|
| W1（11/12–11/15） | 1〜7 と 8〜14 の白紙要約を同じ週に | **1〜7 のみ**。11/15 は「8〜14 の一覧を作るだけ（各単元2行）」＝洗い出しに留める |
| W2 | 組み合わせ回路25問 | 変更なし＋**8〜14 の白紙要約をここで実施** |
| W3（11/29 診断模試） | 1〜14 で75% | **80%**に引き上げ（学習済みのため）。未達なら W4 を補強 |
| W4 | 8bit ALU | 変更なし＋**ASSIST で PHY 9D 相当を確認するタスクを追加**（編入の致命点） |
| W5–W8 | 単元15・FIFO・UART | 変更なし。**W8 に IELTS/TOEFL の弱点診断（無料の公式練習）を30分** |
| W9 | 到達テスト G2 | 変更なし＋**資金計画の1枚を完成させる**（§4.3） |

**新規追加（W1 の 11/12 にやる3つ）**
1. `notes/admissions/` を作り、§2の指摘表を保存する（毎年8月に見返す）。
2. ASSIST で「Davis の PHY 9D に相当する LMC の科目」を検索する（無ければ近隣コミカレを調べる）。
3. SJSU の要件科目（Math 30・31、Physics 50、CMPE/EE 30）に相当する LMC の科目を特定する（**第1層の安全校を確保する作業**）。

---

## 11. 日本就職の学位要件（実データで見る）

| 根拠 | 内容 |
|---|---|
| キオクシアシステムズ 募集情報 | 初任給 **学部卒 333,400円／修士卒 364,900円**。応募要件は「大学（修士・学部）または高専を卒業見込み」。**学士でも応募可能** |
| メガチップス 2027年度募集要項 | 初任給 **学部卒 270,000円／修士卒 300,000円**。募集職種に「デジタル回路設計」 |
| NVIDIA「ASIC Design Engineer - New College Grad 2027」 | 要件は「micro-architecture と RTL（Verilog）の知識、ASIC フロー（RTL・検証・論理合成・タイミング解析）の理解」。**学士可**（Hardware Tools 系の職は修士以上） |

**結論**：学士でも RTL 設計の新卒枠はあります。ただし**初任給で月3万円前後の差**がつき、配属の選択肢も修士の方が広い。**修士の判断は 2028年12月**（§8の卒業時期と同時に決める）。

---

## 12. 未確認事項（更新版・優先度順）

| # | 事項 | 確認時期 | なぜ致命か |
|---|---|---|---|
| 1 | **LMC に Davis の PHY 9D（波動・量子）相当があるか** | 2026/12 | 無ければ TAG の専攻準備が完成しない |
| 2 | **Cal. Ed. Code §66021.9 のサンセット（2027/6/30）後の扱い** | 2027/8 | UC の非居住者向け奨学金の根拠が消える可能性 |
| 3 | **Princeton/Harvard/MIT/Dartmouth の「編入」への need-blind 適用** | 2027/8（書面で） | 資金計画の前提が変わる |
| 4 | Columbia の英語要件と2028年設問 | 2027/8 | 出願不可リスク |
| 5 | UC 2028年秋向け TAG 条件（Davis 工学部 3.50 の継続） | 2027/8 | 保険の有無が変わる |
| 6 | CSU（SJSU・CPP・SLO）の2028年秋向け締切と要件科目 | 2027/8 | 第1層の安全校の確保 |
| 7 | 夏学期の単位が Davis の専攻準備に数えられるか（「夏は数えない」の適用範囲） | 2027/3 | §5の履修表の前提 |
| 8 | 日本の奨学金（JASSO 海外留学支援等）の応募時期と資格 | 2027/1 | 資金計画の要 |
| 9 | 2030年卒／2031年卒の日本の新卒スケジュール | 2029/1 | 就活の起点 |
| 10 | UCSC CPE・UCR EE の2028年向け選考基準（screening） | 2027/8 | 第2保険の確度 |
| 11 | Yale の SAT/ACT 要件を編入留学生にどう適用するか | 2027/8 | 出願可否 |
| 12 | Cornell の TOEFL 新スケール（2026年1月以降）の点数 | 2027/6 | 目標点の設定 |

---

## 13. 次の7日でやること（順序つき）

1. **11/12–11/13**：`notes/admissions/` を作り、この文書の §2・§3 を保存する。
2. **11/13**：ASSIST で「LMC → UC Davis PHY 9D」「LMC → SJSU Math 30/31, Physics 50, CMPE/EE 30」を調べる。**見つからなければ、その時点で計画の修正が必要**（最重要）。
3. **11/14**：資金計画の1枚（§4.3 のチェックリスト）を、家庭と相談する前提で埋める。
4. **11/15**：W1 の白紙要約（単元1〜7）と、加算器の4点セット。
5. **11月中**：LMC の学期日程（期末週）を確定し、軽量週を固定する。

---

## 付録：根拠リンク一覧

- UC TAG：<https://admission.universityofcalifornia.edu/counselors/_files/documents/uc-tag-matrix.pdf>／<https://www.ucdavis.edu/admissions/undergraduate/transfer/transfer-admission-guarantee/requirements>／<https://admissions.uci.edu/tag>
- UC 基礎要件・単位上限：<https://admission.universityofcalifornia.edu/admission-requirements/transfer-requirements/preparing-to-transfer/basic-requirements.html>／<https://admission.universityofcalifornia.edu/counselors/preparing-transfer-students/transfer-credit-practice.html>
- IGETC の扱い（校別）：<https://admission.universityofcalifornia.edu/admission-requirements/transfer-requirements/preparing-to-transfer/general-education-igetc/campus-guidance.html>
- UC 英語要件：<https://admission.universityofcalifornia.edu/admission-requirements/international-applicants/english-language-proficiency-toefl-ielts.html>
- UC 留学生の援助適格（UCOP 表）：<https://www.law.berkeley.edu/wp-content/uploads/2023/12/Updated-AB350-Eligibility-Chart-1.pdf>
- UC 編入実績：<https://admission.universityofcalifornia.edu/campuses-majors/davis/transfer-admit-data.html>／<https://admission.universityofcalifornia.edu/counselors/_files/documents/ccc-transfer-application-data.pdf>
- UC 卒業までの年数：<https://accountability.universityofcalifornia.edu/2025/chapters/chapter-3.html>
- Cornell：<https://admissions.cornell.edu/how-to-apply/transfer-applicants>／<https://catalog.cornell.edu/policies-disclosures/transfer-credit-policy/>／<https://finaid.cornell.edu/cost-to-attend>／<https://irp.cornell.edu/wp-content/uploads/2026/09/Cornell-Common-Data-Set-2025-26.pdf>
- Columbia：<https://undergrad.admissions.columbia.edu/apply/transfer>／<https://cc-seas.financialaid.columbia.edu/eligibility/facts>
- アイビー編入：<https://admission.princeton.edu/transfer-students>／<https://college.harvard.edu/admissions/apply/transfer-applicants>／<https://admissions.yale.edu/transfer>／<https://mitadmissions.org/apply/transfer/transfer-eligibility>／<https://admissions.dartmouth.edu/glossary-term/eligibility-guidelines>／<https://admissions.upenn.edu/how-to-apply/transfer-applicants/eligibility-credit-guidelines>
- 安全校：<https://www.sjsu.edu/admissions/impaction/transfer-impaction-results/index.php>／<https://www.calpoly.edu/admissions/transfer-student/selection-criteria/transfer-student-profile>／<https://www.cpp.edu/admissions/transfer/transfer-student-profile.shtml>
- Tiny Tapeout：<https://app.tinytapeout.com/calculator?tiles=1&pcbs=1>／<https://tinytapeout.com/chips>
- 日本の新卒要件：<https://www.kioxia-systems.co.jp/recruitment/guide.html>／<https://www.megachips.co.jp/recruit/recruit/index.html>／<https://jobs.nvidia.com/careers/job/893397893990>

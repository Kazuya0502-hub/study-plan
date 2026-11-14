#!/usr/bin/env python3
"""日次タスクの展開ツール（外部依存なし / Python 3.8+）

使い方:
  python3 tools/daily.py today            今日のタスク
  python3 tools/daily.py 2026-11-18       指定日のタスク
  python3 tools/daily.py week             今週（月〜日）をまとめて
  python3 tools/daily.py new 2026-11-23   その週の雛形を plan/ に作る
  python3 tools/daily.py log "メモ"        logs/YYYY-MM-DD.md に1行追記
"""
import sys, re, datetime as dt, pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
PLAN, LOGS = ROOT / "plan", ROOT / "logs"
WD = "月火水木金土日"

DEFAULT = {
    0: [("must", "理論：講義1本を見て、白紙で要約1枚"),
        ("task", "カード +1/+3 を見る（10分）"),
        ("min", "講義の冒頭10分だけ見る")],
    1: [("must", "実装ドリル：小さなモジュール1本を仕様→コード"),
        ("task", "各問にカード1枚 / コミット1本"),
        ("min", "1問だけ解く")],
    2: [("must", "検証：自己検査テストベンチを1本書いて通す"),
        ("task", "Verilator -Wall を0にする / 波形を1行メモ"),
        ("min", "lint を回すだけ")],
    3: [("must", "プロジェクト：仕様書か実装を1歩進める"),
        ("task", "コミット1本"),
        ("min", "仕様書の見出しだけ書く")],
    4: [("must", "復習：白紙再現30分"),
        ("task", "カード +7 の見直し / 誤り集に1件"),
        ("min", "カードだけ見る")],
    5: [("must", "長時間：プロジェクト3時間"),
        ("task", "課外2時間＋活動ログ1行"),
        ("min", "90分だけやる")],
    6: [("must", "週次テスト45分（今週3問＋2〜4週前3問）"),
        ("task", "誤り集30分 / 来週の計画15分 / 編入準備1時間"),
        ("min", "カードと計画だけ")],
}

HDR = re.compile(r"^##\s+(\d{4}-\d{2}-\d{2})\s*(.*)$")
ITEM = re.compile(r"^(must|task|min|note|log)\s*:\s*(.*)$")


def load():
    """plan/*.md を読み、{date: {"head": str, "items": [(kind, text)]}} を返す"""
    days = {}
    if not PLAN.is_dir():
        return days
    for f in sorted(PLAN.glob("week-*.md")):
        cur = None
        for line in f.read_text(encoding="utf-8").splitlines():
            m = HDR.match(line)
            if m:
                cur = m.group(1)
                days[cur] = {"head": m.group(2).strip(), "items": [], "src": f.name}
                continue
            if cur is None:
                continue
            m = ITEM.match(line.strip())
            if m and m.group(1) in ("must", "task", "min"):
                days[cur]["items"].append((m.group(1), m.group(2).strip()))
    return days


def fmt(d, info=None):
    date = dt.date.fromisoformat(d)
    head = info["head"] if info else ""
    if head.startswith(WD[date.weekday()]):
        head = head[1:].strip()
    print(f"\n# {d}（{WD[date.weekday()]}）{head}")
    items = info["items"] if info and info["items"] else DEFAULT[date.weekday()]
    if not info:
        print("  ※ この日の予定ファイルがないため、曜日の既定テンプレートを表示")
    n = 0
    for kind, text in items:
        if kind == "must":
            print(f"  [ ] ★  {text}")
        elif kind == "task":
            n += 1
            print(f"  [ ] {n}.   {text}")
    mins = [t for k, t in items if k == "min"]
    if mins:
        print("  --- 落ちた日用 ---")
        for t in mins:
            print(f"  [ ] m.   {t}")
    print(f'  記録: python3 tools/daily.py log "must: 達成 / 02:10 / 詰まった: ..."')


def cmd_today(argv):
    d = argv[0] if argv else dt.date.today().isoformat()
    days = load()
    fmt(d, days.get(d))


def cmd_week(argv):
    base = dt.date.fromisoformat(argv[0]) if argv else dt.date.today()
    mon = base - dt.timedelta(days=base.weekday())
    days = load()
    for i in range(7):
        d = (mon + dt.timedelta(days=i)).isoformat()
        fmt(d, days.get(d))


def cmd_new(argv):
    if not argv:
        print("週の月曜日を YYYY-MM-DD で指定してください（例: new 2026-11-23）")
        return
    base = dt.date.fromisoformat(argv[0])
    mon = base - dt.timedelta(days=base.weekday())
    PLAN.mkdir(exist_ok=True)
    path = PLAN / f"week-{mon.isoformat()}.md"
    if path.exists():
        print(f"既にあります: {path}")
        return
    out = [f"# 週次プラン {mon.isoformat()} 〜 {(mon + dt.timedelta(days=6)).isoformat()}",
           "# 日曜15分で must を書き換える（task/min はそのままでよい）", ""]
    for i in range(7):
        d = mon + dt.timedelta(days=i)
        out.append(f"## {d.isoformat()} {WD[d.weekday()]} 2h")
        for kind, text in DEFAULT[d.weekday()]:
            out.append(f"{kind}: {text}")
        out.append("")
    path.write_text("\n".join(out), encoding="utf-8")
    print(f"作りました: {path.relative_to(ROOT)}")
    print("次: must をその週の内容に書き換える → python3 tools/daily.py week")


def cmd_log(argv):
    text = " ".join(argv) if argv else ""
    if not text:
        print('使い方: log "must: 達成 / 02:10 / 詰まった: ..."')
        return
    LOGS.mkdir(exist_ok=True)
    p = LOGS / f"{dt.date.today().isoformat()}.md"
    stamp = dt.datetime.now().strftime("%H:%M")
    with p.open("a", encoding="utf-8") as f:
        f.write(f"- {stamp} {text}\n")
    print(f"追記: {p.relative_to(ROOT)}")


def main():
    cmd = sys.argv[1] if len(sys.argv) > 1 else "today"
    rest = sys.argv[2:]
    table = {"today": cmd_today, "week": cmd_week, "new": cmd_new, "log": cmd_log}
    if cmd in table:
        table[cmd](rest)
        return
    if re.fullmatch(r"\d{4}-\d{2}-\d{2}", cmd):
        cmd_today([cmd])
        return
    print(__doc__)


if __name__ == "__main__":
    main()

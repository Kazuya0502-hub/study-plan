#!/usr/bin/env python3
"""Daily task expander (no dependencies / Python 3.8+)

Usage:
  python3 tools/daily.py today            Today's tasks
  python3 tools/daily.py 2026-11-18       Tasks for a given date
  python3 tools/daily.py week             The whole week (Mon-Sun)
  python3 tools/daily.py new 2026-11-23   Create that week's template in plan/
  python3 tools/daily.py log "note"       Append one line to logs/YYYY-MM-DD.md
"""
import sys, re, datetime as dt, pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
PLAN, LOGS = ROOT / "plan", ROOT / "logs"
EN = ("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")

DEFAULT = {
    0: [("must", "Theory: watch one lecture and write one page from blank paper"),
        ("task", "Review cards +1/+3 (10 min)"),
        ("min", "Watch the first 10 minutes of the lecture")],
    1: [("must", "Implementation drill: one small module from spec to code"),
        ("task", "One card per problem / one commit"),
        ("min", "Solve one problem")],
    2: [("must", "Verification: write and pass one self-checking testbench"),
        ("task", "Get verilator -Wall to zero / one-line waveform note"),
        ("min", "Just run the linter")],
    3: [("must", "Project: advance the spec or the implementation by one step"),
        ("task", "One commit"),
        ("min", "Write the spec headings only")],
    4: [("must", "Review: 30 minutes of blank-paper recall"),
        ("task", "Review cards +7 / one entry in the error log"),
        ("min", "Just look at the cards")],
    5: [("must", "Long block: 3 hours on the project"),
        ("task", "2 hours of extracurricular activity + one line in the activity log"),
        ("min", "Do 90 minutes")],
    6: [("must", "Weekly test, 45 minutes (3 from this week + 3 from 2-4 weeks ago)"),
        ("task", "30 min error log / 15 min next week's plan / 1 hour transfer work"),
        ("min", "Cards and the plan only")],
}

HDR = re.compile(r"^##\s+(\d{4}-\d{2}-\d{2})\s*(.*)$")
ITEM = re.compile(r"^(?:\[([ xX])\]\s*)?(must|task|min|note|log)\s*:\s*(.*)$")


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
            if m and m.group(2) in ("must", "task", "min"):
                done = bool(m.group(1)) and m.group(1).lower() == "x"
                days[cur]["items"].append((m.group(2), m.group(3).strip(), done))
    return days


def fmt(d, info=None):
    date = dt.date.fromisoformat(d)
    head = info["head"] if info else ""
    wd = EN[date.weekday()]
    if head.startswith(wd):
        head = head[len(wd):].strip()
    print(f"\n# {d} ({wd}) {head}")
    raw = info["items"] if info and info["items"] else DEFAULT[date.weekday()]
    # Accept both `must: ...` and `[x] must: ...`
    items = [(it[0], it[1], it[2] if len(it) > 2 else False) for it in raw]
    if not info:
        print("  (no plan file for this day; showing the weekday default template)")
    n = 0
    for kind, text, done in items:
        mark = "x" if done else " "
        if kind == "must":
            print(f"  [{mark}] ★  {text}")
        elif kind == "task":
            n += 1
            print(f"  [{mark}] {n}.   {text}")
    mins = [(t, d) for k, t, d in items if k == "min"]
    if mins:
        print("  --- fallback for a bad day ---")
        for t, d in mins:
            mark = "x" if d else " "
            print(f"  [{mark}] m.   {t}")
    print('  log: python3 tools/daily.py log "must: done / 02:10 / stuck: ..."')


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
        print("Give the Monday of the week as YYYY-MM-DD (e.g. new 2026-11-23)")
        return
    base = dt.date.fromisoformat(argv[0])
    mon = base - dt.timedelta(days=base.weekday())
    PLAN.mkdir(exist_ok=True)
    path = PLAN / f"week-{mon.isoformat()}.md"
    if path.exists():
        print(f"Already exists: {path}")
        return
    out = [f"# Weekly plan {mon.isoformat()} to {(mon + dt.timedelta(days=6)).isoformat()}",
           "# Spend 15 minutes on Sunday rewriting the musts (task/min can stay as they are)", ""]
    for i in range(7):
        d = mon + dt.timedelta(days=i)
        out.append(f"## {d.isoformat()} {EN[d.weekday()]} 2h")
        for kind, text in DEFAULT[d.weekday()]:
            out.append(f"{kind}: {text}")
        out.append("")
    path.write_text("\n".join(out), encoding="utf-8")
    print(f"Created: {path.relative_to(ROOT)}")
    print("Next: rewrite the musts for that week, then run python3 tools/daily.py week")


def cmd_log(argv):
    text = " ".join(argv) if argv else ""
    if not text:
        print('Usage: log "must: done / 02:10 / stuck: ..."')
        return
    LOGS.mkdir(exist_ok=True)
    p = LOGS / f"{dt.date.today().isoformat()}.md"
    stamp = dt.datetime.now().strftime("%H:%M")
    with p.open("a", encoding="utf-8") as f:
        f.write(f"- {stamp} {text}\n")
    print(f"Appended: {p.relative_to(ROOT)}")


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

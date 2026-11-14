#!/usr/bin/env bash
# RTL 学習環境の点検スクリプト
# 使い方: bash env/setup-check.sh
# 出力をそのまま notes/env.md に貼ると、W1 の「環境の版数記録」が完了する。
set -u
ok=0; ng=0; missing=()

check() {
  local name="$1"; shift
  if command -v "$name" >/dev/null 2>&1; then
    local v
    v="$("$@" 2>&1 | head -n1)"
    printf '  %-26s OK    %s\n' "$name" "$v"
    ok=$((ok+1))
  else
    printf '  %-26s --    未導入\n' "$name"
    ng=$((ng+1)); missing+=("$name")
  fi
}

echo "# RTL 環境チェック  $(date '+%Y-%m-%d %H:%M')"
echo
echo "## 実行環境"
printf '  %-26s %s\n' "kernel"        "$(uname -r)"
if uname -r | grep -qi microsoft; then
  printf '  %-26s %s\n' "WSL" "yes (WSLg: $([ -n "${DISPLAY:-}" ] && echo yes || echo no))"
else
  printf '  %-26s %s\n' "WSL" "no (native Linux)"
fi
printf '  %-26s %s\n' "memory"        "$(free -h 2>/dev/null | awk '/^Mem:/{print $2}')"
printf '  %-26s %s\n' "disk (~ free)" "$(df -h "$HOME" | awk 'NR==2{print $4}')"
echo
echo "## 基本"
check git     git --version
check make    make --version
check python3 python3 --version
check gcc     gcc --version
check docker  docker --version
echo
echo "## HDL（フェーズA）"
check iverilog  iverilog -V
check verilator verilator --version
check yosys     yosys -V
check gtkwave   gtkwave --version
check surfer    surfer --version
check verible-verilog-lint verible-verilog-lint --version
echo
echo "## 検証・形式（フェーズA〜B）"
check sby     sby --version
check z3      z3 --version
echo
echo "## CPU（フェーズB）"
check riscv64-unknown-elf-gcc riscv64-unknown-elf-gcc --version
check spike   spike --version
echo
echo "## 合成・レイアウト（フェーズC）"
check openroad openroad -version
check sta      sta -version
echo
printf '## まとめ: 導入済み %d / 未導入 %d\n' "$ok" "$ng"
if [ "$ng" -gt 0 ]; then printf '未導入: %s\n' "${missing[*]}"; fi
echo
echo "※ フェーズAとBは「HDL」「検証」が揃えば開始できる。openroad/sta/docker はフェーズCまで不要。"
exit 0

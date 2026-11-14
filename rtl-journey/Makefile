# RTL 作業用 Makefile
# 使い方: make sim TOP=adder4 / make lint TOP=adder4 / make syn TOP=adder4
# ツールが無い環境では動きません（README 参照）

TOP  ?= adder4
RTL  := $(wildcard rtl/*.v)
TB   := tb/tb_$(TOP).v
BUILD := build
SIM  := $(BUILD)/$(TOP).vvp

.PHONY: all sim lint syn wave clean help

all: help

sim:            ## コンパイル＋シミュレーション
	@mkdir -p $(BUILD)
	iverilog -g2012 -Wall -o $(SIM) $(RTL) $(TB)
	vvp $(SIM)

lint:           ## lint（verilator -Wall）
	verilator --lint-only -Wall -Wno-fatal --top-module $(TOP) $(RTL)

syn:            ## 合成＋セル数・論理段数
	@mkdir -p $(BUILD)
	yosys -p "read_verilog $(RTL); hierarchy -top $(TOP); proc; opt; fsm; opt; memory; opt; techmap; opt; stat" \
	      -l $(BUILD)/$(TOP)_syn.log
	@echo "--- レポート: $(BUILD)/$(TOP)_syn.log"

wave:           ## 波形（gtkwave）
	@mkdir -p $(BUILD)
	iverilog -g2012 -o $(SIM) $(RTL) $(TB)
	(cd $(BUILD) && vvp $(notdir $(SIM)))
	gtkwave $(BUILD)/$(TOP).vcd &

clean:          ## 生成物を削除
	rm -rf $(BUILD)

help:           ## このヘルプ
	@grep -E '^[a-z]+:.*##' $(MAKEFILE_LIST) | sed 's/:.*##/\t/' | column -t -s "$$(printf '\t')"

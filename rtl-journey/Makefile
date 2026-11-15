# Makefile for RTL work
# Usage: make sim TOP=adder4 / make lint TOP=adder4 / make syn TOP=adder4
# Needs iverilog, verilator, yosys, gtkwave (see README)

TOP  ?= adder4
RTL  := $(wildcard rtl/*.v)
TB   := tb/tb_$(TOP).v
BUILD := build
SIM  := $(BUILD)/$(TOP).vvp

.PHONY: all sim lint syn wave clean help

all: help

sim:            ## compile and simulate
	@mkdir -p $(BUILD)
	iverilog -g2012 -Wall -o $(SIM) $(RTL) $(TB)
	vvp $(SIM)

lint:           ## lint with verilator -Wall
	verilator --lint-only -Wall -Wno-fatal --top-module $(TOP) $(RTL)

syn:            ## synthesize; report cell count and logic depth
	@mkdir -p $(BUILD)
	yosys -p "read_verilog $(RTL); hierarchy -top $(TOP); proc; opt; fsm; opt; memory; opt; techmap; opt; stat" \
	      -l $(BUILD)/$(TOP)_syn.log
	@echo "--- report: $(BUILD)/$(TOP)_syn.log"

wave:           ## waveform in gtkwave
	@mkdir -p $(BUILD)
	iverilog -g2012 -o $(SIM) $(RTL) $(TB)
	(cd $(BUILD) && vvp $(notdir $(SIM)))
	gtkwave $(BUILD)/$(TOP).vcd &

clean:          ## remove build artifacts
	rm -rf $(BUILD)

help:           ## this help
	@grep -E '^[a-z]+:.*##' $(MAKEFILE_LIST) | sed 's/:.*##/\t/' | column -t -s "$$(printf '\t')"

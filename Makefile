SIM?=icarus
TOPLEVEL_LANG?=verilog

VERILOG_SOURCES = \
		./array1.v \
		./dut.sv
	
TOPLEVEL = dut
MODULE = tb_dut

include $(shell cocotb-config --makefiles)/Makefile.sim

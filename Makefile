SIM?=xcelium
TOPLEVEL_LANG?=verilog

VERILOG_SOURCES = \
		./array1.sv \
		./dut.sv
	
TOPLEVEL = dut
MODULE = tb_dut

ifeq ($(SIM), xcelium)
	COMPILE_ARGS += -disable_sem2009
endif
ifeq ($(SIM), ius)
	COMPILE_ARGS += -disable_sem2009
endif
COMPILE_ARGS += ${EXTRA_OPTS}

include $(shell cocotb-config --makefiles)/Makefile.sim

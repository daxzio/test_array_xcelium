#import cocotb
from cocotb import start_soon
from cocotb import test
from cocotb.result import TestSuccess, TestError
from cocotb.triggers import with_timeout
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge


import logging
from cocotb import start_soon
from cocotb.queue import Queue
from cocotb.triggers import Event
from cocotb.triggers import RisingEdge

# from memory import LoadMem
import os.path
import re

from pprint import pprint

#logging.basicConfig(level=os.environ.get("LOGLEVEL", "INFO"))



class testbench:
    def __init__(self, dut):
        self.cr = clkreset(dut)

class clkreset:
    def __init__(self, dut):
        self.clk = dut.clk
        self.rgb = dut.rgb
        self.pixel0 = dut.pixel0
        self.pixel1 = dut.pixel1
        self.pixel2 = dut.pixel2
        
    async def wait_clkn(self, length=1):
        for i in range(length):
            await RisingEdge(self.clk)

    async def start_test(self, period=11, units="ns"):
        start_soon(Clock(self.clk, period, units=units).start())        

    async def end_test(self, length=10):
        await self.wait_clkn(length)


@test()
async def test_array(dut):

    
    tb = testbench(dut)

    await tb.cr.start_test()
    await tb.cr.wait_clkn()
    await tb.cr.wait_clkn()
    
    tb.cr.rgb[0].value = 0x23
    tb.cr.rgb[1].value = 0x45
    tb.cr.rgb[2].value = 0x67
    
    await tb.cr.wait_clkn()
    await tb.cr.wait_clkn()
    
    print(f"pixel2 = {tb.cr.pixel2.value}")
    print(f"pixel1 = {tb.cr.pixel1.value}")
    print(f"pixel0 = {tb.cr.pixel0.value}")
    assert tb.cr.pixel2.value == 0x98
    assert tb.cr.pixel1.value == 0xba
    assert tb.cr.pixel0.value == 0xdc

    await tb.cr.end_test()
  
 
    




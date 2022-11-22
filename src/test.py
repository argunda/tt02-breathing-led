import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


@cocotb.test()
async def test_pwm(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 250, units="us")
    cocotb.fork(clock.start())
    
    dut._log.info("reset")
    dut.rst.value = 1
    await ClockCycles(dut.clk, 10)
    dut.rst.value = 0

    await ClockCycles(dut.clk, 10000)

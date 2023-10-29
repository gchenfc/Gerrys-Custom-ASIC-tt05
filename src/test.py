import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

SEGMENTS = [  #
    [
        0b0111101, 0b1111011, 0b1010000, 0b1010000, 0b1101110, 0b0000000, 0b0111001, 0b1110100,
        0b1111011, 0b1010100, 0b0000000, 0b0000000
    ],
    [
        0b1110001, 0b1011100, 0b1010100, 0b1011110, 0b1011111, 0b0000000, 0b0111001, 0b1110100,
        0b1111011, 0b1010100, 0b0000000, 0b1110101, 0b1111011, 0b0000110, 0b0000110, 0b1101110,
        0b0000000, 0b0000000
    ],
    [
        0b0001110, 0b0000100, 0b0010100, 0b0000000, 0b1110101, 0b1111011, 0b0000110, 0b0000110,
        0b1101110, 0b0000000, 0b0000000
    ],
    [
        0b1110111, 0b0011100, 0b1111011, 0b1010100, 0b0000000, 0b1110101, 0b1111011, 0b0000110,
        0b0000110, 0b1101110, 0b0000000, 0b0000000
    ],
    [
        0b0111110, 0b0000100, 0b1010000, 0b1101111, 0b0000100, 0b1010100, 0b0000100, 0b1011111,
        0b0000000, 0b1110011, 0b1011111, 0b1010100, 0b0000000, 0b0000000
    ],
    [
        0b1110110, 0b1011111, 0b1010100, 0b1010100, 0b1011111, 0b0000000, 0b0111001, 0b1110100,
        0b1111011, 0b1010100, 0b0000000, 0b0000000
    ],
    [
        0b1110110, 0b0000100, 0b1010100, 0b1110001, 0b0011100, 0b0000000, 0b0111001, 0b1110100,
        0b1111011, 0b1010100, 0b0000000, 0b0000000
    ],
    [
        0b0001110, 0b1011100, 0b1101110, 0b1011000, 0b1111011, 0b0000000, 0b0111001, 0b1110100,
        0b1111011, 0b1010100, 0b0000000, 0b0000000
    ]
]


@cocotb.test()
async def test_7seg(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 100, units="ns")
    cocotb.start_soon(clock.start())

    # reset
    dut._log.info("reset")
    dut.rst_n.value = 0
    # set the compare value
    dut.ui_in.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    # the compare value is shifted 10 bits inside the design to allow slower counting
    max_count = 4
    dut._log.info(f"check all segments with MAX_COUNT set to {max_count}")
    # check all segments and roll over
    for name, segment in enumerate(SEGMENTS):
        dut.ui_in.value = 3 | (name << 5)
        for i in range(20):
            dut._log.info("check segment {}".format(i))
            await ClockCycles(dut.clk, max_count)
            assert int(dut.segments.value) == segment[i % len(
                segment
            )], f'name {name} segment {i} ({i % len(segment)}) should be {segment[i % len(segment)]:>08b} but was {int(dut.segments.value):>08b}'

            # all bidirectionals are set to output
            assert dut.uio_oe == 0xFF

    # reset
    dut.rst_n.value = 0
    # set a different compare value
    dut.ui_in.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    max_count = 4
    dut._log.info(f"check all segments with MAX_COUNT set to {max_count}")
    # check all segments and roll over
    for name, segment in enumerate(SEGMENTS):
        dut.ui_in.value = 3 | (name << 5)
        for i in range(20):
            dut._log.info("check segment {}".format(i))
            await ClockCycles(dut.clk, max_count)
            assert int(dut.segments.value) == segment[i % len(
                segment
            )], f'name {name} segment {i} ({i % len(segment)}) should be {segment[i % len(segment)]:>08b} but was {int(dut.segments.value):>08b}'

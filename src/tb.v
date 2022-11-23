`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
    input clk,
    input rst,
    input test_in,
    output pwm,
    output [6:0] duty
   );

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    wire [7:0] inputs = {6'b0, rst, clk};
    wire [7:0] outputs;
    assign pwm = outputs[0];
    assign duty = outputs[7:1];
    // instantiate the DUT
    pwm_gen pwm_gen(
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule

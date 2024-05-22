//  Team Members:    Shawn Kim, JhihYang Wu, Andres Galvez
//  % Effort    :    SK: 33%, JW: 33%, AG: 33%
//
// ECE369A
// 

`timescale 1ns / 1ps

module fpga_top(Clk, Reset, out7, en_out);

    input Clk, Reset;
    output wire [6:0] out7;
    output wire [7:0] en_out;

    wire [31:0] RegFileV0, RegFileV1;
    wire slowClk;

    Two4DigitDisplay two(Clk, RegFileV1[15:0], RegFileV0[15:0], out7, en_out);
    top a1(slowClk, Reset, RegFileV0, RegFileV1);
    ClkDiv clkdiv(Clk, Reset, slowClk);

endmodule

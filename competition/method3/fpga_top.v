`timescale 1ns / 1ps

module fpga_top(Clk, Reset, out7, en_out);

    input Clk, Reset;
    output wire [6:0] out7;
    output wire [7:0] en_out;

    wire [5:0] MinI, MinJ;
    wire [11:0] MinVal;

    Two4DigitDisplay two(Clk, {2'b0, MinI, 2'b0, MinJ}, {4'b0, MinVal}, out7, en_out);
    VBSME_ASIC a1(MinI, MinJ, MinVal);

endmodule

`timescale 1ns / 1ps

module VBSME_ASIC_tb();

    wire [5:0] MinI, MinJ;
    wire [11:0] MinVal;

    VBSME_ASIC a1(MinI, MinJ, MinVal);

endmodule


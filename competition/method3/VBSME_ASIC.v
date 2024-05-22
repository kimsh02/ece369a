`timescale 1ns / 1ps

module VBSME_ASIC(MinI, MinJ, MinVal);

    output wire [5:0] MinI, MinJ;
    output wire [11:0] MinVal;

    reg [7:0] memory [0:4+64*64+4*4-1];

    initial begin
        $readmemh("data_memory.mem", memory);
    end

    wire [64*64*12-1:0] SADValues;
    wire [64*64*8-1:0] frame;
    wire [4*4*8-1:0] window;

    genvar i;
    generate
        for (i = 0; i < 64*64; i = i + 1) begin
            assign frame[i*8 +: 8] = memory[4+i];
        end
        for (i = 0; i < 4*4; i = i + 1) begin
            assign window[i*8 +: 8] = memory[4+64*64+i];
        end

        for (i = 0; i < 61; i = i + 1) begin
            SADCalculator a1(frame[i*64*8 +: 4*64*8], window, SADValues[i*64*12 +: 64*12]);
        end
        for (i = 61; i <= 63; i = i + 1) begin
            assign SADValues[i*64*12 +: 64*12] = 0;
        end
    endgenerate

    MinSADFinder a2(SADValues, MinI, MinJ, MinVal);

endmodule


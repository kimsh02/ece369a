`timescale 1ns / 1ps

module SADCalculator(FourRows, Window, SADValues);
    
    input [4*64*8-1:0] FourRows;
    input [4*4*8-1:0] Window;
    output wire [64*12-1:0] SADValues;

    assign SADValues[61*12 +: 12] = 0;
    assign SADValues[62*12 +: 12] = 0;
    assign SADValues[63*12 +: 12] = 0;

    genvar i;
    generate
        for (i = 0; i < 61; i = i + 1) begin
            OneSADCalc a1({FourRows[(i+192)*8 +: 4*8],
                           FourRows[(i+128)*8 +: 4*8],
                           FourRows[(i+64)*8 +: 4*8],
                           FourRows[(i+0)*8 +: 4*8]},
                          Window,
                          SADValues[i*12 +: 12]);
        end
    endgenerate

endmodule


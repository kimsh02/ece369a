`timescale 1ns / 1ps

module OneSADCalc(Crop, Window, SADVal);
    
    input [4*4*8-1:0] Crop;
    input [4*4*8-1:0] Window;
    output wire [11:0] SADVal;

    reg [16*8-1:0] abs_differences;

    integer i;
    always @(*) begin
        for (i = 0; i < 4*4; i = i + 1) begin
            if (Crop[i*8 +: 8] > Window[i*8 +: 8]) begin
                abs_differences[i*8 +: 8] <= Crop[i*8 +: 8] - Window[i*8 +: 8];
            end else begin
                abs_differences[i*8 +: 8] <= Window[i*8 +: 8] - Crop[i*8 +: 8];
            end
        end
    end

    assign SADVal = abs_differences[0*8 +: 8] +
                    abs_differences[1*8 +: 8] +
                    abs_differences[2*8 +: 8] +
                    abs_differences[3*8 +: 8] +
                    abs_differences[4*8 +: 8] +
                    abs_differences[5*8 +: 8] +
                    abs_differences[6*8 +: 8] +
                    abs_differences[7*8 +: 8] +
                    abs_differences[8*8 +: 8] +
                    abs_differences[9*8 +: 8] +
                    abs_differences[10*8 +: 8] +
                    abs_differences[11*8 +: 8] +
                    abs_differences[12*8 +: 8] +
                    abs_differences[13*8 +: 8] +
                    abs_differences[14*8 +: 8] +
                    abs_differences[15*8 +: 8];

endmodule


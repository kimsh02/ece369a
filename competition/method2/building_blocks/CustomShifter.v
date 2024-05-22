`timescale 1ns / 1ps

module CustomShifter(InputImg, leftAmount, upAmount, OutputImg);

    input [64*64*12-1:0] InputImg;
    input [2:0] leftAmount, upAmount;
    output reg [64*64*12-1:0] OutputImg;

    integer i;
    always @(InputImg, leftAmount, upAmount) begin
        if (leftAmount <= 4 && upAmount <= 4) begin
            for (i = 0; i < 64*64; i = i + 1) begin
                if (i*12+11 + leftAmount*12 + upAmount*12*64 <= 64*64*12-1) begin
                    //OutputImg[i*12+11:i*12] <= InputImg[i*12+11 + leftAmount*12 + upAmount*12*64:i*12 + leftAmount*12 + upAmount*12*64];
                    OutputImg[i*12 +: 12] <= InputImg[i*12 + leftAmount*12 + upAmount*12*64 +: 12];
                end else begin
                    //OutputImg[i*12+11:i*12] <= 0;
                    OutputImg[i*12 +: 12] <= 0;
                end
            end
        end else begin
            OutputImg <= 64*64*12'bx;
        end
    end

endmodule


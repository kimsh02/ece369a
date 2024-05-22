`timescale 1ns / 1ps

module Comparator(aVal, aI, aJ, bVal, bI, bJ,
                  minVal, minI, minJ);

    input [11:0] aVal, bVal;
    input [5:0] aI, aJ, bI, bJ;
    output reg [11:0] minVal;
    output reg [5:0] minI, minJ;

    always @(*) begin
        if (bVal <= aVal) begin
            minVal <= bVal;
            minI <= bI;
            minJ <= bJ;
        end else begin
            minVal <= aVal;
            minI <= aI;
            minJ <= aJ;
        end
    end

endmodule


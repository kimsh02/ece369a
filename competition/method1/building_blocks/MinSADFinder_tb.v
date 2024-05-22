`timescale 1ns / 1ps

module MinSADFinder_tb();

    reg [64*64*12-1:0] SADValues;
    wire [5:0] MinI, MinJ;
    wire [11:0] MinVal;

    MinSADFinder a1(SADValues, MinI, MinJ, MinVal);

    integer i;
    initial begin
        for (i = 0; i < 64*64; i = i + 1) begin
            SADValues[12*i +: 12] = $random;
            while (SADValues[12*i +: 12] < 10) begin
                SADValues[12*i +: 12] = $random;
            end
        end
        #100;
        SADValues[12*(10*64+12) +: 12] = 9;
        #100;
        $display("row 10 col 12 val 9 | row %d col %d val %d", MinI, MinJ, MinVal);
        #100;
        SADValues[12*(60*64+60) +: 12] = 8;
        #100;
        $display("row 60 col 60 val 8 | row %d col %d val %d", MinI, MinJ, MinVal);
        #100;
        SADValues[12*(0*64+0) +: 12] = 7;
        #100;
        $display("row 0 col 0 val 7 | row %d col %d val %d", MinI, MinJ, MinVal);
        #100;
        SADValues[12*(12*64+0) +: 12] = 6;
        #100;
        $display("row 12 col 0 val 6 | row %d col %d val %d", MinI, MinJ, MinVal);
    end

endmodule


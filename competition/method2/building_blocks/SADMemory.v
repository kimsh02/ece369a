`timescale 1ns / 1ps

module SADMemory(Clk, SomeSADValues, Row, Write,
                 MinI, MinJ, MinVal);

    input Clk;
    input [1*64*12-1:0] SomeSADValues;
    input [5:0] Row;
    input Write;

    output wire [5:0] MinI, MinJ;
    output wire [11:0] MinVal;

    reg [64*64*12-1:0] memory;

    MinSADFinder(memory, MinI, MinJ, MinVal);

    always @(posedge Clk) begin
        if (Write) begin
            memory[Row*64*12 +: 1*64*12] <= SomeSADValues;
        end
    end

endmodule


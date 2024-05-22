`timescale 1ns / 1ps

module SADCalculator_tb();
    
    reg [4*64*8-1:0] FourRows;
    reg [4*4*8-1:0] Window;
    wire [64*12-1:0] SADValues;

    SADCalculator a1(FourRows, Window, SADValues);

    integer i;
    initial begin
        for (i = 0; i < 4*64*8; i = i + 1) begin
            FourRows[i] = $random;
        end
        for (i = 0; i < 4*4*8; i = i + 1) begin
            Window[i] = $random;
        end
        #100;
        for (i = 0; i < 4; i = i + 1) begin
            $display("SADValues[%d] = %d", i, SADValues[i*12 +: 12]);
        end
        $display("Window");
        for (i = 0; i < 4*4; i = i + 4) begin
            $display("%d %d %d %d", Window[i*8 +: 8], Window[(i+1)*8 +: 8], Window[(i+2)*8 +: 8], Window[(i+3)*8 +: 8]);
        end
        $display("Part of FourRows");
        for (i = 0; i < 4; i = i + 1) begin
            $display("%d %d %d %d %d %d %d %d",
                FourRows[i*64*8+0*8 +: 8],
                FourRows[i*64*8+1*8 +: 8],
                FourRows[i*64*8+2*8 +: 8],
                FourRows[i*64*8+3*8 +: 8],
                FourRows[i*64*8+4*8 +: 8],
                FourRows[i*64*8+5*8 +: 8],
                FourRows[i*64*8+6*8 +: 8],
                FourRows[i*64*8+7*8 +: 8]);
        end
    end

endmodule


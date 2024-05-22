`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 11:52:02 AM
// Design Name: 
// Module Name: ifu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ifu_tb();

    reg Reset, Clk;
    wire [31:0] Instruction, PCResult;
    InstructionFetchUnit a1(Reset, Clk, Instruction, PCResult);

    always begin
        Clk <= 0;
        #100;
        Clk <= 1;
        #100;
    end
    
    initial begin
        Reset <= 1;
        @(posedge Clk) #50;
        Reset <= 0;
    end

endmodule

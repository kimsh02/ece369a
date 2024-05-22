`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2023 05:57:04 PM
// Design Name: 
// Module Name: top
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


module top(Clk, Reset, out7, en_out);

    input Clk, Reset;
    output wire [6:0] out7;
    output wire [7:0] en_out;

    wire [15:0] dummy1;
    wire [15:0] dummy2;
    wire [15:0] instr;
    wire [15:0] pcresult;
    wire slowClk;
    
    Two4DigitDisplay two(Clk, instr, pcresult, out7, en_out);
    InstructionFetchUnit ifu(Reset, slowClk, {dummy1, instr}, {dummy2, pcresult});
    ClkDiv clkdiv(Clk, Reset, slowClk);

endmodule

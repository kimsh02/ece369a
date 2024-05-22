`timescale 1ns / 1ps

module IF_ID_Register(Clk, Rst, Instruction, PC, Instruction_out, PC_out, myPC, myPC_out);
    input Clk, Rst;
    input [31:0] Instruction;
    input [31:0] PC;
    input [31:0] myPC;
    output reg [31:0] Instruction_out;
    output reg [31:0] PC_out;
    output reg [31:0] myPC_out;

    always @(posedge Clk or posedge Rst) begin
        if (Rst) begin
            Instruction_out <= 0;
            PC_out <= 0;
            myPC_out <= 32'bx;
        end else begin
            PC_out <= PC;
            Instruction_out <= Instruction;
            myPC_out <= myPC;
        end
    end

endmodule


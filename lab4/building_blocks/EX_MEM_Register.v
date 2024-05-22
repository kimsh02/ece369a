`timescale 1ns / 1ps

module EX_MEM_Register(Clk, Rst,
                       memRead_in, memRead_out,
                       memWrite_in, memWrite_out,
                       branch_in, branch_out,
                       regWrite_in, regWrite_out,
                       regRead2_in, regRead2_out,
                       ALUZero_in, ALUZero_out,
                       regDstMux_in, regDstMux_out,
                       memToReg_in, memToReg_out,
                       ALUResult_in, ALUResult_out,
                       memSize_in, memSize_out,
                       myPC_in, myPC_out,
                       pc_in, pc_out);
    input Clk, Rst;
    input memRead_in; output reg memRead_out;
    input memWrite_in; output reg memWrite_out;
    input branch_in; output reg branch_out;
    input regWrite_in; output reg regWrite_out;
    input [31:0] regRead2_in; output reg [31:0] regRead2_out;
    input ALUZero_in; output reg ALUZero_out;
    input [4:0] regDstMux_in; output reg [4:0] regDstMux_out;
    input memToReg_in; output reg memToReg_out;
    input [31:0] ALUResult_in; output reg [31:0] ALUResult_out;
    input [1:0] memSize_in; output reg [1:0] memSize_out;
    input [31:0] myPC_in; output reg [31:0] myPC_out;
    input [31:0] pc_in; output reg [31:0] pc_out;
    
    always @(posedge Clk or posedge Rst) begin
        if (Rst) begin
            memRead_out <= 0; 
            memWrite_out <= 0;
            branch_out <= 0;
            regWrite_out <= 0;
            regRead2_out <= 0;
            ALUZero_out <= 0;
            regDstMux_out <= 0;
            memToReg_out <= 0;
            ALUResult_out <= 0;
            memSize_out <= 0;
            myPC_out <= 32'bx;
            pc_out <= 0;
        end else begin
            memRead_out <= memRead_in; 
            memWrite_out <= memWrite_in;
            branch_out <= branch_in;
            regWrite_out <= regWrite_in;
            regRead2_out <= regRead2_in;
            ALUZero_out <= ALUZero_in;
            regDstMux_out <= regDstMux_in;
            memToReg_out <= memToReg_in;
            ALUResult_out <= ALUResult_in;
            memSize_out <= memSize_in;
            myPC_out <= myPC_in;
            pc_out <= pc_in;
        end
    end
   
endmodule


`timescale 1ns / 1ps

module ID_EX_Register(Clk, Rst,
                      regDst_in, regDst_out,
                      aluSrc_in, aluSrc_out,
                      aluControl_in, aluControl_out,
                      memSize_in, memSize_out,
                      memRead_in, memRead_out,
                      memWrite_in, memWrite_out,
                      branch_in, branch_out,
                      regWrite_in, regWrite_out,
                      memToReg_in, memToReg_out,
                      pc_in, pc_out,
                      regRead1_in, regRead1_out,
                      regRead2_in, regRead2_out,
                      signExtend_in, signExtend_out,
                      instruction20_16_in, instruction20_16_out,
                      instruction15_11_in, instruction15_11_out,
                      myPC_in, myPC_out);
    input Clk, Rst;
    input regDst_in; output reg regDst_out;
    input aluSrc_in; output reg aluSrc_out;
    input [3:0] aluControl_in; output reg [3:0] aluControl_out;
    input [1:0] memSize_in; output reg [1:0] memSize_out;
    input memRead_in; output reg memRead_out;
    input memWrite_in; output reg memWrite_out;
    input branch_in; output reg branch_out;
    input regWrite_in; output reg regWrite_out;
    input memToReg_in; output reg memToReg_out;
    input [31:0] pc_in; output reg [31:0] pc_out;
    input [31:0] regRead1_in; output reg [31:0] regRead1_out;
    input [31:0] regRead2_in; output reg [31:0] regRead2_out;
    input [31:0] signExtend_in; output reg [31:0] signExtend_out;
    input [4:0] instruction20_16_in; output reg [4:0] instruction20_16_out;
    input [4:0] instruction15_11_in; output reg [4:0] instruction15_11_out;
    input [31:0] myPC_in; output reg [31:0] myPC_out;

    always @(posedge Clk or posedge Rst) begin
        if (Rst) begin
            regDst_out <= 0;
            aluSrc_out <= 0;
            aluControl_out <= 0;
            memSize_out <= 0;
            memRead_out <= 0;
            memWrite_out <= 0;
            branch_out <= 0;
            regWrite_out <= 0;
            memToReg_out <= 0;
            pc_out <= 0; 
            regRead1_out <= 0;
            regRead2_out <= 0;
            signExtend_out <= 0;
            instruction20_16_out <= 0;
            instruction15_11_out <= 0;
            myPC_out <= 32'bx;
        end else begin
            regDst_out <= regDst_in;
            aluSrc_out <= aluSrc_in;
            aluControl_out <= aluControl_in;
            memSize_out <= memSize_in;
            memRead_out <= memRead_in;
            memWrite_out <= memWrite_in;
            branch_out <= branch_in;
            regWrite_out <= regWrite_in;
            memToReg_out <= memToReg_in;
            pc_out <= pc_in; 
            regRead1_out <= regRead1_in;
            regRead2_out <= regRead2_in;
            signExtend_out <= signExtend_in;
            instruction20_16_out <= instruction20_16_in;
            instruction15_11_out <= instruction15_11_in;
            myPC_out <= myPC_in;
        end
    end

endmodule


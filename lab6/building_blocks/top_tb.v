//  Team Members:    Shawn Kim, JhihYang Wu, Andres Galvez
//  % Effort    :    SK: 33%, JW: 33%, AG: 33%
//
// ECE369A
// 

`timescale 1ns / 1ps

module top_tb();

    // Inputs.
    reg Clk, Rst;
    
    // Outputs.
    wire [31:0] PC, WriteData;

    // ================= FOR IMPLEMENTATION ==================
    top a1(Clk, Rst, PC, WriteData);
    // =======================================================
    // ==================== FOR DEBUGGING ====================
    //wire [31:0] IF_instr;
    //wire [31:0] IF_pcAddResult;
    //wire [31:0] ID_instr;
    //wire [31:0] ID_pc;
    //wire [31:0] ID_readData1, ID_readData2;
    //wire [31:0] ID_32imm;
    //wire ID_regWrite, ID_ALUSrc, ID_RegDst, ID_MemWrite, ID_MemRead, ID_Branch, ID_MemToReg;
    //wire [3:0] ID_ALUControl;
    //wire [1:0] ID_MemSize;
    //wire EX_RegDst;
    //wire EX_ALUSrc;
    //wire [3:0] EX_ALUControl;
    //wire [1:0] EX_MemSize;
    //wire EX_MemRead;
    //wire EX_MemWrite;
    //wire EX_Branch;
    //wire EX_regWrite;
    //wire EX_MemToReg;
    //wire [31:0] EX_pc;
    //wire [31:0] EX_readData1;
    //wire [31:0] EX_readData2;
    //wire [31:0] EX_32imm;
    //wire [4:0] EX_instr20_16;
    //wire [4:0] EX_instr15_11;
    //wire [31:0] EX_ALUResult;
    //wire EX_ALUZero;
    //wire [31:0] EX_aluB;
    //wire [4:0] EX_RegDstMux;
    //wire [31:0] EX_aluB;
    //wire MEM_MemRead;
    //wire MEM_MemWrite;
    //wire MEM_Branch;
    //wire MEM_regWrite;
    //wire [31:0] MEM_readData2;
    //wire MEM_ALUZero;
    //wire [4:0] MEM_RegDstMux;
    //wire MEM_MemToReg;
    //wire [31:0] MEM_ALUResult;
    //wire [1:0] MEM_MemSize;
    //wire MEM_PCSrc;
    //wire [31:0] MEM_ReadData;
    //wire WB_regWrite;
    //wire WB_MemToReg;
    //wire [31:0] WB_ReadData;
    //wire [31:0] WB_ALUResult;
    //wire [4:0] WB_RegDstMux;
    //wire [31:0] IF_realNextPC;
    //wire [31:0] IF_nextPC;
    //wire [31:0] ID_jumpAddr;
    //wire [31:0] EX_aluA;
    //wire [4:0] EX_tempRegDstMux;
    //wire [31:0] EX_tempALUResult;
    //wire [31:0] IF_myPC, ID_myPC, EX_myPC, MEM_myPC;
    //wire PCWrite, IF_ID_Write, ID_ControlMux, IF_Flush;
    //top a1(Clk, Rst, PC, WriteData,
    //       IF_instr, IF_pcAddResult, IF_realNextPC, IF_myPC, IF_nextPC,
    //       ID_instr, ID_pc, ID_RegDst, ID_ALUSrc, ID_ALUControl, ID_MemSize, ID_MemRead, ID_MemWrite, ID_Branch, ID_regWrite, ID_MemToReg, ID_readData1, ID_readData2, ID_32imm, ID_jumpAddr, ID_myPC,
    //       EX_RegDst, EX_ALUSrc, EX_ALUControl, EX_MemSize, EX_MemRead, EX_MemWrite, EX_Branch, EX_regWrite, EX_MemToReg, EX_pc, EX_readData1, EX_readData2, EX_32imm, EX_instr20_16, EX_instr15_11, EX_ALUZero, EX_RegDstMux, EX_ALUResult, EX_aluB, EX_aluA, EX_tempRegDstMux, EX_tempALUResult, EX_myPC,
    //       MEM_MemRead, MEM_MemWrite, MEM_Branch, MEM_regWrite, MEM_readData2, MEM_ALUZero, MEM_RegDstMux, MEM_MemToReg, MEM_ALUResult, MEM_MemSize, MEM_ReadData, MEM_myPC, MEM_PCSrc,
    //       WB_regWrite, WB_MemToReg, WB_ReadData, WB_ALUResult, WB_RegDstMux,
    //       PCWrite, IF_ID_Write, ID_ControlMux, IF_Flush);
    // =======================================================

    initial begin
        Clk <= 1'b0;
        forever #10 Clk <= ~Clk;
    end

    initial begin
        Rst <= 1;
        @(posedge Clk); #5;
        Rst <= 0;
        while (1) begin
            $display("PC: %d | WriteData: %d", PC, WriteData);
            #20;
        end
    end

endmodule

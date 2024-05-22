//  Team Members:    Shawn Kim, JhihYang Wu, Andres Galvez
//  % Effort    :    SK: 33%, JW: 33%, AG: 33%
//
// ECE369A
// 

`timescale 1ns / 1ps

    // ================= FOR IMPLEMENTATION ==================
module top(Clk, Rst, RegFileV0, RegFileV1);
    // =======================================================
    // ==================== FOR DEBUGGING ====================
//module top(Clk, Rst, WB_myPC, WB_WriteData,
//           IF_instr, IF_pcAddResult, IF_realNextPC, IF_myPC, IF_nextPC,
//           ID_instr, ID_pc, ID_RegDst, ID_ALUSrc, ID_ALUControl, ID_MemSize, ID_MemRead, ID_MemWrite, ID_Branch, ID_regWrite, ID_MemToReg, ID_readData1, ID_readData2, ID_32imm, ID_jumpAddr, ID_myPC,
//           EX_RegDst, EX_ALUSrc, EX_ALUControl, EX_MemSize, EX_MemRead, EX_MemWrite, EX_Branch, EX_regWrite, EX_MemToReg, EX_pc, EX_readData1, EX_readData2, EX_32imm, EX_instr20_16, EX_instr15_11, EX_ALUZero, EX_RegDstMux, EX_ALUResult, EX_aluB, EX_aluA, EX_tempRegDstMux, EX_tempALUResult, EX_myPC,
//           MEM_MemRead, MEM_MemWrite, MEM_Branch, MEM_regWrite, MEM_readData2, MEM_ALUZero, MEM_RegDstMux, MEM_MemToReg, MEM_ALUResult, MEM_MemSize, MEM_ReadData, MEM_myPC, MEM_PCSrc,
//           WB_regWrite, WB_MemToReg, WB_ReadData, WB_ALUResult, WB_RegDstMux,
//           PCWrite, IF_ID_Write, ID_ControlMux, IF_Flush);
//    output IF_instr, IF_pcAddResult, IF_realNextPC, IF_myPC, IF_nextPC;
//    output ID_instr, ID_pc, ID_RegDst, ID_ALUSrc, ID_ALUControl, ID_MemSize, ID_MemRead, ID_MemWrite, ID_Branch, ID_regWrite, ID_MemToReg, ID_readData1, ID_readData2, ID_32imm, ID_jumpAddr, ID_myPC;
//    output EX_RegDst, EX_ALUSrc, EX_ALUControl, EX_MemSize, EX_MemRead, EX_MemWrite, EX_Branch, EX_regWrite, EX_MemToReg, EX_pc, EX_readData1, EX_readData2, EX_32imm, EX_instr20_16, EX_instr15_11, EX_ALUZero, EX_RegDstMux, EX_ALUResult, EX_aluB, EX_aluA, EX_tempRegDstMux, EX_tempALUResult, EX_myPC;
//    output MEM_MemRead, MEM_MemWrite, MEM_Branch, MEM_regWrite, MEM_readData2, MEM_ALUZero, MEM_RegDstMux, MEM_MemToReg, MEM_ALUResult, MEM_MemSize, MEM_ReadData, MEM_myPC, MEM_PCSrc;
//    output WB_regWrite, WB_MemToReg, WB_ReadData, WB_ALUResult, WB_RegDstMux;
//    output PCWrite, IF_ID_Write, ID_ControlMux, IF_Flush;
    // =======================================================

    input Clk, Rst;
    wire [31:0] WB_myPC, WB_WriteData;
    output wire [31:0] RegFileV0, RegFileV1;

    // Pipeline regs.
    IF_ID_Register IF_ID_reg(Clk, Rst, IF_ID_Write,
                             IF_instr & {32{~IF_Flush}},
                             IF_pcAddResult & {32{~IF_Flush}},
                             ID_instr,
                             ID_pc,
                             IF_myPC & {32{~IF_Flush}},
                             ID_myPC);
    ID_EX_Register ID_EX_reg(Clk, Rst,
                             ID_RegDst & {1{ID_ControlMux}}, EX_RegDst,
                             ID_ALUSrc & {1{ID_ControlMux}}, EX_ALUSrc,
                             ID_ALUControl & {4{ID_ControlMux}}, EX_ALUControl,
                             ID_MemSize & {2{ID_ControlMux}}, EX_MemSize,
                             ID_MemRead & {1{ID_ControlMux}}, EX_MemRead,
                             ID_MemWrite & {1{ID_ControlMux}}, EX_MemWrite,
                             ID_Branch & {1{ID_ControlMux}}, EX_Branch,
                             ID_regWrite & {1{ID_ControlMux}}, EX_regWrite,
                             ID_MemToReg & {1{ID_ControlMux}}, EX_MemToReg,
                             ID_pc & {32{ID_ControlMux}}, EX_pc,
                             ID_readData1 & {32{ID_ControlMux}}, EX_readData1,
                             ID_readData2 & {32{ID_ControlMux}}, EX_readData2,
                             ID_32imm & {32{ID_ControlMux}}, EX_32imm,
                             ID_instr[20:16] & {5{ID_ControlMux}}, EX_instr20_16,
                             ID_instr[15:11] & {5{ID_ControlMux}}, EX_instr15_11,
                             ID_myPC & {32{ID_ControlMux}}, EX_myPC);
    EX_MEM_Register EX_MEM_reg(Clk, Rst,
                               EX_MemRead, MEM_MemRead,
                               EX_MemWrite, MEM_MemWrite,
                               EX_Branch, MEM_Branch,
                               EX_regWrite, MEM_regWrite,
                               EX_readData2, MEM_readData2,
                               EX_ALUZero, MEM_ALUZero,
                               EX_RegDstMux, MEM_RegDstMux,
                               EX_MemToReg, MEM_MemToReg,
                               EX_ALUResult, MEM_ALUResult,
                               EX_MemSize, MEM_MemSize,
                               EX_myPC, MEM_myPC,
                               EX_pcAddResult, MEM_pc);
    MEM_WB_Register MEM_WB_reg(Clk, Rst,
                               MEM_regWrite, WB_regWrite,
                               MEM_MemToReg, WB_MemToReg,
                               MEM_ReadData, WB_ReadData,
                               MEM_ALUResult, WB_ALUResult,
                               MEM_RegDstMux, WB_RegDstMux,
                               MEM_myPC, WB_myPC);

    // Instruction fetch components.
    wire [31:0] IF_instr;
    wire [31:0] IF_pcAddResult;
    wire [31:0] IF_nextPC;
    assign IF_nextPC = ({32{~MEM_PCSrc}} & IF_pcAddResult) | ({32{MEM_PCSrc}} & MEM_pc);
    wire [31:0] IF_realNextPC;
    wire [31:0] IF_tempInstr;
    wire [31:0] IF_myPC;
    wire [31:0] IF_curPC;
    Mux32Bit2To1 IF_jumpMux(IF_realNextPC, IF_nextPC, ID_jumpAddr, ID_ALUControl == 15);
    ProgramCounter IF_pc_reg(IF_realNextPC, IF_curPC, Rst, Clk, PCWrite & (~MEM_Branch | MEM_PCSrc));
    InstructionMemory IF_mem(IF_curPC, IF_tempInstr);
    assign IF_instr = IF_tempInstr & {32{ID_ALUControl != 15}};
    PCAdder IF_pcadder(IF_curPC, IF_pcAddResult);
    assign IF_myPC = IF_curPC;

    // Instruction decode components.
    wire [31:0] ID_instr;
    wire [31:0] ID_pc;
    wire [31:0] ID_readData1, ID_readData2;
    wire [31:0] ID_32imm;
    wire ID_regWrite, ID_ALUSrc, ID_RegDst, ID_MemWrite, ID_MemRead, ID_Branch, ID_MemToReg;
    wire [3:0] ID_ALUControl;
    wire [1:0] ID_MemSize;
    wire [31:0] ID_jumpAddr;
    Mux32Bit2To1 ID_jumpAddrMux(ID_jumpAddr, ID_readData1, {ID_pc[31:28], ID_instr[25:0], 2'b0}, ID_instr[31:26] == 2 | ID_instr[31:26] == 3);
    RegisterFile ID_regfile(ID_instr[25:21], ID_instr[20:16],
                            WB_RegDstMux, WB_WriteData, WB_regWrite, Clk,
                            ID_readData1, ID_readData2, Rst,
                            RegFileV0, RegFileV1);
    SignExtension ID_signEx(ID_instr[15:0], ID_32imm);
    Controller ID_controller(ID_instr, ID_regWrite, ID_ALUSrc, ID_ALUControl,
                             ID_RegDst, ID_MemWrite, ID_MemRead, ID_Branch,
                             ID_MemToReg, ID_MemSize);
    wire [31:0] ID_myPC;
    wire PCWrite, IF_ID_Write, ID_ControlMux, IF_Flush;
    HazardUnit ID_hazardUnit(PCWrite, IF_ID_Write, ID_ControlMux, IF_Flush,
                             ID_instr[25:21], ID_instr[20:16], ID_Branch, ID_ALUControl,
                             EX_regWrite, EX_RegDstMux, EX_Branch,
                             MEM_regWrite, MEM_RegDstMux, MEM_Branch,
                             ID_instr[31:26]);

    // Execute components.
    wire EX_RegDst;
    wire EX_ALUSrc;
    wire [3:0] EX_ALUControl;
    wire [1:0] EX_MemSize;
    wire EX_MemRead;
    wire EX_MemWrite;
    wire EX_Branch;
    wire EX_regWrite;
    wire EX_MemToReg;
    wire [31:0] EX_pc;
    wire [31:0] EX_readData1;
    wire [31:0] EX_readData2;
    wire [31:0] EX_32imm;
    wire [4:0] EX_instr20_16;
    wire [4:0] EX_instr15_11;
    wire [31:0] EX_ALUResult;
    wire EX_ALUZero;
    wire [31:0] EX_aluA;
    Mux32Bit2To1 EX_shiftMux(EX_aluA, EX_readData1, EX_readData2, EX_ALUControl == 7 | EX_ALUControl == 8);
    wire [31:0] EX_aluB;
    assign EX_aluB = ({32{~EX_ALUSrc}} & EX_readData2) | ({32{EX_ALUSrc}} & EX_32imm);
    wire [4:0] EX_RegDstMux;
    wire [4:0] EX_tempRegDstMux;
    assign EX_tempRegDstMux = ({5{~EX_RegDst}} & EX_instr20_16) | ({5{EX_RegDst}} & EX_instr15_11);
    wire [31:0] EX_pcAddResult;
    assign EX_pcAddResult = EX_pc + {EX_32imm[29:0], 2'b0};
    wire [31:0] EX_tempALUResult;
    ALU32Bit EX_alu(EX_ALUControl, EX_aluA, EX_aluB, EX_tempALUResult, EX_ALUZero);
    Mux32Bit2To1 EX_ALUResultMux(EX_ALUResult, EX_tempALUResult, EX_pc, EX_ALUControl == 15);
    assign EX_RegDstMux = (EX_tempRegDstMux & {5{EX_ALUControl != 15}}) | (31 & {5{EX_ALUControl == 15}});
    wire [31:0] EX_myPC;

    // Memory components.
    wire MEM_MemRead;
    wire MEM_MemWrite;
    wire MEM_Branch;
    wire MEM_regWrite;
    wire [31:0] MEM_readData2;
    wire MEM_ALUZero;
    wire [4:0] MEM_RegDstMux;
    wire MEM_MemToReg;
    wire [31:0] MEM_ALUResult;
    wire [1:0] MEM_MemSize;
    wire MEM_PCSrc;
    assign MEM_PCSrc = MEM_Branch & MEM_ALUZero;
    wire [31:0] MEM_ReadData;
    DataMemory MEM_mem(MEM_ALUResult, MEM_readData2, Clk, MEM_MemWrite, MEM_MemRead, MEM_ReadData, MEM_MemSize);
    wire [31:0] MEM_myPC;
    wire [31:0] MEM_pc;

    // Write back components.
    wire WB_regWrite;
    wire WB_MemToReg;
    wire [31:0] WB_ReadData;
    wire [31:0] WB_ALUResult;
    wire [4:0] WB_RegDstMux;
    assign WB_WriteData = {32{WB_regWrite}} & (({32{~WB_MemToReg}} & WB_ReadData) | ({32{WB_MemToReg}} & WB_ALUResult));

endmodule


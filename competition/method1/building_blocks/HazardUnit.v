`timescale 1ns / 1ps

module HazardUnit(PCWrite, IF_ID_Write, ID_ControlMux, IF_Flush,
                  ID_rs, ID_rt, ID_Branch, ID_ALUControl,
                  EX_regWrite, EX_RegDstMux, EX_Branch,
                  MEM_regWrite, MEM_RegDstMux, MEM_Branch,
                  ID_opcode);
    
    output reg PCWrite, IF_ID_Write, ID_ControlMux, IF_Flush;

    input [4:0] ID_rs, ID_rt;
    input ID_Branch;
    input [3:0] ID_ALUControl;
    input EX_regWrite, MEM_regWrite;
    input [4:0] EX_RegDstMux, MEM_RegDstMux;
    input EX_Branch, MEM_Branch;
    input [5:0] ID_opcode;

    wire readData2Important = ~(ID_opcode == 8 ||   // addi
                                ID_opcode == 35 ||  // lw
                                ID_opcode == 33 ||  // lh
                                ID_opcode == 32 ||  // lb
                                ID_opcode == 12 ||  // andi
                                ID_opcode == 13 ||  // ori
                                ID_opcode == 14 ||  // xori
                                ID_opcode == 10 ||  // slti
                                ID_opcode == 1);    // bltz, bgez

    always @(*) begin
        // Default values.
        PCWrite = 1;
        IF_ID_Write = 1;
        ID_ControlMux = 1;
        IF_Flush = 0;
        
        if (EX_regWrite == 1 &&
            (EX_RegDstMux == ID_rs || (EX_RegDstMux == ID_rt && readData2Important))) begin
            // Wait for register file to be updated.
            PCWrite = 0;
            IF_ID_Write = 0;
            ID_ControlMux = 0;
            IF_Flush = 0;
        end

        else if (MEM_regWrite == 1 &&
            (MEM_RegDstMux == ID_rs || MEM_RegDstMux == ID_rt && readData2Important)) begin
            // Wait for register file to be updated.
            PCWrite = 0;
            IF_ID_Write = 0;
            ID_ControlMux = 0;
            IF_Flush = 0;
        end

        else if (ID_Branch) begin
            // Wait for branch to resolve.
            PCWrite = 0;
            IF_ID_Write = 1;
            ID_ControlMux = 1;
            IF_Flush = 1;
        end

        else if (EX_Branch) begin
            // Wait for branch to resolve.
            PCWrite = 0;
            IF_ID_Write = 0;
            ID_ControlMux = 0;
            IF_Flush = 0;
        end

        else if (MEM_Branch) begin
            // Branch resolved.
            PCWrite = 1;
            IF_ID_Write = 0;
            ID_ControlMux = 0;
            IF_Flush = 0;
        end

        else if (ID_ALUControl == 15) begin // Check if jump instruction in decode stage.
            // Crush instruction in fetch stage.
            PCWrite = 1;
            IF_ID_Write = 1;
            ID_ControlMux = 1;
            IF_Flush = 1;
        end

    end

endmodule


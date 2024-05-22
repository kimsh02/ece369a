`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Controller_tb.v
// Description - Test the 'Controller.v' module.
////////////////////////////////////////////////////////////////////////////////

module Controller_tb(); 

    reg [31:0] Instruction; // instruction for controller

    wire RegWrite, ALUSrc, RegDst, MemWrite, MemRead, Branch, MemToReg; // control bit outputs 
    wire [3:0] ALUControl;
    wire [1:0] MemSize;

    Controller c0(
        .Instruction(Instruction), 
        .RegWrite(RegWrite), 
        .ALUSrc(ALUSrc), 
        .ALUControl(ALUControl), 
        .RegDst(RegDst), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .Branch(Branch), 
        .MemToReg(MemToReg), 
        .MemSize(MemSize)
        );

    initial begin
        // Test case 1: 
        // ADDI $zero, $zero, 0 (not a valid instruction just testing control signals)
        Instruction = 32'h20_00_00_00;
        #10; // Wait for some time
        // Verify the results
        // note MemSize is X
        if (RegWrite == 1 &&
            ALUSrc == 1 && 
            ALUControl == 0 &&
            RegDst == 0 &&
            MemWrite == 0 &&
            MemRead == 0 &&
            Branch == 0 &&
            MemToReg == 1) $display("Test case 1 passed");
        else $display("Test case 1 failed");

        // Test case 2: 
        // ADD $zero, $zero, $zero (not a valid instruction just testing control signals)
        Instruction = 32'h00_00_00_20;
        #10; // Wait for some time
        // Verify the results
        // note MemSize is X
        if (RegWrite == 1 &&
            ALUSrc == 0 && 
            ALUControl == 0 &&
            RegDst == 1 &&
            MemWrite == 0 &&
            MemRead == 0 &&
            Branch == 0 &&
            MemToReg == 1) $display("Test case 2 passed");
        else $display("Test case 2 failed");

        // Test case 3: 
        // SW $zero, 0($zero) (not a valid instruction just testing control signals)
        Instruction = 32'hac_00_00_00;
        #10; // Wait for some time
        // Verify the results
        if (RegWrite == 0 &&
            ALUSrc == 1 && 
            ALUControl == 0 &&
            MemWrite == 1 &&
            MemRead == 0 &&
            Branch == 0 &&
            MemSize == 0) $display("Test case 3 passed");
        else $display("Test case 3 failed");
        // Test case 4: 
        // nop
        Instruction = 32'h00_00_00_00;
        #10; // Wait for some time
        // Verify the results

        if (RegWrite == 0 &&
            ALUSrc == 0 && 
            ALUControl == 0 &&
            MemWrite == 0 &&
            MemRead == 0 &&
            Branch == 0 &&
            MemSize == 0 &&
            RegDst == 0 &&
            MemToReg == 0) $display("Test case 4 passed");
        else $display("Test case 4 failed");

        // Stop the simulation
        $finish;
    end

endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

    reg [3:0] ALUControl;   // control bits for ALU operation
    reg [31:0] A, B;        // inputs

    wire [31:0] ALUResult;  // answer
    wire Zero;              // Zero = 1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );

    initial begin
        // Test case 1: Addition (ALUControl = 4'b0000)
        ALUControl = 4'b0000;
        A = 10;
        B = 20;
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 30 && Zero === 0) $display("Test case 1 passed");
        else $display("Test case 1 failed");

        // Test case 2: Subtraction (ALUControl = 4'b0001)
        ALUControl = 4'b0001;
        A = 30;
        B = 10;
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 20 && Zero === 0) $display("Test case 2 passed");
        else $display("Test case 2 failed");

        // Test case 3: Bitwise AND (ALUControl = 4'b0010)
        ALUControl = 4'b0010;
        A = 5;
        B = 3;
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 1 && Zero === 0) $display("Test case 3 passed");
        else $display("Test case 3 failed");

        // Test case 4: Bitwise OR (ALUControl = 4'b0011)
        ALUControl = 4'b0011;
        A = 5;
        B = 3;
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 7 && Zero === 0) $display("Test case 4 passed");
        else $display("Test case 4 failed");

        // Test case 5: Bitwise NOT OR (ALUControl = 4'b0101)
        ALUControl = 4'b0101;
        A = 5;
        B = 3; // Note that B's value doesn't matter for this operation
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 0 && Zero === 0) $display("Test case 5 passed");
        else $display("Test case 5 failed");

        // Test case 6: Bitwise XOR (ALUControl = 4'b0110)
        ALUControl = 4'b0110;
        A = 5;
        B = 3;
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 6 && Zero === 0) $display("Test case 6 passed");
        else $display("Test case 6 failed");

        // Test case 7: Right Shift (ALUControl = 4'b0111)
        ALUControl = 4'b0111;
        A = 16; // Value to be shifted
        B = 2;  // Shamt value (number of positions to shift)
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 4 && Zero === 0) $display("Test case 7 passed");
        else $display("Test case 7 failed");

        // Test case 8: Left Shift (ALUControl = 4'b1000)
        ALUControl = 4'b1000;
        A = 5;  // Value to be shifted
        B = 2;  // Shamt value (number of positions to shift)
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 20 && Zero === 0) $display("Test case 8 passed");
        else $display("Test case 8 failed");

        // Test case 9: Less Than (ALUControl = 4'b1001)
        ALUControl = 4'b1001;
        A = 5;
        B = 8;
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 1 && Zero === 0) $display("Test case 9 passed");
        else $display("Test case 9 failed");

        // Test case 10: Less Than (ALUControl = 4'b1001)
        ALUControl = 4'b1001;
        A = 9;
        B = 8;
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 0 && Zero === 1) $display("Test case 10 passed");
        else $display("Test case 10 failed");

        // Test case 11: Less Than (ALUControl = 4'b1001)
        ALUControl = 4'b1001;
        A = 8;
        B = 8;
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 0 && Zero === 1) $display("Test case 11 passed");
        else $display("Test case 11 failed");

        // Test case 12: Multiplication (ALUControl = 4'b0100)
        ALUControl = 4'b0100;
        A = 8;
        B = 7;
        #10; // Wait for some time
        // Verify the results
        if (ALUResult === 56 && Zero === 0) $display("Test case 12 passed");
        else $display("Test case 12 failed");

        // Stop the simulation
        $finish;
    end

endmodule


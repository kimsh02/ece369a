`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input [3:0] ALUControl; // control bits for ALU operation
	input [31:0] A, B;	    // inputs

	output reg [31:0] ALUResult;    // answer
	output Zero;                // Zero = 1 if ALUResult == 0

    wire [31:0] sub_result;
    assign sub_result = A - B;

    wire [31:0] right_shifter_out;
    assign right_shifter_out = A >> B[10:6];

    wire [31:0] left_shifter_out;
    assign left_shifter_out = A << B[10:6];

    wire aIsNeg;
    assign aIsNeg = A[31];

    always @(*) begin
        case (ALUControl)
            0: begin
                // ALUResult = A + B
                ALUResult <= A + B;
            end
            1: begin
                // ALUResult = A - B
                ALUResult <= sub_result;
            end
            2: begin
                // ALUResult = A & B
                ALUResult <= A & B;
            end
            3: begin
                // ALUResult = A | B
                ALUResult <= A | B;
            end
            4: begin
                // ALUResult = A * B
                ALUResult <= A * B;
            end
            5: begin
                // ALUResult = ~(A | B)
                ALUResult <= ~(A | B);
            end
            6: begin
                // ALUResult = A ^ B
                ALUResult <= A ^ B;
            end
            7: begin
                // ALUResult = A >> shamt
                ALUResult <= right_shifter_out;
            end
            8: begin
                // ALUResult = A << shamt
                ALUResult <= left_shifter_out;
            end
            9: begin // SLT, SLTI
                // ALUResult = 1 if A < B else 0
                ALUResult <= {31'b0, sub_result[31]};
            end
            10: begin // BGEZ
                // ALUResult = 0 if A >= 0 else 1
                ALUResult <= aIsNeg;
            end
            11: begin // BNE
                // ALUResult = 0 if A != B else 1
                ALUResult <= A == B;
            end
            12: begin // BGTZ
                // ALUResult = 0 if A > 0 else 1
                ALUResult <= aIsNeg | (A == 32'b0);
            end
            13: begin // BLEZ
                // ALUResult = 0 if A <= 0 else 1
                ALUResult <= (aIsNeg == 32'b0) & ((A == 32'b0) ^ 32'b1);
            end
            14: begin // BLTZ
                // ALUResult = 0 if A < 0 else 1
                ALUResult <= (aIsNeg == 32'b0);
            end
            15: begin  // J
                // ALUResult = 0
                ALUResult <= 0;
            end
            default: begin
                ALUResult <= 32'bX;
            end
        endcase
    end

    assign Zero = (ALUResult == 32'b0);

endmodule


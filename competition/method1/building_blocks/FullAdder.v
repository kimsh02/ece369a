`timescale 1ns / 1ps

module FullAdder(A, B, Cin, S, Cout);

    input A, B, Cin;
    output reg S, Cout;

    always @(A, B, Cin) begin
        S <= A ^ B ^ Cin;
        Cout <= (A & B) | (A & Cin) | (B & Cin);
    end

endmodule


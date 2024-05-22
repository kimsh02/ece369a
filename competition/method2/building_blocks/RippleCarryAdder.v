// N-bit ripple carry adder

`timescale 1ns / 1ps

module RippleCarryAdder #(parameter N=12) (A, B, Cin, S, Cout);

    input [N-1:0] A, B;
    input Cin;
    output wire [N-1:0] S;
    output wire Cout;

    wire [N:0] wires;

    assign wires[0] = Cin;
    assign Cout = wires[N];

    genvar i;
    generate
    for (i = 0; i < N; i = i + 1) begin
        FullAdder a1(A[i], B[i], wires[i], S[i], wires[i+1]);
    end
    endgenerate

endmodule


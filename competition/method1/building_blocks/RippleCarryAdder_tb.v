`timescale 1ns / 1ps

module RippleCarryAdder_tb();
    
    reg [11:0] A, B;
    reg Cin;
    wire [11:0] S;
    wire Cout;

    RippleCarryAdder #(12) a1(A, B, Cin, S, Cout);

    initial begin
        A <= 1; B <= 1; Cin <= 0; #100;
        A <= 321; B <= 494; Cin <= 0; #100;
        A <= 321; B <= 494; Cin <= 1; #100;
        A <= 4095; B <= 0; Cin <= 0; #100;
        A <= 4095; B <= 0; Cin <= 1; #100;
        A <= 4095; B <= 2; Cin <= 1; #100;
    end

endmodule


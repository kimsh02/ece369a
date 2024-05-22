`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ProgramCounter_tb.v
// Description - Test the 'ProgramCounter.v' module.
////////////////////////////////////////////////////////////////////////////////

module ProgramCounter_tb();

	reg [31:0] Address;
	reg Reset, Clk;

	wire [31:0] PCResult;

    ProgramCounter u0(
        .Address(Address), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(Clk)
    );

	always begin
	   Clk <= 0;
	   #100;
	   Clk <= 1;
	   #100;
	end

	initial begin
        #450;
        Reset <= 1;
        @(posedge Clk) #50;
        Reset <= 0;
        Address <= 1;
        @(posedge Clk) #50;
        Address <= 20;
        @(posedge Clk) #50;
        Address <= 2141;
        @(posedge Clk) #50;
        Address <= 2313111;
        @(posedge Clk) #50;
        Address <= 21391093;
        @(posedge Clk) #50;
        Address <= 999;
	end

endmodule


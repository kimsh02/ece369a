`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1 
// Module - PCAdder_tb.v
// Description - Test the 'PCAdder.v' module.
////////////////////////////////////////////////////////////////////////////////

module PCAdder_tb();

    reg [31:0] PCResult;

    wire [31:0] PCAddResult;

    PCAdder u0(
        PCResult,
        PCAddResult
    );

	initial begin
	   PCResult <= 0;
	   #100
	   PCResult <= 100;
	   #100
	   PCResult <= 3213141;
	   #100
	   PCResult <= 21141412;
	   #100
	   PCResult <= 494994;
	end

endmodule


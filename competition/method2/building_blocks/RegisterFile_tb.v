`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;


	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
        // Test case
        // First, write arbitrary values into registers 8 through 25

        RegWrite = 1'b1; // Enable write operation
        WriteData = 12345678; // Arbitrary data to be written

        // Write data to registers 8 through 25
        for (WriteRegister = 8; WriteRegister <= 25; WriteRegister = WriteRegister + 1) begin
            @(posedge Clk); #5;
            WriteData = WriteData + 1;
        end

        // Read values from these registers 2-by-2
        ReadRegister1 = 8;
        ReadRegister2 = 9;
        RegWrite = 1'b0; // Disable write operation

        // Read and check values
        for (ReadRegister1 = 8; ReadRegister1 <= 24; ReadRegister1 = ReadRegister1 + 1) begin
            ReadRegister2 = ReadRegister1 + 1;
            @(negedge Clk) #5;
            if (ReadData1 == 12345670 + ReadRegister1 && ReadData2 == 12345670 + ReadRegister1 + 1) $display("Test case %d passed", ReadRegister1 - 7);
            else $display("Test case %d failed", ReadRegister1 - 7);
        end
        
    end

endmodule


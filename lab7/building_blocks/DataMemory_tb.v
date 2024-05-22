`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;
    reg     [1:0]   MemSize;

    wire    [31:0]  ReadData;

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData),
        .MemSize(MemSize)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
        // Test case
        // You can write your test case here to verify DataMemory functionality

        // Example: Write data to memory
        Address = 16; // Assuming you want to write to address 16 (0x10)
        WriteData = 32'hABCDEFFF; // Data to be written
        MemWrite = 1'b1; // Enable write operation
        MemRead = 0'b0; // Disable read operation
        MemSize = 0;

        #20; // Wait for a few clock cycles

        // Example: Read data from memory
        Address = 16; // Assuming you want to read from address 16 (0x10)
        MemWrite = 1'b0; // Disable write operation
        MemRead = 1'b1; // Enable read operation
        MemSize = 0;

        @(posedge Clk); #5;

        // Write to upper half
        Address = 18;
        WriteData = 32'h12345678; // Data to be written
        MemWrite = 1'b1; // Enable write operation
        MemRead = 0'b0; // Disable read operation
        MemSize = 1;

        @(posedge Clk); #5;

        // Read data from memory
        Address = 16; // Assuming you want to read from address 16 (0x10)
        MemWrite = 1'b0; // Disable write operation
        MemRead = 1'b1; // Enable read operation
        MemSize = 0;

        @(posedge Clk); #5;

        // Read data from memory
        Address = 16; // Assuming you want to read from address 16 (0x10)
        MemWrite = 1'b0; // Disable write operation
        MemRead = 1'b1; // Enable read operation
        MemSize = 1;

        @(posedge Clk); #5;

        // Read data from memory
        Address = 18; 
        MemWrite = 1'b0; // Disable write operation
        MemRead = 1'b1; // Enable read operation
        MemSize = 1;

        @(posedge Clk); #5;

        // Write on byte at a time for 4 bytes
        Address = 32;
        WriteData = 32'h000000ab; // Data to be written
        MemWrite = 1'b1; // Enable write operation
        MemRead = 0'b0; // Disable read operation
        MemSize = 2;
        @(posedge Clk); #5;
        Address = 33;
        WriteData = 32'h398451cd; // Data to be written
        MemWrite = 1'b1; // Enable write operation
        MemRead = 0'b0; // Disable read operation
        MemSize = 2;
        @(posedge Clk); #5;
        Address = 34;
        WriteData = 32'h000000ef; // Data to be written
        MemWrite = 1'b1; // Enable write operation
        MemRead = 0'b0; // Disable read operation
        MemSize = 2;
        @(posedge Clk); #5;
        Address = 35;
        WriteData = 32'h99999911; // Data to be written
        MemWrite = 1'b1; // Enable write operation
        MemRead = 0'b0; // Disable read operation
        MemSize = 2;
        @(posedge Clk); #5;

        // Read data from memory
        Address = 32; 
        MemWrite = 1'b0; // Disable write operation
        MemRead = 1'b1; // Enable read operation
        MemSize = 0;
        @(posedge Clk); #5;

        // Read one byte at a time for 4 bytes
        Address = 32; 
        MemWrite = 1'b0; // Disable write operation
        MemRead = 1'b1; // Enable read operation
        MemSize = 2;
        @(posedge Clk); #5;
        Address = 33; 
        MemWrite = 1'b0; // Disable write operation
        MemRead = 1'b1; // Enable read operation
        MemSize = 2;
        @(posedge Clk); #5;
        Address = 34; 
        MemWrite = 1'b0; // Disable write operation
        MemRead = 1'b1; // Enable read operation
        MemSize = 2;
        @(posedge Clk); #5;
        Address = 35; 
        MemWrite = 1'b0; // Disable write operation
        MemRead = 1'b1; // Enable read operation
        MemSize = 2;
        @(posedge Clk); #5;

    end

endmodule


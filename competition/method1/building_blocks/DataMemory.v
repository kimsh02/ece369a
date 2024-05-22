`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, MemSize); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 
    input [1:0] MemSize;    // 0 means load/read word, 1 means load/read half, 2 means load/read byte

    output reg[31:0] ReadData; // Contents of memory location at Address

    reg [31:0] memory[0:8192-1]; // 8K memory (8192 32-bit words)

    initial begin
        $readmemh("data_memory.mem", memory);
    end

    // Reads.
    always @(*) begin
        if (MemRead) begin
            case (MemSize)
                0: begin
                    // Read entire word.
                    ReadData <= memory[Address[14:2]];
                end
                1: begin
                    // Read half a word.
                    if (Address[1] == 1'b1) begin
                        // Read upper half.
                        ReadData <= {{16{memory[Address[14:2]][31]}}, memory[Address[14:2]][31:16]};
                    end
                    else begin
                        // Read bottom half.
                        ReadData <= {{16{memory[Address[14:2]][15]}}, memory[Address[14:2]][15:0]};
                    end
                end
                2: begin
                    // Read a byte of a word.
                    case (Address[1:0])
                        0: begin
                            // Read bottom most byte.
                            ReadData <= {{24{memory[Address[14:2]][7]}}, memory[Address[14:2]][7:0]};
                        end
                        1: begin
                            // Read second bottom most byte.
                            ReadData <= {{24{memory[Address[14:2]][15]}}, memory[Address[14:2]][15:8]};
                        end
                        2: begin
                            // Read second upper most byte.
                            ReadData <= {{24{memory[Address[14:2]][23]}}, memory[Address[14:2]][23:16]};
                        end
                        3: begin
                            // Read upper most byte.
                            ReadData <= {{24{memory[Address[14:2]][31]}}, memory[Address[14:2]][31:24]};
                        end
                    endcase
                end
                default: begin
                    ReadData <= 32'bx;
                end
            endcase
        end
        else begin
            ReadData <= 0;
        end
    end

    // Writes.
    always @(posedge Clk) begin
        if (MemWrite) begin
            case (MemSize)
                0: begin
                    // Write entire word.
                    memory[Address[14:2]] <= WriteData;
                end
                1: begin
                    // Write half a word.
                    if (Address[1] == 1'b1) begin
                        // Write upper half.
                        memory[Address[14:2]][31:16] <= WriteData[15:0];
                    end
                    else begin
                        // Write bottom half.
                        memory[Address[14:2]][15:0] <= WriteData[15:0];
                    end
                end
                2: begin
                    // Write a byte of a word.
                    case (Address[1:0])
                        0: begin
                            // Write bottom most byte.
                            memory[Address[14:2]][7:0] <= WriteData[7:0];
                        end
                        1: begin
                            // Write second bottom most byte.
                            memory[Address[14:2]][15:8] <= WriteData[7:0];
                        end
                        2: begin
                            // Write second upper most byte.
                            memory[Address[14:2]][23:16] <= WriteData[7:0];
                        end
                        3: begin
                            // Read upper most byte.
                            memory[Address[14:2]][31:24] <= WriteData[7:0];
                        end
                    endcase
                end
            endcase
        end
    end

endmodule


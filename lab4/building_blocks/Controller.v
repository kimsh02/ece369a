`timescale 1ns / 1ps

module Controller(Instruction, RegWrite, ALUSrc, ALUControl, RegDst, MemWrite, MemRead, Branch, MemToReg, MemSize);
    input [31:0] Instruction;
    output reg RegWrite, ALUSrc, RegDst, MemWrite, MemRead, Branch, MemToReg;
    output reg [3:0] ALUControl;
    output reg [1:0] MemSize;

    always @(Instruction) begin
        case (Instruction)
            32'b0: begin
                RegWrite = 0;
                ALUSrc = 0;
                RegDst = 0;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                MemToReg = 0;
                MemSize = 2'b00;
                ALUControl = 0;
            end
            default: begin
        case (Instruction[31:26]) // op field
            // R-type instructions
            6'b00_0000: begin

                // controls that are constant for R-type
                RegWrite = 1;
                ALUSrc = 0;
                RegDst = 1;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                MemToReg = 1;
                MemSize = 2'bxx;

                case (Instruction[5:0]) // ADD
                    6'b10_0000: begin
                        ALUControl = 0;
                    end
                    6'b10_0010: begin // SUB
                        ALUControl = 1;
                    end
                    6'b10_0100: begin // AND
                        ALUControl = 2;
                    end
                    6'b10_0101: begin // OR
                        ALUControl = 3;
                    end
                    6'b10_0111: begin // NOR
                        ALUControl = 5;
                    end
                    6'b10_0110: begin // XOR
                        ALUControl = 6;
                    end
                    6'b00_0000: begin // SLL
                        ALUControl = 8;
                        ALUSrc = 1;
                    end
                    6'b10_1010: begin // SLT
                        ALUControl = 9;
                    end
                    6'b00_0010: begin // SRL
                        ALUControl = 7;
                        ALUSrc = 1;
                    end
                    6'b00_1000: begin // JR
                        ALUSrc = 1'bx;
                        RegWrite = 0;
                        RegDst = 1'bx;
                        ALUControl = 15;
                        MemWrite = 0;
                        MemRead = 0;
                        Branch = 1'b0;
                        MemToReg = 1'bx;
                        MemSize = 2'bxx;
                    end
                endcase
            end
            // REGIMM instructions
            6'b00_0001: begin
                // controls that are constant
                ALUSrc = 0;
                RegWrite = 0;
                RegDst = 1'bx;
                MemWrite = 0;
                MemRead = 0;
                Branch = 1;
                MemToReg = 1'bx;
                MemSize = 2'bxx;
                case (Instruction[20:16])
                    5'b0_0001: begin // BGEZ
                        ALUControl = 10;
                    end
                    5'b0_0000: begin // BLTZ
                        ALUControl = 14;
                    end
                endcase
            end
            // I-type instructions

            // controls that are constant for I-type
            6'b00_0110: begin // BLEZ
                ALUSrc = 0;
                RegWrite = 0;
                RegDst = 1'bx;
                ALUControl = 13;
                MemWrite = 0;
                MemRead = 0;
                Branch = 1;
                MemToReg = 1'bx;
                MemSize = 2'bxx;
            end

            6'b00_0111: begin // BGTZ
                ALUSrc = 0;
                RegWrite = 0;
                RegDst = 1'bx;
                ALUControl = 12;
                MemWrite = 0;
                MemRead = 0;
                Branch = 1;
                MemToReg = 1'bx;
                MemSize = 2'bxx;
            end
            6'b00_0101: begin // BNE
                ALUSrc = 0;
                RegWrite = 0;
                RegDst = 1'bx;
                ALUControl = 11;
                MemWrite = 0;
                MemRead = 0;
                Branch = 1;
                MemToReg = 1'bx;
                MemSize = 2'bxx;
            end

            6'b00_0100: begin // BEQ
                ALUSrc = 0;
                RegWrite = 0;
                RegDst = 1'bx;
                ALUControl = 6;
                MemWrite = 0;
                MemRead = 0;
                Branch = 1;
                MemToReg = 1'bx;
                MemSize = 2'bxx;
            end

            6'b00_1010: begin // SLTI
                ALUSrc = 1;
                RegWrite = 1;
                RegDst = 0;
                ALUControl = 9;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                MemToReg = 1;
                MemSize = 2'bxx;
            end

            6'b00_1110: begin // XORI
                ALUSrc = 1;
                RegWrite = 1;
                RegDst = 0;
                ALUControl = 6;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                MemToReg = 1;
                MemSize = 2'bxx;
            end

            6'b00_1101: begin // ORI
                ALUSrc = 1;
                RegWrite = 1;
                RegDst = 0;
                ALUControl = 3;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                MemToReg = 1;
                MemSize = 2'bxx;
            end

            6'b00_1100: begin // ANDI
                ALUSrc = 1;
                RegWrite = 1;
                RegDst = 0;
                ALUControl = 2;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                MemToReg = 1;
                MemSize = 2'bxx;
            end
             

            6'b00_1000: begin // ADDI
                ALUSrc = 1;
                RegWrite = 1;
                RegDst = 0;
                ALUControl = 0;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                MemToReg = 1;
                MemSize = 2'bxx;
            end
            6'b10_0011: begin // LW
                ALUSrc = 1;
                RegWrite = 1;
                RegDst = 0;
                ALUControl = 0;
                MemWrite = 0;
                MemRead = 1;
                Branch = 0;
                MemToReg = 0;
                MemSize = 0; // load 4 bytes
            end
            6'b10_1011: begin // SW
                ALUSrc = 1;
                RegWrite = 0;
                RegDst = 1'bx;
                ALUControl = 0;
                MemWrite = 1;
                MemRead = 0;
                Branch = 0;
                MemToReg = 1'bx;
                MemSize = 0; // store 4 bytes
            end
            6'b10_1000: begin // SB
                ALUSrc = 1;
                RegWrite = 0;
                RegDst = 1'bx;
                ALUControl = 0;
                MemWrite = 1;
                MemRead = 0;
                Branch = 0;
                MemToReg = 1'bx;
                MemSize = 2; // store 1 byte
            end
            6'b10_0001: begin // LH
                ALUSrc = 1;
                RegWrite = 1;
                RegDst = 0;
                ALUControl = 0;
                MemWrite = 0;
                MemRead = 1;
                Branch = 0;
                MemToReg = 0;
                MemSize = 1; // load 2 bytes
            end
            6'b10_0000: begin // LB
                ALUSrc = 1;
                RegWrite = 1;
                RegDst = 0;
                ALUControl = 0;
                MemWrite = 0;
                MemRead = 1;
                Branch = 0;
                MemToReg = 0;
                MemSize = 2; // load 1 byte
            end
            6'b10_1001: begin // SH
                ALUSrc = 1;
                RegWrite = 0;
                RegDst = 1'bx;
                ALUControl = 0;
                MemWrite = 1;
                MemRead = 0;
                Branch = 0;
                MemToReg = 1'bx;
                MemSize = 1; // store 2 bytes
            end
            6'b011100: begin // MUL
                if (Instruction[5:0] == 2) begin
                    RegWrite = 1;
                    ALUSrc = 0;
                    RegDst = 1;
                    MemWrite = 0;
                    MemRead = 0;
                    Branch = 0;
                    MemToReg = 1;
                    ALUControl = 4;
                    MemSize = 2'bxx;
                end else begin
                    // Unsupported or invalid instruction.
                    RegWrite = 1'bx;
                    ALUSrc = 1'bx;
                    RegDst = 1'bx;
                    MemWrite = 1'bx;
                    MemRead = 1'bx;
                    Branch = 1'bx;
                    MemToReg = 1'bx;
                    ALUControl = 4'bxxxx;
                    MemSize = 2'bxx;
                end
            end

            // J-type instructions

            6'b00_0010: begin // J
                ALUSrc = 1'bx;
                RegWrite = 0;
                RegDst = 1'bx;
                ALUControl = 15;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                MemToReg = 1'bx;
                MemSize = 2'bxx;
            end
            6'b00_0011: begin // JAL
                ALUSrc = 1'bx;
                RegWrite = 1;
                RegDst = 1'bx;
                ALUControl = 15;
                MemWrite = 0;
                MemRead = 0;
                Branch = 1'b0;
                MemToReg = 1;
                MemSize = 2'bxx;
            end
            

            // TODO: branch and logical instructions (arithmetic and data instructions done)

            // // J-type instruction.
            // 6'b000010, 6'b000011: begin
            //     RegWrite = 0;
            //     ALUSrc = 0;
            //     RegDst = 0;
            //     MemWrite = 0;
            //     MemRead = 0;
            //     Branch = 0;
            //     MemToReg = 0;
            //     Jump = 1;
            //     // TODO: Add control signals to link register.
            // end
            // // ==============================



            // // I-type instruction.
            // // Data-type instructions (lw, sw, sb, lh, lb, sh)
            // 6'b100011, 6'b101011, 6'b101000, 6'b100001, 6'b100000, 6'b101001: begin
            //     // TODO
            // end
            // // Branch instructions (TODO)
            // // TODO
            // // ==============================



            default: begin
                // Unsupported or invalid instruction.
                RegWrite = 1'bx;
                ALUSrc = 1'bx;
                RegDst = 1'bx;
                MemWrite = 1'bx;
                MemRead = 1'bx;
                Branch = 1'bx;
                MemToReg = 1'bx;
                ALUControl = 4'bxxxx;
                MemSize = 2'bxx;
            end
        endcase
            end
        endcase
    end

endmodule

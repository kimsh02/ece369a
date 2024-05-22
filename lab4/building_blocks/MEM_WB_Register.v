`timescale 1ns / 1ps

module MEM_WB_Register(Clk, Rst,
                       regWrite_in, regWrite_out,
                       memToReg_in, memToReg_out,
                       readData_in, readData_out,
                       ALUResult_in, ALUResult_out,
                       regDstMux_in, regDstMux_out,
                       myPC_in, myPC_out);
    input Clk, Rst;
    input regWrite_in; output reg regWrite_out;
    input memToReg_in; output reg memToReg_out;
    input [31:0] readData_in; output reg [31:0] readData_out;
    input [31:0] ALUResult_in; output reg [31:0] ALUResult_out;
    input [4:0] regDstMux_in; output reg [4:0] regDstMux_out;
    input [31:0] myPC_in; output reg [31:0] myPC_out;

    always @(posedge Clk or posedge Rst)begin
        if (Rst) begin
            regWrite_out <= 0;
            memToReg_out <= 0;
            readData_out <= 0;
            ALUResult_out <= 0;
            regDstMux_out <= 0;
            myPC_out <= 32'bx;
        end else begin
            regWrite_out <= regWrite_in;
            memToReg_out <= memToReg_in;
            readData_out <= readData_in;
            ALUResult_out <= ALUResult_in;
            regDstMux_out <= regDstMux_in;
            myPC_out <= myPC_in;
        end
    end

endmodule


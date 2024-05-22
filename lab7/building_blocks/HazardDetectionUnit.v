//`timescale 1ns / 1ps
//
//module HazardDetectionUnit(IF_ID_rs, IF_ID_rt, ID_EX_MemRead, ID_EX_rs, ID_EX_rt, Flush, IF_ID_MemWrite, branch, ID_EX_RegWrite, ID_EX_JALSrc, ID_EX_rd, IF_ID_ALUop);
//
//    input ID_EX_MemRead, IF_ID_MemWrite, branch, ID_EX_RegWrite, ID_EX_JALSrc;
//    input [4:0] IF_ID_rs, IF_ID_rt, ID_EX_rt, ID_EX_rs, ID_EX_rd;
//    input [5:0] IF_ID_ALUop;
//    
//    output reg Flush;
//    
//    
//    initial begin 
//        Flush <= 0;
//    end
//    
//    
//    always @ (*)    begin
//       Flush <= 0;
//       
//       if ((IF_ID_rs == ID_EX_rt) && (ID_EX_MemRead == 1)
//            ) begin
//           Flush <= 1;
//       end
//       
//       if ((IF_ID_rt == ID_EX_rt) && (ID_EX_MemRead == 1)
//            && IF_ID_MemWrite == 0) begin
//            Flush <= 1;
//       end
//       
//       //slt $s0 (rd), rs, rt
//       //beq $s0 (rs), rt, offset
//       if (branch
//           && ID_EX_rd == IF_ID_rs
//           && ID_EX_RegWrite == 1
//           && IF_ID_ALUop != 6'b001110  //not jal in decode
//           && IF_ID_ALUop != 6'b001101  //not jump in decode
//           ) begin
//                Flush <= 1;
//       end
//       
//       
//       //addi $s2, $0, 2
//       //beq $s1, $s2, checktwo
//       if (branch
//           && IF_ID_rt == ID_EX_rt
//           && ID_EX_RegWrite == 1
//           && IF_ID_ALUop != 6'b001110  //not jal in decode
//           && IF_ID_ALUop != 6'b001101  //not jump in decode
//           )    begin
//           Flush <= 1;
//       end
//       
//       
//       //addi $s2, $s0, $s1
//       //beq $s3, $s2, checkfour
//       if (branch
//           && IF_ID_rt == ID_EX_rd
//           && ID_EX_RegWrite == 1
//           && IF_ID_ALUop != 6'b001110  //not jal in decode
//           && IF_ID_ALUop != 6'b001101  //not jump in decode
//           )    begin
//           Flush <= 1;
//       end           
//       
//       
//       
//       
//       
//       
//       // FLUSH FOR:
//       // addi rt rs imm
//       // bltz rs imm
//       if (IF_ID_rs == ID_EX_rt
//           && branch == 1
//           && ID_EX_RegWrite == 1
//           && IF_ID_ALUop != 6'b001110  //not jal in decode
//           && IF_ID_ALUop != 6'b001101  //not jump in decode
//           ) begin
//                Flush <= 1;
//       end
//       
//      
//       
//       end
//
//endmodule

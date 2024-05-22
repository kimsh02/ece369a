`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory  1
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
//
//
//we will store the machine code for a code written in C later. for now initialize 
//each entry to be its index * 3 (memory[i] = i * 3;)
//all you need to do is give an address as input and read the contents of the 
//address on your output port. 
// 
//Using a 32bit address you will index into the memory, output the contents of that specific 
//address. for data memory we are using 1K word of storage space. for the instruction memory 
//you may assume smaller size for practical purpose. you can use 128 words as the size and 
//hardcode the values.  in this case you need 7 bits to index into the memory. 
//
//be careful with the least two significant bits of the 32bit address. those help us index 
//into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 


////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address

    reg [31:0] memory [0:1023];

    initial begin
        $readmemh("instruction_memory.mem", memory);

        // memory[0] <= 32'h23bdfffc;	//	main:			addi	$sp, $sp, -4
        // memory[1] <= 32'hafbf0000;	//				sw	$ra, 0($sp)
        // memory[2] <= 32'h20040000;	//				addi	$a0, $zero, 0
        // memory[3] <= 32'h20050010;	//				addi	$a1, $zero, 16
        // memory[4] <= 32'h20060410;	//				addi	$a2, $zero, 1040
        // memory[5] <= 32'h0c00001a;	//				jal	vbsme
        // memory[6] <= 32'h20040490;	//				addi	$a0, $zero, 1168
        // memory[7] <= 32'h200504a0;	//				addi	$a1, $zero, 1184
        // memory[8] <= 32'h200614a0;	//				addi	$a2, $zero, 5280
        // memory[9] <= 32'h0c00001a;	//				jal	vbsme
        // memory[10] <= 32'h200416a0;	//				addi	$a0, $zero, 5792
        // memory[11] <= 32'h200516b0;	//				addi	$a1, $zero, 5808
        // memory[12] <= 32'h20061ab0;	//				addi	$a2, $zero, 6832
        // memory[13] <= 32'h0c00001a;	//				jal	vbsme
        // memory[14] <= 32'h20041b30;	//				addi	$a0, $zero, 6960
        // memory[15] <= 32'h20051b40;	//				addi	$a1, $zero, 6976
        // memory[16] <= 32'h20061f40;	//				addi	$a2, $zero, 8000
        // memory[17] <= 32'h0c00001a;	//				jal	vbsme
        // memory[18] <= 32'h20042040;	//				addi	$a0, $zero, 8256
        // memory[19] <= 32'h20052050;	//				addi	$a1, $zero, 8272
        // memory[20] <= 32'h20063050;	//				addi	$a2, $zero, 12368
        // memory[21] <= 32'h0c00001a;	//				jal	vbsme
        // memory[22] <= 32'h8fbf0000;	//				lw	$ra, 0($sp)
        // memory[23] <= 32'h23bd0004;	//				addi	$sp, $sp, 4
        // memory[24] <= 32'h08000019;	//				j	end_program
        // memory[25] <= 32'h08000019;	//	end_program:		j	end_program
        // memory[26] <= 32'h20020000;	//	vbsme:			addi	$v0, $zero, 0
        // memory[27] <= 32'h20030000;	//				addi	$v1, $zero, 0
        // memory[28] <= 32'h2010ffff;	//				addi	$s0, $zero, -1
        // memory[29] <= 32'h00108042;	//				srl	$s0, $s0, 1
        // memory[30] <= 32'h00008820;	//				add	$s1, $zero, $zero
        // memory[31] <= 32'h00009020;	//				add	$s2, $zero, $zero
        // memory[32] <= 32'h20130001;	//				addi	$s3, $zero, 1
        // memory[33] <= 32'h8c960000;	//				lw	$s6, 0($a0)
        // memory[34] <= 32'h8c970004;	//				lw	$s7, 4($a0)
        // memory[35] <= 32'h8c940008;	//				lw	$s4, 8($a0)
        // memory[36] <= 32'h8c95000c;	//				lw	$s5, 12($a0)
        // memory[37] <= 32'h02d4a022;	//				sub	$s4, $s6, $s4
        // memory[38] <= 32'h02f5a822;	//				sub	$s5, $s7, $s5
        // memory[39] <= 32'h22e80000;	//	VBSME_WHILE:		addi	$t0, $s7, 0
        // memory[40] <= 32'h7228c802;	//				mul	$t9, $s1, $t0
        // memory[41] <= 32'h0332c820;	//				add	$t9, $t9, $s2
        // memory[42] <= 32'h0019c880;	//				sll	$t9, $t9, 2
        // memory[43] <= 32'h0325c820;	//				add	$t9, $t9, $a1
        // memory[44] <= 32'h08000055;	//				j	SAD_ROUTINE
        // memory[45] <= 32'h0219402a;	//	SAD_DONE:		slt	$t0, $s0, $t9
        // memory[46] <= 32'h15000003;	//				bne	$t0, $zero, NEXT_POS
        // memory[47] <= 32'h00198020;	//				add	$s0, $zero, $t9
        // memory[48] <= 32'h00111020;	//				add	$v0, $zero, $s1
        // memory[49] <= 32'h00121820;	//				add	$v1, $zero, $s2
        // memory[50] <= 32'h02344022;	//	NEXT_POS:		sub	$t0, $s1, $s4
        // memory[51] <= 32'h02554822;	//				sub	$t1, $s2, $s5
        // memory[52] <= 32'h15000002;	//				bne	$t0, $zero, DONT_EXIT
        // memory[53] <= 32'h15200001;	//				bne	$t1, $zero, DONT_EXIT
        // memory[54] <= 32'h08000054;	//				j	EXIT_VBSME_WHILE
        // memory[55] <= 32'h12600003;	//	DONT_EXIT:		beq	$s3, $zero, NEXTIJ_ELSE
        // memory[56] <= 32'h2228ffff;	//				addi	$t0, $s1, -1
        // memory[57] <= 32'h22490001;	//				addi	$t1, $s2, 1
        // memory[58] <= 32'h0800003d;	//				j	AFTER_NEXTIJ
        // memory[59] <= 32'h22280001;	//	NEXTIJ_ELSE:		addi	$t0, $s1, 1
        // memory[60] <= 32'h2249ffff;	//				addi	$t1, $s2, -1
        // memory[61] <= 32'h0100502a;	//	AFTER_NEXTIJ:		slt	$t2, $t0, $zero
        // memory[62] <= 32'h1540000b;	//				bne	$t2, $zero, CHANGE_DIR
        // memory[63] <= 32'h228b0001;	//				addi	$t3, $s4, 1
        // memory[64] <= 32'h010b502a;	//				slt	$t2, $t0, $t3
        // memory[65] <= 32'h11400008;	//				beq	$t2, $zero, CHANGE_DIR
        // memory[66] <= 32'h0120502a;	//				slt	$t2, $t1, $zero
        // memory[67] <= 32'h15400006;	//				bne	$t2, $zero, CHANGE_DIR
        // memory[68] <= 32'h22ab0001;	//				addi	$t3, $s5, 1
        // memory[69] <= 32'h012b502a;	//				slt	$t2, $t1, $t3
        // memory[70] <= 32'h11400003;	//				beq	$t2, $zero, CHANGE_DIR
        // memory[71] <= 32'h00088820;	//				add	$s1, $zero, $t0
        // memory[72] <= 32'h00099020;	//				add	$s2, $zero, $t1
        // memory[73] <= 32'h08000027;	//				j	VBSME_WHILE
        // memory[74] <= 32'h12550006;	//	CHANGE_DIR:		beq	$s2, $s5, GO_DOWN
        // memory[75] <= 32'h16400003;	//				bne	$s2, $zero, GO_RIGHT
        // memory[76] <= 32'h12340002;	//				beq	$s1, $s4, GO_RIGHT
        // memory[77] <= 32'h12200001;	//				beq	$s1, $zero, GO_RIGHT
        // memory[78] <= 32'h08000051;	//				j	GO_DOWN
        // memory[79] <= 32'h22520001;	//	GO_RIGHT:		addi	$s2, $s2, 1
        // memory[80] <= 32'h08000052;	//				j	AFTER_GO_DOWN
        // memory[81] <= 32'h22310001;	//	GO_DOWN:		addi	$s1, $s1, 1
        // memory[82] <= 32'h3a730001;	//	AFTER_GO_DOWN:		xori	$s3, $s3, 0x1
        // memory[83] <= 32'h08000027;	//				j	VBSME_WHILE
        // memory[84] <= 32'h03e00008;	//	EXIT_VBSME_WHILE:	jr	$ra
        // memory[85] <= 32'h00004020;	//	SAD_ROUTINE:		add	$t0, $zero, $zero
        // memory[86] <= 32'h00004820;	//				add	$t1, $zero, $zero
        // memory[87] <= 32'h00005020;	//				add	$t2, $zero, $zero,
        // memory[88] <= 32'h8c8b0008;	//				lw	$t3, 8($a0)
        // memory[89] <= 32'h8c8c000c;	//				lw	$t4, 12($a0)
        // memory[90] <= 32'h8c8d0004;	//				lw	$t5, 4($a0)
        // memory[91] <= 32'h000d6880;	//				sll	$t5, $t5, 2
        // memory[92] <= 32'h000c7880;	//				sll	$t7, $t4, 2
        // memory[93] <= 32'h01af6822;	//				sub	$t5, $t5, $t7
        // memory[94] <= 32'h00c07020;	//				add	$t6, $a2, $zero
        // memory[95] <= 32'h012b782a;	//	SAD_ROUTINE_LOOP_OUTER:	slt	$t7, $t1, $t3
        // memory[96] <= 32'h11e00012;	//				beq	$t7, $zero, EXIT_SAD_ROUTINE
        // memory[97] <= 32'h014c782a;	//	SAD_ROUTINE_LOOP_INNER:	slt	$t7, $t2, $t4
        // memory[98] <= 32'h11e0000c;	//				beq	$t7, $zero, EXIT_INNER_LOOP
        // memory[99] <= 32'h8f2f0000;	//				lw	$t7, 0($t9)
        // memory[100] <= 32'h8dd80000;	//				lw	$t8, 0($t6)
        // memory[101] <= 32'h01f8b02a;	//				slt	$s6, $t7, $t8
        // memory[102] <= 32'h12c00002;	//				beq	$s6, $zero, ABS_OPT
        // memory[103] <= 32'h030fb022;	//				sub	$s6, $t8, $t7
        // memory[104] <= 32'h0800006a;	//				j	ABS_RES
        // memory[105] <= 32'h01f8b022;	//	ABS_OPT:		sub	$s6, $t7, $t8
        // memory[106] <= 32'h01164020;	//	ABS_RES:		add	$t0, $t0, $s6
        // memory[107] <= 32'h214a0001;	//				addi	$t2, $t2, 1
        // memory[108] <= 32'h23390004;	//				addi	$t9, $t9, 4
        // memory[109] <= 32'h21ce0004;	//				addi	$t6, $t6, 4
        // memory[110] <= 32'h08000061;	//				j	SAD_ROUTINE_LOOP_INNER
        // memory[111] <= 32'h21290001;	//	EXIT_INNER_LOOP:	addi	$t1, $t1, 1
        // memory[112] <= 32'h00005020;	//				add	$t2, $zero, $zero
        // memory[113] <= 32'h032dc820;	//				add	$t9, $t9, $t5
        // memory[114] <= 32'h0800005f;	//				j	SAD_ROUTINE_LOOP_OUTER
        // memory[115] <= 32'h0008c820;	//	EXIT_SAD_ROUTINE:	add	$t9, $zero, $t0
        // memory[116] <= 32'h0800002d;	//				j	SAD_DONE

    end
    
    always @(*) begin
        Instruction <= memory[Address[11:2]];
    end

endmodule


.data
test_array: .word 9, 8, 7, 6, 0, 0, 0
.text

.globl main

main:
#la  $a0, test_array # address of test_array for QtSpim
addi $a0, $zero, 0 # address of test_array for real test (0,0) (20040000)
addi $t0, $zero, 10 # t0 (WD) = 10 (0xA)
addi $t1, $zero, 6 # t1 (WD) = 6 (0x6)
sub $t2, $t0, $t1   # t2 (WD) = 4 (0x4)
mul $t3, $t2, $t1   # t3 (WD) = 24 (0x18)
add $t4, $t1, $t3   # t4 (WD) = 30 (0x1E)
addi $t5, $zero, 32767  # t5 (WD) = 32767, 0x7FFF
addi $t5, $t5, 32767  # t5 (WD) = 65...., 0xFFFE  
addi $t5, $t5, 9031  # t5 (WD) = , 0x12345
sw $t5, 16($a0) # [9,8,7,6,0x12345, 0, 0] 
sh $t5, 20($a0) # [9,8,7,6,0x12345, 0x2345, 0]  
sb $t5, 24($a0) # [9,8,7,6,0x12345,0x2345, 0x45] 
lb $t6, 24($a0) # WD = t6 =  0x45
lh $t6, 20($a0) # WD = t6 =  0x2345
lw $t6, 16($a0) # WD = t6 = 0x12345
xori $t5, $t1, 1 # WD = t5 =  0x7
xor $t5, $t5, $t3 # WD = t5 =  0x1F
andi $t5, $t3, 32767 # WD = t5 =  0x18
and $t5, $t4, $t1 # WD = t5 =  0x6
ori $t5, $t0, 1 # WD = t5 =  0xB
or $t5, $t0, $t1 # WD = t5 =  0xE
nor $t5, $t0, $t1 #  WD = t5 = 0xfffffff1 
slti $t5, $t3, 1000 # WD = t5 = 0x1 
slt $t4, $t4, $t3 # WD = t5 =  0x0 
sll $t5, $t5, 8 # WD = t5 = 0x100
srl $t5, $t5, 2 # WD = t5 =  0x40 
bgtz $t0, b1  # branches
addi $t0, $zero, -1
b1: addi $t0, $zero, 1  # WD = t0 = 0x1
addi $t0, $zero, -1 # WD = t0 = 0xffffffff
bgez $t0, b2 # does not branch
addi $t0, $zero, 5 #  WD = t0 = 0x5
b2: addi $t0, $t0, 7 # WD = t0 = 0xC
beq $t0, $t0, b3 # branches
addi $t1, $zero, 10 #no exe 
b3: addi $t1, $t1, 15  # WD = t1 = 0x15
bne $t0, $t1, b4 # branches
addi $t1, $zero, 20 #no exe 
b4: addi $t1, $t1, 30 # WD = t1 = 0x33
blez $t1, b5 # does not branch
addi $t1, $zero, 40 # WD = t1 = 0x28
b5: addi $t1, $t1, 50 # WD = t1 = 0x5A
## part of jump and link, then exit (worth 20 pts)
addi $t5, $zero, 3 # # WD = t5 = 0x3
b6: bltz, $t5, exit # 
jal dummy_func # 
j b6 # 
dummy_func: addi $t5, $t5, -1 # decrement t5
jr $ra # return to loop (03e00008)
exit: j main


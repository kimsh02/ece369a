.data
N: .word 3 
X: .word -2, -4, 7 
SUM: .word 0

.text

loop:
add $t0, $zero, $zero
nop
nop
nop
nop
nop
addi $t1, $zero, 6
nop
nop
nop
nop
nop
addi $t2, $zero, 10
nop
nop
nop
nop
nop
sw $t1, 0($t0)
nop
nop
nop
nop
nop
sw $t2, 4($t0)
nop
nop
nop
nop
nop
lw $s0, 0($t0)
nop
nop
nop
nop
nop
lw $s1, 4($t0) # s1 = 10, display 144, 10
nop
nop
nop
nop
nop
sub $t3, $s1, $s0 # t3 = 10-6 = 4, display 168, 4
nop
nop
nop
nop
nop
sll $t4, $t3, 3 # t4 = 4 << 3 = 64, display 192, 64
nop
nop
nop
nop
nop
srl $t5, $t4, 2 # t5 = 16 64 >> 2, display 216, 2
nop
nop
nop
nop
nop
j   loop

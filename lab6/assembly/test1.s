.data
N: .word 3 
X: .word -2, -4, 7 
SUM: .word 0

.text

loop:
add $t0, $zero, $zero
addi $t1, $zero, 6
addi $t2, $zero, 10
sw $t1, 0($t0)
sw $t2, 4($t0)
lw $s0, 0($t0)
lw $s1, 4($t0) # s1 = 10, display 144, 10
sub $t3, $s1, $s0 # t3 = 10-6 = 4, display 168, 4
sll $t4, $t3, 3 # t4 = 4 << 3 = 64, display 192, 64
srl $t5, $t4, 2 # t5 = 16 64 >> 2, display 216, 2
j   loop

.text
addi $t5, $zero, 1234    # t5 = 1234
nop
nop
nop
nop
nop
addi $s6, $zero, 2142    # s6 = 2142
nop
nop
nop
nop
nop
add  $t4, $t5, $s6       # t4 = 3376
nop
nop
nop
nop
nop
sub  $s0, $t4, $s6       # s0 = 1234
nop
nop
nop
nop
nop
addi $t5, $zero, 6       # t5 = 6
nop
nop
nop
nop
nop
mul  $t3, $t5, $s0       # t3 = 7404
nop
nop
nop
nop
nop
sw   $t3, 44($zero)
nop
nop
nop
nop
nop
lw   $t2, 44($zero)
nop
nop
nop
nop
nop
lb   $t2, 45($zero)
nop
nop
nop
nop
nop
sll  $t3, $t2, 8
nop
nop
nop
nop
nop
lb   $t2, 44($zero)
nop
nop
nop
nop
nop
or   $t3, $t3, $t2       # t3 = 7404
nop
nop
nop
nop
nop
addi $t4, $zero, 7404      # t4 = 7404
nop
nop
nop
nop
nop
xor  $t0, $t4, $t3       # t0 = 0
nop
nop
nop
nop
nop
beq  $t0, $zero, LABEL1  # j LABEL1
nop
nop
nop
nop
nop
j    FINISH
nop
nop
nop
nop
nop
LABEL1: srl $t4, $t4, 2  # t4 = 1851
nop
nop
nop
nop
nop
xori $s3, $t4, 1851
nop
nop
nop
nop
nop
bne  $s3, $zero, FINISH
nop
nop
nop
nop
nop
bltz $s3, FINISH
nop
nop
nop
nop
nop
bgtz $s3, FINISH
nop
nop
nop
nop
nop
ori  $s3, $s3, 3
nop
nop
nop
nop
nop
bgez $s3, LABEL2
nop
nop
nop
nop
nop
j    FINISH
nop
nop
nop
nop
nop
LABEL2: slti $t0, $s3, 3
nop
nop
nop
nop
nop
bne  $t0, $zero, FINISH
nop
nop
nop
nop
nop
jal  LABEL3
nop
nop
nop
nop
nop
addi $t1, $t1, 7331
nop
nop
nop
nop
nop
j    FINISH
nop
nop
nop
nop
nop
LABEL3: slti $s3, $t0, 3
nop
nop
nop
nop
nop
beq  $s3, $zero, FINISH
nop
nop
nop
nop
nop
jr   $ra
nop
nop
nop
nop
nop
FINISH: addi $t0, $zero, 1337    # t0 = 1337
nop
nop
nop
nop
nop
# Should see a 7331 at the end.

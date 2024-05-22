.text

addi    $t0,    $zero,    2
nop
nop
nop
nop
nop
addi    $t1,    $zero,    1
nop
nop
nop
nop
nop
working_bgez:    sub    $t0,    $t0,    $t1
nop
nop
nop
nop
nop
bgez    $t0,    working_bgez
nop
nop
nop
nop
nop
addi    $t0,    $zero,    2
nop
nop
nop
nop
nop
working_bne:    sub    $t0,    $t0,    $t1    
nop
nop
nop
nop
nop
bne    $t0,    $t1,    working_bne
nop
nop
nop
nop
nop
addi    $t0,    $zero,    2
nop
nop
nop
nop
nop
working_beq:    sub    $t0,    $t0,    $t1
nop
nop
nop
nop
nop
beq    $t0,    $t1,    working_beq
nop
nop
nop
nop
nop
addi    $t0,    $zero,    2
nop
nop
nop
nop
nop
working_bgtz:    sub    $t0,    $t0,    $t1
nop
nop
nop
nop
nop
bgtz    $t0,    working_bgtz
nop
nop
nop
nop
nop
addi    $t1,    $zero,    5
nop
nop
nop
nop
nop
addi    $t0,    $zero,    3
nop
nop
nop
nop
nop
sub    $t0,    $t0,    $t1
nop
nop
nop
nop
nop
working_blez:    addi    $t0,    $t0,    1
nop
nop
nop
nop
nop
blez    $t0,    working_blez
nop
nop
nop
nop
nop
addi    $t1,    $zero,    5
nop
nop
nop
nop
nop
addi    $t0,    $zero,    3
nop
nop
nop
nop
nop
sub    $t0,    $t0,    $t1
nop
nop
nop
nop
nop
working_bltz:    addi    $t0,    $t0,    1
nop
nop
nop
nop
nop
bltz    $t0,    working_bltz
nop
nop
nop
nop
nop
jal    jal_test
nop
nop
nop
nop
nop
add    $t4,    $t4,    $zero
nop
nop
nop
nop
nop
jal_test:    
  addi    $t4,    $t4,    200
  nop
  nop
  nop
  nop
  nop

jr    $ra
nop
nop
nop
nop
nop
addi    $t0,    $t0,    0
nop
nop
nop
nop
nop
j_test:    addi    $t0,    $t0,    100
nop
nop
nop
nop
nop
addi    $t1,    $zero,    400
nop
nop
nop
nop
nop
beq    $t0,    $t1,    DONE
nop
nop
nop
nop
nop
j    j_test
nop
nop
nop
nop
nop
DONE:    addi    $t0,    $t0,    1
nop
nop
nop
nop
nop

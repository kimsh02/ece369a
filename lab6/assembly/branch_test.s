.text

addi    $t0,    $zero,    2
addi    $t1,    $zero,    1
working_bgez:    sub    $t0,    $t0,    $t1
bgez    $t0,    working_bgez
addi    $t0,    $zero,    2
working_bne:    sub    $t0,    $t0,    $t1    
bne    $t0,    $t1,    working_bne
addi    $t0,    $zero,    2
working_beq:    sub    $t0,    $t0,    $t1
beq    $t0,    $t1,    working_beq
addi    $t0,    $zero,    2
working_bgtz:    sub    $t0,    $t0,    $t1
bgtz    $t0,    working_bgtz
addi    $t1,    $zero,    5
addi    $t0,    $zero,    3
sub    $t0,    $t0,    $t1
working_blez:    addi    $t0,    $t0,    1
blez    $t0,    working_blez
addi    $t1,    $zero,    5
addi    $t0,    $zero,    3
sub    $t0,    $t0,    $t1
working_bltz:    addi    $t0,    $t0,    1
bltz    $t0,    working_bltz
jal    jal_test
add    $t4,    $t4,    $zero
jal_test:    
  addi    $t4,    $t4,    200

jr    $ra
addi    $t0,    $t0,    0
j_test:    addi    $t0,    $t0,    100
addi    $t1,    $zero,    400
beq    $t0,    $t1,    DONE
j    j_test
DONE:    addi    $t0,    $t0,    1

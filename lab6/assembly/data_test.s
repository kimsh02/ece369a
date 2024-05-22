.data

N: .word 305419896

X: .word -2, -4, 7

SUM: .word 0



.text

lw    $t0,    0($zero)






add    $t0,    $t0,    $zero






addi    $t1,    $zero,    4






sw    $t1,    4($zero)






lw    $t1,    4($zero)






lb    $t1,    3($zero)






lb    $t1,    2($zero)






lb    $t1,    1($zero)






lb    $t1,    0($zero)






sb    $t0,    2($zero)  






lw    $t0,    0($zero)






addi    $t2,    $zero,    1234






sh    $t2,    2($zero)  






lh    $t2,    2($zero)  






lw    $t2,    0($zero)  






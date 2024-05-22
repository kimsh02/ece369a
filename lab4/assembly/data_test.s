.data
N: .word 305419896
X: .word -2, -4, 7
SUM: .word 0

.text
lw    $t0,    0($zero)
nop
nop
nop
nop
nop
add    $t0,    $t0,    $zero
nop
nop
nop
nop
nop
addi    $t1,    $zero,    4
nop
nop
nop
nop
nop
sw    $t1,    4($zero)
nop
nop
nop
nop
nop
lw    $t1,    4($zero)
nop
nop
nop
nop
nop
lb    $t1,    3($zero)
nop
nop
nop
nop
nop
lb    $t1,    2($zero)
nop
nop
nop
nop
nop
lb    $t1,    1($zero)
nop
nop
nop
nop
nop
lb    $t1,    0($zero)
nop
nop
nop
nop
nop
sb    $t0,    2($zero)  
nop
nop
nop
nop
nop
lw    $t0,    0($zero)
nop
nop
nop
nop
nop
addi    $t2,    $zero,    1234
nop
nop
nop
nop
nop
sh    $t2,    2($zero)  
nop
nop
nop
nop
nop
lh    $t2,    2($zero)  
nop
nop
nop
nop
nop
lw    $t2,    0($zero)  
nop
nop
nop
nop
nop
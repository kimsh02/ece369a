.text

addi $t5, $zero, 1234    # t5 = 1234






addi $s6, $zero, 2142    # s6 = 2142






add  $t4, $t5, $s6       # t4 = 3376






sub  $s0, $t4, $s6       # s0 = 1234






addi $t5, $zero, 6       # t5 = 6






mul  $t3, $t5, $s0       # t3 = 7404






sw   $t3, 44($zero)






lw   $t2, 44($zero)






lb   $t2, 45($zero)






sll  $t3, $t2, 8






lb   $t2, 44($zero)






or   $t3, $t3, $t2       # t3 = 7404






addi $t4, $zero, 7404      # t4 = 7404






xor  $t0, $t4, $t3       # t0 = 0






beq  $t0, $zero, LABEL1  # j LABEL1






j    FINISH






LABEL1: srl $t4, $t4, 2  # t4 = 1851






xori $s3, $t4, 1851






bne  $s3, $zero, FINISH






bltz $s3, FINISH






bgtz $s3, FINISH






ori  $s3, $s3, 3






bgez $s3, LABEL2






j    FINISH






LABEL2: slti $t0, $s3, 3






bne  $t0, $zero, FINISH






jal  LABEL3






addi $t1, $t1, 7331






j    FINISH






LABEL3: slti $s3, $t0, 3






beq  $s3, $zero, FINISH






jr   $ra






FINISH: addi $t0, $zero, 1337    # t0 = 1337






# Should see a 7331 at the end.


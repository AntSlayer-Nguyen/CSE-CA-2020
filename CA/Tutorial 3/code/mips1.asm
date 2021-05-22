.text
.globl main

main:

la       $s0,array    # load array's address in $s0
li       $t0,0        # initialize sum = 0

li       $t1,0        # count = 0
loop:
beq      $t1,10,exit 
lw       $t2,0($s0)
add      $t0,$t0,$t2
addi     $s0,$s0,4
addi     $t1,$t1,1
j loop

exit:
li	 $v0,4	      # print_string 
la	 $a0, msg	
	 syscall
li       $v0,1
move     $a0,$t0       # print sum
         syscall





.data
msg: .asciiz "Result: "
array: .word 1,2,3,4,5,6,7,8,9,10
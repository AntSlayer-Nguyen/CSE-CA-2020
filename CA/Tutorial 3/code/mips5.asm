.text
.globl main

main:

li	 $v0,4	      # print_string 
la	 $a0, msg	
	 syscall

li       $v0,5        # read int
         syscall
move     $t1,$v0      # $t1 : index from user

la       $s0,array    # load array's address in $s0


loop:
beq      $t1,0,exit 
addi     $s0,$s0,4
addi     $t1,$t1,-1
j loop

exit:
lw       $t2,0($s0)

li	 $v0,4	      # print_string 
la	 $a0, msr	
	 syscall
li       $v0,1
move     $a0,$t2       # print result
         syscall





.data
msg: .asciiz "Enter the index: "
msr: .asciiz "Result: "
array: .word 1,2,3,4,5,6,7,8,9,10
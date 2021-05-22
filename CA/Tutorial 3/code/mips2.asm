.text
.globl main

main:

la       $s0,array       # load array's address in $s0
li       $t0,0           # initialize even_sum = 0
li       $t1,0           # initialize odd_sum = 0
li       $t2,0           # count = 0
loop:
beq      $t2,10,exit     # count < 10 ? 
lw       $t3,0($s0)   

xori     $t4,$t2,1       # count XOR 1 == count + 1 ? -> even
addi     $t5,$t2,1

beq      $t4,$t5,even
add      $t1,$t1,$t3
j next
even:
add      $t0,$t0,$t3
next:
addi     $t2,$t2,1
addi     $s0,$s0,4
j loop

exit:

li	 $v0,4	         # print_string 
la	 $a0, msg	
	 syscall
li       $v0,1
move     $a0,$t0         # print even_sum
         syscall
li	 $v0,4	         # print space 
la	 $a0, msr	
	 syscall
li       $v0,1
move     $a0,$t1         # print odd_sum
         syscall




.data
msg: .asciiz "Result: Even: "
msr: .asciiz "\t Odd: "
array: .word 1,2,3,4,5,6,7,8,9,10
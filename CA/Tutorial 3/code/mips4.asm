.text 
.globl main

main:

li   $t1,0     # counter i=0
la   $s0,arr   # load address arr to $s0 : arr[0]

addi $s1,$s0,36  # $s1: arr[9]

loop:
beq  $t1,5,exit  # check condition i < 5 ?

# swap 2 elements
lw $t0,0($s1)    
lw $t2,0($s0)

sw $t0,0($s0)
sw $t2,0($s1)

addi $s0,$s0,4
addi $s1,$s1,-4

addi $t1,$t1,1  # i=i+1

j loop

exit:

la $s3,arr   # load address of arr[0] to $s3

li   $v0,4
la   $a0,msr    #Print " Output array: "
syscall

li   $t1,0    # counter i=0

loop1:
beq  $t1,10,exit1  # check condition i < 10 ?
lw $t3,0($s3)      # load elements from arr 

li   $v0,1
move $a0,$t3      # print the elements
syscall

li   $v0,4
la   $a0,mst    #Print space
syscall

addi $s3,$s3,4
addi $t1,$t1,1
j loop1

exit1:
li   $v0,4
la   $a0,msg    #Print endline 
syscall

.data
arr: .word 1,3,5,7,9,11,13,15,17,19
msr: .asciiz "Output array: "
mst: .asciiz "  "
msg: .asciiz "\n"
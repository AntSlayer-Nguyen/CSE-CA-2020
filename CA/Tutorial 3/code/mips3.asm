.text
.globl main

main:

li           $v0,4
la           $a0,msg    #Print string
             syscall

la           $s0,arr
li           $t1,0      #counter for loop  $t1: i

loop:
beq          $t1,10,exit   # i <10

li           $v0,5
             syscall            #input 
move         $t0,$v0

sw           $t0,0($s0)    #store
addi         $s0,$s0,4     

addi         $t1,$t1,1
j loop

exit:
li           $t1,0
li           $t3,0

addi         $s0,$s0,-4 


loop1:   #loop to compute sum
beq          $t1,10,exit1

lw           $t2,0($s0)
add          $t3,$t3,$t2
addi         $s0,$s0,-4

addi         $t1,$t1,1

j loop1

exit1:
li           $v0,4
la           $a0,msr    #Print string
             syscall

li           $v0,1
move         $a0,$t3    
             syscall  

.data 
msg:  .asciiz "Input: \n"
msr:  .asciiz "Sum = "
arr: .word  0:10

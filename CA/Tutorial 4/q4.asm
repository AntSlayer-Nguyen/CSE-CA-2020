.text
.globl main


main:
li           $v0,4                # print input
la           $a0,input
             syscall
li           $v0,5                # integer input
             syscall
move         $a1,$v0

la           $a0, array           # a0 = v[0]

slti         $t4,$a1,10            # check valid k (a1)
slti         $t5,$a1,0
nor          $t5,$t5,$t5
and          $t6,$t5,$t4
beq          $t6,0,exit
jal          swap
j end
swap:
sll          $t1, $a1, 2          # t1 = 4 * k 
add          $t1, $a0, $t1        # t1 = v[k]
lw           $t0, 0($t1)          # load v[k] to t0
lw           $t2, 4($t1)          # load v[k+1] to t2
sw           $t2, 0($t1)          # store v[k+1] to v[k]
sw           $t0, 4($t1)          # store v[k] to v[k+1]
jr           $ra

exit:
li           $v0,4                # invalid k
la           $a0,invalid
             syscall
end:


.data
input:       .asciiz "input k: "
array:       .word   1,2,3,4,5,6,7,8,9,10
invalid:     .asciiz "invalid k"



.text
.globl main
main:

li         $v0,4             # print input
la         $a0,input       
           syscall
           
li         $v0,5             # integer input
           syscall
move       $t0,$v0

la         $s0, array        # load array address to s0
li         $t2, 0            # position 
loop:  
beq        $t2,10,exit       # loop cond: i < 10
lw         $t1, 0($s0)       # load array element
beq        $t1,$t0,found      # if found
addi       $s0,$s0,4
addi       $t2,$t2,1
j          loop

exit:

li         $v0,4
la         $a0,notfound
           syscall
j          end
found:
li         $v0,4
la         $a0,print
           syscall
li         $v0,1
move       $a0,$t2
           syscall 
end:

.data 
array:     .word  4,2,6,1,7,9,1,2,5,6 
input:     .asciiz "Input an integer: "
notfound:  .asciiz "the number does not exist in the array!"
print:     .asciiz "Position found: "


.data
nums:        .word 7
elems:       .word 5,6,12,1,3,10,2
tab:         .asciiz "  "

.text
.globl main 

main: 
la           $s1,nums
lw           $a0,0($s1)
la           $a1,elems    # a1 = &elems[0]
# a0 <=> N
# a1 <=> address of elems
jal          bubble_sort

j            end
#------------------------------------------
bubble_sort:
#  t0  <=>  i
#  s0  <=> N - 1
#  t1  <=> j
#  s1  <=> N - i - 1
#  t3  <=> 4*j
#  a2  <=> address of arr[j]
#  s4  <=> arr[j]
#  s5  <=> arr[j+1]
#  t4  <=> (arr[j+1] < arr[j]) ?

li           $t0,0        # int i = 0
subi         $s0,$a0,1    # s0 = N - 1
loop_i:                   # for(int i = 0; i < N - 1;i++)
beq          $t0,$s0,exit_i
li           $t1,0        # int j = 0
sub          $s1,$s0,$t0  # N - i - 1
loop_j:                   # for(int j = 0;j < N - i -1;j++)
beq          $t1,$s1,exit_j
mul          $t3,$t1,4
add          $a2,$a1,$t3  # &arr[j]     
lw           $s4,0($a2)   #  arr[j]
lw           $s5,4($a2)   # arr[j+1]
slt          $t4,$s5,$s4
beq          $t4,0,next
# swap
sw           $s5,0($a2)
sw           $s4,4($a2)   
next:
addi         $t1,$t1,1    # j++
j            loop_j
exit_j:
addi         $t0,$t0,1    # i++
j            loop_i
exit_i:

jr           $ra
#-------------------------------------------
end: 
move         $t6,$a0
li           $t0,0
# print section 
loop:
beq          $t0,$t6,exit
lw           $t1,0($a1)
li           $v0,1
move         $a0,$t1
             syscall
li           $v0,4
la           $a0,tab
             syscall         
addi         $a1,$a1,4
addi         $t0,$t0,1
j            loop
exit:


li           $v0,10
             syscall





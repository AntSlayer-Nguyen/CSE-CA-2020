.text 
.globl main 

main: 
li         $t3,0          # sum = 0
loop:                     # repeat 
li         $v0, 4         # input
la         $a0, msg
           syscall

li         $v0, 5         # integer input
           syscall
move       $s0, $v0

add        $t3,$t3,$s0    # update sum

slti       $t0,$s0,1      # t0 = (s0 < 1) ?
beq        $t0,0,loop     

li         $v0, 4         # output
la         $a0, sum
           syscall
li         $v0, 1
move       $a0,$t3
           syscall

.data

msg:       .asciiz "Input integer: "
sum:       .asciiz "Sum: "



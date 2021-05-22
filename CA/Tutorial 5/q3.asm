.text 

.globl main 

main:

li          $s0,10
li          $s1,7


li          $v0,4
la          $a0,input
            syscall
li          $v0,5
            syscall
move        $t0,$v0


beq         $t0,0,case0
beq         $t0,1,case1
beq         $t0,2,case2
beq         $t0,3,case3
beq         $t0,4,case4

default:
li          $v0,4
la          $a0,invalid
            syscall
j           end
case0:
add         $t1,$s0,$s1
li          $v0,1
move        $a0,$t1
            syscall
j           end
case1:
sub         $t1,$s0,$s1
li          $v0,1
move        $a0,$t1
            syscall
j           end
case2:
mult        $s0,$s1
mfhi        $t2
mflo        $t3
li          $v0,4
la          $a0,hi
            syscall
li          $v0,1
move        $a0,$t2
            syscall
            
li          $v0,4
la          $a0,lo
            syscall
li          $v0,1
move        $a0,$t3
            syscall
j           end
case3:
div         $s0,$s1
mflo        $t2
li          $v0,1
move        $a0,$t2
            syscall
j           end
case4:
div         $s0,$s1
mfhi        $t2
li          $v0,1
move        $a0,$t2
            syscall
j           end

end:

.data 
input:      .asciiz "input: "
hi:         .asciiz "\nhi register: "
lo:         .asciiz "\nlo register: "
invalid:    .asciiz "Your choice is invalid\n"
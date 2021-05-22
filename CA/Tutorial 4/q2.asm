.text
.globl main
main:
li         $s0,10     # b = 10
li         $s1,5      # c = 5

input:
li	   $v0,4      # print_string syscall code = 4
la	   $a0, msg   # load the address of msg
	   syscall
li         $v0,5
           syscall
move       $t0,$v0    # read input

 
beq        $t0,0,case0
beq        $t0,1,case1
beq        $t0,2,case2 
default:
li	   $v0,4      # print_string syscall code = 4
la	   $a0, msg1  # load the address of msg1
	   syscall
j end
case0:
add        $t1,$s0,$s1
j exit
case1:
sub        $t1,$s0,$s1
j exit
case2:
sub        $t1,$s1,$s0
j exit
exit:      
li	   $v0,4      # print_string syscall code = 4
la	   $a0, msg2  # load the address of msg2
	   syscall
li         $v0,1
move       $a0,$t1
           syscall
end:
.data

msg:       .asciiz "Input: "
msg1:      .asciiz "please input an another integer numbers\n "
msg2:      .asciiz "a = "
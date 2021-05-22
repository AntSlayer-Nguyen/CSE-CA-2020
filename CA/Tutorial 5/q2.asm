.text
.globl main
main:

li        $v0,4                 # print string  
la        $a0,input
          syscall
          
          
li        $v0,5                # read input 
          syscall
move      $a0,$v0              # $a0 = n

jal       log_2                # call log_2
j         end
#--------------------------
log_2:                        # procedure
li        $t0,0               # ret = 0
loop:
srl       $t2,$a0,1           # m = n/2
beq       $t2,0,exit          # m != 0 ?
srl       $a0,$a0,1           # n = n / 2
addi      $t0,$t0,1           # i++
j         loop
exit:
move      $v0,$t0
jr        $ra 
# -------------------------
end:
move      $s1,$v0 

li        $v0,1
move      $a0,$s1
          syscall

li          $v0 , 10
syscall


.data
input:     .asciiz "Input n: "


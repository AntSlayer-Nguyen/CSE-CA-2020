.text 

.globl main 

main:

li          $v0,4
la          $a0,input
            syscall

li          $v0,6
            syscall


l.s         $f1,n1
sub.s       $f0,$f0,$f1

l.s         $f2,n2
mul.s       $f0,$f0,$f2

l.s         $f3,n3
div.s       $f0,$f0,$f3

li          $v0,2
mov.s       $f12,$f0
            syscall
            
            
l.s         $f4,cond
c.lt.s      $f4,$f0
bc1t        warn
safe:
li          $v0,4
la          $a0,succ
            syscall
j           end

warn:
li          $v0,4
la          $a0,label
            syscall
end:
        
.data 
input:      .asciiz "input "
n1:         .float  32.0
n2:         .float  5.0
n3:         .float  9.0
cond:       .float  99.5
label:      .asciiz "\nWarning "
succ:       .asciiz "\nSafe"
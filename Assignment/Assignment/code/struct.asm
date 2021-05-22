.data 
student:             .space  200        # 40 bytes x 5
hung:                .byte   'M','i','n','h',' ','H','u','n','g',' ',' '
hoang:               .byte   'N','h','a','t',' ','H','o','a','n','g',' '
van_a:               .byte   'V','a','n',' ','A',' ',' ',' ',' ',' ',' '
nguyen_hung:         .byte   'N','g','u','y','e','n',' ','H','u','n','g'
john:                .byte   'J','o','h','n',' ',' ',' ',' ',' ',' ',' '
msg:                 .asciiz "This is a list of students\n"
id:                  .asciiz "Student id: "
name:                .asciiz "\nStudent name: "
age:                 .asciiz "\nStudent age: "
is_male:             .asciiz "\nStudent gender: "
Male:                .asciiz "Male"
Female:              .asciiz "Female"
average:             .asciiz "\nStudent score: "
endline:             .asciiz "\n\n"
grade1:              .float  8.5
grade2:              .float  8.1
grade3:              .float  9.0
grade4:              .float  7.5
grade5:              .float  4.5
.text
.globl main

main:

li                   $a1,0              # int i = 0
li                   $v0,4
la                   $a0,msg            # " This is ... "
                     syscall

# initialization section

la                   $s0,student
la                   $t0,hung
la                   $t1,hoang
la                   $t2,van_a
la                   $t3,nguyen_hung
la                   $t4,john

# student[0]
li                   $t5,1952737              # std id
sw                   $t5,0($s0)
sw                   $t0,4($s0)
li                   $t6,1                    # is_male
sb                   $t6,34($s0)
li                   $t6,20                   # age
sb                   $t6,35($s0)
l.s                  $f0,grade1               # grade
s.s                  $f0,36($s0)

# student[1]
li                   $t5,1952703
sw                   $t5,40($s0)
sw                   $t1,44($s0)
li                   $t6,1
sb                   $t6,74($s0)
li                   $t6,19
sb                   $t6,75($s0)
l.s                  $f0,grade2                  
s.s                  $f0,76($s0)

# student[2]
li                   $t5,1952777
sw                   $t5,80($s0)
sw                   $t2,84($s0)
li                   $t6,0
sb                   $t6,114($s0)
li                   $t6,22
sb                   $t6,115($s0)
l.s                  $f0,grade3                  
s.s                  $f0,116($s0)

# student[3]
li                   $t5,1952743
sw                   $t5,120($s0)
sw                   $t3,124($s0)
li                   $t6,0
sb                   $t6,154($s0)
li                   $t6,18
sb                   $t6,155($s0)
l.s                  $f0,grade4                  
s.s                  $f0,156($s0)

# student[4]
li                   $t5,1950000
sw                   $t5,160($s0)
sw                   $t4,164($s0)
li                   $t6,1
sb                   $t6,194($s0)
li                   $t6,20
sb                   $t6,195($s0)
l.s                  $f0,grade5                  
s.s                  $f0,196($s0)


print_loop:
beq                  $a1,5,exit_loop
jal                  print_student
addi                 $a1,$a1,1
j                    print_loop

print_student:                           # print_student procedure 
mul                  $s4,$a1,40          # $s0 --> address of student[], $a1 --> i,
add                  $s5,$s0,$s4
lw                   $s3,0($s5)
li                   $v0,4
la                   $a0,id
                     syscall
li                   $v0,1
move                 $a0,$s3
                     syscall
li                   $v0,4
la                   $a0,name
                     syscall
lw                   $s3,4($s5)
li                   $s4,0
loop_name:                               # loop to load each byte to get a full name from char arr
beq                  $s4,11,exit_name                     
li                   $v0,11
lb                   $a0,0($s3)
                     syscall
addi                 $s3,$s3,1
addi                 $s4,$s4,1
j                    loop_name
exit_name:
li                   $v0,4
la                   $a0,age             # load and print age information
                     syscall
lb                   $s3,35($s5)
li                   $v0,1
move                 $a0,$s3
                     syscall
li                   $v0,4
la                   $a0,is_male         # load and print is_male information
                     syscall                     
lb                   $s3,34($s5)
beq                  $s3,1,male          # if (is_male == 1) print "Male" else "Female"
li                   $v0,4
la                   $a0,Female
                     syscall
j                    out
male:
li                   $v0,4
la                   $a0,Male
                     syscall                     
out:                                                               
li                   $v0,4
la                   $a0,average         # load and print average score
                     syscall
l.s                  $f0,36($s5)   
li                   $v0,2
mov.s                $f12,$f0
                     syscall
li                   $v0,4
la                   $a0,endline
                     syscall
jr                   $ra

exit_loop:

end:

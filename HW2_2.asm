#	Jonathan Feige
#	EE3613 Spring 2018
#	Homework 2, Part 2

.data
   strA: .asciiz "Please enter your choice to skip number(1-4)\n"
   newLine: .asciiz "\n"
   Numbers: .byte 100 -7 11 25 -66 99 -1 34 12 22 -2 -7 100 11 4 67 2 -90 22 2 56 3 -89 12 -10 21 10 -25 -6 9 111 34 12 22 -2 -17 100 111 -4 7 14 -19 -2 29 36 31 -79 2
  
.text
   main:   
   
   la $a0, strA
   addi $v0, $zero, 4
   syscall
      
   addi $v0, $zero, 5
   syscall
      
   move $t0, $v0         # $t0 has skip value
   addi $t1, $zero, 0    # $t1 contains number which $t2 points to
   addi $t2, $zero, 0    # $t2 has index to Numbers array
   addi $t3, $zero, 48   # $t3 has size of Numbers
   addi $t4, $zero, 0    # $t4 has sum of numbers
      
   branchlabel1:   bge $t2, $t3, branchlabel2
   lb $t1, Numbers($t2)
   add $t4, $t4, $t1
   add $t2, $t2, $t0
   b branchlabel1
          
   branchlabel2:   # print Result
        
   move $a0, $t4
   addi $v0, $zero, 1
   syscall
          
   #print a new line
   la $a0, newLine
   addi $v0, $zero, 4
   syscall
          
   #end of program
   addi $v0, $zero, 10
   syscall
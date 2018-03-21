#	Jonathan Feige
#	EE3613 Spring 2018
#	Homework 2, Part 1

.data
.align 2

newline:    .asciiz "\n"
strA:		.asciiz "Original Array:\n"
strB:		.asciiz "Second Array:\n"
space:		.asciiz " "
#4x4 Matrix Declaration

A0: .word 200 270 250 100        # Declare and initialize 1st Row of A
A1: .word 205 230 105 235        # Declare and initialize 2nd Row of A
A2: .word 190 95 90 205          # Declare and initialize 3rd Row of A
A3: .word 80 205 110 215         # Declare and initialize 4th Row of A
A:  .word A0 A1 A2 A3            # Declare and initialize the pointer to the rows

.globl main
.text
main:

#Now print strng a "Original Array:\n "
la $a0, strA     	#load address of whitespace into $a0
li $v0, 4           #system code 4 for printing a string
syscall

li $t0, 0           #This is the start index for i

branchlabel1:
li $t1, 0           #This is the start index for j

branchlabel2:

la $t2, A             			# Load address of A into register $t2
sll     $t3,    $t0,    2       # Shift left twice (same as i * 4)
add     $t3,    $t3,    $t2     # Address of pointer A[i]
lw      $t4,    ($t3)           # Get address of an array A[i] and put it into register $t4
sll     $t5,    $t1,    2       # Shift left twice (same as j * 4)
add     $t5,    $t4,    $t5     # Address of A[i][j]
lw      $t7,    ($t5)           # Load value of A[i][j]

#First print 'value' ($t0)
li $v0, 1           #system code 1 for printing an integer	          
add $a0, $zero, $t7 #copy register $t0 to $a0
						#This is done because the system call
						#for printing expects the number to 
						#be printed in register $a0 
syscall

#Now print a space " "
la $a0, space   #load address of whitespace into $a0
li $v0, 4           #system code 4 for printing a string
syscall
	
#This is the inner loop branch part
addi $t1, $t1, 1    #j <- j + 1 (increment count)
slti  $t5, $t1, 4   #'set less than (immediate) instr. 
				    #if( $t1 < 10 )
				    #   $t5 <- 1
				    #else
				    #   $t5 <- 0     	

#branch if $t5 != 0 (which means $t1 < 10 because of the slti)
bne $t5, $zero, branchlabel2

#Now print newline "\n"
la $a0, newline     #load address of whitespace into $a0
li $v0, 4           #system code 4 for printing a string
syscall

#This is the outer loop branch part
addi $t0, $t0, 1    #i <- i+1 (increment count)
slti  $t5, $t0, 4   #'set less than (immediate) instr. 
				    #if( $t0 < 10 )
				    #   $t5 <- 1
				    #else
				    #   $t5 <- 0     	

#branch if $t5 != 0 (which means $t0 < 10 because of the slti)
bne $t5, $zero, branchlabel1
	
		
#Now print newline "\n"
la $a0, newline     #load address of whitespace into $a0
li $v0, 4           #system code 4 for printing a string
syscall

#Now print String B "Second Array:\n: "
la $a0, strB     #load address of whitespace into $a0
li $v0, 4           #system code 4 for printing a string
syscall
	
li $t0, 0           #This is the start index for i

branchlabel3:
li $t1, 0           #This is the start index for j

branchlabel4:
la $t2, A             			# Load address of A into register $t2
sll     $t3,    $t1,    2       # Shift left twice (same as i * 4)
add     $t3,    $t3,    $t2     # Address of pointer A[i]
lw      $t4,    ($t3)           # Get address of an array A[i] and put it into register $t4
sll     $t5,    $t0,    2       # Shift left twice (same as j * 4)
add     $t5,    $t4,    $t5     # Address of A[i][j]
lw      $t7,    ($t5)           # Load value of A[i][j]

#First print 'value' ($t0)
li $v0, 1           #system code 1 for printing an integer	          
add $a0, $zero, $t7 #copy register $t0 to $a0
						#This is done because the system call
						#for printing expects the number to 
						#be printed in register $a0 
syscall

#Now print a space " "
la $a0, space   #load address of whitespace into $a0
li $v0, 4           #system code 4 for printing a string
syscall
	
#This is the inner loop branch part
addi $t1, $t1, 1    #j <- j + 1 (increment count)
slti  $t5, $t1, 4  #'set less than (immediate) instr. 
				    #if( $t1 < 10 )
				    #   $t5 <- 1
				    #else
				    #   $t5 <- 0     	

#branch if $t5 != 0 (which means $t1 < 10 because of the slti)
bne $t5, $zero, branchlabel4

#Now print newline "\n"
la $a0, newline     #load address of whitespace into $a0
li $v0, 4           #system code 4 for printing a string
syscall

#This is the outer loop branch part

addi $t0, $t0, 1    #i <- i+1 (increment count)
slti  $t5, $t0, 4   #'set less than (immediate) instr. 
				    #if( $t0 < 10 )
				    #   $t5 <- 1
				    #else
				    #   $t5 <- 0     	

#branch if $t5 != 0 (which means $t0 < 10 because of the slti)
bne $t5, $zero, branchlabel3
	
#Exit system call
li $v0, 4 # Sets $v0 to "10" to select exit syscall
syscall # Exit
###########################################################################################
# bubbleSort for array of integers -- implemented as two loops in a nested loop arrangement
# The nested loop logic has the following pseudo-code:
#	for (int k = 1; k < size; k++){
#		for (int i = 0; i <size - k; i++){
#			if (Array[i] < Array[i +1]){  // sort the array in descending order
#				int temp = Array[i];  // of integer values 
#				Array[i + 1] = temp;				
#			} 
#		}
#	}
##########################################################################################

# SETUP  
.data
#set the size and content of array
Sz: .word 23
# array
Array: .word 29, 106, 18, 2, 55, 21, 17, 13, 9999, 1024, 13, 2, 5, 23, 51, 2021, 111, 89, 89
, 91, 861, 1234, 5004
# newline character
spacecharacter: .asciiz " "

.text
# Initialize Array
main:
	lw $s7, Sz # get size of Array
	move $s1, $zero  # set counter for # of elems printed
	move $s2, $zero  # set offset from Array
	 
#Variable meanings:
#t0; k
#t1: i
#t2: a[i]
#t3: a[i+1]
#t4: size - k
#t5: temp
#s3: [i+1]

# sort the array:
outer_loop:
	beq $t0, $s7, end_of_sort		#end loop if counter reached size of array
	addi $t1, $zero, 0			#reset inner loop counter
	inner_loop:
		sub $t4, $s7, $t0		#store the values of size - k for comparison later
		beq $t1, $t4, end_of_inner_loop	#end inner loop if counter reached comparitor values
		mul $s2, $t1, 4
		lw $t2, Array($s2)			#load a[i]
		addi $s3, $s2, 4
		lw $t3, Array($s3)			#load a[i+1]
		
		bge $t2, $t3, after_swap
		
			move $t5, $t2			#store a[i] in temp
			move $t2, $t3			#swap
			move $t3, $t5
			
			sw $t2, Array($s2)
			sw $t3, Array($s3)
		after_swap:
		
		addi $t1, $t1, 1			#increment inner counter
		j inner_loop				#jump to start of inner

	end_of_inner_loop:
	addi $t0, $t0, 1				#increment outer counter
	j outer_loop					#jump to start of outer
	
end_of_sort:
# main print loop
move $s1, $zero  # set counter for # of elems printed
move $s2, $zero  # set offset from Array

print_loop:
	bgt $s1, $s7, print_loop_end # stop after last elem is printed
	li $v0, 1
	lw $a0, Array($s2)  # print next value from the array
	syscall
	li $v0, 4
	la $a0, spacecharacter # print a space character between each value
	syscall
	addi $s1, $s1, 1  # increment the loop counter
	addi $s2, $s2, 4  # step to the next array elem

	j print_loop # repeat the loop
           # The program ends.
print_loop_end:
	#li $v0, 10          # Load a 10 (halt) into $v0.
        #syscall         
        
move $s1, $zero  # set counter for # of elems printed
move $s2, $zero  # set offset from Array     
move $t6, $zero
move $t8, $zero
move $t9, $zero
move $t0, $zero
move $t1, $zero
move $t2, $zero
move $t3, $zero
move $t4, $zero
#t0; k
#t1: i
#t2: a[i]
#t3: a[i+1]
#t4: size - k

li   $s4, 5 # get size of Array

sum:    
	beq $s1, $s4, end_of_sum # stop after last elem is printed
        lw $a0, Array($s2)
        add $t6, $t6, $a0
        
        bne $s1, 3, nochg
        move $t8, $t6
nochg:
        

	#addi $t1, $zero, 0			#reset inner loop counter
	#inner_sum:
	        #beq $t0, 2, end_of_inner
	        #sub $t4, 2, $t0		#store the values of size - k for comparison later
		#beq $t1, $t4, end_of_inner_sum 	#end inner loop if counter reached comparitor values
		#lw $t1, $s1
		#move $t6, $t8
	
	        #addi $t1, $t1, 1			#increment inner counter
	        
	        #j inner_sum				#jump to start of inner
	        
	#end_of_inner:
	
	addi $s1, $s1, 1  # increment the loop counter
	addi $s2, $s2, 4  # step to the next array elem
	#addi $t0, $t0, 1
	j sum		#jump to start of outer
	
end_of_sum:

        move $t9, $t6
	li $v0, 10          # Load a 10 (halt) into $v0.
        syscall   

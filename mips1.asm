# 3.20B Lab Assignment 2 Part 2 by Linjing Li
# sumOfintegerValues.asm-- A program that computes the sum of the following integer values:  2, 3, 5, 7, 11, 13, 17, 19, 23, 29.
# leaving the result in register $t0. 

# Registers used: 
# s0 - used to hold the constant 2. 
# t1 - used to hold the constant 3. 
# t2 - used to hold the constant 5.
# t3 - used to hold the constant 7. 
# t4 - used to hold the constant 11.
# t5 - used to hold the constant 13.
# t6 - used to hold the constant 17.
# t7 - used to hold the constant 19.
# t8 - used to hold the constant 23.
# t9 - used to hold the constant 29.
# t0 - used to hold the result
slt $t5,$t3,$t2   
bne $t5,$zero,NotZero 
addu $t4,$t4,$t2   
j ByeBye
NotZero:  addu $t4, $t4, $t3
ByeBye:

      .data    # Subsequent items are stored in the data segment
int1: .word 2  # initiate int1 with value 2 . The data type for integer is word size.
int2: .word 3  # initiate int1 with value 3. The data type for integer is word size.
int3: .word 5  # initiate int1 with value 3. The data type for integer is word size.
int4: .word 7  # initiate int1 with value 3. The data type for integer is word size.
int5: .word 11 # initiate int1 with value 3. The data type for integer is word size.
int6: .word 13 # initiate int1 with value 3. The data type for integer is word size.
int7: .word 17 # initiate int1 with value 3. The data type for integer is word size.
int8: .word 19 # initiate int1 with value 3. The data type for integer is word size.
int9: .word 23 # initiate int1 with value 3. The data type for integer is word size.
int10:.word 29 # initiate int1 with value 3. The data type for integer is word size.


add $s0, $s0, int1      # $t1 = $t1 + 0 ($t1++)
add $t1, $s0, int2      # $t1 = $t1 + 0 ($t1++)
add $t2, $t1, int3       # $t2 = $t1 + 1 ($t2 = 2)
add $t3, $t2, int4       # $t2 = $t1 + 1 ($t2 = 2)
add $t4, $t3, int5       # $t2 = $t1 + 1 ($t2 = 2)
add $t5, $t4, int6        # $t2 = $t1 + 1 ($t2 = 2)
add $t6, $t5, int7      # $t2 = $t1 + 1 ($t2 = 2)
add $t7, $t6, int8       # $t2 = $t1 + 1 ($t2 = 2)
add $t8, $t7, int9       # $t2 = $t1 + 1 ($t2 = 2)
add $t9, $t8, int10       # $t2 = $t1 + 1 ($t2 = 2)
addi $t0, $t9, 0       # $t2 = $t1 + 1 ($t2 = 2)
li $v0, 10              # syscall code 10 is for exit. # put 10 into $v0.
syscall                 # make the syscall.
# end of sumOfintegerValues.asm

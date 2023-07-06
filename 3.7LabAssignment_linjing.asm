# 3.20B Lab Assignment 2 Part 2 by Linjing Li
# sumOfintegerValues.asm-- A program that computes the sum of the following integer values:  2, 3, 5, 7, 11, 13, 17, 19, 23, 29.
# leaving the result in register $t0. 

      .data      # Subsequent items are stored in the data segment
int1: .word 2    # initiate int1 with value 2 . The data type for integer is word size.
int2: .word 3    # initiate int2 with value 3. The data type for integer is word size.
int3: .word 5    # initiate int3 with value 5. The data type for integer is word size.
int4: .word 7    # initiate int4 with value 7. The data type for integer is word size.
int5: .word 11   # initiate int5 with value 11. The data type for integer is word size.
int6: .word 13   # initiate int6 with value 13. The data type for integer is word size.
int7: .word 17   # initiate int7 with value 17. The data type for integer is word size.
int8: .word 19   # initiate int8 with value 19. The data type for integer is word size.
int9: .word 23   # initiate int9 with value 23. The data type for integer is word size.
int10:.word 29   # initiate int10 with value 29. The data type for integer is word size.

li $t0,0         # load 0 into $t0 for sum
lw $t1, int1     # load int1 to $t1
add $t0,$t0,$t1  # add $t0 and $t1, and save the sum in $t0
lw $t1, int2     # load int2 to $t1
add $t0,$t0,$t1  # add int2 to sum $t0
lw $t1, int3     # load int3 to $t1
add $t0,$t0,$t1  # add int3 to sum $t0
lw $t1, int4     # load int4 to $t1
add $t0,$t0,$t1  # add int4 to sum $t0
lw $t1, int5     # load int5 to $t1
add $t0,$t0,$t1  # add int5 to sum $t0
lw $t1, int6     # load int6 to $t1
add $t0,$t0,$t1  # add int6 to sum $t0
lw $t1, int7     # load int7 to $t1
add $t0,$t0,$t1  # add int7 to sum $t0
lw $t1, int8     # load int8 to $t1
add $t0,$t0,$t1  # add int8 to sum $t0
lw $t1, int9     # load int9 to $t1
add $t0,$t0,$t1  # add int9 to sum $t0
lw $t1, int10    # load int10 to $t1
add $t0,$t0,$t1  # add int10 to sum $t0

li $v0, 10      # syscall code 10 is for exit. # put 10 into $v0.
syscall         # make the syscall.
# end of sumOfintegerValues.asm


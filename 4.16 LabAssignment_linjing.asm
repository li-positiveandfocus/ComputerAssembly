# 4.16 Lab Assignment 3 by Linjing Li
# arrayWithlabel.asm-- A program that make an array of word values that has 10 total elements using the label a.
# The elements should be these integer values: 5, 6, 7, 10, 14, 17, 21, 22, 25, 36
# Access the first element of a and store the array’s first value in the register $t0
# Then access the last element of a and store the array’s last value in the register $t1.

.data      # Subsequent items are stored in the data segment
a: .word 5,6,7,10,14,17,21,22,25,36    # declaring array a and assign elements to array a. The data type for integer is word size.
.text
      
main:
    la $a0, a # load 0 into base address of array a in $a0
    lw $t0, 0($a0) # load the first element of array a in $t0
    lw $t1, 36($a0) # load the last element of array a in $t1
    
# end of arrayWithlabel.asm


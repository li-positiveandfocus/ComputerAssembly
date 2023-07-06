# 5.14 Lab Assignment4  by Linjing Li
# rearranceArray.asm-- A program that rearrange the elements of an array by utilizing branching instructions.
# The elements in the array: 5, 255, -5
# the smallest value of threeints is placed into the memory location of threeints’s first element
# the second smallest value of threeints is placed into the memory location of threeints’s second element
# the largest value of threeints is placed to the memory location of threeints’s third element

.data
threeints:  .word 5, 255, -5

.text
main:                    
    la  $t0, threeints      # set $a0 to the address of threeints
    lw  $t1, 0($t0)         # sets $t1 to the first element in threeints
    lw  $t2, 8($t0)         # sets $t2 to the third element in threeints
    slt $t3, $t2, $t1       # if $t2 < $t1 set $t3 = 1 (true)
    beq $t3, $0, Else
    sw  $t1, 8($t0)         # swap 
    sw  $t2, 0($t0)         # swap 
    
Else:
Endif:

    lw  $t1, 4($t0)         # sets $t1 to the second element in threeints
    lw  $t2, 8($t0)         # sets $t2 to the third element in threeints
    slt $t3, $t2, $t1       # if $t2 < $t1 set $t3 = 1 (true)
    beq $t3, $0, Else
    sw  $t1, 8($t0)         # swap
    sw  $t2, 4($t0)         # swap
    
# end of rearranceArray.asm


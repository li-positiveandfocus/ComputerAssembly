# 11.02 Lab Assignmen8 by Linjing Li
# This program takes 5 characters as parameters to a function named reverse5
# character values placed in the $a0 $a1 $a2 $a3 and $t1 registers
# a function named reverse5 uses the stack by having the values in $a0 $a1 $a2 $a3 and $t1 pushed on it in main, 
# and then has the values popped off in the reverse order

# Reverse and output 5 characters 
# $a0 -- the first parameter to the function reversechars;  contains the first of the 5 characters to be reversed
# $a1 -- the second parameter to the function reversechars;  contains the second of the 5 characters to be reversed
# $a2 -- the third parameter to the function reversechars;  contains the third of the 5 characters to be reversed
# $a3 -- the forth parameter to the function reversechars;  contains the forth of the 5 characters to be reversed
# $s7 -- the fifth parameter to the function reversechars;  contains the fifth of the 5 characters to be reversed

# $a0 --- character printed
# $s0 --- character that indicates the first of the 5 characters to be revesred

.data
char0:    .ascii  "H"       
char1:    .ascii  "E"  
char2:    .ascii  "L"
char3:    .ascii  "L"
char4:    .ascii  "O"

.text
main:          

        lbu     $a0, char0  # place the first of the 5 characters to be reversed 
                            # into the reversechars function's first parameter
                            
        lbu     $a1, char1  # place the second of the 5 characters to be reversed 
                            # into the reversechars function's second parameter
                            
        lbu     $a2, char2  # place the third of the 5 characters to be reversed 
                            # into the reversechars function's third parameter
        
        lbu     $a3, char3  # place the forth of the 5 characters to be reversed 
                            # into the reversechars function's forth parameter
                            
        # make some room on the stack for the other one argument
        add     $s7, $sp, $zero #records the bottom of the stack
        addi    $sp, $sp, -4
        # copy the value onto the stack
        lbu     $t1, char4  # push the fifth of the fifth of the 5 characters onto the stack
        sw      $t1, 0($sp) 
        #so now the stack frame is setup, and all the args are ready.
        beq    $s7, $sp, return
        lw     $t1, -4($s7)
        add    $v0, $v0, $t1
        
        # call the reverse5 function
        jal     reverse5   


# reclaim stack memory
        addi $sp, $sp, 4
        
done:   
        li      $v0,10         # exit
        syscall           
                
reverse5:             
# push each character onto the stack
        sw      $a0,($sp)      # place the first cbaracter in the first function parameter register on to the stack
        sub     $sp,$sp,4      # push using the stack pointer
        sw      $a1,($sp)      # place the second cbaracter in the second function parameter register on to the stack
        sub     $sp,$sp,4      # push using the stack pointer
        sw      $a2,($sp)      # place the third cbaracter in the third function parameter register on to the stack 
        sub     $sp,$sp,4      # push using the stack pointer
        sw      $a3,($sp)      # place the fourth cbaracter in the fourth function parameter register on to the stack
        sub     $sp,$sp,4      # push using the stack pointer
        sw      $t1,($sp)      # place the fifth cbaracter in the fifth function parameter register on to the stack
        sub     $sp,$sp,4      # push using the stack pointer                
        
# pop chars from stack back into the buffer
loop:   
        addu    $sp,$sp,4      # pop using the stack pointer
        
        lw      $a0,($sp)      # print a char at the top of the stack -- to print a character in MIPS the $a0 register 
                               # must contain the character to be printed
        li      $v0,11         # service code for printing a character           
        syscall                # prints the character in $a0 when $v0 equals 11
       
        add     $t0, $zero, $a0    # place the character printed into $t0
        
        beq     $s0, $t0, return   # if $t0 is equal to the first of the 4 characters, 
                                   # then all the other characters must have been printed
                                   # so branch to thend the function
        
        j       loop               # loop back to print another character

return: jr $ra

# 10.14 Lab Assignmen7  by Linjing Li
# This program adds four integers together using 
# integer values placed in the $s0 $s1 $s2 and $s3 registers
# a function named add4 uses the stack
# by having the values in $s0 $s1 $s2 and $s3 pushed on it
# in main, and then 
# has the values popped off it within add4

      
main:  
         # These are 4 parameters for our function  
        li $a0, 2  
        li $a1, 3 
        li $a2, 4
        li $a3, 5 
        
        addi $sp, $sp, -16       # make room on the stack for 4 words by decreasing the address of $sp by 16
                                 # 4 Words are 4 * 4 bytes  
        sw $a0, 16($sp)          # push a word from $s0 onto the stack
        sw $a1, 8($sp)           # push a word from $s1 onto the stack
        sw $a2, 4($sp)           # push a word from $s0 onto the stack
        sw $a3, 0($sp)           # push a word from $s1 onto the stack
                
        jal add4 
        
        # Now exit the program
        li $v0, 10
        syscall  
             
      add4:  
        # Load the parameters  
        
        lw $t0, 0($sp)  # pop a word from the stack -- the most recent word is popped first
        lw $t1, 4($sp)  # pop a word from the stack -- the most recent word is popped first
        lw $t2, 8($sp)  # pop a word from the stack -- the most recent word is popped first
        lw $t3, 16($sp) # pop a word from the stack -- the first word is popped last        
        
        add $v0, $t0, $t1      
        add $v0, $v0, $t2
        add $v0, $v0, $t3
        add $v0, $v0, $t4   
        
        # We don't need the parameters on the stack anymore, so place the stack pointer back to the 
        # state it was in by increasing the address of $sp by 16 -- 4 words are 4 * 4 bytes
        addi $sp, $sp, 16          
        
        jr $ra  

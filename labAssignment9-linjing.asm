# 12.06 Lab Assignmen9  by Linjing Li

# This program takes 4 interger values as parameters to a function named f
# interger values placed in the $a0 $a1 $a2 $a3 registers
# a function named f calls other functions as part of its programming logic
# the result value is stored in the $v0 register


main:
        li $v0,0        # initiate result to 0
        li $a0,12       # place the first of the 4 interger values into the function f's first parameter
        li $a1,7        # place the second of the 4 interger values into the function f's second parameter
        li $a2,20       # place the third of the 4 interger values into the function f's third parameter
        li $a3,21       # place the fourth of the 4 interger values into the function f's second parameter
        
        # call the function f
        jal f           
        
        # print return value
        #move $a0,$v0
        li $v0,10
        syscall 
        
        # exit the program
        #li $v0,10
        #syscall 
        #exit:
                



f:
        blt $a0,$a1,case1 # if the first parameter is smaller than the secoond parameter, branch to case1
        beq $a0,$a1,case2 # if the first parameter is equal to the secoond parameter, branch to case2
        bgt $a0,$a1,case3 # if the first parameter is greater than the second parameter, branch to case3


case1:
        move $v0,$a0          # load the first parameter value to result
        j return

case2:
        move $v0,$a1          # load the second parameter value to result
        j return

case3:
        add $v0,$a2,$a3       # add the sum of the first parameter and the second parameter to the result
        j return



return:
        jr $ra #return to funnction f


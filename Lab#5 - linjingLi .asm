# 7.11 Lab Assignmen5  by Linjing Li
# foundValue.asm-- A program that loop through the elements of an array to check whether there is at least one vlue 81.
# The elements in the array :18, 777, -65536, 10, 41, 2, 81, 5000, -1, 9
# If an array element value is found to contain 81 assign the register $t0 to the value 1.
# If no array element value contains 81 assignthe register $t0 to the value 0.

.data

myArray:  .word 18, 777, -65536, 10, 41, 2, 81, 5000, -1,9

.text
     
main:
    la $t1, myArray 
    li $t1,0               #array index
    lw $s0,myArray($t1)    #value variable
    li $t2,1               #loop counter
    li $t0,0               #laod 0 to egister $t0 to make sure $t0 is initialized with 0
   
    
loop: beq $t2,10,endloop   #if $t1 =10, go to endloop
       add $t1,$t1,4 
       lw $s1,myArray($t1) #$s1=myArray[i]
       bne $s1,81, nochg   #if the current value $s1 is not equal to value 81, branch to nochg - no action needed
       li $t0,1            #assign the register $t0 to the value 1
nochg:  
       add $t2, $t2,1      #add 1 to the loop counter
       j loop              #back to loop
endloop:





































    

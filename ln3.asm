.data
    msg: .asciiz "Please enter a number to calculate the fibonnaci sequence for"
    equalsOne: .asciiz "The answer is 1"
    equalsTwo: .asciiz "The answer is 2"
    answer: .asciiz "The answer is "


.text
    addi $v0, $zero, 4
    la $a0, msg
    syscall
    addi $v0, $zero, 5
    syscall
    add $t0, $zero, $v0
    beq $t0, 1, equals1
    beq $t0, 2, equals2 
    addi $t1, $zero, 1
    addi $a1, $zero, 1
    addi $a2, $zero, 1

fib:    slt $t2, $a1, $t0
    bne $t2, 1, exit
    add $a3, $a1, $a2
    add $a2, $a1, $zero
    add $a1, $a3, $zero
    j fib

equals1: la $a0, equalsOne
    addi $v0, $zero, 4
    syscall

equals2: la $a0, equalsTwo
    addi $v0, $zero, 4
    syscall

exit: addi $v0, $zero, 1    #Print integer
    add $a1, $a1, $zero #Print nextNumber
    syscall
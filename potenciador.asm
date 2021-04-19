.data
    igual: .asciiz "="
    potencia: .asciiz "^"
    espacio: .asciiz " "
    linea: .asciiz "\n"
    promptnumber: .asciiz "Ingrese un numero para potenciar:\n"
    promptquantity: .asciiz "ingrese la cantidad de potencias que quiere hacer:\n"
    textoarreglo: .asciiz "se llego al limite del programa...\n"
    resultado: .asciiz "las potencias son:\n"
    reinicio: .asciiz "queres potenciar otro numero?(0 para no, 1 para si):\n"
    final: .asciiz "hasta la proxima!\n"
.text
.globl main
main:
    li $v0, 4
    la $a0, promptnumber
    syscall #imprimir el "ingrese un numero:"
    li $v0, 5
    syscall #tomar el valor
    move $t0, $v0
    move $t2, $v0#crea una copia del valor dado por le usuario y lo pone en $t2
    li $v0, 4
    la $a0, promptquantity
    syscall # mover el valor del numero a $t0 y imprimir la pregunta de la cantidad de potencias
    li $v0, 5
    syscall
    move $t1, $v0
    move $t5, $t1
    li $v0, 4
    la $a0, resultado
    syscall
    li $v0, 4
    la $a0, linea
    syscall
    j inicio
inicio:
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, potencia
    syscall
    addi $t7, $zero, 1
    sub $t6, $t1, $t7
    sub $t5, $t1, $t6
    li $v0, 1
    move $a0, $t5
    syscall
    li $v0, 4
    la $a0, espacio
    syscall
    li $v0, 4
    la $a0, igual
    syscall
    li $v0, 4
    la $a0, espacio
    syscall
    li $v0, 1
    move $a0, $t0
    move $t4, $t0
    syscall #imprimir el numero
    li $v0, 4
    la $a0, linea
    syscall
    mul $t0, $t0, $t2
    li $v0, 4
    la $a0, linea
    syscall
    addi $t1, $t1, -1
    j loop
loop:
    beq $t1, $zero, exit
    div $t3, $t0, $t4
    bne $t3, $t2, arreglo
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, potencia
    syscall
    addi $t7, $t7, 1
    sub $t6, $t1, $t7
    sub $t5, $t1, $t6
    li $v0, 1
    move $a0, $t5
    syscall
    li $v0, 4
    la $a0, espacio
    syscall
    li $v0, 4
    la $a0, igual
    syscall
    li $v0, 4
    la $a0, espacio
    syscall
    li $v0, 1
    move $a0, $t0
    move $t4, $t0
    syscall #iniciar el bucle y imprimir el numero
    li $v0, 4
    la $a0, linea
    syscall
    mul $t0, $t0, $t2
    li $v0, 4
    la $a0, linea
    syscall
    addi $t1, $t1, -1
    j loop
arreglo:
    li $v0, 4
    la $a0, textoarreglo
    syscall
exit:
    li $v0, 4
    la $a0, reinicio
    syscall
    li $v0, 5
    syscall
    move $s0, $v0
    bne $s0, $zero, main
    li $v0, 4
    la $a0, final
    syscall
    li $v0, 10
    syscall

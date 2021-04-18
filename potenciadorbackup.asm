.data
    linea: .asciiz "\n"
    promptnumber: .asciiz "Ingrese un numero(maximo: 46.340):\n"
    promptquantity: .asciiz "ingrese la cantidad de potencias que quiere hacer con el numero (con un maximo de 29 veces):\n"
    textoarreglo: .asciiz "se llego al limite del programa\n"
    numprueba: .word 0
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
    add $t3, $t0, $t2 #crea un valor diferente al tomado y lo guarda a $t3
    li $v0, 4
    la $a0, promptquantity
    syscall # mover el valor del numero a $t0 y imprimir la pregunta de la cantidad de potencias
    li $v0, 5
    syscall
    move $t1, $v0
    li $v0, 4
    la $a0, linea #imprimir linea vacia
    syscall
inicio:
    li $v0, 1
    move $a0, $t0
#   move $t5, $t0
    syscall #imprimir el numero
    mul $t0, $t0, $t2
    li $v0, 4
    la $a0, linea
    syscall
    addi $t1, $t1, -1
    syscall
loop:
    beq $t1, $zero, exit
#   div $t4, $t0, $t5
#   bne $t4, $t2, arreglo
    li $v0, 1
    move $a0, $t0
    syscall #iniciar el bucle y imprimir el numero
    mul $t0, $t0, $t2
    li $v0, 4
    la $a0, linea
    move $t5, $a0
    syscall
    addi $t1, $t1, -1
    j loop
arreglo:
    li $v0, 4
    la $a0, textoarreglo
    syscall
exit:
    li $v0, 10
    syscall

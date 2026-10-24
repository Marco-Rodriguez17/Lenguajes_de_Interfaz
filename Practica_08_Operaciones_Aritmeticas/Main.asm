
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 8: Operaciones aritmeticas
; Descripcion: Realiza operaciones aritmeticas utilizando registros.
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
.code ; Es el espacio donde se escriben las instrucciones del programa

main PROC ; Inicio del programa

    mov eax, 60 ;Estamos agregando el valor 60 al registro eax
    mov ebx, 24 ;Estamos agregando el valor 24 al registro ebx

    add eax, ebx ;Utilizamos la instruccion ADD para sumar los valores de los registros eax y ebx
    sub eax, 15 ;Utilizamos la instruccion SUB para restar el valor 15 al registro eax
    nop ;Instruccion de relleno

    mov eax, 12 ;Estamos agregando el valor 12 al registro eax
    mov al, 253 ;Estamos agregando el valor 253 al registro al

    add al, 4 ;Utilizamos la instruccion ADD para sumar el valor 4 al registro al
    nop ;Instruccion de relleno

    mov eax, 0 ;Estamos agregando el valor 0 al registro eax
    mov al, 127 ;Estamos agregando el valor 127 al registro al

    add al, 1 ;Utilizamos la instruccion ADD para sumar el valor 1 al registro al
    nop ;Instruccion de relleno

    mov eax, 25 ;Estamos agregando el valor 25 al registro eax
    mov ebx, 5 ;Estamos agregando el valor 5 al registro ebx

    mul ebx ;Utilizamos la instruccion MUL para multiplicar los valores de los registros eax y ebx
    nop ;Instruccion de relleno

    mov eax, -7 ;Estamos agregando el valor -7 al registro eax

    imul eax, eax, 3 ;Utilizamos la instruccion IMUL para multiplicar los valores de los registros eax y eax por 3

    nop ;Instruccion de relleno

    mov eax, 94854 ;Estamos agregando el valor 94854 al registro eax
    mov ebx, 94854 ;Estamos agregando el valor 94854 al registro ebx

    mul ebx ;Utilizamos la instruccion MUL para multiplicar los valores de los registros eax y ebx
    nop ;Instruccion de relleno

    mov eax, 130 ;Estamos agregando el valor 130 al registro eax
    mov edx, 0 ;Estamos agregando el valor 0 al registro edx

    mov ebx, 13 ;Estamos agregando el valor 13 al registro ebx
    div ebx ;Utilizamos la instruccion DIV para dividir los valores de los registros eax y ebx
    nop ;Instruccion de relleno

    mov eax, -130 ;Estamos agregando el valor -130 al registro eax
    cdq ;Convertimos el valor de eax a edx:eax para la division

    mov ebx, 13 ;Estamos agregando el valor 13 al registro ebx
    idiv ebx ;Utilizamos la instruccion IDIV para dividir los valores de los registros edx:eax y ebx
    exit ;Termina el programa

main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada

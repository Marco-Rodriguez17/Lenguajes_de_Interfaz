
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 9: PUSH y POP
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
.code ; Es el espacio donde se escriben las instrucciones del programa
main PROC ; Inicio del programa

    mov eax, 40 ;Estamos agregando el valor 40 al registro eax
    push eax ;Con la instreuccion de PUSH agregamos el valor del registro eax al pricipio de la pila

    nop ;Instruccion de relleno

    mov eax, 0 ;Estamos agregando el valor 0 al registro eax
    pop ebx ;Con la instruccion POP removemos el ultimo valor agregado a la pila y lo almacenamos en el registro ebx

    nop ;Instruccion de relleno

    mov eax, 10 ;Estamos agregando el valor 10 al registro eax
    push eax ;Con la instreuccion de PUSH agregamos el valor del registro eax al pricipio de la pila

    mov eax, 20 ;Estamos agregando el valor 20 al registro eax
    push eax ;Con la instreuccion de PUSH agregamos el valor del registro eax al pricipio de la pila

    mov eax, 30 ;Estamos agregando el valor 30 al registro eax
    push eax ;Con la instreuccion de PUSH agregamos el valor del registro eax al pricipio de la pila

    nop ;Instruccion de relleno

    pop eax ;Con la instruccion POP removemos el ultimo valor agregado a la pila y lo almacenamos en el registro eax
    pop ebx ;Con la instruccion POP removemos el ultimo valor agregado a la pila y lo almacenamos en el registro ebx
    pop ecx ;Con la instruccion POP removemos el ultimo valor agregado a la pila y lo almacenamos en el registro ecx

    nop ;Instruccion de relleno

    mov eax, 100 ;Estamos agregando el valor 100 al registro eax
    mov ebx, 200 ;Estamos agregando el valor 200 al registro ebx

    push eax ;Con la instreuccion de PUSH agregamos el valor del registro eax al pricipio de la pila
    push ebx ;Con la instreuccion de PUSH agregamos el valor del registro ebx al pricipio de la pila

    pop ebx ;Con la instruccion POP removemos el ultimo valor agregado a la pila y lo almacenamos en el registro ebx
    pop eax ;Con la instruccion POP removemos el ultimo valor agregado a la pila y lo almacenamos en el registro eax

    nop ;Instruccion de relleno

    mov eax, 50 ;Estamos agregando el valor 50 al registro eax
    mov ebx, 100 ;Estamos agregando el valor 100 al registro ebx

    call aumentarDiez ;Llamamos al procedimiento aumentarDiez para que sume 10 al valor del registro eax

    nop ;Instruccion de relleno

    exit ;Termina el programa
main ENDP ;Termina el procedimiento main

aumentarDiez PROC ;Inicio del procedimiento aumentarDiez

    add eax, 10 ;Utilizamos la instruccion ADD para sumar el valor 10 al registro eax

    ret ;Retorna al procedimiento que lo llamo

aumentarDiez ENDP ;Final del procedimiento aumentarDiez
END main ;Aqui finaliza el programa y el main es el punto de entrada

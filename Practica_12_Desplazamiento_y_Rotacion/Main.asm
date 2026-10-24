
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 12: Desplazamiento y rotacion
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa

.code ;Es el espacio donde se escriben las instrucciones del programa

main PROC ;Inicio del programa
    mov eax, 0 ;Estamos agregando el valor 0 al registro eax
    mov ebx, 0 ;Estamos agregando el valor 0 al registro ebx
    mov ecx, 0 ;Estamos agregando el valor 0 al registro ecx
    mov edx, 0 ;Estamos agregando el valor 0 al registro edx

    ; 1 - SHL: DESPLAZAR UNA POSICION A LA IZQUIERDA
    mov al, 10000000b ;Estamos agregando el valor 10000000b al registro al
    shl al, 1 ;La instruccion de SHl desplaza el contenido del registro al una posicion a la izquierda

    call DumpRegs ;Aqui llamamos a la funcion que nos muestra el contenido de los registros
    call WriteBin ;Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro eax en binario

    ; 2 - SHR: DESPLAZAR UNA POSICION A LA DERECHA
    mov al, 00001101b ;Estamos agregando el valor 00001101b al registro al
    shr al, 1 ;La instruccion de SHR desplaza el contenido del registro al una posicion a la derecha

    call DumpRegs ;Aqui llamamos a la funcion que nos muestra el contenido de los registros
    call WriteBin ;Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro eax en binario

    ; 3 - SAR: DESPLAZAMIENTO CON SIGNO
    mov al, -9 ;Estamos agregando el valor -9 al registro al
    sar al, 1 ;La instruccion de SAR desplaza el contenido del registro al una posicion a la derecha con signo

    call DumpRegs ;Aqui llamamos a la funcion que nos muestra el contenido de los registros
    call WriteBin ;Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro eax en binario

    ; 4 - DESPLAZAMIENTO CON CONSTANTE
    mov al, 00001111b ;Estamos agregando el valor 00001111b al registro al
    shl al, 2 ;La instruccion de SHL desplaza el contenido del registro al dos posiciones a la izquierda

    call DumpRegs ;Aqui llamamos a la funcion que nos muestra el contenido de los registros
    call WriteBin ;Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro eax en binario

    ; 5 - DESPLAZAMIENTO CON CL
    mov al, 00010100b ;Estamos agregando el valor 00010100b al registro al
    mov cl, 2 ;Estamos agregando el valor 2 al registro cl
    shr al, cl ;La instruccion de SHR desplaza el contenido del registro al a la derecha segun el valor del registro cl

    call DumpRegs ;Aqui llamamos a la funcion que nos muestra el contenido de los registros
    call WriteBin ;Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro eax en binario

    ; 6 - ROR, ROL, RCL, RCR

    ; ROR
    mov al, 10000001b ;Estamos agregando el valor 10000001b al registro al
    ror al, 1 ;La instruccion de ROR rota el contenido del registro al una posicion a la derecha

    call DumpRegs ;Aqui llamamos a la funcion que nos muestra el contenido de los registros
    call WriteBin ;Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro eax en binario

    ; ROL
    mov al, 10000001b ;Estamos agregando el valor 10000001b al registro al
    rol al, 1 ;La instruccion de ROL rota el contenido del registro al una posicion a la izquierda

    call DumpRegs ;Aqui llamamos a la funcion que nos muestra el contenido de los registros
    call WriteBin ;Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro eax en binario

    ; RCL
    clc ;Le damos el valor de 0 a la bandera de acarreo
    mov al, 10000001b ;Estamos agregando el valor 10000001b al registro al
    rcl al, 1 ;La instruccion de RCL rota el contenido del registro al una posicion a la izquierda, incluyendo la bandera de acarreo

    call DumpRegs ;Aqui llamamos a la funcion que nos muestra el contenido de los registros
    call WriteBin ;Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro eax en binario

    ; RCR
    clc
    mov al, 10000001b ;Estamos agregando el valor 10000001b al registro al
    rcr al, 1 ;La instruccion de RCR rota el contenido del registro al una posicion a la derecha, incluyendo la bandera de acarreo

    call DumpRegs ;Aqui llamamos a la funcion que nos muestra el contenido de los registros
    call WriteBin ;Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro eax en binario

    exit ;Termina el programa
main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada

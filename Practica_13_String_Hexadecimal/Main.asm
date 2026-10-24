
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Dr. Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 13: String hexadecimal
; Descripcion: Convierte un numero hexadecimal en una cadena.
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
    valorOriginal DWORD 12AB34CDh ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion
    bufferHex     BYTE 9 DUP(0) ;Un buffer nos sirve para almacenar temporalmente datos, en este caso estamos declarando un buffer de tipo BYTE con capacidad de almacenar 9 bytes de informacion y lo inicializamos con 0

.code ;Es el espacio donde se escriben las instrucciones del programa
main PROC ;Inicio del programa
    mov eax, 12AB34CDh ;Estamos agregando el valor 12AB34CDh al registro eax
    mov ecx, 8 ;Estamos agregando el valor 8 al registro ecx
    mov esi, 7 ;Estamos agregando el valor 7 al registro esi

conv_loop: ;Etiqueta para el ciclo
    push eax ;Con la instreuccion de PUSH agregamos el valor del registro eax al pricipio de la pila
    and eax, 0Fh ;Estamos usando la intruccion AND para obtener el valor de los ultimos 4 bits del registro eax

    cmp al, 9 ;Comparamos el valor del registro al con 9
    jbe es_num ;El salto condicional JBE se utiliza cuando el valor del registro al es menor o igual a 9, en este caso saltamos a la etiqueta "es_num"

    add al, 'A' - 10 ;Utilizamos la instruccion ADD para sumar el valor 'A' - 10 al registro al
    jmp almacenar ;Salto incondicional a la etiqueta "almacenar"

es_num: ;Etiqueta para el caso en que el valor del registro al es un numero

    add al, '0' ;Utilizamos la instruccion ADD para sumar el valor '0' al registro al

almacenar: ;Etiqueta para almacenar el valor del registro al en el bufferHex
    mov bufferHex[esi], al ; Movemos el valor de al al bufferHex en la posicion indicada por el registro esi
    pop eax ;Con la instruccion POP removemos el ultimo valor agregado a la pila y lo almacenamos en el registro eax
    shr eax, 4 ;Utilizamos la instruccion SHR para desplazar a la derecha el valor del registro eax en 4 bits
    dec esi ;Decrementamos el valor de esi en 1
    loop conv_loop ;Utilizamo loop para repetir el ciclo hasta que ecx llegue a 0

    mov edx, OFFSET bufferHex ;Se mueve la direccion de memoria de la variable bufferHex a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    exit ;Termina el programa
main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada

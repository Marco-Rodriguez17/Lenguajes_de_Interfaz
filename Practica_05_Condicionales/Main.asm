
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Dr. Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 5: Condicionales
; Descripcion: Utiliza ciclos While y Do While para mostrar numeros
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.code ; Es el espacio donde se escriben las instrucciones del programa
main PROC ; Inicio del programa

    mov ebx, 1 ;Estamos agregando el valor 1 al registro ebx

cicloWhile: ; Etiqueta para el ciclo
    cmp ebx, 100 ;Comparamos el valor del registro ebx con 100

    jg fin

    mov eax, ebx ;Movemos el valor de ebx a eax
    call WriteDec ; LLamamos a la funcion WriteDec para imprimir el valor del registro eax en decimal
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    inc ebx
    jmp cicloWhile ;Salto incondicional a la etiqueta "cicloWhile"

fin: ;Aqui es la etiqueta a donde manda el jg al terminar el primer ciclo
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    mov ebx, 1 ;Estamos agregando el valor 1 al registro ebx

cicloDoWhile: ; Etiqueta para el ciclo

    mov eax, ebx ;Movemos el valor de ebx a eax
    call WriteDec ; LLamamos a la funcion WriteDec para imprimir el valor del registro eax en decimal
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    inc ebx
    cmp ebx, 100 ;Comparamos el valor del registro ebx con 100

    jle cicloDoWhile

    exit ;Termina el programa
main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada

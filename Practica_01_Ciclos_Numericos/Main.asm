
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Dr. Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 1: Ciclos numericos
; Descripcion: Muestra una secuencia de numeros utilizando un ciclo.
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa

.code ; Es el espacio donde se escriben las instrucciones del programa
main PROC ; Inicio del programa
    mov ecx, 20 ;Estamos agregando el valor al regitro ecx

ciclo: ; Etiqueta para el ciclo
    mov eax, ecx ;Movemos el valor de ecx a eax

    call WriteDec ; LLamamos a la funcion WriteDec para imprimir el valor del registro eax en decimal
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    loop ciclo ;Utilizamo loop para repetir el ciclo hasta que llegue a 0

    exit ;Termina el programa
    
main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada

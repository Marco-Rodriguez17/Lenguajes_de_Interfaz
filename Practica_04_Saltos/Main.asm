
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 4: Saltos
; Descripcion: Utiliza saltos para cambiar el flujo del programa.
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa

.code ; Es el espacio donde se escriben las instrucciones del programa
main PROC ; Inicio del programa
    mov eax, 5 ;Estamos agregando el valor 5 al registro eax

    jmp continuar ;Salto incondicional a la etiqueta "continuar"
    mov eax, 10 ;Estamos agregando el valor 10 al registro eax

continuar: ;Aqui es la etiqueta a donde manda el jmp para continuar el programa
    call DumpRegs ;Aqui llamamos a la funcion que nos muestra el contenido de los registros
    exit ;Termina el programa

main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada

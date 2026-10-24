
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 5.1: Repetir hasta que el usuario ingrese 0
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
    numero BYTE "Escribe un numero: ", 0 ;Aqui se declara la variable numero que contiene el mensaje que se va a desplegar en pantalla
    mensajeIntentar BYTE "Ingrese nuevamente un numero", 0 ;Aqui se declara la variable mensajeIntentar que contiene el mensaje que se va a desplegar en pantalla
    mensajeCero BYTE "Programa terminado, se ingreso el 0", 0 ;Aqui se declara la variable mensajeCero que contiene el mensaje que se va a desplegar en pantalla

.code ;Es el espacio donde se escriben las instrucciones del programa

main PROC ;Inicio del programa

ciclo: ;Etiqueta para el ciclo
    mov edx, OFFSET numero ;Se mueve la direccion de memoria de la variable numero a el registro edx
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    call ReadInt ;Llamamos a la funcion ReadInt para leer el valor que se ingrese y lo guarda en eax

    cmp eax, 0 ;Comparamos el valor del registro eax con 0

    je fin ;Si los valores son iguales, se salta a la etiqueta "fin"

    mov edx, OFFSET mensajeIntentar ;Se mueve la direccion de memoria de la variable mensajeIntentar a el registro edx
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    jmp ciclo ;Salto incondicional a la etiqueta "ciclo"

fin: ;Etiqueta del salto je donde los valores son iguales
    mov edx, OFFSET mensajeCero ;Se mueve la direccion de memoria de la variable mensajeCero a el registro edx
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    exit ;Termina el programa
main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada

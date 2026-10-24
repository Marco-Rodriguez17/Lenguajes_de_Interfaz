
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 2: Captura y desplegado de mensaje
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
    mensaje BYTE "Escribe tu nombre: ", 0 ;Aqui se declara la variable mensaje que contiene el mensaje que se va a desplegar en pantalla
    nombre BYTE 30 DUP(0) ;Aqui se declara la variable nombre que va a almacenar el nombre ingresado por el usuario

.code ; Es el espacio donde se escriben las instrucciones del programa
main PROC ; Inicio del programa

    mov edx, OFFSET mensaje ;Se mueve la direccion de memoria de la variable mensaje a el registro edx
    call WriteString ; se usa call para llama la instruccion WriteString que despliega el mensaje en pantalla

    mov edx, OFFSET nombre ;Se mueve la direccion de memoria de la variable nombre a el registro edx
    mov ecx, SIZEOF nombre ;Se mueve el tamaño de la variable nombre a el registro ecx

    call ReadString ; se usa call para llama la instruccion ReadString que permite al usuario ingresar su nombre

    mov edx, OFFSET nombre ;movemos la direccion de la variable nombre al resgistro edx
    call WriteString ;Utilizamos WriteString para deplegar el nombre
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    exit ;Termina el programa

main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada

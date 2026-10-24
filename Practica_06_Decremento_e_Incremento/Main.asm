
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Dr. Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 6: Decremento e incremento
; Descripcion: Incrementa y decrementa un numero ingresado.
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
    msg BYTE "Escribe un numero: ", 0 ;Aqui se declara la variable msg que contiene el mensaje que se va a desplegar en pantalla
    incremento BYTE "Incremento: ", 0 ;Aqui se declara la variable incremento que contiene el mensaje que se va a desplegar en pantalla
    decremento BYTE "Decremento: ", 0 ;Aqui se declara la variable decremento que contiene el mensaje que se va a desplegar en pantalla

.code ; Es donde iniciael espacio donde se escriben las instrucciones del programa
main PROC ; Inicio del programa

    mov edx, OFFSET msg ;Se mueve la direccion de memoria de la variable msg a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call ReadInt ;Llamamos a la funcion ReadInt para leer el valor que se ingrese y lo guarda en eax
    mov ebx, eax ;Movemos el valor de eax a ebx

    mov edx, OFFSET incremento ;Se mueve la direccion de memoria de la variable incremento a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    inc eax ;Incrementamos el valor de eax en 1
    call WriteInt ;Llamamos a la funcion WriteInt para mostar el valor guardado en eax
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    mov eax, ebx ;Movemos el valor de ebx a eax

    mov edx, OFFSET decremento ;Se mueve la direccion de memoria de la variable decremento a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    dec eax ;Decrementamos el valor de eax en 1
    call WriteInt ;Llamamos a la funcion WriteInt para mostar el valor guardado en eax
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    exit ;Termina el programa
main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada

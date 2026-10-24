
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 4.1: Mayor, menor o igual con entrada del usuario
; Descripcion: Compara dos numeros ingresados por el usuario.
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
    n1 BYTE "Escribe el primer numero a comparar: ", 0 ;Aqui se declara la variable n1 que contiene el mensaje que se va a desplegar en pantalla
    n2 BYTE "Escribe el segundo numero a comparar: ", 0 ;Aqui se declara la variable n2 que contiene el mensaje que se va a desplegar en pantalla

    msgIguales BYTE "Los numeros son iguales", 0 ;Aqui se declara la variable msgIguales que contiene el mensaje que se va a desplegar en pantalla
    msgMayor BYTE "El primer numero es mayor", 0 ;Aqui se declara la variable msgMayor que contiene el mensaje que se va a desplegar en pantalla
    msgMenor BYTE "El primer numero es menor", 0 ;Aqui se declara la variable msgMenor que contiene el mensaje que se va a desplegar en pantalla

    num1 DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion
    num2 DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion

.code ;Es el espacio donde se escriben las instrucciones del programa
main PROC ;Inicio del programa

    mov edx, OFFSET n1 ;Se mueve la direccion de memoria de la variable n1 a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call ReadInt ;Llamamos a la funcion ReadInt para leer el valor que se ingrese y lo guarda en eax
    mov num1, eax ;Agregando el valor de eax a la variable num1

    mov edx, OFFSET n2 ;Se mueve la direccion de memoria de la variable n2 a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    call ReadInt ;Llamamos a la funcion ReadInt para leer el valor que se ingrese y lo guarda en eax
    mov num2, eax ;Agregando el valor de eax a la variable num2

    mov eax, num1 ;Moviendo el valor de num1 al registro eax
    mov ebx, num2 ;Moviendo el valor de num2 al registro ebx

    cmp eax, ebx ;Comparamos los valores de los registros eax y ebx

    je iguales ;Si los valores son iguales, se salta a la etiqueta "iguales"
    jg mayor ;Salto condicional a la etiqueta "mayor" si es mayor
    jl menor ;Salto condicional a la etiqueta "menor" si es menor

iguales: ;Etiqueta para el caso en que los numeros sean iguales
    mov edx, OFFSET msgIguales ;Se mueve la direccion de memoria de la variable msgIguales a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    jmp fin ;Salto incondicional a la etiqueta "fin"

mayor: ;Etiqueta para el caso en que el primer numero sea mayor
    mov edx, OFFSET msgMayor ;Se mueve la direccion de memoria de la variable msgMayor a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    jmp fin ;Salto incondicional a la etiqueta "fin"

menor: ;Etiqueta para el caso en que el primer numero sea menor
    mov edx, OFFSET msgMenor ;Se mueve la direccion de memoria de la variable msgMenor a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

fin: ;Aqui es la etiqueta a donde manda el jmp que termina el programa
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    exit ;Termina el programa

main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada

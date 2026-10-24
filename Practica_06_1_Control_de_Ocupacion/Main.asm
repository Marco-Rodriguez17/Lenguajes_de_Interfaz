
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 6.1: Control de ocupacion
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
    msg1 BYTE "Cantidad de espacios del estacionamiento: ", 0 ;Aqui se declara la variable msg1 que contiene el mensaje que se va a desplegar en pantalla
    msg2 BYTE "Ingrese 1 para estacionar un auto: ", 0 ;Aqui se declara la variable msg2 que contiene el mensaje que se va a desplegar en pantalla
    msg3 BYTE "Espacios disponibles: ", 0 ;Aqui se declara la variable msg3 que contiene el mensaje que se va a desplegar en pantalla
    msg4 BYTE "Estacionamiento lleno, no se pueden estacionar mas autos", 0 ;Aqui se declara la variable msg4 que contiene el mensaje que se va a desplegar en pantalla
    espacios DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion
    estacionar DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion

.code ;Es el espacio donde se escriben las instrucciones del programa
main PROC ;Inicio del programa
    mov edx, OFFSET msg1 ;Se mueve la direccion de memoria de la variable msg1 a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call ReadInt ;Llamamos a la funcion ReadInt para leer el valor que se ingrese y lo guarda en eax
    mov espacios, eax ;Agregando el valor de eax a la variable espacios

ciclo: ;Etiqueta para el ciclo
    cmp espacios, 0 ;Comparamos el valor de la variable espacios con 0
    je lleno ;Si los valores son iguales, se salta a la etiqueta "lleno"

    mov edx, OFFSET msg2 ;Se mueve la direccion de memoria de la variable msg2 a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call ReadInt ;Llamamos a la funcion ReadInt para leer el valor que se ingrese y lo guarda en eax
    mov estacionar, eax ;Agregando el valor de eax a la variable estacionar

    cmp estacionar, 1 ;Comparamos el valor de la variable estacionar con 1
    jne ciclo ;Salto condicional a la etiqueta "ciclo" si no son iguales

    dec espacios ;Decrementamos el valor de espacios en 1

    mov edx, OFFSET msg3 ;Se mueve la direccion de memoria de la variable msg3 a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    mov eax, espacios ;Moviendo el valor de espacios al registro eax
    call WriteDec ;LLamamos a la funcion WriteDec para imprimir el valor del registro eax en decimal
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    jmp ciclo ;Salto incondicional a la etiqueta "ciclo"

lleno: ;Etiqueta para cuando el estacionamiento esta lleno
    mov edx, OFFSET msg4 ;Se mueve la direccion de memoria de la variable msg4 a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    exit ;Termina el programa

main ENDP ;Termina el procedimiento main
END main ;Aqui finaliza el programa y el main es el punto de entrada

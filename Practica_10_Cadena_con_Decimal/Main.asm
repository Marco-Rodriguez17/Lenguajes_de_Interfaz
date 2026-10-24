
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 10: Cadena con decimal
; Descripcion: Calcula datos de una descarga y los muestra en decimal.
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
    bytesDesc DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion
    bytesPend DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion
    gruposComp DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion
    porcentaje DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion
    residuo DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion
    bufferASCII BYTE 11 DUP(0) ;Un buffer nos sirve para almacenar temporalmente datos, en este caso estamos declarando un buffer de tipo BYTE con capacidad de almacenar 11 bytes de informacion y lo inicializamos con 0

.code ; Es el espacio donde se escriben las instrucciones del programa
main PROC ; Inicio del programa
    mov eax, 125 ;Estamos agregando el valor 125 al registro eax
    mov ebx, 512 ;Estamos agregando el valor 512 al registro ebx
    mul ebx ;Utilizamos la instruccion MUL para multiplicar los valores de los registros eax y ebx
    mov bytesDesc, eax ;Agregando el valor de eax a la variable bytesDesc

    mov esi, OFFSET bufferASCII ;Se mueve la direccion de memoria de la variable bufferASCII a el registro esi
    call convertirDecimal ;Llamamos a la funcion convertirDecimal para convertir el valor de bytesDesc a decimal
    mov edx, OFFSET bufferASCII ;Se mueve la direccion de memoria de la variable bufferASCII a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    mov eax, 100000 ;Estamos agregando el valor 100000 al registro eax
    sub eax, bytesDesc ;Utilizamos la instruccion SUB para restar el valor de bytesDesc al registro eax
    mov bytesPend, eax ;Agregando el valor de eax a la variable bytesPend

    mov eax, bytesPend ;Agregando el valor de bytesPend al registro eax
    mov esi, OFFSET bufferASCII ;Se mueve la direccion de memoria de la variable bufferASCII a el registro esi
    call convertirDecimal ;Llamamos a la funcion convertirDecimal para convertir el valor de bytesPend a decimal
    mov edx, OFFSET bufferASCII ;Se mueve la direccion de memoria de la variable bufferASCII a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    mov eax, bytesDesc ;Moviendo el valor de bytesDesc al registro eax
    mov ebx, 100 ;Estamos agregando el valor 100 al registro ebx
    mul ebx ;Utilizamos la instruccion MUL para multiplicar los valores de los registros eax y ebx
    mov ebx, 100000 ;Estamos agregando el valor 100000 al registro ebx
    mov edx, 0 ;Estamos agregando el valor 0 al registro edx
    div ebx ;Utilizamos la instruccion DIV para dividir los valores de los registros eax y ebx
    mov porcentaje, eax ;Moviendo el valor de eax a la variable porcentaje

    mov esi, OFFSET bufferASCII ;Se mueve la direccion de memoria de la variable bufferASCII a el registro esi
    call convertirDecimal ;Llamamos a la funcion convertirDecimal para convertir el valor de porcentaje a decimal
    mov edx, OFFSET bufferASCII ;Se mueve la direccion de memoria de la variable bufferASCII a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    mov eax, bytesDesc ;Moviendo el valor de bytesDesc al registro eax
    mov ebx, 1024 ;Estamos agregando el valor 1024 al registro ebx
    mov edx, 0 ;Estamos agregando el valor 0 al registro edx
    div ebx ;Utilizamos la instruccion DIV para dividir los valores de los registros eax y ebx
    mov gruposComp, eax ;Moviendo el valor de eax a la variable gruposComp
    mov residuo, edx ;Moviendo el valor de edx a la variable residuo

    mov esi, OFFSET bufferASCII ;Se mueve la direccion de memoria de la variable bufferASCII a el registro esi
    call convertirDecimal ;Llamamos a la funcion convertirDecimal para convertir el valor de gruposComp a decimal
    mov edx, OFFSET bufferASCII ;Se mueve la direccion de memoria de la variable bufferASCII a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    mov eax, residuo ;Moviendo el valor de residuo al registro eax
    mov esi, OFFSET bufferASCII ;Se mueve la direccion de memoria de la variable bufferASCII a el registro esi
    call convertirDecimal ;Llamamos a la funcion convertirDecimal para convertir el valor de residuo a decimal
    mov edx, OFFSET bufferASCII ;Se mueve la direccion de memoria de la variable bufferASCII a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    exit ;Termina el programa
main ENDP ;Termina el procedimiento main

convertirDecimal PROC ;Inicio del procedimiento convertirDecimal
    mov ecx, 0 ;Estamos agregando el valor 0 al registro ecx
    mov ebx, 10 ;Estamos agregando el valor 10 al registro ebx

convertirLoop: ;Etiqueta para el ciclo
    mov edx, 0 ;Estamos agregando el valor 0 al registro edx
    div ebx ;Utilizamos la instruccion DIV para dividir los valores de los registros eax y ebx
    push edx ;Con la instreuccion de PUSH agregamos el valor del registro edx al pricipio de la pila
    inc ecx ;Incrementamos el valor de ecx en 1

    cmp eax, 0 ;Comparamos el valor del registro eax con 0
    jne convertirLoop ;Salto condicional a la etiqueta "convertirLoop" si no son iguales

cadenaLoop: ;Etiqueta para el ciclo
    pop edx ;Con la instruccion POP removemos el ultimo valor agregado a la pila y lo almacenamos en el registro edx
    add dl, '0' ;Utilizamos la instruccion ADD para sumar el valor '0' al registro dl
    mov [esi], dl ;Movemos el valor de dl a la direccion de memoria apuntada por esi
    inc esi ;Incrementamos el valor de esi en 1
    loop cadenaLoop ;Utilizamo loop para repetir el ciclo hasta que ecx llegue a 0
    mov byte ptr [esi], 0 ;Movemos el valor de 0 a la direccion de memoria de esi para indicar el final de la cadena

    ret ;Retorna al procedimiento que lo llamo
convertirDecimal ENDP ;Finalizamos el procedimiento convertirDecimal

END main ;Aqui finaliza el programa y el main es el punto de entrada

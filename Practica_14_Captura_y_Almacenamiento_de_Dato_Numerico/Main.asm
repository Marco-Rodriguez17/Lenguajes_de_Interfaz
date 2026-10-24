
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 14: Captura y almacenamiento de dato numerico
; Descripcion: Captura y valida cantidades para actualizar un inventario
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa

cantidadInicial DWORD 25 ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion
cantidadRecibida DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion
existenciaActual DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion
recepcion BYTE "Ingrese una cantidad (1-99): ",0 ;Aqui se declara la variable recepcion que contiene el mensaje que se va a desplegar en pantalla
msgError BYTE "Cantidad recibida invalida",0 ;Aqui se declara la variable msgError que contiene el mensaje que se va a desplegar en pantalla
msg1 BYTE "Existencia inicial ",0 ;Aqui se declara la variable msg1 que contiene el mensaje que se va a desplegar en pantalla
msg2 BYTE " + recepcion de ",0 ;Aqui se declara la variable msg2 que contiene el mensaje que se va a desplegar en pantalla
msg3 BYTE " existencia actual ",0 ;Aqui se declara la variable msg3 que contiene el mensaje que se va a desplegar en pantalla
msg4 BYTE " unidades",0 ;Aqui se declara la variable msg4 que contiene el mensaje que se va a desplegar en pantalla
cadena BYTE 10 DUP(0) ;Un buffer nos sirve para almacenar temporalmente datos, en este caso estamos declarando un buffer de tipo BYTE con capacidad de almacenar 10 bytes de informacion y lo inicializamos con 0
buffer BYTE 3 DUP(0) ;Un buffer nos sirve para almacenar temporalmente datos, en este caso estamos declarando un buffer de tipo BYTE con capacidad de almacenar 3 bytes de informacion y lo inicializamos con 0

.code ;Es el espacio donde se escriben las instrucciones del programa
main PROC ;Inicio del programa

capturar: ;Etiqueta para el ciclo de captura de datos

    mov edx, OFFSET recepcion ;Se mueve la direccion de memoria de la variable recepcion a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    mov edx, OFFSET buffer ;Se mueve la direccion de memoria de la variable buffer a el registro edx
    mov ecx, SIZEOF buffer ;Se mueve el tamaño de la variable buffer a el registro ecx
    call ReadString ;Utilizamos ReadString para leer la cadena ingresada

    cmp eax, 0 ;Comparamos el valor del registro eax con 0
    je error ;Si los valores son iguales, se salta a la etiqueta "error"

    cmp eax, 2 ;Comparamos el valor del registro eax con 2
    ja error ;Salto condicional a la etiqueta "error" si es mayor, sin signo

    mov bl, buffer[0] ;Movemos un caracter de la cadena ingresada al registro bl

    cmp bl, '0' ;Comparamos el valor del registro bl con '0'
    jb error ;Salto condicional a la etiqueta "error" si es menor, sin signo

    cmp bl, '9' ;Comparamos el valor del registro bl con '9'
    ja error ;Salto condicional a la etiqueta "error" si es mayor, sin signo

    cmp eax, 1 ;Comparamos el valor del registro eax con 1
    je unDigito ;Si los valores son iguales, se salta a la etiqueta "unDigito"

    mov bl, buffer[1] ;Movemos un caracter de la cadena ingresada al registro bl

    cmp bl, '0' ;Comparamos el valor del registro bl con '0'
    jb error ;Salto condicional a la etiqueta "error" si es menor, sin signo

    cmp bl, '9' ;Comparamos el valor del registro bl con '9'
    ja error ;Salto condicional a la etiqueta "error" si es mayor, sin signo

    movzx eax, buffer[0] ;Movemos un caracter de la cadena ingresada al registro eax
    sub eax, '0' ;Utilizamos la instruccion SUB para restar el valor '0' al registro eax

    mov ebx, 10 ;Estamos agregando el valor 10 al registro ebx
    mul ebx ;Utilizamos la instruccion MUL para multiplicar los valores de los registros eax y ebx

    movzx ebx, buffer[1] ;Movemos un caracter de la cadena ingresada al registro ebx
    sub ebx, '0' ;Utilizamos la instruccion SUB para restar el valor '0' al registro ebx

    add eax, ebx ;Utilizamos la instruccion ADD para sumar los valores de los registros eax y ebx
    jmp validarRango ;Salto incondicional a la etiqueta "validarRango"

unDigito: ;Etiqueta para un solo digito
    movzx eax, buffer[0] ;Movemos un caracter de la cadena ingresada al registro eax
    sub eax, '0' ;Utilizamos la instruccion SUB para restar el valor '0' al registro eax

validarRango: ;Etiqueta para validar el rango
    cmp eax, 1 ;Comparamos el valor del registro eax con 1
    jb error ;Salto condicional a la etiqueta "error" si es menor, sin signo

    cmp eax, 99 ;Comparamos el valor del registro eax con 99
    ja error ;Salto condicional a la etiqueta "error" si es mayor, sin signo

    mov cantidadRecibida, eax ;Agregando el valor de eax a la variable cantidadRecibida
    mov eax, cantidadInicial ;Moviendo el valor de cantidadInicial al registro eax
    add eax, cantidadRecibida ;Utilizamos la instruccion ADD para sumar el valor de cantidadRecibida al registro eax
    mov existenciaActual, eax ;Agregando el valor de eax a la variable existenciaActual

    ; MUESTRA LA EXISTNCIA INICIAL
    mov edx, OFFSET msg1 ;Se mueve la direccion de memoria de la variable msg1 a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    mov eax, cantidadInicial ;Moviendo el valor de cantidadInicial al registro eax
    mov esi, OFFSET cadena ;Se mueve la direccion de memoria de la variable cadena a el registro esi
    call convertirDecimal ;Llamamos a la funcion convertirDecimal para convertir el numero de eax a una cadena decimal

    mov edx, OFFSET cadena ;Se mueve la direccion de memoria de la variable cadena a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    ; MUESTRA LA CANTIDAD RECIBIDA
    mov edx, OFFSET msg2 ;Se mueve la direccion de memoria de la variable msg2 a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    mov eax, cantidadRecibida ;Moviendo el valor de cantidadRecibida al registro eax
    mov esi, OFFSET cadena ;Se mueve la direccion de memoria de la variable cadena a el registro esi
    call convertirDecimal ;Llamamos a la funcion convertirDecimal para convertir el numero de eax a una cadena decimal

    mov edx, OFFSET cadena ;Se mueve la direccion de memoria de la variable cadena a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    ; MUESTRA LA EXISTENCIA ACTUAL
    mov edx, OFFSET msg3 ;Se mueve la direccion de memoria de la variable msg3 a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    mov eax, existenciaActual ;Moviendo el valor de existenciaActual al registro eax
    mov esi, OFFSET cadena ;Se mueve la direccion de memoria de la variable cadena a el registro esi
    call convertirDecimal ;Llamamos a la funcion convertirDecimal para convertir el numero de eax a una cadena decimal

    mov edx, OFFSET cadena ;Se mueve la direccion de memoria de la variable cadena a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    mov edx, OFFSET msg4 ;Se mueve la direccion de memoria de la variable msg4 a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    exit ;Termina el programa

error: ;Etiqueta para el manejo de errores
    mov edx, OFFSET msgError ;Se mueve la direccion de memoria de la variable msgError a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    jmp capturar ;Salto incondicional a la etiqueta "capturar"

main ENDP ;Termina el procedimiento main

convertirDecimal PROC ;Inicio del procedimiento convertirDecimal

    mov ecx, 0 ;Estamos agregando el valor 0 al registro ecx
    mov ebx, 10 ;Estamos agregando el valor 10 al registro ebx

convertirLoop: ;Etiqueta el ciclo de conversion
    mov edx, 0 ;Estamos agregando el valor 0 al registro edx
    div ebx ;Utilizamos la instruccion DIV para dividir el valor de edx:eax entre ebx

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

    mov BYTE PTR [esi], 0 ;Movemos el valor de 0 a la direccion de memoria de esi para indicar el final de la cadena

    ret ;Retorna al procedimiento que lo llamo

convertirDecimal ENDP ;Finalizamos el procedimiento convertirDecimal

END main ;Aqui finaliza el programa y el main es el punto de entrada

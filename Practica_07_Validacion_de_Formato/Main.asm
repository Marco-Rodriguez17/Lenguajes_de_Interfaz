
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Dr. Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 7: Validacion de formato
; Descripcion: Valida que una cadena cumpla con un formato especifico.
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
    cadena BYTE "Escribe una cadena (ejemplo TEC-123): ", 0 ;Aqui se declara la variable cadena que contiene el mensaje que se va a desplegar en pantalla
    msgValido BYTE "Cadena valida", 0 ;Aqui se declara la variable msgValido que contiene el mensaje que se va a desplegar en pantalla
    msgInvalido BYTE "Cadena invalida", 0 ;Aqui se declara la variable msgInvalido que contiene el mensaje que se va a desplegar en pantalla
    MAX = 20 ; MAX es una constante que sera el indicador del tamaño maximo de la cadena que se va a ingresar
    stringIn BYTE MAX+1 DUP(?) ;Aqui se declara la variable stringIn que va a almacenar la cadena ingresada por el usuario

.code ; Es el espacio donde se escriben las instrucciones del programa
main PROC ; Inicio del programa
    mov edx, OFFSET cadena ;Se mueve la direccion de memoria de la variable cadena a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    mov edx, OFFSET stringIn ;Se mueve la direccion de memoria de la variable stringIn a el registro edx
    mov ecx, MAX ;Estamos agregando el valor MAX al registro ecx
    call ReadString ;Utilizamos ReadString para leer la cadena ingresada

    cmp eax, 7 ;Comparamos el valor del registro eax con 7
    jne cadenaInvalida ;Salto condicional a la etiqueta "cadenaInvalida" si no son iguales

    mov esi, 0 ;Estamos agregando el valor 0 al registro esi
    mov ecx, 3 ;Estamos agregando el valor 3 al registro ecx

validarLetras: ; Inicio del ciclo para validar las letras
    mov al, stringIn[esi] ; Movemos el valor de la cadena ingresada a el registro al
    cmp al, 'A' ;Comparamos el valor del registro al con 'A'
    jl cadenaInvalida ;Salto condicional a la etiqueta "cadenaInvalida" si es menor

    cmp al, 'Z' ;Comparamos el valor del registro al con 'Z'
    jg cadenaInvalida ;Salto condicional a la etiqueta "cadenaInvalida" si es mayor

    inc esi ;Incrementamos el valor de esi en 1
    loop validarLetras ;Utilizamo loop para repetir el ciclo hasta que ecx llegue a 0

    mov al, stringIn[3]
    cmp al, '-' ;Comparamos el valor del registro al con '-'
    jne cadenaInvalida ;Salto condicional a la etiqueta "cadenaInvalida" si no son iguales

    mov esi, 4 ;Estamos agregando el valor 4 al registro esi
    mov ecx, 3 ;Estamos agregando el valor 3 al registro ecx

validarNumeros: ; Inicio del ciclo para validar los numeros
    mov al, stringIn[esi] ; Movemos el valor de la cadena ingresada a el registro al

    cmp al, '0' ;Comparamos el valor del registro al con '0'
    jb cadenaInvalida ;Salto condicional a la etiqueta "cadenaInvalida" si es menor

    cmp al, '9' ;Comparamos el valor del registro al con '9'
    ja cadenaInvalida ;Salto condicional a la etiqueta "cadenaInvalida" si es mayor

    inc esi ;Incrementamos el valor de esi en 1
    loop validarNumeros ;Utilizamo loop para repetir el ciclo hasta que ecx llegue a 0

    jmp cadenaValida ;Salto incondicional a la etiqueta "cadenaValida"

cadenaValida: ;Procedimiento que se ejecuta si la cadena ingresada es valida
    mov edx, OFFSET msgValido ;Se mueve la direccion de memoria de la variable msgValido a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    jmp fin ;Salto incondicional a la etiqueta "fin"

cadenaInvalida: ;Procedimiento que se ejecuta si la cadena ingresada es invalida
    mov edx, OFFSET msgInvalido ;Se mueve la direccion de memoria de la variable msgInvalido a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

fin: ;Aqui es la etiqueta a donde manda el jmp que termina el programa
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    exit ;Termina el programa
main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada

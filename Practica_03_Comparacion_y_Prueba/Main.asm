
; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 3: Comparacion y prueba
; Descripcion: Compara dos numeros para verificar si son iguales.
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
    msgIguales BYTE "Los numeros son iguales", 0 ;Aqui se declara la variable msgIguales que contiene el mensaje que se va a desplegar en pantalla
    msgDiferentes BYTE "Los numeros son diferentes", 0 ;Aqui se declara la variable msgDiferentes que contiene el mensaje que se va a desplegar en pantalla

.code ; Es el espacio donde se escriben las instrucciones del programa
main PROC ; Inicio del programa

    mov eax, 30 ;Estamos agregando el valor 30 al registro eax
    mov ebx, 30 ;Estamos agregando el valor 30 al registro ebx

    cmp eax, ebx ;Comparamos los valores de los registros eax y ebx

    je iguales ;Si los valores son iguales, se salta a la etiqueta "iguales"
    mov edx, OFFSET msgDiferentes ;Se mueve la direccion de memoria de la variable msgDiferentes al registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

    jmp fin ;Salto condicional a la etiqueta "fin" para terminar el programa

iguales: ; Esta es la etiqueta a donde manda el je que compara los valores de lso registros
    mov edx, OFFSET msgIguales ;Se mueve la direccion de memoria de la variable msgIguales al registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje

fin: ;Aqui es la etiqueta a donde manda el jmp que termina el programa
    exit ;Termina el programa

main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada


; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 11: Operaciones logicas
; Descripcion: Utiliza operaciones logicas para manipular bits.
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
alarmaEncencida BYTE "Alarma encendida",0 ;Aqui se declara la variable alarmaEncencida que contiene el mensaje que se va a desplegar en pantalla
alarmaApagada BYTE "Alarma apagada",0 ;Aqui se declara la variable alarmaApagada que contiene el mensaje que se va a desplegar en pantalla

; Estados de computadora:
; 0 - Computadora encendida
; 1 - Alarma encendida
; 2 - Computadora conectada a internet
; Estados: 0 = Apagado, 1 = Encendido

; Estado inicial: 0000 0101

.code ;Es el espacio donde se escriben las instrucciones del programa
main PROC ;Inicio del programa

    ; 1 - OPERACION AND: REVISAR SI LA ALARMA ESTA ENCENDIDA
    mov eax, 0 ;Estamos agregando el valor 0 al registro eax
    mov al, 00000101b ;Estamos agregando el valor 00000101b al registro al
    and al, 00000010b ;Con la instruccion AND se esta revisando si la alrma esta encendida, si el resultado es 0 entonces la alarma esta apagada, si el resultado es difernte de 0 entonces la alarma esta encendida

    call WriteBin ; Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro al en binario

    nop ;Instruccion de relleno

    ; 2 - OPERACION OR: ENCENDER LA ALARMA
    mov eax, 0 ;Estamos agregando el valor 0 al registro eax
    mov al, 00000101b ;Estamos agregando el valor 00000101b al registro al
    or al, 00000010b ;Con la instruccion OR se busca encender la alarma, el resultado tiene 1 si almenos uno de los bits es 1, si ambos son 0 entonces el resultado es 0 

    call WriteBin ; Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro eax en binario

    nop ;Instruccion de relleno

    ; 3 - OPERACION XOR: CAMBIAR EL ESTADO DE LA COMPUTADORA
    mov eax, 0 ;Estamos agregando el valor 0 al registro eax
    mov al, 00000101b ;Estamos agregando el valor 00000101b al registro al
    xor al, 00000001b ;Con la instruccion XOR se busca cambiar el estado de la computadora, si ambos bits son iguales el resultado es 0, si son diferentes el resultado es 1

    call WriteBin ; Aqui estamos llamando a la fucnion WriteBin para desplegar el valor del registro eax en binario
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

    nop ;Instruccion de relleno

    ; 4 - OPERACION TEST: REVISAR SI LA ALARMA ESTA ENCENDIDA
    mov eax, 0 ;Estamos agregando el valor 0 al registro eax
    mov al, 00000111b ;Estamos agregando el valor 00000111b al registro al

    test al, 00000010b ;Con la instruccion TEST se busca revisar si la alarma esta encendida,sin modificar al, si el resultado es 0 entonces la alarma esta apagada
    jz apagarAlarma ;Utilizamos un salto condicional para ir a la etiqueta apagarAlarma si el resultado de la operacion TEST es 0, realiza el salto

    mov edx, OFFSET alarmaEncencida ;Se mueve la direccion de memoria de la variable alarmaEncencida a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea
    jmp fin ;Salto incondicional a la etiqueta "fin"

apagarAlarma: ;incio del proceso para mostrar el mensajede apagar la alarma
    mov edx, OFFSET alarmaApagada ;Se mueve la direccion de memoria de la variable alarmaApagada a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    call Crlf ;LLamamos a la funcion Crlf para hacer un salto de linea

fin: ;Aqui es la etiqueta a donde manda el jmp que termina el programa
    exit ;Termina el programa
main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada


; =========================================================
; Instituto Tecnologico de Culiacan - TecNM
; Carrera: Ingenieria en Sistemas Computacionales
; Materia: Lenguajes de Interfaz
; Alumno: Marco Antonio Rodriguez Diaz
; Numero de control: 23170308
; Docente: Dr. Jose Luis Medina Jimenez
; Grupo / horario: 10:00 - 11:00 am
; Practica 15: Manipulacion de archivo
; Descripcion: Crea y cierra un archivo de texto
; =========================================================

INCLUDE Irvine32.inc ;Se incluye la libreria de Irvine32.inc para poder utilizar sus funciones

.data ;Es el espacio donde se declaran las variables y constantes que se van a utilizar en el programa
    nombreArchivo BYTE "Inventario.txt", 0 ;Aqui declaramos la variable nombreArchivo que contiene el nombre del archivo que se va a crear
    texto BYTE "125", 0 ;Aqui declaramos la variable texto que contiene el texto que se va a escribir en el archivo
    archivoHandle DWORD ? ;Estamos declarando una variable de tipo DWORD con capacidad de almacenar 4 bytes de informacion

    mensajeExito BYTE "Archivo guardado correctamente.", 0 ;Aqui se declara la variable mensajeExito que contiene el mensaje que se va a desplegar en pantalla
    mensajeError BYTE "No se pudo guardar el archivo.", 0 ;Aqui se declara la variable mensajeError que contiene el mensaje que se va a desplegar en pantalla

.code ;Es el espacio donde se escriben las instrucciones del programa
main PROC ;Inicio del programa
    ; 1. Crear archivo txt.
    mov edx, OFFSET nombreArchivo ;Se mueve la direccion de memoria de la variable nombreArchivo a el registro edx
    call CreateOutputFile ;Estamos utilizando la funcion CreateOutputFile para crear un archivo de salida con el nombre especificado en nombreArchivo y asi encontrar el identificador del archivo, el cual se almacena en el registro eax

    cmp eax, INVALID_HANDLE_VALUE ;Comparamos el valor del registro eax con INVALID_HANDLE_VALUE, sirve para saber si el archivo es valido, si no lo es, regresa el valor de INVALID_HANDLE_VALUE, que es -1, y si es valido regresa el valor del identificador del archivo
    je error ;Si los valores son iguales, se salta a la etiqueta "error"

    mov archivoHandle, eax ;Agregando el valor de eax a la variable archivoHandle

    ; 2. Escribir caracteres en archivo txt.
    mov eax, archivoHandle ;Moviendo el valor de archivoHandle al registro eax
    call CloseFile ;Utilizamos el procedimiento CloseFile para cerrar el archivo que se encuentra abierto

    test eax, eax ;Realizamos una operacion TEST entre el registro eax y eax para verificar si el archivo se cerro correctamente, si el resultado es 0, significa que hubo un error al cerrar el archivo
    jz error ;Utilizamos un salto condicional para ir a la etiqueta error si el resultado de la operacion TEST es 0, realiza el salto

    mov edx, OFFSET mensajeExito ;Se mueve la direccion de memoria de la variable mensajeExito a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
    jmp fin ;Salto incondicional a la etiqueta "fin"

errorEscritura: ;Etiqueta que se utiliza para manejar el error de escritura en el archivo
    mov eax, archivoHandle ;Moviendo el valor de archivoHandle al registro eax
    call CloseFile ;Utilizamos el procedimiento CloseFile para cerrar el archivo que se encuentra abierto
error: ;Etiqueta que se utiliza para manejar el error de creacion del archivo
    mov edx, OFFSET mensajeError ;Se mueve la direccion de memoria de la variable mensajeError a el registro edx
    call WriteString ;Utilizamos WriteString para desplegar el mensaje
fin: ;Aqui es la etiqueta a donde manda el jmp que termina el programa
    exit ;Termina el programa

main ENDP ;Termina el procedimiento main

END main ;Aqui finaliza el programa y el main es el punto de entrada
;Eh terminado #HALAMADRIDYNADAMAS 

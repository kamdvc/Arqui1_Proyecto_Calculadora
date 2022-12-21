  SYS_INIT_MODULE  equ 0x80
  SYS_EXIT         equ 0x01
  SYS_WRITE        equ 0x04
  
section .bss
  ; Spaces reserved to store the supplied values by the user.
    buf: resb 2
    a: resb 2
    b: resb 2
    resultado: resb 2
	    
section	.text
	global _start       ;must be declared for using gcc
		
_start:                     ;tell linker entry point
    
    mov	edx, len    ;message length
    mov	ecx, msg    ;message to write
    mov	ebx, 1	    ;file descriptor (stdout)
    mov	eax, 4	    ;system call number (sys_write)
    int 0x80        ;invoke kernel
    mov edx, 2      ; max length
    mov ecx, buf    ; buffer
    mov eax, 3      ; sys_read
    mov ebx, 0      ;error code
    int 0x80   ;call kernel
    ; We compare the value entered by the user to know that
    ; operation you want to perform.
    cmp byte [buf], "1" ; compare byte buf with 1
    je suma ;Conditional  jump equals option suma jump if equal to option 1
    cmp byte [buf], "2"; compare byte buf with 2
    je resta;Conditional  jump equals option resta jump if equal to option 2
    cmp byte [buf], "3"; compare byte buf with 3
    je multiplicacion;Conditional  jump equals option multiplicacion jump if equal to option 3
    cmp byte [buf], "4"; compare byte buf with 4
    je division;Conditional  jump equals option division jump if equal to option 4
    cmp byte [buf], "5"; compare byte buf with 5
    mov esi, 1 ; start esi at 
    mov ecx, 4 ; number of iterations
    je potencia;Conditional  jump equals option potencia jump if equal to option 5
    cmp byte [buf], "6"; compare byte buf with 6
    je exit	;Conditional  jump equals option exit jump if equal to option 6
    mov edx,len5;message length
    mov ecx, msg5;message to write
    mov eax, 4;system call number (sys_write)
    mov ebx, 1; stdout file descriptor
    int 0x80;invoke kernel
    jmp _start;Jump to the statement labeled _start
    mov	eax, 1	    ;system call number (sys_exit)
    int	0x80        ;call kernel

suma:
    ;call pedir_num  ;we call the function pedir_num 
    ;mov  [a], eax   ;we move the number in the eax register
    ;mov  [b], ebx   ;we move the number in
    mov eax, 10 ;we move the number in the eax register
    mov ebx, 6 ;we move the number in the ebx register
    add eax, ebx;performed the sum of the two values
    aam
    add eax, 3030h  ;we add 3030h to eax to convert to ascii
    mov ebp, esp;we save esp information in ebp
    sub esp, 2 ;subtract 2 bytes from the stack
    mov [esp], byte ah;we introduce the first value
    mov [esp+1], byte al;we introduce the second value
    mov ecx, esp; we move what is in esp to ecx
    ; con este codigo se mostraba el resultado pero al revés 
    ;call mostrar_resul;we call the function nostrar_resul
    mov edx, 2; longitud
    mov ebx, 1;error code
    mov eax, SYS_WRITE;system call number (sys_write)
    int SYS_INIT_MODULE;invoke kernel
    jmp _start ;Jump to the statement labeled _start
    int SYS_INIT_MODULE;invoke kernel
    mov esp, ebp;we return the ebp information in esp
    ret; return;we return the function

resta:
    ;call pedir_num ;we call the function pedir_num
    mov eax, 18 ;we move the number in the eax register
    mov ebx, 10 ;we move the number in the ebx register
    sub eax, ebx;we perform the subtraction of the two values
    aam
    add eax, 3030h ;we add 3030h to eax to convert to ascii
    mov ebp, esp;we save esp information in ebp
    sub esp, 2 ;subtract 2 bytes from the stack
    mov [esp], byte ah;we introduce the first value
    mov [esp+1], byte al;we introduce the second value
    mov ecx, esp;we move what is in esp to ecx
    ; con este codigo se mostraba el resultado pero al revés 
    ; call mostrar_resul ;we call the function nostrar_resul
    mov edx, 2; longitud
    mov ebx, 1;error code
    mov eax, SYS_WRITE;system call number (sys_write)
    int SYS_INIT_MODULE;invoke kernel
    jmp _start;Jump to the statement labeled _start
    int SYS_INIT_MODULE;invoke kernel
    mov esp, ebp;we return the ebp information in esp
    ret;we return the function
     
multiplicacion:
    ;call pedir_num ;we call the function pedir_num
    mov eax, 3   ;we move the number in the eax register
    mov ebx, 6  ;we move the number in the ebx register
    mul ebx ; We perform the multiplication of the two values
    aam
    add eax, 3030h ;we add 3030h to eax to convert to ascii
    mov ebp, esp;we save esp information in ebp
    sub esp, 2;subtract 2 bytes from the stack
    mov [esp], byte ah;we introduce the first value
    mov [esp+1], byte al;we introduce the second value
    mov ecx, esp;we move what is in esp to ecx
    ; con este codigo se mostraba el resultado pero al revés 
    ;call mostrar_resul ;we call the function nostrar_resul
    mov edx, 2; longitud
    mov ebx, 1;error code
    mov eax, 4;system call number (sys_write)
    int 0x80;invoke kernel
    jmp _start;Jump to the statement labeled _start
    int 0x80;invoke kernel
    mov esp, ebp;we return the ebp information in esp
    ret;;we return the function
	     
division:
    ;pero en la linea 147 a la 178 si lo logre con otro metodo
    ;call pedir_num ;we call the function pedir_num
    mov eax, 10   ;we move the number in the eax register
    mov ebx, 2
    mov edx, 0
    div ebx ;perform the division of the two values
    aam
    add eax, 3030h  ;we add 3030h to eax to convert to ascii
    mov ebp, esp;we save esp information in ebp
    sub esp, 2 ;subtract 2 bytes from the stack
    mov [esp], byte ah;we introduce the first value
    mov [esp+1], byte al;we introduce the second value
    mov ecx, esp;we move what is in esp to ecx
    ; con este codigo se mostraba el resultado pero al revés 
    ;call mostrar_resul ;we call the function nostrar_resul
    mov edx, 2; longitud
    mov ebx, 1;error code
    mov eax, 4;system call number (sys_write)
    int 0x80;invoke kernel
    jmp _start;Jump to the statement labeled _start
    int 0x80;invoke kernel
    mov esp, ebp;we return the ebp information in esp
    ret;we return the function

potencia:
    ; acá intente recibir los numeros pero no los pude utilizar en la función :(
    ;call pedir_num; ;we call the function pedir_num
    add esi, esi; esi += esi
    dec ecx; ecx -= 1
    cmp ecx, 0; compare ecx with 0
    jg potencia; jump to potencia if greater
    mov eax, 1; sys_exit system call
    mul esi;multiply esi 
    aam
    add eax, 3030h ;we add 3030h to eax to convert to ascii
    mov ebp, esp;we save esp information in ebp
    sub esp, 2 ;subtract 2 bytes from the stack
    mov [esp], byte ah;we introduce the first value
    mov [esp+1], byte al;we introduce the second value
    mov ecx, esp; we move what is in esp to ecx
    ; con este codigo se mostraba el resultado pero al revés 
    ;call mostrar_resul;
    mov eax, SYS_WRITE ;system call number (sys_write)
    mov edx, 2; longitud
    mov ebx, 1; mensaje error
    int SYS_INIT_MODULE;invoke kernel
    mov esp, ebp;we return the ebp information in esp
    jmp _start;Jump to the statement labeled _start
      
pedir_num:        
    ;acá intente recibir los numeros pero no los pude utilizar en la función :(
    mov edx, len1 ;message length
    mov ecx, msg1 ;message to write
    mov eax, 4 ;system call number (sys_write)
    mov ebx, 1 ;file descriptor (stdout)
    int 0x80 ;invoke kernel
    mov edx, 2 ; max length
    mov ecx, a ; bytes to write
    mov ebx, 0 ;error code
    mov eax, 3; sys_read
    int 0x80;invoke kernel
    mov edx, len2;message length
    mov ecx, msg2;message to write
    mov eax, 4;system call number (sys_write)
    mov ebx, 1;error code
    int 0x80;invoke kernel
    mov edx, 2; longitud
    mov ecx, b; bytes to write
    mov ebx, 0 ;error code
    mov eax, 3; sys_read
    int 0x80;invoke kernel
    mov eax, 1; sys_exit system call

mostrar_resul:   ; con este codigo se mostraba el resultado pero al revés 
    mov [resultado], eax; We move the result to eax
    mov edx, len3 ;message length
    mov ecx, msg3 ;message to write
    mov eax, SYS_WRITE;system call number (sys_write)
	mov ebx, 1;error code
	int  SYS_INIT_MODULE;invoke kernel
	mov eax, SYS_WRITE;system call number (sys_write)
	mov ebx, 1;error code
	mov ecx, resultado; bytes to write
	mov edx, 1; longitud
	int SYS_INIT_MODULE;invoke kernel
	mov eax, 1;error code
	jmp _start ;Jump to the statement labeled _start
	 
exit:
    mov edx,len4;message length
    mov ecx, msg4;message to write
    mov eax, 4;system call number (sys_write)
    mov ebx, 1; stdout file descriptor
    int 0x80;invoke kernel
    mov eax, 1; sys_ex it system call
    mov ebx, 0;error code
    int 0x80;invoke kernel

section	.data

msg	db 10,13,	'Bienvenido a la calculadora!',0xa	;our dear string
	db	'Creado por Emanuel García',0xa	;our dear string
	db	'Que deseas realizar',0xa	;our dear string
    db	'1-SUMAR',0xa	;our dear string
    db	'2-RESTAR',0xa	;our dear string0
    db	'3-MULTIPLICAR',0xa	;our dear string
    db	'4-DIVIDIR',0xa	;our dear string
    db	'5-POTENCIA',0xa	;our dear string
    db	'6-SALIR',0xa	;our dear string
len	equ	$ - msg			;length of our dear string
msg1  db	'Ingrese el primer numero',0xa	;our dear string
len1	equ	$ - msg1			;length of our dear string
msg2  db	'Ingrese el segundo numero',0xa	;our dear string
len2	equ	$ - msg2			;length of our dear string
msg3  db	'Resultado: ',0xa	;our dear string
len3	equ	$ - msg3			;length of our dear string
msg4  db	10	;our dear string
len4	equ	$ - msg4			;length of our dear string
msg5  db	'Opción no valida',0xa	;our dear string
len5	equ	$ - msg5			;length of our dear string

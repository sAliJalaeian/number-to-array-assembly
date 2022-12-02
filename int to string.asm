        .model small
        .stack  64
        .data
        
array   db "2410$"
result  db "result:$"
input   dd 3459
number  dw 10

        .code
main    proc far
        mov ax, @data
        mov ds, ax
        
        lea si, array
        inc si
        inc si
        inc si
        
        mov cx, 4
        mov dx, input+2
        mov ax, input
        
        
l1:     div number
        mov bx, dx
        add bx, 48
        mov [si], bl
        dec si
        cwd
        loop l1
        
        lea dx, result
        mov ah, 09h
        int 21h        
        
        lea dx, array
        mov ah, 09h
        int 21h
        
        mov ax, 4c00h
        int 21h
        
        end main                              
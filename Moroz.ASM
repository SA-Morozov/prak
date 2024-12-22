org 7C00h

jmp start

fio: db 'Morozov Semen Andreevich', 0
group: db 'NMT-323901', 0

start:

mov ah, 00h
mov al, 13h        
int 10h

; Вывод fio
mov si, fio
mov dl, 7
mov dh, 1
loop1:
mov bh, 0
mov ah, 02h
int 10h
mov al, [cs:si]
cmp al, 0
je next1
mov bl, 01h
mov bh, 0
mov ah, 0Eh
int 10h
inc dl
inc si
jmp loop1
next1:

; Вывод group
mov si, group
mov dl, 15
mov dh, 2
loop2:
mov bh, 0
mov ah, 02h
int 10h
mov al, [cs:si]
cmp al, 0
je next2
mov bl, 01h
mov bh, 0
mov ah, 0Eh
int 10h
inc dl
inc si
jmp loop2
next2:


mov ah, 0Ch        
mov al, 04         


mov cx, 160        
mov dx, 160        
mov si, 0          
triangle_left:
    int 10h       
    dec cx         
    inc dx         
    inc si
    cmp si, 25     
    jl triangle_left

mov cx, 160        
mov dx, 160       
mov si, 0          
triangle_right:
    int 10h        
    inc cx         
    inc dx         
    inc si
    cmp si, 25     
    jl triangle_right

mov cx, 135       
mov dx, 185       
mov si, 0          
triangle_base:
    int 10h        
    inc cx         
    inc si
    cmp si, 50     
    jl triangle_base


jmp $


times 510-($-$$) db 0
dw 0AA55h        

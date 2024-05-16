; multi-segment executable file template.

data segment
    klasoradi db 'C:\yeniklasor',0                     
    dosyaadi db 'C:\yeniklasor\dosyam.txt',0  
    dizi1 db 2,11,9,6
    dizi2 db 2 dup (?)
    filehandle dw ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

            
    ;klasor olusturma
    LEA DX,klasoradi
    MOV AH,39h
    int 21h      
    
    ;dosya olusturma
    LEA DX, dosyaadi
    MOV CX,0
    MOV AH,3Ch
    int 21h 
    mov [filehandle],ax  
    
    lea si,dizi1 
    mov di,0
    mov cx,4
    
    dongu:
    mov ah,0
    mov al,[si]    
    mov dl, 2  
    div dl 
    cmp ah,0 
    jz ata
    devam:
    inc si
    loop dongu
    
    ;dizi2 yi dosyaya yazma      
    mov bx,[filehandle]
    mov dx,offset dizi2
    mov cx,2
    mov ah,40h
    int 21h
    
    ;dosya kapatma
    MOV AH,3Eh
    MOV BX,[fileHandle]
    int 21h    
          
    jmp bitir
    
    ata:
    mov bl,[si] 
    add bl,48
    mov dizi2+di,bl
    inc di
    jmp devam: 
    
    
    
    
    
    bitir:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends


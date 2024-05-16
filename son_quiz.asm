; multi-segment executable file template.

data segment 
    fileHandle1 dw ? ; dosya taniticisi 
    fileHandle2 dw ? ; dosya taniticisi
    dosyaadi1 db 'C:\tek.txt',0 
    dosyaadi2 db 'C:\cift.txt',0 
    data1 db 'yazi'
    sonraki dw 0 
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
            
    ;dosya olusturma
    LEA DX, dosyaadi1
    MOV CX,0
    MOV AH,3Ch
    int 21h 
    MOV [fileHandle1],AX    
    
    ;dosya olusturma
    LEA DX, dosyaadi2
    MOV CX,0
    MOV AH,3Ch
    int 21h 
    MOV [fileHandle2],AX 
      
    mov cx, offset sonraki - offset data1
    mov si,offset data1
            
    dongu:
    push cx
    mov ax,[sonraki]
    mov dl, 2  
    div dl 
    cmp ah,0 
    jnz tek
    jz cift
    devam:                                    
    inc si
    inc sonraki
    pop cx
    loop dongu
    
    jmp bitir
  
    tek: ;1. ve 3. indis olan a ve i'yi tek.txt'ye gonderdik 
    ;dosya yazma
    mov bx , [fileHandle1]
    mov dx, si
    MOV CX,1 
    MOV AH,40h
    int 21h
    jmp devam
    
    cift:  ;0. ve 2. indis olan y ve z'yi cift.txt'ye gonderdik
    ;dosya yazma
    mov bx , [fileHandle2]
    mov dx,si
    MOV CX,1 
    MOV AH,40h
    int 21h    
    jmp devam
        
    bitir:
    ;dosya kapatma
    MOV AH,3Eh
    MOV BX,[fileHandle1]
    int 21h   
    MOV AH,3Eh
    MOV BX,[fileHandle2]
    int 21h
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

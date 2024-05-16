; multi-segment executable file template.

data segment
    klasoradi db 'C:\klasor2',0 
     
    dosyaadi db 'C:\klasor2\dosyam.txt',0 
    
    fileHandle dw ? 
ends

stack segment
    dw   128  dup(0)
ends

extra segment
    yeniadi db 'C:\klasor2\dosyam2.txt',0
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax 
    
    mov ax, extra
    mov es, ax  
    
    
    
    ; klasor olusturma
    LEA DX, klasoradi
    MOV AH,39h
    int 21h
    

     
    ;dosya olusturma
    LEA DX, dosyaadi
    MOV CX,0
    MOV AH,3Ch
    int 21h 
    MOV [fileHandle],AX
    
    ; dosya kapatma
    MOV AH,3Eh
    MOV BX,[fileHandle]
    int 21h
             
             
    mov ah,56h
    lea dx,dosyaadi
    lea di,es:yeniadi 
    int 21h
    
    
             
ends

end start ; set entry point and stop the assembler.

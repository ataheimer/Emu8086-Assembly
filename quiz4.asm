
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
  
  
;Ata Emir Uncu 210201065
;Mehmet Huseyin Alptekin 200201007
;Aynur Dinc 210201068
;Feride Irem Yuksel 210201060
;Dilara Ulas 210201088
;Emirhan Guney 210201094    
  
  
  
  
org 100h


mov cx,6
mov bh,0
mov bl,3 
mov bp,0
mov si,0
mov di,0


dongu:
cmp [sayilar+bp],bh
jl ngtf
jg pztf         
loop dongu


ngtf:
mov ah,255
mov al,[sayilar+bp]
inc bp
idiv bl
mov [bolum+si],al
inc si
cmp ah,bh
jz tambol
dec cx
jcxz bitir
jmp dongu


pztf:
mov ah,0
mov al,[sayilar+bp]
inc bp 
idiv bl
mov [bolum+si],al
inc si
cmp ah,bh
jz tambol
dec cx
jcxz bitir
jmp dongu


tambol: 
mov dl,[sayilar+bp-1]
mov [tambolunen+di],dl
inc di
dec cx
jcxz bitir
jmp dongu

bitir:
ret


sayilar db -20,13,-9,80,-13,33

tambolunen db 6 dup (?)

bolum db 6 dup (?)


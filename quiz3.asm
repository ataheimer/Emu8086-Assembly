
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
 
 
 

 
;Aynur Dinc 210201068
;Feride Irem Yuksel 210201060
;Mehmet Huseyin Alptekin 200201007
;Dilara Ulas 210201088
;Ata Emir Uncu 210201065
;Emirhan Guney 210201094




org 100h


mov cx,6
mov si,0
mov ah,0
mov di,0
mov bp,0



dongu:    


mov al,[sayilar+si]
cmp al,ah
jl ngtf
jmp pztf

loop dongu


ngtf:
mov [negatif+di],al
dec cx 
jcxz bitir
inc di 
inc si
jmp dongu



pztf:
mov [pozitif+bp],al
dec cx    
jcxz bitir       
inc bp 
inc si
jmp dongu


bitir:
ret



sayilar db -12,5,-6,9,-13,8

negatif db 3 dup (?)

pozitif db 3 dup (?)
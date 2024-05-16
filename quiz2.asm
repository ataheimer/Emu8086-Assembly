
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;Feride Irem Yuksel 210201060
;Emirhan Guney 210201094
;Ata Emir Uncu 210201065
;Aynur Dinc 210201068
;Dilara Ulas 210201088
;Mehmet Huseyin Alptekin 200201007

mov cx, 4
mov si, 0 
mov bl, 5

dongu: 
mov al, [sayilar+si]
cbw
idiv bl
mov [sayilar2+si],al
inc si
loop dongu 

mov cx, 4
mov di, 0

don:
mov ax, 0
mov al, [indisler+di]
mov si, ax
mov ah, [sayilar2+si]
mov [hedef+di], ah 
inc di
loop don

ret

sayilar db -20,-70,15,-55
sayilar2 db 4 dup (?)
indisler db 2,0,3,1
hedef db 0,0,0,0




; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

;grup 16
;210201065 Ata Emir Uncu
;210201060 Feride Irem Yuksel
;210201068 Aynur Dinc
;210201088 Dilara Ulas
;210201094 Emirhan Guney
;200201007 Mehmet Huseyin Alptekin 


;Adreslerini degil degerlerini word tipine genisleterek alabildik.

org 100h

mov cx,4
lea si,sayilar1
lea di,adres

dongu: 
mov [di],si
inc si
add di,2 

loop dongu 

ret

sayilar1 db -55,15,-70,-50
adres dw 4 dup(?)


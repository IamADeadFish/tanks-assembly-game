include MovePlayer.inc
include akwah.inc
include Macros.inc
include Bullet.inc
.model small
.stack 64

.data
player1 label byte
player1x db 21
player1y db 0
player1Ori db 16
player2 label byte
player2x db 76
player2y db 22
player2Ori db 17


pnum db  ?          ;Player number = pnum (0 or 1)
generalPlayer label byte
posx  db  ?        ;Positon x of general player
posy db  ?        ;Positon y of general player
ori  db  ?          ;Orintation of player: Right = 16, Left = 17, Up = 30, Down = 31

conf  db 16,17,30,31
chngx db 01,-1,00,00
chngy db 00,00,-1,01

blt1 db 3 dup(0ffh, ?, ?)
blt2 db 3 dup(0FFh, ?, ?)
uppermap db '                 넬께                                                           '
         db '                 넴께                께     께께께께            께께께께 �  께  '
         db '                 남께          께�         께께께께께   께께께  께께께께 �    께'
         db '                 남께   께께  께 �        께께께께께께  께께께  께       �      '
         db '                 �     �         께      께께께께께께께 께께께    께�    �   께 '
         db '                 �   께   께� 께 께     께께께께께께께� 께께께    께�    �      '
         db '                 �        께� 께 께     께께께께께께께� 께께께       께� �  께  '
         db '                 � 께께   께�    �   께 께께께께께께께�              �          '
         db '                 �   �           �      께�  께께  께께         께께께     께   '
         db '                 �  �      께께께   께  께   께께   께�            께께    께   '
         db '                 남�   께께             �    께께    께            께께  께     '
         db '컴컴컴컴컴컴컴컴캐께께께께  �   께      께께께께께께께� 께께께      께�  께     '
lowermap db '                 남�  께�       �   �   께께께께께께께�         께께께께 �      '
         db '                 � �     께께께           께께께께께�           께께께께께  께  '
         db '                 � 께    께께께�          � 께께께 께        께께          께   '
         db '                 � 께    께께께께    께   께께께께께�       께     께   께      '
         db '                 �  �            께    께 께께께께께�      께께        께       '
         db '                 �   께       �   께      � � � � � �      께   께    께        '
         db '                 �    께�  �   �    께    � � � � � �     께    께   께         '
         db '                 �    �  께 �  께    께께  � � � � �    께   께    께           '
         db '                 �   �          �      께              께    께              께�'
         db '                 � 께   � � 께 �         께께께께께께께                      께�'
         db '                 �                                                           께�'
         db '                 남께께께께께께께께께께께께께께께께께께께께께께께께께께께께� 께�', '$'
temp db 0
lives1 db 3 
lives2 db 3


.code
main proc far
; set segment registers:
    mov ax, @data
    mov ds, ax
    mov al, 3
    mov ah, 0
    int 10h
    mov ch, 32
    mov ah, 1
    int 10h
    loadmap
    mov pnum, 1
    mov si, offset player1
    mov bx, offset generalPlayer
    draw
    mov pnum, 2
    mov si, offset player2
    mov bx, offset generalPlayer
    draw
    ; add your code here
    mov bp, 10000
    game:
    mainGameLoop
    jmp game


    mov ax, 4c00h ; exit to operating system.
    int 21h
main endp

end main ; set entry point and stop the assembler.

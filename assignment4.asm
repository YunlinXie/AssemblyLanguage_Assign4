TITLE Assignment 4: Calculate sum of money and evaluate flag values
		
; Don't forget this beginning documentation block
; Name: Yunlin Xie

; Part 1 (10 pts): Calculate sum of  money

INCLUDE Irvine32.inc

.data
;string prompts
TEN_DOLLAR BYTE "Enter number of ten dollar bills: ", 0
FIVE_DOLLAR BYTE "Enter number of five dollar bills: ", 0
ONE_DOLLAR BYTE "Enter number of one dollar bills: ", 0
QUARTER BYTE "Enter number of quarters: ", 0
DIME BYTE "Enter number of dimes: ", 0
NICKEL BYTE "Enter number of nickels: ", 0
PENNY BYTE "Enter number of pennies: ", 0
result BYTE "The total is ", 0
DOLLARS BYTE " dollars and ", 0
CENTS BYTE " cents"
; assume the user will enter a range between -10 and 10, inclusive


.code
main PROC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;get number of ten-dollar bills and add to total
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov edx, OFFSET TEN_DOLLAR
call writeString
call readInt
imul ax, 1000
mov bx, ax



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;get number of five-dollar bills and add to total
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov edx, OFFSET FIVE_DOLLAR
call writeString
call readInt
imul ax, 500
add bx, ax



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;get number of ten-dollar bills and add to total
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov edx, OFFSET ONE_DOLLAR
call writeString
call readInt
imul ax, 100
add bx, ax



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;get number of quarters and add to total
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov edx, OFFSET QUARTER
call writeString
call readInt
imul ax, 25
add bx, ax



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;get number of dimes and add to total
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov edx, OFFSET DIME
call writeString
call readInt
imul ax, 10
add bx, ax



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;get number of dimes and add to total
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov edx, OFFSET NICKEL
call writeString
call readInt
imul ax, 5
add bx, ax



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;get number of pennies and add to total
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov edx, OFFSET PENNY
call writeString
call readInt
add bx, ax



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;calculate total dollars and cents
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov ax, bx
cwd
mov cx, 100
idiv cx

mov bx, ax
mov cx, dx

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;print results
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov edx, OFFSET result
call writeString

MOVSX eax, bx
call writeInt


mov edx, OFFSET DOLLARS
call writeString

MOVSX eax, cx
call writeInt

mov edx, OFFSET CENTS
call writeString
call crlf

	exit
main ENDP

END main

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

COMMENT !
Part 2 (6pts): Flag evaluation
Assume ZF, SF, CF, OF are all clear at the start, and the 3 instructions below run one after another. 
a. fill in the value of all 4 flags after each instruction runs 
b. explain why CF and OF flags have that value 
   Your explanation should not refer to specific data values, such as -80 or 120,
   or to signed or unsigned data, such as "the sum of 2 large positive values will set the carry flag".
   The ALU doesn't differentiate signed vs. unsigned and yet it can set the flags.

.code
main PROC
mov al, 60h 

add al, 40h       
call dumpRegs
; a. ZF = 0  SF = 1  CF = 0  OF = 1
; b. explanation for CF: 
;		60h + 40h = 0110 0000 + 0100 0000 = 1010 0000
;       there is no carry out from the MSB 
;    explanation for OF:
;       there is no carry out of MSB but there is carry in to MSB
;       0 xor 1 = 1

sub al, C2h     
call dumpRegs
; a. ZF = 0  SF = 1  CF = 1  OF = 0
; b. explanation for CF:
;       C2h = 1100 0010b
;       1010 0000 - 1100 0010 = 1010 0000 + 0011 1110 = 1101 1110
;       there is no carry out and this is a subtraction 
;    explanation for OF:
;       there is no carry out and there is no carry in

exit

main ENDP

END main
!
	device pic16f627
	include "pic16f627.h"
	config	CP=off,WDT=off,PWRT=off,OSC=hs

porta	equ	PORTA
portb	equ	PORTB
trisa	equ	TRISA
trisb	equ	TRISB
status	equ	STATUS
pcl	equ	PCL
option_reg	equ	OPTIO
pull_up	equ	7

carry   equ     0			; Carry bit in status register
same    equ     1			; 
zero	equ	2
bank	equ	5

file	equ	1
w	equ	0

ctr1	equ	20	
ctr2	equ	21
ctr3	equ	22

	org	0
	goto	main

;*********************************************************************
delay5us	macro
	nop
	nop
	nop
	nop
	nop
	endm
	
delay1r	movlw	d'199'	; this routine, together with the call, uses 1 ms
	movwf	ctr1
loop1	nop
	nop
	decfsz	ctr1,file
	goto	loop1
	return

delay1	macro
	call	delay1r
	endm


delay5 macro
	call delay1r
	call delay1r
	call delay1r
	call delay1r
	call delay1r
	endm

delay4 macro
	call delay1r
	call delay1r
	call delay1r
	call delay1r
	endm

delay250r
	movlw	d'250'
	movwf	ctr2
loop250	call	delay1r
	decfsz	ctr2,file
	goto	loop250
	return

delay250 macro
	call delay250r
	endm

delay1sr
	movlw	d'4'
	movwf	ctr3
loop1s	call	delay250r
	decfsz	ctr3,file
	goto	loop1s
	return
	
delay1s	macro
	call	delay1sr
	endm

delay50r
	movlw	d'50'
	movwf	ctr2
loop50	call	delay1r
	decfsz	ctr2,file
	goto	loop50
	return

delay50	macro
	call	delay50r
	endm

main
	clrf	portb
	bsf	status,bank
	movlw	0xff
	movwf	trisa
	movwf	trisb
	bcf	trisb,0
	bcf	status,bank


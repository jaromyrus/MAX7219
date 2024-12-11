;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.4.4 #14992 (MINGW64)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _setup
	.globl _max7219_init
	.globl _max7219_send
	.globl _milis
	.globl _init_milis
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _CLK_HSIPrescalerConfig
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int _TRAP_IRQHandler ; trap
	int _TLI_IRQHandler ; int0
	int _AWU_IRQHandler ; int1
	int _CLK_IRQHandler ; int2
	int _EXTI_PORTA_IRQHandler ; int3
	int _EXTI_PORTB_IRQHandler ; int4
	int _EXTI_PORTC_IRQHandler ; int5
	int _EXTI_PORTD_IRQHandler ; int6
	int _EXTI_PORTE_IRQHandler ; int7
	int _CAN_RX_IRQHandler ; int8
	int _CAN_TX_IRQHandler ; int9
	int _SPI_IRQHandler ; int10
	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
	int _TIM1_CAP_COM_IRQHandler ; int12
	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
	int _TIM2_CAP_COM_IRQHandler ; int14
	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
	int _TIM3_CAP_COM_IRQHandler ; int16
	int _UART1_TX_IRQHandler ; int17
	int _UART1_RX_IRQHandler ; int18
	int _I2C_IRQHandler ; int19
	int _UART3_TX_IRQHandler ; int20
	int _UART3_RX_IRQHandler ; int21
	int _ADC2_IRQHandler ; int22
	int _TIM4_UPD_OVF_IRQHandler ; int23
	int _EEPROM_EEC_IRQHandler ; int24
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	call	___sdcc_external_startup
	tnz	a
	jreq	__sdcc_init_data
	jp	__sdcc_program_startup
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	./src/main.c: 27: void max7219_send(uint8_t address, uint8_t data)
; genLabel
;	-----------------------------------------
;	 function max7219_send
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 2 bytes.
_max7219_send:
	pushw	x
; genReceive
	ld	(0x01, sp), a
;	./src/main.c: 30: CS_LOW;       
; genSend
	ld	a, #0x20
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_WriteLow
;	./src/main.c: 33: mask = 0b10000000; 
; genAssign
	ld	a, #0x80
	ld	(0x02, sp), a
;	./src/main.c: 34: CLK_LOW;          
; genSend
	ld	a, #0x40
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_WriteLow
;	./src/main.c: 35: while (mask)
; genLabel
00104$:
; genIfx
	tnz	(0x02, sp)
	jrne	00157$
	jp	00106$
00157$:
;	./src/main.c: 37: if (mask & address)
; genAnd
	ld	a, (0x02, sp)
	and	a, (0x01, sp)
; genIfx
	tnz	a
	jrne	00158$
	jp	00102$
00158$:
;	./src/main.c: 39: DATA_HIGH;
; genSend
	ld	a, #0x10
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_WriteHigh
; genGoto
	jp	00103$
; genLabel
00102$:
;	./src/main.c: 43: DATA_LOW; 
; genSend
	ld	a, #0x10
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_WriteLow
; genLabel
00103$:
;	./src/main.c: 45: CLK_HIGH;         
; genSend
	ld	a, #0x40
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_WriteHigh
;	./src/main.c: 46: mask = mask >> 1; 
; genRightShiftLiteral
	srl	(0x02, sp)
;	./src/main.c: 47: CLK_LOW;          
; genSend
	ld	a, #0x40
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_WriteLow
; genGoto
	jp	00104$
; genLabel
00106$:
;	./src/main.c: 51: mask = 0b10000000;
; genAssign
	ld	a, #0x80
	ld	(0x02, sp), a
;	./src/main.c: 52: while (mask)
; genLabel
00110$:
; genIfx
	tnz	(0x02, sp)
	jrne	00159$
	jp	00112$
00159$:
;	./src/main.c: 54: if (mask & data)
; genAnd
	ld	a, (0x02, sp)
	and	a, (0x05, sp)
; genIfx
	tnz	a
	jrne	00160$
	jp	00108$
00160$:
;	./src/main.c: 56: DATA_HIGH; 
; genSend
	ld	a, #0x10
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_WriteHigh
; genGoto
	jp	00109$
; genLabel
00108$:
;	./src/main.c: 60: DATA_LOW;
; genSend
	ld	a, #0x10
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_WriteLow
; genLabel
00109$:
;	./src/main.c: 62: CLK_HIGH;         
; genSend
	ld	a, #0x40
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_WriteHigh
;	./src/main.c: 63: mask = mask >> 1;
; genRightShiftLiteral
	srl	(0x02, sp)
;	./src/main.c: 64: CLK_LOW;          
; genSend
	ld	a, #0x40
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_WriteLow
; genGoto
	jp	00110$
; genLabel
00112$:
;	./src/main.c: 67: CS_HIGH; 
; genSend
	ld	a, #0x20
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_WriteHigh
; genLabel
00113$:
;	./src/main.c: 68: }
; genEndFunction
	popw	x
	popw	x
	pop	a
	jp	(x)
;	Total max7219_send function size at codegen: 153 bytes.
;	./src/main.c: 70: void max7219_init(void)
; genLabel
;	-----------------------------------------
;	 function max7219_init
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_max7219_init:
;	./src/main.c: 72: GPIO_Init(CS_GPIO, CS_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
; genSend
	ld	a, #0x20
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_Init
;	./src/main.c: 73: GPIO_Init(CLK_GPIO, CLK_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
; genSend
	ld	a, #0x40
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_Init
;	./src/main.c: 74: GPIO_Init(DATA_GPIO, DATA_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
; genSend
	ld	a, #0x10
; genSend
	ldw	x, #0x501e
; genCall
	call	_GPIO_Init
;	./src/main.c: 77: max7219_send(DECODE_MODE, DECODE_ALL);        // Nějakej dekodér
; genIPush
	push	#0xff
; genSend
	ld	a, #0x09
; genCall
	call	_max7219_send
;	./src/main.c: 78: max7219_send(SCAN_LIMIT, 4);                  // Kolik cifer zapneme
; genIPush
	push	#0x04
; genSend
	ld	a, #0x0b
; genCall
	call	_max7219_send
;	./src/main.c: 79: max7219_send(INTENSITY, 1);                   // Jas
; genIPush
	push	#0x01
; genSend
	ld	a, #0x0a
; genCall
	call	_max7219_send
;	./src/main.c: 80: max7219_send(DISPLAY_TEST, DISPLAY_TEST_OFF); // test displeje
; genIPush
	push	#0x00
; genSend
	ld	a, #0x0f
; genCall
	call	_max7219_send
;	./src/main.c: 81: max7219_send(SHUTDOWN, SHUTDOWN_ON);           // On/OFF
; genIPush
	push	#0x01
; genSend
	ld	a, #0x0c
; genCall
	call	_max7219_send
; genLabel
00101$:
;	./src/main.c: 83: }
; genEndFunction
	ret
;	Total max7219_init function size at codegen: 66 bytes.
;	./src/main.c: 85: void setup(void)
; genLabel
;	-----------------------------------------
;	 function setup
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_setup:
;	./src/main.c: 87: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // taktovat MCU na 16MHz
; genSend
	clr	a
; genCall
	call	_CLK_HSIPrescalerConfig
;	./src/main.c: 89: init_milis();
; genCall
	call	_init_milis
;	./src/main.c: 92: max7219_init();
; genCall
	jp	_max7219_init
; genLabel
00101$:
;	./src/main.c: 93: }
; genEndFunction
	ret
;	Total setup function size at codegen: 11 bytes.
;	./src/main.c: 95: int main(void)
; genLabel
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 17 bytes.
_main:
	sub	sp, #17
;	./src/main.c: 98: setup();
; genCall
	call	_setup
;	./src/main.c: 100: max7219_send(DIGIT0, 0);
; genIPush
	push	#0x00
; genSend
	ld	a, #0x01
; genCall
	call	_max7219_send
;	./src/main.c: 101: max7219_send(DIGIT1, 0);
; genIPush
	push	#0x00
; genSend
	ld	a, #0x02
; genCall
	call	_max7219_send
;	./src/main.c: 102: max7219_send(DIGIT2, 0);
; genIPush
	push	#0x00
; genSend
	ld	a, #0x03
; genCall
	call	_max7219_send
;	./src/main.c: 103: max7219_send(DIGIT3, 0);
; genIPush
	push	#0x00
; genSend
	ld	a, #0x04
; genCall
	call	_max7219_send
;	./src/main.c: 104: max7219_send(DIGIT4, 0);
; genIPush
	push	#0x00
; genSend
	ld	a, #0x05
; genCall
	call	_max7219_send
;	./src/main.c: 105: max7219_send(DIGIT5, 0);
; genIPush
	push	#0x00
; genSend
	ld	a, #0x06
; genCall
	call	_max7219_send
;	./src/main.c: 106: max7219_send(DIGIT6, 0);
; genIPush
	push	#0x00
; genSend
	ld	a, #0x07
; genCall
	call	_max7219_send
;	./src/main.c: 107: max7219_send(DIGIT7, 0);
; genIPush
	push	#0x00
; genSend
	ld	a, #0x08
; genCall
	call	_max7219_send
;	./src/main.c: 109: uint32_t time = 0;
; genAssign
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
;	./src/main.c: 110: uint8_t number = 0;
; genAssign
	clr	(0x0d, sp)
;	./src/main.c: 111: uint8_t desitky = 0;
; genAssign
	clr	(0x0e, sp)
;	./src/main.c: 112: uint8_t stovky = 0;
; genAssign
	clr	(0x0f, sp)
;	./src/main.c: 113: uint8_t tisice = 0;
; genAssign
	clr	(0x10, sp)
;	./src/main.c: 114: uint8_t statisice = 0;
; genAssign
	clr	(0x11, sp)
;	./src/main.c: 117: while (1)
; genLabel
00114$:
;	./src/main.c: 119: if ((milis() - time) > 1000)
; genCall
	call	_milis
	ldw	(0x07, sp), x
	ldw	(0x05, sp), y
; genMinus
	ldw	x, (0x07, sp)
	subw	x, (0x03, sp)
	ldw	(0x0b, sp), x
	ld	a, (0x06, sp)
	sbc	a, (0x02, sp)
	ld	(0x0a, sp), a
	ld	a, (0x05, sp)
	sbc	a, (0x01, sp)
	ld	(0x09, sp), a
; genCmp
; genCmpTnz
	ldw	x, #0x03e8
	cpw	x, (0x0b, sp)
	clr	a
	sbc	a, (0x0a, sp)
	clr	a
	sbc	a, (0x09, sp)
	jrc	00167$
	jp	00114$
00167$:
; skipping generated iCode
;	./src/main.c: 121: time = milis();
; genCall
	call	_milis
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	./src/main.c: 122: max7219_send(DIGIT0, number);
; genIPush
	ld	a, (0x0d, sp)
	push	a
; genSend
	ld	a, #0x01
; genCall
	call	_max7219_send
;	./src/main.c: 123: max7219_send(DIGIT1, desitky);
; genIPush
	ld	a, (0x0e, sp)
	push	a
; genSend
	ld	a, #0x02
; genCall
	call	_max7219_send
;	./src/main.c: 124: max7219_send(DIGIT2, stovky);
; genIPush
	ld	a, (0x0f, sp)
	push	a
; genSend
	ld	a, #0x03
; genCall
	call	_max7219_send
;	./src/main.c: 125: max7219_send(DIGIT3, tisice);
; genIPush
	ld	a, (0x10, sp)
	push	a
; genSend
	ld	a, #0x04
; genCall
	call	_max7219_send
;	./src/main.c: 126: max7219_send(DIGIT4, statisice);
; genIPush
	ld	a, (0x11, sp)
	push	a
; genSend
	ld	a, #0x05
; genCall
	call	_max7219_send
;	./src/main.c: 127: number++;
; genPlus
	inc	(0x0d, sp)
;	./src/main.c: 128: if (number>9){
; genCmp
; genCmpTnz
	ld	a, (0x0d, sp)
	cp	a, #0x09
	jrugt	00168$
	jp	00102$
00168$:
; skipping generated iCode
;	./src/main.c: 129: number=0;
; genAssign
	clr	(0x0d, sp)
;	./src/main.c: 130: desitky++;
; genPlus
	inc	(0x0e, sp)
; genLabel
00102$:
;	./src/main.c: 132: if (desitky > 9){
; genCmp
; genCmpTnz
	ld	a, (0x0e, sp)
	cp	a, #0x09
	jrugt	00169$
	jp	00104$
00169$:
; skipping generated iCode
;	./src/main.c: 133: stovky++;
; genPlus
	inc	(0x0f, sp)
;	./src/main.c: 134: desitky = 0;
; genAssign
	clr	(0x0e, sp)
; genLabel
00104$:
;	./src/main.c: 136: if (stovky > 9){
; genCmp
; genCmpTnz
	ld	a, (0x0f, sp)
	cp	a, #0x09
	jrugt	00170$
	jp	00106$
00170$:
; skipping generated iCode
;	./src/main.c: 137: tisice++;
; genPlus
	inc	(0x10, sp)
;	./src/main.c: 138: stovky =0;
; genAssign
	clr	(0x0f, sp)
; genLabel
00106$:
;	./src/main.c: 140: if (tisice > 9){
; genCmp
; genCmpTnz
	ld	a, (0x10, sp)
	cp	a, #0x09
	jrugt	00171$
	jp	00108$
00171$:
; skipping generated iCode
;	./src/main.c: 141: statisice++;
; genPlus
	inc	(0x11, sp)
;	./src/main.c: 142: tisice = 0;
; genAssign
	clr	(0x10, sp)
; genLabel
00108$:
;	./src/main.c: 144: if (statisice > 9){
; genCmp
; genCmpTnz
	ld	a, (0x11, sp)
	cp	a, #0x09
	jrugt	00172$
	jp	00114$
00172$:
; skipping generated iCode
;	./src/main.c: 145: number = 0;
; genAssign
	clr	(0x0d, sp)
;	./src/main.c: 146: desitky = 0;
; genAssign
	clr	(0x0e, sp)
;	./src/main.c: 147: stovky = 0;
; genAssign
	clr	(0x0f, sp)
;	./src/main.c: 148: tisice = 0;
; genAssign
	clr	(0x10, sp)
;	./src/main.c: 149: statisice = 0;
; genAssign
	clr	(0x11, sp)
; genGoto
	jp	00114$
; genLabel
00116$:
;	./src/main.c: 156: }
; genEndFunction
	addw	sp, #17
	ret
;	Total main function size at codegen: 244 bytes.
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

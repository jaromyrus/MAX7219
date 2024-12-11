                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.4.4 #14992 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	
                                      7 ;--------------------------------------------------------
                                      8 ; Public variables in this module
                                      9 ;--------------------------------------------------------
                                     10 	.globl _main
                                     11 	.globl _setup
                                     12 	.globl _max7219_init
                                     13 	.globl _max7219_send
                                     14 	.globl _milis
                                     15 	.globl _init_milis
                                     16 	.globl _GPIO_WriteLow
                                     17 	.globl _GPIO_WriteHigh
                                     18 	.globl _GPIO_Init
                                     19 	.globl _CLK_HSIPrescalerConfig
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area INITIALIZED
                                     28 ;--------------------------------------------------------
                                     29 ; Stack segment in internal ram
                                     30 ;--------------------------------------------------------
                                     31 	.area SSEG
      00868A                         32 __start__stack:
      00868A                         33 	.ds	1
                                     34 
                                     35 ;--------------------------------------------------------
                                     36 ; absolute external ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DABS (ABS)
                                     39 
                                     40 ; default segment ordering for linker
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area CONST
                                     45 	.area INITIALIZER
                                     46 	.area CODE
                                     47 
                                     48 ;--------------------------------------------------------
                                     49 ; interrupt vector
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
      008000                         52 __interrupt_vect:
      008000 82 00 80 6F             53 	int s_GSINIT ; reset
      008004 82 00 83 7B             54 	int _TRAP_IRQHandler ; trap
      008008 82 00 83 7C             55 	int _TLI_IRQHandler ; int0
      00800C 82 00 83 7D             56 	int _AWU_IRQHandler ; int1
      008010 82 00 83 7E             57 	int _CLK_IRQHandler ; int2
      008014 82 00 83 7F             58 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 83 80             59 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 83 81             60 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 83 82             61 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 83 83             62 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 83 84             63 	int _CAN_RX_IRQHandler ; int8
      00802C 82 00 83 85             64 	int _CAN_TX_IRQHandler ; int9
      008030 82 00 83 86             65 	int _SPI_IRQHandler ; int10
      008034 82 00 83 87             66 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 83 88             67 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 83 89             68 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 83 8A             69 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 83 8B             70 	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
      008048 82 00 83 8C             71 	int _TIM3_CAP_COM_IRQHandler ; int16
      00804C 82 00 83 8D             72 	int _UART1_TX_IRQHandler ; int17
      008050 82 00 83 8E             73 	int _UART1_RX_IRQHandler ; int18
      008054 82 00 83 8F             74 	int _I2C_IRQHandler ; int19
      008058 82 00 83 90             75 	int _UART3_TX_IRQHandler ; int20
      00805C 82 00 83 91             76 	int _UART3_RX_IRQHandler ; int21
      008060 82 00 83 92             77 	int _ADC2_IRQHandler ; int22
      008064 82 00 83 93             78 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 83 AD             79 	int _EEPROM_EEC_IRQHandler ; int24
                                     80 ;--------------------------------------------------------
                                     81 ; global & static initialisations
                                     82 ;--------------------------------------------------------
                                     83 	.area HOME
                                     84 	.area GSINIT
                                     85 	.area GSFINAL
                                     86 	.area GSINIT
      00806F CD 84 D1         [ 4]   87 	call	___sdcc_external_startup
      008072 4D               [ 1]   88 	tnz	a
      008073 27 03            [ 1]   89 	jreq	__sdcc_init_data
      008075 CC 80 6C         [ 2]   90 	jp	__sdcc_program_startup
      008078                         91 __sdcc_init_data:
                                     92 ; stm8_genXINIT() start
      008078 AE 00 00         [ 2]   93 	ldw x, #l_DATA
      00807B 27 07            [ 1]   94 	jreq	00002$
      00807D                         95 00001$:
      00807D 72 4F 00 00      [ 1]   96 	clr (s_DATA - 1, x)
      008081 5A               [ 2]   97 	decw x
      008082 26 F9            [ 1]   98 	jrne	00001$
      008084                         99 00002$:
      008084 AE 00 04         [ 2]  100 	ldw	x, #l_INITIALIZER
      008087 27 09            [ 1]  101 	jreq	00004$
      008089                        102 00003$:
      008089 D6 80 94         [ 1]  103 	ld	a, (s_INITIALIZER - 1, x)
      00808C D7 00 00         [ 1]  104 	ld	(s_INITIALIZED - 1, x), a
      00808F 5A               [ 2]  105 	decw	x
      008090 26 F7            [ 1]  106 	jrne	00003$
      008092                        107 00004$:
                                    108 ; stm8_genXINIT() end
                                    109 	.area GSFINAL
      008092 CC 80 6C         [ 2]  110 	jp	__sdcc_program_startup
                                    111 ;--------------------------------------------------------
                                    112 ; Home
                                    113 ;--------------------------------------------------------
                                    114 	.area HOME
                                    115 	.area HOME
      00806C                        116 __sdcc_program_startup:
      00806C CC 82 46         [ 2]  117 	jp	_main
                                    118 ;	return from main will return to caller
                                    119 ;--------------------------------------------------------
                                    120 ; code
                                    121 ;--------------------------------------------------------
                                    122 	.area CODE
                                    123 ;	./src/main.c: 27: void max7219_send(uint8_t address, uint8_t data)
                                    124 ; genLabel
                                    125 ;	-----------------------------------------
                                    126 ;	 function max7219_send
                                    127 ;	-----------------------------------------
                                    128 ;	Register assignment is optimal.
                                    129 ;	Stack space usage: 2 bytes.
      008160                        130 _max7219_send:
      008160 89               [ 2]  131 	pushw	x
                                    132 ; genReceive
      008161 6B 01            [ 1]  133 	ld	(0x01, sp), a
                                    134 ;	./src/main.c: 30: CS_LOW;       
                                    135 ; genSend
      008163 A6 20            [ 1]  136 	ld	a, #0x20
                                    137 ; genSend
      008165 AE 50 1E         [ 2]  138 	ldw	x, #0x501e
                                    139 ; genCall
      008168 CD 84 C2         [ 4]  140 	call	_GPIO_WriteLow
                                    141 ;	./src/main.c: 33: mask = 0b10000000; 
                                    142 ; genAssign
      00816B A6 80            [ 1]  143 	ld	a, #0x80
      00816D 6B 02            [ 1]  144 	ld	(0x02, sp), a
                                    145 ;	./src/main.c: 34: CLK_LOW;          
                                    146 ; genSend
      00816F A6 40            [ 1]  147 	ld	a, #0x40
                                    148 ; genSend
      008171 AE 50 1E         [ 2]  149 	ldw	x, #0x501e
                                    150 ; genCall
      008174 CD 84 C2         [ 4]  151 	call	_GPIO_WriteLow
                                    152 ;	./src/main.c: 35: while (mask)
                                    153 ; genLabel
      008177                        154 00104$:
                                    155 ; genIfx
      008177 0D 02            [ 1]  156 	tnz	(0x02, sp)
      008179 26 03            [ 1]  157 	jrne	00157$
      00817B CC 81 B0         [ 2]  158 	jp	00106$
      00817E                        159 00157$:
                                    160 ;	./src/main.c: 37: if (mask & address)
                                    161 ; genAnd
      00817E 7B 02            [ 1]  162 	ld	a, (0x02, sp)
      008180 14 01            [ 1]  163 	and	a, (0x01, sp)
                                    164 ; genIfx
      008182 4D               [ 1]  165 	tnz	a
      008183 26 03            [ 1]  166 	jrne	00158$
      008185 CC 81 93         [ 2]  167 	jp	00102$
      008188                        168 00158$:
                                    169 ;	./src/main.c: 39: DATA_HIGH;
                                    170 ; genSend
      008188 A6 10            [ 1]  171 	ld	a, #0x10
                                    172 ; genSend
      00818A AE 50 1E         [ 2]  173 	ldw	x, #0x501e
                                    174 ; genCall
      00818D CD 85 F1         [ 4]  175 	call	_GPIO_WriteHigh
                                    176 ; genGoto
      008190 CC 81 9B         [ 2]  177 	jp	00103$
                                    178 ; genLabel
      008193                        179 00102$:
                                    180 ;	./src/main.c: 43: DATA_LOW; 
                                    181 ; genSend
      008193 A6 10            [ 1]  182 	ld	a, #0x10
                                    183 ; genSend
      008195 AE 50 1E         [ 2]  184 	ldw	x, #0x501e
                                    185 ; genCall
      008198 CD 84 C2         [ 4]  186 	call	_GPIO_WriteLow
                                    187 ; genLabel
      00819B                        188 00103$:
                                    189 ;	./src/main.c: 45: CLK_HIGH;         
                                    190 ; genSend
      00819B A6 40            [ 1]  191 	ld	a, #0x40
                                    192 ; genSend
      00819D AE 50 1E         [ 2]  193 	ldw	x, #0x501e
                                    194 ; genCall
      0081A0 CD 85 F1         [ 4]  195 	call	_GPIO_WriteHigh
                                    196 ;	./src/main.c: 46: mask = mask >> 1; 
                                    197 ; genRightShiftLiteral
      0081A3 04 02            [ 1]  198 	srl	(0x02, sp)
                                    199 ;	./src/main.c: 47: CLK_LOW;          
                                    200 ; genSend
      0081A5 A6 40            [ 1]  201 	ld	a, #0x40
                                    202 ; genSend
      0081A7 AE 50 1E         [ 2]  203 	ldw	x, #0x501e
                                    204 ; genCall
      0081AA CD 84 C2         [ 4]  205 	call	_GPIO_WriteLow
                                    206 ; genGoto
      0081AD CC 81 77         [ 2]  207 	jp	00104$
                                    208 ; genLabel
      0081B0                        209 00106$:
                                    210 ;	./src/main.c: 51: mask = 0b10000000;
                                    211 ; genAssign
      0081B0 A6 80            [ 1]  212 	ld	a, #0x80
      0081B2 6B 02            [ 1]  213 	ld	(0x02, sp), a
                                    214 ;	./src/main.c: 52: while (mask)
                                    215 ; genLabel
      0081B4                        216 00110$:
                                    217 ; genIfx
      0081B4 0D 02            [ 1]  218 	tnz	(0x02, sp)
      0081B6 26 03            [ 1]  219 	jrne	00159$
      0081B8 CC 81 ED         [ 2]  220 	jp	00112$
      0081BB                        221 00159$:
                                    222 ;	./src/main.c: 54: if (mask & data)
                                    223 ; genAnd
      0081BB 7B 02            [ 1]  224 	ld	a, (0x02, sp)
      0081BD 14 05            [ 1]  225 	and	a, (0x05, sp)
                                    226 ; genIfx
      0081BF 4D               [ 1]  227 	tnz	a
      0081C0 26 03            [ 1]  228 	jrne	00160$
      0081C2 CC 81 D0         [ 2]  229 	jp	00108$
      0081C5                        230 00160$:
                                    231 ;	./src/main.c: 56: DATA_HIGH; 
                                    232 ; genSend
      0081C5 A6 10            [ 1]  233 	ld	a, #0x10
                                    234 ; genSend
      0081C7 AE 50 1E         [ 2]  235 	ldw	x, #0x501e
                                    236 ; genCall
      0081CA CD 85 F1         [ 4]  237 	call	_GPIO_WriteHigh
                                    238 ; genGoto
      0081CD CC 81 D8         [ 2]  239 	jp	00109$
                                    240 ; genLabel
      0081D0                        241 00108$:
                                    242 ;	./src/main.c: 60: DATA_LOW;
                                    243 ; genSend
      0081D0 A6 10            [ 1]  244 	ld	a, #0x10
                                    245 ; genSend
      0081D2 AE 50 1E         [ 2]  246 	ldw	x, #0x501e
                                    247 ; genCall
      0081D5 CD 84 C2         [ 4]  248 	call	_GPIO_WriteLow
                                    249 ; genLabel
      0081D8                        250 00109$:
                                    251 ;	./src/main.c: 62: CLK_HIGH;         
                                    252 ; genSend
      0081D8 A6 40            [ 1]  253 	ld	a, #0x40
                                    254 ; genSend
      0081DA AE 50 1E         [ 2]  255 	ldw	x, #0x501e
                                    256 ; genCall
      0081DD CD 85 F1         [ 4]  257 	call	_GPIO_WriteHigh
                                    258 ;	./src/main.c: 63: mask = mask >> 1;
                                    259 ; genRightShiftLiteral
      0081E0 04 02            [ 1]  260 	srl	(0x02, sp)
                                    261 ;	./src/main.c: 64: CLK_LOW;          
                                    262 ; genSend
      0081E2 A6 40            [ 1]  263 	ld	a, #0x40
                                    264 ; genSend
      0081E4 AE 50 1E         [ 2]  265 	ldw	x, #0x501e
                                    266 ; genCall
      0081E7 CD 84 C2         [ 4]  267 	call	_GPIO_WriteLow
                                    268 ; genGoto
      0081EA CC 81 B4         [ 2]  269 	jp	00110$
                                    270 ; genLabel
      0081ED                        271 00112$:
                                    272 ;	./src/main.c: 67: CS_HIGH; 
                                    273 ; genSend
      0081ED A6 20            [ 1]  274 	ld	a, #0x20
                                    275 ; genSend
      0081EF AE 50 1E         [ 2]  276 	ldw	x, #0x501e
                                    277 ; genCall
      0081F2 CD 85 F1         [ 4]  278 	call	_GPIO_WriteHigh
                                    279 ; genLabel
      0081F5                        280 00113$:
                                    281 ;	./src/main.c: 68: }
                                    282 ; genEndFunction
      0081F5 85               [ 2]  283 	popw	x
      0081F6 85               [ 2]  284 	popw	x
      0081F7 84               [ 1]  285 	pop	a
      0081F8 FC               [ 2]  286 	jp	(x)
                                    287 ;	Total max7219_send function size at codegen: 153 bytes.
                                    288 ;	./src/main.c: 70: void max7219_init(void)
                                    289 ; genLabel
                                    290 ;	-----------------------------------------
                                    291 ;	 function max7219_init
                                    292 ;	-----------------------------------------
                                    293 ;	Register assignment is optimal.
                                    294 ;	Stack space usage: 0 bytes.
      0081F9                        295 _max7219_init:
                                    296 ;	./src/main.c: 72: GPIO_Init(CS_GPIO, CS_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
                                    297 ; genIPush
      0081F9 4B C0            [ 1]  298 	push	#0xc0
                                    299 ; genSend
      0081FB A6 20            [ 1]  300 	ld	a, #0x20
                                    301 ; genSend
      0081FD AE 50 1E         [ 2]  302 	ldw	x, #0x501e
                                    303 ; genCall
      008200 CD 83 AE         [ 4]  304 	call	_GPIO_Init
                                    305 ;	./src/main.c: 73: GPIO_Init(CLK_GPIO, CLK_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
                                    306 ; genIPush
      008203 4B C0            [ 1]  307 	push	#0xc0
                                    308 ; genSend
      008205 A6 40            [ 1]  309 	ld	a, #0x40
                                    310 ; genSend
      008207 AE 50 1E         [ 2]  311 	ldw	x, #0x501e
                                    312 ; genCall
      00820A CD 83 AE         [ 4]  313 	call	_GPIO_Init
                                    314 ;	./src/main.c: 74: GPIO_Init(DATA_GPIO, DATA_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
                                    315 ; genIPush
      00820D 4B C0            [ 1]  316 	push	#0xc0
                                    317 ; genSend
      00820F A6 10            [ 1]  318 	ld	a, #0x10
                                    319 ; genSend
      008211 AE 50 1E         [ 2]  320 	ldw	x, #0x501e
                                    321 ; genCall
      008214 CD 83 AE         [ 4]  322 	call	_GPIO_Init
                                    323 ;	./src/main.c: 77: max7219_send(DECODE_MODE, DECODE_ALL);        // Nějakej dekodér
                                    324 ; genIPush
      008217 4B FF            [ 1]  325 	push	#0xff
                                    326 ; genSend
      008219 A6 09            [ 1]  327 	ld	a, #0x09
                                    328 ; genCall
      00821B CD 81 60         [ 4]  329 	call	_max7219_send
                                    330 ;	./src/main.c: 78: max7219_send(SCAN_LIMIT, 4);                  // Kolik cifer zapneme
                                    331 ; genIPush
      00821E 4B 04            [ 1]  332 	push	#0x04
                                    333 ; genSend
      008220 A6 0B            [ 1]  334 	ld	a, #0x0b
                                    335 ; genCall
      008222 CD 81 60         [ 4]  336 	call	_max7219_send
                                    337 ;	./src/main.c: 79: max7219_send(INTENSITY, 1);                   // Jas
                                    338 ; genIPush
      008225 4B 01            [ 1]  339 	push	#0x01
                                    340 ; genSend
      008227 A6 0A            [ 1]  341 	ld	a, #0x0a
                                    342 ; genCall
      008229 CD 81 60         [ 4]  343 	call	_max7219_send
                                    344 ;	./src/main.c: 80: max7219_send(DISPLAY_TEST, DISPLAY_TEST_OFF); // test displeje
                                    345 ; genIPush
      00822C 4B 00            [ 1]  346 	push	#0x00
                                    347 ; genSend
      00822E A6 0F            [ 1]  348 	ld	a, #0x0f
                                    349 ; genCall
      008230 CD 81 60         [ 4]  350 	call	_max7219_send
                                    351 ;	./src/main.c: 81: max7219_send(SHUTDOWN, SHUTDOWN_ON);           // On/OFF
                                    352 ; genIPush
      008233 4B 01            [ 1]  353 	push	#0x01
                                    354 ; genSend
      008235 A6 0C            [ 1]  355 	ld	a, #0x0c
                                    356 ; genCall
      008237 CD 81 60         [ 4]  357 	call	_max7219_send
                                    358 ; genLabel
      00823A                        359 00101$:
                                    360 ;	./src/main.c: 83: }
                                    361 ; genEndFunction
      00823A 81               [ 4]  362 	ret
                                    363 ;	Total max7219_init function size at codegen: 66 bytes.
                                    364 ;	./src/main.c: 85: void setup(void)
                                    365 ; genLabel
                                    366 ;	-----------------------------------------
                                    367 ;	 function setup
                                    368 ;	-----------------------------------------
                                    369 ;	Register assignment is optimal.
                                    370 ;	Stack space usage: 0 bytes.
      00823B                        371 _setup:
                                    372 ;	./src/main.c: 87: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // taktovat MCU na 16MHz
                                    373 ; genSend
      00823B 4F               [ 1]  374 	clr	a
                                    375 ; genCall
      00823C CD 84 EF         [ 4]  376 	call	_CLK_HSIPrescalerConfig
                                    377 ;	./src/main.c: 89: init_milis();
                                    378 ; genCall
      00823F CD 83 5A         [ 4]  379 	call	_init_milis
                                    380 ;	./src/main.c: 92: max7219_init();
                                    381 ; genCall
      008242 CC 81 F9         [ 2]  382 	jp	_max7219_init
                                    383 ; genLabel
      008245                        384 00101$:
                                    385 ;	./src/main.c: 93: }
                                    386 ; genEndFunction
      008245 81               [ 4]  387 	ret
                                    388 ;	Total setup function size at codegen: 11 bytes.
                                    389 ;	./src/main.c: 95: int main(void)
                                    390 ; genLabel
                                    391 ;	-----------------------------------------
                                    392 ;	 function main
                                    393 ;	-----------------------------------------
                                    394 ;	Register assignment might be sub-optimal.
                                    395 ;	Stack space usage: 17 bytes.
      008246                        396 _main:
      008246 52 11            [ 2]  397 	sub	sp, #17
                                    398 ;	./src/main.c: 98: setup();
                                    399 ; genCall
      008248 CD 82 3B         [ 4]  400 	call	_setup
                                    401 ;	./src/main.c: 100: max7219_send(DIGIT0, 0);
                                    402 ; genIPush
      00824B 4B 00            [ 1]  403 	push	#0x00
                                    404 ; genSend
      00824D A6 01            [ 1]  405 	ld	a, #0x01
                                    406 ; genCall
      00824F CD 81 60         [ 4]  407 	call	_max7219_send
                                    408 ;	./src/main.c: 101: max7219_send(DIGIT1, 0);
                                    409 ; genIPush
      008252 4B 00            [ 1]  410 	push	#0x00
                                    411 ; genSend
      008254 A6 02            [ 1]  412 	ld	a, #0x02
                                    413 ; genCall
      008256 CD 81 60         [ 4]  414 	call	_max7219_send
                                    415 ;	./src/main.c: 102: max7219_send(DIGIT2, 0);
                                    416 ; genIPush
      008259 4B 00            [ 1]  417 	push	#0x00
                                    418 ; genSend
      00825B A6 03            [ 1]  419 	ld	a, #0x03
                                    420 ; genCall
      00825D CD 81 60         [ 4]  421 	call	_max7219_send
                                    422 ;	./src/main.c: 103: max7219_send(DIGIT3, 0);
                                    423 ; genIPush
      008260 4B 00            [ 1]  424 	push	#0x00
                                    425 ; genSend
      008262 A6 04            [ 1]  426 	ld	a, #0x04
                                    427 ; genCall
      008264 CD 81 60         [ 4]  428 	call	_max7219_send
                                    429 ;	./src/main.c: 104: max7219_send(DIGIT4, 0);
                                    430 ; genIPush
      008267 4B 00            [ 1]  431 	push	#0x00
                                    432 ; genSend
      008269 A6 05            [ 1]  433 	ld	a, #0x05
                                    434 ; genCall
      00826B CD 81 60         [ 4]  435 	call	_max7219_send
                                    436 ;	./src/main.c: 105: max7219_send(DIGIT5, 0);
                                    437 ; genIPush
      00826E 4B 00            [ 1]  438 	push	#0x00
                                    439 ; genSend
      008270 A6 06            [ 1]  440 	ld	a, #0x06
                                    441 ; genCall
      008272 CD 81 60         [ 4]  442 	call	_max7219_send
                                    443 ;	./src/main.c: 106: max7219_send(DIGIT6, 0);
                                    444 ; genIPush
      008275 4B 00            [ 1]  445 	push	#0x00
                                    446 ; genSend
      008277 A6 07            [ 1]  447 	ld	a, #0x07
                                    448 ; genCall
      008279 CD 81 60         [ 4]  449 	call	_max7219_send
                                    450 ;	./src/main.c: 107: max7219_send(DIGIT7, 0);
                                    451 ; genIPush
      00827C 4B 00            [ 1]  452 	push	#0x00
                                    453 ; genSend
      00827E A6 08            [ 1]  454 	ld	a, #0x08
                                    455 ; genCall
      008280 CD 81 60         [ 4]  456 	call	_max7219_send
                                    457 ;	./src/main.c: 109: uint32_t time = 0;
                                    458 ; genAssign
      008283 5F               [ 1]  459 	clrw	x
      008284 1F 03            [ 2]  460 	ldw	(0x03, sp), x
      008286 1F 01            [ 2]  461 	ldw	(0x01, sp), x
                                    462 ;	./src/main.c: 110: uint8_t number = 0;
                                    463 ; genAssign
      008288 0F 0D            [ 1]  464 	clr	(0x0d, sp)
                                    465 ;	./src/main.c: 111: uint8_t desitky = 0;
                                    466 ; genAssign
      00828A 0F 0E            [ 1]  467 	clr	(0x0e, sp)
                                    468 ;	./src/main.c: 112: uint8_t stovky = 0;
                                    469 ; genAssign
      00828C 0F 0F            [ 1]  470 	clr	(0x0f, sp)
                                    471 ;	./src/main.c: 113: uint8_t tisice = 0;
                                    472 ; genAssign
      00828E 0F 10            [ 1]  473 	clr	(0x10, sp)
                                    474 ;	./src/main.c: 114: uint8_t statisice = 0;
                                    475 ; genAssign
      008290 0F 11            [ 1]  476 	clr	(0x11, sp)
                                    477 ;	./src/main.c: 117: while (1)
                                    478 ; genLabel
      008292                        479 00114$:
                                    480 ;	./src/main.c: 119: if ((milis() - time) > 1000)
                                    481 ; genCall
      008292 CD 83 3A         [ 4]  482 	call	_milis
      008295 1F 07            [ 2]  483 	ldw	(0x07, sp), x
      008297 17 05            [ 2]  484 	ldw	(0x05, sp), y
                                    485 ; genMinus
      008299 1E 07            [ 2]  486 	ldw	x, (0x07, sp)
      00829B 72 F0 03         [ 2]  487 	subw	x, (0x03, sp)
      00829E 1F 0B            [ 2]  488 	ldw	(0x0b, sp), x
      0082A0 7B 06            [ 1]  489 	ld	a, (0x06, sp)
      0082A2 12 02            [ 1]  490 	sbc	a, (0x02, sp)
      0082A4 6B 0A            [ 1]  491 	ld	(0x0a, sp), a
      0082A6 7B 05            [ 1]  492 	ld	a, (0x05, sp)
      0082A8 12 01            [ 1]  493 	sbc	a, (0x01, sp)
      0082AA 6B 09            [ 1]  494 	ld	(0x09, sp), a
                                    495 ; genCmp
                                    496 ; genCmpTnz
      0082AC AE 03 E8         [ 2]  497 	ldw	x, #0x03e8
      0082AF 13 0B            [ 2]  498 	cpw	x, (0x0b, sp)
      0082B1 4F               [ 1]  499 	clr	a
      0082B2 12 0A            [ 1]  500 	sbc	a, (0x0a, sp)
      0082B4 4F               [ 1]  501 	clr	a
      0082B5 12 09            [ 1]  502 	sbc	a, (0x09, sp)
      0082B7 25 03            [ 1]  503 	jrc	00167$
      0082B9 CC 82 92         [ 2]  504 	jp	00114$
      0082BC                        505 00167$:
                                    506 ; skipping generated iCode
                                    507 ;	./src/main.c: 121: time = milis();
                                    508 ; genCall
      0082BC CD 83 3A         [ 4]  509 	call	_milis
      0082BF 1F 03            [ 2]  510 	ldw	(0x03, sp), x
      0082C1 17 01            [ 2]  511 	ldw	(0x01, sp), y
                                    512 ;	./src/main.c: 122: max7219_send(DIGIT0, number);
                                    513 ; genIPush
      0082C3 7B 0D            [ 1]  514 	ld	a, (0x0d, sp)
      0082C5 88               [ 1]  515 	push	a
                                    516 ; genSend
      0082C6 A6 01            [ 1]  517 	ld	a, #0x01
                                    518 ; genCall
      0082C8 CD 81 60         [ 4]  519 	call	_max7219_send
                                    520 ;	./src/main.c: 123: max7219_send(DIGIT1, desitky);
                                    521 ; genIPush
      0082CB 7B 0E            [ 1]  522 	ld	a, (0x0e, sp)
      0082CD 88               [ 1]  523 	push	a
                                    524 ; genSend
      0082CE A6 02            [ 1]  525 	ld	a, #0x02
                                    526 ; genCall
      0082D0 CD 81 60         [ 4]  527 	call	_max7219_send
                                    528 ;	./src/main.c: 124: max7219_send(DIGIT2, stovky);
                                    529 ; genIPush
      0082D3 7B 0F            [ 1]  530 	ld	a, (0x0f, sp)
      0082D5 88               [ 1]  531 	push	a
                                    532 ; genSend
      0082D6 A6 03            [ 1]  533 	ld	a, #0x03
                                    534 ; genCall
      0082D8 CD 81 60         [ 4]  535 	call	_max7219_send
                                    536 ;	./src/main.c: 125: max7219_send(DIGIT3, tisice);
                                    537 ; genIPush
      0082DB 7B 10            [ 1]  538 	ld	a, (0x10, sp)
      0082DD 88               [ 1]  539 	push	a
                                    540 ; genSend
      0082DE A6 04            [ 1]  541 	ld	a, #0x04
                                    542 ; genCall
      0082E0 CD 81 60         [ 4]  543 	call	_max7219_send
                                    544 ;	./src/main.c: 126: max7219_send(DIGIT4, statisice);
                                    545 ; genIPush
      0082E3 7B 11            [ 1]  546 	ld	a, (0x11, sp)
      0082E5 88               [ 1]  547 	push	a
                                    548 ; genSend
      0082E6 A6 05            [ 1]  549 	ld	a, #0x05
                                    550 ; genCall
      0082E8 CD 81 60         [ 4]  551 	call	_max7219_send
                                    552 ;	./src/main.c: 127: number++;
                                    553 ; genPlus
      0082EB 0C 0D            [ 1]  554 	inc	(0x0d, sp)
                                    555 ;	./src/main.c: 128: if (number>9){
                                    556 ; genCmp
                                    557 ; genCmpTnz
      0082ED 7B 0D            [ 1]  558 	ld	a, (0x0d, sp)
      0082EF A1 09            [ 1]  559 	cp	a, #0x09
      0082F1 22 03            [ 1]  560 	jrugt	00168$
      0082F3 CC 82 FA         [ 2]  561 	jp	00102$
      0082F6                        562 00168$:
                                    563 ; skipping generated iCode
                                    564 ;	./src/main.c: 129: number=0;
                                    565 ; genAssign
      0082F6 0F 0D            [ 1]  566 	clr	(0x0d, sp)
                                    567 ;	./src/main.c: 130: desitky++;
                                    568 ; genPlus
      0082F8 0C 0E            [ 1]  569 	inc	(0x0e, sp)
                                    570 ; genLabel
      0082FA                        571 00102$:
                                    572 ;	./src/main.c: 132: if (desitky > 9){
                                    573 ; genCmp
                                    574 ; genCmpTnz
      0082FA 7B 0E            [ 1]  575 	ld	a, (0x0e, sp)
      0082FC A1 09            [ 1]  576 	cp	a, #0x09
      0082FE 22 03            [ 1]  577 	jrugt	00169$
      008300 CC 83 07         [ 2]  578 	jp	00104$
      008303                        579 00169$:
                                    580 ; skipping generated iCode
                                    581 ;	./src/main.c: 133: stovky++;
                                    582 ; genPlus
      008303 0C 0F            [ 1]  583 	inc	(0x0f, sp)
                                    584 ;	./src/main.c: 134: desitky = 0;
                                    585 ; genAssign
      008305 0F 0E            [ 1]  586 	clr	(0x0e, sp)
                                    587 ; genLabel
      008307                        588 00104$:
                                    589 ;	./src/main.c: 136: if (stovky > 9){
                                    590 ; genCmp
                                    591 ; genCmpTnz
      008307 7B 0F            [ 1]  592 	ld	a, (0x0f, sp)
      008309 A1 09            [ 1]  593 	cp	a, #0x09
      00830B 22 03            [ 1]  594 	jrugt	00170$
      00830D CC 83 14         [ 2]  595 	jp	00106$
      008310                        596 00170$:
                                    597 ; skipping generated iCode
                                    598 ;	./src/main.c: 137: tisice++;
                                    599 ; genPlus
      008310 0C 10            [ 1]  600 	inc	(0x10, sp)
                                    601 ;	./src/main.c: 138: stovky =0;
                                    602 ; genAssign
      008312 0F 0F            [ 1]  603 	clr	(0x0f, sp)
                                    604 ; genLabel
      008314                        605 00106$:
                                    606 ;	./src/main.c: 140: if (tisice > 9){
                                    607 ; genCmp
                                    608 ; genCmpTnz
      008314 7B 10            [ 1]  609 	ld	a, (0x10, sp)
      008316 A1 09            [ 1]  610 	cp	a, #0x09
      008318 22 03            [ 1]  611 	jrugt	00171$
      00831A CC 83 21         [ 2]  612 	jp	00108$
      00831D                        613 00171$:
                                    614 ; skipping generated iCode
                                    615 ;	./src/main.c: 141: statisice++;
                                    616 ; genPlus
      00831D 0C 11            [ 1]  617 	inc	(0x11, sp)
                                    618 ;	./src/main.c: 142: tisice = 0;
                                    619 ; genAssign
      00831F 0F 10            [ 1]  620 	clr	(0x10, sp)
                                    621 ; genLabel
      008321                        622 00108$:
                                    623 ;	./src/main.c: 144: if (statisice > 9){
                                    624 ; genCmp
                                    625 ; genCmpTnz
      008321 7B 11            [ 1]  626 	ld	a, (0x11, sp)
      008323 A1 09            [ 1]  627 	cp	a, #0x09
      008325 22 03            [ 1]  628 	jrugt	00172$
      008327 CC 82 92         [ 2]  629 	jp	00114$
      00832A                        630 00172$:
                                    631 ; skipping generated iCode
                                    632 ;	./src/main.c: 145: number = 0;
                                    633 ; genAssign
      00832A 0F 0D            [ 1]  634 	clr	(0x0d, sp)
                                    635 ;	./src/main.c: 146: desitky = 0;
                                    636 ; genAssign
      00832C 0F 0E            [ 1]  637 	clr	(0x0e, sp)
                                    638 ;	./src/main.c: 147: stovky = 0;
                                    639 ; genAssign
      00832E 0F 0F            [ 1]  640 	clr	(0x0f, sp)
                                    641 ;	./src/main.c: 148: tisice = 0;
                                    642 ; genAssign
      008330 0F 10            [ 1]  643 	clr	(0x10, sp)
                                    644 ;	./src/main.c: 149: statisice = 0;
                                    645 ; genAssign
      008332 0F 11            [ 1]  646 	clr	(0x11, sp)
                                    647 ; genGoto
      008334 CC 82 92         [ 2]  648 	jp	00114$
                                    649 ; genLabel
      008337                        650 00116$:
                                    651 ;	./src/main.c: 156: }
                                    652 ; genEndFunction
      008337 5B 11            [ 2]  653 	addw	sp, #17
      008339 81               [ 4]  654 	ret
                                    655 ;	Total main function size at codegen: 244 bytes.
                                    656 	.area CODE
                                    657 	.area CONST
                                    658 	.area INITIALIZER
                                    659 	.area CABS (ABS)

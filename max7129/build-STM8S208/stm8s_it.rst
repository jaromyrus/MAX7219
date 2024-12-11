                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.4.4 #14992 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_it
                                      6 	
                                      7 ;--------------------------------------------------------
                                      8 ; Public variables in this module
                                      9 ;--------------------------------------------------------
                                     10 	.globl _TIM4_ClearFlag
                                     11 	.globl _TRAP_IRQHandler
                                     12 	.globl _TLI_IRQHandler
                                     13 	.globl _AWU_IRQHandler
                                     14 	.globl _CLK_IRQHandler
                                     15 	.globl _EXTI_PORTA_IRQHandler
                                     16 	.globl _EXTI_PORTB_IRQHandler
                                     17 	.globl _EXTI_PORTC_IRQHandler
                                     18 	.globl _EXTI_PORTD_IRQHandler
                                     19 	.globl _EXTI_PORTE_IRQHandler
                                     20 	.globl _CAN_RX_IRQHandler
                                     21 	.globl _CAN_TX_IRQHandler
                                     22 	.globl _SPI_IRQHandler
                                     23 	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                     24 	.globl _TIM1_CAP_COM_IRQHandler
                                     25 	.globl _TIM2_UPD_OVF_BRK_IRQHandler
                                     26 	.globl _TIM2_CAP_COM_IRQHandler
                                     27 	.globl _TIM3_UPD_OVF_BRK_IRQHandler
                                     28 	.globl _TIM3_CAP_COM_IRQHandler
                                     29 	.globl _UART1_TX_IRQHandler
                                     30 	.globl _UART1_RX_IRQHandler
                                     31 	.globl _I2C_IRQHandler
                                     32 	.globl _UART3_TX_IRQHandler
                                     33 	.globl _UART3_RX_IRQHandler
                                     34 	.globl _ADC2_IRQHandler
                                     35 	.globl _TIM4_UPD_OVF_IRQHandler
                                     36 	.globl _EEPROM_EEC_IRQHandler
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DATA
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area INITIALIZED
                                     45 ;--------------------------------------------------------
                                     46 ; absolute external ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DABS (ABS)
                                     49 
                                     50 ; default segment ordering for linker
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area CONST
                                     55 	.area INITIALIZER
                                     56 	.area CODE
                                     57 
                                     58 ;--------------------------------------------------------
                                     59 ; global & static initialisations
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area GSINIT
                                     63 	.area GSFINAL
                                     64 	.area GSINIT
                                     65 ;--------------------------------------------------------
                                     66 ; Home
                                     67 ;--------------------------------------------------------
                                     68 	.area HOME
                                     69 	.area HOME
                                     70 ;--------------------------------------------------------
                                     71 ; code
                                     72 ;--------------------------------------------------------
                                     73 	.area CODE
                                     74 ;	./src/stm8s_it.c: 65: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     75 ; genLabel
                                     76 ;	-----------------------------------------
                                     77 ;	 function TRAP_IRQHandler
                                     78 ;	-----------------------------------------
                                     79 ;	Register assignment is optimal.
                                     80 ;	Stack space usage: 0 bytes.
      00837B                         81 _TRAP_IRQHandler:
                                     82 ;	./src/stm8s_it.c: 70: }
                                     83 ; genLabel
      00837B                         84 00101$:
                                     85 ; genEndFunction
      00837B 80               [11]   86 	iret
                                     87 ;	Total TRAP_IRQHandler function size at codegen: 1 bytes.
                                     88 ;	./src/stm8s_it.c: 76: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     89 ; genLabel
                                     90 ;	-----------------------------------------
                                     91 ;	 function TLI_IRQHandler
                                     92 ;	-----------------------------------------
                                     93 ;	Register assignment is optimal.
                                     94 ;	Stack space usage: 0 bytes.
      00837C                         95 _TLI_IRQHandler:
                                     96 ;	./src/stm8s_it.c: 81: }
                                     97 ; genLabel
      00837C                         98 00101$:
                                     99 ; genEndFunction
      00837C 80               [11]  100 	iret
                                    101 ;	Total TLI_IRQHandler function size at codegen: 1 bytes.
                                    102 ;	./src/stm8s_it.c: 88: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                    103 ; genLabel
                                    104 ;	-----------------------------------------
                                    105 ;	 function AWU_IRQHandler
                                    106 ;	-----------------------------------------
                                    107 ;	Register assignment is optimal.
                                    108 ;	Stack space usage: 0 bytes.
      00837D                        109 _AWU_IRQHandler:
                                    110 ;	./src/stm8s_it.c: 93: }
                                    111 ; genLabel
      00837D                        112 00101$:
                                    113 ; genEndFunction
      00837D 80               [11]  114 	iret
                                    115 ;	Total AWU_IRQHandler function size at codegen: 1 bytes.
                                    116 ;	./src/stm8s_it.c: 100: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                    117 ; genLabel
                                    118 ;	-----------------------------------------
                                    119 ;	 function CLK_IRQHandler
                                    120 ;	-----------------------------------------
                                    121 ;	Register assignment is optimal.
                                    122 ;	Stack space usage: 0 bytes.
      00837E                        123 _CLK_IRQHandler:
                                    124 ;	./src/stm8s_it.c: 105: }
                                    125 ; genLabel
      00837E                        126 00101$:
                                    127 ; genEndFunction
      00837E 80               [11]  128 	iret
                                    129 ;	Total CLK_IRQHandler function size at codegen: 1 bytes.
                                    130 ;	./src/stm8s_it.c: 112: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                    131 ; genLabel
                                    132 ;	-----------------------------------------
                                    133 ;	 function EXTI_PORTA_IRQHandler
                                    134 ;	-----------------------------------------
                                    135 ;	Register assignment is optimal.
                                    136 ;	Stack space usage: 0 bytes.
      00837F                        137 _EXTI_PORTA_IRQHandler:
                                    138 ;	./src/stm8s_it.c: 117: }
                                    139 ; genLabel
      00837F                        140 00101$:
                                    141 ; genEndFunction
      00837F 80               [11]  142 	iret
                                    143 ;	Total EXTI_PORTA_IRQHandler function size at codegen: 1 bytes.
                                    144 ;	./src/stm8s_it.c: 124: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    145 ; genLabel
                                    146 ;	-----------------------------------------
                                    147 ;	 function EXTI_PORTB_IRQHandler
                                    148 ;	-----------------------------------------
                                    149 ;	Register assignment is optimal.
                                    150 ;	Stack space usage: 0 bytes.
      008380                        151 _EXTI_PORTB_IRQHandler:
                                    152 ;	./src/stm8s_it.c: 129: }
                                    153 ; genLabel
      008380                        154 00101$:
                                    155 ; genEndFunction
      008380 80               [11]  156 	iret
                                    157 ;	Total EXTI_PORTB_IRQHandler function size at codegen: 1 bytes.
                                    158 ;	./src/stm8s_it.c: 136: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    159 ; genLabel
                                    160 ;	-----------------------------------------
                                    161 ;	 function EXTI_PORTC_IRQHandler
                                    162 ;	-----------------------------------------
                                    163 ;	Register assignment is optimal.
                                    164 ;	Stack space usage: 0 bytes.
      008381                        165 _EXTI_PORTC_IRQHandler:
                                    166 ;	./src/stm8s_it.c: 141: }
                                    167 ; genLabel
      008381                        168 00101$:
                                    169 ; genEndFunction
      008381 80               [11]  170 	iret
                                    171 ;	Total EXTI_PORTC_IRQHandler function size at codegen: 1 bytes.
                                    172 ;	./src/stm8s_it.c: 148: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    173 ; genLabel
                                    174 ;	-----------------------------------------
                                    175 ;	 function EXTI_PORTD_IRQHandler
                                    176 ;	-----------------------------------------
                                    177 ;	Register assignment is optimal.
                                    178 ;	Stack space usage: 0 bytes.
      008382                        179 _EXTI_PORTD_IRQHandler:
                                    180 ;	./src/stm8s_it.c: 153: }
                                    181 ; genLabel
      008382                        182 00101$:
                                    183 ; genEndFunction
      008382 80               [11]  184 	iret
                                    185 ;	Total EXTI_PORTD_IRQHandler function size at codegen: 1 bytes.
                                    186 ;	./src/stm8s_it.c: 160: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    187 ; genLabel
                                    188 ;	-----------------------------------------
                                    189 ;	 function EXTI_PORTE_IRQHandler
                                    190 ;	-----------------------------------------
                                    191 ;	Register assignment is optimal.
                                    192 ;	Stack space usage: 0 bytes.
      008383                        193 _EXTI_PORTE_IRQHandler:
                                    194 ;	./src/stm8s_it.c: 165: }
                                    195 ; genLabel
      008383                        196 00101$:
                                    197 ; genEndFunction
      008383 80               [11]  198 	iret
                                    199 ;	Total EXTI_PORTE_IRQHandler function size at codegen: 1 bytes.
                                    200 ;	./src/stm8s_it.c: 186: INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
                                    201 ; genLabel
                                    202 ;	-----------------------------------------
                                    203 ;	 function CAN_RX_IRQHandler
                                    204 ;	-----------------------------------------
                                    205 ;	Register assignment is optimal.
                                    206 ;	Stack space usage: 0 bytes.
      008384                        207 _CAN_RX_IRQHandler:
                                    208 ;	./src/stm8s_it.c: 191: }
                                    209 ; genLabel
      008384                        210 00101$:
                                    211 ; genEndFunction
      008384 80               [11]  212 	iret
                                    213 ;	Total CAN_RX_IRQHandler function size at codegen: 1 bytes.
                                    214 ;	./src/stm8s_it.c: 198: INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
                                    215 ; genLabel
                                    216 ;	-----------------------------------------
                                    217 ;	 function CAN_TX_IRQHandler
                                    218 ;	-----------------------------------------
                                    219 ;	Register assignment is optimal.
                                    220 ;	Stack space usage: 0 bytes.
      008385                        221 _CAN_TX_IRQHandler:
                                    222 ;	./src/stm8s_it.c: 203: }
                                    223 ; genLabel
      008385                        224 00101$:
                                    225 ; genEndFunction
      008385 80               [11]  226 	iret
                                    227 ;	Total CAN_TX_IRQHandler function size at codegen: 1 bytes.
                                    228 ;	./src/stm8s_it.c: 211: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    229 ; genLabel
                                    230 ;	-----------------------------------------
                                    231 ;	 function SPI_IRQHandler
                                    232 ;	-----------------------------------------
                                    233 ;	Register assignment is optimal.
                                    234 ;	Stack space usage: 0 bytes.
      008386                        235 _SPI_IRQHandler:
                                    236 ;	./src/stm8s_it.c: 216: }
                                    237 ; genLabel
      008386                        238 00101$:
                                    239 ; genEndFunction
      008386 80               [11]  240 	iret
                                    241 ;	Total SPI_IRQHandler function size at codegen: 1 bytes.
                                    242 ;	./src/stm8s_it.c: 223: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    243 ; genLabel
                                    244 ;	-----------------------------------------
                                    245 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    246 ;	-----------------------------------------
                                    247 ;	Register assignment is optimal.
                                    248 ;	Stack space usage: 0 bytes.
      008387                        249 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    250 ;	./src/stm8s_it.c: 228: }
                                    251 ; genLabel
      008387                        252 00101$:
                                    253 ; genEndFunction
      008387 80               [11]  254 	iret
                                    255 ;	Total TIM1_UPD_OVF_TRG_BRK_IRQHandler function size at codegen: 1 bytes.
                                    256 ;	./src/stm8s_it.c: 235: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    257 ; genLabel
                                    258 ;	-----------------------------------------
                                    259 ;	 function TIM1_CAP_COM_IRQHandler
                                    260 ;	-----------------------------------------
                                    261 ;	Register assignment is optimal.
                                    262 ;	Stack space usage: 0 bytes.
      008388                        263 _TIM1_CAP_COM_IRQHandler:
                                    264 ;	./src/stm8s_it.c: 240: }
                                    265 ; genLabel
      008388                        266 00101$:
                                    267 ; genEndFunction
      008388 80               [11]  268 	iret
                                    269 ;	Total TIM1_CAP_COM_IRQHandler function size at codegen: 1 bytes.
                                    270 ;	./src/stm8s_it.c: 272: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    271 ; genLabel
                                    272 ;	-----------------------------------------
                                    273 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    274 ;	-----------------------------------------
                                    275 ;	Register assignment is optimal.
                                    276 ;	Stack space usage: 0 bytes.
      008389                        277 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    278 ;	./src/stm8s_it.c: 277: }
                                    279 ; genLabel
      008389                        280 00101$:
                                    281 ; genEndFunction
      008389 80               [11]  282 	iret
                                    283 ;	Total TIM2_UPD_OVF_BRK_IRQHandler function size at codegen: 1 bytes.
                                    284 ;	./src/stm8s_it.c: 284: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    285 ; genLabel
                                    286 ;	-----------------------------------------
                                    287 ;	 function TIM2_CAP_COM_IRQHandler
                                    288 ;	-----------------------------------------
                                    289 ;	Register assignment is optimal.
                                    290 ;	Stack space usage: 0 bytes.
      00838A                        291 _TIM2_CAP_COM_IRQHandler:
                                    292 ;	./src/stm8s_it.c: 289: }
                                    293 ; genLabel
      00838A                        294 00101$:
                                    295 ; genEndFunction
      00838A 80               [11]  296 	iret
                                    297 ;	Total TIM2_CAP_COM_IRQHandler function size at codegen: 1 bytes.
                                    298 ;	./src/stm8s_it.c: 299: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    299 ; genLabel
                                    300 ;	-----------------------------------------
                                    301 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    302 ;	-----------------------------------------
                                    303 ;	Register assignment is optimal.
                                    304 ;	Stack space usage: 0 bytes.
      00838B                        305 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    306 ;	./src/stm8s_it.c: 304: }
                                    307 ; genLabel
      00838B                        308 00101$:
                                    309 ; genEndFunction
      00838B 80               [11]  310 	iret
                                    311 ;	Total TIM3_UPD_OVF_BRK_IRQHandler function size at codegen: 1 bytes.
                                    312 ;	./src/stm8s_it.c: 311: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    313 ; genLabel
                                    314 ;	-----------------------------------------
                                    315 ;	 function TIM3_CAP_COM_IRQHandler
                                    316 ;	-----------------------------------------
                                    317 ;	Register assignment is optimal.
                                    318 ;	Stack space usage: 0 bytes.
      00838C                        319 _TIM3_CAP_COM_IRQHandler:
                                    320 ;	./src/stm8s_it.c: 316: }
                                    321 ; genLabel
      00838C                        322 00101$:
                                    323 ; genEndFunction
      00838C 80               [11]  324 	iret
                                    325 ;	Total TIM3_CAP_COM_IRQHandler function size at codegen: 1 bytes.
                                    326 ;	./src/stm8s_it.c: 326: INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
                                    327 ; genLabel
                                    328 ;	-----------------------------------------
                                    329 ;	 function UART1_TX_IRQHandler
                                    330 ;	-----------------------------------------
                                    331 ;	Register assignment is optimal.
                                    332 ;	Stack space usage: 0 bytes.
      00838D                        333 _UART1_TX_IRQHandler:
                                    334 ;	./src/stm8s_it.c: 331: }
                                    335 ; genLabel
      00838D                        336 00101$:
                                    337 ; genEndFunction
      00838D 80               [11]  338 	iret
                                    339 ;	Total UART1_TX_IRQHandler function size at codegen: 1 bytes.
                                    340 ;	./src/stm8s_it.c: 338: INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
                                    341 ; genLabel
                                    342 ;	-----------------------------------------
                                    343 ;	 function UART1_RX_IRQHandler
                                    344 ;	-----------------------------------------
                                    345 ;	Register assignment is optimal.
                                    346 ;	Stack space usage: 0 bytes.
      00838E                        347 _UART1_RX_IRQHandler:
                                    348 ;	./src/stm8s_it.c: 343: }
                                    349 ; genLabel
      00838E                        350 00101$:
                                    351 ; genEndFunction
      00838E 80               [11]  352 	iret
                                    353 ;	Total UART1_RX_IRQHandler function size at codegen: 1 bytes.
                                    354 ;	./src/stm8s_it.c: 351: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    355 ; genLabel
                                    356 ;	-----------------------------------------
                                    357 ;	 function I2C_IRQHandler
                                    358 ;	-----------------------------------------
                                    359 ;	Register assignment is optimal.
                                    360 ;	Stack space usage: 0 bytes.
      00838F                        361 _I2C_IRQHandler:
                                    362 ;	./src/stm8s_it.c: 356: }
                                    363 ; genLabel
      00838F                        364 00101$:
                                    365 ; genEndFunction
      00838F 80               [11]  366 	iret
                                    367 ;	Total I2C_IRQHandler function size at codegen: 1 bytes.
                                    368 ;	./src/stm8s_it.c: 390: INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
                                    369 ; genLabel
                                    370 ;	-----------------------------------------
                                    371 ;	 function UART3_TX_IRQHandler
                                    372 ;	-----------------------------------------
                                    373 ;	Register assignment is optimal.
                                    374 ;	Stack space usage: 0 bytes.
      008390                        375 _UART3_TX_IRQHandler:
                                    376 ;	./src/stm8s_it.c: 395: }
                                    377 ; genLabel
      008390                        378 00101$:
                                    379 ; genEndFunction
      008390 80               [11]  380 	iret
                                    381 ;	Total UART3_TX_IRQHandler function size at codegen: 1 bytes.
                                    382 ;	./src/stm8s_it.c: 402: INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
                                    383 ; genLabel
                                    384 ;	-----------------------------------------
                                    385 ;	 function UART3_RX_IRQHandler
                                    386 ;	-----------------------------------------
                                    387 ;	Register assignment is optimal.
                                    388 ;	Stack space usage: 0 bytes.
      008391                        389 _UART3_RX_IRQHandler:
                                    390 ;	./src/stm8s_it.c: 407: }
                                    391 ; genLabel
      008391                        392 00101$:
                                    393 ; genEndFunction
      008391 80               [11]  394 	iret
                                    395 ;	Total UART3_RX_IRQHandler function size at codegen: 1 bytes.
                                    396 ;	./src/stm8s_it.c: 416: INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
                                    397 ; genLabel
                                    398 ;	-----------------------------------------
                                    399 ;	 function ADC2_IRQHandler
                                    400 ;	-----------------------------------------
                                    401 ;	Register assignment is optimal.
                                    402 ;	Stack space usage: 0 bytes.
      008392                        403 _ADC2_IRQHandler:
                                    404 ;	./src/stm8s_it.c: 422: return;
                                    405 ; genReturn
                                    406 ; genLabel
      008392                        407 00101$:
                                    408 ;	./src/stm8s_it.c: 424: }
                                    409 ; genEndFunction
      008392 80               [11]  410 	iret
                                    411 ;	Total ADC2_IRQHandler function size at codegen: 1 bytes.
                                    412 ;	./src/stm8s_it.c: 473: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    413 ; genLabel
                                    414 ;	-----------------------------------------
                                    415 ;	 function TIM4_UPD_OVF_IRQHandler
                                    416 ;	-----------------------------------------
                                    417 ;	Register assignment might be sub-optimal.
                                    418 ;	Stack space usage: 0 bytes.
      008393                        419 _TIM4_UPD_OVF_IRQHandler:
                                    420 ;	Reset bit 6 of reg CC. Hardware bug workaround.
      008393 62               [ 2]  421 	div	x, a
                                    422 ;	./src/stm8s_it.c: 475: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
                                    423 ; genSend
      008394 A6 01            [ 1]  424 	ld	a, #0x01
                                    425 ; genCall
      008396 CD 86 85         [ 4]  426 	call	_TIM4_ClearFlag
                                    427 ;	./src/stm8s_it.c: 476: miliseconds++;
                                    428 ; genAssign
      008399 CE 00 03         [ 2]  429 	ldw	x, _miliseconds+2
      00839C 90 CE 00 01      [ 2]  430 	ldw	y, _miliseconds+0
                                    431 ; genPlus
      0083A0 5C               [ 1]  432 	incw	x
      0083A1 26 02            [ 1]  433 	jrne	00103$
      0083A3 90 5C            [ 1]  434 	incw	y
      0083A5                        435 00103$:
                                    436 ; genAssign
      0083A5 CF 00 03         [ 2]  437 	ldw	_miliseconds+2, x
      0083A8 90 CF 00 01      [ 2]  438 	ldw	_miliseconds+0, y
                                    439 ; genLabel
      0083AC                        440 00101$:
                                    441 ;	./src/stm8s_it.c: 477: }
                                    442 ; genEndFunction
      0083AC 80               [11]  443 	iret
                                    444 ;	Total TIM4_UPD_OVF_IRQHandler function size at codegen: 24 bytes.
                                    445 ;	./src/stm8s_it.c: 485: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    446 ; genLabel
                                    447 ;	-----------------------------------------
                                    448 ;	 function EEPROM_EEC_IRQHandler
                                    449 ;	-----------------------------------------
                                    450 ;	Register assignment is optimal.
                                    451 ;	Stack space usage: 0 bytes.
      0083AD                        452 _EEPROM_EEC_IRQHandler:
                                    453 ;	./src/stm8s_it.c: 490: }
                                    454 ; genLabel
      0083AD                        455 00101$:
                                    456 ; genEndFunction
      0083AD 80               [11]  457 	iret
                                    458 ;	Total EEPROM_EEC_IRQHandler function size at codegen: 1 bytes.
                                    459 	.area CODE
                                    460 	.area CONST
                                    461 	.area INITIALIZER
                                    462 	.area CABS (ABS)

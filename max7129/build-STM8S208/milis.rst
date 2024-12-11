                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.4.4 #14992 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module milis
                                      6 	
                                      7 ;--------------------------------------------------------
                                      8 ; Public variables in this module
                                      9 ;--------------------------------------------------------
                                     10 	.globl _TIM4_ClearFlag
                                     11 	.globl _TIM4_ITConfig
                                     12 	.globl _TIM4_Cmd
                                     13 	.globl _TIM4_TimeBaseInit
                                     14 	.globl _ITC_SetSoftwarePriority
                                     15 	.globl _miliseconds
                                     16 	.globl _milis
                                     17 	.globl _init_milis
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area DATA
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area INITIALIZED
      000001                         26 _miliseconds::
      000001                         27 	.ds 4
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 
                                     33 ; default segment ordering for linker
                                     34 	.area HOME
                                     35 	.area GSINIT
                                     36 	.area GSFINAL
                                     37 	.area CONST
                                     38 	.area INITIALIZER
                                     39 	.area CODE
                                     40 
                                     41 ;--------------------------------------------------------
                                     42 ; global & static initialisations
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
                                     45 	.area GSINIT
                                     46 	.area GSFINAL
                                     47 	.area GSINIT
                                     48 ;--------------------------------------------------------
                                     49 ; Home
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area HOME
                                     53 ;--------------------------------------------------------
                                     54 ; code
                                     55 ;--------------------------------------------------------
                                     56 	.area CODE
                                     57 ;	./src/milis.c: 13: MILIS_PROTOTYPE
                                     58 ; genLabel
                                     59 ;	-----------------------------------------
                                     60 ;	 function milis
                                     61 ;	-----------------------------------------
                                     62 ;	Register assignment is optimal.
                                     63 ;	Stack space usage: 4 bytes.
      00833A                         64 _milis:
      00833A 52 04            [ 2]   65 	sub	sp, #4
                                     66 ;	./src/milis.c: 20: TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
                                     67 ; genIPush
      00833C 4B 00            [ 1]   68 	push	#0x00
                                     69 ; genSend
      00833E A6 01            [ 1]   70 	ld	a, #0x01
                                     71 ; genCall
      008340 CD 84 45         [ 4]   72 	call	_TIM4_ITConfig
                                     73 ;	./src/milis.c: 21: tmp = miliseconds;
                                     74 ; genAssign
      008343 CE 00 03         [ 2]   75 	ldw	x, _miliseconds+2
      008346 90 CE 00 01      [ 2]   76 	ldw	y, _miliseconds+0
      00834A 17 01            [ 2]   77 	ldw	(0x01, sp), y
                                     78 ;	./src/milis.c: 22: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
                                     79 ; genIPush
      00834C 89               [ 2]   80 	pushw	x
      00834D 4B 01            [ 1]   81 	push	#0x01
                                     82 ; genSend
      00834F A6 01            [ 1]   83 	ld	a, #0x01
                                     84 ; genCall
      008351 CD 84 45         [ 4]   85 	call	_TIM4_ITConfig
      008354 85               [ 2]   86 	popw	x
                                     87 ;	./src/milis.c: 23: return tmp;
                                     88 ; genReturn
      008355 16 01            [ 2]   89 	ldw	y, (0x01, sp)
                                     90 ; genLabel
      008357                         91 00101$:
                                     92 ;	./src/milis.c: 24: }
                                     93 ; genEndFunction
      008357 5B 04            [ 2]   94 	addw	sp, #4
      008359 81               [ 4]   95 	ret
                                     96 ;	Total milis function size at codegen: 32 bytes.
                                     97 ;	./src/milis.c: 27: void init_milis(void)
                                     98 ; genLabel
                                     99 ;	-----------------------------------------
                                    100 ;	 function init_milis
                                    101 ;	-----------------------------------------
                                    102 ;	Register assignment is optimal.
                                    103 ;	Stack space usage: 0 bytes.
      00835A                        104 _init_milis:
                                    105 ;	./src/milis.c: 29: TIM4_TimeBaseInit(PRESCALER, PERIOD);       // (16MHz / 128) / 125 = 1000Hz
                                    106 ; genIPush
      00835A 4B 7C            [ 1]  107 	push	#0x7c
                                    108 ; genSend
      00835C A6 07            [ 1]  109 	ld	a, #0x07
                                    110 ; genCall
      00835E CD 85 FD         [ 4]  111 	call	_TIM4_TimeBaseInit
                                    112 ;	./src/milis.c: 30: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
                                    113 ; genSend
      008361 A6 01            [ 1]  114 	ld	a, #0x01
                                    115 ; genCall
      008363 CD 86 85         [ 4]  116 	call	_TIM4_ClearFlag
                                    117 ;	./src/milis.c: 31: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
                                    118 ; genIPush
      008366 4B 01            [ 1]  119 	push	#0x01
                                    120 ; genSend
      008368 A6 01            [ 1]  121 	ld	a, #0x01
                                    122 ; genCall
      00836A CD 84 45         [ 4]  123 	call	_TIM4_ITConfig
                                    124 ;	./src/milis.c: 32: ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);     // nízká priorita pøerušení
                                    125 ; genIPush
      00836D 4B 01            [ 1]  126 	push	#0x01
                                    127 ; genSend
      00836F A6 17            [ 1]  128 	ld	a, #0x17
                                    129 ; genCall
      008371 CD 85 04         [ 4]  130 	call	_ITC_SetSoftwarePriority
                                    131 ;	./src/milis.c: 33: enableInterrupts();
                                    132 ;	genInline
      008374 9A               [ 1]  133 	rim
                                    134 ;	./src/milis.c: 34: TIM4_Cmd(ENABLE);
                                    135 ; genSend
      008375 A6 01            [ 1]  136 	ld	a, #0x01
                                    137 ; genCall
      008377 CC 84 D3         [ 2]  138 	jp	_TIM4_Cmd
                                    139 ; genLabel
      00837A                        140 00101$:
                                    141 ;	./src/milis.c: 35: }
                                    142 ; genEndFunction
      00837A 81               [ 4]  143 	ret
                                    144 ;	Total init_milis function size at codegen: 32 bytes.
                                    145 	.area CODE
                                    146 	.area CONST
                                    147 	.area INITIALIZER
      008095                        148 __xinit__miliseconds:
      008095 00 00 00 00            149 	.byte #0x00, #0x00, #0x00, #0x00	; 0
                                    150 	.area CABS (ABS)

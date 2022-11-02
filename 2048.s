;
; File generated by cc65 v 2.19 - Git 71d64a3
;
	.fopt		compiler,"cc65 v 2.19 - Git 71d64a3"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.export		_NMI_flag
	.export		_Frame_Count
	.export		_index
	.export		_joypad1
	.export		_joypad1old
	.export		_joypad1test
	.export		_joypad2
	.export		_joypad2old
	.export		_joypad2test
	.export		_needRedraw
	.export		_state
	.export		_fld
	.export		_x
	.export		_y
	.export		_stopGame
	.export		_field
	.export		_map
	.export		_PALETTE
	.export		_All_Off
	.export		_All_On
	.export		_Load_Palette
	.export		_move_logic
	.export		_drawScreen
	.import		_Wait_Vblank
	.import		_UnRLE
	.import		_Get_Input
	.import		_rand
	.import		_srand
	.export		_n1
	.export		_n2
	.export		_Screens
	.export		_GameOver
	.export		_YouWin
	.export		_putRandom
	.export		_initGame
	.export		_main
	.export		_shiftOne
	.export		_fillField
	.export		_fillChar
	.export		_mapField

.segment	"DATA"

_stopGame:
	.byte	$00
_map:
	.word	$0035
	.word	$003B
	.word	$0041
	.word	$0047
	.word	$008D
	.word	$0093
	.word	$0099
	.word	$009F
	.word	$00E5
	.word	$00EB
	.word	$00F1
	.word	$00F7
	.word	$013D
	.word	$0143
	.word	$0149
	.word	$014F
_n2:
	.byte	$0B
	.byte	$00
	.byte	$0B
	.byte	$4D
	.byte	$03
	.byte	$01
	.byte	$05
	.byte	$09
	.byte	$00
	.byte	$0B
	.byte	$31
	.byte	$13
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2C
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2C
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2C
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$15
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$02
	.byte	$3F
	.byte	$03
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$02
	.byte	$03
	.byte	$3F
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$02
	.byte	$03
	.byte	$04
	.byte	$3F
	.byte	$19
	.byte	$00
	.byte	$02
	.byte	$03
	.byte	$04
	.byte	$05
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$29
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2A
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2A
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2A
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$30
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$03
	.byte	$3F
	.byte	$04
	.byte	$05
	.byte	$19
	.byte	$00
	.byte	$03
	.byte	$04
	.byte	$3F
	.byte	$05
	.byte	$19
	.byte	$00
	.byte	$03
	.byte	$04
	.byte	$05
	.byte	$3F
	.byte	$19
	.byte	$00
	.byte	$03
	.byte	$04
	.byte	$05
	.byte	$06
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$29
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2A
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2A
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2A
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$30
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$04
	.byte	$3F
	.byte	$05
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$04
	.byte	$05
	.byte	$3F
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$04
	.byte	$05
	.byte	$06
	.byte	$3F
	.byte	$19
	.byte	$00
	.byte	$04
	.byte	$05
	.byte	$06
	.byte	$07
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$29
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2A
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2A
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$2A
	.byte	$14
	.byte	$0B
	.byte	$04
	.byte	$30
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$05
	.byte	$3F
	.byte	$06
	.byte	$07
	.byte	$19
	.byte	$00
	.byte	$05
	.byte	$06
	.byte	$3F
	.byte	$07
	.byte	$19
	.byte	$00
	.byte	$05
	.byte	$06
	.byte	$07
	.byte	$3F
	.byte	$19
	.byte	$00
	.byte	$05
	.byte	$06
	.byte	$07
	.byte	$08
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$19
	.byte	$00
	.byte	$0B
	.byte	$04
	.byte	$1A
	.byte	$00
	.byte	$0B
	.byte	$06
	.byte	$2D
	.byte	$2E
	.byte	$0B
	.byte	$04
	.byte	$2B
	.byte	$2E
	.byte	$0B
	.byte	$04
	.byte	$2B
	.byte	$2E
	.byte	$0B
	.byte	$04
	.byte	$2B
	.byte	$2E
	.byte	$0B
	.byte	$04
	.byte	$2F
	.byte	$00
	.byte	$0B
	.byte	$4E
	.byte	$35
	.byte	$33
	.byte	$36
	.byte	$37
	.byte	$00
	.byte	$32
	.byte	$38
	.byte	$37
	.byte	$39
	.byte	$3F
	.byte	$00
	.byte	$0B
	.byte	$D2
	.byte	$6A
	.byte	$9A
	.byte	$5A
	.byte	$6A
	.byte	$9A
	.byte	$5A
	.byte	$22
	.byte	$88
	.byte	$6A
	.byte	$9A
	.byte	$5A
	.byte	$6A
	.byte	$9A
	.byte	$5A
	.byte	$22
	.byte	$00
	.byte	$6A
	.byte	$9A
	.byte	$5A
	.byte	$6A
	.byte	$9A
	.byte	$5A
	.byte	$22
	.byte	$00
	.byte	$6A
	.byte	$9A
	.byte	$5A
	.byte	$6A
	.byte	$9A
	.byte	$5A
	.byte	$22
	.byte	$00
	.byte	$0A
	.byte	$0B
	.byte	$05
	.byte	$02
	.byte	$0A
	.byte	$00
	.byte	$0B
	.byte	$0D
	.byte	$00
	.byte	$0B
	.byte	$00

.segment	"RODATA"

_PALETTE:
	.byte	$0F
	.byte	$00
	.byte	$10
	.byte	$30
	.byte	$0F
	.byte	$01
	.byte	$11
	.byte	$21
	.byte	$0F
	.byte	$06
	.byte	$16
	.byte	$26
	.byte	$0F
	.byte	$09
	.byte	$19
	.byte	$38
_n1:
	.byte	$01
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$00
	.byte	$01
	.byte	$15
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$12
	.byte	$00
	.byte	$01
	.byte	$02
	.byte	$12
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$00
	.byte	$01
	.byte	$03
	.byte	$12
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$00
	.byte	$01
	.byte	$03
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$12
	.byte	$01
	.byte	$02
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$01
	.byte	$02
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$01
	.byte	$02
	.byte	$12
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$00
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$12
	.byte	$00
	.byte	$01
	.byte	$03
	.byte	$12
	.byte	$00
	.byte	$00
	.byte	$12
	.byte	$12
	.byte	$00
	.byte	$01
	.byte	$02
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$00
	.byte	$01
	.byte	$13
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$11
	.byte	$00
	.byte	$01
	.byte	$A9
	.byte	$21
	.byte	$39
	.byte	$37
	.byte	$40
	.byte	$40
	.byte	$00
	.byte	$00
	.byte	$40
	.byte	$31
	.byte	$33
	.byte	$39
	.byte	$31
	.byte	$00
	.byte	$01
	.byte	$70
	.byte	$13
	.byte	$14
	.byte	$01
	.byte	$11
	.byte	$15
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$19
	.byte	$00
	.byte	$1B
	.byte	$00
	.byte	$1C
	.byte	$1D
	.byte	$1E
	.byte	$1F
	.byte	$20
	.byte	$00
	.byte	$21
	.byte	$22
	.byte	$23
	.byte	$24
	.byte	$20
	.byte	$25
	.byte	$1D
	.byte	$26
	.byte	$00
	.byte	$1A
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$19
	.byte	$00
	.byte	$01
	.byte	$06
	.byte	$27
	.byte	$28
	.byte	$27
	.byte	$27
	.byte	$00
	.byte	$01
	.byte	$06
	.byte	$1A
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$16
	.byte	$17
	.byte	$01
	.byte	$11
	.byte	$18
	.byte	$00
	.byte	$01
	.byte	$44
	.byte	$AA
	.byte	$01
	.byte	$08
	.byte	$26
	.byte	$55
	.byte	$01
	.byte	$03
	.byte	$99
	.byte	$AA
	.byte	$AA
	.byte	$A6
	.byte	$A5
	.byte	$A5
	.byte	$A4
	.byte	$A5
	.byte	$A9
	.byte	$AA
	.byte	$01
	.byte	$08
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$02
	.byte	$00
	.byte	$01
	.byte	$02
	.byte	$0C
	.byte	$0F
	.byte	$0F
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$00
_Screens:
	.addr	_n1
	.addr	_n2

.segment	"BSS"

.segment	"ZEROPAGE"
_NMI_flag:
	.res	1,$00
_Frame_Count:
	.res	1,$00
_index:
	.res	1,$00
_joypad1:
	.res	1,$00
_joypad1old:
	.res	1,$00
_joypad1test:
	.res	1,$00
_joypad2:
	.res	1,$00
_joypad2old:
	.res	1,$00
_joypad2test:
	.res	1,$00
_needRedraw:
	.res	1,$00
_state:
	.res	1,$00
_fld:
	.res	4,$00
_x:
	.res	1,$00
_y:
	.res	1,$00
_field:
	.res	16,$00

; ---------------------------------------------------------------
; void __near__ All_Off (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_All_Off: near

.segment	"CODE"

;
; PPU_CTRL = 0;
;
	lda     #$00
	sta     $2000
;
; PPU_MASK = 0;
;
	sta     $2001
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ All_On (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_All_On: near

.segment	"CODE"

;
; PPU_CTRL = 0x90; // screen is on, NMI on
;
	lda     #$90
	sta     $2000
;
; PPU_MASK = 0x1e;
;
	lda     #$1E
	sta     $2001
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ Load_Palette (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Load_Palette: near

.segment	"CODE"

;
; All_Off();
;
	jsr     _All_Off
;
; PPU_ADDRESS = 0x3f;
;
	lda     #$3F
	sta     $2006
;
; PPU_ADDRESS = 0x00;
;
	lda     #$00
	sta     $2006
;
; for (index = 0; index < sizeof(PALETTE); ++index) PPU_DATA = PALETTE[index];
;
	sta     _index
L0007:	lda     _index
	cmp     #$10
	bcs     L0003
	ldy     _index
	lda     _PALETTE,y
	sta     $2007
	inc     _index
	jmp     L0007
;
; All_On();
;
L0003:	jmp     _All_On

.endproc

; ---------------------------------------------------------------
; void __near__ move_logic (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_move_logic: near

.segment	"CODE"

;
; Get_Input();
;
	jsr     _Get_Input
;
; if ((state == 1) && (stopGame == 0)) {
;
	lda     _state
	cmp     #$01
	jne     L004C
	lda     _stopGame
	jne     L004C
;
; if (((joypad1 & RIGHT) != 0) && ((joypad1old & RIGHT) == 0)) { 
;
	lda     _joypad1
	and     #$01
	beq     L003D
	lda     _joypad1old
	and     #$01
	bne     L003D
;
; for (index = 0; index < 4; ++index) fillField(0, 1, 2, 3, index, index, index, index);
;
	sta     _index
L003C:	lda     _index
	cmp     #$04
	bcs     L000D
	jsr     decsp7
	lda     #$00
	ldy     #$06
	sta     (sp),y
	lda     #$01
	dey
	sta     (sp),y
	lda     #$02
	dey
	sta     (sp),y
	lda     #$03
	dey
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	lda     _index
	jsr     _fillField
	inc     _index
	jmp     L003C
;
; putRandom();
;
L000D:	jsr     _putRandom
;
; if (((joypad1 & LEFT) != 0) && ((joypad1old & LEFT) == 0)) { 
;
L003D:	lda     _joypad1
	and     #$02
	beq     L0042
	lda     _joypad1old
	and     #$02
	bne     L0042
;
; for (index = 0; index < 4; ++index) fillField(3, 2, 1, 0, index, index, index, index);
;
	sta     _index
L0041:	lda     _index
	cmp     #$04
	bcs     L0017
	jsr     decsp7
	lda     #$03
	ldy     #$06
	sta     (sp),y
	lda     #$02
	dey
	sta     (sp),y
	lda     #$01
	dey
	sta     (sp),y
	lda     #$00
	dey
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	lda     _index
	jsr     _fillField
	inc     _index
	jmp     L0041
;
; putRandom();
;
L0017:	jsr     _putRandom
;
; if (((joypad1 & DOWN) != 0) && ((joypad1old & DOWN) == 0)) { 
;
L0042:	lda     _joypad1
	and     #$04
	beq     L0047
	lda     _joypad1old
	and     #$04
	bne     L0047
;
; for (index = 0; index < 4; ++index) fillField(index, index, index, index, 0, 1, 2, 3);
;
	sta     _index
L0046:	lda     _index
	cmp     #$04
	bcs     L0021
	jsr     decsp7
	lda     _index
	ldy     #$06
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	lda     #$00
	dey
	sta     (sp),y
	lda     #$01
	dey
	sta     (sp),y
	lda     #$02
	dey
	sta     (sp),y
	lda     #$03
	jsr     _fillField
	inc     _index
	jmp     L0046
;
; putRandom();
;
L0021:	jsr     _putRandom
;
; if (((joypad1 & UP) != 0) && ((joypad1old & UP) == 0)) { 
;
L0047:	lda     _joypad1
	and     #$08
	beq     L004C
	lda     _joypad1old
	and     #$08
	bne     L004C
;
; for (index = 0; index < 4; ++index) fillField(index, index, index, index, 3, 2, 1, 0);
;
	sta     _index
L004B:	lda     _index
	cmp     #$04
	bcs     L002B
	jsr     decsp7
	lda     _index
	ldy     #$06
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	lda     _index
	dey
	sta     (sp),y
	tya
	dey
	sta     (sp),y
	tya
	dey
	sta     (sp),y
	tya
	dey
	sta     (sp),y
	tya
	jsr     _fillField
	inc     _index
	jmp     L004B
;
; putRandom();
;
L002B:	jsr     _putRandom
;
; if (((joypad1 & START) != 0) && ((joypad1old & START) == 0)) {
;
L004C:	lda     _joypad1
	and     #$10
	beq     L004E
	lda     _joypad1old
	and     #$10
	beq     L004F
L004E:	rts
;
; if ((state != 1) || (stopGame == 1)) {
;
L004F:	lda     _state
	cmp     #$01
	bne     L0051
	lda     _stopGame
	cmp     #$01
	beq     L0051
	rts
;
; initGame();
;
L0051:	jsr     _initGame
;
; state = 1;
;
	lda     #$01
	sta     _state
;
; needRedraw = 1;
;
	sta     _needRedraw
;
; stopGame = 0;
;
	lda     #$00
	sta     _stopGame
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ drawScreen (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_drawScreen: near

.segment	"CODE"

;
; All_Off();
;
	jsr     _All_Off
;
; PPU_ADDRESS = 0x20;
;
	lda     #$20
	sta     $2006
;
; PPU_ADDRESS = 0x00;
;
	lda     #$00
	sta     $2006
;
; if (state == 1) {
;
	tax
	lda     _state
	cmp     #$01
	bne     L0013
;
; index = 0;
;
	txa
	sta     _index
;
; for (y = 0; y <= 3; y++) {
;
	sta     _y
L0010:	lda     _y
	cmp     #$04
	bcs     L0013
;
; for (x = 0; x <= 3; x++) {
;
	lda     #$00
	sta     _x
	tax
L0011:	lda     _x
	cmp     #$04
	bcs     L0012
;
; mapField(field[x][y], map[index]);
;
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     _y
	lda     (ptr1),y
	jsr     pusha
	ldx     #$00
	lda     _index
	asl     a
	bcc     L000E
	inx
	clc
L000E:	adc     #<(_map)
	sta     ptr1
	txa
	adc     #>(_map)
	sta     ptr1+1
	ldy     #$01
	lda     (ptr1),y
	tax
	dey
	lda     (ptr1),y
	jsr     _mapField
;
; index++;
;
	inc     _index
;
; for (x = 0; x <= 3; x++) {
;
	ldx     #$00
	inc     _x
	jmp     L0011
;
; for (y = 0; y <= 3; y++) {
;
L0012:	inc     _y
	jmp     L0010
;
; UnRLE(Screens[state]);
;
L0013:	lda     _state
	asl     a
	bcc     L000F
	ldx     #$01
	clc
L000F:	adc     #<(_Screens)
	sta     ptr1
	txa
	adc     #>(_Screens)
	sta     ptr1+1
	ldy     #$01
	lda     (ptr1),y
	tax
	dey
	lda     (ptr1),y
	jsr     _UnRLE
;
; Wait_Vblank();  
;
	jsr     _Wait_Vblank
;
; All_On();
;
	jsr     _All_On
;
; needRedraw = 0;
;
	lda     #$00
	sta     _needRedraw
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ GameOver (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_GameOver: near

.segment	"CODE"

;
; stopGame = 1;
;
	lda     #$01
	sta     _stopGame
;
; needRedraw = 1;
;
	sta     _needRedraw
;
; n2[383] = 0x35;
;
	lda     #$35
	sta     _n2+383
;
; n2[384] = 0x33;
;
	lda     #$33
	sta     _n2+384
;
; n2[385] = 0x36;
;
	lda     #$36
	sta     _n2+385
;
; n2[386] = 0x37;
;
	lda     #$37
	sta     _n2+386
;
; n2[387] = 0x00;
;
	lda     #$00
	sta     _n2+387
;
; n2[388] = 0x32;
;
	lda     #$32
	sta     _n2+388
;
; n2[389] = 0x38;
;
	lda     #$38
	sta     _n2+389
;
; n2[390] = 0x37;
;
	lda     #$37
	sta     _n2+390
;
; n2[391] = 0x39;
;
	lda     #$39
	sta     _n2+391
;
; n2[392] = 0x3f;
;
	lda     #$3F
	sta     _n2+392
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ YouWin (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_YouWin: near

.segment	"CODE"

;
; stopGame = 1;
;
	lda     #$01
	sta     _stopGame
;
; needRedraw = 1;
;
	sta     _needRedraw
;
; n2[384] = 0x3a;
;
	lda     #$3A
	sta     _n2+384
;
; n2[385] = 0x32;
;
	lda     #$32
	sta     _n2+385
;
; n2[386] = 0x3b;
;
	lda     #$3B
	sta     _n2+386
;
; n2[387] = 0x00;
;
	lda     #$00
	sta     _n2+387
;
; n2[388] = 0x3c;
;
	lda     #$3C
	sta     _n2+388
;
; n2[389] = 0x3d;
;
	lda     #$3D
	sta     _n2+389
;
; n2[390] = 0x3e;
;
	lda     #$3E
	sta     _n2+390
;
; n2[391] = 0x3f;
;
	lda     #$3F
	sta     _n2+391
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ putRandom (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_putRandom: near

.segment	"CODE"

;
; index = 0;
;
	lda     #$00
	sta     _index
;
; for (y = 0; y <= 3; y++) {
;
	sta     _y
L001A:	lda     _y
	cmp     #$04
	bcs     L001E
;
; for (x = 0; x <= 3; x++) {
;
	lda     #$00
	sta     _x
L001B:	lda     _x
	cmp     #$04
	bcs     L001D
;
; if (field[x][y] > 0) index++;
;
	ldx     #$00
	lda     _x
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     _y
	lda     (ptr1),y
	beq     L001C
	inc     _index
;
; for (x = 0; x <= 3; x++) {
;
L001C:	inc     _x
	jmp     L001B
;
; for (y = 0; y <= 3; y++) {
;
L001D:	inc     _y
	jmp     L001A
;
; if (index == 16) {
;
L001E:	lda     _index
	cmp     #$10
	bne     L000D
;
; GameOver(); 
;
	jsr     _GameOver
;
; } else {
;
	jmp     L001F
;
; x = rand() % 4;
;
L000D:	jsr     _rand
	jsr     pushax
	ldx     #$00
	lda     #$04
	jsr     tosmoda0
	sta     _x
;
; y = rand() % 4;
;
	jsr     _rand
	jsr     pushax
	ldx     #$00
	lda     #$04
	jsr     tosmoda0
	sta     _y
;
; while (field[x][y] > 0) {
;
	ldx     #$00
	lda     _x
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     _y
	lda     (ptr1),y
	bne     L000D
;
; if (state == 1) {
;
	lda     _state
	cmp     #$01
	bne     L001F
;
; if (rand() % 4 == 0) {
;
	jsr     _rand
	jsr     pushax
	ldx     #$00
	lda     #$04
	jsr     tosmoda0
	cpx     #$00
	bne     L0011
	cmp     #$00
	bne     L0021
;
; field[x][y] = 2;
;
	lda     _x
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     _y
	lda     #$02
;
; } else {
;
	jmp     L0019
;
; field[x][y] = 1;
;
L0011:	ldx     #$00
L0021:	lda     _x
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     _y
	lda     #$01
L0019:	sta     (ptr1),y
;
; needRedraw = 1;
;
L001F:	lda     #$01
	sta     _needRedraw
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ initGame (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_initGame: near

.segment	"CODE"

;
; stopGame = 1;
;
	jsr     decsp2
	lda     #$01
	sta     _stopGame
;
; srand(Frame_Count);
;
	ldx     #$00
	lda     _Frame_Count
	jsr     _srand
;
; for (y = 0; y <= 3; y++) {
;
	lda     #$00
	sta     _y
L0010:	lda     _y
	cmp     #$04
	bcs     L0003
;
; for (x = 0; x <= 3; x++) {
;
	lda     #$00
	sta     _x
L0011:	lda     _x
	cmp     #$04
	bcs     L0012
;
; field[x][y] = 0x00;
;
	ldx     #$00
	lda     _x
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     _y
	lda     #$00
	sta     (ptr1),y
;
; for (x = 0; x <= 3; x++) {
;
	inc     _x
	jmp     L0011
;
; for (y = 0; y <= 3; y++) {
;
L0012:	inc     _y
	jmp     L0010
;
; for (t = 383; t <= 392; t++) n2[t] = 0x00;
;
L0003:	ldy     #$00
	lda     #$7F
	sta     (sp),y
	lda     #$01
	iny
	sta     (sp),y
L000A:	ldy     #$01
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	cmp     #$89
	txa
	sbc     #$01
	bvc     L000E
	eor     #$80
L000E:	bpl     L0013
	iny
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	clc
	adc     #<(_n2)
	sta     ptr1
	txa
	adc     #>(_n2)
	sta     ptr1+1
	tya
	sta     (ptr1),y
	tax
	lda     #$01
	jsr     addeq0sp
	jmp     L000A
;
; state = 1;
;
L0013:	lda     #$01
	sta     _state
;
; putRandom();
;
	jsr     _putRandom
;
; putRandom();
;
	jsr     _putRandom
;
; state = 0;
;
	lda     #$00
	sta     _state
;
; }
;
	jmp     incsp2

.endproc

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; initGame();
;
	jsr     _initGame
;
; Load_Palette();
;
	jsr     _Load_Palette
;
; state = 0; // ������ ����
;
	lda     #$00
	sta     _state
;
; needRedraw = 1;
;
	lda     #$01
	sta     _needRedraw
;
; while (NMI_flag == 0); 
;
L0009:	lda     _NMI_flag
	beq     L0009
;
; move_logic();
;
	jsr     _move_logic
;
; if (needRedraw != 0) drawScreen();
;
	lda     _needRedraw
	beq     L000B
	jsr     _drawScreen
;
; NMI_flag = 0;
;
	lda     #$00
L000B:	sta     _NMI_flag
;
; while (1){  
;
	jmp     L0009

.endproc

; ---------------------------------------------------------------
; void __near__ shiftOne (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_shiftOne: near

.segment	"CODE"

;
; if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
;
	lda     _fld+3
	bne     L0008
	lda     _fld+2
	sta     _fld+3
	lda     #$00
	sta     _fld+2
;
; if (fld[2] == 0) { fld[2] = fld[1]; fld[1] = 0; }
;
L0008:	lda     _fld+2
	bne     L0009
	lda     _fld+1
	sta     _fld+2
	lda     #$00
	sta     _fld+1
;
; if (fld[1] == 0) { fld[1] = fld[0]; fld[0] = 0; }
;
L0009:	lda     _fld+1
	bne     L000A
	lda     _fld
	sta     _fld+1
	lda     #$00
	sta     _fld
;
; if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
;
L000A:	lda     _fld+3
	bne     L000B
	lda     _fld+2
	sta     _fld+3
	lda     #$00
	sta     _fld+2
;
; if (fld[2] == 0) { fld[2] = fld[1]; fld[1] = 0; }
;
L000B:	lda     _fld+2
	bne     L000C
	lda     _fld+1
	sta     _fld+2
	lda     #$00
	sta     _fld+1
;
; if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
;
L000C:	lda     _fld+3
	bne     L0007
	lda     _fld+2
	sta     _fld+3
	lda     #$00
	sta     _fld+2
;
; }
;
L0007:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ fillField (unsigned char x0, unsigned char x1, unsigned char x2, unsigned char x3, unsigned char y0, unsigned char y1, unsigned char y2, unsigned char y3)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_fillField: near

.segment	"CODE"

;
; void fillField(unsigned char x0, unsigned char x1, unsigned char x2, unsigned char x3, unsigned char y0, unsigned char y1, unsigned char y2, unsigned char y3) {
;
	jsr     pusha
;
; fld[0] = field[x0][y0];
;
	ldy     #$07
	ldx     #$00
	lda     (sp),y
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     #$03
	lda     (sp),y
	tay
	lda     (ptr1),y
	sta     _fld
;
; fld[1] = field[x1][y1];
;
	ldy     #$06
	ldx     #$00
	lda     (sp),y
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     #$02
	lda     (sp),y
	tay
	lda     (ptr1),y
	sta     _fld+1
;
; fld[2] = field[x2][y2];
;
	ldy     #$05
	ldx     #$00
	lda     (sp),y
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     #$01
	lda     (sp),y
	tay
	lda     (ptr1),y
	sta     _fld+2
;
; fld[3] = field[x3][y3];
;
	ldy     #$04
	ldx     #$00
	lda     (sp),y
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     #$00
	lda     (sp),y
	tay
	lda     (ptr1),y
	sta     _fld+3
;
; shiftOne();
;
	jsr     _shiftOne
;
; if ((fld[2] == fld[3]) && (fld[2] > 0)) { fld[2]++; fld[3] = 0; if (fld[2] == 11) YouWin(); }
;
	lda     _fld+2
	cmp     _fld+3
	bne     L0017
	lda     _fld+2
	beq     L0017
	inc     _fld+2
	lda     #$00
	sta     _fld+3
	lda     _fld+2
	cmp     #$0B
	bne     L0017
	jsr     _YouWin
;
; if ((fld[1] == fld[2]) && (fld[1] > 0)) { fld[1]++; fld[2] = 0; if (fld[1] == 11) YouWin(); }
;
L0017:	lda     _fld+1
	cmp     _fld+2
	bne     L001A
	lda     _fld+1
	beq     L001A
	inc     _fld+1
	lda     #$00
	sta     _fld+2
	lda     _fld+1
	cmp     #$0B
	bne     L001A
	jsr     _YouWin
;
; if ((fld[0] == fld[1]) && (fld[0] > 0)) { fld[0]++; fld[1] = 0; if (fld[0] == 11) YouWin(); }
;
L001A:	lda     _fld
	cmp     _fld+1
	bne     L0010
	lda     _fld
	beq     L0010
	inc     _fld
	lda     #$00
	sta     _fld+1
	lda     _fld
	cmp     #$0B
	bne     L0010
	jsr     _YouWin
;
; shiftOne();
;
L0010:	jsr     _shiftOne
;
; field[x0][y0] = fld[0];
;
	ldy     #$07
	ldx     #$00
	lda     (sp),y
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     #$03
	lda     (sp),y
	clc
	adc     ptr1
	ldx     ptr1+1
	bcc     L0011
	inx
L0011:	sta     ptr1
	stx     ptr1+1
	lda     _fld
	ldy     #$00
	sta     (ptr1),y
;
; field[x1][y1] = fld[1];
;
	ldy     #$06
	ldx     #$00
	lda     (sp),y
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     #$02
	lda     (sp),y
	clc
	adc     ptr1
	ldx     ptr1+1
	bcc     L0012
	inx
L0012:	sta     ptr1
	stx     ptr1+1
	lda     _fld+1
	ldy     #$00
	sta     (ptr1),y
;
; field[x2][y2] = fld[2];
;
	ldy     #$05
	ldx     #$00
	lda     (sp),y
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     #$01
	lda     (sp),y
	clc
	adc     ptr1
	ldx     ptr1+1
	bcc     L0013
	inx
L0013:	sta     ptr1
	stx     ptr1+1
	lda     _fld+2
	dey
	sta     (ptr1),y
;
; field[x3][y3] = fld[3];
;
	ldy     #$04
	ldx     #$00
	lda     (sp),y
	jsr     aslax2
	clc
	adc     #<(_field)
	sta     ptr1
	txa
	adc     #>(_field)
	sta     ptr1+1
	ldy     #$00
	lda     (sp),y
	clc
	adc     ptr1
	ldx     ptr1+1
	bcc     L0014
	inx
L0014:	sta     ptr1
	stx     ptr1+1
	lda     _fld+3
	sta     (ptr1),y
;
; }
;
	jmp     incsp8

.endproc

; ---------------------------------------------------------------
; void __near__ fillChar (int adr, unsigned char x0, unsigned char x1, unsigned char x2, unsigned char x3)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_fillChar: near

.segment	"CODE"

;
; void fillChar(int adr, unsigned char x0, unsigned char x1, unsigned char x2, unsigned char x3) {
;
	jsr     pusha
;
; n2[adr + 0] = x0;
;
	ldy     #$05
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	clc
	adc     #<(_n2)
	sta     ptr1
	txa
	adc     #>(_n2)
	sta     ptr1+1
	dey
	lda     (sp),y
	ldy     #$00
	sta     (ptr1),y
;
; n2[adr + 1] = x1;
;
	ldy     #$05
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	clc
	adc     #$01
	bcc     L0005
	inx
	clc
L0005:	adc     #<(_n2)
	sta     ptr1
	txa
	adc     #>(_n2)
	sta     ptr1+1
	ldy     #$02
	lda     (sp),y
	ldy     #$00
	sta     (ptr1),y
;
; n2[adr + 2] = x2;
;
	ldy     #$05
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	clc
	adc     #$02
	bcc     L0006
	inx
	clc
L0006:	adc     #<(_n2)
	sta     ptr1
	txa
	adc     #>(_n2)
	sta     ptr1+1
	ldy     #$01
	lda     (sp),y
	dey
	sta     (ptr1),y
;
; n2[adr + 3] = x3;
;
	ldy     #$05
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	clc
	adc     #$03
	bcc     L0007
	inx
	clc
L0007:	adc     #<(_n2)
	sta     ptr1
	txa
	adc     #>(_n2)
	sta     ptr1+1
	ldy     #$00
	lda     (sp),y
	sta     (ptr1),y
;
; }
;
	jmp     incsp6

.endproc

; ---------------------------------------------------------------
; void __near__ mapField (unsigned char n, int adr)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_mapField: near

.segment	"CODE"

;
; void mapField(unsigned char n, int adr) {
;
	jsr     pushax
;
; fillChar(adr, 0x00, 0x00, 0x00, 0x00);    // ������� ����
;
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$00
	ldy     #$02
	sta     (sp),y
	dey
	sta     (sp),y
	dey
	sta     (sp),y
	jsr     _fillChar
;
; if (n ==  1) fillChar(adr, 0x00, 0x00, 0x00, 0x03); // 2
;
	ldy     #$02
	lda     (sp),y
	cmp     #$01
	bne     L000E
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$00
	ldy     #$02
	sta     (sp),y
	dey
	sta     (sp),y
	dey
	sta     (sp),y
	lda     #$03
	jsr     _fillChar
;
; if (n ==  2) fillChar(adr, 0x00, 0x00, 0x00, 0x05); // 4
;
	ldy     #$02
L000E:	lda     (sp),y
	cmp     #$02
	bne     L0010
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$00
	ldy     #$02
	sta     (sp),y
	dey
	sta     (sp),y
	dey
	sta     (sp),y
	lda     #$05
	jsr     _fillChar
;
; if (n ==  3) fillChar(adr, 0x00, 0x00, 0x00, 0x09); // 8
;
	ldy     #$02
L0010:	lda     (sp),y
	cmp     #$03
	bne     L0012
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$00
	ldy     #$02
	sta     (sp),y
	dey
	sta     (sp),y
	dey
	sta     (sp),y
	lda     #$09
	jsr     _fillChar
;
; if (n ==  4) fillChar(adr, 0x00, 0x00, 0x02, 0x07); // 16
;
	ldy     #$02
L0012:	lda     (sp),y
	cmp     #$04
	bne     L0014
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$00
	ldy     #$02
	sta     (sp),y
	dey
	sta     (sp),y
	lda     #$02
	dey
	sta     (sp),y
	lda     #$07
	jsr     _fillChar
;
; if (n ==  5) fillChar(adr, 0x00, 0x00, 0x04, 0x03); // 32
;
	ldy     #$02
L0014:	lda     (sp),y
	cmp     #$05
	bne     L0016
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$00
	ldy     #$02
	sta     (sp),y
	dey
	sta     (sp),y
	lda     #$04
	dey
	sta     (sp),y
	lda     #$03
	jsr     _fillChar
;
; if (n ==  6) fillChar(adr, 0x00, 0x00, 0x07, 0x05); // 64
;
	ldy     #$02
L0016:	lda     (sp),y
	cmp     #$06
	bne     L0018
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$00
	ldy     #$02
	sta     (sp),y
	dey
	sta     (sp),y
	lda     #$07
	dey
	sta     (sp),y
	lda     #$05
	jsr     _fillChar
;
; if (n ==  7) fillChar(adr, 0x00, 0x02, 0x03, 0x09); // 128
;
	ldy     #$02
L0018:	lda     (sp),y
	cmp     #$07
	bne     L001A
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$00
	ldy     #$02
	sta     (sp),y
	tya
	dey
	sta     (sp),y
	lda     #$03
	dey
	sta     (sp),y
	lda     #$09
	jsr     _fillChar
;
; if (n ==  8) fillChar(adr, 0x00, 0x03, 0x06, 0x07); // 256
;
	ldy     #$02
L001A:	lda     (sp),y
	cmp     #$08
	bne     L001C
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$00
	ldy     #$02
	sta     (sp),y
	lda     #$03
	dey
	sta     (sp),y
	lda     #$06
	dey
	sta     (sp),y
	lda     #$07
	jsr     _fillChar
;
; if (n ==  9) fillChar(adr, 0x00, 0x06, 0x02, 0x03); // 512
;
	ldy     #$02
L001C:	lda     (sp),y
	cmp     #$09
	bne     L001E
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$00
	ldy     #$02
	sta     (sp),y
	lda     #$06
	dey
	sta     (sp),y
	lda     #$02
	dey
	sta     (sp),y
	lda     #$03
	jsr     _fillChar
;
; if (n == 10) fillChar(adr, 0x02, 0x01, 0x03, 0x05); // 1024
;
	ldy     #$02
L001E:	lda     (sp),y
	cmp     #$0A
	bne     L0020
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$02
	tay
	sta     (sp),y
	lda     #$01
	dey
	sta     (sp),y
	lda     #$03
	dey
	sta     (sp),y
	lda     #$05
	jsr     _fillChar
;
; if (n == 11) fillChar(adr, 0x03, 0x01, 0x05, 0x09); // 2048
;
	ldy     #$02
L0020:	lda     (sp),y
	cmp     #$0B
	bne     L000C
	jsr     decsp5
	ldy     #$06
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     #$03
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$03
	ldy     #$02
	sta     (sp),y
	lda     #$01
	dey
	sta     (sp),y
	lda     #$05
	dey
	sta     (sp),y
	lda     #$09
	jsr     _fillChar
;
; }
;
L000C:	jmp     incsp3

.endproc


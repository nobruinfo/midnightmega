	.text
	.zeropage	__rc0
	.zeropage	__rc1
	.zeropage	__rc2
	.zeropage	__rc3
	.zeropage	__rc4
	.zeropage	__rc5
	.zeropage	__rc6
	.zeropage	__rc7
	.zeropage	__rc8
	.zeropage	__rc9
	.zeropage	__rc10
	.zeropage	__rc11
	.zeropage	__rc12
	.zeropage	__rc13
	.zeropage	__rc14
	.zeropage	__rc15
	.zeropage	__rc16
	.zeropage	__rc17
	.zeropage	__rc18
	.zeropage	__rc19
	.zeropage	__rc20
	.zeropage	__rc21
	.zeropage	__rc22
	.zeropage	__rc23
	.zeropage	__rc24
	.zeropage	__rc25
	.zeropage	__rc26
	.zeropage	__rc27
	.zeropage	__rc28
	.zeropage	__rc29
	.zeropage	__rc30
	.zeropage	__rc31
	.file	"ld-temp.o"
	.section	.text.mprintf,"ax",@progbits
	.type	mprintf,@function               ; -- Begin function mprintf
mprintf:                                ; @mprintf
; %bb.0:
	sta	mos8(.Lmprintf_zp_stk+1)
	stx	__rc8
	ldy	__rc4
	ldx	__rc5
	stx	mos8(.Lmprintf_zp_stk+3)
	ldx	__rc2
	stx	__rc4
	ldx	__rc3
	stx	__rc5
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldx	#52
	stx	__rc6
	ldx	#3
	stx	__rc7
	bra	.LBB0_7
.LBB0_1:                                ;   in Loop: Header=BB0_7 Depth=1
	cmp	#192
	bcc	.LBB0_3
; %bb.2:                                ;   in Loop: Header=BB0_7 Depth=1
	eor	#128
	bra	.LBB0_4
.LBB0_3:                                ;   in Loop: Header=BB0_7 Depth=1
	clc
	adc	#224
.LBB0_4:                                ;   in Loop: Header=BB0_7 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB0_6
; %bb.5:                                ;   in Loop: Header=BB0_7 Depth=1
	inc	__rc7
.LBB0_6:                                ;   in Loop: Header=BB0_7 Depth=1
	tax
	beq	.LBB0_12
.LBB0_7:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB0_9
; %bb.8:                                ;   in Loop: Header=BB0_7 Depth=1
	inc	__rc5
.LBB0_9:                                ;   in Loop: Header=BB0_7 Depth=1
	cmp	#64
	bcc	.LBB0_4
; %bb.10:                               ;   in Loop: Header=BB0_7 Depth=1
	cmp	#96
	bcs	.LBB0_1
; %bb.11:                               ;   in Loop: Header=BB0_7 Depth=1
	clc
	adc	#192
	bra	.LBB0_4
.LBB0_12:
	ldx	#9
	stx	mos8(.Lmprintf_zp_stk+20)       ; 1-byte Folded Spill
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	phy
	ldy	__rc8
	sty	mos8(.Lmprintf_zp_stk)
	ply
	sty	mos8(.Lmprintf_zp_stk+2)
	jsr	cputsxy
	ldx	mos8(.Lmprintf_zp_stk+2)
	stx	__rc2
	ldx	mos8(.Lmprintf_zp_stk)
	stz	mos8(.Lmprintf_zp_stk+15)
	stz	mos8(.Lmprintf_zp_stk)
	ldy	mos8(.Lmprintf_zp_stk+3)
	sty	__rc3
.LBB0_13:                               ; =>This Inner Loop Header: Depth=1
	ldy	#mos8(.Lmprintf_zp_stk+16)
	sty	__rc8
	ldy	#mos8(0)
	sty	__rc9
	ldy	#10
	sty	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	lda	mos8(.Lmprintf_zp_stk+1)
	stx	mos8(.Lmprintf_zp_stk+2)
	ldy	__rc2
	sty	mos8(.Lmprintf_zp_stk+4)
	ldy	__rc3
	sty	mos8(.Lmprintf_zp_stk+3)
	jsr	__udivmodsi4
	sta	__rc7
	stx	__rc5
	lda	#15
	and	mos8(.Lmprintf_zp_stk+16)
	tay
	lda	mos8(hexDigits),y
	ldy	mos8(.Lmprintf_zp_stk+20)       ; 1-byte Folded Reload
	sty	__rc4
	dec	__rc4
	sta	mos8(.Lmprintf_zp_stk+5),y
	lda	mos8(.Lmprintf_zp_stk+3)
	bne	.LBB0_17
; %bb.14:                               ;   in Loop: Header=BB0_13 Depth=1
	lda	mos8(.Lmprintf_zp_stk+4)
	bne	.LBB0_18
; %bb.15:                               ;   in Loop: Header=BB0_13 Depth=1
	ldy	mos8(.Lmprintf_zp_stk+2)
	bne	.LBB0_21
; %bb.16:                               ;   in Loop: Header=BB0_13 Depth=1
	ldy	mos8(.Lmprintf_zp_stk+1)
	cpy	#10
	bra	.LBB0_20
.LBB0_17:                               ;   in Loop: Header=BB0_13 Depth=1
	ldx	mos8(.Lmprintf_zp_stk+3)
	bra	.LBB0_19
.LBB0_18:                               ;   in Loop: Header=BB0_13 Depth=1
	ldx	mos8(.Lmprintf_zp_stk+4)
.LBB0_19:                               ;   in Loop: Header=BB0_13 Depth=1
	cpx	#0
.LBB0_20:                               ;   in Loop: Header=BB0_13 Depth=1
	ldx	__rc7
	stx	mos8(.Lmprintf_zp_stk+1)
	ldx	__rc5
	ldy	__rc4
	sty	mos8(.Lmprintf_zp_stk+20)       ; 1-byte Folded Spill
	bcc	.LBB0_22
; %bb.25:                               ;   in Loop: Header=BB0_13 Depth=1
	jmp	.LBB0_13
.LBB0_21:                               ;   in Loop: Header=BB0_13 Depth=1
	cpy	#0
	bra	.LBB0_20
.LBB0_22:
	lda	#mos8(.Lmprintf_zp_stk+5)
	clc
	adc	__rc4
	sta	__rc2
	lda	#mos8(0)
	adc	#0
	sta	__rc3
	inc	__rc2
	bne	.LBB0_24
; %bb.23:
	inc	__rc3
.LBB0_24:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end0:
	.size	mprintf, .Lfunc_end0-mprintf
                                        ; -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            ; -- Begin function main
	.type	main,@function
main:                                   ; @main
; %bb.0:
	clc
	lda	__rc0
	adc	#250
	sta	__rc0
	lda	__rc1
	adc	#255
	sta	__rc1
	ldx	__rc20
	phx
	ldx	__rc21
	phx
	ldx	__rc22
	phx
	ldx	__rc23
	phx
	lda	__rc24
	ldy	#5
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc25
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc26
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc27
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc28
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc29
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#191
	and	53297
	sta	53297
	lda	#191
	and	53332
	sta	53332
	stz	54800
	ldx	#71
	stx	53295
	ldx	#83
	stx	53295
	lda	53341
	and	#127
	sta	53341
	ldx	#40
	stz	53352
	ldy	#216
	sty	53353
	ldy	#2
	sty	53354
	ldy	53297
	bpl	.LBB1_2
; %bb.1:
	ldx	#80
.LBB1_2:
	stx	mos8(g_curScreenW)
	lda	53297
	and	#8
	beq	.LBB1_4
; %bb.3:
	ldx	#50
	bra	.LBB1_5
.LBB1_4:
	ldx	#25
.LBB1_5:
	stx	mos8(g_curScreenH)
	bra	.LBB1_7
.LBB1_6:                                ;   in Loop: Header=BB1_7 Depth=1
	stz	54800
.LBB1_7:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB1_6
; %bb.8:
	ldx	#52
	stx	__rc20
	ldx	#3
	stx	__rc21
	ldx	#65
	stx	__rc22
	ldx	#97
	stx	__rc23
	ldx	#255
	ldy	#mos16lo(escapeCode)
	sty	__rc2
	ldy	#mos16hi(escapeCode)
	sty	__rc3
	ldy	#1
.LBB1_9:                                ; =>This Inner Loop Header: Depth=1
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
	lda	#mos16lo(escNOP)
	sta	(__rc2),y
	lda	#0
	sta	(__rc2)
	lda	__rc2
	clc
	adc	#3
	sta	__rc2
	lda	__rc3
	adc	#0
	sta	__rc3
	inc	__rc4
	bne	.LBB1_11
; %bb.10:                               ;   in Loop: Header=BB1_9 Depth=1
	inc	__rc5
.LBB1_11:                               ;   in Loop: Header=BB1_9 Depth=1
	lda	#mos16hi(escNOP)
	sta	(__rc4),y
	dex
	bne	.LBB1_9
; %bb.12:
	ldx	#mos16lo(.L.str.27)
	stx	__rc24
	ldx	#mos16hi(.L.str.27)
	stx	__rc25
	jsr	clrscr
	ldx	#0
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldy	#97
	sty	mos8(fnamehi)
	ldy	#0
	sty	__rc2
	ldy	#97
	sty	__rc3
	ldy	#mos16lo(.L.str.28)
	sty	__rc4
	ldy	#mos16hi(.L.str.28)
	sty	__rc5
	lda	#13
	jsr	memcpy
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldy	#97
	;APP
	ldx	#0
	lda	#46
	sta	HTRAP00asm
	clv
	bcc	error04
	lda	#0
	sta	__rc26
	jmp	done04
error04:
	lda	#255
	sta	__rc26
done04:
	nop

	;NO_APP
	bra	.LBB1_19
.LBB1_13:                               ;   in Loop: Header=BB1_19 Depth=1
	cmp	#192
	bcc	.LBB1_15
; %bb.14:                               ;   in Loop: Header=BB1_19 Depth=1
	eor	#128
	bra	.LBB1_16
.LBB1_15:                               ;   in Loop: Header=BB1_19 Depth=1
	clc
	adc	#224
.LBB1_16:                               ;   in Loop: Header=BB1_19 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB1_18
; %bb.17:                               ;   in Loop: Header=BB1_19 Depth=1
	inc	__rc3
.LBB1_18:                               ;   in Loop: Header=BB1_19 Depth=1
	tax
	beq	.LBB1_24
.LBB1_19:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB1_21
; %bb.20:                               ;   in Loop: Header=BB1_19 Depth=1
	inc	__rc25
.LBB1_21:                               ;   in Loop: Header=BB1_19 Depth=1
	cmp	#64
	bcc	.LBB1_16
; %bb.22:                               ;   in Loop: Header=BB1_19 Depth=1
	cmp	#96
	bcs	.LBB1_13
; %bb.23:                               ;   in Loop: Header=BB1_19 Depth=1
	clc
	adc	#192
	bra	.LBB1_16
.LBB1_24:
	ldx	#mos16lo(.L.str.29)
	stx	__rc24
	ldx	#mos16hi(.L.str.29)
	stx	__rc25
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#0
	stz	__rc2
	stz	__rc3
	lda	__rc26
	jsr	cputhex
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	;APP
	ldx	#0
	lda	#70
	sta	HTRAP00asm
	clv
	bcc	error06
	sta	__rc26
	jmp	done06
error06:
	lda	#255
	sta	__rc26
done06:
	nop

	;NO_APP
	bra	.LBB1_31
.LBB1_25:                               ;   in Loop: Header=BB1_31 Depth=1
	cmp	#192
	bcc	.LBB1_27
; %bb.26:                               ;   in Loop: Header=BB1_31 Depth=1
	eor	#128
	bra	.LBB1_28
.LBB1_27:                               ;   in Loop: Header=BB1_31 Depth=1
	clc
	adc	#224
.LBB1_28:                               ;   in Loop: Header=BB1_31 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB1_30
; %bb.29:                               ;   in Loop: Header=BB1_31 Depth=1
	inc	__rc3
.LBB1_30:                               ;   in Loop: Header=BB1_31 Depth=1
	tax
	beq	.LBB1_36
.LBB1_31:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB1_33
; %bb.32:                               ;   in Loop: Header=BB1_31 Depth=1
	inc	__rc25
.LBB1_33:                               ;   in Loop: Header=BB1_31 Depth=1
	cmp	#64
	bcc	.LBB1_28
; %bb.34:                               ;   in Loop: Header=BB1_31 Depth=1
	cmp	#96
	bcs	.LBB1_25
; %bb.35:                               ;   in Loop: Header=BB1_31 Depth=1
	clc
	adc	#192
	bra	.LBB1_28
.LBB1_36:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc24
	stz	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc26
	jsr	cputhex
	stz	mos8(g_curX)
	inc	mos8(g_curY)
	jsr	clrscr
	lda	#0
; %bb.137:
	jmp	.LBB1_135
.LBB1_37:                               ;   in Loop: Header=BB1_43 Depth=2
	cmp	#192
	bcc	.LBB1_39
; %bb.38:                               ;   in Loop: Header=BB1_43 Depth=2
	eor	#128
	bra	.LBB1_40
.LBB1_39:                               ;   in Loop: Header=BB1_43 Depth=2
	clc
	adc	#224
.LBB1_40:                               ;   in Loop: Header=BB1_43 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB1_42
; %bb.41:                               ;   in Loop: Header=BB1_43 Depth=2
	inc	__rc3
.LBB1_42:                               ;   in Loop: Header=BB1_43 Depth=2
	tax
	beq	.LBB1_48
.LBB1_43:                               ;   Parent Loop BB1_135 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc26)
	inc	__rc26
	bne	.LBB1_45
; %bb.44:                               ;   in Loop: Header=BB1_43 Depth=2
	inc	__rc27
.LBB1_45:                               ;   in Loop: Header=BB1_43 Depth=2
	cmp	#64
	bcc	.LBB1_40
; %bb.46:                               ;   in Loop: Header=BB1_43 Depth=2
	cmp	#96
	bcs	.LBB1_37
; %bb.47:                               ;   in Loop: Header=BB1_43 Depth=2
	clc
	adc	#192
	bra	.LBB1_40
.LBB1_48:                               ;   in Loop: Header=BB1_135 Depth=1
	ldx	#mos16lo(.L.str.33)
	stx	__rc26
	ldx	#mos16hi(.L.str.33)
	stx	__rc27
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc25
	jsr	cputhex
	stz	mos8(g_curX)
	inc	mos8(g_curY)
	;APP
	ldx	#0
	lda	#18
	sta	HTRAP00asm
	clv
	bcc	error07
	sta	__rc29
	jmp	done07
error07:
	lda	#255
	sta	__rc29
done07:
	nop

	;NO_APP
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB1_55
.LBB1_49:                               ;   in Loop: Header=BB1_55 Depth=2
	cmp	#192
	bcc	.LBB1_51
; %bb.50:                               ;   in Loop: Header=BB1_55 Depth=2
	eor	#128
	bra	.LBB1_52
.LBB1_51:                               ;   in Loop: Header=BB1_55 Depth=2
	clc
	adc	#224
.LBB1_52:                               ;   in Loop: Header=BB1_55 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB1_54
; %bb.53:                               ;   in Loop: Header=BB1_55 Depth=2
	inc	__rc3
.LBB1_54:                               ;   in Loop: Header=BB1_55 Depth=2
	tax
	beq	.LBB1_60
.LBB1_55:                               ;   Parent Loop BB1_135 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc26)
	inc	__rc26
	bne	.LBB1_57
; %bb.56:                               ;   in Loop: Header=BB1_55 Depth=2
	inc	__rc27
.LBB1_57:                               ;   in Loop: Header=BB1_55 Depth=2
	cmp	#64
	bcc	.LBB1_52
; %bb.58:                               ;   in Loop: Header=BB1_55 Depth=2
	cmp	#96
	bcs	.LBB1_49
; %bb.59:                               ;   in Loop: Header=BB1_55 Depth=2
	clc
	adc	#192
	bra	.LBB1_52
.LBB1_60:                               ;   in Loop: Header=BB1_135 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc29
	jsr	cputhex
	ldx	__rc29
	stz	mos8(g_curX)
	inc	mos8(g_curY)
	lda	__rc28
	cpx	#132
	bne	.LBB1_61
; %bb.145:                              ;   in Loop: Header=BB1_135 Depth=1
	jmp	.LBB1_134
.LBB1_61:                               ;   in Loop: Header=BB1_135 Depth=1
	cpx	#135
	bne	.LBB1_139
; %bb.147:                              ;   in Loop: Header=BB1_135 Depth=1
	jmp	.LBB1_134
.LBB1_139:                              ;   in Loop: Header=BB1_135 Depth=1
	jmp	.LBB1_116
.LBB1_62:                               ;   in Loop: Header=BB1_68 Depth=3
	cmp	#192
	bcc	.LBB1_64
; %bb.63:                               ;   in Loop: Header=BB1_68 Depth=3
	eor	#128
	bra	.LBB1_65
.LBB1_64:                               ;   in Loop: Header=BB1_68 Depth=3
	clc
	adc	#224
.LBB1_65:                               ;   in Loop: Header=BB1_68 Depth=3
	sta	(__rc4)
	inc	__rc4
	bne	.LBB1_67
; %bb.66:                               ;   in Loop: Header=BB1_68 Depth=3
	inc	__rc5
.LBB1_67:                               ;   in Loop: Header=BB1_68 Depth=3
	tax
	beq	.LBB1_73
.LBB1_68:                               ;   Parent Loop BB1_135 Depth=1
                                        ;     Parent Loop BB1_116 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc2)
	inc	__rc2
	bne	.LBB1_70
; %bb.69:                               ;   in Loop: Header=BB1_68 Depth=3
	inc	__rc3
.LBB1_70:                               ;   in Loop: Header=BB1_68 Depth=3
	cmp	#64
	bcc	.LBB1_65
; %bb.71:                               ;   in Loop: Header=BB1_68 Depth=3
	cmp	#96
	bcs	.LBB1_62
; %bb.72:                               ;   in Loop: Header=BB1_68 Depth=3
	clc
	adc	#192
	bra	.LBB1_65
.LBB1_73:                               ;   in Loop: Header=BB1_116 Depth=2
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc25
	jsr	cputhex
	jsr	cputc
	lda	__rc25
	cmp	#133
	bne	.LBB1_74
; %bb.149:                              ;   in Loop: Header=BB1_116 Depth=2
	jmp	.LBB1_110
.LBB1_74:                               ;   in Loop: Header=BB1_116 Depth=2
	cmp	#255
	bne	.LBB1_75
; %bb.151:                              ;   in Loop: Header=BB1_116 Depth=2
	jmp	.LBB1_110
.LBB1_75:                               ;   in Loop: Header=BB1_116 Depth=2
	ldy	#0
	ldx	#0
.LBB1_76:                               ;   Parent Loop BB1_135 Depth=1
                                        ;     Parent Loop BB1_116 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	24641,y
	cmp	#32
	beq	.LBB1_80
; %bb.77:                               ;   in Loop: Header=BB1_76 Depth=3
	cmp	#33
	bcc	.LBB1_79
; %bb.78:                               ;   in Loop: Header=BB1_76 Depth=3
	sta	24897,x
	inx
.LBB1_79:                               ;   in Loop: Header=BB1_76 Depth=3
	iny
	cpy	#8
	bne	.LBB1_76
.LBB1_80:                               ;   in Loop: Header=BB1_116 Depth=2
	ldy	#0
	lda	#46
	sta	24897,x
	inx
.LBB1_81:                               ;   Parent Loop BB1_135 Depth=1
                                        ;     Parent Loop BB1_116 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	24649,y
	cmp	#32
	beq	.LBB1_85
; %bb.82:                               ;   in Loop: Header=BB1_81 Depth=3
	cmp	#33
	bcc	.LBB1_84
; %bb.83:                               ;   in Loop: Header=BB1_81 Depth=3
	sta	24897,x
	inx
.LBB1_84:                               ;   in Loop: Header=BB1_81 Depth=3
	iny
	cpy	#3
	bne	.LBB1_81
.LBB1_85:                               ;   in Loop: Header=BB1_116 Depth=2
	ldy	#mos16lo(.L.str.35)
	sty	__rc2
	ldy	#mos16hi(.L.str.35)
	sty	__rc3
	stz	24897,x
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB1_92
.LBB1_86:                               ;   in Loop: Header=BB1_92 Depth=3
	cmp	#192
	bcc	.LBB1_88
; %bb.87:                               ;   in Loop: Header=BB1_92 Depth=3
	eor	#128
	bra	.LBB1_89
.LBB1_88:                               ;   in Loop: Header=BB1_92 Depth=3
	clc
	adc	#224
.LBB1_89:                               ;   in Loop: Header=BB1_92 Depth=3
	sta	(__rc4)
	inc	__rc4
	bne	.LBB1_91
; %bb.90:                               ;   in Loop: Header=BB1_92 Depth=3
	inc	__rc5
.LBB1_91:                               ;   in Loop: Header=BB1_92 Depth=3
	tax
	beq	.LBB1_97
.LBB1_92:                               ;   Parent Loop BB1_135 Depth=1
                                        ;     Parent Loop BB1_116 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc2)
	inc	__rc2
	bne	.LBB1_94
; %bb.93:                               ;   in Loop: Header=BB1_92 Depth=3
	inc	__rc3
.LBB1_94:                               ;   in Loop: Header=BB1_92 Depth=3
	cmp	#64
	bcc	.LBB1_89
; %bb.95:                               ;   in Loop: Header=BB1_92 Depth=3
	cmp	#96
	bcs	.LBB1_86
; %bb.96:                               ;   in Loop: Header=BB1_92 Depth=3
	clc
	adc	#192
	bra	.LBB1_89
.LBB1_97:                               ;   in Loop: Header=BB1_116 Depth=2
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#65
	stx	__rc2
	ldx	#97
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB1_104
.LBB1_98:                               ;   in Loop: Header=BB1_104 Depth=3
	cmp	#192
	bcc	.LBB1_100
; %bb.99:                               ;   in Loop: Header=BB1_104 Depth=3
	eor	#128
	bra	.LBB1_101
.LBB1_100:                              ;   in Loop: Header=BB1_104 Depth=3
	clc
	adc	#224
.LBB1_101:                              ;   in Loop: Header=BB1_104 Depth=3
	sta	(__rc4)
	inc	__rc4
	bne	.LBB1_103
; %bb.102:                              ;   in Loop: Header=BB1_104 Depth=3
	inc	__rc5
.LBB1_103:                              ;   in Loop: Header=BB1_104 Depth=3
	tax
	beq	.LBB1_109
.LBB1_104:                              ;   Parent Loop BB1_135 Depth=1
                                        ;     Parent Loop BB1_116 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc2)
	inc	__rc2
	bne	.LBB1_106
; %bb.105:                              ;   in Loop: Header=BB1_104 Depth=3
	inc	__rc3
.LBB1_106:                              ;   in Loop: Header=BB1_104 Depth=3
	cmp	#64
	bcc	.LBB1_101
; %bb.107:                              ;   in Loop: Header=BB1_104 Depth=3
	cmp	#96
	bcs	.LBB1_98
; %bb.108:                              ;   in Loop: Header=BB1_104 Depth=3
	clc
	adc	#192
	bra	.LBB1_101
.LBB1_109:                              ;   in Loop: Header=BB1_116 Depth=2
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputc
	ldx	#65
	stx	__rc2
	ldx	#97
	stx	__rc3
	jsr	strlen
	ldy	#mos16lo(.L.str.35)
	sty	__rc2
	ldy	#mos16hi(.L.str.35)
	sty	__rc3
	stz	__rc4
	stz	__rc5
	jsr	mprintf
	stz	mos8(g_curX)
	inc	mos8(g_curY)
	lda	__rc25
.LBB1_110:                              ;   Parent Loop BB1_135 Depth=1
                                        ;     Parent Loop BB1_116 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	54800
	stz	54800
	bne	.LBB1_110
; %bb.111:                              ;   in Loop: Header=BB1_116 Depth=2
	ldx	__rc29
.LBB1_112:                              ;   Parent Loop BB1_135 Depth=1
                                        ;     Parent Loop BB1_116 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldy	54800
	stz	54800
	beq	.LBB1_112
.LBB1_113:                              ;   Parent Loop BB1_135 Depth=1
                                        ;     Parent Loop BB1_116 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldy	54800
	stz	54800
	bne	.LBB1_113
; %bb.114:                              ;   in Loop: Header=BB1_116 Depth=2
	cmp	#255
	beq	.LBB1_117
; %bb.115:                              ;   in Loop: Header=BB1_116 Depth=2
	cmp	#133
	beq	.LBB1_117
.LBB1_116:                              ;   Parent Loop BB1_135 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_68 Depth 3
                                        ;       Child Loop BB1_76 Depth 3
                                        ;       Child Loop BB1_81 Depth 3
                                        ;       Child Loop BB1_92 Depth 3
                                        ;       Child Loop BB1_104 Depth 3
                                        ;       Child Loop BB1_110 Depth 3
                                        ;       Child Loop BB1_112 Depth 3
                                        ;       Child Loop BB1_113 Depth 3
	ldy	#mos16lo(.L.str.34)
	sty	__rc2
	ldy	#mos16hi(.L.str.34)
	sty	__rc3
	txa
	tay
	;APP
	phx
	ldx	#0
	txa
loop1:
	sta	readdir_dirent,x
	dex
	bne	loop1
	plx
	tya
	tax
	ldy	#mos16hi(readdir_dirent)
	lda	#20
	sta	HTRAP00asm
	clv
	bcc	error09
	stx	__rc25
	jmp	done09
error09:
	sta	__rc25
done09:
	nop

	;NO_APP
	ldx	24640
	stz	24576,x
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
; %bb.141:                              ;   in Loop: Header=BB1_116 Depth=2
	jmp	.LBB1_68
.LBB1_117:                              ;   in Loop: Header=BB1_135 Depth=1
	ldy	#mos16lo(.L.str.36)
	sty	__rc2
	ldy	#mos16hi(.L.str.36)
	sty	__rc3
	ldy	#52
	sty	__rc4
	ldy	#3
	sty	__rc5
	;APP
	lda	#22
	sta	HTRAP00asm
	clv
	bcc	error08
	stx	__rc25
	jmp	done08
error08:
	sta	__rc25
done08:
	nop

	;NO_APP
	bra	.LBB1_124
.LBB1_118:                              ;   in Loop: Header=BB1_124 Depth=2
	cmp	#192
	bcc	.LBB1_120
; %bb.119:                              ;   in Loop: Header=BB1_124 Depth=2
	eor	#128
	bra	.LBB1_121
.LBB1_120:                              ;   in Loop: Header=BB1_124 Depth=2
	clc
	adc	#224
.LBB1_121:                              ;   in Loop: Header=BB1_124 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB1_123
; %bb.122:                              ;   in Loop: Header=BB1_124 Depth=2
	inc	__rc5
.LBB1_123:                              ;   in Loop: Header=BB1_124 Depth=2
	tax
	beq	.LBB1_129
.LBB1_124:                              ;   Parent Loop BB1_135 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB1_126
; %bb.125:                              ;   in Loop: Header=BB1_124 Depth=2
	inc	__rc3
.LBB1_126:                              ;   in Loop: Header=BB1_124 Depth=2
	cmp	#64
	bcc	.LBB1_121
; %bb.127:                              ;   in Loop: Header=BB1_124 Depth=2
	cmp	#96
	bcs	.LBB1_118
; %bb.128:                              ;   in Loop: Header=BB1_124 Depth=2
	clc
	adc	#192
	bra	.LBB1_121
.LBB1_129:                              ;   in Loop: Header=BB1_135 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc25
	jsr	cputhex
	stz	mos8(g_curX)
	inc	mos8(g_curY)
.LBB1_130:                              ;   Parent Loop BB1_135 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	stz	54800
	bne	.LBB1_130
; %bb.131:                              ;   in Loop: Header=BB1_135 Depth=1
	lda	__rc28
.LBB1_132:                              ;   Parent Loop BB1_135 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	stz	54800
	beq	.LBB1_132
.LBB1_133:                              ;   Parent Loop BB1_135 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	stz	54800
	bne	.LBB1_133
.LBB1_134:                              ;   in Loop: Header=BB1_135 Depth=1
	inc
	cmp	#33
	beq	.LBB1_136
.LBB1_135:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_43 Depth 2
                                        ;     Child Loop BB1_55 Depth 2
                                        ;     Child Loop BB1_116 Depth 2
                                        ;       Child Loop BB1_68 Depth 3
                                        ;       Child Loop BB1_76 Depth 3
                                        ;       Child Loop BB1_81 Depth 3
                                        ;       Child Loop BB1_92 Depth 3
                                        ;       Child Loop BB1_104 Depth 3
                                        ;       Child Loop BB1_110 Depth 3
                                        ;       Child Loop BB1_112 Depth 3
                                        ;       Child Loop BB1_113 Depth 3
                                        ;     Child Loop BB1_124 Depth 2
                                        ;     Child Loop BB1_130 Depth 2
                                        ;     Child Loop BB1_132 Depth 2
                                        ;     Child Loop BB1_133 Depth 2
	ldx	#mos16lo(.L.str.32)
	stx	__rc26
	ldx	#mos16hi(.L.str.32)
	stx	__rc27
	tay
	;APP
	lda	#6
	sta	HTRAP00asm
	clv
	bcc	error03
	stx	__rc25
	jmp	done03
error03:
	lda	#255
	sta	__rc25
done03:
	nop

	;NO_APP
	ldx	#mos16lo(.L.str.30)
	stx	__rc2
	ldx	#mos16hi(.L.str.30)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	sty	__rc28
	tya
	jsr	mprintf
	ldx	#mos16lo(.L.str.31)
	stx	__rc2
	ldx	#mos16hi(.L.str.31)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc25
	jsr	mprintf
	stz	mos8(g_curX)
	inc	mos8(g_curY)
	;APP
	ldx	#0
	lda	#4
	sta	HTRAP00asm
	clv
	bcc	error02
	sta	__rc25
	jmp	done02
error02:
	lda	#255
	sta	__rc25
done02:
	nop
	;NO_APP
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
; %bb.143:                              ;   in Loop: Header=BB1_135 Depth=1
	jmp	.LBB1_43
.LBB1_136:
	lda	#40
	ldx	#0
	sta	__rc16
	ldy	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc27
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc26
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	ply
	sty	__rc23
	ply
	sty	__rc22
	ply
	sty	__rc21
	ply
	sty	__rc20
	clc
	lda	__rc0
	adc	#6
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end2:
	.size	escNOP, .Lfunc_end2-escNOP
                                        ; -- End function
	.section	.text.clrscr,"ax",@progbits
	.type	clrscr,@function                ; -- Begin function clrscr
clrscr:                                 ; @clrscr
; %bb.0:
	ldx	#mos8(dmalist)
	stx	__rc2
	ldx	#mos8(0)
	stx	__rc3
	ldx	__rc2
	stx	mos8(.Lclrscr_zp_stk)           ; 1-byte Folded Spill
	ldx	mos8(g_curScreenW)
	lda	mos8(g_curScreenH)
	stz	__rc3
	stx	__rc2
	ldx	#0
	jsr	__mulhi3
	tay
	lda	53332
	and	#1
	sta	__rc2
	tya
	jsr	__ashlhi3
	sta	__rc5
	sta	mos8(.Lclrscr_zp_stk+1)         ; 1-byte Folded Spill
	stx	__rc6
	stx	mos8(.Lclrscr_zp_stk+2)         ; 1-byte Folded Spill
	lda	53347
	and	#7
	ldx	53346
	ldy	53345
	sty	__rc7
	ldy	53344
	stx	__rc2
	sta	__rc3
	ldx	#32
	stx	__rc4
	ldx	__rc7
	tya
	jsr	lfill
	ldx	#11
	stx	mos8(dmalist)
	ldx	#128
	stx	mos8(dmalist+1)
	stz	mos8(dmalist+2)
	inx
	stx	mos8(dmalist+3)
	ldx	#255
	stx	mos8(dmalist+4)
	ldx	#133
	stx	mos8(dmalist+5)
	ldy	#1
	sty	mos8(dmalist+6)
	stz	mos8(dmalist+7)
	ldx	#3
	stx	mos8(dmalist+8)
	stz	mos8(dmalist+17)
	ldx	mos8(.Lclrscr_zp_stk+1)         ; 1-byte Folded Reload
	stx	mos8(dmalist+9)
	ldx	mos8(.Lclrscr_zp_stk+2)         ; 1-byte Folded Reload
	stx	mos8(dmalist+10)
	sty	mos8(dmalist+11)
	stz	mos8(dmalist+12)
	stz	mos8(dmalist+14)
	stz	mos8(dmalist+15)
	ldx	#8
	stx	mos8(dmalist+16)
	ldx	#71
	stx	53295
	ldx	#83
	stx	53295
	ldx	#65
	stx	0
	stz	55042
	stz	55044
	ldx	#mos8(0)
	stx	55041
	ldx	mos8(.Lclrscr_zp_stk)           ; 1-byte Folded Reload
	stx	55045
	rts
.Lfunc_end3:
	.size	clrscr, .Lfunc_end3-clrscr
                                        ; -- End function
	.section	.text.cputc,"ax",@progbits
	.type	cputc,@function                 ; -- Begin function cputc
cputc:                                  ; @cputc
; %bb.0:
	clc
	lda	__rc0
	adc	#255
	sta	__rc0
	lda	__rc1
	adc	#255
	sta	__rc1
	ldx	__rc20
	phx
	ldx	__rc21
	phx
	ldx	__rc22
	phx
	ldx	__rc23
	phx
	lda	__rc24
	ldy	#0
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	mos8(g_curX)
	stx	__rc21
	ldx	mos8(g_curY)
	lda	mos8(g_curScreenW)
	stz	__rc20
	stx	__rc22
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	__rc21
	sta	__rc23
	txa
	adc	#0
	sta	__rc24
	lda	53347
	and	#7
	tay
	ldx	53346
	stx	__rc3
	ldx	53345
	stx	__rc2
	lda	__rc23
	clc
	adc	#0
	sta	__rc4
	lda	__rc24
	adc	__rc2
	sta	__rc6
	lda	__rc3
	adc	#0
	sta	__rc3
	tya
	adc	#0
	tay
	ldx	53344
	stx	__rc2
	clc
	lda	__rc4
	adc	__rc2
	sta	__rc5
	lda	__rc6
	adc	#0
	sta	__rc6
	lda	__rc3
	adc	#0
	sta	__rc2
	tya
	adc	#0
	ldx	#32
	sta	__rc3
	stx	__rc4
	ldx	__rc6
	lda	__rc5
	jsr	lpoke
	ldx	#248
	ldy	#15
	lda	#1
	stx	__rc2
	sty	__rc3
	sta	__rc4
	ldx	__rc24
	lda	__rc23
	jsr	lpoke
	ldx	mos8(g_curScreenW)
	phx
	ply
	dex
	cpy	#0
	bne	.LBB4_2
; %bb.1:
	dec	__rc20
.LBB4_2:
	lda	__rc20
	bne	.LBB4_5
; %bb.3:
	ldy	__rc22
	cpx	__rc21
	bne	.LBB4_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB4_7
.LBB4_5:
	ldy	__rc22
.LBB4_6:
	ldx	__rc21
	inx
.LBB4_7:
	stx	mos8(g_curX)
	sty	mos8(g_curY)
	ldy	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	plx
	stx	__rc23
	plx
	stx	__rc22
	plx
	stx	__rc21
	plx
	stx	__rc20
	clc
	lda	__rc0
	adc	#1
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end4:
	.size	cputc, .Lfunc_end4-cputc
                                        ; -- End function
	.section	.text.cputhex,"ax",@progbits
	.type	cputhex,@function               ; -- Begin function cputhex
cputhex:                                ; @cputhex
; %bb.0:
	tay
	sta	mos8(.Lcputhex_zp_stk+12)       ; 1-byte Folded Spill
	stx	__rc4
	lda	#mos8(.Lcputhex_zp_stk)
	sta	__rc2
	clc
	adc	#4
	sta	__rc6
	lda	#mos8(0)
	sta	__rc3
	adc	#0
	ldx	__rc6
	stx	mos8(.Lcputhex_zp_stk+10)       ; 1-byte Folded Spill
	sta	mos8(.Lcputhex_zp_stk+11)       ; 1-byte Folded Spill
	lsr	__rc4
	tya
	ror
	lsr	__rc4
	ror
	lsr	__rc4
	ror
	lsr	__rc4
	ror
	and	#15
	sta	mos8(.Lcputhex_zp_stk+13)       ; 1-byte Folded Spill
	ldx	#36
	stx	mos8(.Lcputhex_zp_stk)
	inc	__rc2
	bne	.LBB5_2
; %bb.1:
	inc	__rc3
.LBB5_2:
	stz	__rc4
	lda	#48
	ldx	#6
	jsr	__memset
	ldx	mos8(.Lcputhex_zp_stk+13)       ; 1-byte Folded Reload
	lda	mos8(hexDigits),x
	tax
	stx	mos8(.Lcputhex_zp_stk+7)
	lda	mos8(.Lcputhex_zp_stk+12)       ; 1-byte Folded Reload
	and	#15
	tax
	lda	mos8(hexDigits),x
	tax
	stx	mos8(.Lcputhex_zp_stk+8)
	stz	mos8(.Lcputhex_zp_stk+9)
	ldx	#36
	stx	mos8(.Lcputhex_zp_stk+4)
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	mos8(.Lcputhex_zp_stk+10)       ; 1-byte Folded Reload
	sty	__rc2
	ldy	mos8(.Lcputhex_zp_stk+11)       ; 1-byte Folded Reload
	sty	__rc3
	jmp	cputsxy
.Lfunc_end5:
	.size	cputhex, .Lfunc_end5-cputhex
                                        ; -- End function
	.section	.text.cputsxy,"ax",@progbits
	.type	cputsxy,@function               ; -- Begin function cputsxy
cputsxy:                                ; @cputsxy
; %bb.0:
	sta	mos8(.Lcputsxy_zp_stk+6)        ; 1-byte Folded Spill
	stx	mos8(.Lcputsxy_zp_stk+5)        ; 1-byte Folded Spill
	ldx	__rc2
	stx	__rc4
	ldx	__rc3
	stx	__rc5
	ldx	__rc2
	stx	mos8(.Lcputsxy_zp_stk+3)        ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.Lcputsxy_zp_stk+4)        ; 1-byte Folded Spill
	ldx	#mos8(dmalist)
	stx	__rc2
	ldx	#mos8(0)
	stx	__rc3
	ldx	__rc2
	stx	mos8(.Lcputsxy_zp_stk+7)        ; 1-byte Folded Spill
	ldx	__rc4
	stx	__rc2
	ldx	__rc5
	stx	__rc3
	jsr	strlen
	sta	mos8(.Lcputsxy_zp_stk+2)        ; 1-byte Folded Spill
	lda	mos8(g_curScreenW)
	stz	__rc3
	ldx	mos8(.Lcputsxy_zp_stk+5)        ; 1-byte Folded Reload
	stx	__rc2
	ldx	#0
	jsr	__mulhi3
	stx	__rc3
	ldx	mos8(.Lcputsxy_zp_stk+6)        ; 1-byte Folded Reload
	stx	__rc2
	clc
	adc	__rc2
	sta	__rc7
	lda	__rc3
	adc	#0
	sta	__rc8
	lda	53347
	ldx	53346
	stx	__rc5
	ldx	53345
	stx	__rc2
	and	#7
	sta	__rc4
	lda	__rc7
	clc
	adc	#0
	sta	__rc3
	lda	__rc8
	adc	__rc2
	tay
	lda	__rc5
	adc	#0
	sta	__rc10
	lda	__rc4
	adc	#0
	sta	__rc9
	ldx	53344
	stx	__rc2
	clc
	lda	__rc3
	adc	__rc2
	sta	__rc5
	tya
	adc	#0
	sta	__rc6
	lda	__rc10
	adc	#0
	sta	__rc4
	lda	__rc9
	adc	#0
	stz	__rc2
	stz	__rc3
	lsr	__rc2
	ror	__rc3
	ror
	sta	__rc9
	lda	__rc4
	ror
	lsr	__rc2
	ror	__rc3
	ror	__rc9
	ror
	lsr	__rc2
	ror	__rc3
	ror	__rc9
	ror
	lsr	__rc2
	ror	__rc3
	ror	__rc9
	ror
	ldx	#11
	stx	mos8(dmalist)
	ldx	#128
	stx	mos8(dmalist+1)
	stz	mos8(dmalist+2)
	inx
	stx	mos8(dmalist+3)
	sta	mos8(dmalist+4)
	ldx	#133
	stx	mos8(dmalist+5)
	ldx	#1
	stx	mos8(dmalist+6)
	stz	mos8(dmalist+7)
	stz	mos8(dmalist+17)
	stz	mos8(dmalist+8)
	ldy	mos8(.Lcputsxy_zp_stk+2)        ; 1-byte Folded Reload
	sty	mos8(dmalist+9)
	stz	mos8(dmalist+10)
	stz	mos8(dmalist+17)
	ldy	mos8(.Lcputsxy_zp_stk+3)        ; 1-byte Folded Reload
	sty	__rc2
	ldy	mos8(.Lcputsxy_zp_stk+4)        ; 1-byte Folded Reload
	sty	__rc3
	ldy	__rc2
	sty	mos8(dmalist+11)
	ldy	__rc3
	sty	mos8(dmalist+12)
	stz	mos8(dmalist+13)
	ldy	__rc5
	sty	mos8(dmalist+14)
	ldy	__rc6
	sty	mos8(dmalist+15)
	lda	__rc4
	and	#15
	sta	mos8(dmalist+16)
	ldy	#71
	sty	53295
	ldy	#83
	sty	53295
	ldy	#65
	sty	0
	stz	55042
	stz	55044
	ldy	#mos8(0)
	sty	55041
	ldy	mos8(.Lcputsxy_zp_stk+7)        ; 1-byte Folded Reload
	sty	55045
	ldy	#15
	lda	#248
	sta	__rc2
	sty	__rc3
	stx	__rc4
	ldx	mos8(.Lcputsxy_zp_stk+2)        ; 1-byte Folded Reload
	stx	__rc5
	stz	__rc6
	ldx	__rc8
	lda	__rc7
	jsr	lfill
	lda	mos8(.Lcputsxy_zp_stk+2)        ; 1-byte Folded Reload
	ldx	mos8(.Lcputsxy_zp_stk+6)        ; 1-byte Folded Reload
	stx	__rc2
	clc
	adc	__rc2
	sta	__rc6
	lda	#0
	adc	#0
	ldx	mos8(g_curScreenW)
	ldy	#mos8(.Lcputsxy_zp_stk)
	sty	__rc4
	ldy	#mos8(0)
	sty	__rc5
	stx	__rc2
	stz	__rc3
	tax
	lda	__rc6
	jsr	__udivmodhi4
	ldx	mos8(.Lcputsxy_zp_stk)
	clc
	ldy	mos8(.Lcputsxy_zp_stk+5)        ; 1-byte Folded Reload
	sty	__rc2
	adc	__rc2
	sta	mos8(g_curY)
	stx	mos8(g_curX)
	rts
.Lfunc_end6:
	.size	cputsxy, .Lfunc_end6-cputsxy
                                        ; -- End function
	.section	.text.lfill,"ax",@progbits
	.type	lfill,@function                 ; -- Begin function lfill
lfill:                                  ; @lfill
; %bb.0:
	sta	__rc7
	stx	__rc8
	ldx	__rc5
	ldy	__rc6
	lda	#11
	sta	mos8(dmalist)
	lda	#128
	sta	mos8(dmalist+1)
	stz	mos8(dmalist+2)
	inc
	sta	mos8(dmalist+3)
	stz	__rc5
	stz	__rc6
	lsr	__rc6
	ror	__rc5
	ror	__rc3
	lda	__rc2
	ror
	lsr	__rc6
	ror	__rc5
	ror	__rc3
	ror
	lsr	__rc6
	ror	__rc5
	ror	__rc3
	ror
	lsr	__rc6
	ror	__rc5
	ror	__rc3
	ror
	sta	mos8(dmalist+4)
	lda	#133
	sta	mos8(dmalist+5)
	lda	#1
	sta	mos8(dmalist+6)
	stz	mos8(dmalist+7)
	lda	#3
	sta	mos8(dmalist+8)
	stz	mos8(dmalist+17)
	stx	mos8(dmalist+9)
	sty	mos8(dmalist+10)
	ldx	__rc4
	stx	mos8(dmalist+11)
	stz	mos8(dmalist+12)
	ldx	__rc7
	stx	mos8(dmalist+14)
	ldx	#mos8(0)
	ldy	#mos8(dmalist)
	sty	__rc4
	ldy	#mos8(0)
	sty	__rc5
	ldy	__rc8
	sty	mos8(dmalist+15)
	ldy	__rc4
	lda	__rc2
	and	#15
	sta	mos8(dmalist+16)
	lda	#71
	sta	53295
	lda	#83
	sta	53295
	lda	#65
	sta	0
	stz	55042
	stz	55044
	stx	55041
	sty	55045
	rts
.Lfunc_end7:
	.size	lfill, .Lfunc_end7-lfill
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB8_2
; %bb.1:
	tya
	beq	.LBB8_11
.LBB8_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB8_3:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB8_5
; %bb.4:                                ;   in Loop: Header=BB8_3 Depth=1
	inc	__rc7
.LBB8_5:                                ;   in Loop: Header=BB8_3 Depth=1
	inc	__rc4
	bne	.LBB8_7
; %bb.6:                                ;   in Loop: Header=BB8_3 Depth=1
	inc	__rc5
.LBB8_7:                                ;   in Loop: Header=BB8_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB8_9
; %bb.8:                                ;   in Loop: Header=BB8_3 Depth=1
	dex
.LBB8_9:                                ;   in Loop: Header=BB8_3 Depth=1
	txa
	bne	.LBB8_3
; %bb.10:                               ;   in Loop: Header=BB8_3 Depth=1
	tya
	bne	.LBB8_3
.LBB8_11:
	rts
.Lfunc_end8:
	.size	memcpy, .Lfunc_end8-memcpy
                                        ; -- End function
	.section	.text.memset,"ax",@progbits
	.weak	memset                          ; -- Begin function memset
	.type	memset,@function
memset:                                 ; @memset
; %bb.0:
	ldx	__rc4
	ldy	__rc5
	sty	__rc6
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ldy	__rc4
	sty	mos8(.Lmemset_zp_stk)           ; 1-byte Folded Spill
	ldy	__rc5
	sty	mos8(.Lmemset_zp_stk+1)         ; 1-byte Folded Spill
	ldy	__rc6
	sty	__rc4
	jsr	__memset
	ldx	mos8(.Lmemset_zp_stk)           ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lmemset_zp_stk+1)         ; 1-byte Folded Reload
	stx	__rc3
	rts
.Lfunc_end9:
	.size	memset, .Lfunc_end9-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB10_4
.LBB10_1:                               ;   in Loop: Header=BB10_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB10_3
; %bb.2:                                ;   in Loop: Header=BB10_4 Depth=1
	inc	__rc3
.LBB10_3:                               ;   in Loop: Header=BB10_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB10_7
.LBB10_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB10_1
; %bb.5:                                ;   in Loop: Header=BB10_4 Depth=1
	cpx	#0
	bne	.LBB10_1
; %bb.6:
	rts
.LBB10_7:                               ;   in Loop: Header=BB10_4 Depth=1
	dec	__rc4
	jmp	.LBB10_4
.Lfunc_end10:
	.size	__memset, .Lfunc_end10-__memset
                                        ; -- End function
	.section	.text.memmove,"ax",@progbits
	.weak	memmove                         ; -- Begin function memmove
	.type	memmove,@function
memmove:                                ; @memmove
; %bb.0:
	sta	__rc6
	stx	__rc7
	ldx	__rc5
	cpx	__rc3
	beq	.LBB11_1
; %bb.15:
	jmp	.LBB11_13
.LBB11_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB11_2
; %bb.17:
	jmp	.LBB11_14
.LBB11_2:
	lda	__rc7
	bne	.LBB11_4
; %bb.3:
	lda	__rc6
	beq	.LBB11_12
.LBB11_4:                               ; =>This Inner Loop Header: Depth=1
	lda	__rc4
	clc
	adc	__rc6
	sta	__rc8
	lda	__rc5
	adc	__rc7
	sta	__rc9
	ldx	__rc8
	dec	__rc8
	cpx	#0
	bne	.LBB11_6
; %bb.5:                                ;   in Loop: Header=BB11_4 Depth=1
	dec	__rc9
.LBB11_6:                               ;   in Loop: Header=BB11_4 Depth=1
	lda	__rc2
	clc
	adc	__rc6
	sta	__rc10
	lda	__rc3
	adc	__rc7
	sta	__rc11
	ldx	__rc10
	dec	__rc10
	cpx	#0
	bne	.LBB11_8
; %bb.7:                                ;   in Loop: Header=BB11_4 Depth=1
	dec	__rc11
.LBB11_8:                               ;   in Loop: Header=BB11_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB11_10
; %bb.9:                                ;   in Loop: Header=BB11_4 Depth=1
	dex
.LBB11_10:                              ;   in Loop: Header=BB11_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB11_4
; %bb.11:                               ;   in Loop: Header=BB11_4 Depth=1
	tya
	bne	.LBB11_4
.LBB11_12:
	rts
.LBB11_13:
	cpx	__rc3
	bcs	.LBB11_14
; %bb.19:
	jmp	.LBB11_2
.LBB11_14:
	ldx	__rc2
	stx	mos8(.Lmemmove_zp_stk)          ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.Lmemmove_zp_stk+1)        ; 1-byte Folded Spill
	ldx	mos8(.Lmemmove_zp_stk)          ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lmemmove_zp_stk+1)        ; 1-byte Folded Reload
	stx	__rc3
	ldx	__rc7
	jsr	memcpy
	ldx	mos8(.Lmemmove_zp_stk)          ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lmemmove_zp_stk+1)        ; 1-byte Folded Reload
	stx	__rc3
	rts
.Lfunc_end11:
	.size	memmove, .Lfunc_end11-memmove
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB12_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB12_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB12_4
; %bb.3:                                ;   in Loop: Header=BB12_2 Depth=1
	inx
.LBB12_4:                               ;   in Loop: Header=BB12_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB12_2
	bra	.LBB12_6
.LBB12_5:
	stz	__rc4
	ldx	#0
.LBB12_6:
	lda	__rc4
	rts
.Lfunc_end12:
	.size	strlen, .Lfunc_end12-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB13_2
.LBB13_1:                               ;   in Loop: Header=BB13_2 Depth=1
	dex
	asl
.LBB13_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB13_1
; %bb.3:
	rts
.Lfunc_end13:
	.size	__ashlqi3, .Lfunc_end13-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB14_3
; %bb.1:
	ldx	__rc2
.LBB14_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB14_2
.LBB14_3:
	ldx	__rc3
	rts
.Lfunc_end14:
	.size	__ashlhi3, .Lfunc_end14-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB15_3
; %bb.1:
	ldx	__rc4
.LBB15_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB15_2
.LBB15_3:
	ldx	__rc5
	rts
.Lfunc_end15:
	.size	__ashlsi3, .Lfunc_end15-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB16_3
; %bb.1:
	ldx	__rc8
.LBB16_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc9
	rol	__rc2
	rol	__rc3
	rol	__rc4
	rol	__rc5
	rol	__rc6
	rol	__rc7
	cpx	#0
	bne	.LBB16_2
.LBB16_3:
	ldx	__rc9
	rts
.Lfunc_end16:
	.size	__ashldi3, .Lfunc_end16-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB17_2
.LBB17_1:                               ;   in Loop: Header=BB17_2 Depth=1
	dex
	lsr
.LBB17_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB17_1
; %bb.3:
	rts
.Lfunc_end17:
	.size	__lshrqi3, .Lfunc_end17-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB18_3
; %bb.1:
	ldx	__rc2
.LBB18_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB18_2
.LBB18_3:
	ldx	__rc3
	rts
.Lfunc_end18:
	.size	__lshrhi3, .Lfunc_end18-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB19_3
; %bb.1:
	ldx	__rc4
.LBB19_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB19_2
.LBB19_3:
	ldx	__rc5
	rts
.Lfunc_end19:
	.size	__lshrsi3, .Lfunc_end19-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB20_3
; %bb.1:
	ldx	__rc8
.LBB20_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc9
	ror
	cpx	#0
	bne	.LBB20_2
.LBB20_3:
	ldx	__rc9
	rts
.Lfunc_end20:
	.size	__lshrdi3, .Lfunc_end20-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB21_2
.LBB21_1:                               ;   in Loop: Header=BB21_2 Depth=1
	dex
	cmp	#128
	ror
.LBB21_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB21_1
; %bb.3:
	rts
.Lfunc_end21:
	.size	__ashrqi3, .Lfunc_end21-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB22_3
; %bb.1:
	ldx	__rc2
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB22_2
.LBB22_3:
	tax
	lda	__rc3
	rts
.Lfunc_end22:
	.size	__ashrhi3, .Lfunc_end22-__ashrhi3
                                        ; -- End function
	.section	.text.__ashrsi3,"ax",@progbits
	.globl	__ashrsi3                       ; -- Begin function __ashrsi3
	.type	__ashrsi3,@function
__ashrsi3:                              ; @__ashrsi3
; %bb.0:
	sta	__rc6
	stx	__rc5
	lda	__rc3
	ldx	__rc4
	beq	.LBB23_3
; %bb.1:
	ldx	__rc4
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB23_2
.LBB23_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end23:
	.size	__ashrsi3, .Lfunc_end23-__ashrsi3
                                        ; -- End function
	.section	.text.__ashrdi3,"ax",@progbits
	.globl	__ashrdi3                       ; -- Begin function __ashrdi3
	.type	__ashrdi3,@function
__ashrdi3:                              ; @__ashrdi3
; %bb.0:
	sta	__rc10
	stx	__rc9
	lda	__rc7
	ldx	__rc8
	beq	.LBB24_3
; %bb.1:
	ldx	__rc8
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc6
	ror	__rc5
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc9
	ror	__rc10
	cpx	#0
	bne	.LBB24_2
.LBB24_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end24:
	.size	__ashrdi3, .Lfunc_end24-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB25_2
.LBB25_1:                               ;   in Loop: Header=BB25_2 Depth=1
	dex
	cmp	#128
	rol
.LBB25_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB25_1
; %bb.3:
	rts
.Lfunc_end25:
	.size	__rotlqi3, .Lfunc_end25-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB26_3
; %bb.1:
	ldx	__rc2
.LBB26_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB26_2
.LBB26_3:
	tax
	lda	__rc3
	rts
.Lfunc_end26:
	.size	__rotlhi3, .Lfunc_end26-__rotlhi3
                                        ; -- End function
	.section	.text.__rotlsi3,"ax",@progbits
	.globl	__rotlsi3                       ; -- Begin function __rotlsi3
	.type	__rotlsi3,@function
__rotlsi3:                              ; @__rotlsi3
; %bb.0:
	sta	__rc6
	stx	__rc5
	lda	__rc3
	ldx	__rc4
	beq	.LBB27_3
; %bb.1:
	ldx	__rc4
.LBB27_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB27_2
.LBB27_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end27:
	.size	__rotlsi3, .Lfunc_end27-__rotlsi3
                                        ; -- End function
	.section	.text.__rotldi3,"ax",@progbits
	.globl	__rotldi3                       ; -- Begin function __rotldi3
	.type	__rotldi3,@function
__rotldi3:                              ; @__rotldi3
; %bb.0:
	sta	__rc10
	stx	__rc9
	lda	__rc7
	ldx	__rc8
	beq	.LBB28_3
; %bb.1:
	ldx	__rc8
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc10
	rol	__rc9
	rol	__rc2
	rol	__rc3
	rol	__rc4
	rol	__rc5
	rol	__rc6
	rol
	cpx	#0
	bne	.LBB28_2
.LBB28_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end28:
	.size	__rotldi3, .Lfunc_end28-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB29_2
.LBB29_1:                               ;   in Loop: Header=BB29_2 Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror
.LBB29_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB29_1
; %bb.3:
	rts
.Lfunc_end29:
	.size	__rotrqi3, .Lfunc_end29-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB30_3
; %bb.1:
	ldx	__rc2
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB30_2
.LBB30_3:
	ldx	__rc3
	rts
.Lfunc_end30:
	.size	__rotrhi3, .Lfunc_end30-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB31_3
; %bb.1:
	ldx	__rc4
.LBB31_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB31_2
.LBB31_3:
	ldx	__rc5
	rts
.Lfunc_end31:
	.size	__rotrsi3, .Lfunc_end31-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB32_3
; %bb.1:
	ldx	__rc8
.LBB32_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc8
	ror	__rc8
	ror	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc9
	ror
	cpx	#0
	bne	.LBB32_2
.LBB32_3:
	ldx	__rc9
	rts
.Lfunc_end32:
	.size	__rotrdi3, .Lfunc_end32-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB33_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB33_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB33_4
; %bb.3:                                ;   in Loop: Header=BB33_2 Depth=1
	clc
	adc	__rc2
.LBB33_4:                               ;   in Loop: Header=BB33_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB33_2
; %bb.5:
	rts
.LBB33_6:
	lda	#0
	rts
.Lfunc_end33:
	.size	__mulqi3, .Lfunc_end33-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB34_2
; %bb.1:
	ldy	__rc2
	beq	.LBB34_7
.LBB34_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB34_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB34_5
; %bb.4:                                ;   in Loop: Header=BB34_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB34_5:                               ;   in Loop: Header=BB34_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB34_3
; %bb.6:                                ;   in Loop: Header=BB34_3 Depth=1
	ldx	__rc2
	bne	.LBB34_3
	bra	.LBB34_8
.LBB34_7:
	ldy	#0
	tya
.LBB34_8:
	tax
	tya
	rts
.Lfunc_end34:
	.size	__mulhi3, .Lfunc_end34-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB35_4
; %bb.1:
	ldy	__rc6
	bne	.LBB35_4
; %bb.2:
	ldy	__rc5
	bne	.LBB35_4
; %bb.3:
	ldy	__rc4
	bne	.LBB35_4
; %bb.13:
	jmp	.LBB35_12
.LBB35_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB35_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB35_7
; %bb.6:                                ;   in Loop: Header=BB35_5 Depth=1
	sta	__rc11
	tya
	clc
	adc	__rc8
	tay
	txa
	adc	__rc9
	tax
	lda	__rc10
	adc	__rc2
	sta	__rc10
	lda	__rc11
	adc	__rc3
.LBB35_7:                               ;   in Loop: Header=BB35_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB35_5
; %bb.8:                                ;   in Loop: Header=BB35_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB35_5
; %bb.9:                                ;   in Loop: Header=BB35_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB35_5
; %bb.10:                               ;   in Loop: Header=BB35_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB35_5
.LBB35_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB35_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB35_11
.Lfunc_end35:
	.size	__mulsi3, .Lfunc_end35-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB36_8
; %bb.1:
	ldy	__rc14
	bne	.LBB36_8
; %bb.2:
	ldy	__rc13
	bne	.LBB36_8
; %bb.3:
	ldy	__rc12
	bne	.LBB36_8
; %bb.4:
	ldy	__rc11
	bne	.LBB36_8
; %bb.5:
	ldy	__rc10
	bne	.LBB36_8
; %bb.6:
	ldy	__rc9
	bne	.LBB36_8
; %bb.7:
	ldy	__rc8
	bne	.LBB36_8
; %bb.21:
	jmp	.LBB36_20
.LBB36_8:
	sta	__rc18
	stx	__rc19
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
.LBB36_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB36_11
; %bb.10:                               ;   in Loop: Header=BB36_9 Depth=1
	sta	mos8(.L__muldi3_zp_stk+5)
	tya
	clc
	adc	__rc18
	tay
	txa
	adc	__rc19
	tax
	lda	mos8(.L__muldi3_zp_stk)
	adc	__rc2
	sta	mos8(.L__muldi3_zp_stk)
	lda	mos8(.L__muldi3_zp_stk+1)
	adc	__rc3
	sta	mos8(.L__muldi3_zp_stk+1)
	lda	mos8(.L__muldi3_zp_stk+2)
	adc	__rc4
	sta	mos8(.L__muldi3_zp_stk+2)
	lda	mos8(.L__muldi3_zp_stk+3)
	adc	__rc5
	sta	mos8(.L__muldi3_zp_stk+3)
	lda	mos8(.L__muldi3_zp_stk+4)
	adc	__rc6
	sta	mos8(.L__muldi3_zp_stk+4)
	lda	mos8(.L__muldi3_zp_stk+5)
	adc	__rc7
.LBB36_11:                              ;   in Loop: Header=BB36_9 Depth=1
	asl	__rc18
	rol	__rc19
	rol	__rc2
	rol	__rc3
	rol	__rc4
	rol	__rc5
	rol	__rc6
	rol	__rc7
	inc	__rc15
	dec	__rc15
	beq	.LBB36_12
; %bb.23:                               ;   in Loop: Header=BB36_9 Depth=1
	jmp	.LBB36_9
.LBB36_12:                              ;   in Loop: Header=BB36_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB36_13
; %bb.25:                               ;   in Loop: Header=BB36_9 Depth=1
	jmp	.LBB36_9
.LBB36_13:                              ;   in Loop: Header=BB36_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB36_14
; %bb.27:                               ;   in Loop: Header=BB36_9 Depth=1
	jmp	.LBB36_9
.LBB36_14:                              ;   in Loop: Header=BB36_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB36_15
; %bb.29:                               ;   in Loop: Header=BB36_9 Depth=1
	jmp	.LBB36_9
.LBB36_15:                              ;   in Loop: Header=BB36_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB36_16
; %bb.31:                               ;   in Loop: Header=BB36_9 Depth=1
	jmp	.LBB36_9
.LBB36_16:                              ;   in Loop: Header=BB36_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB36_17
; %bb.33:                               ;   in Loop: Header=BB36_9 Depth=1
	jmp	.LBB36_9
.LBB36_17:                              ;   in Loop: Header=BB36_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB36_18
; %bb.35:                               ;   in Loop: Header=BB36_9 Depth=1
	jmp	.LBB36_9
.LBB36_18:                              ;   in Loop: Header=BB36_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB36_19
; %bb.37:                               ;   in Loop: Header=BB36_9 Depth=1
	jmp	.LBB36_9
.LBB36_19:
	phy
	ldy	mos8(.L__muldi3_zp_stk)
	sty	__rc2
	ldy	mos8(.L__muldi3_zp_stk+1)
	sty	__rc3
	ldy	mos8(.L__muldi3_zp_stk+2)
	sty	__rc4
	ldy	mos8(.L__muldi3_zp_stk+3)
	sty	__rc5
	ldy	mos8(.L__muldi3_zp_stk+4)
	sty	__rc6
	ply
	sta	__rc7
	tya
	rts
.LBB36_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB36_19
.Lfunc_end36:
	.size	__muldi3, .Lfunc_end36-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB37_1
; %bb.15:
	jmp	.LBB37_14
.LBB37_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB37_2
; %bb.17:
	jmp	.LBB37_14
.LBB37_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB37_3
; %bb.19:
	jmp	.LBB37_14
.LBB37_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB37_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB37_6
; %bb.5:                                ;   in Loop: Header=BB37_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB37_8
	bra	.LBB37_7
.LBB37_6:                               ;   in Loop: Header=BB37_4 Depth=1
	cpy	__rc4
	bcc	.LBB37_8
.LBB37_7:                               ;   in Loop: Header=BB37_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB37_4
	bra	.LBB37_9
.LBB37_8:
	ldy	__rc3
	sty	__rc2
.LBB37_9:
	cpx	#0
	beq	.LBB37_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB37_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB37_13
; %bb.12:                               ;   in Loop: Header=BB37_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB37_13:                              ;   in Loop: Header=BB37_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB37_11
.LBB37_14:
	rts
.Lfunc_end37:
	.size	__udivqi3, .Lfunc_end37-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB38_2
; %bb.1:
	ldy	__rc2
	beq	.LBB38_4
.LBB38_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB38_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB38_6
.LBB38_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB38_22
.LBB38_5:
	cmp	__rc3
	bcc	.LBB38_4
.LBB38_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB38_7
; %bb.25:
	jmp	.LBB38_22
.LBB38_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB38_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB38_10
; %bb.9:                                ;   in Loop: Header=BB38_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB38_12
	bra	.LBB38_11
.LBB38_10:                              ;   in Loop: Header=BB38_8 Depth=1
	cmp	__rc6
	bcc	.LBB38_12
.LBB38_11:                              ;   in Loop: Header=BB38_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB38_8
	bra	.LBB38_13
.LBB38_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB38_13:
	cpx	#0
	bne	.LBB38_14
; %bb.27:
	jmp	.LBB38_22
.LBB38_14:
	stz	__rc4
	ldy	#1
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	sec
	tay
	lda	__rc7
	sbc	__rc5
	sta	__rc2
	tya
	sbc	__rc6
.LBB38_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB38_17
; %bb.16:                               ;   in Loop: Header=BB38_15 Depth=1
	ldy	#0
.LBB38_17:                              ;   in Loop: Header=BB38_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB38_21
; %bb.18:                               ;   in Loop: Header=BB38_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB38_20
.LBB38_19:                              ;   in Loop: Header=BB38_15 Depth=1
	tay
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	ora	#1
	sta	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	sec
	lda	__rc2
	sbc	__rc5
	sta	__rc2
	tya
	sbc	__rc6
.LBB38_20:                              ;   in Loop: Header=BB38_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB38_15
	bra	.LBB38_22
.LBB38_21:                              ;   in Loop: Header=BB38_15 Depth=1
	cmp	__rc6
	bcs	.LBB38_19
	bra	.LBB38_20
.LBB38_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end38:
	.size	__udivhi3, .Lfunc_end38-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
	ldy	__rc7
	bne	.LBB39_4
; %bb.1:
	ldy	__rc6
	bne	.LBB39_4
; %bb.2:
	ldy	__rc5
	bne	.LBB39_4
; %bb.3:
	ldy	__rc4
	beq	.LBB39_9
.LBB39_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB39_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB39_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB39_7
; %bb.45:
	jmp	.LBB39_38
.LBB39_7:
	cmp	__rc4
	bcc	.LBB39_9
	bra	.LBB39_11
.LBB39_8:
	cpx	__rc7
	bcs	.LBB39_11
.LBB39_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB39_21
.LBB39_10:
	cpx	__rc6
	bcc	.LBB39_9
.LBB39_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB39_12
; %bb.47:
	jmp	.LBB39_21
.LBB39_12:
	sta	__rc13
	lda	__rc14
	ldx	#0
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB39_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB39_17
; %bb.14:                               ;   in Loop: Header=BB39_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB39_18
; %bb.15:                               ;   in Loop: Header=BB39_13 Depth=1
	cmp	__rc10
	bne	.LBB39_19
; %bb.16:                               ;   in Loop: Header=BB39_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB39_23
	bra	.LBB39_20
.LBB39_17:                              ;   in Loop: Header=BB39_13 Depth=1
	cpy	__rc12
	bcc	.LBB39_23
	bra	.LBB39_20
.LBB39_18:                              ;   in Loop: Header=BB39_13 Depth=1
	cpy	__rc11
	bcc	.LBB39_23
	bra	.LBB39_20
.LBB39_19:                              ;   in Loop: Header=BB39_13 Depth=1
	cmp	__rc10
	bcc	.LBB39_23
.LBB39_20:                              ;   in Loop: Header=BB39_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB39_13
	bra	.LBB39_24
.LBB39_21:
	stz	__rc2
	stz	__rc3
.LBB39_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB39_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB39_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB39_22
; %bb.25:
	stz	__rc8
	sec
	lda	__rc13
	sbc	__rc9
	sta	__rc4
	lda	__rc14
	sbc	__rc10
	sta	__rc7
	lda	__rc15
	sbc	__rc11
	sta	__rc5
	lda	__rc18
	sbc	__rc12
	ldy	#1
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
.LBB39_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB39_28
; %bb.27:                               ;   in Loop: Header=BB39_26 Depth=1
	ldy	#0
.LBB39_28:                              ;   in Loop: Header=BB39_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB39_32
; %bb.29:                               ;   in Loop: Header=BB39_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB39_34
; %bb.30:                               ;   in Loop: Header=BB39_26 Depth=1
	cmp	__rc10
	bne	.LBB39_37
; %bb.31:                               ;   in Loop: Header=BB39_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB39_33
	bra	.LBB39_35
.LBB39_32:                              ;   in Loop: Header=BB39_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB39_35
.LBB39_33:                              ;   in Loop: Header=BB39_26 Depth=1
	lda	__rc6
	bra	.LBB39_36
.LBB39_34:                              ;   in Loop: Header=BB39_26 Depth=1
	cpy	__rc11
	bcc	.LBB39_33
.LBB39_35:                              ;   in Loop: Header=BB39_26 Depth=1
	tay
	sec
	lda	__rc4
	sbc	__rc9
	sta	__rc4
	tya
	sbc	__rc10
	sta	__rc7
	lda	__rc5
	sbc	__rc11
	sta	__rc5
	lda	__rc6
	sbc	__rc12
	tay
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	ora	#1
	sta	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	tya
.LBB39_36:                              ;   in Loop: Header=BB39_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB39_41
; %bb.49:                               ;   in Loop: Header=BB39_26 Depth=1
	jmp	.LBB39_26
.LBB39_41:
	jmp	.LBB39_22
.LBB39_37:                              ;   in Loop: Header=BB39_26 Depth=1
	cmp	__rc10
	bcc	.LBB39_33
	bra	.LBB39_35
.LBB39_38:
	cpx	__rc5
	bcs	.LBB39_43
; %bb.51:
	jmp	.LBB39_9
.LBB39_43:
	jmp	.LBB39_11
.Lfunc_end39:
	.size	__udivsi3, .Lfunc_end39-__udivsi3
                                        ; -- End function
	.section	.text.__udivdi3,"ax",@progbits
	.globl	__udivdi3                       ; -- Begin function __udivdi3
	.type	__udivdi3,@function
__udivdi3:                              ; @__udivdi3
; %bb.0:
	stx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Spill
	ldx	__rc2
	stx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Spill
	ldx	__rc4
	stx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Spill
	ldx	__rc5
	stx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Spill
	stz	__rc18
	ldx	__rc15
	bne	.LBB40_8
; %bb.1:
	ldx	__rc14
	bne	.LBB40_8
; %bb.2:
	ldx	__rc13
	bne	.LBB40_8
; %bb.3:
	ldx	__rc12
	bne	.LBB40_8
; %bb.4:
	ldx	__rc11
	bne	.LBB40_8
; %bb.5:
	ldx	__rc10
	bne	.LBB40_8
; %bb.6:
	ldx	__rc9
	bne	.LBB40_8
; %bb.7:
	ldx	__rc8
	beq	.LBB40_17
.LBB40_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB40_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB40_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB40_11
; %bb.90:
	jmp	.LBB40_31
.LBB40_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB40_12
; %bb.92:
	jmp	.LBB40_32
.LBB40_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB40_13
; %bb.94:
	jmp	.LBB40_38
.LBB40_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB40_14
; %bb.96:
	jmp	.LBB40_40
.LBB40_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB40_15
; %bb.98:
	jmp	.LBB40_42
.LBB40_15:
	cmp	__rc8
	bcc	.LBB40_17
	bra	.LBB40_19
.LBB40_16:
	cpx	__rc15
	bcs	.LBB40_19
.LBB40_17:
	lda	#0
; %bb.66:
	jmp	.LBB40_29
.LBB40_18:
	cpx	__rc14
	bcc	.LBB40_17
.LBB40_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB40_20
; %bb.100:
	jmp	.LBB40_29
.LBB40_20:
	ldx	#0
	ldy	__rc8
	sty	__rc19
	ldy	__rc9
	sty	mos8(.L__udivdi3_zp_stk)
	ldy	__rc10
	sty	mos8(.L__udivdi3_zp_stk+1)
	ldy	__rc11
	sty	mos8(.L__udivdi3_zp_stk+2)
	ldy	__rc12
	sty	mos8(.L__udivdi3_zp_stk+3)
	ldy	__rc13
	sty	mos8(.L__udivdi3_zp_stk+4)
	ldy	__rc14
	sty	mos8(.L__udivdi3_zp_stk+5)
	ldy	__rc15
	sty	mos8(.L__udivdi3_zp_stk+6)
.LBB40_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc19
	rol	mos8(.L__udivdi3_zp_stk)
	rol	mos8(.L__udivdi3_zp_stk+1)
	rol	mos8(.L__udivdi3_zp_stk+2)
	rol	mos8(.L__udivdi3_zp_stk+3)
	rol	mos8(.L__udivdi3_zp_stk+4)
	rol	mos8(.L__udivdi3_zp_stk+5)
	rol	mos8(.L__udivdi3_zp_stk+6)
	ldy	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB40_25
; %bb.22:                               ;   in Loop: Header=BB40_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB40_26
; %bb.23:                               ;   in Loop: Header=BB40_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB40_27
; %bb.24:                               ;   in Loop: Header=BB40_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB40_102
; %bb.150:                              ;   in Loop: Header=BB40_21 Depth=1
	jmp	.LBB40_33
.LBB40_102:                             ;   in Loop: Header=BB40_21 Depth=1
	jmp	.LBB40_37
.LBB40_25:                              ;   in Loop: Header=BB40_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB40_28
; %bb.104:
	jmp	.LBB40_44
.LBB40_26:                              ;   in Loop: Header=BB40_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB40_28
; %bb.106:
	jmp	.LBB40_44
.LBB40_27:                              ;   in Loop: Header=BB40_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB40_28
; %bb.108:
	jmp	.LBB40_44
.LBB40_28:                              ;   in Loop: Header=BB40_21 Depth=1
	inx
	ldy	__rc19
	sty	__rc8
	ldy	mos8(.L__udivdi3_zp_stk)
	sty	__rc9
	ldy	mos8(.L__udivdi3_zp_stk+1)
	sty	__rc10
	ldy	mos8(.L__udivdi3_zp_stk+2)
	sty	__rc11
	ldy	mos8(.L__udivdi3_zp_stk+3)
	sty	__rc12
	ldy	mos8(.L__udivdi3_zp_stk+4)
	sty	__rc13
	ldy	mos8(.L__udivdi3_zp_stk+5)
	sty	__rc14
	ldy	mos8(.L__udivdi3_zp_stk+6)
	sty	__rc15
	bmi	.LBB40_68
; %bb.110:                              ;   in Loop: Header=BB40_21 Depth=1
	jmp	.LBB40_21
.LBB40_68:
	jmp	.LBB40_45
.LBB40_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB40_30:
	ldx	__rc18
	rts
.LBB40_31:
	cpx	__rc13
	bcs	.LBB40_70
; %bb.112:
	jmp	.LBB40_17
.LBB40_70:
	jmp	.LBB40_19
.LBB40_32:
	cpx	__rc12
	bcs	.LBB40_72
; %bb.114:
	jmp	.LBB40_17
.LBB40_72:
	jmp	.LBB40_19
.LBB40_33:                              ;   in Loop: Header=BB40_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB40_39
; %bb.34:                               ;   in Loop: Header=BB40_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB40_41
; %bb.35:                               ;   in Loop: Header=BB40_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB40_43
; %bb.36:                               ;   in Loop: Header=BB40_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB40_44
; %bb.74:                               ;   in Loop: Header=BB40_21 Depth=1
	jmp	.LBB40_28
.LBB40_37:                              ;   in Loop: Header=BB40_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB40_44
; %bb.76:                               ;   in Loop: Header=BB40_21 Depth=1
	jmp	.LBB40_28
.LBB40_38:
	cpx	__rc11
	bcs	.LBB40_78
; %bb.116:
	jmp	.LBB40_17
.LBB40_78:
	jmp	.LBB40_19
.LBB40_39:                              ;   in Loop: Header=BB40_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB40_44
; %bb.80:                               ;   in Loop: Header=BB40_21 Depth=1
	jmp	.LBB40_28
.LBB40_40:
	cpx	__rc10
	bcs	.LBB40_82
; %bb.118:
	jmp	.LBB40_17
.LBB40_82:
	jmp	.LBB40_19
.LBB40_41:                              ;   in Loop: Header=BB40_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB40_44
; %bb.84:                               ;   in Loop: Header=BB40_21 Depth=1
	jmp	.LBB40_28
.LBB40_42:
	cpx	__rc9
	bcs	.LBB40_86
; %bb.120:
	jmp	.LBB40_17
.LBB40_86:
	jmp	.LBB40_19
.LBB40_43:                              ;   in Loop: Header=BB40_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB40_44
; %bb.122:                              ;   in Loop: Header=BB40_21 Depth=1
	jmp	.LBB40_28
.LBB40_44:
	ldy	__rc8
	sty	__rc19
	ldy	__rc9
	sty	mos8(.L__udivdi3_zp_stk)
	ldy	__rc10
	sty	mos8(.L__udivdi3_zp_stk+1)
	ldy	__rc11
	sty	mos8(.L__udivdi3_zp_stk+2)
	ldy	__rc12
	sty	mos8(.L__udivdi3_zp_stk+3)
	ldy	__rc13
	sty	mos8(.L__udivdi3_zp_stk+4)
	ldy	__rc14
	sty	mos8(.L__udivdi3_zp_stk+5)
	ldy	__rc15
	sty	mos8(.L__udivdi3_zp_stk+6)
.LBB40_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB40_46
; %bb.124:
	jmp	.LBB40_30
.LBB40_46:
	stz	__rc18
	sec
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	tya
	sbc	__rc19
	sta	__rc8
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	tya
	sbc	mos8(.L__udivdi3_zp_stk)
	sta	__rc9
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	tya
	sbc	mos8(.L__udivdi3_zp_stk+1)
	sta	__rc10
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	tya
	sbc	mos8(.L__udivdi3_zp_stk+2)
	sta	__rc11
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	tya
	sbc	mos8(.L__udivdi3_zp_stk+3)
	sta	__rc12
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	tya
	sbc	mos8(.L__udivdi3_zp_stk+4)
	sta	__rc13
	lda	mos8(.L__udivdi3_zp_stk+7)
	sbc	mos8(.L__udivdi3_zp_stk+5)
	sta	__rc14
	ldy	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Reload
	tya
	sbc	mos8(.L__udivdi3_zp_stk+6)
	sta	__rc15
	lda	#1
	stz	__rc2
.LBB40_47:                              ; =>This Inner Loop Header: Depth=1
	lsr	mos8(.L__udivdi3_zp_stk+6)
	ror	mos8(.L__udivdi3_zp_stk+5)
	ror	mos8(.L__udivdi3_zp_stk+4)
	ror	mos8(.L__udivdi3_zp_stk+3)
	ror	mos8(.L__udivdi3_zp_stk+2)
	ror	mos8(.L__udivdi3_zp_stk+1)
	ror	mos8(.L__udivdi3_zp_stk)
	ror	__rc19
	asl
	ldy	#1
	bcs	.LBB40_49
; %bb.48:                               ;   in Loop: Header=BB40_47 Depth=1
	ldy	#0
.LBB40_49:                              ;   in Loop: Header=BB40_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB40_57
; %bb.50:                               ;   in Loop: Header=BB40_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB40_51
; %bb.126:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_60
.LBB40_51:                              ;   in Loop: Header=BB40_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB40_52
; %bb.128:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_61
.LBB40_52:                              ;   in Loop: Header=BB40_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB40_53
; %bb.130:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_62
.LBB40_53:                              ;   in Loop: Header=BB40_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB40_54
; %bb.132:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_63
.LBB40_54:                              ;   in Loop: Header=BB40_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB40_55
; %bb.134:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_64
.LBB40_55:                              ;   in Loop: Header=BB40_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB40_56
; %bb.136:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_65
.LBB40_56:                              ;   in Loop: Header=BB40_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB40_58
	bra	.LBB40_59
.LBB40_57:                              ;   in Loop: Header=BB40_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB40_59
.LBB40_58:                              ;   in Loop: Header=BB40_47 Depth=1
	tay
	sec
	lda	__rc8
	sbc	__rc19
	sta	__rc8
	lda	__rc9
	sbc	mos8(.L__udivdi3_zp_stk)
	sta	__rc9
	lda	__rc10
	sbc	mos8(.L__udivdi3_zp_stk+1)
	sta	__rc10
	lda	__rc11
	sbc	mos8(.L__udivdi3_zp_stk+2)
	sta	__rc11
	lda	__rc12
	sbc	mos8(.L__udivdi3_zp_stk+3)
	sta	__rc12
	lda	__rc13
	sbc	mos8(.L__udivdi3_zp_stk+4)
	sta	__rc13
	lda	__rc14
	sbc	mos8(.L__udivdi3_zp_stk+5)
	sta	__rc14
	lda	__rc15
	sbc	mos8(.L__udivdi3_zp_stk+6)
	sta	__rc15
	tya
	ora	#1
.LBB40_59:                              ;   in Loop: Header=BB40_47 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+7)
	cpy	#1
	rol	__rc18
	rol	__rc2
	rol	__rc3
	rol	__rc4
	rol	__rc5
	rol	__rc6
	rol	__rc7
	dex
	beq	.LBB40_88
; %bb.138:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_47
.LBB40_88:
	jmp	.LBB40_30
.LBB40_60:                              ;   in Loop: Header=BB40_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB40_58
	bra	.LBB40_59
.LBB40_61:                              ;   in Loop: Header=BB40_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB40_59
; %bb.140:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_58
.LBB40_62:                              ;   in Loop: Header=BB40_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB40_59
; %bb.142:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_58
.LBB40_63:                              ;   in Loop: Header=BB40_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB40_59
; %bb.144:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_58
.LBB40_64:                              ;   in Loop: Header=BB40_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB40_59
; %bb.146:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_58
.LBB40_65:                              ;   in Loop: Header=BB40_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB40_59
; %bb.148:                              ;   in Loop: Header=BB40_47 Depth=1
	jmp	.LBB40_58
.Lfunc_end40:
	.size	__udivdi3, .Lfunc_end40-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB41_1
; %bb.15:
	jmp	.LBB41_13
.LBB41_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB41_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB41_14
; %bb.3:
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB41_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB41_6
; %bb.5:                                ;   in Loop: Header=BB41_4 Depth=1
	cmp	__rc2
	bcc	.LBB41_8
	bra	.LBB41_7
.LBB41_6:                               ;   in Loop: Header=BB41_4 Depth=1
	cpy	__rc4
	bcc	.LBB41_8
.LBB41_7:                               ;   in Loop: Header=BB41_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB41_4
	bra	.LBB41_9
.LBB41_8:
	ldy	__rc3
	sty	__rc2
.LBB41_9:
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB41_13
.LBB41_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB41_12
; %bb.11:                               ;   in Loop: Header=BB41_10 Depth=1
	sec
	sbc	__rc2
.LBB41_12:                              ;   in Loop: Header=BB41_10 Depth=1
	dex
	bne	.LBB41_10
.LBB41_13:
	rts
.LBB41_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end41:
	.size	__umodqi3, .Lfunc_end41-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB42_2
; %bb.1:
	ldx	__rc2
	bne	.LBB42_2
; %bb.22:
	jmp	.LBB42_19
.LBB42_2:
	cmp	__rc3
	bne	.LBB42_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB42_5
; %bb.20:
	jmp	.LBB42_19
.LBB42_4:
	cmp	__rc3
	bcs	.LBB42_5
; %bb.24:
	jmp	.LBB42_19
.LBB42_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB42_6
; %bb.26:
	jmp	.LBB42_18
.LBB42_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB42_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB42_9
; %bb.8:                                ;   in Loop: Header=BB42_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB42_11
	bra	.LBB42_10
.LBB42_9:                               ;   in Loop: Header=BB42_7 Depth=1
	cmp	__rc5
	bcc	.LBB42_11
.LBB42_10:                              ;   in Loop: Header=BB42_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB42_7
	bra	.LBB42_12
.LBB42_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB42_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB42_19
.LBB42_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB42_17
; %bb.14:                               ;   in Loop: Header=BB42_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB42_16
.LBB42_15:                              ;   in Loop: Header=BB42_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB42_16:                              ;   in Loop: Header=BB42_13 Depth=1
	dex
	bne	.LBB42_13
	bra	.LBB42_19
.LBB42_17:                              ;   in Loop: Header=BB42_13 Depth=1
	cmp	__rc5
	bcs	.LBB42_15
	bra	.LBB42_16
.LBB42_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB42_19:
	tax
	tya
	rts
.Lfunc_end42:
	.size	__umodhi3, .Lfunc_end42-__umodhi3
                                        ; -- End function
	.section	.text.__umodsi3,"ax",@progbits
	.globl	__umodsi3                       ; -- Begin function __umodsi3
	.type	__umodsi3,@function
__umodsi3:                              ; @__umodsi3
; %bb.0:
	sta	__rc12
	stx	__rc10
	lda	__rc2
	ldx	__rc7
	bne	.LBB43_4
; %bb.1:
	ldx	__rc6
	bne	.LBB43_4
; %bb.2:
	ldx	__rc5
	bne	.LBB43_4
; %bb.3:
	ldx	__rc4
	bne	.LBB43_4
; %bb.42:
	jmp	.LBB43_35
.LBB43_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB43_8
; %bb.5:
	cmp	__rc6
	bne	.LBB43_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB43_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB43_11
; %bb.36:
	jmp	.LBB43_35
.LBB43_8:
	cpx	__rc7
	bcs	.LBB43_11
; %bb.38:
	jmp	.LBB43_35
.LBB43_9:
	cmp	__rc6
	bcs	.LBB43_11
; %bb.40:
	jmp	.LBB43_35
.LBB43_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB43_11
; %bb.44:
	jmp	.LBB43_35
.LBB43_11:
	ldx	__rc7
	bpl	.LBB43_12
; %bb.46:
	jmp	.LBB43_33
.LBB43_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB43_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB43_17
; %bb.14:                               ;   in Loop: Header=BB43_13 Depth=1
	cmp	__rc8
	bne	.LBB43_18
; %bb.15:                               ;   in Loop: Header=BB43_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB43_19
; %bb.16:                               ;   in Loop: Header=BB43_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB43_21
	bra	.LBB43_20
.LBB43_17:                              ;   in Loop: Header=BB43_13 Depth=1
	cpy	__rc9
	bcc	.LBB43_21
	bra	.LBB43_20
.LBB43_18:                              ;   in Loop: Header=BB43_13 Depth=1
	cmp	__rc8
	bcc	.LBB43_21
	bra	.LBB43_20
.LBB43_19:                              ;   in Loop: Header=BB43_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB43_21
.LBB43_20:                              ;   in Loop: Header=BB43_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB43_13
	bra	.LBB43_22
.LBB43_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB43_22:
	sec
	tay
	lda	__rc12
	sbc	__rc2
	sta	__rc12
	lda	__rc10
	sbc	__rc11
	sta	__rc10
	tya
	sbc	__rc8
	tay
	lda	__rc3
	sbc	__rc9
	sta	__rc3
	txa
	bne	.LBB43_23
; %bb.48:
	jmp	.LBB43_34
.LBB43_23:
	tya
.LBB43_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB43_28
; %bb.25:                               ;   in Loop: Header=BB43_24 Depth=1
	cmp	__rc8
	bne	.LBB43_31
; %bb.26:                               ;   in Loop: Header=BB43_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB43_32
; %bb.27:                               ;   in Loop: Header=BB43_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB43_29
	bra	.LBB43_30
.LBB43_28:                              ;   in Loop: Header=BB43_24 Depth=1
	cpy	__rc9
	bcc	.LBB43_30
.LBB43_29:                              ;   in Loop: Header=BB43_24 Depth=1
	tay
	sec
	lda	__rc12
	sbc	__rc2
	sta	__rc12
	lda	__rc10
	sbc	__rc11
	sta	__rc10
	tya
	sbc	__rc8
	tay
	lda	__rc3
	sbc	__rc9
	sta	__rc3
	tya
.LBB43_30:                              ;   in Loop: Header=BB43_24 Depth=1
	dex
	bne	.LBB43_24
	bra	.LBB43_35
.LBB43_31:                              ;   in Loop: Header=BB43_24 Depth=1
	cmp	__rc8
	bcs	.LBB43_29
	bra	.LBB43_30
.LBB43_32:                              ;   in Loop: Header=BB43_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB43_29
	bra	.LBB43_30
.LBB43_33:
	sec
	tay
	lda	__rc12
	sbc	__rc4
	sta	__rc12
	lda	__rc10
	sbc	__rc5
	sta	__rc10
	tya
	sbc	__rc6
	tax
	lda	__rc3
	sbc	__rc7
	sta	__rc3
	txa
	bra	.LBB43_35
.LBB43_34:
	tya
.LBB43_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end43:
	.size	__umodsi3, .Lfunc_end43-__umodsi3
                                        ; -- End function
	.section	.text.__umoddi3,"ax",@progbits
	.globl	__umoddi3                       ; -- Begin function __umoddi3
	.type	__umoddi3,@function
__umoddi3:                              ; @__umoddi3
; %bb.0:
	sta	mos8(.L__umoddi3_zp_stk+1)
	stx	mos8(.L__umoddi3_zp_stk+2)
	lda	__rc7
	ldx	__rc15
	bne	.LBB44_8
; %bb.1:
	ldx	__rc14
	bne	.LBB44_8
; %bb.2:
	ldx	__rc13
	bne	.LBB44_8
; %bb.3:
	ldx	__rc12
	bne	.LBB44_8
; %bb.4:
	ldx	__rc11
	bne	.LBB44_8
; %bb.5:
	ldx	__rc10
	bne	.LBB44_8
; %bb.6:
	ldx	__rc9
	bne	.LBB44_8
; %bb.7:
	ldx	__rc8
	bne	.LBB44_8
; %bb.90:
	jmp	.LBB44_61
.LBB44_8:
	cmp	__rc15
	bne	.LBB44_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB44_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB44_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB44_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB44_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB44_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB44_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB44_23
; %bb.62:
	jmp	.LBB44_61
.LBB44_16:
	cmp	__rc15
	bcs	.LBB44_23
; %bb.64:
	jmp	.LBB44_61
.LBB44_17:
	cpx	__rc14
	bcs	.LBB44_23
; %bb.66:
	jmp	.LBB44_61
.LBB44_18:
	cpx	__rc13
	bcs	.LBB44_23
; %bb.68:
	jmp	.LBB44_61
.LBB44_19:
	cpx	__rc12
	bcs	.LBB44_23
; %bb.70:
	jmp	.LBB44_61
.LBB44_20:
	cpx	__rc11
	bcs	.LBB44_23
; %bb.72:
	jmp	.LBB44_61
.LBB44_21:
	cpx	__rc10
	bcs	.LBB44_23
; %bb.74:
	jmp	.LBB44_61
.LBB44_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB44_23
; %bb.92:
	jmp	.LBB44_61
.LBB44_23:
	ldx	__rc15
	bpl	.LBB44_24
; %bb.94:
	jmp	.LBB44_33
.LBB44_24:
	ldx	#0
	ldy	__rc8
	sty	mos8(.L__umoddi3_zp_stk+6)
	ldy	__rc9
	sty	mos8(.L__umoddi3_zp_stk+5)
	ldy	__rc10
	sty	mos8(.L__umoddi3_zp_stk+4)
	ldy	__rc11
	sty	mos8(.L__umoddi3_zp_stk+3)
	ldy	__rc12
	sty	mos8(.L__umoddi3_zp_stk)
	ldy	__rc13
	sty	__rc7
	ldy	__rc14
	sty	__rc18
	ldy	__rc15
	sty	__rc19
.LBB44_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB44_29
; %bb.26:                               ;   in Loop: Header=BB44_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB44_30
; %bb.27:                               ;   in Loop: Header=BB44_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB44_31
; %bb.28:                               ;   in Loop: Header=BB44_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB44_76
; %bb.96:                               ;   in Loop: Header=BB44_25 Depth=1
	jmp	.LBB44_38
.LBB44_76:                              ;   in Loop: Header=BB44_25 Depth=1
	jmp	.LBB44_34
.LBB44_29:                              ;   in Loop: Header=BB44_25 Depth=1
	cmp	__rc19
	bcs	.LBB44_32
; %bb.98:
	jmp	.LBB44_42
.LBB44_30:                              ;   in Loop: Header=BB44_25 Depth=1
	cpy	__rc18
	bcs	.LBB44_32
; %bb.100:
	jmp	.LBB44_42
.LBB44_31:                              ;   in Loop: Header=BB44_25 Depth=1
	cpy	__rc7
	bcs	.LBB44_32
; %bb.102:
	jmp	.LBB44_42
.LBB44_32:                              ;   in Loop: Header=BB44_25 Depth=1
	inx
	ldy	mos8(.L__umoddi3_zp_stk+6)
	sty	__rc8
	ldy	mos8(.L__umoddi3_zp_stk+5)
	sty	__rc9
	ldy	mos8(.L__umoddi3_zp_stk+4)
	sty	__rc10
	ldy	mos8(.L__umoddi3_zp_stk+3)
	sty	__rc11
	ldy	mos8(.L__umoddi3_zp_stk)
	sty	__rc12
	ldy	__rc7
	sty	__rc13
	ldy	__rc18
	sty	__rc14
	ldy	__rc19
	sty	__rc15
	bmi	.LBB44_78
; %bb.104:                              ;   in Loop: Header=BB44_25 Depth=1
	jmp	.LBB44_25
.LBB44_78:
	jmp	.LBB44_43
.LBB44_33:
	sec
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	sbc	__rc8
	sta	mos8(.L__umoddi3_zp_stk+1)
	lda	mos8(.L__umoddi3_zp_stk+2)
	sbc	__rc9
	sta	mos8(.L__umoddi3_zp_stk+2)
	lda	__rc2
	sbc	__rc10
	sta	__rc2
	lda	__rc3
	sbc	__rc11
	sta	__rc3
	lda	__rc4
	sbc	__rc12
	sta	__rc4
	lda	__rc5
	sbc	__rc13
	sta	__rc5
	lda	__rc6
	sbc	__rc14
	sta	__rc6
	tya
	sbc	__rc15
; %bb.80:
	jmp	.LBB44_61
.LBB44_34:                              ;   in Loop: Header=BB44_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB44_39
; %bb.35:                               ;   in Loop: Header=BB44_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB44_40
; %bb.36:                               ;   in Loop: Header=BB44_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB44_41
; %bb.37:                               ;   in Loop: Header=BB44_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB44_42
; %bb.82:                               ;   in Loop: Header=BB44_25 Depth=1
	jmp	.LBB44_32
.LBB44_38:                              ;   in Loop: Header=BB44_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB44_42
; %bb.84:                               ;   in Loop: Header=BB44_25 Depth=1
	jmp	.LBB44_32
.LBB44_39:                              ;   in Loop: Header=BB44_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB44_42
; %bb.86:                               ;   in Loop: Header=BB44_25 Depth=1
	jmp	.LBB44_32
.LBB44_40:                              ;   in Loop: Header=BB44_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB44_42
; %bb.88:                               ;   in Loop: Header=BB44_25 Depth=1
	jmp	.LBB44_32
.LBB44_41:                              ;   in Loop: Header=BB44_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB44_42
; %bb.106:                              ;   in Loop: Header=BB44_25 Depth=1
	jmp	.LBB44_32
.LBB44_42:
	ldy	__rc8
	sty	mos8(.L__umoddi3_zp_stk+6)
	ldy	__rc9
	sty	mos8(.L__umoddi3_zp_stk+5)
	ldy	__rc10
	sty	mos8(.L__umoddi3_zp_stk+4)
	ldy	__rc11
	sty	mos8(.L__umoddi3_zp_stk+3)
	ldy	__rc12
	sty	mos8(.L__umoddi3_zp_stk)
	ldy	__rc13
	sty	__rc7
	ldy	__rc14
	sty	__rc18
	ldy	__rc15
	sty	__rc19
.LBB44_43:
	sec
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	sbc	mos8(.L__umoddi3_zp_stk+6)
	sta	mos8(.L__umoddi3_zp_stk+1)
	lda	mos8(.L__umoddi3_zp_stk+2)
	sbc	mos8(.L__umoddi3_zp_stk+5)
	sta	mos8(.L__umoddi3_zp_stk+2)
	lda	__rc2
	sbc	mos8(.L__umoddi3_zp_stk+4)
	sta	__rc2
	lda	__rc3
	sbc	mos8(.L__umoddi3_zp_stk+3)
	sta	__rc3
	lda	__rc4
	sbc	mos8(.L__umoddi3_zp_stk)
	sta	__rc4
	lda	__rc5
	sbc	__rc7
	sta	__rc5
	lda	__rc6
	sbc	__rc18
	sta	__rc6
	tya
	sbc	__rc19
	cpx	#0
	bne	.LBB44_44
; %bb.108:
	jmp	.LBB44_61
.LBB44_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB44_52
; %bb.45:                               ;   in Loop: Header=BB44_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB44_46
; %bb.110:                              ;   in Loop: Header=BB44_44 Depth=1
	jmp	.LBB44_55
.LBB44_46:                              ;   in Loop: Header=BB44_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB44_47
; %bb.112:                              ;   in Loop: Header=BB44_44 Depth=1
	jmp	.LBB44_56
.LBB44_47:                              ;   in Loop: Header=BB44_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB44_48
; %bb.114:                              ;   in Loop: Header=BB44_44 Depth=1
	jmp	.LBB44_57
.LBB44_48:                              ;   in Loop: Header=BB44_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB44_49
; %bb.116:                              ;   in Loop: Header=BB44_44 Depth=1
	jmp	.LBB44_58
.LBB44_49:                              ;   in Loop: Header=BB44_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB44_50
; %bb.118:                              ;   in Loop: Header=BB44_44 Depth=1
	jmp	.LBB44_59
.LBB44_50:                              ;   in Loop: Header=BB44_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB44_51
; %bb.120:                              ;   in Loop: Header=BB44_44 Depth=1
	jmp	.LBB44_60
.LBB44_51:                              ;   in Loop: Header=BB44_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB44_53
	bra	.LBB44_54
.LBB44_52:                              ;   in Loop: Header=BB44_44 Depth=1
	cmp	__rc19
	bcc	.LBB44_54
.LBB44_53:                              ;   in Loop: Header=BB44_44 Depth=1
	tay
	sec
	lda	mos8(.L__umoddi3_zp_stk+1)
	sbc	mos8(.L__umoddi3_zp_stk+6)
	sta	mos8(.L__umoddi3_zp_stk+1)
	lda	mos8(.L__umoddi3_zp_stk+2)
	sbc	mos8(.L__umoddi3_zp_stk+5)
	sta	mos8(.L__umoddi3_zp_stk+2)
	lda	__rc2
	sbc	mos8(.L__umoddi3_zp_stk+4)
	sta	__rc2
	lda	__rc3
	sbc	mos8(.L__umoddi3_zp_stk+3)
	sta	__rc3
	lda	__rc4
	sbc	mos8(.L__umoddi3_zp_stk)
	sta	__rc4
	lda	__rc5
	sbc	__rc7
	sta	__rc5
	lda	__rc6
	sbc	__rc18
	sta	__rc6
	tya
	sbc	__rc19
.LBB44_54:                              ;   in Loop: Header=BB44_44 Depth=1
	dex
	beq	.LBB44_61
; %bb.122:                              ;   in Loop: Header=BB44_44 Depth=1
	jmp	.LBB44_44
.LBB44_55:                              ;   in Loop: Header=BB44_44 Depth=1
	cpy	__rc18
	bcs	.LBB44_53
	bra	.LBB44_54
.LBB44_56:                              ;   in Loop: Header=BB44_44 Depth=1
	cpy	__rc7
	bcs	.LBB44_53
	bra	.LBB44_54
.LBB44_57:                              ;   in Loop: Header=BB44_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB44_53
	bra	.LBB44_54
.LBB44_58:                              ;   in Loop: Header=BB44_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB44_53
	bra	.LBB44_54
.LBB44_59:                              ;   in Loop: Header=BB44_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB44_53
	bra	.LBB44_54
.LBB44_60:                              ;   in Loop: Header=BB44_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB44_54
; %bb.124:                              ;   in Loop: Header=BB44_44 Depth=1
	jmp	.LBB44_53
.LBB44_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end44:
	.size	__umoddi3, .Lfunc_end44-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB45_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB45_2
; %bb.18:
	jmp	.LBB45_17
.LBB45_2:
	lda	__rc5
	bpl	.LBB45_3
; %bb.20:
	jmp	.LBB45_15
.LBB45_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB45_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB45_6
; %bb.5:                                ;   in Loop: Header=BB45_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB45_9
	bra	.LBB45_7
.LBB45_6:                               ;   in Loop: Header=BB45_4 Depth=1
	cpy	__rc6
	bcc	.LBB45_9
.LBB45_7:                               ;   in Loop: Header=BB45_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB45_4
	bra	.LBB45_10
.LBB45_8:
	sty	__rc7
	bra	.LBB45_17
.LBB45_9:
	ldy	__rc5
	sty	__rc4
.LBB45_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB45_16
; %bb.11:
	lda	#1
.LBB45_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB45_14
; %bb.13:                               ;   in Loop: Header=BB45_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB45_14:                              ;   in Loop: Header=BB45_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB45_12
	bra	.LBB45_17
.LBB45_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB45_16:
	lda	#1
.LBB45_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end45:
	.size	__udivmodqi4, .Lfunc_end45-__udivmodqi4
                                        ; -- End function
	.section	.text.__udivmodhi4,"ax",@progbits
	.globl	__udivmodhi4                    ; -- Begin function __udivmodhi4
	.type	__udivmodhi4,@function
__udivmodhi4:                           ; @__udivmodhi4
; %bb.0:
	sta	__rc9
	txa
	stz	__rc6
	ldx	__rc3
	bne	.LBB46_2
; %bb.1:
	ldx	__rc2
	beq	.LBB46_4
.LBB46_2:
	cmp	__rc3
	bne	.LBB46_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB46_6
.LBB46_4:
	ldx	#0
; %bb.26:
	jmp	.LBB46_24
.LBB46_5:
	cmp	__rc3
	bcc	.LBB46_4
.LBB46_6:
	tay
	ldx	__rc3
	bpl	.LBB46_7
; %bb.28:
	jmp	.LBB46_22
.LBB46_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB46_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB46_10
; %bb.9:                                ;   in Loop: Header=BB46_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB46_11
	bra	.LBB46_12
.LBB46_10:                              ;   in Loop: Header=BB46_8 Depth=1
	cmp	__rc8
	bcc	.LBB46_12
.LBB46_11:                              ;   in Loop: Header=BB46_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB46_8
	bra	.LBB46_13
.LBB46_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB46_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB46_14
; %bb.30:
	jmp	.LBB46_23
.LBB46_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB46_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB46_17
; %bb.16:                               ;   in Loop: Header=BB46_15 Depth=1
	ldy	#0
.LBB46_17:                              ;   in Loop: Header=BB46_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB46_21
; %bb.18:                               ;   in Loop: Header=BB46_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB46_20
.LBB46_19:                              ;   in Loop: Header=BB46_15 Depth=1
	tay
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	ora	#1
	sta	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
.LBB46_20:                              ;   in Loop: Header=BB46_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB46_15
	bra	.LBB46_25
.LBB46_21:                              ;   in Loop: Header=BB46_15 Depth=1
	cmp	__rc8
	bcs	.LBB46_19
	bra	.LBB46_20
.LBB46_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB46_23:
	ldx	#1
.LBB46_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB46_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end46:
	.size	__udivmodhi4, .Lfunc_end46-__udivmodhi4
                                        ; -- End function
	.section	.text.__divqi3,"ax",@progbits
	.globl	__divqi3                        ; -- Begin function __divqi3
	.type	__divqi3,@function
__divqi3:                               ; @__divqi3
; %bb.0:
	sta	mos8(.L__divqi3_zp_stk)
	stx	__rc2
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	bpl	.LBB47_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB47_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB47_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB47_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB47_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB47_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB47_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB47_8:
	lda	__rc2
	rts
.Lfunc_end47:
	.size	__divqi3, .Lfunc_end47-__divqi3
                                        ; -- End function
	.section	.text.__divhi3,"ax",@progbits
	.globl	__divhi3                        ; -- Begin function __divhi3
	.type	__divhi3,@function
__divhi3:                               ; @__divhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__divhi3_zp_stk)
	ldy	__rc3
	txa
	bmi	.LBB48_2
; %bb.1:
	bra	.LBB48_6
.LBB48_2:
	cpx	#128
	bne	.LBB48_5
; %bb.3:
	lda	__rc4
	bne	.LBB48_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB48_6
.LBB48_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB48_6:
	tya
	bmi	.LBB48_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB48_12
.LBB48_8:
	cpy	#128
	bne	.LBB48_11
; %bb.9:
	lda	__rc2
	bne	.LBB48_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB48_12
.LBB48_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB48_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB48_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB48_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end48:
	.size	__divhi3, .Lfunc_end48-__divhi3
                                        ; -- End function
	.section	.text.__divsi3,"ax",@progbits
	.globl	__divsi3                        ; -- Begin function __divsi3
	.type	__divsi3,@function
__divsi3:                               ; @__divsi3
; %bb.0:
	sta	__rc9
	stx	__rc8
	ldx	__rc3
	stx	mos8(.L__divsi3_zp_stk+1)
	ldx	__rc7
	stx	mos8(.L__divsi3_zp_stk)
	lda	__rc3
	bmi	.LBB49_2
; %bb.1:
	ldy	__rc3
	bra	.LBB49_8
.LBB49_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB49_7
; %bb.3:
	lda	__rc2
	bne	.LBB49_7
; %bb.4:
	lda	__rc8
	bne	.LBB49_7
; %bb.5:
	lda	__rc9
	bne	.LBB49_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB49_8
.LBB49_7:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc8
	sta	__rc8
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	mos8(.L__divsi3_zp_stk+1)
	tay
.LBB49_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB49_10
; %bb.9:
	lda	__rc7
	bra	.LBB49_16
.LBB49_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB49_15
; %bb.11:
	lda	__rc6
	bne	.LBB49_15
; %bb.12:
	lda	__rc5
	bne	.LBB49_15
; %bb.13:
	lda	__rc4
	bne	.LBB49_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB49_16
.LBB49_15:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	__rc5
	sta	__rc5
	lda	#0
	sbc	__rc6
	sta	__rc6
	lda	#0
	sbc	mos8(.L__divsi3_zp_stk)
.LBB49_16:
	sty	__rc3
	sta	__rc7
	ldx	__rc8
	lda	__rc9
	jsr	__udivsi3
	sta	__rc5
	stx	__rc4
	stz	__rc7
	asl	mos8(.L__divsi3_zp_stk+1)
	stz	__rc8
	rol	__rc8
	lda	#0
	rol
	asl	mos8(.L__divsi3_zp_stk)
	stz	__rc6
	rol	__rc6
	rol	__rc7
	cmp	__rc7
	bne	.LBB49_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB49_19
.LBB49_18:
	sec
	lda	#0
	sbc	__rc5
	sta	__rc5
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB49_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end49:
	.size	__divsi3, .Lfunc_end49-__divsi3
                                        ; -- End function
	.section	.text.__divdi3,"ax",@progbits
	.globl	__divdi3                        ; -- Begin function __divdi3
	.type	__divdi3,@function
__divdi3:                               ; @__divdi3
; %bb.0:
	sta	__rc19
	stx	__rc18
	ldx	__rc7
	stx	mos8(.L__divdi3_zp_stk+1)
	ldx	__rc15
	stx	mos8(.L__divdi3_zp_stk)
	lda	__rc7
	bmi	.LBB50_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB50_12
.LBB50_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB50_11
; %bb.3:
	lda	__rc6
	bne	.LBB50_11
; %bb.4:
	lda	__rc5
	bne	.LBB50_11
; %bb.5:
	lda	__rc4
	bne	.LBB50_11
; %bb.6:
	lda	__rc3
	bne	.LBB50_11
; %bb.7:
	lda	__rc2
	bne	.LBB50_11
; %bb.8:
	lda	__rc18
	bne	.LBB50_11
; %bb.9:
	lda	__rc19
	bne	.LBB50_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB50_12
.LBB50_11:
	sec
	lda	#0
	sbc	__rc19
	sta	__rc19
	lda	#0
	sbc	__rc18
	sta	__rc18
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	__rc5
	sta	__rc5
	lda	#0
	sbc	__rc6
	sta	__rc6
	lda	#0
	sbc	mos8(.L__divdi3_zp_stk+1)
	tay
.LBB50_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB50_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB50_24
.LBB50_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB50_23
; %bb.15:
	lda	__rc14
	bne	.LBB50_23
; %bb.16:
	lda	__rc13
	bne	.LBB50_23
; %bb.17:
	lda	__rc12
	bne	.LBB50_23
; %bb.18:
	lda	__rc11
	bne	.LBB50_23
; %bb.19:
	lda	__rc10
	bne	.LBB50_23
; %bb.20:
	lda	__rc9
	bne	.LBB50_23
; %bb.21:
	lda	__rc8
	bne	.LBB50_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB50_24
.LBB50_23:
	sec
	lda	#0
	sbc	__rc8
	sta	__rc8
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc10
	sta	__rc10
	lda	#0
	sbc	__rc11
	sta	__rc11
	lda	#0
	sbc	__rc12
	sta	__rc12
	lda	#0
	sbc	__rc13
	sta	__rc13
	lda	#0
	sbc	__rc14
	sta	__rc14
	lda	#0
	sbc	mos8(.L__divdi3_zp_stk)
.LBB50_24:
	sty	__rc7
	sta	__rc15
	ldx	__rc18
	lda	__rc19
	jsr	__udivdi3
	sta	__rc9
	stx	__rc8
	stz	__rc11
	asl	mos8(.L__divdi3_zp_stk+1)
	stz	__rc12
	rol	__rc12
	lda	#0
	rol
	asl	mos8(.L__divdi3_zp_stk)
	stz	__rc10
	rol	__rc10
	rol	__rc11
	cmp	__rc11
	bne	.LBB50_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB50_27
.LBB50_26:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc8
	sta	__rc8
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	__rc5
	sta	__rc5
	lda	#0
	sbc	__rc6
	sta	__rc6
	lda	#0
	sbc	__rc7
	sta	__rc7
.LBB50_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end50:
	.size	__divdi3, .Lfunc_end50-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB51_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB51_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB51_3:
	tay
	lda	__rc2
	bmi	.LBB51_5
; %bb.4:
	lda	__rc2
	bra	.LBB51_7
.LBB51_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB51_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB51_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB51_9
; %bb.8:
	rts
.LBB51_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end51:
	.size	__modqi3, .Lfunc_end51-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB52_2
; %bb.1:
	txa
	bra	.LBB52_6
.LBB52_2:
	cpx	#128
	bne	.LBB52_5
; %bb.3:
	lda	__rc4
	bne	.LBB52_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB52_6
.LBB52_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB52_6:
	ldx	__rc3
	bpl	.LBB52_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB52_10
; %bb.8:
	ldx	__rc2
	bne	.LBB52_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB52_11
.LBB52_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB52_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB52_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB52_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end52:
	.size	__modhi3, .Lfunc_end52-__modhi3
                                        ; -- End function
	.section	.text.__modsi3,"ax",@progbits
	.globl	__modsi3                        ; -- Begin function __modsi3
	.type	__modsi3,@function
__modsi3:                               ; @__modsi3
; %bb.0:
	sta	__rc9
	stx	__rc8
	ldx	__rc3
	stx	mos8(.L__modsi3_zp_stk)
	bmi	.LBB53_2
; %bb.1:
	lda	__rc3
	bra	.LBB53_8
.LBB53_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB53_7
; %bb.3:
	lda	__rc2
	bne	.LBB53_7
; %bb.4:
	lda	__rc8
	bne	.LBB53_7
; %bb.5:
	lda	__rc9
	bne	.LBB53_7
; %bb.6:
	stz	__rc9
	lda	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB53_8
.LBB53_7:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc8
	sta	__rc8
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	mos8(.L__modsi3_zp_stk)
.LBB53_8:
	ldx	__rc7
	bpl	.LBB53_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB53_14
; %bb.10:
	ldx	__rc6
	bne	.LBB53_14
; %bb.11:
	ldx	__rc5
	bne	.LBB53_14
; %bb.12:
	ldx	__rc4
	bne	.LBB53_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB53_15
.LBB53_14:
	tax
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	__rc5
	sta	__rc5
	lda	#0
	sbc	__rc6
	sta	__rc6
	lda	#0
	sbc	__rc7
	sta	__rc7
	txa
.LBB53_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB53_17
; %bb.16:
	sec
	lda	#0
	sbc	__rc5
	sta	__rc5
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB53_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end53:
	.size	__modsi3, .Lfunc_end53-__modsi3
                                        ; -- End function
	.section	.text.__moddi3,"ax",@progbits
	.globl	__moddi3                        ; -- Begin function __moddi3
	.type	__moddi3,@function
__moddi3:                               ; @__moddi3
; %bb.0:
	sta	__rc19
	stx	__rc18
	ldx	__rc7
	stx	mos8(.L__moddi3_zp_stk)
	bmi	.LBB54_2
; %bb.1:
	lda	__rc7
; %bb.26:
	jmp	.LBB54_12
.LBB54_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB54_11
; %bb.3:
	lda	__rc6
	bne	.LBB54_11
; %bb.4:
	lda	__rc5
	bne	.LBB54_11
; %bb.5:
	lda	__rc4
	bne	.LBB54_11
; %bb.6:
	lda	__rc3
	bne	.LBB54_11
; %bb.7:
	lda	__rc2
	bne	.LBB54_11
; %bb.8:
	lda	__rc18
	bne	.LBB54_11
; %bb.9:
	lda	__rc19
	bne	.LBB54_11
; %bb.10:
	stz	__rc19
	lda	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB54_12
.LBB54_11:
	sec
	lda	#0
	sbc	__rc19
	sta	__rc19
	lda	#0
	sbc	__rc18
	sta	__rc18
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	__rc5
	sta	__rc5
	lda	#0
	sbc	__rc6
	sta	__rc6
	lda	#0
	sbc	mos8(.L__moddi3_zp_stk)
.LBB54_12:
	ldx	__rc15
	bmi	.LBB54_13
; %bb.28:
	jmp	.LBB54_23
.LBB54_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB54_22
; %bb.14:
	ldx	__rc14
	bne	.LBB54_22
; %bb.15:
	ldx	__rc13
	bne	.LBB54_22
; %bb.16:
	ldx	__rc12
	bne	.LBB54_22
; %bb.17:
	ldx	__rc11
	bne	.LBB54_22
; %bb.18:
	ldx	__rc10
	bne	.LBB54_22
; %bb.19:
	ldx	__rc9
	bne	.LBB54_22
; %bb.20:
	ldx	__rc8
	bne	.LBB54_22
; %bb.21:
	stz	__rc8
	ldx	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	stx	__rc15
	bra	.LBB54_23
.LBB54_22:
	tax
	sec
	lda	#0
	sbc	__rc8
	sta	__rc8
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc10
	sta	__rc10
	lda	#0
	sbc	__rc11
	sta	__rc11
	lda	#0
	sbc	__rc12
	sta	__rc12
	lda	#0
	sbc	__rc13
	sta	__rc13
	lda	#0
	sbc	__rc14
	sta	__rc14
	lda	#0
	sbc	__rc15
	sta	__rc15
	txa
.LBB54_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB54_25
; %bb.24:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc8
	sta	__rc8
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	__rc5
	sta	__rc5
	lda	#0
	sbc	__rc6
	sta	__rc6
	lda	#0
	sbc	__rc7
	sta	__rc7
.LBB54_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end54:
	.size	__moddi3, .Lfunc_end54-__moddi3
                                        ; -- End function
	.section	.text.__divmodqi4,"ax",@progbits
	.globl	__divmodqi4                     ; -- Begin function __divmodqi4
	.type	__divmodqi4,@function
__divmodqi4:                            ; @__divmodqi4
; %bb.0:
	sta	__rc4
	stx	__rc8
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	bpl	.LBB55_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB55_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB55_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB55_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB55_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB55_11
.LBB55_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB55_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB55_8
; %bb.34:
	jmp	.LBB55_24
.LBB55_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB55_24
.LBB55_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB55_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB55_12
.LBB55_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB55_24
.LBB55_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB55_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB55_15
; %bb.14:                               ;   in Loop: Header=BB55_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB55_18
	bra	.LBB55_16
.LBB55_15:                              ;   in Loop: Header=BB55_13 Depth=1
	cmp	__rc7
	bcc	.LBB55_18
.LBB55_16:                              ;   in Loop: Header=BB55_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB55_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB55_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB55_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB55_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB55_22
; %bb.21:                               ;   in Loop: Header=BB55_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB55_22:                              ;   in Loop: Header=BB55_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB55_20
	bra	.LBB55_24
.LBB55_23:
	sta	__rc7
	sty	__rc6
.LBB55_24:
	lda	__rc4
	bmi	.LBB55_26
; %bb.25:
	lda	__rc7
	bra	.LBB55_27
.LBB55_26:
	lda	#0
	sec
	sbc	__rc7
.LBB55_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB55_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB55_29:
	lda	__rc6
	rts
.Lfunc_end55:
	.size	__divmodqi4, .Lfunc_end55-__divmodqi4
                                        ; -- End function
	.section	.text.__divmodhi4,"ax",@progbits
	.globl	__divmodhi4                     ; -- Begin function __divmodhi4
	.type	__divmodhi4,@function
__divmodhi4:                            ; @__divmodhi4
; %bb.0:
	sta	__rc7
	stx	__rc6
	ldy	__rc3
	cpx	#0
	bmi	.LBB56_2
.LBB56_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB56_6
.LBB56_2:
	cpx	#128
	bne	.LBB56_5
; %bb.3:
	lda	__rc7
	bne	.LBB56_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB56_1
.LBB56_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB56_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB56_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB56_15
; %bb.8:
	lda	__rc2
	bne	.LBB56_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB56_18
.LBB56_10:
	cpy	#128
	bne	.LBB56_14
; %bb.11:
	ldy	__rc2
	bne	.LBB56_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB56_13
; %bb.48:
	jmp	.LBB56_45
.LBB56_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB56_18
.LBB56_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB56_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB56_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB56_20
.LBB56_17:
	sta	__rc11
.LBB56_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB56_39
.LBB56_19:
	cmp	__rc7
	bcc	.LBB56_17
.LBB56_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB56_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB56_23
; %bb.22:                               ;   in Loop: Header=BB56_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB56_24
	bra	.LBB56_26
.LBB56_23:                              ;   in Loop: Header=BB56_21 Depth=1
	cmp	__rc9
	bcc	.LBB56_26
.LBB56_24:                              ;   in Loop: Header=BB56_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB56_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB56_27
.LBB56_26:
	tay
.LBB56_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB56_28
; %bb.50:
	jmp	.LBB56_37
.LBB56_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB56_32
.LBB56_29:                              ;   in Loop: Header=BB56_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB56_36
.LBB56_30:                              ;   in Loop: Header=BB56_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB56_31:                              ;   in Loop: Header=BB56_32 Depth=1
	ldy	__rc9
	cpy	#1
	rol	__rc8
	dex
	ldy	__rc10
	sty	__rc13
	sta	__rc11
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc9
	ldy	__rc8
	sty	__rc3
	cpx	#0
	beq	.LBB56_39
.LBB56_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB56_34
; %bb.33:                               ;   in Loop: Header=BB56_32 Depth=1
	ldy	#0
.LBB56_34:                              ;   in Loop: Header=BB56_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB56_29
; %bb.35:                               ;   in Loop: Header=BB56_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB56_30
.LBB56_36:                              ;   in Loop: Header=BB56_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB56_31
.LBB56_37:
	sta	__rc11
	ldx	#1
.LBB56_38:
	stx	__rc9
.LBB56_39:
	lda	__rc6
	bmi	.LBB56_41
; %bb.40:
	lda	__rc10
	bra	.LBB56_42
.LBB56_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB56_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB56_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB56_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB56_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB56_38
.Lfunc_end56:
	.size	__divmodhi4, .Lfunc_end56-__divmodhi4
                                        ; -- End function
	.type	offsCurrIdx,@object             ; @offsCurrIdx
	.section	.bss.offsCurrIdx,"aw",@nobits
	.globl	offsCurrIdx
offsCurrIdx:
	.byte	0                               ; 0x0
	.size	offsCurrIdx, 1

	.type	flagCurrSec,@object             ; @flagCurrSec
	.section	.bss.flagCurrSec,"aw",@nobits
	.globl	flagCurrSec
flagCurrSec:
	.byte	0                               ; 0x0
	.size	flagCurrSec, 1

	.type	readdir_dirent,@object          ; @readdir_dirent
	.section	.rodata.readdir_dirent,"a",@progbits
	.globl	readdir_dirent
readdir_dirent:
	.short	24576
	.size	readdir_dirent, 2

	.type	HTRAP00asm,@object              ; @HTRAP00asm
	.section	.data.HTRAP00asm,"aw",@progbits
HTRAP00asm:
	.short	54848
	.size	HTRAP00asm, 2

	.type	fnamehi,@object                 ; @fnamehi
	.section	.zp.bss.fnamehi,"aw",@nobits
fnamehi:
	.byte	0                               ; 0x0
	.size	fnamehi, 1

	.type	.L.str.27,@object               ; @.str.27
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.27:
	.asciz	"hyppo_setname is: "
	.size	.L.str.27, 19

	.type	.L.str.28,@object               ; @.str.28
.L.str.28:
	.asciz	"EXTERNAL.D81"
	.size	.L.str.28, 13

	.type	.L.str.29,@object               ; @.str.29
.L.str.29:
	.asciz	" hyppo_d81attach1 is: "
	.size	.L.str.29, 23

	.type	.L.str.30,@object               ; @.str.30
.L.str.30:
	.asciz	"hyppo_selectdrive "
	.size	.L.str.30, 19

	.type	.L.str.31,@object               ; @.str.31
.L.str.31:
	.asciz	" is: "
	.size	.L.str.31, 6

	.type	.L.str.32,@object               ; @.str.32
.L.str.32:
	.asciz	"hyppo_getcurrentdrive is: "
	.size	.L.str.32, 27

	.type	.L.str.33,@object               ; @.str.33
.L.str.33:
	.asciz	"hyppo_opendir, file descriptor is: "
	.size	.L.str.33, 36

	.type	.L.str.34,@object               ; @.str.34
.L.str.34:
	.asciz	"hyppo_readdir, err is: "
	.size	.L.str.34, 24

	.type	.L.str.35,@object               ; @.str.35
.L.str.35:
	.asciz	"filename is: "
	.size	.L.str.35, 14

	.type	.L.str.36,@object               ; @.str.36
.L.str.36:
	.asciz	"hyppo_closedir is: "
	.size	.L.str.36, 20

	.type	g_curScreenW,@object            ; @g_curScreenW
	.section	.zp.bss.g_curScreenW,"aw",@nobits
g_curScreenW:
	.byte	0                               ; 0x0
	.size	g_curScreenW, 1

	.type	g_curScreenH,@object            ; @g_curScreenH
	.section	.zp.bss.g_curScreenH,"aw",@nobits
g_curScreenH:
	.byte	0                               ; 0x0
	.size	g_curScreenH, 1

	.type	escapeCode,@object              ; @escapeCode
	.section	.bss.escapeCode,"aw",@nobits
escapeCode:
	.zero	765
	.size	escapeCode, 765

	.type	g_curX,@object                  ; @g_curX
	.section	.zp.bss.g_curX,"aw",@nobits
g_curX:
	.byte	0                               ; 0x0
	.size	g_curX, 1

	.type	g_curY,@object                  ; @g_curY
	.section	.zp.bss.g_curY,"aw",@nobits
g_curY:
	.byte	0                               ; 0x0
	.size	g_curY, 1

	.type	hexDigits,@object               ; @hexDigits
	.section	.zp.rodata.cst16,"aM",@progbits,16
hexDigits:
	.ascii	"0123456789ABCDEF"
	.size	hexDigits, 16

	.type	dmalist,@object                 ; @dmalist
	.section	.zp.bss.dmalist,"aw",@nobits
dmalist:
	.zero	20
	.size	dmalist, 20

	.type	.Lzp_stack,@object              ; @zp_stack
	.section	.zp.noinit..Lzp_stack,"aw",@nobits
.Lzp_stack:
	.zero	40
	.size	.Lzp_stack, 40

.set .Lclrscr_zp_stk, .Lzp_stack
	.size	.Lclrscr_zp_stk, 3
.set .Lmemset_zp_stk, .Lzp_stack
	.size	.Lmemset_zp_stk, 2
.set .Lmemmove_zp_stk, .Lzp_stack
	.size	.Lmemmove_zp_stk, 2
.set .L__muldi3_zp_stk, .Lzp_stack
	.size	.L__muldi3_zp_stk, 6
.set .L__udivhi3_zp_stk, .Lzp_stack+2
	.size	.L__udivhi3_zp_stk, 1
.set .L__udivsi3_zp_stk, .Lzp_stack+2
	.size	.L__udivsi3_zp_stk, 1
.set .L__udivdi3_zp_stk, .Lzp_stack+2
	.size	.L__udivdi3_zp_stk, 15
.set .L__umoddi3_zp_stk, .Lzp_stack+1
	.size	.L__umoddi3_zp_stk, 8
.set .L__udivmodhi4_zp_stk, .Lzp_stack+29
	.size	.L__udivmodhi4_zp_stk, 1
.set .L__divqi3_zp_stk, .Lzp_stack
	.size	.L__divqi3_zp_stk, 3
.set .L__divhi3_zp_stk, .Lzp_stack
	.size	.L__divhi3_zp_stk, 2
.set .L__divsi3_zp_stk, .Lzp_stack
	.size	.L__divsi3_zp_stk, 2
.set .L__divdi3_zp_stk, .Lzp_stack
	.size	.L__divdi3_zp_stk, 2
.set .L__modqi3_zp_stk, .Lzp_stack
	.size	.L__modqi3_zp_stk, 1
.set .L__modhi3_zp_stk, .Lzp_stack
	.size	.L__modhi3_zp_stk, 1
.set .L__modsi3_zp_stk, .Lzp_stack
	.size	.L__modsi3_zp_stk, 1
.set .L__moddi3_zp_stk, .Lzp_stack
	.size	.L__moddi3_zp_stk, 1
.set .L__divmodqi4_zp_stk, .Lzp_stack
	.size	.L__divmodqi4_zp_stk, 1
.set .L__divmodhi4_zp_stk, .Lzp_stack
	.size	.L__divmodhi4_zp_stk, 1
.set .Lcputsxy_zp_stk, .Lzp_stack+21
	.size	.Lcputsxy_zp_stk, 8
.set .Lcputhex_zp_stk, .Lzp_stack
	.size	.Lcputhex_zp_stk, 14
.set .Lmprintf_zp_stk, .Lzp_stack
	.size	.Lmprintf_zp_stk, 21
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym escNOP
	.addrsig_sym offsCurrIdx
	.addrsig_sym flagCurrSec
	.addrsig_sym readdir_dirent
	.addrsig_sym HTRAP00asm
	.addrsig_sym fnamehi
	.addrsig_sym dmalist
	.addrsig_sym .Lzp_stack
	;Declaring this symbol tells the CRT that there is something in .bss, so it may need to be zeroed.
	.globl	__do_zero_bss
	;Declaring this symbol tells the CRT that there is something in .zp.bss, so it may need to be zeroed.
	.globl	__do_zero_zp_bss
	;Declaring this symbol tells the CRT that there is something in .data, so it may need to be copied from LMA to VMA.
	.globl	__do_copy_data
	;Declaring this symbol tells the CRT that there is something in .zp.data, so it may need to be copied from LMA to VMA.
	.globl	__do_copy_zp_data
	;Declaring this symbol tells the CRT that the stack pointer needs to be initialized.
	.globl	__do_init_stack
	;Declaring this symbol tells the CRT that the stack pointer needs to be initialized.
	.globl	__do_init_stack

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
                                        ; Start of file scope inline assembly
.set HTRAP00, 54848
.set readdir_dirent, 24576

                                        ; End of file scope inline assembly
	.section	.text.cputln,"ax",@progbits
	.type	cputln,@function                ; -- Begin function cputln
cputln:                                 ; @cputln
; %bb.0:
	ldx	mos8(g_curScreenH)
	stx	__rc4
	ldx	mos8(g_curY)
	lda	#0
	phx
	ply
	iny
	bne	.LBB0_2
; %bb.1:
	inc
.LBB0_2:
	cmp	#0
	bne	.LBB0_5
; %bb.3:
	cpy	__rc4
	bcs	.LBB0_6
.LBB0_4:
	inx
; %bb.10:
	jmp	.LBB0_9
.LBB0_5:
	cmp	#0
	bcc	.LBB0_4
.LBB0_6:
	ldx	mos8(g_curScreenW)
	stx	__rc2
	stx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Spill
	stz	__rc3
	ldx	#0
	lda	__rc4
	jsr	__mulhi3
	sta	mos8(.Lcputln_zp_stk+4)         ; 1-byte Folded Spill
	stx	mos8(.Lcputln_zp_stk+3)         ; 1-byte Folded Spill
	lda	53347
	and	#7
	tay
	ldx	53346
	stx	__rc2
	ldx	53345
	stx	__rc3
	lda	53344
	ldx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Reload
	stx	__rc4
	stx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Spill
	clc
	adc	__rc4
	sta	__rc10
	lda	__rc3
	adc	#0
	sta	__rc11
	lda	__rc2
	adc	#0
	sta	__rc2
	tya
	adc	#0
	sta	__rc3
	lda	53347
	and	#7
	sta	__rc7
	lda	mos8(.Lcputln_zp_stk+4)         ; 1-byte Folded Reload
	sec
	sbc	__rc4
	sta	__rc8
	sta	mos8(.Lcputln_zp_stk+1)         ; 1-byte Folded Spill
	lda	mos8(.Lcputln_zp_stk+3)         ; 1-byte Folded Reload
	sbc	#0
	ldx	#1
	bcs	.LBB0_8
; %bb.7:
	ldx	#0
.LBB0_8:
	stx	mos8(.Lcputln_zp_stk+5)         ; 1-byte Folded Spill
	sta	__rc9
	sta	mos8(.Lcputln_zp_stk+2)         ; 1-byte Folded Spill
	lda	53346
	ldy	53345
	ldx	53344
	stx	__rc4
	sty	__rc5
	sta	__rc6
	ldx	__rc11
	lda	__rc10
	jsr	lcopy
	ldy	#248
	lda	#15
	sty	__rc2
	sta	__rc3
	ldx	#0
	stz	__rc4
	stz	__rc5
	sty	__rc6
	sta	__rc7
	ldy	mos8(.Lcputln_zp_stk+1)         ; 1-byte Folded Reload
	sty	__rc8
	sty	mos8(.Lcputln_zp_stk+1)         ; 1-byte Folded Spill
	ldy	mos8(.Lcputln_zp_stk+2)         ; 1-byte Folded Reload
	sty	__rc9
	lda	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Reload
	jsr	lcopy
	ldx	mos8(.Lcputln_zp_stk+4)         ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lcputln_zp_stk+3)         ; 1-byte Folded Reload
	stx	__rc3
	lda	53347
	and	#7
	sta	__rc5
	ldx	53346
	stx	__rc6
	ldx	53345
	lda	53344
	clc
	adc	__rc2
	tay
	txa
	adc	__rc3
	sta	__rc2
	lda	__rc6
	adc	#0
	sta	__rc4
	lda	__rc5
	adc	#0
	sta	__rc3
	ldx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Reload
	stx	__rc5
	stx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Spill
	sec
	tya
	sbc	__rc5
	tay
	lda	__rc2
	sbc	#0
	sta	__rc7
	lda	__rc4
	sbc	#0
	sta	__rc2
	lda	__rc3
	sbc	#0
	ldx	#32
	sta	__rc3
	stx	__rc4
	stz	__rc6
	ldx	__rc7
	tya
	jsr	lfill
	ldx	mos8(.Lcputln_zp_stk+5)         ; 1-byte Folded Reload
	cpx	#1
	lda	#248
	sbc	#0
	sta	__rc2
	lda	#15
	sbc	#0
	ldx	#1
	sta	__rc3
	stx	__rc4
	ldx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Reload
	stx	__rc5
	stz	__rc6
	ldx	mos8(.Lcputln_zp_stk+2)         ; 1-byte Folded Reload
	lda	mos8(.Lcputln_zp_stk+1)         ; 1-byte Folded Reload
	jsr	lfill
	ldx	mos8(g_curY)
.LBB0_9:
	stz	mos8(g_curX)
	stx	mos8(g_curY)
	rts
.Lfunc_end0:
	.size	cputln, .Lfunc_end0-cputln
                                        ; -- End function
	.section	.text.mprintf,"ax",@progbits
	.type	mprintf,@function               ; -- Begin function mprintf
mprintf:                                ; @mprintf
; %bb.0:
	sta	mos8(.Lmprintf_zp_stk+1)
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
	bra	.LBB1_7
.LBB1_1:                                ;   in Loop: Header=BB1_7 Depth=1
	cmp	#192
	bcc	.LBB1_3
; %bb.2:                                ;   in Loop: Header=BB1_7 Depth=1
	eor	#128
	bra	.LBB1_4
.LBB1_3:                                ;   in Loop: Header=BB1_7 Depth=1
	clc
	adc	#224
.LBB1_4:                                ;   in Loop: Header=BB1_7 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB1_6
; %bb.5:                                ;   in Loop: Header=BB1_7 Depth=1
	inc	__rc7
.LBB1_6:                                ;   in Loop: Header=BB1_7 Depth=1
	tax
	beq	.LBB1_12
.LBB1_7:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB1_9
; %bb.8:                                ;   in Loop: Header=BB1_7 Depth=1
	inc	__rc5
.LBB1_9:                                ;   in Loop: Header=BB1_7 Depth=1
	cmp	#64
	bcc	.LBB1_4
; %bb.10:                               ;   in Loop: Header=BB1_7 Depth=1
	cmp	#96
	bcs	.LBB1_1
; %bb.11:                               ;   in Loop: Header=BB1_7 Depth=1
	clc
	adc	#192
	bra	.LBB1_4
.LBB1_12:
	ldx	#9
	stx	mos8(.Lmprintf_zp_stk+20)       ; 1-byte Folded Spill
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jsr	cputsxy
	stz	mos8(.Lmprintf_zp_stk)
	stz	mos8(.Lmprintf_zp_stk+15)
	stz	__rc10
	stz	__rc2
	stz	__rc3
.LBB1_13:                               ; =>This Inner Loop Header: Depth=1
	ldx	#mos8(.Lmprintf_zp_stk+16)
	stx	__rc8
	ldx	#mos8(0)
	stx	__rc9
	ldx	__rc2
	stx	mos8(.Lmprintf_zp_stk+3)
	ldx	#10
	stx	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	ldx	__rc10
	lda	mos8(.Lmprintf_zp_stk+1)
	ldy	__rc10
	sty	mos8(.Lmprintf_zp_stk+2)
	ldy	__rc3
	sty	mos8(.Lmprintf_zp_stk+4)
	jsr	__udivmodsi4
	sta	__rc6
	lda	#15
	and	mos8(.Lmprintf_zp_stk+16)
	tay
	lda	mos8(hexDigits),y
	ldy	mos8(.Lmprintf_zp_stk+20)       ; 1-byte Folded Reload
	sty	__rc4
	dec	__rc4
	sta	mos8(.Lmprintf_zp_stk+5),y
	lda	mos8(.Lmprintf_zp_stk+4)
	bne	.LBB1_17
; %bb.14:                               ;   in Loop: Header=BB1_13 Depth=1
	lda	mos8(.Lmprintf_zp_stk+3)
	bne	.LBB1_18
; %bb.15:                               ;   in Loop: Header=BB1_13 Depth=1
	ldy	mos8(.Lmprintf_zp_stk+2)
	bne	.LBB1_19
; %bb.16:                               ;   in Loop: Header=BB1_13 Depth=1
	ldy	mos8(.Lmprintf_zp_stk+1)
	cpy	#10
	bra	.LBB1_20
.LBB1_17:                               ;   in Loop: Header=BB1_13 Depth=1
	ldy	mos8(.Lmprintf_zp_stk+4)
	bra	.LBB1_19
.LBB1_18:                               ;   in Loop: Header=BB1_13 Depth=1
	ldy	mos8(.Lmprintf_zp_stk+3)
.LBB1_19:                               ;   in Loop: Header=BB1_13 Depth=1
	cpy	#0
.LBB1_20:                               ;   in Loop: Header=BB1_13 Depth=1
	ldy	__rc6
	sty	mos8(.Lmprintf_zp_stk+1)
	stx	__rc10
	ldx	__rc4
	stx	mos8(.Lmprintf_zp_stk+20)       ; 1-byte Folded Spill
	bcc	.LBB1_21
; %bb.24:                               ;   in Loop: Header=BB1_13 Depth=1
	jmp	.LBB1_13
.LBB1_21:
	lda	#mos8(.Lmprintf_zp_stk+5)
	clc
	adc	__rc4
	sta	__rc2
	lda	#mos8(0)
	adc	#0
	sta	__rc3
	inc	__rc2
	bne	.LBB1_23
; %bb.22:
	inc	__rc3
.LBB1_23:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end1:
	.size	mprintf, .Lfunc_end1-mprintf
                                        ; -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            ; -- Begin function main
	.type	main,@function
main:                                   ; @main
; %bb.0:
	clc
	lda	__rc0
	adc	#249
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
	ldy	#6
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
	lda	__rc30
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#191
	and	53297
	sta	53297
	lda	#191
	and	53332
	sta	53332
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
	bpl	.LBB2_2
; %bb.1:
	ldx	#80
.LBB2_2:
	ldy	#mos8(dmalist)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	stx	mos8(g_curScreenW)
	lda	53297
	and	#8
	beq	.LBB2_4
; %bb.3:
	ldx	#50
	bra	.LBB2_5
.LBB2_4:
	ldx	#25
.LBB2_5:
	stx	mos8(g_curScreenH)
	bra	.LBB2_7
.LBB2_6:                                ;   in Loop: Header=BB2_7 Depth=1
	stz	54800
.LBB2_7:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB2_6
; %bb.8:
	ldx	__rc2
	stx	__rc28
	ldx	#0
	stx	__rc24
	ldx	#97
	stx	__rc25
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
.LBB2_9:                                ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB2_11
; %bb.10:                               ;   in Loop: Header=BB2_9 Depth=1
	inc	__rc5
.LBB2_11:                               ;   in Loop: Header=BB2_9 Depth=1
	lda	#mos16hi(escNOP)
	sta	(__rc4),y
	dex
	bne	.LBB2_9
	bra	.LBB2_13
.LBB2_12:                               ;   in Loop: Header=BB2_13 Depth=1
	stz	54800
.LBB2_13:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB2_12
; %bb.14:
	ldx	#mos16lo(.L.str.27)
	stx	__rc26
	ldx	#mos16hi(.L.str.27)
	stx	__rc27
	ldx	mos8(g_curScreenW)
	stz	__rc3
	lda	mos8(g_curScreenH)
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
	stx	__rc6
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
	ldx	__rc5
	stx	__rc29
	ldx	__rc6
	stx	__rc30
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
	ldx	__rc29
	stx	mos8(dmalist+9)
	ldx	__rc30
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
	ldx	#0
	ldy	__rc28
	sty	55045
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
	sta	54848
	clv
	bcc	errhypsetnam0
	lda	#0
	sta	__rc28
	jmp	donehypsetnam0
errhypsetnam0:
	lda	#255
	sta	__rc28
donehypsetnam0:
	nop

	;NO_APP
	bra	.LBB2_21
.LBB2_15:                               ;   in Loop: Header=BB2_21 Depth=1
	cmp	#192
	bcc	.LBB2_17
; %bb.16:                               ;   in Loop: Header=BB2_21 Depth=1
	eor	#128
	bra	.LBB2_18
.LBB2_17:                               ;   in Loop: Header=BB2_21 Depth=1
	clc
	adc	#224
.LBB2_18:                               ;   in Loop: Header=BB2_21 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB2_20
; %bb.19:                               ;   in Loop: Header=BB2_21 Depth=1
	inc	__rc3
.LBB2_20:                               ;   in Loop: Header=BB2_21 Depth=1
	tax
	beq	.LBB2_26
.LBB2_21:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc26)
	inc	__rc26
	bne	.LBB2_23
; %bb.22:                               ;   in Loop: Header=BB2_21 Depth=1
	inc	__rc27
.LBB2_23:                               ;   in Loop: Header=BB2_21 Depth=1
	cmp	#64
	bcc	.LBB2_18
; %bb.24:                               ;   in Loop: Header=BB2_21 Depth=1
	cmp	#96
	bcs	.LBB2_15
; %bb.25:                               ;   in Loop: Header=BB2_21 Depth=1
	clc
	adc	#192
	bra	.LBB2_18
.LBB2_26:
	ldx	#mos16lo(.L.str.29)
	stx	__rc26
	ldx	#mos16hi(.L.str.29)
	stx	__rc27
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
	lda	__rc28
	jsr	cputhex
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB2_33
.LBB2_27:                               ;   in Loop: Header=BB2_33 Depth=1
	cmp	#192
	bcc	.LBB2_29
; %bb.28:                               ;   in Loop: Header=BB2_33 Depth=1
	eor	#128
	bra	.LBB2_30
.LBB2_29:                               ;   in Loop: Header=BB2_33 Depth=1
	clc
	adc	#224
.LBB2_30:                               ;   in Loop: Header=BB2_33 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB2_32
; %bb.31:                               ;   in Loop: Header=BB2_33 Depth=1
	inc	__rc3
.LBB2_32:                               ;   in Loop: Header=BB2_33 Depth=1
	tax
	beq	.LBB2_38
.LBB2_33:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc26)
	inc	__rc26
	bne	.LBB2_35
; %bb.34:                               ;   in Loop: Header=BB2_33 Depth=1
	inc	__rc27
.LBB2_35:                               ;   in Loop: Header=BB2_33 Depth=1
	cmp	#64
	bcc	.LBB2_30
; %bb.36:                               ;   in Loop: Header=BB2_33 Depth=1
	cmp	#96
	bcs	.LBB2_27
; %bb.37:                               ;   in Loop: Header=BB2_33 Depth=1
	clc
	adc	#192
	bra	.LBB2_30
.LBB2_38:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#0
	stx	__rc2
	ldx	#97
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB2_45
.LBB2_39:                               ;   in Loop: Header=BB2_45 Depth=1
	cmp	#192
	bcc	.LBB2_41
; %bb.40:                               ;   in Loop: Header=BB2_45 Depth=1
	eor	#128
	bra	.LBB2_42
.LBB2_41:                               ;   in Loop: Header=BB2_45 Depth=1
	clc
	adc	#224
.LBB2_42:                               ;   in Loop: Header=BB2_45 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB2_44
; %bb.43:                               ;   in Loop: Header=BB2_45 Depth=1
	inc	__rc5
.LBB2_44:                               ;   in Loop: Header=BB2_45 Depth=1
	tax
	beq	.LBB2_50
.LBB2_45:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB2_47
; %bb.46:                               ;   in Loop: Header=BB2_45 Depth=1
	inc	__rc3
.LBB2_47:                               ;   in Loop: Header=BB2_45 Depth=1
	cmp	#64
	bcc	.LBB2_42
; %bb.48:                               ;   in Loop: Header=BB2_45 Depth=1
	cmp	#96
	bcs	.LBB2_39
; %bb.49:                               ;   in Loop: Header=BB2_45 Depth=1
	clc
	adc	#192
	bra	.LBB2_42
.LBB2_50:
	ldx	#mos16lo(.L.str.31)
	stx	__rc26
	ldx	#mos16hi(.L.str.31)
	stx	__rc27
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#97
	stx	mos8(fnamehi)
	ldx	#0
	stx	__rc2
	ldx	#97
	stx	__rc3
	ldx	#mos16lo(.L.str.30)
	stx	__rc4
	ldx	#mos16hi(.L.str.30)
	stx	__rc5
	lda	#13
	ldx	#0
	jsr	memcpy
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldy	#97
	;APP
	ldx	#0
	lda	#46
	sta	54848
	clv
	bcc	errhypsetnam1
	lda	#0
	sta	__rc4
	jmp	donehypsetnam1
errhypsetnam1:
	lda	#255
	sta	__rc4
donehypsetnam1:
	nop

	;NO_APP
	;APP
	ldx	#0
	lda	#70
	sta	54848
	clv
	bcc	errhyp1att2
	lda	#0
	sta	__rc24
	jmp	donehyp1att2
errhyp1att2:
	lda	#255
	sta	__rc24
donehyp1att2:
	nop

	;NO_APP
	bra	.LBB2_57
.LBB2_51:                               ;   in Loop: Header=BB2_57 Depth=1
	cmp	#192
	bcc	.LBB2_53
; %bb.52:                               ;   in Loop: Header=BB2_57 Depth=1
	eor	#128
	bra	.LBB2_54
.LBB2_53:                               ;   in Loop: Header=BB2_57 Depth=1
	clc
	adc	#224
.LBB2_54:                               ;   in Loop: Header=BB2_57 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB2_56
; %bb.55:                               ;   in Loop: Header=BB2_57 Depth=1
	inc	__rc3
.LBB2_56:                               ;   in Loop: Header=BB2_57 Depth=1
	tax
	beq	.LBB2_62
.LBB2_57:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc26)
	inc	__rc26
	bne	.LBB2_59
; %bb.58:                               ;   in Loop: Header=BB2_57 Depth=1
	inc	__rc27
.LBB2_59:                               ;   in Loop: Header=BB2_57 Depth=1
	cmp	#64
	bcc	.LBB2_54
; %bb.60:                               ;   in Loop: Header=BB2_57 Depth=1
	cmp	#96
	bcs	.LBB2_51
; %bb.61:                               ;   in Loop: Header=BB2_57 Depth=1
	clc
	adc	#192
	bra	.LBB2_54
.LBB2_62:
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
	lda	__rc24
	jsr	cputhex
	jsr	cputln
.LBB2_63:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB2_63
; %bb.64:
	stz	__rc24
	stz	54800
	ldy	#0
; %bb.165:
	jmp	.LBB2_163
.LBB2_65:                               ;   in Loop: Header=BB2_71 Depth=2
	cmp	#192
	bcc	.LBB2_67
; %bb.66:                               ;   in Loop: Header=BB2_71 Depth=2
	eor	#128
	bra	.LBB2_68
.LBB2_67:                               ;   in Loop: Header=BB2_71 Depth=2
	clc
	adc	#224
.LBB2_68:                               ;   in Loop: Header=BB2_71 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB2_70
; %bb.69:                               ;   in Loop: Header=BB2_71 Depth=2
	inc	__rc3
.LBB2_70:                               ;   in Loop: Header=BB2_71 Depth=2
	tax
	beq	.LBB2_76
.LBB2_71:                               ;   Parent Loop BB2_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc26)
	inc	__rc26
	bne	.LBB2_73
; %bb.72:                               ;   in Loop: Header=BB2_71 Depth=2
	inc	__rc27
.LBB2_73:                               ;   in Loop: Header=BB2_71 Depth=2
	cmp	#64
	bcc	.LBB2_68
; %bb.74:                               ;   in Loop: Header=BB2_71 Depth=2
	cmp	#96
	bcs	.LBB2_65
; %bb.75:                               ;   in Loop: Header=BB2_71 Depth=2
	clc
	adc	#192
	bra	.LBB2_68
.LBB2_76:                               ;   in Loop: Header=BB2_163 Depth=1
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
	jsr	cputln
	ldx	__rc25
	cpx	#255
	bne	.LBB2_77
; %bb.173:                              ;   in Loop: Header=BB2_163 Depth=1
	jmp	.LBB2_161
.LBB2_77:                               ;   in Loop: Header=BB2_163 Depth=1
	ldx	#mos16lo(.L.str.35)
	stx	__rc2
	ldx	#mos16hi(.L.str.35)
	stx	__rc3
	;APP
	ldx	#0
	lda	#18
	sta	54848
	clv
	bcc	errhypopendir3
	sta	__rc25
	jmp	donehypopendir3
errhypopendir3:
	lda	#255
	sta	__rc25
donehypopendir3:
	nop

	;NO_APP
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB2_84
.LBB2_78:                               ;   in Loop: Header=BB2_84 Depth=2
	cmp	#192
	bcc	.LBB2_80
; %bb.79:                               ;   in Loop: Header=BB2_84 Depth=2
	eor	#128
	bra	.LBB2_81
.LBB2_80:                               ;   in Loop: Header=BB2_84 Depth=2
	clc
	adc	#224
.LBB2_81:                               ;   in Loop: Header=BB2_84 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB2_83
; %bb.82:                               ;   in Loop: Header=BB2_84 Depth=2
	inc	__rc5
.LBB2_83:                               ;   in Loop: Header=BB2_84 Depth=2
	tax
	beq	.LBB2_89
.LBB2_84:                               ;   Parent Loop BB2_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB2_86
; %bb.85:                               ;   in Loop: Header=BB2_84 Depth=2
	inc	__rc3
.LBB2_86:                               ;   in Loop: Header=BB2_84 Depth=2
	cmp	#64
	bcc	.LBB2_81
; %bb.87:                               ;   in Loop: Header=BB2_84 Depth=2
	cmp	#96
	bcs	.LBB2_78
; %bb.88:                               ;   in Loop: Header=BB2_84 Depth=2
	clc
	adc	#192
	bra	.LBB2_81
.LBB2_89:                               ;   in Loop: Header=BB2_163 Depth=1
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
	jsr	cputln
	ldy	__rc25
	cpy	#132
	bne	.LBB2_90
; %bb.175:                              ;   in Loop: Header=BB2_163 Depth=1
	jmp	.LBB2_161
.LBB2_90:                               ;   in Loop: Header=BB2_163 Depth=1
	cpy	#135
	bne	.LBB2_91
; %bb.177:                              ;   in Loop: Header=BB2_163 Depth=1
	jmp	.LBB2_161
.LBB2_91:                               ;   in Loop: Header=BB2_163 Depth=1
	cpy	#255
	bne	.LBB2_167
; %bb.179:                              ;   in Loop: Header=BB2_163 Depth=1
	jmp	.LBB2_161
.LBB2_167:                              ;   in Loop: Header=BB2_163 Depth=1
	jmp	.LBB2_144
.LBB2_92:                               ;   in Loop: Header=BB2_98 Depth=3
	cmp	#192
	bcc	.LBB2_94
; %bb.93:                               ;   in Loop: Header=BB2_98 Depth=3
	eor	#128
	bra	.LBB2_95
.LBB2_94:                               ;   in Loop: Header=BB2_98 Depth=3
	clc
	adc	#224
.LBB2_95:                               ;   in Loop: Header=BB2_98 Depth=3
	sta	(__rc4)
	inc	__rc4
	bne	.LBB2_97
; %bb.96:                               ;   in Loop: Header=BB2_98 Depth=3
	inc	__rc5
.LBB2_97:                               ;   in Loop: Header=BB2_98 Depth=3
	tax
	beq	.LBB2_103
.LBB2_98:                               ;   Parent Loop BB2_163 Depth=1
                                        ;     Parent Loop BB2_144 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc2)
	inc	__rc2
	bne	.LBB2_100
; %bb.99:                               ;   in Loop: Header=BB2_98 Depth=3
	inc	__rc3
.LBB2_100:                              ;   in Loop: Header=BB2_98 Depth=3
	cmp	#64
	bcc	.LBB2_95
; %bb.101:                              ;   in Loop: Header=BB2_98 Depth=3
	cmp	#96
	bcs	.LBB2_92
; %bb.102:                              ;   in Loop: Header=BB2_98 Depth=3
	clc
	adc	#192
	bra	.LBB2_95
.LBB2_103:                              ;   in Loop: Header=BB2_144 Depth=2
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
	lda	__rc26
	jsr	cputhex
	jsr	cputc
.LBB2_104:                              ;   Parent Loop BB2_163 Depth=1
                                        ;     Parent Loop BB2_144 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	54800
	beq	.LBB2_104
; %bb.105:                              ;   in Loop: Header=BB2_144 Depth=2
	stz	54800
	ldx	__rc26
	cpx	#255
	bne	.LBB2_106
; %bb.181:                              ;   in Loop: Header=BB2_163 Depth=1
	jmp	.LBB2_145
.LBB2_106:                              ;   in Loop: Header=BB2_144 Depth=2
	cpx	#133
	bne	.LBB2_107
; %bb.183:                              ;   in Loop: Header=BB2_163 Depth=1
	jmp	.LBB2_145
.LBB2_107:                              ;   in Loop: Header=BB2_144 Depth=2
	ldy	#0
	ldx	#0
.LBB2_108:                              ;   Parent Loop BB2_163 Depth=1
                                        ;     Parent Loop BB2_144 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	24641,y
	cmp	#32
	beq	.LBB2_112
; %bb.109:                              ;   in Loop: Header=BB2_108 Depth=3
	cmp	#33
	bcc	.LBB2_111
; %bb.110:                              ;   in Loop: Header=BB2_108 Depth=3
	sta	24897,x
	inx
.LBB2_111:                              ;   in Loop: Header=BB2_108 Depth=3
	iny
	cpy	#8
	bne	.LBB2_108
.LBB2_112:                              ;   in Loop: Header=BB2_144 Depth=2
	ldy	#0
	lda	#46
	sta	24897,x
	inx
.LBB2_113:                              ;   Parent Loop BB2_163 Depth=1
                                        ;     Parent Loop BB2_144 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	24649,y
	cmp	#32
	beq	.LBB2_117
; %bb.114:                              ;   in Loop: Header=BB2_113 Depth=3
	cmp	#33
	bcc	.LBB2_116
; %bb.115:                              ;   in Loop: Header=BB2_113 Depth=3
	sta	24897,x
	inx
.LBB2_116:                              ;   in Loop: Header=BB2_113 Depth=3
	iny
	cpy	#3
	bne	.LBB2_113
.LBB2_117:                              ;   in Loop: Header=BB2_144 Depth=2
	ldy	#mos16lo(.L.str.37)
	sty	__rc2
	ldy	#mos16hi(.L.str.37)
	sty	__rc3
	stz	24897,x
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB2_124
.LBB2_118:                              ;   in Loop: Header=BB2_124 Depth=3
	cmp	#192
	bcc	.LBB2_120
; %bb.119:                              ;   in Loop: Header=BB2_124 Depth=3
	eor	#128
	bra	.LBB2_121
.LBB2_120:                              ;   in Loop: Header=BB2_124 Depth=3
	clc
	adc	#224
.LBB2_121:                              ;   in Loop: Header=BB2_124 Depth=3
	sta	(__rc4)
	inc	__rc4
	bne	.LBB2_123
; %bb.122:                              ;   in Loop: Header=BB2_124 Depth=3
	inc	__rc5
.LBB2_123:                              ;   in Loop: Header=BB2_124 Depth=3
	tax
	beq	.LBB2_129
.LBB2_124:                              ;   Parent Loop BB2_163 Depth=1
                                        ;     Parent Loop BB2_144 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc2)
	inc	__rc2
	bne	.LBB2_126
; %bb.125:                              ;   in Loop: Header=BB2_124 Depth=3
	inc	__rc3
.LBB2_126:                              ;   in Loop: Header=BB2_124 Depth=3
	cmp	#64
	bcc	.LBB2_121
; %bb.127:                              ;   in Loop: Header=BB2_124 Depth=3
	cmp	#96
	bcs	.LBB2_118
; %bb.128:                              ;   in Loop: Header=BB2_124 Depth=3
	clc
	adc	#192
	bra	.LBB2_121
.LBB2_129:                              ;   in Loop: Header=BB2_144 Depth=2
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
	bra	.LBB2_136
.LBB2_130:                              ;   in Loop: Header=BB2_136 Depth=3
	cmp	#192
	bcc	.LBB2_132
; %bb.131:                              ;   in Loop: Header=BB2_136 Depth=3
	eor	#128
	bra	.LBB2_133
.LBB2_132:                              ;   in Loop: Header=BB2_136 Depth=3
	clc
	adc	#224
.LBB2_133:                              ;   in Loop: Header=BB2_136 Depth=3
	sta	(__rc4)
	inc	__rc4
	bne	.LBB2_135
; %bb.134:                              ;   in Loop: Header=BB2_136 Depth=3
	inc	__rc5
.LBB2_135:                              ;   in Loop: Header=BB2_136 Depth=3
	tax
	beq	.LBB2_141
.LBB2_136:                              ;   Parent Loop BB2_163 Depth=1
                                        ;     Parent Loop BB2_144 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc2)
	inc	__rc2
	bne	.LBB2_138
; %bb.137:                              ;   in Loop: Header=BB2_136 Depth=3
	inc	__rc3
.LBB2_138:                              ;   in Loop: Header=BB2_136 Depth=3
	cmp	#64
	bcc	.LBB2_133
; %bb.139:                              ;   in Loop: Header=BB2_136 Depth=3
	cmp	#96
	bcs	.LBB2_130
; %bb.140:                              ;   in Loop: Header=BB2_136 Depth=3
	clc
	adc	#192
	bra	.LBB2_133
.LBB2_141:                              ;   in Loop: Header=BB2_144 Depth=2
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
	ldx	#mos16lo(.L.str.38)
	stx	__rc2
	ldx	#mos16hi(.L.str.38)
	stx	__rc3
	jsr	mprintf
	jsr	cputln
.LBB2_142:                              ;   Parent Loop BB2_163 Depth=1
                                        ;     Parent Loop BB2_144 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	54800
	beq	.LBB2_142
; %bb.143:                              ;   in Loop: Header=BB2_144 Depth=2
	stz	54800
	ldy	__rc25
.LBB2_144:                              ;   Parent Loop BB2_163 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_98 Depth 3
                                        ;       Child Loop BB2_104 Depth 3
                                        ;       Child Loop BB2_108 Depth 3
                                        ;       Child Loop BB2_113 Depth 3
                                        ;       Child Loop BB2_124 Depth 3
                                        ;       Child Loop BB2_136 Depth 3
                                        ;       Child Loop BB2_142 Depth 3
	ldx	#mos16lo(.L.str.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.36)
	stx	__rc3
	;APP
	phx
	ldx	#0
	txa
hypreaddirloop4:
	sta	24576,x
	dex
	bne	hypreaddirloop4
	plx
	tya
	tax
	ldy	#mos16hi(24576)
	lda	#20
	sta	54848
	clv
	bcc	errhypreaddir4
	stx	__rc26
	jmp	donehypreaddir4
errhypreaddir4:
	sta	__rc26
donehypreaddir4:
	nop

	;NO_APP
	ldx	24640
	stz	24576,x
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
; %bb.169:                              ;   in Loop: Header=BB2_144 Depth=2
	jmp	.LBB2_98
.LBB2_145:                              ;   Parent Loop BB2_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB2_145
; %bb.146:                              ;   in Loop: Header=BB2_163 Depth=1
	ldx	#mos16lo(.L.str.39)
	stx	__rc2
	ldx	#mos16hi(.L.str.39)
	stx	__rc3
	stz	54800
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	ldx	__rc25
	;APP
	lda	#22
	sta	54848
	clv
	bcc	errhypclosedir5
	stx	__rc25
	jmp	donehypclosedir5
errhypclosedir5:
	sta	__rc25
donehypclosedir5:
	nop

	;NO_APP
	bra	.LBB2_153
.LBB2_147:                              ;   in Loop: Header=BB2_153 Depth=2
	cmp	#192
	bcc	.LBB2_149
; %bb.148:                              ;   in Loop: Header=BB2_153 Depth=2
	eor	#128
	bra	.LBB2_150
.LBB2_149:                              ;   in Loop: Header=BB2_153 Depth=2
	clc
	adc	#224
.LBB2_150:                              ;   in Loop: Header=BB2_153 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB2_152
; %bb.151:                              ;   in Loop: Header=BB2_153 Depth=2
	inc	__rc5
.LBB2_152:                              ;   in Loop: Header=BB2_153 Depth=2
	tax
	beq	.LBB2_158
.LBB2_153:                              ;   Parent Loop BB2_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB2_155
; %bb.154:                              ;   in Loop: Header=BB2_153 Depth=2
	inc	__rc3
.LBB2_155:                              ;   in Loop: Header=BB2_153 Depth=2
	cmp	#64
	bcc	.LBB2_150
; %bb.156:                              ;   in Loop: Header=BB2_153 Depth=2
	cmp	#96
	bcs	.LBB2_147
; %bb.157:                              ;   in Loop: Header=BB2_153 Depth=2
	clc
	adc	#192
	bra	.LBB2_150
.LBB2_158:                              ;   in Loop: Header=BB2_163 Depth=1
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
	jsr	cputln
.LBB2_159:                              ;   Parent Loop BB2_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB2_159
; %bb.160:                              ;   in Loop: Header=BB2_163 Depth=1
	stz	54800
.LBB2_161:                              ;   Parent Loop BB2_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB2_161
; %bb.162:                              ;   in Loop: Header=BB2_163 Depth=1
	stz	54800
	ldy	__rc28
	iny
	cpy	#33
	beq	.LBB2_164
.LBB2_163:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_71 Depth 2
                                        ;     Child Loop BB2_84 Depth 2
                                        ;     Child Loop BB2_144 Depth 2
                                        ;       Child Loop BB2_98 Depth 3
                                        ;       Child Loop BB2_104 Depth 3
                                        ;       Child Loop BB2_108 Depth 3
                                        ;       Child Loop BB2_113 Depth 3
                                        ;       Child Loop BB2_124 Depth 3
                                        ;       Child Loop BB2_136 Depth 3
                                        ;       Child Loop BB2_142 Depth 3
                                        ;     Child Loop BB2_145 Depth 2
                                        ;     Child Loop BB2_153 Depth 2
                                        ;     Child Loop BB2_159 Depth 2
                                        ;     Child Loop BB2_161 Depth 2
	ldx	#mos16lo(.L.str.34)
	stx	__rc26
	ldx	#mos16hi(.L.str.34)
	stx	__rc27
	;APP
	lda	#6
	sta	54848
	clv
	bcc	errseldrv6
	stx	__rc25
	jmp	doneseldrv6
errseldrv6:
	lda	#255
	sta	__rc25
doneseldrv6:
	nop

	;NO_APP
	ldx	#mos16lo(.L.str.32)
	stx	__rc2
	ldx	#mos16hi(.L.str.32)
	stx	__rc3
	sty	__rc28
	tya
	jsr	mprintf
	ldx	#mos16lo(.L.str.33)
	stx	__rc2
	ldx	#mos16hi(.L.str.33)
	stx	__rc3
	lda	__rc25
	jsr	mprintf
	jsr	cputln
	;APP
	ldx	#0
	lda	#4
	sta	54848
	clv
	bcc	errgetcurdrv7
	sta	__rc25
	jmp	donegetcurdrv7
errgetcurdrv7:
	lda	#255
	sta	__rc25
donegetcurdrv7:
	nop
	;NO_APP
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
; %bb.171:                              ;   in Loop: Header=BB2_163 Depth=1
	jmp	.LBB2_71
.LBB2_164:
	ldx	#0
	txa
	sta	__rc16
	ldy	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc30
	iny
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
	adc	#7
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end3:
	.size	escNOP, .Lfunc_end3-escNOP
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
	ldx	__rc4
	stx	mos8(.Lcputsxy_zp_stk+3)        ; 1-byte Folded Spill
	ldx	__rc5
	stx	mos8(.Lcputsxy_zp_stk+4)        ; 1-byte Folded Spill
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
	tay
	sta	mos8(.Lcputsxy_zp_stk+8)        ; 1-byte Folded Spill
	lda	__rc3
	adc	#0
	sta	mos8(.Lcputsxy_zp_stk+7)        ; 1-byte Folded Spill
	lda	53347
	and	#7
	sta	__rc5
	ldx	53346
	stx	__rc4
	ldx	53345
	stx	__rc2
	tya
	clc
	adc	#0
	sta	__rc6
	ldx	mos8(.Lcputsxy_zp_stk+7)        ; 1-byte Folded Reload
	txa
	adc	__rc2
	sta	__rc7
	lda	__rc4
	adc	#0
	sta	__rc3
	lda	__rc5
	adc	#0
	tay
	ldx	53344
	stx	__rc2
	clc
	lda	__rc6
	adc	__rc2
	sta	__rc4
	lda	__rc7
	adc	#0
	sta	__rc5
	lda	__rc3
	adc	#0
	sta	__rc6
	tya
	adc	#0
	ldy	#0
	stz	__rc2
	stz	__rc3
	sta	__rc7
	ldx	mos8(.Lcputsxy_zp_stk+2)        ; 1-byte Folded Reload
	stx	__rc8
	stz	__rc9
	ldx	mos8(.Lcputsxy_zp_stk+3)        ; 1-byte Folded Reload
	stx	__rc10
	ldx	mos8(.Lcputsxy_zp_stk+4)        ; 1-byte Folded Reload
	lda	__rc10
	jsr	lcopy
	ldx	#248
	ldy	#15
	lda	#1
	stx	__rc2
	sty	__rc3
	sta	__rc4
	ldx	mos8(.Lcputsxy_zp_stk+2)        ; 1-byte Folded Reload
	stx	__rc5
	stz	__rc6
	ldx	mos8(.Lcputsxy_zp_stk+7)        ; 1-byte Folded Reload
	lda	mos8(.Lcputsxy_zp_stk+8)        ; 1-byte Folded Reload
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
	stz	__rc3
	stx	__rc2
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
	.section	.text.lcopy,"ax",@progbits
	.type	lcopy,@function                 ; -- Begin function lcopy
lcopy:                                  ; @lcopy
; %bb.0:
	sta	__rc10
	stx	__rc11
	ldx	__rc8
	lda	#0
	stz	__rc8
	lsr	__rc8
	ror
	bit	__set_v
	bcs	.LBB7_2
; %bb.1:
	clv
.LBB7_2:
	ror	__rc3
	ldy	__rc2
	sty	__rc12
	ror	__rc12
	lsr	__rc8
	ror
	ldy	#1
	bcs	.LBB7_4
; %bb.3:
	ldy	#0
.LBB7_4:
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	phy
	ldy	#1
	bcs	.LBB7_6
; %bb.5:
	ldy	#0
.LBB7_6:
	sty	__rc13
	ply
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	lda	#1
	bcs	.LBB7_8
; %bb.7:
	lda	#0
.LBB7_8:
	sta	__rc8
	ror	__rc3
	lda	__rc12
	ror
	sta	__rc3
	sec
	bvs	.LBB7_10
; %bb.9:
	clc
.LBB7_10:
	ror	__rc7
	lda	__rc6
	ror
	cpy	#1
	ror	__rc7
	ror
	ldy	__rc13
	cpy	#1
	ror	__rc7
	ror
	ldy	#11
	sty	mos8(dmalist)
	ldy	#128
	sty	mos8(dmalist+1)
	ldy	__rc3
	sty	mos8(dmalist+2)
	ldy	#129
	sty	mos8(dmalist+3)
	ldy	__rc8
	cpy	#1
	ror	__rc7
	ror
	sta	mos8(dmalist+4)
	ldy	#133
	sty	mos8(dmalist+5)
	ldy	#1
	sty	mos8(dmalist+6)
	stz	mos8(dmalist+7)
	stz	mos8(dmalist+17)
	stz	mos8(dmalist+8)
	stx	mos8(dmalist+9)
	ldx	__rc9
	stx	mos8(dmalist+10)
	stz	mos8(dmalist+17)
	ldx	__rc10
	stx	mos8(dmalist+11)
	ldx	__rc11
	stx	mos8(dmalist+12)
	lda	__rc2
	and	#15
	sta	mos8(dmalist+13)
	ldx	__rc4
	stx	mos8(dmalist+14)
	ldx	#mos8(0)
	ldy	#mos8(dmalist)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	ldy	__rc5
	sty	mos8(dmalist+15)
	ldy	__rc2
	lda	__rc6
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
	.size	lcopy, .Lfunc_end7-lcopy
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
.Lfunc_end8:
	.size	lfill, .Lfunc_end8-lfill
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB9_2
; %bb.1:
	tya
	beq	.LBB9_11
.LBB9_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB9_3:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB9_5
; %bb.4:                                ;   in Loop: Header=BB9_3 Depth=1
	inc	__rc7
.LBB9_5:                                ;   in Loop: Header=BB9_3 Depth=1
	inc	__rc4
	bne	.LBB9_7
; %bb.6:                                ;   in Loop: Header=BB9_3 Depth=1
	inc	__rc5
.LBB9_7:                                ;   in Loop: Header=BB9_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB9_9
; %bb.8:                                ;   in Loop: Header=BB9_3 Depth=1
	dex
.LBB9_9:                                ;   in Loop: Header=BB9_3 Depth=1
	txa
	bne	.LBB9_3
; %bb.10:                               ;   in Loop: Header=BB9_3 Depth=1
	tya
	bne	.LBB9_3
.LBB9_11:
	rts
.Lfunc_end9:
	.size	memcpy, .Lfunc_end9-memcpy
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
.Lfunc_end10:
	.size	memset, .Lfunc_end10-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB11_4
.LBB11_1:                               ;   in Loop: Header=BB11_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB11_3
; %bb.2:                                ;   in Loop: Header=BB11_4 Depth=1
	inc	__rc3
.LBB11_3:                               ;   in Loop: Header=BB11_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB11_7
.LBB11_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB11_1
; %bb.5:                                ;   in Loop: Header=BB11_4 Depth=1
	cpx	#0
	bne	.LBB11_1
; %bb.6:
	rts
.LBB11_7:                               ;   in Loop: Header=BB11_4 Depth=1
	dec	__rc4
	jmp	.LBB11_4
.Lfunc_end11:
	.size	__memset, .Lfunc_end11-__memset
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
	beq	.LBB12_1
; %bb.15:
	jmp	.LBB12_13
.LBB12_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB12_2
; %bb.17:
	jmp	.LBB12_14
.LBB12_2:
	lda	__rc7
	bne	.LBB12_4
; %bb.3:
	lda	__rc6
	beq	.LBB12_12
.LBB12_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB12_6
; %bb.5:                                ;   in Loop: Header=BB12_4 Depth=1
	dec	__rc9
.LBB12_6:                               ;   in Loop: Header=BB12_4 Depth=1
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
	bne	.LBB12_8
; %bb.7:                                ;   in Loop: Header=BB12_4 Depth=1
	dec	__rc11
.LBB12_8:                               ;   in Loop: Header=BB12_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB12_10
; %bb.9:                                ;   in Loop: Header=BB12_4 Depth=1
	dex
.LBB12_10:                              ;   in Loop: Header=BB12_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB12_4
; %bb.11:                               ;   in Loop: Header=BB12_4 Depth=1
	tya
	bne	.LBB12_4
.LBB12_12:
	rts
.LBB12_13:
	cpx	__rc3
	bcs	.LBB12_14
; %bb.19:
	jmp	.LBB12_2
.LBB12_14:
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
.Lfunc_end12:
	.size	memmove, .Lfunc_end12-memmove
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB13_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB13_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB13_4
; %bb.3:                                ;   in Loop: Header=BB13_2 Depth=1
	inx
.LBB13_4:                               ;   in Loop: Header=BB13_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB13_2
	bra	.LBB13_6
.LBB13_5:
	stz	__rc4
	ldx	#0
.LBB13_6:
	lda	__rc4
	rts
.Lfunc_end13:
	.size	strlen, .Lfunc_end13-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB14_2
.LBB14_1:                               ;   in Loop: Header=BB14_2 Depth=1
	dex
	asl
.LBB14_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB14_1
; %bb.3:
	rts
.Lfunc_end14:
	.size	__ashlqi3, .Lfunc_end14-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB15_3
; %bb.1:
	ldx	__rc2
.LBB15_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB15_2
.LBB15_3:
	ldx	__rc3
	rts
.Lfunc_end15:
	.size	__ashlhi3, .Lfunc_end15-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB16_3
; %bb.1:
	ldx	__rc4
.LBB16_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB16_2
.LBB16_3:
	ldx	__rc5
	rts
.Lfunc_end16:
	.size	__ashlsi3, .Lfunc_end16-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB17_3
; %bb.1:
	ldx	__rc8
.LBB17_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB17_2
.LBB17_3:
	ldx	__rc9
	rts
.Lfunc_end17:
	.size	__ashldi3, .Lfunc_end17-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB18_2
.LBB18_1:                               ;   in Loop: Header=BB18_2 Depth=1
	dex
	lsr
.LBB18_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB18_1
; %bb.3:
	rts
.Lfunc_end18:
	.size	__lshrqi3, .Lfunc_end18-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB19_3
; %bb.1:
	ldx	__rc2
.LBB19_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB19_2
.LBB19_3:
	ldx	__rc3
	rts
.Lfunc_end19:
	.size	__lshrhi3, .Lfunc_end19-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB20_3
; %bb.1:
	ldx	__rc4
.LBB20_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB20_2
.LBB20_3:
	ldx	__rc5
	rts
.Lfunc_end20:
	.size	__lshrsi3, .Lfunc_end20-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB21_3
; %bb.1:
	ldx	__rc8
.LBB21_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB21_2
.LBB21_3:
	ldx	__rc9
	rts
.Lfunc_end21:
	.size	__lshrdi3, .Lfunc_end21-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB22_2
.LBB22_1:                               ;   in Loop: Header=BB22_2 Depth=1
	dex
	cmp	#128
	ror
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB22_1
; %bb.3:
	rts
.Lfunc_end22:
	.size	__ashrqi3, .Lfunc_end22-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB23_3
; %bb.1:
	ldx	__rc2
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB23_2
.LBB23_3:
	tax
	lda	__rc3
	rts
.Lfunc_end23:
	.size	__ashrhi3, .Lfunc_end23-__ashrhi3
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
	beq	.LBB24_3
; %bb.1:
	ldx	__rc4
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB24_2
.LBB24_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end24:
	.size	__ashrsi3, .Lfunc_end24-__ashrsi3
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
	beq	.LBB25_3
; %bb.1:
	ldx	__rc8
.LBB25_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB25_2
.LBB25_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end25:
	.size	__ashrdi3, .Lfunc_end25-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB26_2
.LBB26_1:                               ;   in Loop: Header=BB26_2 Depth=1
	dex
	cmp	#128
	rol
.LBB26_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB26_1
; %bb.3:
	rts
.Lfunc_end26:
	.size	__rotlqi3, .Lfunc_end26-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB27_3
; %bb.1:
	ldx	__rc2
.LBB27_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB27_2
.LBB27_3:
	tax
	lda	__rc3
	rts
.Lfunc_end27:
	.size	__rotlhi3, .Lfunc_end27-__rotlhi3
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
	beq	.LBB28_3
; %bb.1:
	ldx	__rc4
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB28_2
.LBB28_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end28:
	.size	__rotlsi3, .Lfunc_end28-__rotlsi3
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
	beq	.LBB29_3
; %bb.1:
	ldx	__rc8
.LBB29_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB29_2
.LBB29_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end29:
	.size	__rotldi3, .Lfunc_end29-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB30_2
.LBB30_1:                               ;   in Loop: Header=BB30_2 Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB30_1
; %bb.3:
	rts
.Lfunc_end30:
	.size	__rotrqi3, .Lfunc_end30-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB31_3
; %bb.1:
	ldx	__rc2
.LBB31_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB31_2
.LBB31_3:
	ldx	__rc3
	rts
.Lfunc_end31:
	.size	__rotrhi3, .Lfunc_end31-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB32_3
; %bb.1:
	ldx	__rc4
.LBB32_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB32_2
.LBB32_3:
	ldx	__rc5
	rts
.Lfunc_end32:
	.size	__rotrsi3, .Lfunc_end32-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB33_3
; %bb.1:
	ldx	__rc8
.LBB33_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB33_2
.LBB33_3:
	ldx	__rc9
	rts
.Lfunc_end33:
	.size	__rotrdi3, .Lfunc_end33-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB34_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB34_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB34_4
; %bb.3:                                ;   in Loop: Header=BB34_2 Depth=1
	clc
	adc	__rc2
.LBB34_4:                               ;   in Loop: Header=BB34_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB34_2
; %bb.5:
	rts
.LBB34_6:
	lda	#0
	rts
.Lfunc_end34:
	.size	__mulqi3, .Lfunc_end34-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB35_2
; %bb.1:
	ldy	__rc2
	beq	.LBB35_7
.LBB35_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB35_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB35_5
; %bb.4:                                ;   in Loop: Header=BB35_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB35_5:                               ;   in Loop: Header=BB35_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB35_3
; %bb.6:                                ;   in Loop: Header=BB35_3 Depth=1
	ldx	__rc2
	bne	.LBB35_3
	bra	.LBB35_8
.LBB35_7:
	ldy	#0
	tya
.LBB35_8:
	tax
	tya
	rts
.Lfunc_end35:
	.size	__mulhi3, .Lfunc_end35-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB36_4
; %bb.1:
	ldy	__rc6
	bne	.LBB36_4
; %bb.2:
	ldy	__rc5
	bne	.LBB36_4
; %bb.3:
	ldy	__rc4
	bne	.LBB36_4
; %bb.13:
	jmp	.LBB36_12
.LBB36_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB36_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB36_7
; %bb.6:                                ;   in Loop: Header=BB36_5 Depth=1
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
.LBB36_7:                               ;   in Loop: Header=BB36_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB36_5
; %bb.8:                                ;   in Loop: Header=BB36_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB36_5
; %bb.9:                                ;   in Loop: Header=BB36_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB36_5
; %bb.10:                               ;   in Loop: Header=BB36_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB36_5
.LBB36_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB36_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB36_11
.Lfunc_end36:
	.size	__mulsi3, .Lfunc_end36-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB37_8
; %bb.1:
	ldy	__rc14
	bne	.LBB37_8
; %bb.2:
	ldy	__rc13
	bne	.LBB37_8
; %bb.3:
	ldy	__rc12
	bne	.LBB37_8
; %bb.4:
	ldy	__rc11
	bne	.LBB37_8
; %bb.5:
	ldy	__rc10
	bne	.LBB37_8
; %bb.6:
	ldy	__rc9
	bne	.LBB37_8
; %bb.7:
	ldy	__rc8
	bne	.LBB37_8
; %bb.21:
	jmp	.LBB37_20
.LBB37_8:
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
.LBB37_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB37_11
; %bb.10:                               ;   in Loop: Header=BB37_9 Depth=1
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
.LBB37_11:                              ;   in Loop: Header=BB37_9 Depth=1
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
	beq	.LBB37_12
; %bb.23:                               ;   in Loop: Header=BB37_9 Depth=1
	jmp	.LBB37_9
.LBB37_12:                              ;   in Loop: Header=BB37_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB37_13
; %bb.25:                               ;   in Loop: Header=BB37_9 Depth=1
	jmp	.LBB37_9
.LBB37_13:                              ;   in Loop: Header=BB37_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB37_14
; %bb.27:                               ;   in Loop: Header=BB37_9 Depth=1
	jmp	.LBB37_9
.LBB37_14:                              ;   in Loop: Header=BB37_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB37_15
; %bb.29:                               ;   in Loop: Header=BB37_9 Depth=1
	jmp	.LBB37_9
.LBB37_15:                              ;   in Loop: Header=BB37_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB37_16
; %bb.31:                               ;   in Loop: Header=BB37_9 Depth=1
	jmp	.LBB37_9
.LBB37_16:                              ;   in Loop: Header=BB37_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB37_17
; %bb.33:                               ;   in Loop: Header=BB37_9 Depth=1
	jmp	.LBB37_9
.LBB37_17:                              ;   in Loop: Header=BB37_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB37_18
; %bb.35:                               ;   in Loop: Header=BB37_9 Depth=1
	jmp	.LBB37_9
.LBB37_18:                              ;   in Loop: Header=BB37_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB37_19
; %bb.37:                               ;   in Loop: Header=BB37_9 Depth=1
	jmp	.LBB37_9
.LBB37_19:
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
.LBB37_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB37_19
.Lfunc_end37:
	.size	__muldi3, .Lfunc_end37-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB38_1
; %bb.15:
	jmp	.LBB38_14
.LBB38_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB38_2
; %bb.17:
	jmp	.LBB38_14
.LBB38_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB38_3
; %bb.19:
	jmp	.LBB38_14
.LBB38_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB38_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB38_6
; %bb.5:                                ;   in Loop: Header=BB38_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB38_8
	bra	.LBB38_7
.LBB38_6:                               ;   in Loop: Header=BB38_4 Depth=1
	cpy	__rc4
	bcc	.LBB38_8
.LBB38_7:                               ;   in Loop: Header=BB38_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB38_4
	bra	.LBB38_9
.LBB38_8:
	ldy	__rc3
	sty	__rc2
.LBB38_9:
	cpx	#0
	beq	.LBB38_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB38_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB38_13
; %bb.12:                               ;   in Loop: Header=BB38_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB38_13:                              ;   in Loop: Header=BB38_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB38_11
.LBB38_14:
	rts
.Lfunc_end38:
	.size	__udivqi3, .Lfunc_end38-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB39_2
; %bb.1:
	ldy	__rc2
	beq	.LBB39_4
.LBB39_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB39_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB39_6
.LBB39_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB39_22
.LBB39_5:
	cmp	__rc3
	bcc	.LBB39_4
.LBB39_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB39_7
; %bb.25:
	jmp	.LBB39_22
.LBB39_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB39_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB39_10
; %bb.9:                                ;   in Loop: Header=BB39_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB39_12
	bra	.LBB39_11
.LBB39_10:                              ;   in Loop: Header=BB39_8 Depth=1
	cmp	__rc6
	bcc	.LBB39_12
.LBB39_11:                              ;   in Loop: Header=BB39_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB39_8
	bra	.LBB39_13
.LBB39_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB39_13:
	cpx	#0
	bne	.LBB39_14
; %bb.27:
	jmp	.LBB39_22
.LBB39_14:
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
.LBB39_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB39_17
; %bb.16:                               ;   in Loop: Header=BB39_15 Depth=1
	ldy	#0
.LBB39_17:                              ;   in Loop: Header=BB39_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB39_21
; %bb.18:                               ;   in Loop: Header=BB39_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB39_20
.LBB39_19:                              ;   in Loop: Header=BB39_15 Depth=1
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
.LBB39_20:                              ;   in Loop: Header=BB39_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB39_15
	bra	.LBB39_22
.LBB39_21:                              ;   in Loop: Header=BB39_15 Depth=1
	cmp	__rc6
	bcs	.LBB39_19
	bra	.LBB39_20
.LBB39_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end39:
	.size	__udivhi3, .Lfunc_end39-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
	ldy	__rc7
	bne	.LBB40_4
; %bb.1:
	ldy	__rc6
	bne	.LBB40_4
; %bb.2:
	ldy	__rc5
	bne	.LBB40_4
; %bb.3:
	ldy	__rc4
	beq	.LBB40_9
.LBB40_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB40_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB40_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB40_7
; %bb.45:
	jmp	.LBB40_38
.LBB40_7:
	cmp	__rc4
	bcc	.LBB40_9
	bra	.LBB40_11
.LBB40_8:
	cpx	__rc7
	bcs	.LBB40_11
.LBB40_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB40_21
.LBB40_10:
	cpx	__rc6
	bcc	.LBB40_9
.LBB40_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB40_12
; %bb.47:
	jmp	.LBB40_21
.LBB40_12:
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
.LBB40_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB40_17
; %bb.14:                               ;   in Loop: Header=BB40_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB40_18
; %bb.15:                               ;   in Loop: Header=BB40_13 Depth=1
	cmp	__rc10
	bne	.LBB40_19
; %bb.16:                               ;   in Loop: Header=BB40_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB40_23
	bra	.LBB40_20
.LBB40_17:                              ;   in Loop: Header=BB40_13 Depth=1
	cpy	__rc12
	bcc	.LBB40_23
	bra	.LBB40_20
.LBB40_18:                              ;   in Loop: Header=BB40_13 Depth=1
	cpy	__rc11
	bcc	.LBB40_23
	bra	.LBB40_20
.LBB40_19:                              ;   in Loop: Header=BB40_13 Depth=1
	cmp	__rc10
	bcc	.LBB40_23
.LBB40_20:                              ;   in Loop: Header=BB40_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB40_13
	bra	.LBB40_24
.LBB40_21:
	stz	__rc2
	stz	__rc3
.LBB40_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB40_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB40_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB40_22
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
.LBB40_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB40_28
; %bb.27:                               ;   in Loop: Header=BB40_26 Depth=1
	ldy	#0
.LBB40_28:                              ;   in Loop: Header=BB40_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB40_32
; %bb.29:                               ;   in Loop: Header=BB40_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB40_34
; %bb.30:                               ;   in Loop: Header=BB40_26 Depth=1
	cmp	__rc10
	bne	.LBB40_37
; %bb.31:                               ;   in Loop: Header=BB40_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB40_33
	bra	.LBB40_35
.LBB40_32:                              ;   in Loop: Header=BB40_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB40_35
.LBB40_33:                              ;   in Loop: Header=BB40_26 Depth=1
	lda	__rc6
	bra	.LBB40_36
.LBB40_34:                              ;   in Loop: Header=BB40_26 Depth=1
	cpy	__rc11
	bcc	.LBB40_33
.LBB40_35:                              ;   in Loop: Header=BB40_26 Depth=1
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
.LBB40_36:                              ;   in Loop: Header=BB40_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB40_41
; %bb.49:                               ;   in Loop: Header=BB40_26 Depth=1
	jmp	.LBB40_26
.LBB40_41:
	jmp	.LBB40_22
.LBB40_37:                              ;   in Loop: Header=BB40_26 Depth=1
	cmp	__rc10
	bcc	.LBB40_33
	bra	.LBB40_35
.LBB40_38:
	cpx	__rc5
	bcs	.LBB40_43
; %bb.51:
	jmp	.LBB40_9
.LBB40_43:
	jmp	.LBB40_11
.Lfunc_end40:
	.size	__udivsi3, .Lfunc_end40-__udivsi3
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
	bne	.LBB41_8
; %bb.1:
	ldx	__rc14
	bne	.LBB41_8
; %bb.2:
	ldx	__rc13
	bne	.LBB41_8
; %bb.3:
	ldx	__rc12
	bne	.LBB41_8
; %bb.4:
	ldx	__rc11
	bne	.LBB41_8
; %bb.5:
	ldx	__rc10
	bne	.LBB41_8
; %bb.6:
	ldx	__rc9
	bne	.LBB41_8
; %bb.7:
	ldx	__rc8
	beq	.LBB41_17
.LBB41_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB41_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB41_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB41_11
; %bb.90:
	jmp	.LBB41_31
.LBB41_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB41_12
; %bb.92:
	jmp	.LBB41_32
.LBB41_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB41_13
; %bb.94:
	jmp	.LBB41_38
.LBB41_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB41_14
; %bb.96:
	jmp	.LBB41_40
.LBB41_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB41_15
; %bb.98:
	jmp	.LBB41_42
.LBB41_15:
	cmp	__rc8
	bcc	.LBB41_17
	bra	.LBB41_19
.LBB41_16:
	cpx	__rc15
	bcs	.LBB41_19
.LBB41_17:
	lda	#0
; %bb.66:
	jmp	.LBB41_29
.LBB41_18:
	cpx	__rc14
	bcc	.LBB41_17
.LBB41_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB41_20
; %bb.100:
	jmp	.LBB41_29
.LBB41_20:
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
.LBB41_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB41_25
; %bb.22:                               ;   in Loop: Header=BB41_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB41_26
; %bb.23:                               ;   in Loop: Header=BB41_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB41_27
; %bb.24:                               ;   in Loop: Header=BB41_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB41_102
; %bb.150:                              ;   in Loop: Header=BB41_21 Depth=1
	jmp	.LBB41_33
.LBB41_102:                             ;   in Loop: Header=BB41_21 Depth=1
	jmp	.LBB41_37
.LBB41_25:                              ;   in Loop: Header=BB41_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB41_28
; %bb.104:
	jmp	.LBB41_44
.LBB41_26:                              ;   in Loop: Header=BB41_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB41_28
; %bb.106:
	jmp	.LBB41_44
.LBB41_27:                              ;   in Loop: Header=BB41_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB41_28
; %bb.108:
	jmp	.LBB41_44
.LBB41_28:                              ;   in Loop: Header=BB41_21 Depth=1
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
	bmi	.LBB41_68
; %bb.110:                              ;   in Loop: Header=BB41_21 Depth=1
	jmp	.LBB41_21
.LBB41_68:
	jmp	.LBB41_45
.LBB41_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB41_30:
	ldx	__rc18
	rts
.LBB41_31:
	cpx	__rc13
	bcs	.LBB41_70
; %bb.112:
	jmp	.LBB41_17
.LBB41_70:
	jmp	.LBB41_19
.LBB41_32:
	cpx	__rc12
	bcs	.LBB41_72
; %bb.114:
	jmp	.LBB41_17
.LBB41_72:
	jmp	.LBB41_19
.LBB41_33:                              ;   in Loop: Header=BB41_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB41_39
; %bb.34:                               ;   in Loop: Header=BB41_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB41_41
; %bb.35:                               ;   in Loop: Header=BB41_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB41_43
; %bb.36:                               ;   in Loop: Header=BB41_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB41_44
; %bb.74:                               ;   in Loop: Header=BB41_21 Depth=1
	jmp	.LBB41_28
.LBB41_37:                              ;   in Loop: Header=BB41_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB41_44
; %bb.76:                               ;   in Loop: Header=BB41_21 Depth=1
	jmp	.LBB41_28
.LBB41_38:
	cpx	__rc11
	bcs	.LBB41_78
; %bb.116:
	jmp	.LBB41_17
.LBB41_78:
	jmp	.LBB41_19
.LBB41_39:                              ;   in Loop: Header=BB41_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB41_44
; %bb.80:                               ;   in Loop: Header=BB41_21 Depth=1
	jmp	.LBB41_28
.LBB41_40:
	cpx	__rc10
	bcs	.LBB41_82
; %bb.118:
	jmp	.LBB41_17
.LBB41_82:
	jmp	.LBB41_19
.LBB41_41:                              ;   in Loop: Header=BB41_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB41_44
; %bb.84:                               ;   in Loop: Header=BB41_21 Depth=1
	jmp	.LBB41_28
.LBB41_42:
	cpx	__rc9
	bcs	.LBB41_86
; %bb.120:
	jmp	.LBB41_17
.LBB41_86:
	jmp	.LBB41_19
.LBB41_43:                              ;   in Loop: Header=BB41_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB41_44
; %bb.122:                              ;   in Loop: Header=BB41_21 Depth=1
	jmp	.LBB41_28
.LBB41_44:
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
.LBB41_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB41_46
; %bb.124:
	jmp	.LBB41_30
.LBB41_46:
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
.LBB41_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB41_49
; %bb.48:                               ;   in Loop: Header=BB41_47 Depth=1
	ldy	#0
.LBB41_49:                              ;   in Loop: Header=BB41_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB41_57
; %bb.50:                               ;   in Loop: Header=BB41_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB41_51
; %bb.126:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_60
.LBB41_51:                              ;   in Loop: Header=BB41_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB41_52
; %bb.128:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_61
.LBB41_52:                              ;   in Loop: Header=BB41_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB41_53
; %bb.130:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_62
.LBB41_53:                              ;   in Loop: Header=BB41_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB41_54
; %bb.132:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_63
.LBB41_54:                              ;   in Loop: Header=BB41_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB41_55
; %bb.134:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_64
.LBB41_55:                              ;   in Loop: Header=BB41_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB41_56
; %bb.136:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_65
.LBB41_56:                              ;   in Loop: Header=BB41_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB41_58
	bra	.LBB41_59
.LBB41_57:                              ;   in Loop: Header=BB41_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB41_59
.LBB41_58:                              ;   in Loop: Header=BB41_47 Depth=1
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
.LBB41_59:                              ;   in Loop: Header=BB41_47 Depth=1
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
	beq	.LBB41_88
; %bb.138:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_47
.LBB41_88:
	jmp	.LBB41_30
.LBB41_60:                              ;   in Loop: Header=BB41_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB41_58
	bra	.LBB41_59
.LBB41_61:                              ;   in Loop: Header=BB41_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB41_59
; %bb.140:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_58
.LBB41_62:                              ;   in Loop: Header=BB41_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB41_59
; %bb.142:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_58
.LBB41_63:                              ;   in Loop: Header=BB41_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB41_59
; %bb.144:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_58
.LBB41_64:                              ;   in Loop: Header=BB41_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB41_59
; %bb.146:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_58
.LBB41_65:                              ;   in Loop: Header=BB41_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB41_59
; %bb.148:                              ;   in Loop: Header=BB41_47 Depth=1
	jmp	.LBB41_58
.Lfunc_end41:
	.size	__udivdi3, .Lfunc_end41-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB42_1
; %bb.15:
	jmp	.LBB42_13
.LBB42_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB42_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB42_14
; %bb.3:
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB42_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB42_6
; %bb.5:                                ;   in Loop: Header=BB42_4 Depth=1
	cmp	__rc2
	bcc	.LBB42_8
	bra	.LBB42_7
.LBB42_6:                               ;   in Loop: Header=BB42_4 Depth=1
	cpy	__rc4
	bcc	.LBB42_8
.LBB42_7:                               ;   in Loop: Header=BB42_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB42_4
	bra	.LBB42_9
.LBB42_8:
	ldy	__rc3
	sty	__rc2
.LBB42_9:
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB42_13
.LBB42_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB42_12
; %bb.11:                               ;   in Loop: Header=BB42_10 Depth=1
	sec
	sbc	__rc2
.LBB42_12:                              ;   in Loop: Header=BB42_10 Depth=1
	dex
	bne	.LBB42_10
.LBB42_13:
	rts
.LBB42_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end42:
	.size	__umodqi3, .Lfunc_end42-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB43_2
; %bb.1:
	ldx	__rc2
	bne	.LBB43_2
; %bb.22:
	jmp	.LBB43_19
.LBB43_2:
	cmp	__rc3
	bne	.LBB43_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB43_5
; %bb.20:
	jmp	.LBB43_19
.LBB43_4:
	cmp	__rc3
	bcs	.LBB43_5
; %bb.24:
	jmp	.LBB43_19
.LBB43_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB43_6
; %bb.26:
	jmp	.LBB43_18
.LBB43_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB43_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB43_9
; %bb.8:                                ;   in Loop: Header=BB43_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB43_11
	bra	.LBB43_10
.LBB43_9:                               ;   in Loop: Header=BB43_7 Depth=1
	cmp	__rc5
	bcc	.LBB43_11
.LBB43_10:                              ;   in Loop: Header=BB43_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB43_7
	bra	.LBB43_12
.LBB43_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB43_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB43_19
.LBB43_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB43_17
; %bb.14:                               ;   in Loop: Header=BB43_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB43_16
.LBB43_15:                              ;   in Loop: Header=BB43_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB43_16:                              ;   in Loop: Header=BB43_13 Depth=1
	dex
	bne	.LBB43_13
	bra	.LBB43_19
.LBB43_17:                              ;   in Loop: Header=BB43_13 Depth=1
	cmp	__rc5
	bcs	.LBB43_15
	bra	.LBB43_16
.LBB43_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB43_19:
	tax
	tya
	rts
.Lfunc_end43:
	.size	__umodhi3, .Lfunc_end43-__umodhi3
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
	bne	.LBB44_4
; %bb.1:
	ldx	__rc6
	bne	.LBB44_4
; %bb.2:
	ldx	__rc5
	bne	.LBB44_4
; %bb.3:
	ldx	__rc4
	bne	.LBB44_4
; %bb.42:
	jmp	.LBB44_35
.LBB44_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB44_8
; %bb.5:
	cmp	__rc6
	bne	.LBB44_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB44_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB44_11
; %bb.36:
	jmp	.LBB44_35
.LBB44_8:
	cpx	__rc7
	bcs	.LBB44_11
; %bb.38:
	jmp	.LBB44_35
.LBB44_9:
	cmp	__rc6
	bcs	.LBB44_11
; %bb.40:
	jmp	.LBB44_35
.LBB44_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB44_11
; %bb.44:
	jmp	.LBB44_35
.LBB44_11:
	ldx	__rc7
	bpl	.LBB44_12
; %bb.46:
	jmp	.LBB44_33
.LBB44_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB44_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB44_17
; %bb.14:                               ;   in Loop: Header=BB44_13 Depth=1
	cmp	__rc8
	bne	.LBB44_18
; %bb.15:                               ;   in Loop: Header=BB44_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB44_19
; %bb.16:                               ;   in Loop: Header=BB44_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB44_21
	bra	.LBB44_20
.LBB44_17:                              ;   in Loop: Header=BB44_13 Depth=1
	cpy	__rc9
	bcc	.LBB44_21
	bra	.LBB44_20
.LBB44_18:                              ;   in Loop: Header=BB44_13 Depth=1
	cmp	__rc8
	bcc	.LBB44_21
	bra	.LBB44_20
.LBB44_19:                              ;   in Loop: Header=BB44_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB44_21
.LBB44_20:                              ;   in Loop: Header=BB44_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB44_13
	bra	.LBB44_22
.LBB44_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB44_22:
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
	bne	.LBB44_23
; %bb.48:
	jmp	.LBB44_34
.LBB44_23:
	tya
.LBB44_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB44_28
; %bb.25:                               ;   in Loop: Header=BB44_24 Depth=1
	cmp	__rc8
	bne	.LBB44_31
; %bb.26:                               ;   in Loop: Header=BB44_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB44_32
; %bb.27:                               ;   in Loop: Header=BB44_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB44_29
	bra	.LBB44_30
.LBB44_28:                              ;   in Loop: Header=BB44_24 Depth=1
	cpy	__rc9
	bcc	.LBB44_30
.LBB44_29:                              ;   in Loop: Header=BB44_24 Depth=1
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
.LBB44_30:                              ;   in Loop: Header=BB44_24 Depth=1
	dex
	bne	.LBB44_24
	bra	.LBB44_35
.LBB44_31:                              ;   in Loop: Header=BB44_24 Depth=1
	cmp	__rc8
	bcs	.LBB44_29
	bra	.LBB44_30
.LBB44_32:                              ;   in Loop: Header=BB44_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB44_29
	bra	.LBB44_30
.LBB44_33:
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
	bra	.LBB44_35
.LBB44_34:
	tya
.LBB44_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end44:
	.size	__umodsi3, .Lfunc_end44-__umodsi3
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
	bne	.LBB45_8
; %bb.1:
	ldx	__rc14
	bne	.LBB45_8
; %bb.2:
	ldx	__rc13
	bne	.LBB45_8
; %bb.3:
	ldx	__rc12
	bne	.LBB45_8
; %bb.4:
	ldx	__rc11
	bne	.LBB45_8
; %bb.5:
	ldx	__rc10
	bne	.LBB45_8
; %bb.6:
	ldx	__rc9
	bne	.LBB45_8
; %bb.7:
	ldx	__rc8
	bne	.LBB45_8
; %bb.90:
	jmp	.LBB45_61
.LBB45_8:
	cmp	__rc15
	bne	.LBB45_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB45_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB45_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB45_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB45_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB45_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB45_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB45_23
; %bb.62:
	jmp	.LBB45_61
.LBB45_16:
	cmp	__rc15
	bcs	.LBB45_23
; %bb.64:
	jmp	.LBB45_61
.LBB45_17:
	cpx	__rc14
	bcs	.LBB45_23
; %bb.66:
	jmp	.LBB45_61
.LBB45_18:
	cpx	__rc13
	bcs	.LBB45_23
; %bb.68:
	jmp	.LBB45_61
.LBB45_19:
	cpx	__rc12
	bcs	.LBB45_23
; %bb.70:
	jmp	.LBB45_61
.LBB45_20:
	cpx	__rc11
	bcs	.LBB45_23
; %bb.72:
	jmp	.LBB45_61
.LBB45_21:
	cpx	__rc10
	bcs	.LBB45_23
; %bb.74:
	jmp	.LBB45_61
.LBB45_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB45_23
; %bb.92:
	jmp	.LBB45_61
.LBB45_23:
	ldx	__rc15
	bpl	.LBB45_24
; %bb.94:
	jmp	.LBB45_33
.LBB45_24:
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
.LBB45_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB45_29
; %bb.26:                               ;   in Loop: Header=BB45_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB45_30
; %bb.27:                               ;   in Loop: Header=BB45_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB45_31
; %bb.28:                               ;   in Loop: Header=BB45_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB45_76
; %bb.96:                               ;   in Loop: Header=BB45_25 Depth=1
	jmp	.LBB45_38
.LBB45_76:                              ;   in Loop: Header=BB45_25 Depth=1
	jmp	.LBB45_34
.LBB45_29:                              ;   in Loop: Header=BB45_25 Depth=1
	cmp	__rc19
	bcs	.LBB45_32
; %bb.98:
	jmp	.LBB45_42
.LBB45_30:                              ;   in Loop: Header=BB45_25 Depth=1
	cpy	__rc18
	bcs	.LBB45_32
; %bb.100:
	jmp	.LBB45_42
.LBB45_31:                              ;   in Loop: Header=BB45_25 Depth=1
	cpy	__rc7
	bcs	.LBB45_32
; %bb.102:
	jmp	.LBB45_42
.LBB45_32:                              ;   in Loop: Header=BB45_25 Depth=1
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
	bmi	.LBB45_78
; %bb.104:                              ;   in Loop: Header=BB45_25 Depth=1
	jmp	.LBB45_25
.LBB45_78:
	jmp	.LBB45_43
.LBB45_33:
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
	jmp	.LBB45_61
.LBB45_34:                              ;   in Loop: Header=BB45_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB45_39
; %bb.35:                               ;   in Loop: Header=BB45_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB45_40
; %bb.36:                               ;   in Loop: Header=BB45_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB45_41
; %bb.37:                               ;   in Loop: Header=BB45_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB45_42
; %bb.82:                               ;   in Loop: Header=BB45_25 Depth=1
	jmp	.LBB45_32
.LBB45_38:                              ;   in Loop: Header=BB45_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB45_42
; %bb.84:                               ;   in Loop: Header=BB45_25 Depth=1
	jmp	.LBB45_32
.LBB45_39:                              ;   in Loop: Header=BB45_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB45_42
; %bb.86:                               ;   in Loop: Header=BB45_25 Depth=1
	jmp	.LBB45_32
.LBB45_40:                              ;   in Loop: Header=BB45_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB45_42
; %bb.88:                               ;   in Loop: Header=BB45_25 Depth=1
	jmp	.LBB45_32
.LBB45_41:                              ;   in Loop: Header=BB45_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB45_42
; %bb.106:                              ;   in Loop: Header=BB45_25 Depth=1
	jmp	.LBB45_32
.LBB45_42:
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
.LBB45_43:
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
	bne	.LBB45_44
; %bb.108:
	jmp	.LBB45_61
.LBB45_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB45_52
; %bb.45:                               ;   in Loop: Header=BB45_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB45_46
; %bb.110:                              ;   in Loop: Header=BB45_44 Depth=1
	jmp	.LBB45_55
.LBB45_46:                              ;   in Loop: Header=BB45_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB45_47
; %bb.112:                              ;   in Loop: Header=BB45_44 Depth=1
	jmp	.LBB45_56
.LBB45_47:                              ;   in Loop: Header=BB45_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB45_48
; %bb.114:                              ;   in Loop: Header=BB45_44 Depth=1
	jmp	.LBB45_57
.LBB45_48:                              ;   in Loop: Header=BB45_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB45_49
; %bb.116:                              ;   in Loop: Header=BB45_44 Depth=1
	jmp	.LBB45_58
.LBB45_49:                              ;   in Loop: Header=BB45_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB45_50
; %bb.118:                              ;   in Loop: Header=BB45_44 Depth=1
	jmp	.LBB45_59
.LBB45_50:                              ;   in Loop: Header=BB45_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB45_51
; %bb.120:                              ;   in Loop: Header=BB45_44 Depth=1
	jmp	.LBB45_60
.LBB45_51:                              ;   in Loop: Header=BB45_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB45_53
	bra	.LBB45_54
.LBB45_52:                              ;   in Loop: Header=BB45_44 Depth=1
	cmp	__rc19
	bcc	.LBB45_54
.LBB45_53:                              ;   in Loop: Header=BB45_44 Depth=1
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
.LBB45_54:                              ;   in Loop: Header=BB45_44 Depth=1
	dex
	beq	.LBB45_61
; %bb.122:                              ;   in Loop: Header=BB45_44 Depth=1
	jmp	.LBB45_44
.LBB45_55:                              ;   in Loop: Header=BB45_44 Depth=1
	cpy	__rc18
	bcs	.LBB45_53
	bra	.LBB45_54
.LBB45_56:                              ;   in Loop: Header=BB45_44 Depth=1
	cpy	__rc7
	bcs	.LBB45_53
	bra	.LBB45_54
.LBB45_57:                              ;   in Loop: Header=BB45_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB45_53
	bra	.LBB45_54
.LBB45_58:                              ;   in Loop: Header=BB45_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB45_53
	bra	.LBB45_54
.LBB45_59:                              ;   in Loop: Header=BB45_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB45_53
	bra	.LBB45_54
.LBB45_60:                              ;   in Loop: Header=BB45_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB45_54
; %bb.124:                              ;   in Loop: Header=BB45_44 Depth=1
	jmp	.LBB45_53
.LBB45_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end45:
	.size	__umoddi3, .Lfunc_end45-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB46_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB46_2
; %bb.18:
	jmp	.LBB46_17
.LBB46_2:
	lda	__rc5
	bpl	.LBB46_3
; %bb.20:
	jmp	.LBB46_15
.LBB46_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB46_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB46_6
; %bb.5:                                ;   in Loop: Header=BB46_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB46_9
	bra	.LBB46_7
.LBB46_6:                               ;   in Loop: Header=BB46_4 Depth=1
	cpy	__rc6
	bcc	.LBB46_9
.LBB46_7:                               ;   in Loop: Header=BB46_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB46_4
	bra	.LBB46_10
.LBB46_8:
	sty	__rc7
	bra	.LBB46_17
.LBB46_9:
	ldy	__rc5
	sty	__rc4
.LBB46_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB46_16
; %bb.11:
	lda	#1
.LBB46_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB46_14
; %bb.13:                               ;   in Loop: Header=BB46_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB46_14:                              ;   in Loop: Header=BB46_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB46_12
	bra	.LBB46_17
.LBB46_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB46_16:
	lda	#1
.LBB46_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end46:
	.size	__udivmodqi4, .Lfunc_end46-__udivmodqi4
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
	bne	.LBB47_2
; %bb.1:
	ldx	__rc2
	beq	.LBB47_4
.LBB47_2:
	cmp	__rc3
	bne	.LBB47_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB47_6
.LBB47_4:
	ldx	#0
; %bb.26:
	jmp	.LBB47_24
.LBB47_5:
	cmp	__rc3
	bcc	.LBB47_4
.LBB47_6:
	tay
	ldx	__rc3
	bpl	.LBB47_7
; %bb.28:
	jmp	.LBB47_22
.LBB47_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB47_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB47_10
; %bb.9:                                ;   in Loop: Header=BB47_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB47_11
	bra	.LBB47_12
.LBB47_10:                              ;   in Loop: Header=BB47_8 Depth=1
	cmp	__rc8
	bcc	.LBB47_12
.LBB47_11:                              ;   in Loop: Header=BB47_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB47_8
	bra	.LBB47_13
.LBB47_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB47_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB47_14
; %bb.30:
	jmp	.LBB47_23
.LBB47_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB47_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB47_17
; %bb.16:                               ;   in Loop: Header=BB47_15 Depth=1
	ldy	#0
.LBB47_17:                              ;   in Loop: Header=BB47_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB47_21
; %bb.18:                               ;   in Loop: Header=BB47_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB47_20
.LBB47_19:                              ;   in Loop: Header=BB47_15 Depth=1
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
.LBB47_20:                              ;   in Loop: Header=BB47_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB47_15
	bra	.LBB47_25
.LBB47_21:                              ;   in Loop: Header=BB47_15 Depth=1
	cmp	__rc8
	bcs	.LBB47_19
	bra	.LBB47_20
.LBB47_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB47_23:
	ldx	#1
.LBB47_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB47_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end47:
	.size	__udivmodhi4, .Lfunc_end47-__udivmodhi4
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
	bpl	.LBB48_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB48_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB48_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB48_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB48_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB48_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB48_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB48_8:
	lda	__rc2
	rts
.Lfunc_end48:
	.size	__divqi3, .Lfunc_end48-__divqi3
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
	bmi	.LBB49_2
; %bb.1:
	bra	.LBB49_6
.LBB49_2:
	cpx	#128
	bne	.LBB49_5
; %bb.3:
	lda	__rc4
	bne	.LBB49_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB49_6
.LBB49_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB49_6:
	tya
	bmi	.LBB49_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB49_12
.LBB49_8:
	cpy	#128
	bne	.LBB49_11
; %bb.9:
	lda	__rc2
	bne	.LBB49_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB49_12
.LBB49_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB49_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB49_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB49_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end49:
	.size	__divhi3, .Lfunc_end49-__divhi3
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
	bmi	.LBB50_2
; %bb.1:
	ldy	__rc3
	bra	.LBB50_8
.LBB50_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB50_7
; %bb.3:
	lda	__rc2
	bne	.LBB50_7
; %bb.4:
	lda	__rc8
	bne	.LBB50_7
; %bb.5:
	lda	__rc9
	bne	.LBB50_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB50_8
.LBB50_7:
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
.LBB50_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB50_10
; %bb.9:
	lda	__rc7
	bra	.LBB50_16
.LBB50_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB50_15
; %bb.11:
	lda	__rc6
	bne	.LBB50_15
; %bb.12:
	lda	__rc5
	bne	.LBB50_15
; %bb.13:
	lda	__rc4
	bne	.LBB50_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB50_16
.LBB50_15:
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
.LBB50_16:
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
	bne	.LBB50_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB50_19
.LBB50_18:
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
.LBB50_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end50:
	.size	__divsi3, .Lfunc_end50-__divsi3
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
	bmi	.LBB51_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB51_12
.LBB51_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB51_11
; %bb.3:
	lda	__rc6
	bne	.LBB51_11
; %bb.4:
	lda	__rc5
	bne	.LBB51_11
; %bb.5:
	lda	__rc4
	bne	.LBB51_11
; %bb.6:
	lda	__rc3
	bne	.LBB51_11
; %bb.7:
	lda	__rc2
	bne	.LBB51_11
; %bb.8:
	lda	__rc18
	bne	.LBB51_11
; %bb.9:
	lda	__rc19
	bne	.LBB51_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB51_12
.LBB51_11:
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
.LBB51_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB51_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB51_24
.LBB51_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB51_23
; %bb.15:
	lda	__rc14
	bne	.LBB51_23
; %bb.16:
	lda	__rc13
	bne	.LBB51_23
; %bb.17:
	lda	__rc12
	bne	.LBB51_23
; %bb.18:
	lda	__rc11
	bne	.LBB51_23
; %bb.19:
	lda	__rc10
	bne	.LBB51_23
; %bb.20:
	lda	__rc9
	bne	.LBB51_23
; %bb.21:
	lda	__rc8
	bne	.LBB51_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB51_24
.LBB51_23:
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
.LBB51_24:
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
	bne	.LBB51_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB51_27
.LBB51_26:
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
.LBB51_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end51:
	.size	__divdi3, .Lfunc_end51-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB52_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB52_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB52_3:
	tay
	lda	__rc2
	bmi	.LBB52_5
; %bb.4:
	lda	__rc2
	bra	.LBB52_7
.LBB52_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB52_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB52_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB52_9
; %bb.8:
	rts
.LBB52_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end52:
	.size	__modqi3, .Lfunc_end52-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB53_2
; %bb.1:
	txa
	bra	.LBB53_6
.LBB53_2:
	cpx	#128
	bne	.LBB53_5
; %bb.3:
	lda	__rc4
	bne	.LBB53_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB53_6
.LBB53_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB53_6:
	ldx	__rc3
	bpl	.LBB53_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB53_10
; %bb.8:
	ldx	__rc2
	bne	.LBB53_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB53_11
.LBB53_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB53_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB53_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB53_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end53:
	.size	__modhi3, .Lfunc_end53-__modhi3
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
	bmi	.LBB54_2
; %bb.1:
	lda	__rc3
	bra	.LBB54_8
.LBB54_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB54_7
; %bb.3:
	lda	__rc2
	bne	.LBB54_7
; %bb.4:
	lda	__rc8
	bne	.LBB54_7
; %bb.5:
	lda	__rc9
	bne	.LBB54_7
; %bb.6:
	stz	__rc9
	lda	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB54_8
.LBB54_7:
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
.LBB54_8:
	ldx	__rc7
	bpl	.LBB54_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB54_14
; %bb.10:
	ldx	__rc6
	bne	.LBB54_14
; %bb.11:
	ldx	__rc5
	bne	.LBB54_14
; %bb.12:
	ldx	__rc4
	bne	.LBB54_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB54_15
.LBB54_14:
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
.LBB54_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB54_17
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
.LBB54_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end54:
	.size	__modsi3, .Lfunc_end54-__modsi3
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
	bmi	.LBB55_2
; %bb.1:
	lda	__rc7
; %bb.26:
	jmp	.LBB55_12
.LBB55_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB55_11
; %bb.3:
	lda	__rc6
	bne	.LBB55_11
; %bb.4:
	lda	__rc5
	bne	.LBB55_11
; %bb.5:
	lda	__rc4
	bne	.LBB55_11
; %bb.6:
	lda	__rc3
	bne	.LBB55_11
; %bb.7:
	lda	__rc2
	bne	.LBB55_11
; %bb.8:
	lda	__rc18
	bne	.LBB55_11
; %bb.9:
	lda	__rc19
	bne	.LBB55_11
; %bb.10:
	stz	__rc19
	lda	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB55_12
.LBB55_11:
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
.LBB55_12:
	ldx	__rc15
	bmi	.LBB55_13
; %bb.28:
	jmp	.LBB55_23
.LBB55_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB55_22
; %bb.14:
	ldx	__rc14
	bne	.LBB55_22
; %bb.15:
	ldx	__rc13
	bne	.LBB55_22
; %bb.16:
	ldx	__rc12
	bne	.LBB55_22
; %bb.17:
	ldx	__rc11
	bne	.LBB55_22
; %bb.18:
	ldx	__rc10
	bne	.LBB55_22
; %bb.19:
	ldx	__rc9
	bne	.LBB55_22
; %bb.20:
	ldx	__rc8
	bne	.LBB55_22
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
	bra	.LBB55_23
.LBB55_22:
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
.LBB55_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB55_25
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
.LBB55_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end55:
	.size	__moddi3, .Lfunc_end55-__moddi3
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
	bpl	.LBB56_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB56_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB56_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB56_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB56_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB56_11
.LBB56_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB56_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB56_8
; %bb.34:
	jmp	.LBB56_24
.LBB56_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB56_24
.LBB56_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB56_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB56_12
.LBB56_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB56_24
.LBB56_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB56_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB56_15
; %bb.14:                               ;   in Loop: Header=BB56_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB56_18
	bra	.LBB56_16
.LBB56_15:                              ;   in Loop: Header=BB56_13 Depth=1
	cmp	__rc7
	bcc	.LBB56_18
.LBB56_16:                              ;   in Loop: Header=BB56_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB56_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB56_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB56_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB56_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB56_22
; %bb.21:                               ;   in Loop: Header=BB56_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB56_22:                              ;   in Loop: Header=BB56_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB56_20
	bra	.LBB56_24
.LBB56_23:
	sta	__rc7
	sty	__rc6
.LBB56_24:
	lda	__rc4
	bmi	.LBB56_26
; %bb.25:
	lda	__rc7
	bra	.LBB56_27
.LBB56_26:
	lda	#0
	sec
	sbc	__rc7
.LBB56_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB56_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB56_29:
	lda	__rc6
	rts
.Lfunc_end56:
	.size	__divmodqi4, .Lfunc_end56-__divmodqi4
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
	bmi	.LBB57_2
.LBB57_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB57_6
.LBB57_2:
	cpx	#128
	bne	.LBB57_5
; %bb.3:
	lda	__rc7
	bne	.LBB57_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB57_1
.LBB57_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB57_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB57_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB57_15
; %bb.8:
	lda	__rc2
	bne	.LBB57_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB57_18
.LBB57_10:
	cpy	#128
	bne	.LBB57_14
; %bb.11:
	ldy	__rc2
	bne	.LBB57_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB57_13
; %bb.48:
	jmp	.LBB57_45
.LBB57_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB57_18
.LBB57_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB57_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB57_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB57_20
.LBB57_17:
	sta	__rc11
.LBB57_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB57_39
.LBB57_19:
	cmp	__rc7
	bcc	.LBB57_17
.LBB57_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB57_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB57_23
; %bb.22:                               ;   in Loop: Header=BB57_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB57_24
	bra	.LBB57_26
.LBB57_23:                              ;   in Loop: Header=BB57_21 Depth=1
	cmp	__rc9
	bcc	.LBB57_26
.LBB57_24:                              ;   in Loop: Header=BB57_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB57_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB57_27
.LBB57_26:
	tay
.LBB57_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB57_28
; %bb.50:
	jmp	.LBB57_37
.LBB57_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB57_32
.LBB57_29:                              ;   in Loop: Header=BB57_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB57_36
.LBB57_30:                              ;   in Loop: Header=BB57_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB57_31:                              ;   in Loop: Header=BB57_32 Depth=1
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
	beq	.LBB57_39
.LBB57_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB57_34
; %bb.33:                               ;   in Loop: Header=BB57_32 Depth=1
	ldy	#0
.LBB57_34:                              ;   in Loop: Header=BB57_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB57_29
; %bb.35:                               ;   in Loop: Header=BB57_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB57_30
.LBB57_36:                              ;   in Loop: Header=BB57_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB57_31
.LBB57_37:
	sta	__rc11
	ldx	#1
.LBB57_38:
	stx	__rc9
.LBB57_39:
	lda	__rc6
	bmi	.LBB57_41
; %bb.40:
	lda	__rc10
	bra	.LBB57_42
.LBB57_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB57_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB57_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB57_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB57_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB57_38
.Lfunc_end57:
	.size	__divmodhi4, .Lfunc_end57-__divmodhi4
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
	.asciz	"external.d81"
	.size	.L.str.28, 13

	.type	.L.str.29,@object               ; @.str.29
.L.str.29:
	.asciz	" hyppofn: "
	.size	.L.str.29, 11

	.type	.L.str.30,@object               ; @.str.30
.L.str.30:
	.asciz	"EXTERNAL.D81"
	.size	.L.str.30, 13

	.type	.L.str.31,@object               ; @.str.31
.L.str.31:
	.asciz	" hyppo_d81attach1 is: "
	.size	.L.str.31, 23

	.type	.L.str.32,@object               ; @.str.32
.L.str.32:
	.asciz	"hyppo_selectdrive "
	.size	.L.str.32, 19

	.type	.L.str.33,@object               ; @.str.33
.L.str.33:
	.asciz	" is: "
	.size	.L.str.33, 6

	.type	.L.str.34,@object               ; @.str.34
.L.str.34:
	.asciz	"hyppo_getcurrentdrive is: "
	.size	.L.str.34, 27

	.type	.L.str.35,@object               ; @.str.35
.L.str.35:
	.asciz	"hyppo_opendir, file descriptor is: "
	.size	.L.str.35, 36

	.type	.L.str.36,@object               ; @.str.36
.L.str.36:
	.asciz	"hyppo_readdir, err is: "
	.size	.L.str.36, 24

	.type	.L.str.37,@object               ; @.str.37
.L.str.37:
	.asciz	"filename is: "
	.size	.L.str.37, 14

	.type	.L.str.38,@object               ; @.str.38
.L.str.38:
	.asciz	"filenamelength is: "
	.size	.L.str.38, 20

	.type	.L.str.39,@object               ; @.str.39
.L.str.39:
	.asciz	"hyppo_closedir is: "
	.size	.L.str.39, 20

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
	.zero	41
	.size	.Lzp_stack, 41

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
.set .L__udivmodhi4_zp_stk, .Lzp_stack+30
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
	.size	.Lcputsxy_zp_stk, 9
.set .Lcputhex_zp_stk, .Lzp_stack
	.size	.Lcputhex_zp_stk, 14
.set .Lcputln_zp_stk, .Lzp_stack
	.size	.Lcputln_zp_stk, 6
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
	.addrsig_sym fnamehi
	.addrsig_sym dmalist
	.addrsig_sym .Lzp_stack
	;Declaring this symbol tells the CRT that there is something in .bss, so it may need to be zeroed.
	.globl	__do_zero_bss
	;Declaring this symbol tells the CRT that there is something in .zp.bss, so it may need to be zeroed.
	.globl	__do_zero_zp_bss
	;Declaring this symbol tells the CRT that there is something in .zp.data, so it may need to be copied from LMA to VMA.
	.globl	__do_copy_zp_data
	;Declaring this symbol tells the CRT that the stack pointer needs to be initialized.
	.globl	__do_init_stack
	;Declaring this symbol tells the CRT that the stack pointer needs to be initialized.
	.globl	__do_init_stack

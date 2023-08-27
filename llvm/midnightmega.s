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
.set readdir_dirent, 6656

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
	tay
	stx	mos8(.Lmprintf_zp_stk+1)
	ldx	__rc4
	stx	mos8(.Lmprintf_zp_stk+2)
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
	bra	.LBB1_8
.LBB1_1:                                ;   in Loop: Header=BB1_8 Depth=1
	cmp	#96
	bcc	.LBB1_3
; %bb.2:                                ;   in Loop: Header=BB1_8 Depth=1
	clc
	adc	#160
	bra	.LBB1_5
.LBB1_3:                                ;   in Loop: Header=BB1_8 Depth=1
	clc
	sta	__rc8
	adc	#165
	tax
	lda	__rc8
	cpx	#5
	bcs	.LBB1_5
; %bb.4:                                ;   in Loop: Header=BB1_8 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB1_5:                                ;   in Loop: Header=BB1_8 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB1_7
; %bb.6:                                ;   in Loop: Header=BB1_8 Depth=1
	inc	__rc7
.LBB1_7:                                ;   in Loop: Header=BB1_8 Depth=1
	tax
	beq	.LBB1_12
.LBB1_8:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB1_10
; %bb.9:                                ;   in Loop: Header=BB1_8 Depth=1
	inc	__rc5
.LBB1_10:                               ;   in Loop: Header=BB1_8 Depth=1
	cmp	#192
	bcc	.LBB1_1
; %bb.11:                               ;   in Loop: Header=BB1_8 Depth=1
	eor	#128
	bra	.LBB1_5
.LBB1_12:
	ldx	#9
	stx	mos8(.Lmprintf_zp_stk+20)       ; 1-byte Folded Spill
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	sty	mos8(.Lmprintf_zp_stk)
	jsr	cputsxy
	lda	mos8(.Lmprintf_zp_stk)
	stz	mos8(.Lmprintf_zp_stk+15)
	stz	mos8(.Lmprintf_zp_stk)
	ldx	mos8(.Lmprintf_zp_stk+1)
	ldy	mos8(.Lmprintf_zp_stk+2)
	sty	__rc2
	ldy	mos8(.Lmprintf_zp_stk+3)
	sty	__rc3
.LBB1_13:                               ; =>This Inner Loop Header: Depth=1
	ldy	#mos8(.Lmprintf_zp_stk+16)
	sty	__rc8
	ldy	#mos8(0)
	sty	__rc9
	ldy	#10
	sty	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	sta	mos8(.Lmprintf_zp_stk+1)
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
	bne	.LBB1_17
; %bb.14:                               ;   in Loop: Header=BB1_13 Depth=1
	lda	mos8(.Lmprintf_zp_stk+4)
	bne	.LBB1_18
; %bb.15:                               ;   in Loop: Header=BB1_13 Depth=1
	ldy	mos8(.Lmprintf_zp_stk+2)
	bne	.LBB1_21
; %bb.16:                               ;   in Loop: Header=BB1_13 Depth=1
	ldy	mos8(.Lmprintf_zp_stk+1)
	cpy	#10
	bra	.LBB1_20
.LBB1_17:                               ;   in Loop: Header=BB1_13 Depth=1
	ldx	mos8(.Lmprintf_zp_stk+3)
	bra	.LBB1_19
.LBB1_18:                               ;   in Loop: Header=BB1_13 Depth=1
	ldx	mos8(.Lmprintf_zp_stk+4)
.LBB1_19:                               ;   in Loop: Header=BB1_13 Depth=1
	cpx	#0
.LBB1_20:                               ;   in Loop: Header=BB1_13 Depth=1
	lda	__rc7
	ldx	__rc5
	ldy	__rc4
	sty	mos8(.Lmprintf_zp_stk+20)       ; 1-byte Folded Spill
	bcc	.LBB1_22
; %bb.25:                               ;   in Loop: Header=BB1_13 Depth=1
	jmp	.LBB1_13
.LBB1_21:                               ;   in Loop: Header=BB1_13 Depth=1
	cpy	#0
	bra	.LBB1_20
.LBB1_22:
	lda	#mos8(.Lmprintf_zp_stk+5)
	clc
	adc	__rc4
	sta	__rc2
	lda	#mos8(0)
	adc	#0
	sta	__rc3
	inc	__rc2
	bne	.LBB1_24
; %bb.23:
	inc	__rc3
.LBB1_24:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end1:
	.size	mprintf, .Lfunc_end1-mprintf
                                        ; -- End function
	.section	.text.inputbox,"ax",@progbits
	.type	inputbox,@function              ; -- Begin function inputbox
inputbox:                               ; @inputbox
; %bb.0:
	clc
	lda	__rc0
	adc	#251
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
	ldy	#3
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
	ldx	__rc2
	stx	__rc24
	ldx	__rc3
	stx	__rc25
	ldy	#4
	ldx	#52
	stx	__rc22
	ldx	#3
	stx	__rc23
	stz	__rc20
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
.LBB2_1:                                ; =>This Inner Loop Header: Depth=1
	lda	mos8(g_curScreenW)
	sty	__rc2
	stz	__rc3
	ldx	#0
	sty	__rc21
	jsr	__mulhi3
	clc
	adc	#10
	sta	__rc26
	txa
	adc	#0
	sta	__rc27
	lda	53347
	and	#7
	tay
	ldx	53346
	stx	__rc4
	ldx	53345
	stx	__rc2
	ldx	53344
	stx	__rc3
	clc
	lda	__rc26
	adc	#0
	tax
	lda	__rc27
	adc	__rc2
	sta	__rc5
	lda	__rc4
	adc	#0
	sta	__rc2
	tya
	adc	#0
	sta	__rc4
	clc
	txa
	adc	__rc3
	tay
	lda	__rc5
	adc	#0
	sta	__rc7
	lda	__rc2
	adc	#0
	sta	__rc2
	lda	__rc4
	adc	#0
	sta	__rc3
	ldx	#32
	stx	__rc4
	ldx	#60
	stx	__rc5
	stz	__rc6
	ldx	__rc7
	tya
	jsr	lfill
	ldx	#248
	stx	__rc2
	ldx	#15
	stx	__rc3
	ldx	#3
	stx	__rc4
	ldx	#60
	stx	__rc5
	stz	__rc6
	ldx	__rc27
	lda	__rc26
	jsr	lfill
	ldy	__rc21
	iny
	cpy	#10
	beq	.LBB2_2
; %bb.51:                               ;   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_1
.LBB2_2:
	ldx	#11
	txa
	ldy	#4
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#10
	ldx	#4
	ldy	#112
	sty	__rc2
	jsr	cputcxy
	lda	#9
	ldx	#109
	stx	__rc2
	tax
	inc
	jsr	cputcxy
	lda	#70
	ldx	#110
	stx	__rc2
	ldx	#4
	jsr	cputcxy
	ldx	#125
	stx	__rc2
	ldx	#9
	lda	#70
	jsr	cputcxy
.LBB2_3:                                ; =>This Inner Loop Header: Depth=1
	ldx	#64
	stx	__rc2
	ldx	#4
	ldy	#4
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc21
	jsr	cputcxy
	ldx	#64
	stx	__rc2
	ldx	#9
	lda	__rc21
	jsr	cputcxy
	inc	__rc21
	lda	__rc21
	ldy	#4
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc21
	cpx	#70
	bne	.LBB2_3
; %bb.4:
	ldx	#5
.LBB2_5:                                ; =>This Inner Loop Header: Depth=1
	ldy	#93
	sty	__rc2
	stx	__rc21
	lda	#10
	jsr	cputcxy
	ldx	#93
	stx	__rc2
	ldx	__rc21
	lda	#70
	jsr	cputcxy
	ldx	__rc21
	inx
	cpx	#9
	bne	.LBB2_5
; %bb.6:
	ldx	mos8(g_curScreenH)
	cpx	#10
	bcs	.LBB2_7
; %bb.53:
	jmp	.LBB2_10
.LBB2_7:
	lda	mos8(g_curScreenW)
	cmp	#71
	bcs	.LBB2_8
; %bb.55:
	jmp	.LBB2_10
.LBB2_8:
	ldx	#0
	ldy	#5
	pha
	tya
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldy	#10
	stz	__rc21
	sty	__rc2
	stz	__rc3
	jsr	__mulhi3
	clc
	adc	#11
	sta	__rc7
	txa
	adc	#0
	sta	__rc8
	lda	#0
	adc	#248
	sta	__rc2
	lda	#0
	adc	#15
	ldy	#11
	ldx	#60
	sta	__rc3
	stx	__rc5
	sty	__rc4
	stz	__rc6
	ldx	__rc8
	lda	__rc7
	jsr	lfill
.LBB2_9:                                ; =>This Inner Loop Header: Depth=1
	lda	mos8(g_curScreenW)
	pha
	ldy	#4
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc21
	pla
	ldx	__rc21
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	#71
	tay
	txa
	adc	#0
	sta	__rc5
	lda	#0
	adc	#248
	sta	__rc2
	lda	#0
	adc	#15
	sta	__rc3
	ldx	#11
	stx	__rc4
	ldx	__rc5
	tya
	jsr	lpoke
	inc	__rc21
	lda	__rc21
	ldy	#4
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc21
	cpx	#11
	bne	.LBB2_9
.LBB2_10:
	ldx	#12
	stx	mos8(g_curX)
	ldx	#5
	stx	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB2_18
.LBB2_11:                               ;   in Loop: Header=BB2_18 Depth=1
	cmp	#96
	bcc	.LBB2_13
; %bb.12:                               ;   in Loop: Header=BB2_18 Depth=1
	clc
	adc	#160
	bra	.LBB2_15
.LBB2_13:                               ;   in Loop: Header=BB2_18 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB2_15
; %bb.14:                               ;   in Loop: Header=BB2_18 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB2_15:                               ;   in Loop: Header=BB2_18 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB2_17
; %bb.16:                               ;   in Loop: Header=BB2_18 Depth=1
	inc	__rc3
.LBB2_17:                               ;   in Loop: Header=BB2_18 Depth=1
	tax
	beq	.LBB2_22
.LBB2_18:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB2_20
; %bb.19:                               ;   in Loop: Header=BB2_18 Depth=1
	inc	__rc25
.LBB2_20:                               ;   in Loop: Header=BB2_18 Depth=1
	cmp	#192
	bcc	.LBB2_11
; %bb.21:                               ;   in Loop: Header=BB2_18 Depth=1
	eor	#128
	bra	.LBB2_15
.LBB2_22:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#12
	stx	mos8(g_curX)
	ldx	#6
	stx	mos8(g_curY)
	bra	.LBB2_24
.LBB2_23:                               ;   in Loop: Header=BB2_24 Depth=1
	stz	54800
.LBB2_24:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB2_23
; %bb.25:
	ldx	#0
	stx	__rc2
	ldx	#28
	stx	__rc3
	stz	__rc4
	ldx	#56
	lda	#0
	jsr	__memset
	bra	.LBB2_28
.LBB2_26:                               ;   in Loop: Header=BB2_28 Depth=1
	stx	__rc20
	inc	__rc20
.LBB2_27:                               ;   in Loop: Header=BB2_28 Depth=1
	sta	7168,x
.LBB2_28:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_35 Depth 2
                                        ;       Child Loop BB2_31 Depth 3
	ldx	__rc20
	bra	.LBB2_35
.LBB2_29:                               ;   in Loop: Header=BB2_35 Depth=2
	ldy	#12
	sty	mos8(g_curX)
	ldx	#6
	stx	mos8(g_curY)
.LBB2_30:                               ;   in Loop: Header=BB2_35 Depth=2
	lda	#16
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	lda	#224
	sta	__rc2
	tya
	jsr	cputcxy
	lda	#239
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
.LBB2_31:                               ;   Parent Loop BB2_28 Depth=1
                                        ;     Parent Loop BB2_35 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	54800
	beq	.LBB2_31
; %bb.32:                               ;   in Loop: Header=BB2_35 Depth=2
	stz	54800
	cmp	#13
	bne	.LBB2_33
; %bb.57:
	jmp	.LBB2_43
.LBB2_33:                               ;   in Loop: Header=BB2_35 Depth=2
	ldx	__rc21
	cmp	#20
	beq	.LBB2_37
; %bb.34:                               ;   in Loop: Header=BB2_35 Depth=2
	cpx	#55
	bcc	.LBB2_39
.LBB2_35:                               ;   Parent Loop BB2_28 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_31 Depth 3
	stx	__rc21
	ldx	7168
	beq	.LBB2_29
; %bb.36:                               ;   in Loop: Header=BB2_35 Depth=2
	ldx	#0
	stx	__rc2
	ldx	#28
	stx	__rc3
	ldx	#6
	lda	#12
	jsr	cputsxy
	ldy	mos8(g_curX)
	ldx	mos8(g_curY)
	bra	.LBB2_30
.LBB2_37:                               ;   in Loop: Header=BB2_28 Depth=1
	stz	__rc20
	txa
	beq	.LBB2_28
; %bb.38:                               ;   in Loop: Header=BB2_28 Depth=1
	lda	mos8(g_curX)
	dec
	dec	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	lda	#0
	ldx	__rc21
	dex
	stx	__rc20
; %bb.45:                               ;   in Loop: Header=BB2_28 Depth=1
	jmp	.LBB2_27
.LBB2_39:                               ;   in Loop: Header=BB2_28 Depth=1
	cmp	#97
	bcs	.LBB2_40
; %bb.59:                               ;   in Loop: Header=BB2_28 Depth=1
	jmp	.LBB2_26
.LBB2_40:                               ;   in Loop: Header=BB2_28 Depth=1
	cmp	#123
	bcc	.LBB2_41
; %bb.61:                               ;   in Loop: Header=BB2_28 Depth=1
	jmp	.LBB2_26
.LBB2_41:                               ;   in Loop: Header=BB2_28 Depth=1
	tay
	lda	3352
	and	#253
	bne	.LBB2_42
; %bb.63:                               ;   in Loop: Header=BB2_28 Depth=1
	jmp	.LBB2_44
.LBB2_42:                               ;   in Loop: Header=BB2_28 Depth=1
	clc
	tya
	adc	#224
; %bb.47:                               ;   in Loop: Header=BB2_28 Depth=1
	jmp	.LBB2_26
.LBB2_43:
	lda	mos8(g_curX)
	dec
	dec	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	ldx	#1
	stx	mos8(g_curX)
	ldx	#10
	stx	mos8(g_curY)
	ldy	#0
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
	adc	#5
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.LBB2_44:                               ;   in Loop: Header=BB2_28 Depth=1
	tya
; %bb.49:                               ;   in Loop: Header=BB2_28 Depth=1
	jmp	.LBB2_26
.Lfunc_end2:
	.size	inputbox, .Lfunc_end2-inputbox
                                        ; -- End function
	.section	.text.ReadSector,"ax",@progbits
	.type	ReadSector,@function            ; -- Begin function ReadSector
ReadSector:                             ; @ReadSector
; %bb.0:
	tay
	bne	.LBB3_1
; %bb.15:
	jmp	.LBB3_14
.LBB3_1:
	ldy	__rc20
	phy
	ldy	__rc21
	phy
	sta	__rc20
	stx	__rc21
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldx	#mos16lo(.L.str.6)
	stx	__rc4
	ldx	#mos16hi(.L.str.6)
	stx	__rc5
	ldx	#52
	stx	__rc6
	ldx	#3
	stx	__rc7
	bra	.LBB3_9
.LBB3_2:                                ;   in Loop: Header=BB3_9 Depth=1
	cmp	#96
	bcc	.LBB3_4
; %bb.3:                                ;   in Loop: Header=BB3_9 Depth=1
	clc
	adc	#160
	bra	.LBB3_6
.LBB3_4:                                ;   in Loop: Header=BB3_9 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_6
; %bb.5:                                ;   in Loop: Header=BB3_9 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_6:                                ;   in Loop: Header=BB3_9 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB3_8
; %bb.7:                                ;   in Loop: Header=BB3_9 Depth=1
	inc	__rc7
.LBB3_8:                                ;   in Loop: Header=BB3_9 Depth=1
	tax
	beq	.LBB3_13
.LBB3_9:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB3_11
; %bb.10:                               ;   in Loop: Header=BB3_9 Depth=1
	inc	__rc5
.LBB3_11:                               ;   in Loop: Header=BB3_9 Depth=1
	cmp	#192
	bcc	.LBB3_2
; %bb.12:                               ;   in Loop: Header=BB3_9 Depth=1
	eor	#128
	bra	.LBB3_6
.LBB3_13:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jsr	cputsxy
	lda	#97
	ldx	__rc20
	ldy	__rc21
	;APP
	sta	53376
	lda	#32
	sta	53377
	dex
	stx	53380
	tya
	lsr
	tax
	inx
	stx	53381
	lda	#0
	sta	53382
	adc	#0
	sta	flagCurrSec
	lda	#65
	sta	53377
wait020:
	lda	53378
	bmi	wait020
	lda	53378
	and	#24
	beq	succeed020
	lda	#64
	sta	53376
	sec
	jmp	endsub020
succeed020:
	lda	#128
	trb	54921
	clc
	lda	#0
	sta	offsCurrIdx
	lda	flagCurrSec
	beq	upper020
	lda	#109
	sta	ptrMiniOffs+1
	jmp	endsub020
upper020:
	lda	#108
	sta	ptrMiniOffs+1
	jmp	endsub020
endsub020:
	bcs	err020
	lda	flagCurrSec
	jmp	end020
err020:
	lda	#255
end020:
	sta	__rc2

	;NO_APP
	lda	__rc2
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.LBB3_14:
	lda	#252
	rts
.Lfunc_end3:
	.size	ReadSector, .Lfunc_end3-ReadSector
                                        ; -- End function
	.section	.text.GetWholeSector,"ax",@progbits
	.type	GetWholeSector,@function        ; -- Begin function GetWholeSector
GetWholeSector:                         ; @GetWholeSector
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#247
	sta	__rc0
	lda	__rc1
	adc	#255
	sta	__rc1
	pla
	ldy	__rc20
	phy
	ldy	__rc21
	phy
	ldy	__rc22
	phy
	ldy	__rc23
	phy
	pha
	lda	__rc24
	ldy	#7
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
	lda	__rc31
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	__rc25
	stx	__rc24
	ldx	__rc2
	stx	__rc22
	ldx	__rc3
	stx	__rc23
	ldx	#52
	stx	__rc20
	ldx	#3
	stx	__rc21
	ldx	#mos16lo(.L.str.7)
	stx	__rc2
	ldx	#mos16hi(.L.str.7)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB4_8
.LBB4_1:                                ;   in Loop: Header=BB4_8 Depth=1
	cmp	#96
	bcc	.LBB4_3
; %bb.2:                                ;   in Loop: Header=BB4_8 Depth=1
	clc
	adc	#160
	bra	.LBB4_5
.LBB4_3:                                ;   in Loop: Header=BB4_8 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB4_5
; %bb.4:                                ;   in Loop: Header=BB4_8 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB4_5:                                ;   in Loop: Header=BB4_8 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_7
; %bb.6:                                ;   in Loop: Header=BB4_8 Depth=1
	inc	__rc5
.LBB4_7:                                ;   in Loop: Header=BB4_8 Depth=1
	tax
	beq	.LBB4_12
.LBB4_8:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_10
; %bb.9:                                ;   in Loop: Header=BB4_8 Depth=1
	inc	__rc3
.LBB4_10:                               ;   in Loop: Header=BB4_8 Depth=1
	cmp	#192
	bcc	.LBB4_1
; %bb.11:                               ;   in Loop: Header=BB4_8 Depth=1
	eor	#128
	bra	.LBB4_5
.LBB4_12:
	ldx	#mos16lo(.L.str.8)
	stx	__rc28
	ldx	#mos16hi(.L.str.8)
	stx	__rc29
	stz	__rc26
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#2
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	__rc23
	lda	__rc22
	jsr	cputhex
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_20
.LBB4_13:                               ;   in Loop: Header=BB4_20 Depth=1
	cmp	#96
	bcc	.LBB4_15
; %bb.14:                               ;   in Loop: Header=BB4_20 Depth=1
	clc
	adc	#160
	bra	.LBB4_17
.LBB4_15:                               ;   in Loop: Header=BB4_20 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB4_17
; %bb.16:                               ;   in Loop: Header=BB4_20 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB4_17:                               ;   in Loop: Header=BB4_20 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_19
; %bb.18:                               ;   in Loop: Header=BB4_20 Depth=1
	inc	__rc3
.LBB4_19:                               ;   in Loop: Header=BB4_20 Depth=1
	tax
	beq	.LBB4_24
.LBB4_20:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc28)
	inc	__rc28
	bne	.LBB4_22
; %bb.21:                               ;   in Loop: Header=BB4_20 Depth=1
	inc	__rc29
.LBB4_22:                               ;   in Loop: Header=BB4_20 Depth=1
	cmp	#192
	bcc	.LBB4_13
; %bb.23:                               ;   in Loop: Header=BB4_20 Depth=1
	eor	#128
	bra	.LBB4_17
.LBB4_24:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
.LBB4_25:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_25
; %bb.26:
	stz	54800
	ldx	__rc24
	lda	__rc25
	jsr	ReadSector
	cmp	#2
	bcc	.LBB4_27
; %bb.79:
	jmp	.LBB4_78
.LBB4_27:
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc26
	stz	mos8(ptrMiniOffs)
	ldx	#108
	stx	mos8(ptrMiniOffs+1)
	ldx	#253
	stx	mos8(ptrMiniOffs+2)
	ldx	#15
	stx	mos8(ptrMiniOffs+3)
	stz	__rc27
	ldx	#mos16lo(.L.str.9)
	stx	__rc2
	ldx	#mos16hi(.L.str.9)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc25
	jsr	mprintf
	ldx	#mos16lo(.L.str.10)
	stx	__rc2
	ldx	#mos16hi(.L.str.10)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc24
	jsr	mprintf
	jsr	cputln
	stz	__rc27
	stz	__rc28
.LBB4_28:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_36 Depth 2
	ldx	mos8(ptrMiniOffs+2)
	stx	__rc2
	clc
	ldx	mos8(ptrMiniOffs+3)
	lda	__rc27
	adc	mos8(ptrMiniOffs)
	tay
	lda	__rc28
	adc	mos8(ptrMiniOffs+1)
	sta	__rc4
	lda	__rc2
	adc	#0
	sta	__rc2
	txa
	adc	#0
	ldx	#mos16lo(.L.str.1)
	stx	__rc30
	ldx	#mos16hi(.L.str.1)
	stx	__rc31
	sta	__rc3
	ldx	__rc4
	tya
	jsr	lpeek
	tax
	lda	__rc22
	clc
	adc	__rc27
	sta	__rc2
	lda	__rc23
	adc	__rc28
	sta	__rc3
	txa
	stx	__rc29
	sta	(__rc2)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_36
.LBB4_29:                               ;   in Loop: Header=BB4_36 Depth=2
	cmp	#96
	bcc	.LBB4_31
; %bb.30:                               ;   in Loop: Header=BB4_36 Depth=2
	clc
	adc	#160
	bra	.LBB4_33
.LBB4_31:                               ;   in Loop: Header=BB4_36 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB4_33
; %bb.32:                               ;   in Loop: Header=BB4_36 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB4_33:                               ;   in Loop: Header=BB4_36 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_35
; %bb.34:                               ;   in Loop: Header=BB4_36 Depth=2
	inc	__rc3
.LBB4_35:                               ;   in Loop: Header=BB4_36 Depth=2
	tax
	beq	.LBB4_40
.LBB4_36:                               ;   Parent Loop BB4_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc30)
	inc	__rc30
	bne	.LBB4_38
; %bb.37:                               ;   in Loop: Header=BB4_36 Depth=2
	inc	__rc31
.LBB4_38:                               ;   in Loop: Header=BB4_36 Depth=2
	cmp	#192
	bcc	.LBB4_29
; %bb.39:                               ;   in Loop: Header=BB4_36 Depth=2
	eor	#128
	bra	.LBB4_33
.LBB4_40:                               ;   in Loop: Header=BB4_28 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc2
	stz	__rc3
	ldx	#2
	stx	__rc4
	ldx	#0
	lda	__rc29
	jsr	cputhex
	ldy	__rc28
	ldx	__rc27
	inx
	bne	.LBB4_42
; %bb.41:                               ;   in Loop: Header=BB4_28 Depth=1
	iny
.LBB4_42:                               ;   in Loop: Header=BB4_28 Depth=1
	stx	__rc27
	sty	__rc28
	cpy	#1
	beq	.LBB4_43
; %bb.81:                               ;   in Loop: Header=BB4_28 Depth=1
	jmp	.LBB4_28
.LBB4_43:                               ;   in Loop: Header=BB4_28 Depth=1
	stx	__rc27
	sty	__rc28
	txa
	beq	.LBB4_44
; %bb.83:                               ;   in Loop: Header=BB4_28 Depth=1
	jmp	.LBB4_28
.LBB4_44:
	jsr	cputln
.LBB4_45:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_45
; %bb.46:
	stz	__rc26
	stz	54800
	stz	mos8(ptrMiniOffs)
	ldx	#109
	stx	mos8(ptrMiniOffs+1)
	ldx	#253
	stx	mos8(ptrMiniOffs+2)
	ldx	#15
	stx	mos8(ptrMiniOffs+3)
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	stz	__rc27
	ldx	#mos16lo(.L.str.11)
	stx	__rc2
	ldx	#mos16hi(.L.str.11)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc25
	jsr	mprintf
	ldx	#mos16lo(.L.str.10)
	stx	__rc2
	ldx	#mos16hi(.L.str.10)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc24
	jsr	mprintf
	jsr	cputln
	stz	__rc24
	stz	__rc25
.LBB4_47:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_55 Depth 2
	ldx	mos8(ptrMiniOffs+2)
	stx	__rc2
	clc
	ldx	mos8(ptrMiniOffs+3)
	lda	__rc24
	adc	mos8(ptrMiniOffs)
	tay
	lda	__rc25
	adc	mos8(ptrMiniOffs+1)
	sta	__rc4
	lda	__rc2
	adc	#0
	sta	__rc2
	txa
	adc	#0
	ldx	#mos16lo(.L.str.1)
	stx	__rc28
	ldx	#mos16hi(.L.str.1)
	stx	__rc29
	sta	__rc3
	ldx	__rc4
	tya
	jsr	lpeek
	tax
	lda	__rc22
	clc
	adc	__rc24
	tay
	lda	__rc23
	adc	__rc25
	sta	__rc3
	sty	__rc2
	clc
	tya
	adc	#0
	sta	__rc4
	lda	__rc3
	adc	#1
	sta	__rc5
	txa
	sta	(__rc4)
	lda	(__rc2)
	sta	__rc27
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_55
.LBB4_48:                               ;   in Loop: Header=BB4_55 Depth=2
	cmp	#96
	bcc	.LBB4_50
; %bb.49:                               ;   in Loop: Header=BB4_55 Depth=2
	clc
	adc	#160
	bra	.LBB4_52
.LBB4_50:                               ;   in Loop: Header=BB4_55 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB4_52
; %bb.51:                               ;   in Loop: Header=BB4_55 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB4_52:                               ;   in Loop: Header=BB4_55 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_54
; %bb.53:                               ;   in Loop: Header=BB4_55 Depth=2
	inc	__rc3
.LBB4_54:                               ;   in Loop: Header=BB4_55 Depth=2
	tax
	beq	.LBB4_59
.LBB4_55:                               ;   Parent Loop BB4_47 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc28)
	inc	__rc28
	bne	.LBB4_57
; %bb.56:                               ;   in Loop: Header=BB4_55 Depth=2
	inc	__rc29
.LBB4_57:                               ;   in Loop: Header=BB4_55 Depth=2
	cmp	#192
	bcc	.LBB4_48
; %bb.58:                               ;   in Loop: Header=BB4_55 Depth=2
	eor	#128
	bra	.LBB4_52
.LBB4_59:                               ;   in Loop: Header=BB4_47 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc2
	stz	__rc3
	ldx	#2
	stx	__rc4
	ldx	#0
	lda	__rc27
	jsr	cputhex
	ldx	__rc24
	ldy	__rc25
	inx
	bne	.LBB4_61
; %bb.60:                               ;   in Loop: Header=BB4_47 Depth=1
	iny
.LBB4_61:                               ;   in Loop: Header=BB4_47 Depth=1
	stx	__rc24
	sty	__rc25
	cpy	#1
	beq	.LBB4_62
; %bb.85:                               ;   in Loop: Header=BB4_47 Depth=1
	jmp	.LBB4_47
.LBB4_62:                               ;   in Loop: Header=BB4_47 Depth=1
	stx	__rc24
	sty	__rc25
	txa
	beq	.LBB4_63
; %bb.87:                               ;   in Loop: Header=BB4_47 Depth=1
	jmp	.LBB4_47
.LBB4_63:
	jsr	cputln
.LBB4_64:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_64
; %bb.65:
	ldx	#mos16lo(.L.str.12)
	stx	__rc22
	ldx	#mos16hi(.L.str.12)
	stx	__rc23
	stz	54800
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_73
.LBB4_66:                               ;   in Loop: Header=BB4_73 Depth=1
	cmp	#96
	bcc	.LBB4_68
; %bb.67:                               ;   in Loop: Header=BB4_73 Depth=1
	clc
	adc	#160
	bra	.LBB4_70
.LBB4_68:                               ;   in Loop: Header=BB4_73 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB4_70
; %bb.69:                               ;   in Loop: Header=BB4_73 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB4_70:                               ;   in Loop: Header=BB4_73 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_72
; %bb.71:                               ;   in Loop: Header=BB4_73 Depth=1
	inc	__rc3
.LBB4_72:                               ;   in Loop: Header=BB4_73 Depth=1
	tax
	beq	.LBB4_77
.LBB4_73:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB4_75
; %bb.74:                               ;   in Loop: Header=BB4_73 Depth=1
	inc	__rc23
.LBB4_75:                               ;   in Loop: Header=BB4_73 Depth=1
	cmp	#192
	bcc	.LBB4_66
; %bb.76:                               ;   in Loop: Header=BB4_73 Depth=1
	eor	#128
	bra	.LBB4_70
.LBB4_77:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
.LBB4_78:
	sta	__rc16
	ldy	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc31
	iny
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
	adc	#9
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.Lfunc_end4:
	.size	GetWholeSector, .Lfunc_end4-GetWholeSector
                                        ; -- End function
	.section	.text.PutWholeSector,"ax",@progbits
	.type	PutWholeSector,@function        ; -- Begin function PutWholeSector
PutWholeSector:                         ; @PutWholeSector
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#247
	sta	__rc0
	lda	__rc1
	adc	#255
	sta	__rc1
	pla
	ldy	__rc20
	phy
	ldy	__rc21
	phy
	ldy	__rc22
	phy
	ldy	__rc23
	phy
	pha
	lda	__rc24
	ldy	#7
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
	lda	__rc31
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stx	__rc26
	cmp	#2
	bcc	.LBB5_1
; %bb.60:
	jmp	.LBB5_57
.LBB5_1:
	sta	__rc27
	ldx	__rc4
	stx	__rc28
	ldx	__rc2
	stx	__rc24
	ldx	__rc3
	stx	__rc25
	ldx	#52
	stx	__rc22
	ldx	#3
	stx	__rc23
	ldx	__rc4
	lda	__rc26
	jsr	ReadSector
	lda	__rc27
	bne	.LBB5_2
; %bb.62:
	jmp	.LBB5_19
.LBB5_2:
	stz	__rc21
	stz	mos8(ptrMiniOffs)
	ldx	#109
	stx	mos8(ptrMiniOffs+1)
	ldx	#253
	stx	mos8(ptrMiniOffs+2)
	ldx	#15
	stx	mos8(ptrMiniOffs+3)
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	stz	__rc20
	ldx	#mos16lo(.L.str.14)
	stx	__rc2
	ldx	#mos16hi(.L.str.14)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc26
	jsr	mprintf
	ldx	#mos16lo(.L.str.10)
	stx	__rc2
	ldx	#mos16hi(.L.str.10)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc28
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	mprintf
	jsr	cputln
	stz	__rc20
	ldx	#0
.LBB5_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_11 Depth 2
	lda	__rc20
	clc
	adc	__rc24
	sta	__rc28
	stx	__rc31
	txa
	adc	__rc25
	ldx	#mos16lo(.L.str.1)
	stx	__rc2
	ldx	#mos16hi(.L.str.1)
	stx	__rc3
	sta	__rc29
	lda	(__rc28)
	sta	__rc30
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB5_11
.LBB5_4:                                ;   in Loop: Header=BB5_11 Depth=2
	cmp	#96
	bcc	.LBB5_6
; %bb.5:                                ;   in Loop: Header=BB5_11 Depth=2
	clc
	adc	#160
	bra	.LBB5_8
.LBB5_6:                                ;   in Loop: Header=BB5_11 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB5_8
; %bb.7:                                ;   in Loop: Header=BB5_11 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB5_8:                                ;   in Loop: Header=BB5_11 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_10
; %bb.9:                                ;   in Loop: Header=BB5_11 Depth=2
	inc	__rc5
.LBB5_10:                               ;   in Loop: Header=BB5_11 Depth=2
	tax
	beq	.LBB5_15
.LBB5_11:                               ;   Parent Loop BB5_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_13
; %bb.12:                               ;   in Loop: Header=BB5_11 Depth=2
	inc	__rc3
.LBB5_13:                               ;   in Loop: Header=BB5_11 Depth=2
	cmp	#192
	bcc	.LBB5_4
; %bb.14:                               ;   in Loop: Header=BB5_11 Depth=2
	eor	#128
	bra	.LBB5_8
.LBB5_15:                               ;   in Loop: Header=BB5_3 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc2
	stz	__rc3
	ldx	#2
	stx	__rc4
	ldx	#0
	lda	__rc30
	jsr	cputhex
	ldx	mos8(ptrMiniOffs+2)
	stx	__rc2
	clc
	ldx	mos8(ptrMiniOffs+3)
	lda	__rc20
	adc	mos8(ptrMiniOffs)
	tay
	lda	__rc31
	adc	mos8(ptrMiniOffs+1)
	sta	__rc5
	lda	__rc2
	adc	#0
	sta	__rc2
	txa
	adc	#0
	sta	__rc3
	lda	(__rc28)
	sta	__rc4
	ldx	__rc5
	tya
	jsr	lpoke
	ldx	__rc31
	inc	__rc20
	bne	.LBB5_17
; %bb.16:                               ;   in Loop: Header=BB5_3 Depth=1
	inx
.LBB5_17:                               ;   in Loop: Header=BB5_3 Depth=1
	cpx	#1
	beq	.LBB5_18
; %bb.64:                               ;   in Loop: Header=BB5_3 Depth=1
	jmp	.LBB5_3
.LBB5_18:                               ;   in Loop: Header=BB5_3 Depth=1
	lda	__rc20
	beq	.LBB5_58
; %bb.66:                               ;   in Loop: Header=BB5_3 Depth=1
	jmp	.LBB5_3
.LBB5_58:
	jmp	.LBB5_38
.LBB5_19:
	stz	mos8(ptrMiniOffs)
	ldx	#108
	stx	mos8(ptrMiniOffs+1)
	ldx	#253
	stx	mos8(ptrMiniOffs+2)
	ldx	#15
	stx	mos8(ptrMiniOffs+3)
	stz	__rc21
	ldx	#mos16lo(.L.str.13)
	stx	__rc2
	ldx	#mos16hi(.L.str.13)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc26
	jsr	mprintf
	ldx	#mos16lo(.L.str.10)
	stx	__rc2
	ldx	#mos16hi(.L.str.10)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc28
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	mprintf
	jsr	cputln
.LBB5_20:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB5_20
; %bb.21:
	stz	__rc21
	stz	54800
	stz	__rc20
	ldx	#0
.LBB5_22:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_30 Depth 2
	lda	__rc20
	clc
	adc	__rc24
	sta	__rc28
	stx	__rc31
	txa
	adc	__rc25
	ldx	#mos16lo(.L.str.1)
	stx	__rc2
	ldx	#mos16hi(.L.str.1)
	stx	__rc3
	sta	__rc29
	lda	(__rc28)
	sta	__rc30
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB5_30
.LBB5_23:                               ;   in Loop: Header=BB5_30 Depth=2
	cmp	#96
	bcc	.LBB5_25
; %bb.24:                               ;   in Loop: Header=BB5_30 Depth=2
	clc
	adc	#160
	bra	.LBB5_27
.LBB5_25:                               ;   in Loop: Header=BB5_30 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB5_27
; %bb.26:                               ;   in Loop: Header=BB5_30 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB5_27:                               ;   in Loop: Header=BB5_30 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_29
; %bb.28:                               ;   in Loop: Header=BB5_30 Depth=2
	inc	__rc5
.LBB5_29:                               ;   in Loop: Header=BB5_30 Depth=2
	tax
	beq	.LBB5_34
.LBB5_30:                               ;   Parent Loop BB5_22 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_32
; %bb.31:                               ;   in Loop: Header=BB5_30 Depth=2
	inc	__rc3
.LBB5_32:                               ;   in Loop: Header=BB5_30 Depth=2
	cmp	#192
	bcc	.LBB5_23
; %bb.33:                               ;   in Loop: Header=BB5_30 Depth=2
	eor	#128
	bra	.LBB5_27
.LBB5_34:                               ;   in Loop: Header=BB5_22 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc2
	stz	__rc3
	ldx	#2
	stx	__rc4
	ldx	#0
	lda	__rc30
	jsr	cputhex
	ldx	mos8(ptrMiniOffs+2)
	stx	__rc2
	clc
	ldx	mos8(ptrMiniOffs+3)
	lda	__rc20
	adc	mos8(ptrMiniOffs)
	tay
	lda	__rc31
	adc	mos8(ptrMiniOffs+1)
	sta	__rc5
	lda	__rc2
	adc	#0
	sta	__rc2
	txa
	adc	#0
	sta	__rc3
	lda	(__rc28)
	sta	__rc4
	ldx	__rc5
	tya
	jsr	lpoke
	ldx	__rc31
	inc	__rc20
	bne	.LBB5_36
; %bb.35:                               ;   in Loop: Header=BB5_22 Depth=1
	inx
.LBB5_36:                               ;   in Loop: Header=BB5_22 Depth=1
	cpx	#1
	beq	.LBB5_37
; %bb.68:                               ;   in Loop: Header=BB5_22 Depth=1
	jmp	.LBB5_22
.LBB5_37:                               ;   in Loop: Header=BB5_22 Depth=1
	lda	__rc20
	beq	.LBB5_38
; %bb.70:                               ;   in Loop: Header=BB5_22 Depth=1
	jmp	.LBB5_22
.LBB5_38:
	jsr	cputln
.LBB5_39:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB5_39
; %bb.40:
	ldx	#mos16lo(.L.str.15)
	stx	__rc20
	ldx	#mos16hi(.L.str.15)
	stx	__rc21
	stz	54800
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB5_48
.LBB5_41:                               ;   in Loop: Header=BB5_48 Depth=1
	cmp	#96
	bcc	.LBB5_43
; %bb.42:                               ;   in Loop: Header=BB5_48 Depth=1
	clc
	adc	#160
	bra	.LBB5_45
.LBB5_43:                               ;   in Loop: Header=BB5_48 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB5_45
; %bb.44:                               ;   in Loop: Header=BB5_48 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB5_45:                               ;   in Loop: Header=BB5_48 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_47
; %bb.46:                               ;   in Loop: Header=BB5_48 Depth=1
	inc	__rc3
.LBB5_47:                               ;   in Loop: Header=BB5_48 Depth=1
	tax
	beq	.LBB5_52
.LBB5_48:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc20)
	inc	__rc20
	bne	.LBB5_50
; %bb.49:                               ;   in Loop: Header=BB5_48 Depth=1
	inc	__rc21
.LBB5_50:                               ;   in Loop: Header=BB5_48 Depth=1
	cmp	#192
	bcc	.LBB5_41
; %bb.51:                               ;   in Loop: Header=BB5_48 Depth=1
	eor	#128
	bra	.LBB5_45
.LBB5_52:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
.LBB5_53:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB5_53
; %bb.54:
	ldx	#97
	stz	54800
	sec
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sbc	__rc27
	cmp	#20
	bcc	.LBB5_56
; %bb.55:
	ldx	#105
.LBB5_56:
	tay
	txa
	ldx	__rc26
	;APP
	sta	53376
	lda	#32
	sta	53377
	dex
	stx	53380
	tya
	lsr
	tax
	inx
	stx	53381
	lda	#0
	sta	53382
	adc	#0
	sta	flagCurrSec
	lda	#132
	sta	53377
wait031:
	lda	53378
	bmi	wait031
	lda	53378
	and	#24
	beq	succeed031
	lda	#64
	sta	53376
	sec
	jmp	endsub031
succeed031:
	lda	#128
	trb	54921
	clc
endsub031:
	bcs	err031
	lda	#0
	jmp	end031
err031:
	lda	#255
end031:
	sta	__rc2

	;NO_APP
.LBB5_57:
	ldy	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc31
	iny
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
	adc	#9
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end5:
	.size	PutWholeSector, .Lfunc_end5-PutWholeSector
                                        ; -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            ; -- Begin function main
	.type	main,@function
main:                                   ; @main
; %bb.0:
	clc
	lda	__rc0
	adc	#248
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
	ldy	#7
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
	lda	__rc31
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#40
	ldy	#71
	sty	53295
	ldy	#83
	sty	53295
	lda	53341
	and	#127
	sta	53341
	stz	53352
	ldy	#216
	sty	53353
	ldy	#2
	sty	53354
	ldy	53297
	bpl	.LBB6_2
; %bb.1:
	ldx	#80
.LBB6_2:
	ldy	#mos8(dmalist)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	stx	mos8(g_curScreenW)
	lda	53297
	and	#8
	beq	.LBB6_4
; %bb.3:
	ldx	#50
	bra	.LBB6_5
.LBB6_4:
	ldx	#25
.LBB6_5:
	stx	mos8(g_curScreenH)
	bra	.LBB6_7
.LBB6_6:                                ;   in Loop: Header=BB6_7 Depth=1
	stz	54800
.LBB6_7:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB6_6
; %bb.8:
	ldx	#52
	stx	__rc20
	ldx	#3
	stx	__rc21
	ldx	#0
	stx	__rc24
	ldx	#27
	stx	__rc25
	ldx	#65
	stx	__rc22
	ldx	#27
	stx	__rc23
	ldx	__rc2
	stx	__rc31
	ldx	#255
	ldy	#mos16lo(escapeCode)
	sty	__rc2
	ldy	#mos16hi(escapeCode)
	sty	__rc3
	ldy	#1
.LBB6_9:                                ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB6_11
; %bb.10:                               ;   in Loop: Header=BB6_9 Depth=1
	inc	__rc5
.LBB6_11:                               ;   in Loop: Header=BB6_9 Depth=1
	lda	#mos16hi(escNOP)
	sta	(__rc4),y
	dex
	bne	.LBB6_9
; %bb.12:
	stz	53352
	ldx	#208
	stx	53353
	ldx	#2
	stx	53354
	lda	53272
	eor	#2
	sta	53272
	bra	.LBB6_14
.LBB6_13:                               ;   in Loop: Header=BB6_14 Depth=1
	stz	54800
.LBB6_14:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB6_13
; %bb.15:
	lda	#191
	and	53297
	sta	53297
	lda	#191
	and	53332
	sta	53332
	ldx	#mos16lo(.L.str.48)
	stx	__rc2
	ldx	#mos16hi(.L.str.48)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB6_23
.LBB6_16:                               ;   in Loop: Header=BB6_23 Depth=1
	cmp	#96
	bcc	.LBB6_18
; %bb.17:                               ;   in Loop: Header=BB6_23 Depth=1
	clc
	adc	#160
	bra	.LBB6_20
.LBB6_18:                               ;   in Loop: Header=BB6_23 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_20
; %bb.19:                               ;   in Loop: Header=BB6_23 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_20:                               ;   in Loop: Header=BB6_23 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB6_22
; %bb.21:                               ;   in Loop: Header=BB6_23 Depth=1
	inc	__rc5
.LBB6_22:                               ;   in Loop: Header=BB6_23 Depth=1
	tax
	beq	.LBB6_27
.LBB6_23:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB6_25
; %bb.24:                               ;   in Loop: Header=BB6_23 Depth=1
	inc	__rc3
.LBB6_25:                               ;   in Loop: Header=BB6_23 Depth=1
	cmp	#192
	bcc	.LBB6_16
; %bb.26:                               ;   in Loop: Header=BB6_23 Depth=1
	eor	#128
	bra	.LBB6_20
.LBB6_27:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB6_28:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB6_28
; %bb.29:
	ldx	#mos16lo(.L.str.49)
	stx	__rc28
	ldx	#mos16hi(.L.str.49)
	stx	__rc29
	stz	__rc26
	stz	54800
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	stz	53280
	ldx	#6
	stx	53281
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#27
	stx	mos8(fnamehi)
	ldx	#0
	stx	__rc2
	ldx	#27
	stx	__rc3
	ldx	#mos16lo(.L.str.50)
	stx	__rc4
	ldx	#mos16hi(.L.str.50)
	stx	__rc5
	lda	#13
	ldx	#0
	jsr	memcpy
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldy	#27
	;APP
	ldx	#0
	lda	#46
	sta	54848
	clv
	bcc	errhypsetnam2
	lda	#0
	sta	__rc30
	jmp	donehypsetnam2
errhypsetnam2:
	lda	#255
	sta	__rc30
donehypsetnam2:
	nop

	;NO_APP
	bra	.LBB6_37
.LBB6_30:                               ;   in Loop: Header=BB6_37 Depth=1
	cmp	#96
	bcc	.LBB6_32
; %bb.31:                               ;   in Loop: Header=BB6_37 Depth=1
	clc
	adc	#160
	bra	.LBB6_34
.LBB6_32:                               ;   in Loop: Header=BB6_37 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_34
; %bb.33:                               ;   in Loop: Header=BB6_37 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_34:                               ;   in Loop: Header=BB6_37 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_36
; %bb.35:                               ;   in Loop: Header=BB6_37 Depth=1
	inc	__rc3
.LBB6_36:                               ;   in Loop: Header=BB6_37 Depth=1
	tax
	beq	.LBB6_41
.LBB6_37:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc28)
	inc	__rc28
	bne	.LBB6_39
; %bb.38:                               ;   in Loop: Header=BB6_37 Depth=1
	inc	__rc29
.LBB6_39:                               ;   in Loop: Header=BB6_37 Depth=1
	cmp	#192
	bcc	.LBB6_30
; %bb.40:                               ;   in Loop: Header=BB6_37 Depth=1
	eor	#128
	bra	.LBB6_34
.LBB6_41:
	ldx	#mos16lo(.L.str.51)
	stx	__rc26
	ldx	#mos16hi(.L.str.51)
	stx	__rc27
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#0
	ldy	#2
	stz	__rc2
	stz	__rc3
	sty	__rc4
	lda	__rc30
	jsr	cputhex
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_49
.LBB6_42:                               ;   in Loop: Header=BB6_49 Depth=1
	cmp	#96
	bcc	.LBB6_44
; %bb.43:                               ;   in Loop: Header=BB6_49 Depth=1
	clc
	adc	#160
	bra	.LBB6_46
.LBB6_44:                               ;   in Loop: Header=BB6_49 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_46
; %bb.45:                               ;   in Loop: Header=BB6_49 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_46:                               ;   in Loop: Header=BB6_49 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_48
; %bb.47:                               ;   in Loop: Header=BB6_49 Depth=1
	inc	__rc3
.LBB6_48:                               ;   in Loop: Header=BB6_49 Depth=1
	tax
	beq	.LBB6_53
.LBB6_49:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc26)
	inc	__rc26
	bne	.LBB6_51
; %bb.50:                               ;   in Loop: Header=BB6_49 Depth=1
	inc	__rc27
.LBB6_51:                               ;   in Loop: Header=BB6_49 Depth=1
	cmp	#192
	bcc	.LBB6_42
; %bb.52:                               ;   in Loop: Header=BB6_49 Depth=1
	eor	#128
	bra	.LBB6_46
.LBB6_53:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#0
	stx	__rc2
	ldx	#27
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB6_61
.LBB6_54:                               ;   in Loop: Header=BB6_61 Depth=1
	cmp	#96
	bcc	.LBB6_56
; %bb.55:                               ;   in Loop: Header=BB6_61 Depth=1
	clc
	adc	#160
	bra	.LBB6_58
.LBB6_56:                               ;   in Loop: Header=BB6_61 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_58
; %bb.57:                               ;   in Loop: Header=BB6_61 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_58:                               ;   in Loop: Header=BB6_61 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB6_60
; %bb.59:                               ;   in Loop: Header=BB6_61 Depth=1
	inc	__rc5
.LBB6_60:                               ;   in Loop: Header=BB6_61 Depth=1
	tax
	beq	.LBB6_65
.LBB6_61:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB6_63
; %bb.62:                               ;   in Loop: Header=BB6_61 Depth=1
	inc	__rc3
.LBB6_63:                               ;   in Loop: Header=BB6_61 Depth=1
	cmp	#192
	bcc	.LBB6_54
; %bb.64:                               ;   in Loop: Header=BB6_61 Depth=1
	eor	#128
	bra	.LBB6_58
.LBB6_65:
	ldx	#mos16lo(.L.str.53)
	stx	__rc26
	ldx	#mos16hi(.L.str.53)
	stx	__rc27
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#27
	stx	mos8(fnamehi)
	ldx	#0
	stx	__rc2
	ldx	#27
	stx	__rc3
	ldx	#mos16lo(.L.str.52)
	stx	__rc4
	ldx	#mos16hi(.L.str.52)
	stx	__rc5
	lda	#13
	ldx	#0
	jsr	memcpy
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldy	#27
	;APP
	ldx	#0
	lda	#46
	sta	54848
	clv
	bcc	errhypsetnam3
	lda	#0
	sta	__rc4
	jmp	donehypsetnam3
errhypsetnam3:
	lda	#255
	sta	__rc4
donehypsetnam3:
	nop

	;NO_APP
	;APP
	ldx	#0
	lda	#70
	sta	54848
	clv
	bcc	errhyp1att4
	lda	#0
	sta	__rc25
	jmp	donehyp1att4
errhyp1att4:
	lda	#255
	sta	__rc25
donehyp1att4:
	nop

	;NO_APP
	bra	.LBB6_73
.LBB6_66:                               ;   in Loop: Header=BB6_73 Depth=1
	cmp	#96
	bcc	.LBB6_68
; %bb.67:                               ;   in Loop: Header=BB6_73 Depth=1
	clc
	adc	#160
	bra	.LBB6_70
.LBB6_68:                               ;   in Loop: Header=BB6_73 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_70
; %bb.69:                               ;   in Loop: Header=BB6_73 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_70:                               ;   in Loop: Header=BB6_73 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_72
; %bb.71:                               ;   in Loop: Header=BB6_73 Depth=1
	inc	__rc3
.LBB6_72:                               ;   in Loop: Header=BB6_73 Depth=1
	tax
	beq	.LBB6_77
.LBB6_73:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc26)
	inc	__rc26
	bne	.LBB6_75
; %bb.74:                               ;   in Loop: Header=BB6_73 Depth=1
	inc	__rc27
.LBB6_75:                               ;   in Loop: Header=BB6_73 Depth=1
	cmp	#192
	bcc	.LBB6_66
; %bb.76:                               ;   in Loop: Header=BB6_73 Depth=1
	eor	#128
	bra	.LBB6_70
.LBB6_77:
	ldx	#mos16lo(.L.str.56)
	stx	__rc26
	ldx	#mos16hi(.L.str.56)
	stx	__rc27
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc24
	ldx	#2
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	#0
	lda	__rc25
	jsr	cputhex
	jsr	cputln
	ldx	#9
	;APP
	lda	#6
	sta	54848
	clv
	bcc	errseldrv5
	stx	__rc25
	jmp	doneseldrv5
errseldrv5:
	lda	#255
	sta	__rc25
doneseldrv5:
	nop

	;NO_APP
	lda	#9
	ldx	#mos16lo(.L.str.54)
	stx	__rc2
	ldx	#mos16hi(.L.str.54)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	ldx	#mos16lo(.L.str.55)
	stx	__rc2
	ldx	#mos16hi(.L.str.55)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc25
	jsr	mprintf
	jsr	cputln
	;APP
	ldx	#0
	lda	#4
	sta	54848
	clv
	bcc	errgetcurdrv6
	sta	__rc24
	jmp	donegetcurdrv6
errgetcurdrv6:
	lda	#255
	sta	__rc24
donegetcurdrv6:
	nop
	;NO_APP
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_85
.LBB6_78:                               ;   in Loop: Header=BB6_85 Depth=1
	cmp	#96
	bcc	.LBB6_80
; %bb.79:                               ;   in Loop: Header=BB6_85 Depth=1
	clc
	adc	#160
	bra	.LBB6_82
.LBB6_80:                               ;   in Loop: Header=BB6_85 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_82
; %bb.81:                               ;   in Loop: Header=BB6_85 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_82:                               ;   in Loop: Header=BB6_85 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_84
; %bb.83:                               ;   in Loop: Header=BB6_85 Depth=1
	inc	__rc3
.LBB6_84:                               ;   in Loop: Header=BB6_85 Depth=1
	tax
	beq	.LBB6_89
.LBB6_85:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc26)
	inc	__rc26
	bne	.LBB6_87
; %bb.86:                               ;   in Loop: Header=BB6_85 Depth=1
	inc	__rc27
.LBB6_87:                               ;   in Loop: Header=BB6_85 Depth=1
	cmp	#192
	bcc	.LBB6_78
; %bb.88:                               ;   in Loop: Header=BB6_85 Depth=1
	eor	#128
	bra	.LBB6_82
.LBB6_89:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#0
	ldy	#2
	stz	__rc2
	stz	__rc3
	sty	__rc4
	lda	__rc24
	jsr	cputhex
	jsr	cputln
	ldx	__rc24
	cpx	#255
	bne	.LBB6_90
; %bb.410:
	jmp	.LBB6_170
.LBB6_90:
	ldx	#mos16lo(.L.str.57)
	stx	__rc2
	ldx	#mos16hi(.L.str.57)
	stx	__rc3
	;APP
	ldx	#0
	lda	#18
	sta	54848
	clv
	bcc	errhypopendir7
	sta	__rc25
	jmp	donehypopendir7
errhypopendir7:
	lda	#255
	sta	__rc25
donehypopendir7:
	nop

	;NO_APP
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB6_98
.LBB6_91:                               ;   in Loop: Header=BB6_98 Depth=1
	cmp	#96
	bcc	.LBB6_93
; %bb.92:                               ;   in Loop: Header=BB6_98 Depth=1
	clc
	adc	#160
	bra	.LBB6_95
.LBB6_93:                               ;   in Loop: Header=BB6_98 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_95
; %bb.94:                               ;   in Loop: Header=BB6_98 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_95:                               ;   in Loop: Header=BB6_98 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB6_97
; %bb.96:                               ;   in Loop: Header=BB6_98 Depth=1
	inc	__rc5
.LBB6_97:                               ;   in Loop: Header=BB6_98 Depth=1
	tax
	beq	.LBB6_102
.LBB6_98:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB6_100
; %bb.99:                               ;   in Loop: Header=BB6_98 Depth=1
	inc	__rc3
.LBB6_100:                              ;   in Loop: Header=BB6_98 Depth=1
	cmp	#192
	bcc	.LBB6_91
; %bb.101:                              ;   in Loop: Header=BB6_98 Depth=1
	eor	#128
	bra	.LBB6_95
.LBB6_102:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#0
	ldy	#2
	stz	__rc2
	stz	__rc3
	sty	__rc4
	lda	__rc25
	jsr	cputhex
	jsr	cputln
	ldy	__rc25
	cpy	#132
	bne	.LBB6_103
; %bb.412:
	jmp	.LBB6_170
.LBB6_103:
	cpy	#135
	bne	.LBB6_104
; %bb.414:
	jmp	.LBB6_170
.LBB6_104:
	cpy	#255
	bne	.LBB6_105
; %bb.416:
	jmp	.LBB6_170
.LBB6_105:
	stz	__rc24
; %bb.400:
	jmp	.LBB6_154
.LBB6_106:                              ;   in Loop: Header=BB6_113 Depth=2
	cmp	#96
	bcc	.LBB6_108
; %bb.107:                              ;   in Loop: Header=BB6_113 Depth=2
	clc
	adc	#160
	bra	.LBB6_110
.LBB6_108:                              ;   in Loop: Header=BB6_113 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_110
; %bb.109:                              ;   in Loop: Header=BB6_113 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_110:                              ;   in Loop: Header=BB6_113 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB6_112
; %bb.111:                              ;   in Loop: Header=BB6_113 Depth=2
	inc	__rc5
.LBB6_112:                              ;   in Loop: Header=BB6_113 Depth=2
	tax
	beq	.LBB6_117
.LBB6_113:                              ;   Parent Loop BB6_154 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB6_115
; %bb.114:                              ;   in Loop: Header=BB6_113 Depth=2
	inc	__rc3
.LBB6_115:                              ;   in Loop: Header=BB6_113 Depth=2
	cmp	#192
	bcc	.LBB6_106
; %bb.116:                              ;   in Loop: Header=BB6_113 Depth=2
	eor	#128
	bra	.LBB6_110
.LBB6_117:                              ;   in Loop: Header=BB6_154 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc2
	stz	__rc3
	ldx	#2
	stx	__rc4
	ldx	#0
	lda	__rc26
	jsr	cputhex
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	ldx	__rc26
	cpx	#133
	bne	.LBB6_118
; %bb.418:
	jmp	.LBB6_155
.LBB6_118:                              ;   in Loop: Header=BB6_154 Depth=1
	cpx	#255
	bne	.LBB6_119
; %bb.420:
	jmp	.LBB6_155
.LBB6_119:                              ;   in Loop: Header=BB6_154 Depth=1
	ldy	#0
	ldx	#0
.LBB6_120:                              ;   Parent Loop BB6_154 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	6721,y
	cmp	#32
	beq	.LBB6_124
; %bb.121:                              ;   in Loop: Header=BB6_120 Depth=2
	cmp	#33
	bcc	.LBB6_123
; %bb.122:                              ;   in Loop: Header=BB6_120 Depth=2
	sta	6977,x
	inx
.LBB6_123:                              ;   in Loop: Header=BB6_120 Depth=2
	iny
	cpy	#8
	bne	.LBB6_120
.LBB6_124:                              ;   in Loop: Header=BB6_154 Depth=1
	ldy	#0
	lda	#46
	sta	6977,x
	inx
.LBB6_125:                              ;   Parent Loop BB6_154 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	6729,y
	cmp	#32
	beq	.LBB6_129
; %bb.126:                              ;   in Loop: Header=BB6_125 Depth=2
	cmp	#33
	bcc	.LBB6_128
; %bb.127:                              ;   in Loop: Header=BB6_125 Depth=2
	sta	6977,x
	inx
.LBB6_128:                              ;   in Loop: Header=BB6_125 Depth=2
	iny
	cpy	#3
	bne	.LBB6_125
.LBB6_129:                              ;   in Loop: Header=BB6_154 Depth=1
	ldy	#mos16lo(.L.str.59)
	sty	__rc2
	ldy	#mos16hi(.L.str.59)
	sty	__rc3
	stz	6977,x
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB6_137
.LBB6_130:                              ;   in Loop: Header=BB6_137 Depth=2
	cmp	#96
	bcc	.LBB6_132
; %bb.131:                              ;   in Loop: Header=BB6_137 Depth=2
	clc
	adc	#160
	bra	.LBB6_134
.LBB6_132:                              ;   in Loop: Header=BB6_137 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_134
; %bb.133:                              ;   in Loop: Header=BB6_137 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_134:                              ;   in Loop: Header=BB6_137 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB6_136
; %bb.135:                              ;   in Loop: Header=BB6_137 Depth=2
	inc	__rc5
.LBB6_136:                              ;   in Loop: Header=BB6_137 Depth=2
	tax
	beq	.LBB6_141
.LBB6_137:                              ;   Parent Loop BB6_154 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB6_139
; %bb.138:                              ;   in Loop: Header=BB6_137 Depth=2
	inc	__rc3
.LBB6_139:                              ;   in Loop: Header=BB6_137 Depth=2
	cmp	#192
	bcc	.LBB6_130
; %bb.140:                              ;   in Loop: Header=BB6_137 Depth=2
	eor	#128
	bra	.LBB6_134
.LBB6_141:                              ;   in Loop: Header=BB6_154 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#65
	stx	__rc2
	ldx	#27
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB6_149
.LBB6_142:                              ;   in Loop: Header=BB6_149 Depth=2
	cmp	#96
	bcc	.LBB6_144
; %bb.143:                              ;   in Loop: Header=BB6_149 Depth=2
	clc
	adc	#160
	bra	.LBB6_146
.LBB6_144:                              ;   in Loop: Header=BB6_149 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_146
; %bb.145:                              ;   in Loop: Header=BB6_149 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_146:                              ;   in Loop: Header=BB6_149 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB6_148
; %bb.147:                              ;   in Loop: Header=BB6_149 Depth=2
	inc	__rc5
.LBB6_148:                              ;   in Loop: Header=BB6_149 Depth=2
	tax
	beq	.LBB6_153
.LBB6_149:                              ;   Parent Loop BB6_154 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB6_151
; %bb.150:                              ;   in Loop: Header=BB6_149 Depth=2
	inc	__rc3
.LBB6_151:                              ;   in Loop: Header=BB6_149 Depth=2
	cmp	#192
	bcc	.LBB6_142
; %bb.152:                              ;   in Loop: Header=BB6_149 Depth=2
	eor	#128
	bra	.LBB6_146
.LBB6_153:                              ;   in Loop: Header=BB6_154 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	ldx	#65
	stx	__rc2
	ldx	#27
	stx	__rc3
	jsr	strlen
	ldy	#mos16lo(.L.str.60)
	sty	__rc2
	ldy	#mos16hi(.L.str.60)
	sty	__rc3
	stz	__rc4
	stz	__rc5
	jsr	mprintf
	jsr	cputln
	ldy	__rc25
.LBB6_154:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_113 Depth 2
                                        ;     Child Loop BB6_120 Depth 2
                                        ;     Child Loop BB6_125 Depth 2
                                        ;     Child Loop BB6_137 Depth 2
                                        ;     Child Loop BB6_149 Depth 2
	ldx	#mos16lo(.L.str.58)
	stx	__rc2
	ldx	#mos16hi(.L.str.58)
	stx	__rc3
	;APP
	phx
	ldx	#0
	txa
hypreaddirloop8:
	sta	6656,x
	dex
	bne	hypreaddirloop8
	plx
	tya
	tax
	ldy	#mos16hi(6656)
	lda	#20
	sta	54848
	clv
	bcc	errhypreaddir8
	stx	__rc26
	jmp	donehypreaddir8
errhypreaddir8:
	sta	__rc26
donehypreaddir8:
	nop

	;NO_APP
	ldx	6720
	stz	6656,x
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
; %bb.402:                              ;   in Loop: Header=BB6_154 Depth=1
	jmp	.LBB6_113
.LBB6_155:
	ldx	#mos16lo(.L.str.61)
	stx	__rc2
	ldx	#mos16hi(.L.str.61)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	ldx	__rc25
	;APP
	lda	#22
	sta	54848
	clv
	bcc	errhypclosedir9
	stx	__rc22
	jmp	donehypclosedir9
errhypclosedir9:
	sta	__rc22
donehypclosedir9:
	nop

	;NO_APP
	bra	.LBB6_163
.LBB6_156:                              ;   in Loop: Header=BB6_163 Depth=1
	cmp	#96
	bcc	.LBB6_158
; %bb.157:                              ;   in Loop: Header=BB6_163 Depth=1
	clc
	adc	#160
	bra	.LBB6_160
.LBB6_158:                              ;   in Loop: Header=BB6_163 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_160
; %bb.159:                              ;   in Loop: Header=BB6_163 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_160:                              ;   in Loop: Header=BB6_163 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB6_162
; %bb.161:                              ;   in Loop: Header=BB6_163 Depth=1
	inc	__rc5
.LBB6_162:                              ;   in Loop: Header=BB6_163 Depth=1
	tax
	beq	.LBB6_167
.LBB6_163:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB6_165
; %bb.164:                              ;   in Loop: Header=BB6_163 Depth=1
	inc	__rc3
.LBB6_165:                              ;   in Loop: Header=BB6_163 Depth=1
	cmp	#192
	bcc	.LBB6_156
; %bb.166:                              ;   in Loop: Header=BB6_163 Depth=1
	eor	#128
	bra	.LBB6_160
.LBB6_167:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#0
	ldy	#2
	stz	__rc2
	stz	__rc3
	sty	__rc4
	lda	__rc22
	jsr	cputhex
	jsr	cputln
.LBB6_168:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB6_168
; %bb.169:
	stz	54800
.LBB6_170:
	ldx	#mos16lo(.L.str.62)
	stx	__rc2
	ldx	#mos16hi(.L.str.62)
	stx	__rc3
	jsr	inputbox
	jsr	atoi
	tax
	bne	.LBB6_171
; %bb.422:
	jmp	.LBB6_385
.LBB6_171:
	sta	__rc26
	ldx	#mos16lo(.L.str)
	stx	__rc22
	ldx	#mos16hi(.L.str)
	stx	__rc23
	ldx	#mos16lo(.L.str.63)
	stx	__rc2
	ldx	#mos16hi(.L.str.63)
	stx	__rc3
	jsr	inputbox
	jsr	atoi
	sta	__rc27
	stz	mos8(BAMsector)
	ldx	#22
	stx	mos8(BAMsector+1)
	stz	mos8(BAMsector+2)
	inx
	stx	mos8(BAMsector+3)
	stz	mos8(worksector)
	inx
	stx	mos8(worksector+1)
	stz	mos8(worksector+2)
	ldy	#25
	sty	mos8(worksector+3)
	stz	mos8(worksectorasBAM)
	stx	mos8(worksectorasBAM+1)
	stz	mos8(worksectorasBAM+2)
	sty	mos8(worksectorasBAM+3)
	stz	mos8(offsCurrIdx)
	stz	mos8(flagCurrSec)
	stz	mos8(datNextTrk)
	stz	mos8(datNextSec)
	stz	mos8(ptrMiniOffs)
	ldx	#108
	stx	mos8(ptrMiniOffs+1)
	ldx	#253
	stx	mos8(ptrMiniOffs+2)
	ldx	#15
	stx	mos8(ptrMiniOffs+3)
	;APP
	lda	#0
	sta	53376

	;NO_APP
	ldx	mos8(ptrMiniOffs+2)
	stx	__rc28
	ldx	mos8(ptrMiniOffs+3)
	stx	__rc29
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_179
.LBB6_172:                              ;   in Loop: Header=BB6_179 Depth=1
	cmp	#96
	bcc	.LBB6_174
; %bb.173:                              ;   in Loop: Header=BB6_179 Depth=1
	clc
	adc	#160
	bra	.LBB6_176
.LBB6_174:                              ;   in Loop: Header=BB6_179 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_176
; %bb.175:                              ;   in Loop: Header=BB6_179 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_176:                              ;   in Loop: Header=BB6_179 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_178
; %bb.177:                              ;   in Loop: Header=BB6_179 Depth=1
	inc	__rc3
.LBB6_178:                              ;   in Loop: Header=BB6_179 Depth=1
	tax
	beq	.LBB6_183
.LBB6_179:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB6_181
; %bb.180:                              ;   in Loop: Header=BB6_179 Depth=1
	inc	__rc23
.LBB6_181:                              ;   in Loop: Header=BB6_179 Depth=1
	cmp	#192
	bcc	.LBB6_172
; %bb.182:                              ;   in Loop: Header=BB6_179 Depth=1
	eor	#128
	bra	.LBB6_176
.LBB6_183:
	ldx	#mos16lo(.L.str.1)
	stx	__rc24
	ldx	#mos16hi(.L.str.1)
	stx	__rc25
	stz	__rc22
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#4
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	__rc29
	lda	__rc28
	jsr	cputhex
	ldx	mos8(ptrMiniOffs)
	stx	__rc23
	ldx	mos8(ptrMiniOffs+1)
	stx	__rc28
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_191
.LBB6_184:                              ;   in Loop: Header=BB6_191 Depth=1
	cmp	#96
	bcc	.LBB6_186
; %bb.185:                              ;   in Loop: Header=BB6_191 Depth=1
	clc
	adc	#160
	bra	.LBB6_188
.LBB6_186:                              ;   in Loop: Header=BB6_191 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_188
; %bb.187:                              ;   in Loop: Header=BB6_191 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_188:                              ;   in Loop: Header=BB6_191 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_190
; %bb.189:                              ;   in Loop: Header=BB6_191 Depth=1
	inc	__rc3
.LBB6_190:                              ;   in Loop: Header=BB6_191 Depth=1
	tax
	beq	.LBB6_195
.LBB6_191:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB6_193
; %bb.192:                              ;   in Loop: Header=BB6_191 Depth=1
	inc	__rc25
.LBB6_193:                              ;   in Loop: Header=BB6_191 Depth=1
	cmp	#192
	bcc	.LBB6_184
; %bb.194:                              ;   in Loop: Header=BB6_191 Depth=1
	eor	#128
	bra	.LBB6_188
.LBB6_195:
	ldx	#mos16lo(.L.str.32)
	stx	__rc24
	ldx	#mos16hi(.L.str.32)
	stx	__rc25
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#4
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	__rc28
	lda	__rc23
	jsr	cputhex
	jsr	cputln
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_203
.LBB6_196:                              ;   in Loop: Header=BB6_203 Depth=1
	cmp	#96
	bcc	.LBB6_198
; %bb.197:                              ;   in Loop: Header=BB6_203 Depth=1
	clc
	adc	#160
	bra	.LBB6_200
.LBB6_198:                              ;   in Loop: Header=BB6_203 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_200
; %bb.199:                              ;   in Loop: Header=BB6_203 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_200:                              ;   in Loop: Header=BB6_203 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_202
; %bb.201:                              ;   in Loop: Header=BB6_203 Depth=1
	inc	__rc3
.LBB6_202:                              ;   in Loop: Header=BB6_203 Depth=1
	tax
	beq	.LBB6_207
.LBB6_203:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB6_205
; %bb.204:                              ;   in Loop: Header=BB6_203 Depth=1
	inc	__rc25
.LBB6_205:                              ;   in Loop: Header=BB6_203 Depth=1
	cmp	#192
	bcc	.LBB6_196
; %bb.206:                              ;   in Loop: Header=BB6_203 Depth=1
	eor	#128
	bra	.LBB6_200
.LBB6_207:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
.LBB6_208:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB6_208
; %bb.209:
	ldx	#mos16lo(.L.str.12)
	stx	__rc22
	ldx	#mos16hi(.L.str.12)
	stx	__rc23
	stz	54800
	ldx	mos8(BAMsector)
	ldy	mos8(BAMsector+1)
	stx	__rc2
	sty	__rc3
	lda	#40
	ldx	#1
	jsr	GetWholeSector
	sta	mos8(BAMside)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_217
.LBB6_210:                              ;   in Loop: Header=BB6_217 Depth=1
	cmp	#96
	bcc	.LBB6_212
; %bb.211:                              ;   in Loop: Header=BB6_217 Depth=1
	clc
	adc	#160
	bra	.LBB6_214
.LBB6_212:                              ;   in Loop: Header=BB6_217 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_214
; %bb.213:                              ;   in Loop: Header=BB6_217 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_214:                              ;   in Loop: Header=BB6_217 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_216
; %bb.215:                              ;   in Loop: Header=BB6_217 Depth=1
	inc	__rc3
.LBB6_216:                              ;   in Loop: Header=BB6_217 Depth=1
	tax
	beq	.LBB6_221
.LBB6_217:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB6_219
; %bb.218:                              ;   in Loop: Header=BB6_217 Depth=1
	inc	__rc23
.LBB6_219:                              ;   in Loop: Header=BB6_217 Depth=1
	cmp	#192
	bcc	.LBB6_210
; %bb.220:                              ;   in Loop: Header=BB6_217 Depth=1
	eor	#128
	bra	.LBB6_214
.LBB6_221:
	ldx	#mos16lo(.L.str.33)
	stx	__rc22
	ldx	#mos16hi(.L.str.33)
	stx	__rc23
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	__rc26
	stx	mos8(datNextTrk)
	ldx	__rc27
	stx	mos8(i)
	stx	mos8(datNextSec)
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_229
.LBB6_222:                              ;   in Loop: Header=BB6_229 Depth=1
	cmp	#96
	bcc	.LBB6_224
; %bb.223:                              ;   in Loop: Header=BB6_229 Depth=1
	clc
	adc	#160
	bra	.LBB6_226
.LBB6_224:                              ;   in Loop: Header=BB6_229 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_226
; %bb.225:                              ;   in Loop: Header=BB6_229 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_226:                              ;   in Loop: Header=BB6_229 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_228
; %bb.227:                              ;   in Loop: Header=BB6_229 Depth=1
	inc	__rc3
.LBB6_228:                              ;   in Loop: Header=BB6_229 Depth=1
	tax
	beq	.LBB6_233
.LBB6_229:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB6_231
; %bb.230:                              ;   in Loop: Header=BB6_229 Depth=1
	inc	__rc23
.LBB6_231:                              ;   in Loop: Header=BB6_229 Depth=1
	cmp	#192
	bcc	.LBB6_222
; %bb.232:                              ;   in Loop: Header=BB6_229 Depth=1
	eor	#128
	bra	.LBB6_226
.LBB6_233:
	ldx	#mos16lo(.L.str.34)
	stx	__rc22
	ldx	#mos16hi(.L.str.34)
	stx	__rc23
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	mos8(worksectorasBAM)
	ldy	mos8(worksectorasBAM+1)
	stx	__rc2
	sty	__rc3
	lda	mos8(datNextTrk)
	ldx	mos8(datNextSec)
	jsr	GetWholeSector
	sta	mos8(workside)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_241
.LBB6_234:                              ;   in Loop: Header=BB6_241 Depth=1
	cmp	#96
	bcc	.LBB6_236
; %bb.235:                              ;   in Loop: Header=BB6_241 Depth=1
	clc
	adc	#160
	bra	.LBB6_238
.LBB6_236:                              ;   in Loop: Header=BB6_241 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_238
; %bb.237:                              ;   in Loop: Header=BB6_241 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_238:                              ;   in Loop: Header=BB6_241 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_240
; %bb.239:                              ;   in Loop: Header=BB6_241 Depth=1
	inc	__rc3
.LBB6_240:                              ;   in Loop: Header=BB6_241 Depth=1
	tax
	beq	.LBB6_245
.LBB6_241:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB6_243
; %bb.242:                              ;   in Loop: Header=BB6_241 Depth=1
	inc	__rc23
.LBB6_243:                              ;   in Loop: Header=BB6_241 Depth=1
	cmp	#192
	bcc	.LBB6_234
; %bb.244:                              ;   in Loop: Header=BB6_241 Depth=1
	eor	#128
	bra	.LBB6_238
.LBB6_245:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
	lda	mos8(workside)
	ldy	#1
	asl
	stz	__rc2
	rol	__rc2
	clc
	sta	__rc3
	lda	#mos8(worksector)
	adc	__rc3
	sta	__rc4
	lda	#mos8(0)
	adc	__rc2
	sta	__rc5
	lda	(__rc4)
	sta	__rc24
	lda	(__rc4),y
	sta	__rc25
	lda	mos8(datNextTrk)
	sta	(__rc24)
	tax
	lda	mos8(datNextSec)
	inc
	sta	(__rc24),y
	ldy	#3
	sta	(__rc24),y
	ldy	#254
	lda	#238
	sta	(__rc24),y
	iny
	lda	#170
	sta	(__rc24),y
	ldy	#2
	txa
	sta	(__rc24),y
	stz	__rc22
	ldx	#mos16lo(.L.str.35)
	stx	__rc2
	ldx	#mos16hi(.L.str.35)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	ldy	#3
	lda	(__rc24),y
	ldx	#mos16lo(.L.str.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.36)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	jsr	cputln
.LBB6_246:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB6_246
; %bb.247:
	stz	54800
	lda	mos8(BAMside)
	asl
	stz	__rc2
	rol	__rc2
	clc
	sta	__rc3
	lda	#mos8(BAMsector)
	adc	__rc3
	tax
	lda	#mos8(0)
	adc	__rc2
	stx	__rc2
	stz	__rc22
	ldy	#1
	sta	__rc3
	lda	(__rc2)
	sta	__rc24
	ldx	mos8(datNextTrk)
	dex
	lda	(__rc2),y
	ldy	mos8(i)
	sty	__rc29
	cpy	#8
	bcs	.LBB6_249
; %bb.248:
	stx	__rc28
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	sta	__rc25
	lda	__rc28
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldx	__rc24
	stx	__rc23
	ldx	__rc25
	stx	__rc30
	clc
	lda	__rc24
	adc	__rc2
	sta	__rc2
	lda	__rc25
	adc	__rc3
	tax
	lda	__rc2
	clc
	adc	#17
; %bb.404:
	jmp	.LBB6_256
.LBB6_249:
	phy
	ldy	__rc24
	sty	__rc25
	ply
	sta	__rc24
	cpy	#16
	bcs	.LBB6_251
; %bb.250:
	clc
	tya
	adc	#248
	sta	__rc29
	stx	__rc28
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc28
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldx	__rc25
	stx	__rc23
	lda	__rc24
	sta	__rc30
	clc
	lda	__rc25
	adc	__rc2
	sta	__rc2
	lda	__rc24
	adc	__rc3
	tax
	clc
	lda	__rc2
	adc	#18
; %bb.406:
	jmp	.LBB6_256
.LBB6_251:
	cpy	#24
	bcs	.LBB6_253
; %bb.252:
	clc
	tya
	adc	#240
	sta	__rc29
	stx	__rc28
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc28
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldx	__rc25
	stx	__rc23
	lda	__rc24
	sta	__rc30
	clc
	lda	__rc25
	adc	__rc2
	sta	__rc2
	lda	__rc24
	adc	__rc3
	tax
	clc
	lda	__rc2
	adc	#19
; %bb.408:
	jmp	.LBB6_256
.LBB6_253:
	stx	__rc28
	ldx	__rc25
	stx	__rc23
	tya
	cmp	#32
	bcs	.LBB6_255
; %bb.254:
	clc
	adc	#232
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	sta	__rc29
	lda	__rc28
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	__rc24
	sta	__rc30
	clc
	lda	__rc25
	adc	__rc2
	sta	__rc2
	lda	__rc24
	adc	__rc3
	tax
	clc
	lda	__rc2
	adc	#20
	bra	.LBB6_256
.LBB6_255:
	clc
	adc	#224
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	sta	__rc29
	lda	__rc28
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	__rc24
	sta	__rc30
	clc
	lda	__rc25
	adc	__rc2
	sta	__rc2
	lda	__rc24
	adc	__rc3
	tax
	clc
	lda	__rc2
	adc	#21
.LBB6_256:
	sta	__rc26
	txa
	adc	#0
	sta	__rc27
	ldx	#mos16lo(.L.str.37)
	stx	__rc24
	ldx	#mos16hi(.L.str.37)
	stx	__rc25
	lda	#1
	ldx	#0
	ldy	__rc29
	sty	__rc2
	jsr	__ashlhi3
	eor	#255
	and	(__rc26)
	sta	(__rc26)
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	lda	__rc28
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	clc
	lda	__rc23
	adc	__rc2
	sta	__rc2
	lda	__rc30
	adc	__rc3
	sta	__rc3
	ldy	#16
	lda	(__rc2),y
	dec
	sta	(__rc2),y
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_264
.LBB6_257:                              ;   in Loop: Header=BB6_264 Depth=1
	cmp	#96
	bcc	.LBB6_259
; %bb.258:                              ;   in Loop: Header=BB6_264 Depth=1
	clc
	adc	#160
	bra	.LBB6_261
.LBB6_259:                              ;   in Loop: Header=BB6_264 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_261
; %bb.260:                              ;   in Loop: Header=BB6_264 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_261:                              ;   in Loop: Header=BB6_264 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_263
; %bb.262:                              ;   in Loop: Header=BB6_264 Depth=1
	inc	__rc3
.LBB6_263:                              ;   in Loop: Header=BB6_264 Depth=1
	tax
	beq	.LBB6_268
.LBB6_264:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB6_266
; %bb.265:                              ;   in Loop: Header=BB6_264 Depth=1
	inc	__rc25
.LBB6_266:                              ;   in Loop: Header=BB6_264 Depth=1
	cmp	#192
	bcc	.LBB6_257
; %bb.267:                              ;   in Loop: Header=BB6_264 Depth=1
	eor	#128
	bra	.LBB6_261
.LBB6_268:
	ldx	#mos16lo(.L.str.40)
	stx	__rc24
	ldx	#mos16hi(.L.str.40)
	stx	__rc25
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
	lda	mos8(i)
	stz	__rc22
	ldx	#mos16lo(.L.str.38)
	stx	__rc2
	ldx	#mos16hi(.L.str.38)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	lda	mos8(workside)
	ldx	#mos16lo(.L.str.39)
	stx	__rc2
	ldx	#mos16hi(.L.str.39)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	ldx	5888
	stx	__rc23
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_276
.LBB6_269:                              ;   in Loop: Header=BB6_276 Depth=1
	cmp	#96
	bcc	.LBB6_271
; %bb.270:                              ;   in Loop: Header=BB6_276 Depth=1
	clc
	adc	#160
	bra	.LBB6_273
.LBB6_271:                              ;   in Loop: Header=BB6_276 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_273
; %bb.272:                              ;   in Loop: Header=BB6_276 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_273:                              ;   in Loop: Header=BB6_276 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_275
; %bb.274:                              ;   in Loop: Header=BB6_276 Depth=1
	inc	__rc3
.LBB6_275:                              ;   in Loop: Header=BB6_276 Depth=1
	tax
	beq	.LBB6_280
.LBB6_276:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB6_278
; %bb.277:                              ;   in Loop: Header=BB6_276 Depth=1
	inc	__rc25
.LBB6_278:                              ;   in Loop: Header=BB6_276 Depth=1
	cmp	#192
	bcc	.LBB6_269
; %bb.279:                              ;   in Loop: Header=BB6_276 Depth=1
	eor	#128
	bra	.LBB6_273
.LBB6_280:
	ldx	#mos16lo(.L.str.1)
	stx	__rc24
	ldx	#mos16hi(.L.str.1)
	stx	__rc25
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#2
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	#0
	lda	__rc23
	jsr	cputhex
	ldx	5889
	stx	__rc23
	stz	__rc22
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_288
.LBB6_281:                              ;   in Loop: Header=BB6_288 Depth=1
	cmp	#96
	bcc	.LBB6_283
; %bb.282:                              ;   in Loop: Header=BB6_288 Depth=1
	clc
	adc	#160
	bra	.LBB6_285
.LBB6_283:                              ;   in Loop: Header=BB6_288 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_285
; %bb.284:                              ;   in Loop: Header=BB6_288 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_285:                              ;   in Loop: Header=BB6_288 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_287
; %bb.286:                              ;   in Loop: Header=BB6_288 Depth=1
	inc	__rc3
.LBB6_287:                              ;   in Loop: Header=BB6_288 Depth=1
	tax
	beq	.LBB6_292
.LBB6_288:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB6_290
; %bb.289:                              ;   in Loop: Header=BB6_288 Depth=1
	inc	__rc25
.LBB6_290:                              ;   in Loop: Header=BB6_288 Depth=1
	cmp	#192
	bcc	.LBB6_281
; %bb.291:                              ;   in Loop: Header=BB6_288 Depth=1
	eor	#128
	bra	.LBB6_285
.LBB6_292:
	ldx	#mos16lo(.L.str.1)
	stx	__rc24
	ldx	#mos16hi(.L.str.1)
	stx	__rc25
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#2
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	#0
	lda	__rc23
	jsr	cputhex
	ldx	6142
	stx	__rc23
	stz	__rc22
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_300
.LBB6_293:                              ;   in Loop: Header=BB6_300 Depth=1
	cmp	#96
	bcc	.LBB6_295
; %bb.294:                              ;   in Loop: Header=BB6_300 Depth=1
	clc
	adc	#160
	bra	.LBB6_297
.LBB6_295:                              ;   in Loop: Header=BB6_300 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_297
; %bb.296:                              ;   in Loop: Header=BB6_300 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_297:                              ;   in Loop: Header=BB6_300 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_299
; %bb.298:                              ;   in Loop: Header=BB6_300 Depth=1
	inc	__rc3
.LBB6_299:                              ;   in Loop: Header=BB6_300 Depth=1
	tax
	beq	.LBB6_304
.LBB6_300:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB6_302
; %bb.301:                              ;   in Loop: Header=BB6_300 Depth=1
	inc	__rc25
.LBB6_302:                              ;   in Loop: Header=BB6_300 Depth=1
	cmp	#192
	bcc	.LBB6_293
; %bb.303:                              ;   in Loop: Header=BB6_300 Depth=1
	eor	#128
	bra	.LBB6_297
.LBB6_304:
	ldx	#mos16lo(.L.str.1)
	stx	__rc24
	ldx	#mos16hi(.L.str.1)
	stx	__rc25
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#2
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	#0
	lda	__rc23
	jsr	cputhex
	ldx	6143
	stx	__rc23
	stz	__rc22
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_312
.LBB6_305:                              ;   in Loop: Header=BB6_312 Depth=1
	cmp	#96
	bcc	.LBB6_307
; %bb.306:                              ;   in Loop: Header=BB6_312 Depth=1
	clc
	adc	#160
	bra	.LBB6_309
.LBB6_307:                              ;   in Loop: Header=BB6_312 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_309
; %bb.308:                              ;   in Loop: Header=BB6_312 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_309:                              ;   in Loop: Header=BB6_312 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_311
; %bb.310:                              ;   in Loop: Header=BB6_312 Depth=1
	inc	__rc3
.LBB6_311:                              ;   in Loop: Header=BB6_312 Depth=1
	tax
	beq	.LBB6_316
.LBB6_312:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB6_314
; %bb.313:                              ;   in Loop: Header=BB6_312 Depth=1
	inc	__rc25
.LBB6_314:                              ;   in Loop: Header=BB6_312 Depth=1
	cmp	#192
	bcc	.LBB6_305
; %bb.315:                              ;   in Loop: Header=BB6_312 Depth=1
	eor	#128
	bra	.LBB6_309
.LBB6_316:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#2
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	#0
	lda	__rc23
	jsr	cputhex
	jsr	cputln
.LBB6_317:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB6_317
; %bb.318:
	ldx	#mos16lo(.L.str.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.41)
	stx	__rc3
	stz	54800
	ldx	5632
	stx	__rc23
	stz	__rc22
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB6_326
.LBB6_319:                              ;   in Loop: Header=BB6_326 Depth=1
	cmp	#96
	bcc	.LBB6_321
; %bb.320:                              ;   in Loop: Header=BB6_326 Depth=1
	clc
	adc	#160
	bra	.LBB6_323
.LBB6_321:                              ;   in Loop: Header=BB6_326 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_323
; %bb.322:                              ;   in Loop: Header=BB6_326 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_323:                              ;   in Loop: Header=BB6_326 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB6_325
; %bb.324:                              ;   in Loop: Header=BB6_326 Depth=1
	inc	__rc5
.LBB6_325:                              ;   in Loop: Header=BB6_326 Depth=1
	tax
	beq	.LBB6_330
.LBB6_326:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB6_328
; %bb.327:                              ;   in Loop: Header=BB6_326 Depth=1
	inc	__rc3
.LBB6_328:                              ;   in Loop: Header=BB6_326 Depth=1
	cmp	#192
	bcc	.LBB6_319
; %bb.329:                              ;   in Loop: Header=BB6_326 Depth=1
	eor	#128
	bra	.LBB6_323
.LBB6_330:
	ldx	#mos16lo(.L.str.1)
	stx	__rc24
	ldx	#mos16hi(.L.str.1)
	stx	__rc25
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#2
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	#0
	lda	__rc23
	jsr	cputhex
	ldx	5633
	stx	__rc23
	stz	__rc22
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_338
.LBB6_331:                              ;   in Loop: Header=BB6_338 Depth=1
	cmp	#96
	bcc	.LBB6_333
; %bb.332:                              ;   in Loop: Header=BB6_338 Depth=1
	clc
	adc	#160
	bra	.LBB6_335
.LBB6_333:                              ;   in Loop: Header=BB6_338 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_335
; %bb.334:                              ;   in Loop: Header=BB6_338 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_335:                              ;   in Loop: Header=BB6_338 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_337
; %bb.336:                              ;   in Loop: Header=BB6_338 Depth=1
	inc	__rc3
.LBB6_337:                              ;   in Loop: Header=BB6_338 Depth=1
	tax
	beq	.LBB6_342
.LBB6_338:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB6_340
; %bb.339:                              ;   in Loop: Header=BB6_338 Depth=1
	inc	__rc25
.LBB6_340:                              ;   in Loop: Header=BB6_338 Depth=1
	cmp	#192
	bcc	.LBB6_331
; %bb.341:                              ;   in Loop: Header=BB6_338 Depth=1
	eor	#128
	bra	.LBB6_335
.LBB6_342:
	ldx	#mos16lo(.L.str.1)
	stx	__rc24
	ldx	#mos16hi(.L.str.1)
	stx	__rc25
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#2
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	#0
	lda	__rc23
	jsr	cputhex
	ldx	5634
	stx	__rc23
	stz	__rc22
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_350
.LBB6_343:                              ;   in Loop: Header=BB6_350 Depth=1
	cmp	#96
	bcc	.LBB6_345
; %bb.344:                              ;   in Loop: Header=BB6_350 Depth=1
	clc
	adc	#160
	bra	.LBB6_347
.LBB6_345:                              ;   in Loop: Header=BB6_350 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_347
; %bb.346:                              ;   in Loop: Header=BB6_350 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_347:                              ;   in Loop: Header=BB6_350 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_349
; %bb.348:                              ;   in Loop: Header=BB6_350 Depth=1
	inc	__rc3
.LBB6_349:                              ;   in Loop: Header=BB6_350 Depth=1
	tax
	beq	.LBB6_354
.LBB6_350:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB6_352
; %bb.351:                              ;   in Loop: Header=BB6_350 Depth=1
	inc	__rc25
.LBB6_352:                              ;   in Loop: Header=BB6_350 Depth=1
	cmp	#192
	bcc	.LBB6_343
; %bb.353:                              ;   in Loop: Header=BB6_350 Depth=1
	eor	#128
	bra	.LBB6_347
.LBB6_354:
	ldx	#mos16lo(.L.str.1)
	stx	__rc24
	ldx	#mos16hi(.L.str.1)
	stx	__rc25
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#2
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	#0
	lda	__rc23
	jsr	cputhex
	ldx	5635
	stx	__rc23
	stz	__rc22
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_362
.LBB6_355:                              ;   in Loop: Header=BB6_362 Depth=1
	cmp	#96
	bcc	.LBB6_357
; %bb.356:                              ;   in Loop: Header=BB6_362 Depth=1
	clc
	adc	#160
	bra	.LBB6_359
.LBB6_357:                              ;   in Loop: Header=BB6_362 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_359
; %bb.358:                              ;   in Loop: Header=BB6_362 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_359:                              ;   in Loop: Header=BB6_362 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_361
; %bb.360:                              ;   in Loop: Header=BB6_362 Depth=1
	inc	__rc3
.LBB6_361:                              ;   in Loop: Header=BB6_362 Depth=1
	tax
	beq	.LBB6_366
.LBB6_362:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB6_364
; %bb.363:                              ;   in Loop: Header=BB6_362 Depth=1
	inc	__rc25
.LBB6_364:                              ;   in Loop: Header=BB6_362 Depth=1
	cmp	#192
	bcc	.LBB6_355
; %bb.365:                              ;   in Loop: Header=BB6_362 Depth=1
	eor	#128
	bra	.LBB6_359
.LBB6_366:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#2
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	#0
	lda	__rc23
	jsr	cputhex
	jsr	cputln
.LBB6_367:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB6_367
; %bb.368:
	stz	54800
	ldx	mos8(workside)
	lda	#0
	stx	__rc2
	stx	__rc6
	asl	__rc2
	rol
	clc
	sta	__rc3
	lda	#mos8(worksectorasBAM)
	adc	__rc2
	sta	__rc4
	lda	#mos8(0)
	adc	__rc3
	sta	__rc5
	lda	(__rc4)
	sta	__rc2
	ldy	#1
	lda	(__rc4),y
	sta	__rc3
	ldx	#mos16lo(.L.str.42)
	stx	__rc22
	ldx	#mos16hi(.L.str.42)
	stx	__rc23
	ldx	mos8(datNextTrk)
	lda	mos8(datNextSec)
	sta	__rc4
	lda	__rc6
	jsr	PutWholeSector
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB6_376
.LBB6_369:                              ;   in Loop: Header=BB6_376 Depth=1
	cmp	#96
	bcc	.LBB6_371
; %bb.370:                              ;   in Loop: Header=BB6_376 Depth=1
	clc
	adc	#160
	bra	.LBB6_373
.LBB6_371:                              ;   in Loop: Header=BB6_376 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_373
; %bb.372:                              ;   in Loop: Header=BB6_376 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_373:                              ;   in Loop: Header=BB6_376 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB6_375
; %bb.374:                              ;   in Loop: Header=BB6_376 Depth=1
	inc	__rc3
.LBB6_375:                              ;   in Loop: Header=BB6_376 Depth=1
	tax
	beq	.LBB6_380
.LBB6_376:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB6_378
; %bb.377:                              ;   in Loop: Header=BB6_376 Depth=1
	inc	__rc23
.LBB6_378:                              ;   in Loop: Header=BB6_376 Depth=1
	cmp	#192
	bcc	.LBB6_369
; %bb.379:                              ;   in Loop: Header=BB6_376 Depth=1
	eor	#128
	bra	.LBB6_373
.LBB6_380:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB6_381:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB6_381
; %bb.382:
	stz	54800
	ldx	mos8(BAMside)
	txa
	stx	__rc6
	asl
	stz	__rc2
	rol	__rc2
	clc
	sta	__rc3
	lda	#mos8(BAMsector)
	adc	__rc3
	sta	__rc4
	lda	#mos8(0)
	adc	__rc2
	sta	__rc5
	lda	(__rc4)
	sta	__rc2
	ldy	#1
	lda	(__rc4),y
	sta	__rc3
	stz	__rc22
	ldx	#40
	sty	__rc4
	lda	__rc6
	jsr	PutWholeSector
	lda	mos8(datNextTrk)
	ldx	#mos16lo(.L.str.43)
	stx	__rc2
	ldx	#mos16hi(.L.str.43)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	lda	mos8(datNextSec)
	ldx	#mos16lo(.L.str.44)
	stx	__rc2
	ldx	#mos16hi(.L.str.44)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	lda	mos8(BAMside)
	ldx	#mos16lo(.L.str.45)
	stx	__rc2
	ldx	#mos16hi(.L.str.45)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	jsr	cputln
.LBB6_383:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB6_383
; %bb.384:
	stz	54800
.LBB6_385:
	ldx	#11
	stx	mos8(dmalist)
	ldx	#128
	stx	mos8(dmalist+1)
	ldy	#255
	sty	mos8(dmalist+2)
	ldy	#129
	sty	mos8(dmalist+3)
	stx	mos8(dmalist+4)
	ldx	#133
	stx	mos8(dmalist+5)
	ldx	#1
	stx	mos8(dmalist+6)
	stz	mos8(dmalist+7)
	stz	mos8(dmalist+17)
	stz	mos8(dmalist+8)
	stz	mos8(dmalist+9)
	stx	mos8(dmalist+10)
	stz	mos8(dmalist+17)
	stz	mos8(dmalist+11)
	ldx	#108
	stx	mos8(dmalist+12)
	ldx	#13
	stx	mos8(dmalist+13)
	stz	mos8(dmalist+14)
	stz	mos8(dmalist+15)
	stz	mos8(dmalist+16)
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
	ldx	__rc31
	stx	55045
	ldx	#mos16lo(.L.str.64)
	stx	__rc2
	ldx	#mos16hi(.L.str.64)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB6_393
.LBB6_386:                              ;   in Loop: Header=BB6_393 Depth=1
	cmp	#96
	bcc	.LBB6_388
; %bb.387:                              ;   in Loop: Header=BB6_393 Depth=1
	clc
	adc	#160
	bra	.LBB6_390
.LBB6_388:                              ;   in Loop: Header=BB6_393 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB6_390
; %bb.389:                              ;   in Loop: Header=BB6_393 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB6_390:                              ;   in Loop: Header=BB6_393 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB6_392
; %bb.391:                              ;   in Loop: Header=BB6_393 Depth=1
	inc	__rc5
.LBB6_392:                              ;   in Loop: Header=BB6_393 Depth=1
	tax
	beq	.LBB6_397
.LBB6_393:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB6_395
; %bb.394:                              ;   in Loop: Header=BB6_393 Depth=1
	inc	__rc3
.LBB6_395:                              ;   in Loop: Header=BB6_393 Depth=1
	cmp	#192
	bcc	.LBB6_386
; %bb.396:                              ;   in Loop: Header=BB6_393 Depth=1
	eor	#128
	bra	.LBB6_390
.LBB6_397:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB6_398:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB6_398
; %bb.399:
	stz	54800
	;APP
	rts
	jmp	65418
	;NO_APP
	ldx	#0
	txa
	sta	__rc16
	ldy	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc31
	iny
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
	adc	#8
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end7:
	.size	escNOP, .Lfunc_end7-escNOP
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
	ldx	mos8(g_curTextColor)
	ldy	#11
	sty	mos8(dmalist)
	ldy	#128
	sty	mos8(dmalist+1)
	stz	mos8(dmalist+2)
	iny
	sty	mos8(dmalist+3)
	ldy	#255
	sty	mos8(dmalist+4)
	ldy	#133
	sty	mos8(dmalist+5)
	ldy	#1
	sty	mos8(dmalist+6)
	stz	mos8(dmalist+7)
	ldy	#3
	sty	mos8(dmalist+8)
	stz	mos8(dmalist+17)
	ldy	mos8(.Lclrscr_zp_stk+1)         ; 1-byte Folded Reload
	sty	mos8(dmalist+9)
	ldy	mos8(.Lclrscr_zp_stk+2)         ; 1-byte Folded Reload
	sty	mos8(dmalist+10)
	stx	mos8(dmalist+11)
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
.Lfunc_end8:
	.size	clrscr, .Lfunc_end8-clrscr
                                        ; -- End function
	.section	.text.cputcxy,"ax",@progbits
	.type	cputcxy,@function               ; -- Begin function cputcxy
cputcxy:                                ; @cputcxy
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#254
	sta	__rc0
	lda	__rc1
	adc	#255
	sta	__rc1
	pla
	ldy	__rc20
	phy
	ldy	__rc21
	phy
	ldy	__rc22
	phy
	ldy	__rc23
	phy
	pha
	lda	__rc24
	ldy	#1
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc25
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	__rc22
	ldy	__rc2
	sty	__rc21
	lda	mos8(g_curScreenW)
	stz	__rc20
	stx	__rc23
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	__rc22
	sta	__rc24
	txa
	adc	#0
	sta	__rc25
	lda	53347
	and	#7
	tay
	ldx	53346
	stx	__rc3
	ldx	53345
	stx	__rc2
	lda	__rc24
	clc
	adc	#0
	sta	__rc4
	lda	__rc25
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
	tax
	lda	__rc3
	adc	#0
	sta	__rc2
	tya
	adc	#0
	sta	__rc3
	ldy	__rc21
	sty	__rc4
	lda	__rc5
	jsr	lpoke
	ldx	mos8(g_curTextColor)
	ldy	#248
	lda	#15
	sty	__rc2
	sta	__rc3
	stx	__rc4
	ldx	__rc25
	lda	__rc24
	jsr	lpoke
	ldx	mos8(g_curScreenW)
	phx
	ply
	dex
	cpy	#0
	bne	.LBB9_2
; %bb.1:
	dec	__rc20
.LBB9_2:
	lda	__rc20
	bne	.LBB9_5
; %bb.3:
	ldy	__rc23
	cpx	__rc22
	bne	.LBB9_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB9_7
.LBB9_5:
	ldy	__rc23
.LBB9_6:
	ldx	__rc22
	inx
.LBB9_7:
	stx	mos8(g_curX)
	sty	mos8(g_curY)
	ldy	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
	iny
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
	adc	#2
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end9:
	.size	cputcxy, .Lfunc_end9-cputcxy
                                        ; -- End function
	.section	.text.cputhex,"ax",@progbits
	.type	cputhex,@function               ; -- Begin function cputhex
cputhex:                                ; @cputhex
; %bb.0:
	sta	__rc5
	stx	__rc2
	txa
	and	#15
	sta	__rc6
	stx	__rc3
	lsr	__rc2
	lda	__rc5
	ror
	lsr	__rc2
	ror
	lsr	__rc2
	ror
	lsr	__rc2
	ror
	and	#15
	tay
	lda	#0
	lsr
	ror	__rc3
	lsr
	ror	__rc3
	lsr
	ror	__rc3
	lsr
	ror	__rc3
	ldx	__rc3
	lda	mos8(hexDigits),x
	tax
	lda	#48
	sta	mos8(.Lcputhex_zp_stk+1)
	sta	mos8(.Lcputhex_zp_stk+2)
	sta	mos8(.Lcputhex_zp_stk+3)
	sta	mos8(.Lcputhex_zp_stk+4)
	stx	mos8(.Lcputhex_zp_stk+5)
	ldx	__rc6
	lda	mos8(hexDigits),x
	tax
	stx	mos8(.Lcputhex_zp_stk+6)
	lda	__rc5
	and	#15
	tax
	sec
	lda	#8
	sbc	__rc4
	sta	__rc2
	lda	#0
	sbc	#0
	clc
	sta	__rc3
	lda	#mos8(.Lcputhex_zp_stk)
	adc	__rc2
	sta	__rc2
	lda	#mos8(0)
	adc	__rc3
	pha
	lda	mos8(hexDigits),y
	tay
	pla
	sty	mos8(.Lcputhex_zp_stk+7)
	sta	__rc3
	lda	#36
	sta	mos8(.Lcputhex_zp_stk)
	pha
	lda	mos8(hexDigits),x
	tax
	pla
	stx	mos8(.Lcputhex_zp_stk+8)
	stz	mos8(.Lcputhex_zp_stk+9)
	sta	(__rc2)
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end10:
	.size	cputhex, .Lfunc_end10-cputhex
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
	ldx	mos8(g_curTextColor)
	ldy	#248
	lda	#15
	sty	__rc2
	sta	__rc3
	stx	__rc4
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
.Lfunc_end11:
	.size	cputsxy, .Lfunc_end11-cputsxy
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
	bcs	.LBB12_2
; %bb.1:
	clv
.LBB12_2:
	ror	__rc3
	ldy	__rc2
	sty	__rc12
	ror	__rc12
	lsr	__rc8
	ror
	ldy	#1
	bcs	.LBB12_4
; %bb.3:
	ldy	#0
.LBB12_4:
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	phy
	ldy	#1
	bcs	.LBB12_6
; %bb.5:
	ldy	#0
.LBB12_6:
	sty	__rc13
	ply
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	lda	#1
	bcs	.LBB12_8
; %bb.7:
	lda	#0
.LBB12_8:
	sta	__rc8
	ror	__rc3
	lda	__rc12
	ror
	sta	__rc3
	sec
	bvs	.LBB12_10
; %bb.9:
	clc
.LBB12_10:
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
.Lfunc_end12:
	.size	lcopy, .Lfunc_end12-lcopy
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
.Lfunc_end13:
	.size	lfill, .Lfunc_end13-lfill
                                        ; -- End function
	.section	.text.atoi,"ax",@progbits
	.type	atoi,@function                  ; -- Begin function atoi
atoi:                                   ; @atoi
; %bb.0:
	ldx	#0
	stx	mos8(.Latoi_zp_stk+2)
	ldx	#28
	stx	mos8(.Latoi_zp_stk+3)
	ldx	#0
.LBB14_1:                               ; =>This Inner Loop Header: Depth=1
	lda	(mos8(.Latoi_zp_stk+2))
	sec
	tay
	sbc	#9
	cmp	#5
	bcs	.LBB14_5
.LBB14_2:                               ;   in Loop: Header=BB14_1 Depth=1
	inc	mos8(.Latoi_zp_stk+2)
	bne	.LBB14_4
; %bb.3:                                ;   in Loop: Header=BB14_1 Depth=1
	inc	mos8(.Latoi_zp_stk+3)
.LBB14_4:                               ;   in Loop: Header=BB14_1 Depth=1
	bra	.LBB14_1
.LBB14_5:                               ;   in Loop: Header=BB14_1 Depth=1
	cpy	#32
	beq	.LBB14_2
; %bb.6:
	lda	mos8(.Latoi_zp_stk+2)
	sta	__rc2
	lda	mos8(.Latoi_zp_stk+3)
	sta	__rc3
	inc	__rc2
	bne	.LBB14_8
; %bb.7:
	inc	__rc3
.LBB14_8:
	cpy	#43
	beq	.LBB14_11
; %bb.9:
	cpy	#45
	bne	.LBB14_12
; %bb.10:
	ldx	#1
.LBB14_11:
	ldy	__rc2
	sty	mos8(.Latoi_zp_stk+2)
	ldy	__rc3
	sty	mos8(.Latoi_zp_stk+3)
.LBB14_12:
	stx	mos8(.Latoi_zp_stk+1)
	stz	__rc2
	lda	#208
	clc
	adc	(mos8(.Latoi_zp_stk+2))
	cmp	#10
	stz	__rc3
	bcc	.LBB14_13
; %bb.20:
	jmp	.LBB14_17
.LBB14_13:
	lda	(mos8(.Latoi_zp_stk+2))
	sta	mos8(.Latoi_zp_stk+6)
	stz	mos8(.Latoi_zp_stk)
	ldx	mos8(.Latoi_zp_stk+2)
	stx	mos8(.Latoi_zp_stk+4)
	ldx	mos8(.Latoi_zp_stk+3)
	stx	mos8(.Latoi_zp_stk+5)
	stz	mos8(.Latoi_zp_stk+7)
	lda	#0
	stz	__rc4
.LBB14_14:                              ; =>This Inner Loop Header: Depth=1
	inc	mos8(.Latoi_zp_stk+4)
	bne	.LBB14_16
; %bb.15:                               ;   in Loop: Header=BB14_14 Depth=1
	inc	mos8(.Latoi_zp_stk+5)
.LBB14_16:                              ;   in Loop: Header=BB14_14 Depth=1
	ldx	#10
	stx	__rc2
	stz	__rc3
	ldx	__rc4
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	clc
	lda	mos8(.Latoi_zp_stk+6)
	adc	#208
	sta	__rc4
	lda	#0
	adc	#255
	tax
	lda	__rc4
	clc
	adc	__rc2
	sta	__rc2
	txa
	adc	__rc3
	tax
	clc
	ldy	#1
	lda	(mos8(.Latoi_zp_stk+2)),y
	sta	mos8(.Latoi_zp_stk+6)
	adc	#208
	cmp	#10
	lda	__rc2
	ldy	mos8(.Latoi_zp_stk+4)
	sty	mos8(.Latoi_zp_stk+2)
	ldy	mos8(.Latoi_zp_stk+5)
	sty	mos8(.Latoi_zp_stk+3)
	stx	__rc4
	stx	__rc3
	stz	mos8(.Latoi_zp_stk+7)
	bcc	.LBB14_14
.LBB14_17:
	lda	mos8(.Latoi_zp_stk+1)
	beq	.LBB14_19
; %bb.18:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB14_19:
	ldx	__rc3
	lda	__rc2
	rts
.Lfunc_end14:
	.size	atoi, .Lfunc_end14-atoi
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB15_2
; %bb.1:
	tya
	beq	.LBB15_11
.LBB15_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB15_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB15_5
; %bb.4:                                ;   in Loop: Header=BB15_3 Depth=1
	inc	__rc7
.LBB15_5:                               ;   in Loop: Header=BB15_3 Depth=1
	inc	__rc4
	bne	.LBB15_7
; %bb.6:                                ;   in Loop: Header=BB15_3 Depth=1
	inc	__rc5
.LBB15_7:                               ;   in Loop: Header=BB15_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB15_9
; %bb.8:                                ;   in Loop: Header=BB15_3 Depth=1
	dex
.LBB15_9:                               ;   in Loop: Header=BB15_3 Depth=1
	txa
	bne	.LBB15_3
; %bb.10:                               ;   in Loop: Header=BB15_3 Depth=1
	tya
	bne	.LBB15_3
.LBB15_11:
	rts
.Lfunc_end15:
	.size	memcpy, .Lfunc_end15-memcpy
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
.Lfunc_end16:
	.size	memset, .Lfunc_end16-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB17_4
.LBB17_1:                               ;   in Loop: Header=BB17_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB17_3
; %bb.2:                                ;   in Loop: Header=BB17_4 Depth=1
	inc	__rc3
.LBB17_3:                               ;   in Loop: Header=BB17_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB17_7
.LBB17_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB17_1
; %bb.5:                                ;   in Loop: Header=BB17_4 Depth=1
	cpx	#0
	bne	.LBB17_1
; %bb.6:
	rts
.LBB17_7:                               ;   in Loop: Header=BB17_4 Depth=1
	dec	__rc4
	jmp	.LBB17_4
.Lfunc_end17:
	.size	__memset, .Lfunc_end17-__memset
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
	beq	.LBB18_1
; %bb.15:
	jmp	.LBB18_13
.LBB18_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB18_2
; %bb.17:
	jmp	.LBB18_14
.LBB18_2:
	lda	__rc7
	bne	.LBB18_4
; %bb.3:
	lda	__rc6
	beq	.LBB18_12
.LBB18_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB18_6
; %bb.5:                                ;   in Loop: Header=BB18_4 Depth=1
	dec	__rc9
.LBB18_6:                               ;   in Loop: Header=BB18_4 Depth=1
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
	bne	.LBB18_8
; %bb.7:                                ;   in Loop: Header=BB18_4 Depth=1
	dec	__rc11
.LBB18_8:                               ;   in Loop: Header=BB18_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB18_10
; %bb.9:                                ;   in Loop: Header=BB18_4 Depth=1
	dex
.LBB18_10:                              ;   in Loop: Header=BB18_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB18_4
; %bb.11:                               ;   in Loop: Header=BB18_4 Depth=1
	tya
	bne	.LBB18_4
.LBB18_12:
	rts
.LBB18_13:
	cpx	__rc3
	bcs	.LBB18_14
; %bb.19:
	jmp	.LBB18_2
.LBB18_14:
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
.Lfunc_end18:
	.size	memmove, .Lfunc_end18-memmove
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB19_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB19_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB19_4
; %bb.3:                                ;   in Loop: Header=BB19_2 Depth=1
	inx
.LBB19_4:                               ;   in Loop: Header=BB19_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB19_2
	bra	.LBB19_6
.LBB19_5:
	stz	__rc4
	ldx	#0
.LBB19_6:
	lda	__rc4
	rts
.Lfunc_end19:
	.size	strlen, .Lfunc_end19-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB20_2
.LBB20_1:                               ;   in Loop: Header=BB20_2 Depth=1
	dex
	asl
.LBB20_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB20_1
; %bb.3:
	rts
.Lfunc_end20:
	.size	__ashlqi3, .Lfunc_end20-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB21_3
; %bb.1:
	ldx	__rc2
.LBB21_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB21_2
.LBB21_3:
	ldx	__rc3
	rts
.Lfunc_end21:
	.size	__ashlhi3, .Lfunc_end21-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB22_3
; %bb.1:
	ldx	__rc4
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB22_2
.LBB22_3:
	ldx	__rc5
	rts
.Lfunc_end22:
	.size	__ashlsi3, .Lfunc_end22-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB23_3
; %bb.1:
	ldx	__rc8
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB23_2
.LBB23_3:
	ldx	__rc9
	rts
.Lfunc_end23:
	.size	__ashldi3, .Lfunc_end23-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB24_2
.LBB24_1:                               ;   in Loop: Header=BB24_2 Depth=1
	dex
	lsr
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB24_1
; %bb.3:
	rts
.Lfunc_end24:
	.size	__lshrqi3, .Lfunc_end24-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB25_3
; %bb.1:
	ldx	__rc2
.LBB25_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB25_2
.LBB25_3:
	ldx	__rc3
	rts
.Lfunc_end25:
	.size	__lshrhi3, .Lfunc_end25-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB26_3
; %bb.1:
	ldx	__rc4
.LBB26_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB26_2
.LBB26_3:
	ldx	__rc5
	rts
.Lfunc_end26:
	.size	__lshrsi3, .Lfunc_end26-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB27_3
; %bb.1:
	ldx	__rc8
.LBB27_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB27_2
.LBB27_3:
	ldx	__rc9
	rts
.Lfunc_end27:
	.size	__lshrdi3, .Lfunc_end27-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB28_2
.LBB28_1:                               ;   in Loop: Header=BB28_2 Depth=1
	dex
	cmp	#128
	ror
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB28_1
; %bb.3:
	rts
.Lfunc_end28:
	.size	__ashrqi3, .Lfunc_end28-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB29_3
; %bb.1:
	ldx	__rc2
.LBB29_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB29_2
.LBB29_3:
	tax
	lda	__rc3
	rts
.Lfunc_end29:
	.size	__ashrhi3, .Lfunc_end29-__ashrhi3
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
	beq	.LBB30_3
; %bb.1:
	ldx	__rc4
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB30_2
.LBB30_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end30:
	.size	__ashrsi3, .Lfunc_end30-__ashrsi3
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
	beq	.LBB31_3
; %bb.1:
	ldx	__rc8
.LBB31_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB31_2
.LBB31_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end31:
	.size	__ashrdi3, .Lfunc_end31-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB32_2
.LBB32_1:                               ;   in Loop: Header=BB32_2 Depth=1
	dex
	cmp	#128
	rol
.LBB32_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB32_1
; %bb.3:
	rts
.Lfunc_end32:
	.size	__rotlqi3, .Lfunc_end32-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB33_3
; %bb.1:
	ldx	__rc2
.LBB33_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB33_2
.LBB33_3:
	tax
	lda	__rc3
	rts
.Lfunc_end33:
	.size	__rotlhi3, .Lfunc_end33-__rotlhi3
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
	beq	.LBB34_3
; %bb.1:
	ldx	__rc4
.LBB34_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB34_2
.LBB34_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end34:
	.size	__rotlsi3, .Lfunc_end34-__rotlsi3
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
	beq	.LBB35_3
; %bb.1:
	ldx	__rc8
.LBB35_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB35_2
.LBB35_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end35:
	.size	__rotldi3, .Lfunc_end35-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB36_2
.LBB36_1:                               ;   in Loop: Header=BB36_2 Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror
.LBB36_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB36_1
; %bb.3:
	rts
.Lfunc_end36:
	.size	__rotrqi3, .Lfunc_end36-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB37_3
; %bb.1:
	ldx	__rc2
.LBB37_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB37_2
.LBB37_3:
	ldx	__rc3
	rts
.Lfunc_end37:
	.size	__rotrhi3, .Lfunc_end37-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB38_3
; %bb.1:
	ldx	__rc4
.LBB38_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB38_2
.LBB38_3:
	ldx	__rc5
	rts
.Lfunc_end38:
	.size	__rotrsi3, .Lfunc_end38-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB39_3
; %bb.1:
	ldx	__rc8
.LBB39_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB39_2
.LBB39_3:
	ldx	__rc9
	rts
.Lfunc_end39:
	.size	__rotrdi3, .Lfunc_end39-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB40_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB40_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB40_4
; %bb.3:                                ;   in Loop: Header=BB40_2 Depth=1
	clc
	adc	__rc2
.LBB40_4:                               ;   in Loop: Header=BB40_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB40_2
; %bb.5:
	rts
.LBB40_6:
	lda	#0
	rts
.Lfunc_end40:
	.size	__mulqi3, .Lfunc_end40-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB41_2
; %bb.1:
	ldy	__rc2
	beq	.LBB41_7
.LBB41_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB41_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB41_5
; %bb.4:                                ;   in Loop: Header=BB41_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB41_5:                               ;   in Loop: Header=BB41_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB41_3
; %bb.6:                                ;   in Loop: Header=BB41_3 Depth=1
	ldx	__rc2
	bne	.LBB41_3
	bra	.LBB41_8
.LBB41_7:
	ldy	#0
	tya
.LBB41_8:
	tax
	tya
	rts
.Lfunc_end41:
	.size	__mulhi3, .Lfunc_end41-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB42_4
; %bb.1:
	ldy	__rc6
	bne	.LBB42_4
; %bb.2:
	ldy	__rc5
	bne	.LBB42_4
; %bb.3:
	ldy	__rc4
	bne	.LBB42_4
; %bb.13:
	jmp	.LBB42_12
.LBB42_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB42_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB42_7
; %bb.6:                                ;   in Loop: Header=BB42_5 Depth=1
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
.LBB42_7:                               ;   in Loop: Header=BB42_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB42_5
; %bb.8:                                ;   in Loop: Header=BB42_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB42_5
; %bb.9:                                ;   in Loop: Header=BB42_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB42_5
; %bb.10:                               ;   in Loop: Header=BB42_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB42_5
.LBB42_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB42_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB42_11
.Lfunc_end42:
	.size	__mulsi3, .Lfunc_end42-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB43_8
; %bb.1:
	ldy	__rc14
	bne	.LBB43_8
; %bb.2:
	ldy	__rc13
	bne	.LBB43_8
; %bb.3:
	ldy	__rc12
	bne	.LBB43_8
; %bb.4:
	ldy	__rc11
	bne	.LBB43_8
; %bb.5:
	ldy	__rc10
	bne	.LBB43_8
; %bb.6:
	ldy	__rc9
	bne	.LBB43_8
; %bb.7:
	ldy	__rc8
	bne	.LBB43_8
; %bb.21:
	jmp	.LBB43_20
.LBB43_8:
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
.LBB43_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB43_11
; %bb.10:                               ;   in Loop: Header=BB43_9 Depth=1
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
.LBB43_11:                              ;   in Loop: Header=BB43_9 Depth=1
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
	beq	.LBB43_12
; %bb.23:                               ;   in Loop: Header=BB43_9 Depth=1
	jmp	.LBB43_9
.LBB43_12:                              ;   in Loop: Header=BB43_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB43_13
; %bb.25:                               ;   in Loop: Header=BB43_9 Depth=1
	jmp	.LBB43_9
.LBB43_13:                              ;   in Loop: Header=BB43_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB43_14
; %bb.27:                               ;   in Loop: Header=BB43_9 Depth=1
	jmp	.LBB43_9
.LBB43_14:                              ;   in Loop: Header=BB43_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB43_15
; %bb.29:                               ;   in Loop: Header=BB43_9 Depth=1
	jmp	.LBB43_9
.LBB43_15:                              ;   in Loop: Header=BB43_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB43_16
; %bb.31:                               ;   in Loop: Header=BB43_9 Depth=1
	jmp	.LBB43_9
.LBB43_16:                              ;   in Loop: Header=BB43_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB43_17
; %bb.33:                               ;   in Loop: Header=BB43_9 Depth=1
	jmp	.LBB43_9
.LBB43_17:                              ;   in Loop: Header=BB43_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB43_18
; %bb.35:                               ;   in Loop: Header=BB43_9 Depth=1
	jmp	.LBB43_9
.LBB43_18:                              ;   in Loop: Header=BB43_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB43_19
; %bb.37:                               ;   in Loop: Header=BB43_9 Depth=1
	jmp	.LBB43_9
.LBB43_19:
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
.LBB43_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB43_19
.Lfunc_end43:
	.size	__muldi3, .Lfunc_end43-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB44_1
; %bb.15:
	jmp	.LBB44_14
.LBB44_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB44_2
; %bb.17:
	jmp	.LBB44_14
.LBB44_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB44_3
; %bb.19:
	jmp	.LBB44_14
.LBB44_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB44_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB44_6
; %bb.5:                                ;   in Loop: Header=BB44_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB44_8
	bra	.LBB44_7
.LBB44_6:                               ;   in Loop: Header=BB44_4 Depth=1
	cpy	__rc4
	bcc	.LBB44_8
.LBB44_7:                               ;   in Loop: Header=BB44_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB44_4
	bra	.LBB44_9
.LBB44_8:
	ldy	__rc3
	sty	__rc2
.LBB44_9:
	cpx	#0
	beq	.LBB44_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB44_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB44_13
; %bb.12:                               ;   in Loop: Header=BB44_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB44_13:                              ;   in Loop: Header=BB44_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB44_11
.LBB44_14:
	rts
.Lfunc_end44:
	.size	__udivqi3, .Lfunc_end44-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB45_2
; %bb.1:
	ldy	__rc2
	beq	.LBB45_4
.LBB45_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB45_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB45_6
.LBB45_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB45_22
.LBB45_5:
	cmp	__rc3
	bcc	.LBB45_4
.LBB45_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB45_7
; %bb.25:
	jmp	.LBB45_22
.LBB45_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB45_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB45_10
; %bb.9:                                ;   in Loop: Header=BB45_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB45_12
	bra	.LBB45_11
.LBB45_10:                              ;   in Loop: Header=BB45_8 Depth=1
	cmp	__rc6
	bcc	.LBB45_12
.LBB45_11:                              ;   in Loop: Header=BB45_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB45_8
	bra	.LBB45_13
.LBB45_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB45_13:
	cpx	#0
	bne	.LBB45_14
; %bb.27:
	jmp	.LBB45_22
.LBB45_14:
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
.LBB45_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB45_17
; %bb.16:                               ;   in Loop: Header=BB45_15 Depth=1
	ldy	#0
.LBB45_17:                              ;   in Loop: Header=BB45_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB45_21
; %bb.18:                               ;   in Loop: Header=BB45_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB45_20
.LBB45_19:                              ;   in Loop: Header=BB45_15 Depth=1
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
.LBB45_20:                              ;   in Loop: Header=BB45_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB45_15
	bra	.LBB45_22
.LBB45_21:                              ;   in Loop: Header=BB45_15 Depth=1
	cmp	__rc6
	bcs	.LBB45_19
	bra	.LBB45_20
.LBB45_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end45:
	.size	__udivhi3, .Lfunc_end45-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
	ldy	__rc7
	bne	.LBB46_4
; %bb.1:
	ldy	__rc6
	bne	.LBB46_4
; %bb.2:
	ldy	__rc5
	bne	.LBB46_4
; %bb.3:
	ldy	__rc4
	beq	.LBB46_9
.LBB46_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB46_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB46_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB46_7
; %bb.45:
	jmp	.LBB46_38
.LBB46_7:
	cmp	__rc4
	bcc	.LBB46_9
	bra	.LBB46_11
.LBB46_8:
	cpx	__rc7
	bcs	.LBB46_11
.LBB46_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB46_21
.LBB46_10:
	cpx	__rc6
	bcc	.LBB46_9
.LBB46_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB46_12
; %bb.47:
	jmp	.LBB46_21
.LBB46_12:
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
.LBB46_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB46_17
; %bb.14:                               ;   in Loop: Header=BB46_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB46_18
; %bb.15:                               ;   in Loop: Header=BB46_13 Depth=1
	cmp	__rc10
	bne	.LBB46_19
; %bb.16:                               ;   in Loop: Header=BB46_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB46_23
	bra	.LBB46_20
.LBB46_17:                              ;   in Loop: Header=BB46_13 Depth=1
	cpy	__rc12
	bcc	.LBB46_23
	bra	.LBB46_20
.LBB46_18:                              ;   in Loop: Header=BB46_13 Depth=1
	cpy	__rc11
	bcc	.LBB46_23
	bra	.LBB46_20
.LBB46_19:                              ;   in Loop: Header=BB46_13 Depth=1
	cmp	__rc10
	bcc	.LBB46_23
.LBB46_20:                              ;   in Loop: Header=BB46_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB46_13
	bra	.LBB46_24
.LBB46_21:
	stz	__rc2
	stz	__rc3
.LBB46_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB46_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB46_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB46_22
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
.LBB46_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB46_28
; %bb.27:                               ;   in Loop: Header=BB46_26 Depth=1
	ldy	#0
.LBB46_28:                              ;   in Loop: Header=BB46_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB46_32
; %bb.29:                               ;   in Loop: Header=BB46_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB46_34
; %bb.30:                               ;   in Loop: Header=BB46_26 Depth=1
	cmp	__rc10
	bne	.LBB46_37
; %bb.31:                               ;   in Loop: Header=BB46_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB46_33
	bra	.LBB46_35
.LBB46_32:                              ;   in Loop: Header=BB46_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB46_35
.LBB46_33:                              ;   in Loop: Header=BB46_26 Depth=1
	lda	__rc6
	bra	.LBB46_36
.LBB46_34:                              ;   in Loop: Header=BB46_26 Depth=1
	cpy	__rc11
	bcc	.LBB46_33
.LBB46_35:                              ;   in Loop: Header=BB46_26 Depth=1
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
.LBB46_36:                              ;   in Loop: Header=BB46_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB46_41
; %bb.49:                               ;   in Loop: Header=BB46_26 Depth=1
	jmp	.LBB46_26
.LBB46_41:
	jmp	.LBB46_22
.LBB46_37:                              ;   in Loop: Header=BB46_26 Depth=1
	cmp	__rc10
	bcc	.LBB46_33
	bra	.LBB46_35
.LBB46_38:
	cpx	__rc5
	bcs	.LBB46_43
; %bb.51:
	jmp	.LBB46_9
.LBB46_43:
	jmp	.LBB46_11
.Lfunc_end46:
	.size	__udivsi3, .Lfunc_end46-__udivsi3
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
	bne	.LBB47_8
; %bb.1:
	ldx	__rc14
	bne	.LBB47_8
; %bb.2:
	ldx	__rc13
	bne	.LBB47_8
; %bb.3:
	ldx	__rc12
	bne	.LBB47_8
; %bb.4:
	ldx	__rc11
	bne	.LBB47_8
; %bb.5:
	ldx	__rc10
	bne	.LBB47_8
; %bb.6:
	ldx	__rc9
	bne	.LBB47_8
; %bb.7:
	ldx	__rc8
	beq	.LBB47_17
.LBB47_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB47_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB47_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB47_11
; %bb.90:
	jmp	.LBB47_31
.LBB47_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB47_12
; %bb.92:
	jmp	.LBB47_32
.LBB47_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB47_13
; %bb.94:
	jmp	.LBB47_38
.LBB47_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB47_14
; %bb.96:
	jmp	.LBB47_40
.LBB47_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB47_15
; %bb.98:
	jmp	.LBB47_42
.LBB47_15:
	cmp	__rc8
	bcc	.LBB47_17
	bra	.LBB47_19
.LBB47_16:
	cpx	__rc15
	bcs	.LBB47_19
.LBB47_17:
	lda	#0
; %bb.66:
	jmp	.LBB47_29
.LBB47_18:
	cpx	__rc14
	bcc	.LBB47_17
.LBB47_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB47_20
; %bb.100:
	jmp	.LBB47_29
.LBB47_20:
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
.LBB47_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB47_25
; %bb.22:                               ;   in Loop: Header=BB47_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB47_26
; %bb.23:                               ;   in Loop: Header=BB47_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB47_27
; %bb.24:                               ;   in Loop: Header=BB47_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB47_102
; %bb.150:                              ;   in Loop: Header=BB47_21 Depth=1
	jmp	.LBB47_33
.LBB47_102:                             ;   in Loop: Header=BB47_21 Depth=1
	jmp	.LBB47_37
.LBB47_25:                              ;   in Loop: Header=BB47_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB47_28
; %bb.104:
	jmp	.LBB47_44
.LBB47_26:                              ;   in Loop: Header=BB47_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB47_28
; %bb.106:
	jmp	.LBB47_44
.LBB47_27:                              ;   in Loop: Header=BB47_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB47_28
; %bb.108:
	jmp	.LBB47_44
.LBB47_28:                              ;   in Loop: Header=BB47_21 Depth=1
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
	bmi	.LBB47_68
; %bb.110:                              ;   in Loop: Header=BB47_21 Depth=1
	jmp	.LBB47_21
.LBB47_68:
	jmp	.LBB47_45
.LBB47_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB47_30:
	ldx	__rc18
	rts
.LBB47_31:
	cpx	__rc13
	bcs	.LBB47_70
; %bb.112:
	jmp	.LBB47_17
.LBB47_70:
	jmp	.LBB47_19
.LBB47_32:
	cpx	__rc12
	bcs	.LBB47_72
; %bb.114:
	jmp	.LBB47_17
.LBB47_72:
	jmp	.LBB47_19
.LBB47_33:                              ;   in Loop: Header=BB47_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB47_39
; %bb.34:                               ;   in Loop: Header=BB47_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB47_41
; %bb.35:                               ;   in Loop: Header=BB47_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB47_43
; %bb.36:                               ;   in Loop: Header=BB47_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB47_44
; %bb.74:                               ;   in Loop: Header=BB47_21 Depth=1
	jmp	.LBB47_28
.LBB47_37:                              ;   in Loop: Header=BB47_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB47_44
; %bb.76:                               ;   in Loop: Header=BB47_21 Depth=1
	jmp	.LBB47_28
.LBB47_38:
	cpx	__rc11
	bcs	.LBB47_78
; %bb.116:
	jmp	.LBB47_17
.LBB47_78:
	jmp	.LBB47_19
.LBB47_39:                              ;   in Loop: Header=BB47_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB47_44
; %bb.80:                               ;   in Loop: Header=BB47_21 Depth=1
	jmp	.LBB47_28
.LBB47_40:
	cpx	__rc10
	bcs	.LBB47_82
; %bb.118:
	jmp	.LBB47_17
.LBB47_82:
	jmp	.LBB47_19
.LBB47_41:                              ;   in Loop: Header=BB47_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB47_44
; %bb.84:                               ;   in Loop: Header=BB47_21 Depth=1
	jmp	.LBB47_28
.LBB47_42:
	cpx	__rc9
	bcs	.LBB47_86
; %bb.120:
	jmp	.LBB47_17
.LBB47_86:
	jmp	.LBB47_19
.LBB47_43:                              ;   in Loop: Header=BB47_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB47_44
; %bb.122:                              ;   in Loop: Header=BB47_21 Depth=1
	jmp	.LBB47_28
.LBB47_44:
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
.LBB47_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB47_46
; %bb.124:
	jmp	.LBB47_30
.LBB47_46:
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
.LBB47_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB47_49
; %bb.48:                               ;   in Loop: Header=BB47_47 Depth=1
	ldy	#0
.LBB47_49:                              ;   in Loop: Header=BB47_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB47_57
; %bb.50:                               ;   in Loop: Header=BB47_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB47_51
; %bb.126:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_60
.LBB47_51:                              ;   in Loop: Header=BB47_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB47_52
; %bb.128:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_61
.LBB47_52:                              ;   in Loop: Header=BB47_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB47_53
; %bb.130:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_62
.LBB47_53:                              ;   in Loop: Header=BB47_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB47_54
; %bb.132:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_63
.LBB47_54:                              ;   in Loop: Header=BB47_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB47_55
; %bb.134:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_64
.LBB47_55:                              ;   in Loop: Header=BB47_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB47_56
; %bb.136:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_65
.LBB47_56:                              ;   in Loop: Header=BB47_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB47_58
	bra	.LBB47_59
.LBB47_57:                              ;   in Loop: Header=BB47_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB47_59
.LBB47_58:                              ;   in Loop: Header=BB47_47 Depth=1
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
.LBB47_59:                              ;   in Loop: Header=BB47_47 Depth=1
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
	beq	.LBB47_88
; %bb.138:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_47
.LBB47_88:
	jmp	.LBB47_30
.LBB47_60:                              ;   in Loop: Header=BB47_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB47_58
	bra	.LBB47_59
.LBB47_61:                              ;   in Loop: Header=BB47_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB47_59
; %bb.140:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_58
.LBB47_62:                              ;   in Loop: Header=BB47_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB47_59
; %bb.142:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_58
.LBB47_63:                              ;   in Loop: Header=BB47_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB47_59
; %bb.144:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_58
.LBB47_64:                              ;   in Loop: Header=BB47_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB47_59
; %bb.146:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_58
.LBB47_65:                              ;   in Loop: Header=BB47_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB47_59
; %bb.148:                              ;   in Loop: Header=BB47_47 Depth=1
	jmp	.LBB47_58
.Lfunc_end47:
	.size	__udivdi3, .Lfunc_end47-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB48_1
; %bb.15:
	jmp	.LBB48_13
.LBB48_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB48_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB48_14
; %bb.3:
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB48_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB48_6
; %bb.5:                                ;   in Loop: Header=BB48_4 Depth=1
	cmp	__rc2
	bcc	.LBB48_8
	bra	.LBB48_7
.LBB48_6:                               ;   in Loop: Header=BB48_4 Depth=1
	cpy	__rc4
	bcc	.LBB48_8
.LBB48_7:                               ;   in Loop: Header=BB48_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB48_4
	bra	.LBB48_9
.LBB48_8:
	ldy	__rc3
	sty	__rc2
.LBB48_9:
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB48_13
.LBB48_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB48_12
; %bb.11:                               ;   in Loop: Header=BB48_10 Depth=1
	sec
	sbc	__rc2
.LBB48_12:                              ;   in Loop: Header=BB48_10 Depth=1
	dex
	bne	.LBB48_10
.LBB48_13:
	rts
.LBB48_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end48:
	.size	__umodqi3, .Lfunc_end48-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB49_2
; %bb.1:
	ldx	__rc2
	bne	.LBB49_2
; %bb.22:
	jmp	.LBB49_19
.LBB49_2:
	cmp	__rc3
	bne	.LBB49_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB49_5
; %bb.20:
	jmp	.LBB49_19
.LBB49_4:
	cmp	__rc3
	bcs	.LBB49_5
; %bb.24:
	jmp	.LBB49_19
.LBB49_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB49_6
; %bb.26:
	jmp	.LBB49_18
.LBB49_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB49_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB49_9
; %bb.8:                                ;   in Loop: Header=BB49_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB49_11
	bra	.LBB49_10
.LBB49_9:                               ;   in Loop: Header=BB49_7 Depth=1
	cmp	__rc5
	bcc	.LBB49_11
.LBB49_10:                              ;   in Loop: Header=BB49_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB49_7
	bra	.LBB49_12
.LBB49_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB49_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB49_19
.LBB49_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB49_17
; %bb.14:                               ;   in Loop: Header=BB49_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB49_16
.LBB49_15:                              ;   in Loop: Header=BB49_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB49_16:                              ;   in Loop: Header=BB49_13 Depth=1
	dex
	bne	.LBB49_13
	bra	.LBB49_19
.LBB49_17:                              ;   in Loop: Header=BB49_13 Depth=1
	cmp	__rc5
	bcs	.LBB49_15
	bra	.LBB49_16
.LBB49_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB49_19:
	tax
	tya
	rts
.Lfunc_end49:
	.size	__umodhi3, .Lfunc_end49-__umodhi3
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
	bne	.LBB50_4
; %bb.1:
	ldx	__rc6
	bne	.LBB50_4
; %bb.2:
	ldx	__rc5
	bne	.LBB50_4
; %bb.3:
	ldx	__rc4
	bne	.LBB50_4
; %bb.42:
	jmp	.LBB50_35
.LBB50_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB50_8
; %bb.5:
	cmp	__rc6
	bne	.LBB50_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB50_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB50_11
; %bb.36:
	jmp	.LBB50_35
.LBB50_8:
	cpx	__rc7
	bcs	.LBB50_11
; %bb.38:
	jmp	.LBB50_35
.LBB50_9:
	cmp	__rc6
	bcs	.LBB50_11
; %bb.40:
	jmp	.LBB50_35
.LBB50_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB50_11
; %bb.44:
	jmp	.LBB50_35
.LBB50_11:
	ldx	__rc7
	bpl	.LBB50_12
; %bb.46:
	jmp	.LBB50_33
.LBB50_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB50_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB50_17
; %bb.14:                               ;   in Loop: Header=BB50_13 Depth=1
	cmp	__rc8
	bne	.LBB50_18
; %bb.15:                               ;   in Loop: Header=BB50_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB50_19
; %bb.16:                               ;   in Loop: Header=BB50_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB50_21
	bra	.LBB50_20
.LBB50_17:                              ;   in Loop: Header=BB50_13 Depth=1
	cpy	__rc9
	bcc	.LBB50_21
	bra	.LBB50_20
.LBB50_18:                              ;   in Loop: Header=BB50_13 Depth=1
	cmp	__rc8
	bcc	.LBB50_21
	bra	.LBB50_20
.LBB50_19:                              ;   in Loop: Header=BB50_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB50_21
.LBB50_20:                              ;   in Loop: Header=BB50_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB50_13
	bra	.LBB50_22
.LBB50_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB50_22:
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
	bne	.LBB50_23
; %bb.48:
	jmp	.LBB50_34
.LBB50_23:
	tya
.LBB50_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB50_28
; %bb.25:                               ;   in Loop: Header=BB50_24 Depth=1
	cmp	__rc8
	bne	.LBB50_31
; %bb.26:                               ;   in Loop: Header=BB50_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB50_32
; %bb.27:                               ;   in Loop: Header=BB50_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB50_29
	bra	.LBB50_30
.LBB50_28:                              ;   in Loop: Header=BB50_24 Depth=1
	cpy	__rc9
	bcc	.LBB50_30
.LBB50_29:                              ;   in Loop: Header=BB50_24 Depth=1
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
.LBB50_30:                              ;   in Loop: Header=BB50_24 Depth=1
	dex
	bne	.LBB50_24
	bra	.LBB50_35
.LBB50_31:                              ;   in Loop: Header=BB50_24 Depth=1
	cmp	__rc8
	bcs	.LBB50_29
	bra	.LBB50_30
.LBB50_32:                              ;   in Loop: Header=BB50_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB50_29
	bra	.LBB50_30
.LBB50_33:
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
	bra	.LBB50_35
.LBB50_34:
	tya
.LBB50_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end50:
	.size	__umodsi3, .Lfunc_end50-__umodsi3
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
	bne	.LBB51_8
; %bb.1:
	ldx	__rc14
	bne	.LBB51_8
; %bb.2:
	ldx	__rc13
	bne	.LBB51_8
; %bb.3:
	ldx	__rc12
	bne	.LBB51_8
; %bb.4:
	ldx	__rc11
	bne	.LBB51_8
; %bb.5:
	ldx	__rc10
	bne	.LBB51_8
; %bb.6:
	ldx	__rc9
	bne	.LBB51_8
; %bb.7:
	ldx	__rc8
	bne	.LBB51_8
; %bb.90:
	jmp	.LBB51_61
.LBB51_8:
	cmp	__rc15
	bne	.LBB51_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB51_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB51_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB51_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB51_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB51_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB51_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB51_23
; %bb.62:
	jmp	.LBB51_61
.LBB51_16:
	cmp	__rc15
	bcs	.LBB51_23
; %bb.64:
	jmp	.LBB51_61
.LBB51_17:
	cpx	__rc14
	bcs	.LBB51_23
; %bb.66:
	jmp	.LBB51_61
.LBB51_18:
	cpx	__rc13
	bcs	.LBB51_23
; %bb.68:
	jmp	.LBB51_61
.LBB51_19:
	cpx	__rc12
	bcs	.LBB51_23
; %bb.70:
	jmp	.LBB51_61
.LBB51_20:
	cpx	__rc11
	bcs	.LBB51_23
; %bb.72:
	jmp	.LBB51_61
.LBB51_21:
	cpx	__rc10
	bcs	.LBB51_23
; %bb.74:
	jmp	.LBB51_61
.LBB51_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB51_23
; %bb.92:
	jmp	.LBB51_61
.LBB51_23:
	ldx	__rc15
	bpl	.LBB51_24
; %bb.94:
	jmp	.LBB51_33
.LBB51_24:
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
.LBB51_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB51_29
; %bb.26:                               ;   in Loop: Header=BB51_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB51_30
; %bb.27:                               ;   in Loop: Header=BB51_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB51_31
; %bb.28:                               ;   in Loop: Header=BB51_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB51_76
; %bb.96:                               ;   in Loop: Header=BB51_25 Depth=1
	jmp	.LBB51_38
.LBB51_76:                              ;   in Loop: Header=BB51_25 Depth=1
	jmp	.LBB51_34
.LBB51_29:                              ;   in Loop: Header=BB51_25 Depth=1
	cmp	__rc19
	bcs	.LBB51_32
; %bb.98:
	jmp	.LBB51_42
.LBB51_30:                              ;   in Loop: Header=BB51_25 Depth=1
	cpy	__rc18
	bcs	.LBB51_32
; %bb.100:
	jmp	.LBB51_42
.LBB51_31:                              ;   in Loop: Header=BB51_25 Depth=1
	cpy	__rc7
	bcs	.LBB51_32
; %bb.102:
	jmp	.LBB51_42
.LBB51_32:                              ;   in Loop: Header=BB51_25 Depth=1
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
	bmi	.LBB51_78
; %bb.104:                              ;   in Loop: Header=BB51_25 Depth=1
	jmp	.LBB51_25
.LBB51_78:
	jmp	.LBB51_43
.LBB51_33:
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
	jmp	.LBB51_61
.LBB51_34:                              ;   in Loop: Header=BB51_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB51_39
; %bb.35:                               ;   in Loop: Header=BB51_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB51_40
; %bb.36:                               ;   in Loop: Header=BB51_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB51_41
; %bb.37:                               ;   in Loop: Header=BB51_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB51_42
; %bb.82:                               ;   in Loop: Header=BB51_25 Depth=1
	jmp	.LBB51_32
.LBB51_38:                              ;   in Loop: Header=BB51_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB51_42
; %bb.84:                               ;   in Loop: Header=BB51_25 Depth=1
	jmp	.LBB51_32
.LBB51_39:                              ;   in Loop: Header=BB51_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB51_42
; %bb.86:                               ;   in Loop: Header=BB51_25 Depth=1
	jmp	.LBB51_32
.LBB51_40:                              ;   in Loop: Header=BB51_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB51_42
; %bb.88:                               ;   in Loop: Header=BB51_25 Depth=1
	jmp	.LBB51_32
.LBB51_41:                              ;   in Loop: Header=BB51_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB51_42
; %bb.106:                              ;   in Loop: Header=BB51_25 Depth=1
	jmp	.LBB51_32
.LBB51_42:
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
.LBB51_43:
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
	bne	.LBB51_44
; %bb.108:
	jmp	.LBB51_61
.LBB51_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB51_52
; %bb.45:                               ;   in Loop: Header=BB51_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB51_46
; %bb.110:                              ;   in Loop: Header=BB51_44 Depth=1
	jmp	.LBB51_55
.LBB51_46:                              ;   in Loop: Header=BB51_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB51_47
; %bb.112:                              ;   in Loop: Header=BB51_44 Depth=1
	jmp	.LBB51_56
.LBB51_47:                              ;   in Loop: Header=BB51_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB51_48
; %bb.114:                              ;   in Loop: Header=BB51_44 Depth=1
	jmp	.LBB51_57
.LBB51_48:                              ;   in Loop: Header=BB51_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB51_49
; %bb.116:                              ;   in Loop: Header=BB51_44 Depth=1
	jmp	.LBB51_58
.LBB51_49:                              ;   in Loop: Header=BB51_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB51_50
; %bb.118:                              ;   in Loop: Header=BB51_44 Depth=1
	jmp	.LBB51_59
.LBB51_50:                              ;   in Loop: Header=BB51_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB51_51
; %bb.120:                              ;   in Loop: Header=BB51_44 Depth=1
	jmp	.LBB51_60
.LBB51_51:                              ;   in Loop: Header=BB51_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB51_53
	bra	.LBB51_54
.LBB51_52:                              ;   in Loop: Header=BB51_44 Depth=1
	cmp	__rc19
	bcc	.LBB51_54
.LBB51_53:                              ;   in Loop: Header=BB51_44 Depth=1
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
.LBB51_54:                              ;   in Loop: Header=BB51_44 Depth=1
	dex
	beq	.LBB51_61
; %bb.122:                              ;   in Loop: Header=BB51_44 Depth=1
	jmp	.LBB51_44
.LBB51_55:                              ;   in Loop: Header=BB51_44 Depth=1
	cpy	__rc18
	bcs	.LBB51_53
	bra	.LBB51_54
.LBB51_56:                              ;   in Loop: Header=BB51_44 Depth=1
	cpy	__rc7
	bcs	.LBB51_53
	bra	.LBB51_54
.LBB51_57:                              ;   in Loop: Header=BB51_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB51_53
	bra	.LBB51_54
.LBB51_58:                              ;   in Loop: Header=BB51_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB51_53
	bra	.LBB51_54
.LBB51_59:                              ;   in Loop: Header=BB51_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB51_53
	bra	.LBB51_54
.LBB51_60:                              ;   in Loop: Header=BB51_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB51_54
; %bb.124:                              ;   in Loop: Header=BB51_44 Depth=1
	jmp	.LBB51_53
.LBB51_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end51:
	.size	__umoddi3, .Lfunc_end51-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB52_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB52_2
; %bb.18:
	jmp	.LBB52_17
.LBB52_2:
	lda	__rc5
	bpl	.LBB52_3
; %bb.20:
	jmp	.LBB52_15
.LBB52_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB52_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB52_6
; %bb.5:                                ;   in Loop: Header=BB52_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB52_9
	bra	.LBB52_7
.LBB52_6:                               ;   in Loop: Header=BB52_4 Depth=1
	cpy	__rc6
	bcc	.LBB52_9
.LBB52_7:                               ;   in Loop: Header=BB52_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB52_4
	bra	.LBB52_10
.LBB52_8:
	sty	__rc7
	bra	.LBB52_17
.LBB52_9:
	ldy	__rc5
	sty	__rc4
.LBB52_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB52_16
; %bb.11:
	lda	#1
.LBB52_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB52_14
; %bb.13:                               ;   in Loop: Header=BB52_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB52_14:                              ;   in Loop: Header=BB52_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB52_12
	bra	.LBB52_17
.LBB52_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB52_16:
	lda	#1
.LBB52_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end52:
	.size	__udivmodqi4, .Lfunc_end52-__udivmodqi4
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
	bne	.LBB53_2
; %bb.1:
	ldx	__rc2
	beq	.LBB53_4
.LBB53_2:
	cmp	__rc3
	bne	.LBB53_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB53_6
.LBB53_4:
	ldx	#0
; %bb.26:
	jmp	.LBB53_24
.LBB53_5:
	cmp	__rc3
	bcc	.LBB53_4
.LBB53_6:
	tay
	ldx	__rc3
	bpl	.LBB53_7
; %bb.28:
	jmp	.LBB53_22
.LBB53_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB53_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB53_10
; %bb.9:                                ;   in Loop: Header=BB53_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB53_11
	bra	.LBB53_12
.LBB53_10:                              ;   in Loop: Header=BB53_8 Depth=1
	cmp	__rc8
	bcc	.LBB53_12
.LBB53_11:                              ;   in Loop: Header=BB53_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB53_8
	bra	.LBB53_13
.LBB53_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB53_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB53_14
; %bb.30:
	jmp	.LBB53_23
.LBB53_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB53_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB53_17
; %bb.16:                               ;   in Loop: Header=BB53_15 Depth=1
	ldy	#0
.LBB53_17:                              ;   in Loop: Header=BB53_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB53_21
; %bb.18:                               ;   in Loop: Header=BB53_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB53_20
.LBB53_19:                              ;   in Loop: Header=BB53_15 Depth=1
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
.LBB53_20:                              ;   in Loop: Header=BB53_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB53_15
	bra	.LBB53_25
.LBB53_21:                              ;   in Loop: Header=BB53_15 Depth=1
	cmp	__rc8
	bcs	.LBB53_19
	bra	.LBB53_20
.LBB53_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB53_23:
	ldx	#1
.LBB53_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB53_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end53:
	.size	__udivmodhi4, .Lfunc_end53-__udivmodhi4
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
	bpl	.LBB54_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB54_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB54_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB54_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB54_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB54_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB54_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB54_8:
	lda	__rc2
	rts
.Lfunc_end54:
	.size	__divqi3, .Lfunc_end54-__divqi3
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
	bmi	.LBB55_2
; %bb.1:
	bra	.LBB55_6
.LBB55_2:
	cpx	#128
	bne	.LBB55_5
; %bb.3:
	lda	__rc4
	bne	.LBB55_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB55_6
.LBB55_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB55_6:
	tya
	bmi	.LBB55_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB55_12
.LBB55_8:
	cpy	#128
	bne	.LBB55_11
; %bb.9:
	lda	__rc2
	bne	.LBB55_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB55_12
.LBB55_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB55_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB55_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB55_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end55:
	.size	__divhi3, .Lfunc_end55-__divhi3
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
	bmi	.LBB56_2
; %bb.1:
	ldy	__rc3
	bra	.LBB56_8
.LBB56_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB56_7
; %bb.3:
	lda	__rc2
	bne	.LBB56_7
; %bb.4:
	lda	__rc8
	bne	.LBB56_7
; %bb.5:
	lda	__rc9
	bne	.LBB56_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB56_8
.LBB56_7:
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
.LBB56_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB56_10
; %bb.9:
	lda	__rc7
	bra	.LBB56_16
.LBB56_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB56_15
; %bb.11:
	lda	__rc6
	bne	.LBB56_15
; %bb.12:
	lda	__rc5
	bne	.LBB56_15
; %bb.13:
	lda	__rc4
	bne	.LBB56_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB56_16
.LBB56_15:
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
.LBB56_16:
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
	bne	.LBB56_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB56_19
.LBB56_18:
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
.LBB56_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end56:
	.size	__divsi3, .Lfunc_end56-__divsi3
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
	bmi	.LBB57_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB57_12
.LBB57_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB57_11
; %bb.3:
	lda	__rc6
	bne	.LBB57_11
; %bb.4:
	lda	__rc5
	bne	.LBB57_11
; %bb.5:
	lda	__rc4
	bne	.LBB57_11
; %bb.6:
	lda	__rc3
	bne	.LBB57_11
; %bb.7:
	lda	__rc2
	bne	.LBB57_11
; %bb.8:
	lda	__rc18
	bne	.LBB57_11
; %bb.9:
	lda	__rc19
	bne	.LBB57_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB57_12
.LBB57_11:
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
.LBB57_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB57_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB57_24
.LBB57_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB57_23
; %bb.15:
	lda	__rc14
	bne	.LBB57_23
; %bb.16:
	lda	__rc13
	bne	.LBB57_23
; %bb.17:
	lda	__rc12
	bne	.LBB57_23
; %bb.18:
	lda	__rc11
	bne	.LBB57_23
; %bb.19:
	lda	__rc10
	bne	.LBB57_23
; %bb.20:
	lda	__rc9
	bne	.LBB57_23
; %bb.21:
	lda	__rc8
	bne	.LBB57_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB57_24
.LBB57_23:
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
.LBB57_24:
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
	bne	.LBB57_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB57_27
.LBB57_26:
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
.LBB57_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end57:
	.size	__divdi3, .Lfunc_end57-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB58_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB58_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB58_3:
	tay
	lda	__rc2
	bmi	.LBB58_5
; %bb.4:
	lda	__rc2
	bra	.LBB58_7
.LBB58_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB58_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB58_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB58_9
; %bb.8:
	rts
.LBB58_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end58:
	.size	__modqi3, .Lfunc_end58-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB59_2
; %bb.1:
	txa
	bra	.LBB59_6
.LBB59_2:
	cpx	#128
	bne	.LBB59_5
; %bb.3:
	lda	__rc4
	bne	.LBB59_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB59_6
.LBB59_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB59_6:
	ldx	__rc3
	bpl	.LBB59_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB59_10
; %bb.8:
	ldx	__rc2
	bne	.LBB59_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB59_11
.LBB59_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB59_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB59_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB59_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end59:
	.size	__modhi3, .Lfunc_end59-__modhi3
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
	bmi	.LBB60_2
; %bb.1:
	lda	__rc3
	bra	.LBB60_8
.LBB60_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB60_7
; %bb.3:
	lda	__rc2
	bne	.LBB60_7
; %bb.4:
	lda	__rc8
	bne	.LBB60_7
; %bb.5:
	lda	__rc9
	bne	.LBB60_7
; %bb.6:
	stz	__rc9
	lda	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB60_8
.LBB60_7:
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
.LBB60_8:
	ldx	__rc7
	bpl	.LBB60_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB60_14
; %bb.10:
	ldx	__rc6
	bne	.LBB60_14
; %bb.11:
	ldx	__rc5
	bne	.LBB60_14
; %bb.12:
	ldx	__rc4
	bne	.LBB60_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB60_15
.LBB60_14:
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
.LBB60_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB60_17
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
.LBB60_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end60:
	.size	__modsi3, .Lfunc_end60-__modsi3
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
	bmi	.LBB61_2
; %bb.1:
	lda	__rc7
; %bb.26:
	jmp	.LBB61_12
.LBB61_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB61_11
; %bb.3:
	lda	__rc6
	bne	.LBB61_11
; %bb.4:
	lda	__rc5
	bne	.LBB61_11
; %bb.5:
	lda	__rc4
	bne	.LBB61_11
; %bb.6:
	lda	__rc3
	bne	.LBB61_11
; %bb.7:
	lda	__rc2
	bne	.LBB61_11
; %bb.8:
	lda	__rc18
	bne	.LBB61_11
; %bb.9:
	lda	__rc19
	bne	.LBB61_11
; %bb.10:
	stz	__rc19
	lda	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB61_12
.LBB61_11:
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
.LBB61_12:
	ldx	__rc15
	bmi	.LBB61_13
; %bb.28:
	jmp	.LBB61_23
.LBB61_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB61_22
; %bb.14:
	ldx	__rc14
	bne	.LBB61_22
; %bb.15:
	ldx	__rc13
	bne	.LBB61_22
; %bb.16:
	ldx	__rc12
	bne	.LBB61_22
; %bb.17:
	ldx	__rc11
	bne	.LBB61_22
; %bb.18:
	ldx	__rc10
	bne	.LBB61_22
; %bb.19:
	ldx	__rc9
	bne	.LBB61_22
; %bb.20:
	ldx	__rc8
	bne	.LBB61_22
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
	bra	.LBB61_23
.LBB61_22:
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
.LBB61_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB61_25
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
.LBB61_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end61:
	.size	__moddi3, .Lfunc_end61-__moddi3
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
	bpl	.LBB62_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB62_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB62_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB62_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB62_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB62_11
.LBB62_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB62_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB62_8
; %bb.34:
	jmp	.LBB62_24
.LBB62_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB62_24
.LBB62_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB62_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB62_12
.LBB62_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB62_24
.LBB62_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB62_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB62_15
; %bb.14:                               ;   in Loop: Header=BB62_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB62_18
	bra	.LBB62_16
.LBB62_15:                              ;   in Loop: Header=BB62_13 Depth=1
	cmp	__rc7
	bcc	.LBB62_18
.LBB62_16:                              ;   in Loop: Header=BB62_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB62_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB62_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB62_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB62_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB62_22
; %bb.21:                               ;   in Loop: Header=BB62_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB62_22:                              ;   in Loop: Header=BB62_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB62_20
	bra	.LBB62_24
.LBB62_23:
	sta	__rc7
	sty	__rc6
.LBB62_24:
	lda	__rc4
	bmi	.LBB62_26
; %bb.25:
	lda	__rc7
	bra	.LBB62_27
.LBB62_26:
	lda	#0
	sec
	sbc	__rc7
.LBB62_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB62_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB62_29:
	lda	__rc6
	rts
.Lfunc_end62:
	.size	__divmodqi4, .Lfunc_end62-__divmodqi4
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
	bmi	.LBB63_2
.LBB63_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB63_6
.LBB63_2:
	cpx	#128
	bne	.LBB63_5
; %bb.3:
	lda	__rc7
	bne	.LBB63_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB63_1
.LBB63_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB63_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB63_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB63_15
; %bb.8:
	lda	__rc2
	bne	.LBB63_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB63_18
.LBB63_10:
	cpy	#128
	bne	.LBB63_14
; %bb.11:
	ldy	__rc2
	bne	.LBB63_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB63_13
; %bb.48:
	jmp	.LBB63_45
.LBB63_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB63_18
.LBB63_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB63_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB63_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB63_20
.LBB63_17:
	sta	__rc11
.LBB63_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB63_39
.LBB63_19:
	cmp	__rc7
	bcc	.LBB63_17
.LBB63_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB63_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB63_23
; %bb.22:                               ;   in Loop: Header=BB63_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB63_24
	bra	.LBB63_26
.LBB63_23:                              ;   in Loop: Header=BB63_21 Depth=1
	cmp	__rc9
	bcc	.LBB63_26
.LBB63_24:                              ;   in Loop: Header=BB63_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB63_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB63_27
.LBB63_26:
	tay
.LBB63_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB63_28
; %bb.50:
	jmp	.LBB63_37
.LBB63_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB63_32
.LBB63_29:                              ;   in Loop: Header=BB63_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB63_36
.LBB63_30:                              ;   in Loop: Header=BB63_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB63_31:                              ;   in Loop: Header=BB63_32 Depth=1
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
	beq	.LBB63_39
.LBB63_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB63_34
; %bb.33:                               ;   in Loop: Header=BB63_32 Depth=1
	ldy	#0
.LBB63_34:                              ;   in Loop: Header=BB63_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB63_29
; %bb.35:                               ;   in Loop: Header=BB63_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB63_30
.LBB63_36:                              ;   in Loop: Header=BB63_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB63_31
.LBB63_37:
	sta	__rc11
	ldx	#1
.LBB63_38:
	stx	__rc9
.LBB63_39:
	lda	__rc6
	bmi	.LBB63_41
; %bb.40:
	lda	__rc10
	bra	.LBB63_42
.LBB63_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB63_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB63_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB63_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB63_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB63_38
.Lfunc_end63:
	.size	__divmodhi4, .Lfunc_end63-__divmodhi4
                                        ; -- End function
	.type	offsCurrIdx,@object             ; @offsCurrIdx
	.section	.zp.bss.offsCurrIdx,"aw",@nobits
	.globl	offsCurrIdx
offsCurrIdx:
	.byte	0                               ; 0x0
	.size	offsCurrIdx, 1

	.type	flagCurrSec,@object             ; @flagCurrSec
	.section	.zp.bss.flagCurrSec,"aw",@nobits
	.globl	flagCurrSec
flagCurrSec:
	.byte	0                               ; 0x0
	.size	flagCurrSec, 1

	.type	datNextTrk,@object              ; @datNextTrk
	.section	.zp.bss.datNextTrk,"aw",@nobits
datNextTrk:
	.byte	0                               ; 0x0
	.size	datNextTrk, 1

	.type	datNextSec,@object              ; @datNextSec
	.section	.zp.bss.datNextSec,"aw",@nobits
datNextSec:
	.byte	0                               ; 0x0
	.size	datNextSec, 1

	.type	BAMsector,@object               ; @BAMsector
	.section	.zp.bss.BAMsector,"aw",@nobits
BAMsector:
	.zero	4
	.size	BAMsector, 4

	.type	worksector,@object              ; @worksector
	.section	.zp.bss.worksector,"aw",@nobits
worksector:
	.zero	4
	.size	worksector, 4

	.type	worksectorasBAM,@object         ; @worksectorasBAM
	.section	.zp.bss.worksectorasBAM,"aw",@nobits
worksectorasBAM:
	.zero	4
	.size	worksectorasBAM, 4

	.type	ptrMiniOffs,@object             ; @ptrMiniOffs
	.section	.zp.bss.ptrMiniOffs,"aw",@nobits
ptrMiniOffs:
	.long	0                               ; 0x0
	.size	ptrMiniOffs, 4

	.type	.L.str,@object                  ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"_miniinit 32addr is: "
	.size	.L.str, 22

	.type	.L.str.1,@object                ; @.str.1
.L.str.1:
	.asciz	" "
	.size	.L.str.1, 2

	.type	.L.str.6,@object                ; @.str.6
.L.str.6:
	.asciz	"Begin ReadSector."
	.size	.L.str.6, 18

	.type	.L.str.7,@object                ; @.str.7
.L.str.7:
	.asciz	" p="
	.size	.L.str.7, 4

	.type	.L.str.8,@object                ; @.str.8
.L.str.8:
	.asciz	"GetWholeSector before ReadSector."
	.size	.L.str.8, 34

	.type	.L.str.9,@object                ; @.str.9
.L.str.9:
	.asciz	"GetWholeSector before lower buffer. Track="
	.size	.L.str.9, 43

	.type	.L.str.10,@object               ; @.str.10
.L.str.10:
	.asciz	" Sector="
	.size	.L.str.10, 9

	.type	.L.str.11,@object               ; @.str.11
.L.str.11:
	.asciz	"GetWholeSector before upper buffer. Track="
	.size	.L.str.11, 43

	.type	.L.str.12,@object               ; @.str.12
.L.str.12:
	.asciz	"GetWholeSector done."
	.size	.L.str.12, 21

	.type	.L.str.13,@object               ; @.str.13
.L.str.13:
	.asciz	"PutWholeSector before lower buffer. Track="
	.size	.L.str.13, 43

	.type	.L.str.14,@object               ; @.str.14
.L.str.14:
	.asciz	"PutWholeSector before upper buffer. Track="
	.size	.L.str.14, 43

	.type	.L.str.15,@object               ; @.str.15
.L.str.15:
	.asciz	"PutWholeSector done. Returning while WriteSector."
	.size	.L.str.15, 50

	.type	.L.str.32,@object               ; @.str.32
.L.str.32:
	.asciz	"Before GetWholeSector."
	.size	.L.str.32, 23

	.type	BAMside,@object                 ; @BAMside
	.section	.zp.bss.BAMside,"aw",@nobits
BAMside:
	.byte	0                               ; 0x0
	.size	BAMside, 1

	.type	i,@object                       ; @i
	.section	.zp.bss.i,"aw",@nobits
i:
	.byte	0                               ; 0x0
	.size	i, 1

	.type	.L.str.33,@object               ; @.str.33
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.33:
	.asciz	"Begin GetWholeSector worksectorasBAM. "
	.size	.L.str.33, 39

	.type	workside,@object                ; @workside
	.section	.zp.bss.workside,"aw",@nobits
workside:
	.byte	0                               ; 0x0
	.size	workside, 1

	.type	.L.str.34,@object               ; @.str.34
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.34:
	.asciz	"worksectorasBAM done."
	.size	.L.str.34, 22

	.type	.L.str.35,@object               ; @.str.35
.L.str.35:
	.asciz	"datNextTrk: "
	.size	.L.str.35, 13

	.type	.L.str.36,@object               ; @.str.36
.L.str.36:
	.asciz	" ws->data[1]: "
	.size	.L.str.36, 15

	.type	.L.str.37,@object               ; @.str.37
.L.str.37:
	.asciz	"BAMSectorUpdate done."
	.size	.L.str.37, 22

	.type	.L.str.38,@object               ; @.str.38
.L.str.38:
	.asciz	"testsectors: sector "
	.size	.L.str.38, 21

	.type	.L.str.39,@object               ; @.str.39
.L.str.39:
	.asciz	" workside "
	.size	.L.str.39, 11

	.type	.L.str.40,@object               ; @.str.40
.L.str.40:
	.asciz	" bytes "
	.size	.L.str.40, 8

	.type	.L.str.41,@object               ; @.str.41
.L.str.41:
	.asciz	" testsectors: "
	.size	.L.str.41, 15

	.type	.L.str.42,@object               ; @.str.42
.L.str.42:
	.asciz	"PutWholeSector done."
	.size	.L.str.42, 21

	.type	.L.str.43,@object               ; @.str.43
.L.str.43:
	.asciz	"testsectors done, datNextTrk "
	.size	.L.str.43, 30

	.type	.L.str.44,@object               ; @.str.44
.L.str.44:
	.asciz	" datNextSec "
	.size	.L.str.44, 13

	.type	.L.str.45,@object               ; @.str.45
.L.str.45:
	.asciz	" BAMside "
	.size	.L.str.45, 10

	.type	readdir_dirent,@object          ; @readdir_dirent
	.section	.rodata.readdir_dirent,"a",@progbits
	.globl	readdir_dirent
readdir_dirent:
	.short	6656
	.size	readdir_dirent, 2

	.type	fnamehi,@object                 ; @fnamehi
	.section	.zp.bss.fnamehi,"aw",@nobits
fnamehi:
	.byte	0                               ; 0x0
	.size	fnamehi, 1

	.type	.L.str.48,@object               ; @.str.48
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.48:
	.asciz	"UPPERCASE lowercase."
	.size	.L.str.48, 21

	.type	.L.str.49,@object               ; @.str.49
.L.str.49:
	.asciz	"hyppo_setname is: "
	.size	.L.str.49, 19

	.type	.L.str.50,@object               ; @.str.50
.L.str.50:
	.asciz	"DATADISK.d81"
	.size	.L.str.50, 13

	.type	.L.str.51,@object               ; @.str.51
.L.str.51:
	.asciz	" hyppofn: "
	.size	.L.str.51, 11

	.type	.L.str.52,@object               ; @.str.52
.L.str.52:
	.asciz	"DATADISK.D81"
	.size	.L.str.52, 13

	.type	.L.str.53,@object               ; @.str.53
.L.str.53:
	.asciz	" hyppo_d81attach1 is: "
	.size	.L.str.53, 23

	.type	.L.str.54,@object               ; @.str.54
.L.str.54:
	.asciz	"hyppo_selectdrive "
	.size	.L.str.54, 19

	.type	.L.str.55,@object               ; @.str.55
.L.str.55:
	.asciz	" is: "
	.size	.L.str.55, 6

	.type	.L.str.56,@object               ; @.str.56
.L.str.56:
	.asciz	"hyppo_getcurrentdrive is: "
	.size	.L.str.56, 27

	.type	.L.str.57,@object               ; @.str.57
.L.str.57:
	.asciz	"hyppo_opendir, file descriptor is: "
	.size	.L.str.57, 36

	.type	.L.str.58,@object               ; @.str.58
.L.str.58:
	.asciz	"hyppo_readdir, err is: "
	.size	.L.str.58, 24

	.type	.L.str.59,@object               ; @.str.59
.L.str.59:
	.asciz	"filename is: "
	.size	.L.str.59, 14

	.type	.L.str.60,@object               ; @.str.60
.L.str.60:
	.asciz	"filenamelength is: "
	.size	.L.str.60, 20

	.type	.L.str.61,@object               ; @.str.61
.L.str.61:
	.asciz	"hyppo_closedir is: "
	.size	.L.str.61, 20

	.type	.L.str.62,@object               ; @.str.62
.L.str.62:
	.asciz	"Enter track number 1..80, 0 to quit:"
	.size	.L.str.62, 37

	.type	.L.str.63,@object               ; @.str.63
.L.str.63:
	.asciz	"Enter sector number 0..39:"
	.size	.L.str.63, 27

	.type	.L.str.64,@object               ; @.str.64
.L.str.64:
	.asciz	"Have fun with your Mega65!"
	.size	.L.str.64, 27

	.type	.Lswitch.table.asciitoscreencode_s,@object ; @switch.table.asciitoscreencode_s
	.section	.zp.rodata..Lswitch.table.asciitoscreencode_s,"a",@progbits
.Lswitch.table.asciitoscreencode_s:
	.ascii	"\033i\035dd"
	.size	.Lswitch.table.asciitoscreencode_s, 5

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

	.type	g_curTextColor,@object          ; @g_curTextColor
	.section	.zp.data.g_curTextColor,"aw",@progbits
g_curTextColor:
	.byte	1                               ; 0x1
	.size	g_curTextColor, 1

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
	.zero	32
	.size	.Lzp_stack, 32

.set .L__udivmodhi4_zp_stk, .Lzp_stack+30
	.size	.L__udivmodhi4_zp_stk, 1
.set .Lcputsxy_zp_stk, .Lzp_stack+21
	.size	.Lcputsxy_zp_stk, 9
.set .Lcputln_zp_stk, .Lzp_stack
	.size	.Lcputln_zp_stk, 6
.set .Lclrscr_zp_stk, .Lzp_stack
	.size	.Lclrscr_zp_stk, 3
.set .Lcputhex_zp_stk, .Lzp_stack
	.size	.Lcputhex_zp_stk, 10
.set .Lmprintf_zp_stk, .Lzp_stack
	.size	.Lmprintf_zp_stk, 21
.set .Latoi_zp_stk, .Lzp_stack
	.size	.Latoi_zp_stk, 8
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

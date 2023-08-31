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
	sta	mos8(.Lmprintf_zp_stk)
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
	tay
	adc	#165
	tax
	tya
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
	stx	mos8(.Lmprintf_zp_stk+24)       ; 1-byte Folded Spill
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jsr	cputsxy
	stz	mos8(.Lmprintf_zp_stk+19)
	stz	mos8(.Lmprintf_zp_stk+4)
.LBB1_13:                               ; =>This Inner Loop Header: Depth=1
	ldx	#mos8(.Lmprintf_zp_stk+20)
	stx	__rc8
	ldx	#mos8(0)
	stx	__rc9
	ldx	mos8(.Lmprintf_zp_stk+1)
	stx	mos8(.Lmprintf_zp_stk+5)
	ldx	mos8(.Lmprintf_zp_stk)
	stx	mos8(.Lmprintf_zp_stk+6)
	ldx	mos8(.Lmprintf_zp_stk+2)
	stx	__rc2
	ldx	mos8(.Lmprintf_zp_stk+2)
	stx	mos8(.Lmprintf_zp_stk+8)
	ldx	mos8(.Lmprintf_zp_stk+3)
	stx	__rc3
	ldx	mos8(.Lmprintf_zp_stk+3)
	stx	mos8(.Lmprintf_zp_stk+7)
	ldx	#10
	stx	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	ldx	mos8(.Lmprintf_zp_stk+1)
	lda	mos8(.Lmprintf_zp_stk)
	jsr	__divmodsi4
	sta	mos8(.Lmprintf_zp_stk)
	stx	mos8(.Lmprintf_zp_stk+1)
	ldx	__rc2
	stx	mos8(.Lmprintf_zp_stk+2)
	ldx	__rc3
	stx	mos8(.Lmprintf_zp_stk+3)
	ldx	mos8(.Lmprintf_zp_stk+20)
	lda	hexDigits,x
	ldx	mos8(.Lmprintf_zp_stk+24)       ; 1-byte Folded Reload
	sta	mos8(.Lmprintf_zp_stk+9),x
	stx	__rc2
	dec	__rc2
	clc
	lda	mos8(.Lmprintf_zp_stk+6)
	adc	#9
	sta	__rc3
	lda	mos8(.Lmprintf_zp_stk+5)
	adc	#0
	sta	__rc4
	lda	mos8(.Lmprintf_zp_stk+8)
	adc	#0
	tay
	lda	mos8(.Lmprintf_zp_stk+7)
	adc	#0
	bne	.LBB1_19
; %bb.14:                               ;   in Loop: Header=BB1_13 Depth=1
	tya
	bne	.LBB1_17
; %bb.15:                               ;   in Loop: Header=BB1_13 Depth=1
	lda	__rc4
	bne	.LBB1_18
; %bb.16:                               ;   in Loop: Header=BB1_13 Depth=1
	ldx	__rc3
	cpx	#19
	bra	.LBB1_20
.LBB1_17:                               ;   in Loop: Header=BB1_13 Depth=1
	cpy	#0
	bra	.LBB1_20
.LBB1_18:                               ;   in Loop: Header=BB1_13 Depth=1
	lda	__rc4
.LBB1_19:                               ;   in Loop: Header=BB1_13 Depth=1
	cmp	#0
.LBB1_20:                               ;   in Loop: Header=BB1_13 Depth=1
	ldx	__rc2
	stx	mos8(.Lmprintf_zp_stk+24)       ; 1-byte Folded Spill
	bcc	.LBB1_21
; %bb.24:                               ;   in Loop: Header=BB1_13 Depth=1
	jmp	.LBB1_13
.LBB1_21:
	lda	#mos8(.Lmprintf_zp_stk+9)
	clc
	adc	__rc2
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
	.section	.text.mcbox,"ax",@progbits
	.type	mcbox,@function                 ; -- Begin function mcbox
mcbox:                                  ; @mcbox
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#250
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
	pla
	sta	__rc24
	stx	__rc22
	ldx	__rc2
	ldy	__rc3
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	sec
	stx	__rc23
	txa
	sbc	__rc24
	sta	__rc26
	sty	__rc27
	cpy	__rc22
	bcs	.LBB2_1
; %bb.16:
	jmp	.LBB2_3
.LBB2_1:
	stz	__rc20
	ldx	__rc22
	stx	__rc21
.LBB2_2:                                ; =>This Inner Loop Header: Depth=1
	lda	mos8(g_curScreenW)
	ldx	__rc21
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	__rc24
	sta	__rc28
	txa
	adc	#0
	sta	__rc29
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
	lda	__rc28
	adc	#0
	tax
	lda	__rc29
	adc	__rc2
	sta	__rc5
	lda	__rc4
	adc	#0
	sta	__rc2
	tya
	adc	#0
	sta	__rc4
	txa
	clc
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
	ldx	__rc26
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
	ldx	__rc26
	stx	__rc5
	stz	__rc6
	ldx	__rc29
	lda	__rc28
	jsr	lfill
	inc	__rc21
	ldx	__rc27
	cpx	__rc21
	bcc	.LBB2_3
; %bb.18:                               ;   in Loop: Header=BB2_2 Depth=1
	jmp	.LBB2_2
.LBB2_3:
	ldx	#112
	stx	__rc2
	ldx	__rc22
	lda	__rc24
	jsr	cputcxy
	ldx	#109
	stx	__rc2
	ldx	__rc27
	lda	__rc24
	jsr	cputcxy
	ldx	#110
	stx	__rc2
	ldx	__rc22
	ldy	__rc23
	sty	__rc20
	lda	__rc23
	jsr	cputcxy
	ldx	#125
	stx	__rc2
	ldx	__rc27
	lda	__rc23
	jsr	cputcxy
	ldx	__rc24
	stx	__rc25
	ldy	__rc24
	iny
.LBB2_4:                                ; =>This Inner Loop Header: Depth=1
	ldx	#64
	stx	__rc2
	ldx	__rc22
	sty	__rc21
	tya
	jsr	cputcxy
	ldx	#64
	stx	__rc2
	ldx	__rc27
	lda	__rc21
	jsr	cputcxy
	ldy	__rc21
	iny
	cpy	__rc20
	bne	.LBB2_4
; %bb.5:
	ldx	__rc22
	stx	__rc21
	inc	__rc21
	ldx	__rc21
	ldy	__rc24
	sty	__rc22
.LBB2_6:                                ; =>This Inner Loop Header: Depth=1
	ldy	#93
	sty	__rc2
	stx	__rc24
	lda	__rc22
	jsr	cputcxy
	ldx	#93
	stx	__rc2
	ldx	__rc24
	lda	__rc23
	jsr	cputcxy
	ldx	__rc24
	inx
	cpx	__rc27
	bne	.LBB2_6
; %bb.7:
	lda	__rc27
	cmp	mos8(g_curScreenH)
	bcc	.LBB2_8
; %bb.20:
	jmp	.LBB2_15
.LBB2_8:
	ldx	mos8(g_curScreenW)
	stx	__rc2
	ldx	__rc23
	cpx	__rc2
	bcc	.LBB2_9
; %bb.22:
	jmp	.LBB2_15
.LBB2_9:
	stz	__rc3
	stz	__rc20
	tax
	ldy	#0
	inx
	bne	.LBB2_11
; %bb.10:
	iny
.LBB2_11:
	txa
	sty	__rc27
	ldx	__rc27
	sta	__rc24
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	clc
	lda	__rc25
	adc	#1
	tax
	lda	#0
	adc	#0
	sta	__rc4
	lda	#0
	adc	#248
	sta	__rc5
	lda	#0
	adc	#15
	sta	__rc6
	clc
	txa
	adc	__rc2
	tay
	lda	__rc4
	adc	__rc3
	sta	__rc7
	lda	__rc5
	adc	#0
	sta	__rc2
	lda	__rc6
	adc	#0
	ldx	#11
	sta	__rc3
	lda	__rc26
	sta	__rc5
	stx	__rc4
	stz	__rc6
	ldx	__rc7
	tya
	jsr	lfill
	ldx	__rc23
	stx	__rc22
	inc	__rc22
.LBB2_12:                               ; =>This Inner Loop Header: Depth=1
	lda	mos8(g_curScreenW)
	ldx	__rc21
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	__rc22
	tay
	txa
	adc	__rc20
	sta	__rc5
	lda	#248
	adc	#0
	sta	__rc2
	lda	#15
	adc	#0
	sta	__rc3
	ldx	#11
	stx	__rc4
	ldx	__rc5
	tya
	jsr	lpoke
	inc	__rc21
	ldy	__rc27
	bne	.LBB2_14
; %bb.13:                               ;   in Loop: Header=BB2_12 Depth=1
	ldx	__rc24
	cpx	__rc21
	bcs	.LBB2_12
	bra	.LBB2_15
.LBB2_14:                               ;   in Loop: Header=BB2_12 Depth=1
	cpy	#0
	bcs	.LBB2_12
.LBB2_15:
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
	adc	#6
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end2:
	.size	mcbox, .Lfunc_end2-mcbox
                                        ; -- End function
	.section	.text.messagebox,"ax",@progbits
	.type	messagebox,@function            ; -- Begin function messagebox
messagebox:                             ; @messagebox
; %bb.0:
	ldx	__rc20
	phx
	ldx	__rc21
	phx
	ldx	__rc22
	phx
	ldx	__rc23
	phx
	ldx	__rc2
	stx	__rc22
	ldx	__rc3
	stx	__rc23
	ldx	#52
	stx	__rc20
	ldx	#3
	stx	__rc21
	lda	#4
	ldy	#70
	ldx	#9
	sty	__rc2
	stx	__rc3
	tax
	lda	#10
	jsr	mcbox
	ldx	#12
	stx	mos8(g_curX)
	ldx	#5
	stx	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB3_8
.LBB3_1:                                ;   in Loop: Header=BB3_8 Depth=1
	cmp	#96
	bcc	.LBB3_3
; %bb.2:                                ;   in Loop: Header=BB3_8 Depth=1
	clc
	adc	#160
	bra	.LBB3_5
.LBB3_3:                                ;   in Loop: Header=BB3_8 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_5
; %bb.4:                                ;   in Loop: Header=BB3_8 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_5:                                ;   in Loop: Header=BB3_8 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB3_7
; %bb.6:                                ;   in Loop: Header=BB3_8 Depth=1
	inc	__rc3
.LBB3_7:                                ;   in Loop: Header=BB3_8 Depth=1
	tax
	beq	.LBB3_12
.LBB3_8:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB3_10
; %bb.9:                                ;   in Loop: Header=BB3_8 Depth=1
	inc	__rc23
.LBB3_10:                               ;   in Loop: Header=BB3_8 Depth=1
	cmp	#192
	bcc	.LBB3_1
; %bb.11:                               ;   in Loop: Header=BB3_8 Depth=1
	eor	#128
	bra	.LBB3_5
.LBB3_12:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#1
	stx	mos8(g_curX)
	ldx	#10
	stx	mos8(g_curY)
	plx
	stx	__rc23
	plx
	stx	__rc22
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.Lfunc_end3:
	.size	messagebox, .Lfunc_end3-messagebox
                                        ; -- End function
	.section	.text.getdirent,"ax",@progbits
	.type	getdirent,@function             ; -- Begin function getdirent
getdirent:                              ; @getdirent
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
	stz	BAMsector
	ldx	#22
	stx	BAMsector+1
	stz	BAMsector+2
	inx
	stx	BAMsector+3
	stz	worksector
	inx
	stx	worksector+1
	stz	worksector+2
	ldy	#25
	sty	worksector+3
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	direntryblock.0
	iny
	sty	direntryblock.0+1
	stz	offsCurrIdx
	stz	flagCurrSec
	stz	ptrMiniOffs
	ldy	#108
	sty	ptrMiniOffs+1
	ldy	#253
	sty	ptrMiniOffs+2
	ldy	#15
	sty	ptrMiniOffs+3
	;APP
	lda	#0
	sta	53376

	;NO_APP
	lda	#22
	sta	BAMsector+1
	inc
	sta	BAMsector+3
	lda	#25
	sta	worksector+3
	stx	worksector+1
	stx	mos8(worksectorasBAM.0+1)
	ldx	#26
	stx	direntryblock.0+1
	ldx	#108
	stx	ptrMiniOffs+1
	ldx	#253
	stx	ptrMiniOffs+2
	sty	ptrMiniOffs+3
	stz	__rc20
	stz	BAMsector
	stz	BAMsector+2
	stz	worksector
	stz	worksector+2
	stz	mos8(worksectorasBAM.0)
	stz	direntryblock.0
	stz	offsCurrIdx
	stz	flagCurrSec
	stz	ptrMiniOffs
	;APP
	lda	#0
	sta	53376

	;NO_APP
	ldx	#mos16lo(.L.str.48)
	stx	__rc2
	ldx	#mos16hi(.L.str.48)
	stx	__rc3
	lda	#40
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	ldx	#mos16lo(.L.str.49)
	stx	__rc2
	ldx	#mos16hi(.L.str.49)
	stx	__rc3
	lda	#3
	stz	__rc4
	stz	__rc5
	ldx	#0
	tay
	pha
	tya
	ldy	#0
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	jsr	mprintf
	jsr	cputln
	lda	#40
	stz	mos8(i)
.LBB4_1:                                ; =>This Inner Loop Header: Depth=1
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	pha
	ldy	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	jsr	GetWholeSector
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(worksector)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(worksector)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc4
	sta	__rc10
	ldy	#1
	lda	(__rc2),y
	sta	__rc5
	sta	__rc11
	ldx	mos8(i)
	lda	(__rc4)
	sta	__rc21
	lda	(__rc4),y
	phy
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	stx	__rc5
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc6
	ldx	#8
	stx	__rc7
	stz	__rc8
	sty	__rc9
	ldx	__rc11
	lda	__rc10
	jsr	lcopy
	lda	__rc21
	beq	.LBB4_6
; %bb.2:                                ;   in Loop: Header=BB4_1 Depth=1
	lda	__rc21
	ldx	mos8(i)
	inx
	inc	mos8(i)
	cpx	#14
	bcs	.LBB4_3
; %bb.12:                               ;   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_1
.LBB4_3:
	ldx	#mos16lo(.L.str.50)
	stx	__rc2
	ldx	#mos16hi(.L.str.50)
	stx	__rc3
	jsr	messagebox
.LBB4_4:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_4
; %bb.5:
	stz	54800
.LBB4_6:
	lda	#112
	sta	mos8(i)
	ldx	#0
	stx	__rc20
	ldx	#0
	stx	__rc21
.LBB4_7:                                ; =>This Inner Loop Header: Depth=1
	jsr	getdirententry
	ldx	__rc3
	lda	mos8(i)
	cpx	__rc21
	bne	.LBB4_11
; %bb.8:                                ;   in Loop: Header=BB4_7 Depth=1
	ldx	__rc2
	cpx	__rc20
	bne	.LBB4_11
; %bb.9:                                ;   in Loop: Header=BB4_7 Depth=1
	dec
	sta	mos8(i)
	bne	.LBB4_7
; %bb.10:
	lda	#0
.LBB4_11:
	sta	__rc16
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
	lda	__rc16
	rts
.Lfunc_end4:
	.size	getdirent, .Lfunc_end4-getdirent
                                        ; -- End function
	.section	.text.getdirententry,"ax",@progbits
	.type	getdirententry,@function        ; -- Begin function getdirententry
getdirententry:                         ; @getdirententry
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#250
	sta	__rc0
	lda	__rc1
	adc	#255
	sta	__rc1
	pla
	ldx	__rc20
	phx
	ldx	__rc21
	phx
	ldx	__rc22
	phx
	ldx	__rc23
	phx
	pha
	lda	__rc24
	ldy	#4
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
	pla
	sta	__rc23
	ldx	#0
	stx	__rc20
	ldx	#0
	stx	__rc21
	stz	__rc22
	stz	BAMsector
	ldx	#22
	stx	BAMsector+1
	stz	BAMsector+2
	inx
	stx	BAMsector+3
	stz	worksector
	inx
	stx	worksector+1
	stz	worksector+2
	ldy	#25
	sty	worksector+3
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	direntryblock.0
	ldx	#26
	stx	direntryblock.0+1
	stz	offsCurrIdx
	stz	flagCurrSec
	stz	ptrMiniOffs
	ldx	#108
	stx	ptrMiniOffs+1
	ldx	#253
	stx	ptrMiniOffs+2
	ldx	#15
	stx	ptrMiniOffs+3
	;APP
	lda	#0
	sta	53376

	;NO_APP
	ldy	direntryblock.0
	ldx	direntryblock.0+1
	sty	__rc24
	sty	__rc6
	stx	__rc25
	stz	mos8(i)
	lda	#0
	stz	__rc4
	ldy	#8
	pha
	tya
	ldy	#5
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stz	__rc28
.LBB5_1:                                ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	ror
	stz	__rc10
	ror	__rc10
	lsr	__rc4
	ror
	ror	__rc10
	lsr	__rc4
	ror
	ror	__rc10
	stz	__rc2
	ldy	#8
	sty	__rc3
	ldy	__rc6
	sty	__rc26
	ldy	__rc6
	sty	__rc4
	stx	__rc27
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	tax
	lda	__rc10
	jsr	lcopy
	ldx	6659
	bne	.LBB5_2
; %bb.14:
	jmp	.LBB5_11
.LBB5_2:                                ;   in Loop: Header=BB5_1 Depth=1
	ldx	6656
	beq	.LBB5_4
; %bb.3:                                ;   in Loop: Header=BB5_1 Depth=1
	clc
	ldy	#5
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	__rc28
	adc	#0
	sta	__rc3
	bra	.LBB5_5
.LBB5_4:                                ;   in Loop: Header=BB5_1 Depth=1
	ldy	#5
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	ldx	__rc28
	stx	__rc3
.LBB5_5:                                ;   in Loop: Header=BB5_1 Depth=1
	ldx	__rc26
	stx	__rc6
	lda	mos8(i)
	cmp	__rc23
	beq	.LBB5_10
; %bb.6:                                ;   in Loop: Header=BB5_1 Depth=1
	inc
	sta	mos8(i)
	ldx	#0
	cpx	__rc3
	bne	.LBB5_8
; %bb.7:                                ;   in Loop: Header=BB5_1 Depth=1
	cmp	__rc2
	bcs	.LBB5_11
	bra	.LBB5_9
.LBB5_8:                                ;   in Loop: Header=BB5_1 Depth=1
	cpx	__rc3
	bcs	.LBB5_11
.LBB5_9:                                ;   in Loop: Header=BB5_1 Depth=1
	pha
	lda	__rc2
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldx	__rc3
	stx	__rc28
	ldx	__rc27
	stz	__rc4
; %bb.12:                               ;   in Loop: Header=BB5_1 Depth=1
	jmp	.LBB5_1
.LBB5_10:
	ldx	__rc24
	stx	__rc20
	ldx	__rc25
	stx	__rc21
.LBB5_11:
	ldx	__rc20
	stx	__rc2
	ldx	__rc21
	stx	__rc3
	ldy	#0
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
	adc	#6
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end5:
	.size	getdirententry, .Lfunc_end5-getdirententry
                                        ; -- End function
	.section	.text.GetWholeSector,"ax",@progbits
	.type	GetWholeSector,@function        ; -- Begin function GetWholeSector
GetWholeSector:                         ; @GetWholeSector
; %bb.0:
	phx
	ply
	tax
	lda	#97
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
	sta	__rc4

	;NO_APP
	lda	__rc4
	cmp	#2
	bcc	.LBB6_1
; %bb.3:
	jmp	.LBB6_2
.LBB6_1:
	ldx	__rc20
	phx
	ldx	__rc21
	phx
	ldx	__rc22
	phx
	ldx	__rc2
	stx	__rc21
	ldx	__rc3
	stx	__rc22
	ldy	#0
	ldx	#253
	stx	__rc2
	ldx	#15
	stx	__rc3
	ldx	__rc21
	stx	__rc4
	ldx	__rc22
	stx	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	ldx	#108
	sta	__rc20
	tya
	jsr	lcopy
	clc
	lda	__rc21
	adc	#0
	sta	__rc4
	lda	__rc22
	adc	#1
	sta	__rc5
	lda	#0
	adc	#0
	sta	__rc6
	lda	#0
	adc	#0
	ldx	#109
	sta	__rc7
	ldy	#253
	sty	__rc2
	ldy	#15
	sty	__rc3
	ldy	#1
	sty	__rc9
	stz	__rc8
	lda	#0
	jsr	lcopy
	lda	__rc20
	plx
	stx	__rc22
	plx
	stx	__rc21
	plx
	stx	__rc20
.LBB6_2:
	rts
.Lfunc_end6:
	.size	GetWholeSector, .Lfunc_end6-GetWholeSector
                                        ; -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            ; -- Begin function main
	.type	main,@function
main:                                   ; @main
; %bb.0:
	clc
	lda	__rc0
	adc	#233
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
	bpl	.LBB7_2
; %bb.1:
	ldx	#80
.LBB7_2:
	stx	mos8(g_curScreenW)
	lda	53297
	and	#8
	beq	.LBB7_4
; %bb.3:
	ldx	#50
	bra	.LBB7_5
.LBB7_4:
	ldx	#25
.LBB7_5:
	stx	mos8(g_curScreenH)
	bra	.LBB7_7
.LBB7_6:                                ;   in Loop: Header=BB7_7 Depth=1
	stz	54800
.LBB7_7:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB7_6
; %bb.8:
	ldx	#52
	stx	__rc26
	ldx	#3
	stx	__rc27
	stz	__rc22
	ldx	#255
	ldy	#mos16lo(escapeCode)
	sty	__rc2
	ldy	#mos16hi(escapeCode)
	sty	__rc3
	ldy	#1
.LBB7_9:                                ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB7_11
; %bb.10:                               ;   in Loop: Header=BB7_9 Depth=1
	inc	__rc5
.LBB7_11:                               ;   in Loop: Header=BB7_9 Depth=1
	lda	#mos16hi(escNOP)
	sta	(__rc4),y
	dex
	bne	.LBB7_9
; %bb.12:
	stz	53352
	ldx	#208
	stx	53353
	ldx	#2
	stx	53354
	lda	53272
	eor	#2
	sta	53272
	bra	.LBB7_14
.LBB7_13:                               ;   in Loop: Header=BB7_14 Depth=1
	stz	54800
.LBB7_14:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB7_13
; %bb.15:
	lda	#191
	and	53297
	sta	53297
	lda	#191
	and	53332
	sta	53332
	ldx	#mos16lo(.L.str.57)
	stx	__rc2
	ldx	#mos16hi(.L.str.57)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB7_23
.LBB7_16:                               ;   in Loop: Header=BB7_23 Depth=1
	cmp	#96
	bcc	.LBB7_18
; %bb.17:                               ;   in Loop: Header=BB7_23 Depth=1
	clc
	adc	#160
	bra	.LBB7_20
.LBB7_18:                               ;   in Loop: Header=BB7_23 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB7_20
; %bb.19:                               ;   in Loop: Header=BB7_23 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB7_20:                               ;   in Loop: Header=BB7_23 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB7_22
; %bb.21:                               ;   in Loop: Header=BB7_23 Depth=1
	inc	__rc5
.LBB7_22:                               ;   in Loop: Header=BB7_23 Depth=1
	tax
	beq	.LBB7_27
.LBB7_23:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB7_25
; %bb.24:                               ;   in Loop: Header=BB7_23 Depth=1
	inc	__rc3
.LBB7_25:                               ;   in Loop: Header=BB7_23 Depth=1
	cmp	#192
	bcc	.LBB7_16
; %bb.26:                               ;   in Loop: Header=BB7_23 Depth=1
	eor	#128
	bra	.LBB7_20
.LBB7_27:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	stz	__rc20
	stz	53280
	ldx	#6
	stx	53281
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#mos16lo(curfile)
	stx	__rc2
	ldx	#mos16hi(curfile)
	stx	__rc3
	ldx	#mos16lo(.L.str.3)
	stx	__rc4
	ldx	#mos16hi(.L.str.3)
	stx	__rc5
	lda	#16
	ldx	#0
	jsr	memcpy
	jsr	getdirent
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#0
	stx	__rc28
	ldx	#0
	stx	__rc29
.LBB7_28:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_31 Depth 2
                                        ;     Child Loop BB7_51 Depth 2
                                        ;     Child Loop BB7_58 Depth 2
                                        ;       Child Loop BB7_71 Depth 3
                                        ;       Child Loop BB7_79 Depth 3
                                        ;     Child Loop BB7_99 Depth 2
                                        ;     Child Loop BB7_132 Depth 2
                                        ;     Child Loop BB7_134 Depth 2
                                        ;       Child Loop BB7_143 Depth 3
                                        ;     Child Loop BB7_203 Depth 2
                                        ;     Child Loop BB7_217 Depth 2
                                        ;     Child Loop BB7_219 Depth 2
                                        ;     Child Loop BB7_126 Depth 2
                                        ;       Child Loop BB7_115 Depth 3
                                        ;       Child Loop BB7_120 Depth 3
                                        ;     Child Loop BB7_190 Depth 2
                                        ;       Child Loop BB7_163 Depth 3
                                        ;       Child Loop BB7_168 Depth 3
                                        ;       Child Loop BB7_177 Depth 3
                                        ;       Child Loop BB7_187 Depth 3
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	cmp	__rc22
	bcs	.LBB7_30
; %bb.29:                               ;   in Loop: Header=BB7_28 Depth=1
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
.LBB7_30:                               ;   in Loop: Header=BB7_28 Depth=1
	lda	__rc22
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#mos16lo(.L.str.4)
	stx	__rc20
	ldx	#mos16hi(.L.str.4)
	stx	__rc21
	ldx	#39
	stx	__rc2
	ldx	#23
	stx	__rc3
	ldx	#0
	txa
	jsr	mcbox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldy	#2
.LBB7_31:                               ;   Parent Loop BB7_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc20)
	inc	__rc20
	bne	.LBB7_33
; %bb.32:                               ;   in Loop: Header=BB7_31 Depth=2
	inc	__rc21
.LBB7_33:                               ;   in Loop: Header=BB7_31 Depth=2
	sta	__rc4
	cmp	#192
	bcc	.LBB7_35
; %bb.34:                               ;   in Loop: Header=BB7_31 Depth=2
	eor	#128
	bra	.LBB7_37
.LBB7_35:                               ;   in Loop: Header=BB7_31 Depth=2
	tax
	cpx	#96
	bcc	.LBB7_41
; %bb.36:                               ;   in Loop: Header=BB7_31 Depth=2
	clc
	adc	#160
.LBB7_37:                               ;   in Loop: Header=BB7_31 Depth=2
	sta	__rc4
.LBB7_38:                               ;   in Loop: Header=BB7_31 Depth=2
	lda	__rc4
	sta	(__rc26)
	inc	__rc26
	bne	.LBB7_40
; %bb.39:                               ;   in Loop: Header=BB7_31 Depth=2
	inc	__rc27
.LBB7_40:                               ;   in Loop: Header=BB7_31 Depth=2
	lda	__rc4
	bne	.LBB7_31
	bra	.LBB7_43
.LBB7_41:                               ;   in Loop: Header=BB7_31 Depth=2
	clc
	adc	#165
	cmp	#5
	bcs	.LBB7_38
; %bb.42:                               ;   in Loop: Header=BB7_31 Depth=2
	tax
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
	tax
	stx	__rc4
	bra	.LBB7_38
.LBB7_43:                               ;   in Loop: Header=BB7_28 Depth=1
	ldx	#mos16lo(curfile)
	stx	__rc20
	ldx	#mos16hi(curfile)
	stx	__rc21
	ldx	#52
	stx	__rc22
	ldx	#3
	stx	__rc23
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldx	#0
	tya
	jsr	cputsxy
	ldx	#52
	stx	__rc26
	ldx	#3
	stx	__rc27
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	bra	.LBB7_51
.LBB7_44:                               ;   in Loop: Header=BB7_51 Depth=2
	cmp	#96
	bcc	.LBB7_46
; %bb.45:                               ;   in Loop: Header=BB7_51 Depth=2
	clc
	adc	#160
	bra	.LBB7_48
.LBB7_46:                               ;   in Loop: Header=BB7_51 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB7_48
; %bb.47:                               ;   in Loop: Header=BB7_51 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB7_48:                               ;   in Loop: Header=BB7_51 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB7_50
; %bb.49:                               ;   in Loop: Header=BB7_51 Depth=2
	inc	__rc3
.LBB7_50:                               ;   in Loop: Header=BB7_51 Depth=2
	tax
	beq	.LBB7_55
.LBB7_51:                               ;   Parent Loop BB7_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc20)
	inc	__rc20
	bne	.LBB7_53
; %bb.52:                               ;   in Loop: Header=BB7_51 Depth=2
	inc	__rc21
.LBB7_53:                               ;   in Loop: Header=BB7_51 Depth=2
	cmp	#192
	bcc	.LBB7_44
; %bb.54:                               ;   in Loop: Header=BB7_51 Depth=2
	eor	#128
	bra	.LBB7_48
.LBB7_55:                               ;   in Loop: Header=BB7_28 Depth=1
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
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	__rc23
	cpx	#21
	stz	__rc22
	stz	__rc24
	bcc	.LBB7_57
; %bb.56:                               ;   in Loop: Header=BB7_28 Depth=1
	lda	__rc23
	clc
	adc	#235
	sta	__rc22
	lda	#0
	adc	#255
	sta	__rc24
.LBB7_57:                               ;   in Loop: Header=BB7_28 Depth=1
	stz	__rc25
	ldx	#0
.LBB7_58:                               ;   Parent Loop BB7_28 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB7_71 Depth 3
                                        ;       Child Loop BB7_79 Depth 3
	stx	__rc20
	txa
	clc
	adc	__rc22
	ldx	#1
	bcs	.LBB7_60
; %bb.59:                               ;   in Loop: Header=BB7_58 Depth=2
	ldx	#0
.LBB7_60:                               ;   in Loop: Header=BB7_58 Depth=2
	stx	__rc30
	sta	__rc21
	jsr	getdirententry
	ldx	__rc3
	cpx	__rc29
	bne	.LBB7_62
; %bb.61:                               ;   in Loop: Header=BB7_58 Depth=2
	ldx	__rc2
	cpx	__rc28
	bne	.LBB7_62
; %bb.285:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_98
.LBB7_62:                               ;   in Loop: Header=BB7_58 Depth=2
	lda	__rc25
	ldx	__rc30
	cpx	#1
	adc	__rc24
	ldy	#32
	sta	__rc6
	tax
	bne	.LBB7_65
; %bb.63:                               ;   in Loop: Header=BB7_58 Depth=2
	ldx	__rc21
	cpx	__rc23
	bne	.LBB7_65
; %bb.64:                               ;   in Loop: Header=BB7_58 Depth=2
	ldx	#62
	bra	.LBB7_66
.LBB7_65:                               ;   in Loop: Header=BB7_58 Depth=2
	ldx	#32
.LBB7_66:                               ;   in Loop: Header=BB7_58 Depth=2
	stx	mos8(s)
	sty	mos8(s+1)
	ldy	#5
	lda	(__rc2),y
	cmp	#160
	bne	.LBB7_68
; %bb.67:                               ;   in Loop: Header=BB7_58 Depth=2
	lda	#0
	ldx	#2
	pha
	txa
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	bra	.LBB7_78
.LBB7_68:                               ;   in Loop: Header=BB7_58 Depth=2
	sta	__rc4
	stz	__rc8
	bra	.LBB7_71
.LBB7_69:                               ;   in Loop: Header=BB7_71 Depth=3
	lda	#0
.LBB7_70:                               ;   in Loop: Header=BB7_71 Depth=3
	tay
	beq	.LBB7_77
.LBB7_71:                               ;   Parent Loop BB7_28 Depth=1
                                        ;     Parent Loop BB7_58 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	__rc8
	lda	__rc4
	sta	mos8(s+2),x
	lda	__rc8
	clc
	adc	__rc2
	sta	__rc4
	lda	__rc3
	adc	#0
	sta	__rc5
	inc	__rc8
	cpx	#15
	ldy	#0
	lda	#1
	bcs	.LBB7_73
; %bb.72:                               ;   in Loop: Header=BB7_71 Depth=3
	lda	#0
.LBB7_73:                               ;   in Loop: Header=BB7_71 Depth=3
	sta	__rc10
	bcs	.LBB7_75
; %bb.74:                               ;   in Loop: Header=BB7_71 Depth=3
	ldy	#1
.LBB7_75:                               ;   in Loop: Header=BB7_71 Depth=3
	sty	__rc9
	ldy	#6
	lda	(__rc4),y
	sta	__rc4
	cmp	#160
	beq	.LBB7_69
; %bb.76:                               ;   in Loop: Header=BB7_71 Depth=3
	lda	__rc9
	and	#1
	bra	.LBB7_70
.LBB7_77:                               ;   in Loop: Header=BB7_58 Depth=2
	clc
	txa
	adc	#3
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc8
	ldx	__rc10
	bne	.LBB7_80
.LBB7_78:                               ;   in Loop: Header=BB7_58 Depth=2
	clc
	adc	#240
	pha
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
.LBB7_79:                               ;   Parent Loop BB7_28 Depth=1
                                        ;     Parent Loop BB7_58 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	sta	__rc4
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	inc	__rc5
	lda	#32
	sta	mos8(s),x
	inc	__rc4
	ldx	__rc5
	txa
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc4
	bne	.LBB7_79
.LBB7_80:                               ;   in Loop: Header=BB7_58 Depth=2
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	tax
	lda	#32
	sta	mos8(s),x
	inx
	lda	__rc4
	clc
	adc	#2
	sta	__rc5
	lda	#93
	sta	mos8(s),x
	ldx	__rc5
	lda	__rc4
	clc
	adc	#3
	sta	__rc4
	lda	#32
	sta	mos8(s),x
	ldx	__rc4
	lda	#15
	ldy	#2
	and	(__rc2),y
	ldy	#68
	cmp	#5
	beq	.LBB7_82
; %bb.81:                               ;   in Loop: Header=BB7_58 Depth=2
	ldy	#80
.LBB7_82:                               ;   in Loop: Header=BB7_58 Depth=2
	tya
	sta	mos8(s),x
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	clc
	adc	#4
	tax
	lda	#15
	ldy	#2
	and	(__rc2),y
	ldy	#73
	cmp	#5
	beq	.LBB7_84
; %bb.83:                               ;   in Loop: Header=BB7_58 Depth=2
	ldy	#82
.LBB7_84:                               ;   in Loop: Header=BB7_58 Depth=2
	tya
	sta	mos8(s),x
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	clc
	adc	#5
	tax
	lda	#15
	ldy	#2
	and	(__rc2),y
	ldy	#82
	cmp	#5
	beq	.LBB7_86
; %bb.85:                               ;   in Loop: Header=BB7_58 Depth=2
	ldy	#71
.LBB7_86:                               ;   in Loop: Header=BB7_58 Depth=2
	tya
	sta	mos8(s),x
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	clc
	adc	#6
	tax
	lda	__rc4
	clc
	adc	#7
	tay
	lda	#32
	sta	mos8(s),x
	lda	__rc4
	clc
	adc	#8
	tax
	clc
	lda	__rc4
	adc	#9
	sta	__rc2
	lda	__rc6
	bne	.LBB7_89
; %bb.87:                               ;   in Loop: Header=BB7_58 Depth=2
	lda	__rc21
	cmp	__rc23
	bne	.LBB7_89
; %bb.88:                               ;   in Loop: Header=BB7_58 Depth=2
	lda	#60
	bra	.LBB7_90
.LBB7_89:                               ;   in Loop: Header=BB7_58 Depth=2
	lda	#32
.LBB7_90:                               ;   in Loop: Header=BB7_58 Depth=2
	sta	mos8(s),y
	ldy	__rc2
	sty	mos8(i)
	stz	mos8(s),x
	lda	mos8(g_curTextColor)
	ldx	__rc6
	bne	.LBB7_93
; %bb.91:                               ;   in Loop: Header=BB7_58 Depth=2
	ldx	__rc21
	cpx	__rc23
	bne	.LBB7_93
; %bb.92:                               ;   in Loop: Header=BB7_58 Depth=2
	ora	#32
	bra	.LBB7_94
.LBB7_93:                               ;   in Loop: Header=BB7_58 Depth=2
	and	#223
.LBB7_94:                               ;   in Loop: Header=BB7_58 Depth=2
	tax
	lda	#1
	stx	mos8(g_curTextColor)
	ldx	__rc20
	inx
	ldy	#mos8(s)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	jsr	cputsxy
	ldx	__rc20
	inx
	bne	.LBB7_96
; %bb.95:                               ;   in Loop: Header=BB7_58 Depth=2
	inc	__rc25
.LBB7_96:                               ;   in Loop: Header=BB7_58 Depth=2
	lda	__rc25
	beq	.LBB7_97
; %bb.287:                              ;   in Loop: Header=BB7_58 Depth=2
	jmp	.LBB7_58
.LBB7_97:                               ;   in Loop: Header=BB7_58 Depth=2
	cpx	#22
	beq	.LBB7_98
; %bb.289:                              ;   in Loop: Header=BB7_58 Depth=2
	jmp	.LBB7_58
.LBB7_98:                               ;   in Loop: Header=BB7_28 Depth=1
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	jsr	cputln
.LBB7_99:                               ;   Parent Loop BB7_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	54800
	beq	.LBB7_99
; %bb.100:                              ;   in Loop: Header=BB7_28 Depth=1
	stz	54800
	cmp	#145
	beq	.LBB7_107
; %bb.101:                              ;   in Loop: Header=BB7_28 Depth=1
	cmp	#242
	beq	.LBB7_109
; %bb.102:                              ;   in Loop: Header=BB7_28 Depth=1
	cmp	#250
	bne	.LBB7_103
; %bb.291:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_129
.LBB7_103:                              ;   in Loop: Header=BB7_28 Depth=1
	cmp	#13
	bne	.LBB7_104
; %bb.293:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_131
.LBB7_104:                              ;   in Loop: Header=BB7_28 Depth=1
	cmp	#17
	bne	.LBB7_105
; %bb.295:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_151
.LBB7_105:                              ;   in Loop: Header=BB7_28 Depth=1
	cmp	#27
	bne	.LBB7_106
; %bb.297:
	jmp	.LBB7_228
.LBB7_106:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	#mos16lo(.L.str.2)
	stx	__rc2
	ldx	#mos16hi(.L.str.2)
	stx	__rc3
	ldx	#0
	stz	__rc4
	stz	__rc5
	jsr	mprintf
	ldx	__rc23
	stx	__rc22
; %bb.243:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_28
.LBB7_107:                              ;   in Loop: Header=BB7_28 Depth=1
	stz	__rc22
	lda	__rc23
	bne	.LBB7_108
; %bb.299:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_28
.LBB7_108:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	__rc23
	stx	__rc22
	dec	__rc22
; %bb.245:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_28
.LBB7_109:                              ;   in Loop: Header=BB7_28 Depth=1
	;APP
	ldx	#0
	lda	#4
	sta	54848
	clv
	bcc	errgetcurdrv1
	sta	__rc2
	jmp	donegetcurdrv1
errgetcurdrv1:
	lda	#255
	sta	__rc2
donegetcurdrv1:
	nop
	;NO_APP
	ldx	__rc2
	stz	__rc28
	cpx	#255
	bne	.LBB7_110
; %bb.301:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_155
.LBB7_110:                              ;   in Loop: Header=BB7_28 Depth=1
	;APP
	ldx	#0
	lda	#18
	sta	54848
	clv
	bcc	errhypopendir2
	sta	__rc2
	jmp	donehypopendir2
errhypopendir2:
	lda	#255
	sta	__rc2
donehypopendir2:
	nop

	;NO_APP
	lda	__rc2
	cmp	#132
	bne	.LBB7_111
; %bb.303:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_155
.LBB7_111:                              ;   in Loop: Header=BB7_28 Depth=1
	cmp	#135
	bne	.LBB7_112
; %bb.305:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_155
.LBB7_112:                              ;   in Loop: Header=BB7_28 Depth=1
	cmp	#255
	bne	.LBB7_113
; %bb.307:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_155
.LBB7_113:                              ;   in Loop: Header=BB7_28 Depth=1
	stz	mos8(i)
; %bb.247:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_126
.LBB7_114:                              ;   in Loop: Header=BB7_126 Depth=2
	ldy	#0
	ldx	#0
.LBB7_115:                              ;   Parent Loop BB7_28 Depth=1
                                        ;     Parent Loop BB7_126 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	6721,y
	cmp	#32
	beq	.LBB7_119
; %bb.116:                              ;   in Loop: Header=BB7_115 Depth=3
	cmp	#33
	bcc	.LBB7_118
; %bb.117:                              ;   in Loop: Header=BB7_115 Depth=3
	sta	7233,x
	inx
.LBB7_118:                              ;   in Loop: Header=BB7_115 Depth=3
	iny
	cpy	#8
	bne	.LBB7_115
.LBB7_119:                              ;   in Loop: Header=BB7_126 Depth=2
	ldy	#0
	lda	#46
	sta	7233,x
	inx
.LBB7_120:                              ;   Parent Loop BB7_28 Depth=1
                                        ;     Parent Loop BB7_126 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	6729,y
	cmp	#32
	beq	.LBB7_124
; %bb.121:                              ;   in Loop: Header=BB7_120 Depth=3
	cmp	#33
	bcc	.LBB7_123
; %bb.122:                              ;   in Loop: Header=BB7_120 Depth=3
	sta	7233,x
	inx
.LBB7_123:                              ;   in Loop: Header=BB7_120 Depth=3
	iny
	cpy	#3
	bne	.LBB7_120
.LBB7_124:                              ;   in Loop: Header=BB7_126 Depth=2
	stz	7233,x
	lda	mos8(i)
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	sta	__rc21
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	#mos16lo(filelist)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(filelist)
	adc	__rc3
	sta	__rc3
	ldx	#0
	stx	__rc4
	ldx	#26
	stx	__rc5
	jsr	strcpy
	ldx	__rc21
	inc	__rc28
.LBB7_125:                              ;   in Loop: Header=BB7_126 Depth=2
	lda	__rc20
	inx
	stx	mos8(i)
	cpx	#18
	bcc	.LBB7_126
; %bb.309:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_154
.LBB7_126:                              ;   Parent Loop BB7_28 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB7_115 Depth 3
                                        ;       Child Loop BB7_120 Depth 3
	sta	__rc20
	tay
	;APP
	phx
	ldx	#0
	txa
hypreaddirloop3:
	sta	6656,x
	dex
	bne	hypreaddirloop3
	plx
	tya
	tax
	ldy	#mos16hi(6656)
	lda	#20
	sta	54848
	clv
	bcc	errhypreaddir3
	stx	__rc2
	jmp	donehypreaddir3
errhypreaddir3:
	sta	__rc2
donehypreaddir3:
	nop

	;NO_APP
	ldy	__rc2
	ldx	6720
	stz	6656,x
	cpy	#133
	beq	.LBB7_128
; %bb.127:                              ;   in Loop: Header=BB7_126 Depth=2
	cpy	#255
	beq	.LBB7_128
; %bb.311:                              ;   in Loop: Header=BB7_126 Depth=2
	jmp	.LBB7_114
.LBB7_128:                              ;   in Loop: Header=BB7_126 Depth=2
	lda	mos8(i)
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	sta	__rc21
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldx	__rc21
	lda	#mos16lo(filelist)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(filelist)
	adc	__rc3
	sta	__rc3
	lda	#32
	sta	(__rc2)
	ldy	#1
	lda	#0
	sta	(__rc2),y
	bra	.LBB7_125
.LBB7_129:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	54801
	cpx	#1
	bne	.LBB7_130
; %bb.313:
	jmp	.LBB7_227
.LBB7_130:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	54801
	ldy	__rc23
	sty	__rc22
	cpx	#2
	beq	.LBB7_249
; %bb.315:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_28
.LBB7_249:
	jmp	.LBB7_227
.LBB7_131:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	#mos16lo(.L.str.5)
	stx	__rc2
	ldx	#mos16hi(.L.str.5)
	stx	__rc3
	jsr	messagebox
.LBB7_132:                              ;   Parent Loop BB7_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB7_132
; %bb.133:                              ;   in Loop: Header=BB7_28 Depth=1
	stz	54800
	stz	BAMsector
	ldx	#22
	stx	BAMsector+1
	stz	BAMsector+2
	inx
	stx	BAMsector+3
	stz	worksector
	inx
	stx	worksector+1
	stz	worksector+2
	ldy	#25
	sty	worksector+3
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	direntryblock.0
	ldx	#26
	stx	direntryblock.0+1
	stz	offsCurrIdx
	stz	flagCurrSec
	stz	ptrMiniOffs
	ldx	#108
	stx	ptrMiniOffs+1
	ldx	#253
	stx	ptrMiniOffs+2
	ldx	#15
	stx	ptrMiniOffs+3
	;APP
	lda	#0
	sta	53376

	;NO_APP
	ldx	BAMsector
	stx	__rc2
	ldx	BAMsector+1
	stx	__rc3
	clc
	lda	#0
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc30
	ldx	#1
	lda	#40
	jsr	GetWholeSector
	ldy	#1
	sta	BAMside
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(BAMsector)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(BAMsector)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc6
	sta	__rc4
	lda	(__rc2),y
	tay
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	phy
	lda	__rc4
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	stz	__rc4
	lda	#0
.LBB7_134:                              ;   Parent Loop BB7_28 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB7_143 Depth 3
	phy
	pha
	lda	__rc4
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldy	#12
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	sta	__rc2
	ldx	__rc6
	lda	__rc6
	clc
	adc	__rc2
	sta	__rc6
	tya
	adc	#0
	sta	__rc7
                                        ; kill: def $rs3 killed $rs3
	phy
	lda	__rc6
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc7
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	txa
	clc
	adc	__rc2
	sta	__rc6
	tya
	adc	#0
	sta	__rc7
                                        ; kill: def $rs3 killed $rs3
	phy
	lda	__rc6
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc7
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	txa
	clc
	adc	__rc2
	sta	__rc28
	tya
	adc	#0
	sta	__rc29
	txa
	clc
	adc	__rc2
	sta	__rc22
	tya
	adc	#0
	sta	__rc23
	txa
	phy
	ldy	#14
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	clc
	adc	__rc2
	tax
	tya
	phy
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	tya
	adc	#0
	tay
	stx	__rc24
	clc
	txa
	adc	#17
	sta	__rc4
	tya
	sty	__rc25
	adc	#0
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	lda	__rc4
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#0
; %bb.251:                              ;   in Loop: Header=BB7_134 Depth=2
	jmp	.LBB7_143
.LBB7_135:                              ;   in Loop: Header=BB7_143 Depth=3
	cpx	#16
	bcs	.LBB7_137
; %bb.136:                              ;   in Loop: Header=BB7_143 Depth=3
	ldy	#18
	lda	(__rc22),y
	sta	__rc30
	txa
	clc
	adc	#248
	sta	__rc2
	stx	__rc20
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	and	__rc30
	bne	.LBB7_253
; %bb.317:                              ;   in Loop: Header=BB7_143 Depth=3
	jmp	.LBB7_142
.LBB7_253:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_153
.LBB7_137:                              ;   in Loop: Header=BB7_143 Depth=3
	cpx	#24
	bcs	.LBB7_139
; %bb.138:                              ;   in Loop: Header=BB7_143 Depth=3
	ldy	#19
	lda	(__rc28),y
	sta	__rc30
	txa
	clc
	adc	#240
	sta	__rc2
	stx	__rc20
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	and	__rc30
	bne	.LBB7_255
; %bb.319:                              ;   in Loop: Header=BB7_143 Depth=3
	jmp	.LBB7_142
.LBB7_255:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_196
.LBB7_139:                              ;   in Loop: Header=BB7_143 Depth=3
	cpx	#32
	bcs	.LBB7_141
; %bb.140:                              ;   in Loop: Header=BB7_143 Depth=3
	ldy	#20
	phy
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc3
	lda	(__rc2),y
	sta	__rc30
	txa
	clc
	adc	#232
	sta	__rc2
	stx	__rc20
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	and	__rc30
	beq	.LBB7_142
; %bb.257:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_197
.LBB7_141:                              ;   in Loop: Header=BB7_143 Depth=3
	ldy	#21
	phy
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc3
	lda	(__rc2),y
	sta	__rc30
	txa
	clc
	adc	#224
	sta	__rc2
	stx	__rc20
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	and	__rc30
	beq	.LBB7_142
; %bb.321:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_198
.LBB7_142:                              ;   in Loop: Header=BB7_143 Depth=3
	lda	__rc20
	ldx	__rc20
	inx
	cmp	#39
	bcs	.LBB7_147
.LBB7_143:                              ;   Parent Loop BB7_28 Depth=1
                                        ;     Parent Loop BB7_134 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	cpx	#8
	ldy	#1
	bcs	.LBB7_145
; %bb.144:                              ;   in Loop: Header=BB7_143 Depth=3
	ldy	#0
.LBB7_145:                              ;   in Loop: Header=BB7_143 Depth=3
	sty	__rc31
	bcc	.LBB7_146
; %bb.323:                              ;   in Loop: Header=BB7_143 Depth=3
	jmp	.LBB7_135
.LBB7_146:                              ;   in Loop: Header=BB7_143 Depth=3
	ldy	#17
	lda	(__rc24),y
	sta	__rc30
	stx	__rc2
	stx	__rc20
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	and	__rc30
	beq	.LBB7_142
; %bb.259:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_152
.LBB7_147:                              ;   in Loop: Header=BB7_134 Depth=2
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tay
	tax
	inx
	clc
	phy
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	adc	#6
	cpy	#39
	pha
	lda	#1
	bcs	.LBB7_149
; %bb.148:                              ;   in Loop: Header=BB7_134 Depth=2
	lda	#0
.LBB7_149:                              ;   in Loop: Header=BB7_134 Depth=2
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stx	__rc4
	stz	__rc30
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc6
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tay
	pla
	cpx	#40
	beq	.LBB7_150
; %bb.325:                              ;   in Loop: Header=BB7_134 Depth=2
	jmp	.LBB7_134
.LBB7_150:                              ;   in Loop: Header=BB7_28 Depth=1
	lda	#255
	ldx	#0
	ldy	#0
	sty	__rc28
	ldy	#0
	sty	__rc29
	pha
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	pla
; %bb.261:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_222
.LBB7_151:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	__rc23
	stx	__rc22
	inc	__rc22
; %bb.263:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_28
.LBB7_152:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	#mos16lo(.L.str.53)
	stx	__rc24
	ldx	#mos16hi(.L.str.53)
	stx	__rc25
	ldx	#42
	stx	mos8(g_curX)
	ldx	#7
	stx	mos8(g_curY)
	ldx	#mos16lo(.L.str.6)
	stx	__rc2
	ldx	#mos16hi(.L.str.6)
	stx	__rc3
	stz	__rc21
	stz	__rc4
	stz	__rc5
	ldx	#0
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	mprintf
	ldx	#mos16lo(.L.str.7)
	stx	__rc2
	ldx	#mos16hi(.L.str.7)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	ldy	__rc20
	sty	__rc23
	lda	__rc20
	jsr	mprintf
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
	lda	(__rc28)
	ldx	#mos16lo(.L.str.51)
	stx	__rc2
	ldx	#mos16hi(.L.str.51)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	ldy	#1
	lda	(__rc28),y
	ldx	#mos16lo(.L.str.52)
	stx	__rc2
	ldx	#mos16hi(.L.str.52)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	ldx	#0
	stx	__rc28
	ldx	#0
	stx	__rc29
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
; %bb.265:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_202
.LBB7_153:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	#42
	stx	mos8(g_curX)
	ldx	#8
; %bb.267:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_199
.LBB7_154:                              ;   in Loop: Header=BB7_28 Depth=1
	tax
	;APP
	lda	#22
	sta	54848
	clv
	bcc	errhypclosedir4
	stx	__rc2
	jmp	donehypclosedir4
errhypclosedir4:
	sta	__rc2
donehypclosedir4:
	nop

	;NO_APP
.LBB7_155:                              ;   in Loop: Header=BB7_28 Depth=1
	lda	#0
; %bb.269:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_190
.LBB7_156:                              ;   in Loop: Header=BB7_163 Depth=3
	cmp	#96
	bcc	.LBB7_158
; %bb.157:                              ;   in Loop: Header=BB7_163 Depth=3
	clc
	adc	#160
	bra	.LBB7_160
.LBB7_158:                              ;   in Loop: Header=BB7_163 Depth=3
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB7_160
; %bb.159:                              ;   in Loop: Header=BB7_163 Depth=3
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB7_160:                              ;   in Loop: Header=BB7_163 Depth=3
	sta	(__rc2)
	inc	__rc2
	bne	.LBB7_162
; %bb.161:                              ;   in Loop: Header=BB7_163 Depth=3
	inc	__rc3
.LBB7_162:                              ;   in Loop: Header=BB7_163 Depth=3
	tax
	beq	.LBB7_167
.LBB7_163:                              ;   Parent Loop BB7_28 Depth=1
                                        ;     Parent Loop BB7_190 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc20)
	inc	__rc20
	bne	.LBB7_165
; %bb.164:                              ;   in Loop: Header=BB7_163 Depth=3
	inc	__rc21
.LBB7_165:                              ;   in Loop: Header=BB7_163 Depth=3
	cmp	#192
	bcc	.LBB7_156
; %bb.166:                              ;   in Loop: Header=BB7_163 Depth=3
	eor	#128
	bra	.LBB7_160
.LBB7_167:                              ;   in Loop: Header=BB7_190 Depth=2
	ldx	#5
	txa
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#mos16lo(filelist)
	stx	__rc24
	ldx	#mos16hi(filelist)
	stx	__rc25
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldx	#3
	lda	#12
	jsr	cputsxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	stz	__rc20
	ldx	__rc22
	stx	__rc21
.LBB7_168:                              ;   Parent Loop BB7_28 Depth=1
                                        ;     Parent Loop BB7_190 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc24)
	beq	.LBB7_176
; %bb.169:                              ;   in Loop: Header=BB7_168 Depth=3
	lda	mos8(g_curTextColor)
	ldx	__rc20
	bne	.LBB7_171
; %bb.170:                              ;   in Loop: Header=BB7_168 Depth=3
	ldx	__rc21
	beq	.LBB7_175
.LBB7_171:                              ;   in Loop: Header=BB7_168 Depth=3
	and	#223
.LBB7_172:                              ;   in Loop: Header=BB7_168 Depth=3
	sta	mos8(g_curTextColor)
	ldx	__rc24
	stx	__rc2
	ldx	__rc25
	stx	__rc3
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
	tax
	lda	#10
	jsr	cputsxy
	lda	__rc24
	clc
	adc	#65
	sta	__rc24
	lda	__rc25
	adc	#0
	sta	__rc25
	inc	__rc29
	ldx	__rc21
	dec	__rc21
	cpx	#0
	bne	.LBB7_174
; %bb.173:                              ;   in Loop: Header=BB7_168 Depth=3
	dec	__rc20
.LBB7_174:                              ;   in Loop: Header=BB7_168 Depth=3
	lda	__rc29
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc29
	cpx	#23
	bne	.LBB7_168
	bra	.LBB7_176
.LBB7_175:                              ;   in Loop: Header=BB7_168 Depth=3
	ora	#32
	bra	.LBB7_172
.LBB7_176:                              ;   in Loop: Header=BB7_190 Depth=2
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	jsr	cputln
.LBB7_177:                              ;   Parent Loop BB7_28 Depth=1
                                        ;     Parent Loop BB7_190 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	54800
	beq	.LBB7_177
; %bb.178:                              ;   in Loop: Header=BB7_190 Depth=2
	stz	54800
	cmp	#145
	beq	.LBB7_183
; %bb.179:                              ;   in Loop: Header=BB7_190 Depth=2
	cmp	#13
	beq	.LBB7_185
; %bb.180:                              ;   in Loop: Header=BB7_190 Depth=2
	cmp	#17
	bne	.LBB7_181
; %bb.327:                              ;   in Loop: Header=BB7_190 Depth=2
	jmp	.LBB7_189
.LBB7_181:                              ;   in Loop: Header=BB7_190 Depth=2
	cmp	#27
	bne	.LBB7_182
; %bb.329:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_195
.LBB7_182:                              ;   in Loop: Header=BB7_190 Depth=2
	ldx	#mos16lo(.L.str.2)
	stx	__rc2
	ldx	#mos16hi(.L.str.2)
	stx	__rc3
	ldx	#0
	stz	__rc4
	stz	__rc5
	jsr	mprintf
	lda	__rc22
; %bb.271:                              ;   in Loop: Header=BB7_190 Depth=2
	jmp	.LBB7_190
.LBB7_183:                              ;   in Loop: Header=BB7_190 Depth=2
	lda	#0
	ldx	__rc22
	bne	.LBB7_184
; %bb.331:                              ;   in Loop: Header=BB7_190 Depth=2
	jmp	.LBB7_190
.LBB7_184:                              ;   in Loop: Header=BB7_190 Depth=2
	dec	__rc22
	lda	__rc22
; %bb.333:                              ;   in Loop: Header=BB7_190 Depth=2
	jmp	.LBB7_190
.LBB7_185:                              ;   in Loop: Header=BB7_190 Depth=2
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc22
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	#mos16lo(filelist)
	clc
	adc	__rc2
	sta	__rc24
	lda	#mos16hi(filelist)
	adc	__rc3
	sta	__rc25
	ldx	#28
	stx	mos8(fnamehi)
	ldx	#0
	stx	__rc2
	ldx	#28
	stx	__rc3
	ldx	__rc24
	stx	__rc4
	sta	__rc5
	jsr	strcpy
	ldy	mos8(fnamehi)
	;APP
	ldx	#0
	lda	#46
	sta	54848
	clv
	bcc	errhypsetnam5
	lda	#0
	sta	__rc2
	jmp	donehypsetnam5
errhypsetnam5:
	lda	#255
	sta	__rc2
donehypsetnam5:
	nop

	;NO_APP
	;APP
	ldx	#0
	lda	#70
	sta	54848
	clv
	bcc	errhyp1att6
	lda	#0
	sta	__rc2
	jmp	donehyp1att6
errhyp1att6:
	lda	#255
	sta	__rc2
donehyp1att6:
	nop

	;NO_APP
	lda	__rc2
	bne	.LBB7_186
; %bb.335:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_194
.LBB7_186:                              ;   in Loop: Header=BB7_190 Depth=2
	ldx	#mos16lo(.L.str.1)
	stx	__rc2
	ldx	#mos16hi(.L.str.1)
	stx	__rc3
	jsr	messagebox
.LBB7_187:                              ;   Parent Loop BB7_28 Depth=1
                                        ;     Parent Loop BB7_190 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	54800
	beq	.LBB7_187
; %bb.188:                              ;   in Loop: Header=BB7_190 Depth=2
	stz	54800
	lda	__rc22
	bra	.LBB7_190
.LBB7_189:                              ;   in Loop: Header=BB7_190 Depth=2
	inc	__rc22
	lda	__rc22
.LBB7_190:                              ;   Parent Loop BB7_28 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB7_163 Depth 3
                                        ;       Child Loop BB7_168 Depth 3
                                        ;       Child Loop BB7_177 Depth 3
                                        ;       Child Loop BB7_187 Depth 3
	cmp	__rc28
	bcs	.LBB7_192
; %bb.191:                              ;   in Loop: Header=BB7_190 Depth=2
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	sta	__rc22
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	#mos16lo(filelist)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(filelist)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	bne	.LBB7_193
.LBB7_192:                              ;   in Loop: Header=BB7_190 Depth=2
	stz	__rc22
.LBB7_193:                              ;   in Loop: Header=BB7_190 Depth=2
	ldx	#mos16lo(.L.str)
	stx	__rc20
	ldx	#mos16hi(.L.str)
	stx	__rc21
	ldx	#73
	stx	__rc2
	ldx	#23
	stx	__rc3
	ldx	#3
	lda	#8
	jsr	mcbox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
; %bb.273:                              ;   in Loop: Header=BB7_190 Depth=2
	jmp	.LBB7_163
.LBB7_194:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	#mos16lo(curfile)
	stx	__rc2
	ldx	#mos16hi(curfile)
	stx	__rc3
	ldx	__rc24
	stx	__rc4
	ldx	__rc25
	stx	__rc5
	jsr	strcpy
	jsr	getdirent
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB7_195:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	__rc23
	stx	__rc22
	ldx	#0
	stx	__rc28
	ldx	#0
	stx	__rc29
; %bb.275:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_28
.LBB7_196:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	#42
	stx	mos8(g_curX)
	ldx	#9
	bra	.LBB7_199
.LBB7_197:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	#42
	stx	mos8(g_curX)
	ldx	#10
	bra	.LBB7_199
.LBB7_198:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	#42
	stx	mos8(g_curX)
	ldx	#11
.LBB7_199:                              ;   in Loop: Header=BB7_28 Depth=1
	stx	mos8(g_curY)
	ldx	#mos16lo(.L.str.6)
	stx	__rc2
	ldx	#mos16hi(.L.str.6)
	stx	__rc3
	stz	__rc21
	stz	__rc4
	stz	__rc5
	ldx	#0
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	mprintf
	ldx	#mos16lo(.L.str.7)
	stx	__rc2
	ldx	#mos16hi(.L.str.7)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	ldy	__rc20
	sty	__rc23
	lda	__rc20
	jsr	mprintf
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
	lda	(__rc24)
	ldx	#mos16lo(.L.str.51)
	stx	__rc2
	ldx	#mos16hi(.L.str.51)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	inc	__rc24
	bne	.LBB7_201
; %bb.200:                              ;   in Loop: Header=BB7_28 Depth=1
	inc	__rc25
.LBB7_201:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	__rc24
	stx	__rc4
	ldx	__rc25
	stx	__rc5
	ldx	#mos16lo(.L.str.52)
	stx	__rc24
	ldx	#mos16hi(.L.str.52)
	stx	__rc25
	ldx	#0
	stx	__rc28
	ldx	#0
	stx	__rc29
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
.LBB7_202:                              ;   in Loop: Header=BB7_28 Depth=1
	lda	(__rc4)
	ldx	__rc24
	stx	__rc2
	ldx	__rc25
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
.LBB7_203:                              ;   Parent Loop BB7_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB7_203
; %bb.204:                              ;   in Loop: Header=BB7_28 Depth=1
	stz	54800
	lda	#255
	ldx	#0
	pha
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	pla
	ldy	__rc2
	beq	.LBB7_205
; %bb.337:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_222
.LBB7_205:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	BAMside
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stx	__rc24
	stx	__rc2
	lda	#0
	asl	__rc2
	rol
	sta	__rc3
	clc
	lda	#mos16lo(BAMsector)
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(BAMsector)
	adc	__rc3
	pha
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc30
	tax
	inx
	txa
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	__rc3
	lda	(__rc2)
	sta	__rc25
	ldy	#1
	lda	(__rc2),y
	ldx	#6
	ldy	__rc31
	bne	.LBB7_207
; %bb.206:                              ;   in Loop: Header=BB7_28 Depth=1
	stz	__rc22
	stx	__rc2
	stz	__rc3
	ldx	#0
	sta	__rc31
	lda	__rc30
	jsr	__mulhi3
	ldy	#1
	sta	__rc2
	stx	__rc3
	lda	__rc25
	clc
	adc	__rc2
	tax
	lda	__rc31
	adc	__rc3
	sta	__rc2
	clc
	txa
	adc	#17
	sta	__rc20
	lda	__rc2
	adc	#0
	sta	__rc21
	ldx	__rc23
	txa
	phy
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
; %bb.277:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_212
.LBB7_207:                              ;   in Loop: Header=BB7_28 Depth=1
	sta	__rc31
	lda	__rc20
	cmp	#16
	bcs	.LBB7_209
; %bb.208:                              ;   in Loop: Header=BB7_28 Depth=1
	stz	__rc22
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	adc	#248
	sta	__rc23
	stx	__rc2
	stz	__rc3
	ldx	#0
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc30
	jsr	__mulhi3
	ldy	#1
	sta	__rc2
	stx	__rc3
	lda	__rc25
	clc
	adc	__rc2
	tax
	lda	__rc31
	adc	__rc3
	sta	__rc2
	clc
	txa
	adc	#18
	bra	.LBB7_211
.LBB7_209:                              ;   in Loop: Header=BB7_28 Depth=1
	cmp	#24
	pha
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc30
	pla
	stz	__rc22
	ldy	#15
	bcc	.LBB7_210
; %bb.339:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_223
.LBB7_210:                              ;   in Loop: Header=BB7_28 Depth=1
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	adc	#240
	sta	__rc23
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc30
	jsr	__mulhi3
	ldy	#1
	sta	__rc2
	stx	__rc3
	lda	__rc25
	clc
	adc	__rc2
	tax
	lda	__rc31
	adc	__rc3
	sta	__rc2
	clc
	txa
	adc	#19
.LBB7_211:                              ;   in Loop: Header=BB7_28 Depth=1
	sta	__rc20
	lda	__rc2
	adc	#0
	sta	__rc21
	ldx	__rc23
.LBB7_212:                              ;   in Loop: Header=BB7_28 Depth=1
	stx	__rc2
	ldx	#0
.LBB7_213:                              ;   in Loop: Header=BB7_28 Depth=1
	stz	__rc23
	tya
	jsr	__ashlhi3
	eor	#255
	and	(__rc20)
	sta	(__rc20)
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc30
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	__rc25
	clc
	adc	__rc2
	sta	__rc2
	lda	__rc31
	adc	__rc3
	sta	__rc3
	ldy	#16
	lda	(__rc2),y
	dec
	sta	(__rc2),y
	lda	(__rc0),y                       ; 1-byte Folded Reload
	cmp	#2
	bcc	.LBB7_215
; %bb.214:                              ;   in Loop: Header=BB7_28 Depth=1
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
; %bb.279:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_221
.LBB7_215:                              ;   in Loop: Header=BB7_28 Depth=1
	ldx	__rc25
	stx	__rc20
	ldx	#40
	ldy	#1
	lda	#97
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
wait027:
	lda	53378
	bmi	wait027
	lda	53378
	and	#24
	beq	succeed027
	lda	#64
	sta	53376
	sec
	jmp	endsub027
succeed027:
	lda	#128
	trb	54921
	clc
	lda	#0
	sta	offsCurrIdx
	lda	flagCurrSec
	beq	upper027
	lda	#109
	sta	ptrMiniOffs+1
	jmp	endsub027
upper027:
	lda	#108
	sta	ptrMiniOffs+1
	jmp	endsub027
endsub027:
	bcs	err027
	lda	flagCurrSec
	jmp	end027
err027:
	lda	#255
end027:
	sta	__rc2

	;NO_APP
	ldx	__rc31
	stx	__rc21
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	lda	__rc24
	beq	.LBB7_218
; %bb.216:                              ;   in Loop: Header=BB7_28 Depth=1
	stz	__rc23
	stz	ptrMiniOffs
	ldx	#109
	stx	ptrMiniOffs+1
	ldx	#253
	stx	ptrMiniOffs+2
	ldx	#15
	stx	ptrMiniOffs+3
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
.LBB7_217:                              ;   Parent Loop BB7_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldy	__rc23
	lda	(__rc20),y
	sta	__rc4
	clc
	ldx	ptrMiniOffs+1
	stx	__rc2
	ldx	ptrMiniOffs+2
	stx	__rc3
	ldx	ptrMiniOffs+3
	lda	__rc23
	adc	ptrMiniOffs
	tay
	lda	__rc2
	adc	#0
	sta	__rc5
	lda	__rc3
	adc	#0
	sta	__rc2
	txa
	adc	#0
	sta	__rc3
	ldx	__rc5
	tya
	jsr	lpoke
	inc	__rc23
	bne	.LBB7_217
	bra	.LBB7_220
.LBB7_218:                              ;   in Loop: Header=BB7_28 Depth=1
	ldy	#0
	stz	ptrMiniOffs
	ldx	#108
	stx	ptrMiniOffs+1
	ldx	#253
	stx	ptrMiniOffs+2
	ldx	#15
	stx	ptrMiniOffs+3
.LBB7_219:                              ;   Parent Loop BB7_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc20),y
	sta	__rc4
	clc
	ldx	ptrMiniOffs+1
	stx	__rc2
	ldx	ptrMiniOffs+2
	stx	__rc3
	ldx	ptrMiniOffs+3
	tya
	adc	ptrMiniOffs
	sta	__rc5
	lda	__rc2
	adc	#0
	sta	__rc6
	lda	__rc3
	adc	#0
	sta	__rc2
	txa
	adc	#0
	sta	__rc3
	ldx	__rc6
	lda	__rc5
	sty	__rc23
	jsr	lpoke
	ldy	__rc23
	iny
	bne	.LBB7_219
.LBB7_220:                              ;   in Loop: Header=BB7_28 Depth=1
	sec
	lda	#1
	sbc	__rc24
	tay
	ldx	#40
	lda	#97
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
wait038:
	lda	53378
	bmi	wait038
	lda	53378
	and	#24
	beq	succeed038
	lda	#64
	sta	53376
	sec
	jmp	endsub038
succeed038:
	lda	#128
	trb	54921
	clc
endsub038:
	bcs	err038
	lda	#0
	jmp	end038
err038:
	lda	#255
end038:
	sta	__rc2

	;NO_APP
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
.LBB7_221:                              ;   in Loop: Header=BB7_28 Depth=1
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
.LBB7_222:                              ;   in Loop: Header=BB7_28 Depth=1
	sta	testtrack
	stx	mos8(testsector)
	ldx	#42
	stx	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#mos16lo(.L.str.6)
	stx	__rc2
	ldx	#mos16hi(.L.str.6)
	stx	__rc3
	stz	__rc20
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	lda	mos8(testsector)
	ldx	#mos16lo(.L.str.7)
	stx	__rc2
	ldx	#mos16hi(.L.str.7)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
; %bb.281:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_28
.LBB7_223:                              ;   in Loop: Header=BB7_28 Depth=1
	cmp	#32
	bcs	.LBB7_225
; %bb.224:                              ;   in Loop: Header=BB7_28 Depth=1
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	adc	#232
	sta	__rc23
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc30
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	__rc25
	clc
	adc	__rc2
	tax
	lda	__rc31
	adc	__rc3
	tay
	clc
	txa
	adc	#20
	bra	.LBB7_226
.LBB7_225:                              ;   in Loop: Header=BB7_28 Depth=1
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	adc	#224
	sta	__rc23
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc30
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	__rc25
	clc
	adc	__rc2
	tax
	lda	__rc31
	adc	__rc3
	tay
	clc
	txa
	adc	#21
.LBB7_226:                              ;   in Loop: Header=BB7_28 Depth=1
	sta	__rc20
	tya
	adc	#0
	sta	__rc21
	ldx	__rc23
	stx	__rc2
	ldx	#0
	ldy	#1
; %bb.283:                              ;   in Loop: Header=BB7_28 Depth=1
	jmp	.LBB7_213
.LBB7_227:
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
.LBB7_228:
	ldx	#mos16lo(.L.str.58)
	stx	__rc2
	ldx	#mos16hi(.L.str.58)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB7_236
.LBB7_229:                              ;   in Loop: Header=BB7_236 Depth=1
	cmp	#96
	bcc	.LBB7_231
; %bb.230:                              ;   in Loop: Header=BB7_236 Depth=1
	clc
	adc	#160
	bra	.LBB7_233
.LBB7_231:                              ;   in Loop: Header=BB7_236 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB7_233
; %bb.232:                              ;   in Loop: Header=BB7_236 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB7_233:                              ;   in Loop: Header=BB7_236 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB7_235
; %bb.234:                              ;   in Loop: Header=BB7_236 Depth=1
	inc	__rc5
.LBB7_235:                              ;   in Loop: Header=BB7_236 Depth=1
	tax
	beq	.LBB7_240
.LBB7_236:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB7_238
; %bb.237:                              ;   in Loop: Header=BB7_236 Depth=1
	inc	__rc3
.LBB7_238:                              ;   in Loop: Header=BB7_236 Depth=1
	cmp	#192
	bcc	.LBB7_229
; %bb.239:                              ;   in Loop: Header=BB7_236 Depth=1
	eor	#128
	bra	.LBB7_233
.LBB7_240:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB7_241:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB7_241
; %bb.242:
	stz	54800
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
	adc	#23
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.Lfunc_end7:
	.size	main, .Lfunc_end7-main
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end8:
	.size	escNOP, .Lfunc_end8-escNOP
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
.Lfunc_end9:
	.size	clrscr, .Lfunc_end9-clrscr
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
	bne	.LBB10_2
; %bb.1:
	dec	__rc20
.LBB10_2:
	lda	__rc20
	bne	.LBB10_5
; %bb.3:
	ldy	__rc23
	cpx	__rc22
	bne	.LBB10_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB10_7
.LBB10_5:
	ldy	__rc23
.LBB10_6:
	ldx	__rc22
	inx
.LBB10_7:
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
.Lfunc_end10:
	.size	cputcxy, .Lfunc_end10-cputcxy
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
	.section	.text.strcpy,"ax",@progbits
	.type	strcpy,@function                ; -- Begin function strcpy
strcpy:                                 ; @strcpy
; %bb.0:
	lda	(__rc4)
	sta	(__rc2)
	lda	(__rc4)
	beq	.LBB14_7
; %bb.1:
	ldy	#1
	ldx	__rc2
	stx	__rc6
	ldx	__rc3
	stx	__rc7
	ldx	__rc4
	stx	__rc8
	ldx	__rc5
	stx	__rc9
.LBB14_2:                               ; =>This Inner Loop Header: Depth=1
	inc	__rc8
	bne	.LBB14_4
; %bb.3:                                ;   in Loop: Header=BB14_2 Depth=1
	inc	__rc9
.LBB14_4:                               ;   in Loop: Header=BB14_2 Depth=1
	lda	(__rc4),y
	sta	(__rc6),y
	lda	(__rc4),y
	inc	__rc6
	bne	.LBB14_6
; %bb.5:                                ;   in Loop: Header=BB14_2 Depth=1
	inc	__rc7
.LBB14_6:                               ;   in Loop: Header=BB14_2 Depth=1
	ldx	__rc8
	stx	__rc4
	ldx	__rc9
	stx	__rc5
	tax
	bne	.LBB14_2
.LBB14_7:
	rts
.Lfunc_end14:
	.size	strcpy, .Lfunc_end14-strcpy
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB15_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB15_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB15_4
; %bb.3:                                ;   in Loop: Header=BB15_2 Depth=1
	inx
.LBB15_4:                               ;   in Loop: Header=BB15_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB15_2
	bra	.LBB15_6
.LBB15_5:
	stz	__rc4
	ldx	#0
.LBB15_6:
	lda	__rc4
	rts
.Lfunc_end15:
	.size	strlen, .Lfunc_end15-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB16_2
.LBB16_1:                               ;   in Loop: Header=BB16_2 Depth=1
	dex
	asl
.LBB16_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB16_1
; %bb.3:
	rts
.Lfunc_end16:
	.size	__ashlqi3, .Lfunc_end16-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB17_3
; %bb.1:
	ldx	__rc2
.LBB17_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB17_2
.LBB17_3:
	ldx	__rc3
	rts
.Lfunc_end17:
	.size	__ashlhi3, .Lfunc_end17-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB18_3
; %bb.1:
	ldx	__rc4
.LBB18_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB18_2
.LBB18_3:
	ldx	__rc5
	rts
.Lfunc_end18:
	.size	__ashlsi3, .Lfunc_end18-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB19_3
; %bb.1:
	ldx	__rc8
.LBB19_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB19_2
.LBB19_3:
	ldx	__rc9
	rts
.Lfunc_end19:
	.size	__ashldi3, .Lfunc_end19-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB20_2
.LBB20_1:                               ;   in Loop: Header=BB20_2 Depth=1
	dex
	lsr
.LBB20_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB20_1
; %bb.3:
	rts
.Lfunc_end20:
	.size	__lshrqi3, .Lfunc_end20-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB21_3
; %bb.1:
	ldx	__rc2
.LBB21_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB21_2
.LBB21_3:
	ldx	__rc3
	rts
.Lfunc_end21:
	.size	__lshrhi3, .Lfunc_end21-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB22_3
; %bb.1:
	ldx	__rc4
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB22_2
.LBB22_3:
	ldx	__rc5
	rts
.Lfunc_end22:
	.size	__lshrsi3, .Lfunc_end22-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB23_3
; %bb.1:
	ldx	__rc8
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB23_2
.LBB23_3:
	ldx	__rc9
	rts
.Lfunc_end23:
	.size	__lshrdi3, .Lfunc_end23-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB24_2
.LBB24_1:                               ;   in Loop: Header=BB24_2 Depth=1
	dex
	cmp	#128
	ror
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB24_1
; %bb.3:
	rts
.Lfunc_end24:
	.size	__ashrqi3, .Lfunc_end24-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB25_3
; %bb.1:
	ldx	__rc2
.LBB25_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB25_2
.LBB25_3:
	tax
	lda	__rc3
	rts
.Lfunc_end25:
	.size	__ashrhi3, .Lfunc_end25-__ashrhi3
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
	beq	.LBB26_3
; %bb.1:
	ldx	__rc4
.LBB26_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB26_2
.LBB26_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end26:
	.size	__ashrsi3, .Lfunc_end26-__ashrsi3
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
	beq	.LBB27_3
; %bb.1:
	ldx	__rc8
.LBB27_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB27_2
.LBB27_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end27:
	.size	__ashrdi3, .Lfunc_end27-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB28_2
.LBB28_1:                               ;   in Loop: Header=BB28_2 Depth=1
	dex
	cmp	#128
	rol
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB28_1
; %bb.3:
	rts
.Lfunc_end28:
	.size	__rotlqi3, .Lfunc_end28-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
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
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB29_2
.LBB29_3:
	tax
	lda	__rc3
	rts
.Lfunc_end29:
	.size	__rotlhi3, .Lfunc_end29-__rotlhi3
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
	beq	.LBB30_3
; %bb.1:
	ldx	__rc4
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB30_2
.LBB30_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end30:
	.size	__rotlsi3, .Lfunc_end30-__rotlsi3
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
	beq	.LBB31_3
; %bb.1:
	ldx	__rc8
.LBB31_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB31_2
.LBB31_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end31:
	.size	__rotldi3, .Lfunc_end31-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB32_2
.LBB32_1:                               ;   in Loop: Header=BB32_2 Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror
.LBB32_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB32_1
; %bb.3:
	rts
.Lfunc_end32:
	.size	__rotrqi3, .Lfunc_end32-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB33_3
; %bb.1:
	ldx	__rc2
.LBB33_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB33_2
.LBB33_3:
	ldx	__rc3
	rts
.Lfunc_end33:
	.size	__rotrhi3, .Lfunc_end33-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB34_3
; %bb.1:
	ldx	__rc4
.LBB34_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB34_2
.LBB34_3:
	ldx	__rc5
	rts
.Lfunc_end34:
	.size	__rotrsi3, .Lfunc_end34-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB35_3
; %bb.1:
	ldx	__rc8
.LBB35_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB35_2
.LBB35_3:
	ldx	__rc9
	rts
.Lfunc_end35:
	.size	__rotrdi3, .Lfunc_end35-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB36_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB36_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB36_4
; %bb.3:                                ;   in Loop: Header=BB36_2 Depth=1
	clc
	adc	__rc2
.LBB36_4:                               ;   in Loop: Header=BB36_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB36_2
; %bb.5:
	rts
.LBB36_6:
	lda	#0
	rts
.Lfunc_end36:
	.size	__mulqi3, .Lfunc_end36-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB37_2
; %bb.1:
	ldy	__rc2
	beq	.LBB37_7
.LBB37_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB37_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB37_5
; %bb.4:                                ;   in Loop: Header=BB37_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB37_5:                               ;   in Loop: Header=BB37_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB37_3
; %bb.6:                                ;   in Loop: Header=BB37_3 Depth=1
	ldx	__rc2
	bne	.LBB37_3
	bra	.LBB37_8
.LBB37_7:
	ldy	#0
	tya
.LBB37_8:
	tax
	tya
	rts
.Lfunc_end37:
	.size	__mulhi3, .Lfunc_end37-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB38_4
; %bb.1:
	ldy	__rc6
	bne	.LBB38_4
; %bb.2:
	ldy	__rc5
	bne	.LBB38_4
; %bb.3:
	ldy	__rc4
	bne	.LBB38_4
; %bb.13:
	jmp	.LBB38_12
.LBB38_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB38_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB38_7
; %bb.6:                                ;   in Loop: Header=BB38_5 Depth=1
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
.LBB38_7:                               ;   in Loop: Header=BB38_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB38_5
; %bb.8:                                ;   in Loop: Header=BB38_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB38_5
; %bb.9:                                ;   in Loop: Header=BB38_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB38_5
; %bb.10:                               ;   in Loop: Header=BB38_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB38_5
.LBB38_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB38_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB38_11
.Lfunc_end38:
	.size	__mulsi3, .Lfunc_end38-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB39_8
; %bb.1:
	ldy	__rc14
	bne	.LBB39_8
; %bb.2:
	ldy	__rc13
	bne	.LBB39_8
; %bb.3:
	ldy	__rc12
	bne	.LBB39_8
; %bb.4:
	ldy	__rc11
	bne	.LBB39_8
; %bb.5:
	ldy	__rc10
	bne	.LBB39_8
; %bb.6:
	ldy	__rc9
	bne	.LBB39_8
; %bb.7:
	ldy	__rc8
	bne	.LBB39_8
; %bb.21:
	jmp	.LBB39_20
.LBB39_8:
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
.LBB39_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB39_11
; %bb.10:                               ;   in Loop: Header=BB39_9 Depth=1
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
.LBB39_11:                              ;   in Loop: Header=BB39_9 Depth=1
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
	beq	.LBB39_12
; %bb.23:                               ;   in Loop: Header=BB39_9 Depth=1
	jmp	.LBB39_9
.LBB39_12:                              ;   in Loop: Header=BB39_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB39_13
; %bb.25:                               ;   in Loop: Header=BB39_9 Depth=1
	jmp	.LBB39_9
.LBB39_13:                              ;   in Loop: Header=BB39_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB39_14
; %bb.27:                               ;   in Loop: Header=BB39_9 Depth=1
	jmp	.LBB39_9
.LBB39_14:                              ;   in Loop: Header=BB39_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB39_15
; %bb.29:                               ;   in Loop: Header=BB39_9 Depth=1
	jmp	.LBB39_9
.LBB39_15:                              ;   in Loop: Header=BB39_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB39_16
; %bb.31:                               ;   in Loop: Header=BB39_9 Depth=1
	jmp	.LBB39_9
.LBB39_16:                              ;   in Loop: Header=BB39_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB39_17
; %bb.33:                               ;   in Loop: Header=BB39_9 Depth=1
	jmp	.LBB39_9
.LBB39_17:                              ;   in Loop: Header=BB39_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB39_18
; %bb.35:                               ;   in Loop: Header=BB39_9 Depth=1
	jmp	.LBB39_9
.LBB39_18:                              ;   in Loop: Header=BB39_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB39_19
; %bb.37:                               ;   in Loop: Header=BB39_9 Depth=1
	jmp	.LBB39_9
.LBB39_19:
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
.LBB39_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB39_19
.Lfunc_end39:
	.size	__muldi3, .Lfunc_end39-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB40_1
; %bb.15:
	jmp	.LBB40_14
.LBB40_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB40_2
; %bb.17:
	jmp	.LBB40_14
.LBB40_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB40_3
; %bb.19:
	jmp	.LBB40_14
.LBB40_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB40_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB40_6
; %bb.5:                                ;   in Loop: Header=BB40_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB40_8
	bra	.LBB40_7
.LBB40_6:                               ;   in Loop: Header=BB40_4 Depth=1
	cpy	__rc4
	bcc	.LBB40_8
.LBB40_7:                               ;   in Loop: Header=BB40_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB40_4
	bra	.LBB40_9
.LBB40_8:
	ldy	__rc3
	sty	__rc2
.LBB40_9:
	cpx	#0
	beq	.LBB40_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB40_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB40_13
; %bb.12:                               ;   in Loop: Header=BB40_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB40_13:                              ;   in Loop: Header=BB40_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB40_11
.LBB40_14:
	rts
.Lfunc_end40:
	.size	__udivqi3, .Lfunc_end40-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB41_2
; %bb.1:
	ldy	__rc2
	beq	.LBB41_4
.LBB41_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB41_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB41_6
.LBB41_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB41_22
.LBB41_5:
	cmp	__rc3
	bcc	.LBB41_4
.LBB41_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB41_7
; %bb.25:
	jmp	.LBB41_22
.LBB41_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB41_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB41_10
; %bb.9:                                ;   in Loop: Header=BB41_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB41_12
	bra	.LBB41_11
.LBB41_10:                              ;   in Loop: Header=BB41_8 Depth=1
	cmp	__rc6
	bcc	.LBB41_12
.LBB41_11:                              ;   in Loop: Header=BB41_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB41_8
	bra	.LBB41_13
.LBB41_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB41_13:
	cpx	#0
	bne	.LBB41_14
; %bb.27:
	jmp	.LBB41_22
.LBB41_14:
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
.LBB41_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB41_17
; %bb.16:                               ;   in Loop: Header=BB41_15 Depth=1
	ldy	#0
.LBB41_17:                              ;   in Loop: Header=BB41_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB41_21
; %bb.18:                               ;   in Loop: Header=BB41_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB41_20
.LBB41_19:                              ;   in Loop: Header=BB41_15 Depth=1
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
.LBB41_20:                              ;   in Loop: Header=BB41_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB41_15
	bra	.LBB41_22
.LBB41_21:                              ;   in Loop: Header=BB41_15 Depth=1
	cmp	__rc6
	bcs	.LBB41_19
	bra	.LBB41_20
.LBB41_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end41:
	.size	__udivhi3, .Lfunc_end41-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
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
	beq	.LBB42_9
.LBB42_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB42_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB42_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB42_7
; %bb.45:
	jmp	.LBB42_38
.LBB42_7:
	cmp	__rc4
	bcc	.LBB42_9
	bra	.LBB42_11
.LBB42_8:
	cpx	__rc7
	bcs	.LBB42_11
.LBB42_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB42_21
.LBB42_10:
	cpx	__rc6
	bcc	.LBB42_9
.LBB42_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB42_12
; %bb.47:
	jmp	.LBB42_21
.LBB42_12:
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
.LBB42_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB42_17
; %bb.14:                               ;   in Loop: Header=BB42_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB42_18
; %bb.15:                               ;   in Loop: Header=BB42_13 Depth=1
	cmp	__rc10
	bne	.LBB42_19
; %bb.16:                               ;   in Loop: Header=BB42_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB42_23
	bra	.LBB42_20
.LBB42_17:                              ;   in Loop: Header=BB42_13 Depth=1
	cpy	__rc12
	bcc	.LBB42_23
	bra	.LBB42_20
.LBB42_18:                              ;   in Loop: Header=BB42_13 Depth=1
	cpy	__rc11
	bcc	.LBB42_23
	bra	.LBB42_20
.LBB42_19:                              ;   in Loop: Header=BB42_13 Depth=1
	cmp	__rc10
	bcc	.LBB42_23
.LBB42_20:                              ;   in Loop: Header=BB42_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB42_13
	bra	.LBB42_24
.LBB42_21:
	stz	__rc2
	stz	__rc3
.LBB42_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB42_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB42_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB42_22
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
.LBB42_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB42_28
; %bb.27:                               ;   in Loop: Header=BB42_26 Depth=1
	ldy	#0
.LBB42_28:                              ;   in Loop: Header=BB42_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB42_32
; %bb.29:                               ;   in Loop: Header=BB42_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB42_34
; %bb.30:                               ;   in Loop: Header=BB42_26 Depth=1
	cmp	__rc10
	bne	.LBB42_37
; %bb.31:                               ;   in Loop: Header=BB42_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB42_33
	bra	.LBB42_35
.LBB42_32:                              ;   in Loop: Header=BB42_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB42_35
.LBB42_33:                              ;   in Loop: Header=BB42_26 Depth=1
	lda	__rc6
	bra	.LBB42_36
.LBB42_34:                              ;   in Loop: Header=BB42_26 Depth=1
	cpy	__rc11
	bcc	.LBB42_33
.LBB42_35:                              ;   in Loop: Header=BB42_26 Depth=1
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
.LBB42_36:                              ;   in Loop: Header=BB42_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB42_41
; %bb.49:                               ;   in Loop: Header=BB42_26 Depth=1
	jmp	.LBB42_26
.LBB42_41:
	jmp	.LBB42_22
.LBB42_37:                              ;   in Loop: Header=BB42_26 Depth=1
	cmp	__rc10
	bcc	.LBB42_33
	bra	.LBB42_35
.LBB42_38:
	cpx	__rc5
	bcs	.LBB42_43
; %bb.51:
	jmp	.LBB42_9
.LBB42_43:
	jmp	.LBB42_11
.Lfunc_end42:
	.size	__udivsi3, .Lfunc_end42-__udivsi3
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
	bne	.LBB43_8
; %bb.1:
	ldx	__rc14
	bne	.LBB43_8
; %bb.2:
	ldx	__rc13
	bne	.LBB43_8
; %bb.3:
	ldx	__rc12
	bne	.LBB43_8
; %bb.4:
	ldx	__rc11
	bne	.LBB43_8
; %bb.5:
	ldx	__rc10
	bne	.LBB43_8
; %bb.6:
	ldx	__rc9
	bne	.LBB43_8
; %bb.7:
	ldx	__rc8
	beq	.LBB43_17
.LBB43_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB43_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB43_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB43_11
; %bb.90:
	jmp	.LBB43_31
.LBB43_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB43_12
; %bb.92:
	jmp	.LBB43_32
.LBB43_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB43_13
; %bb.94:
	jmp	.LBB43_38
.LBB43_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB43_14
; %bb.96:
	jmp	.LBB43_40
.LBB43_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB43_15
; %bb.98:
	jmp	.LBB43_42
.LBB43_15:
	cmp	__rc8
	bcc	.LBB43_17
	bra	.LBB43_19
.LBB43_16:
	cpx	__rc15
	bcs	.LBB43_19
.LBB43_17:
	lda	#0
; %bb.66:
	jmp	.LBB43_29
.LBB43_18:
	cpx	__rc14
	bcc	.LBB43_17
.LBB43_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB43_20
; %bb.100:
	jmp	.LBB43_29
.LBB43_20:
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
.LBB43_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB43_25
; %bb.22:                               ;   in Loop: Header=BB43_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB43_26
; %bb.23:                               ;   in Loop: Header=BB43_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB43_27
; %bb.24:                               ;   in Loop: Header=BB43_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB43_102
; %bb.150:                              ;   in Loop: Header=BB43_21 Depth=1
	jmp	.LBB43_33
.LBB43_102:                             ;   in Loop: Header=BB43_21 Depth=1
	jmp	.LBB43_37
.LBB43_25:                              ;   in Loop: Header=BB43_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB43_28
; %bb.104:
	jmp	.LBB43_44
.LBB43_26:                              ;   in Loop: Header=BB43_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB43_28
; %bb.106:
	jmp	.LBB43_44
.LBB43_27:                              ;   in Loop: Header=BB43_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB43_28
; %bb.108:
	jmp	.LBB43_44
.LBB43_28:                              ;   in Loop: Header=BB43_21 Depth=1
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
	bmi	.LBB43_68
; %bb.110:                              ;   in Loop: Header=BB43_21 Depth=1
	jmp	.LBB43_21
.LBB43_68:
	jmp	.LBB43_45
.LBB43_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB43_30:
	ldx	__rc18
	rts
.LBB43_31:
	cpx	__rc13
	bcs	.LBB43_70
; %bb.112:
	jmp	.LBB43_17
.LBB43_70:
	jmp	.LBB43_19
.LBB43_32:
	cpx	__rc12
	bcs	.LBB43_72
; %bb.114:
	jmp	.LBB43_17
.LBB43_72:
	jmp	.LBB43_19
.LBB43_33:                              ;   in Loop: Header=BB43_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB43_39
; %bb.34:                               ;   in Loop: Header=BB43_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB43_41
; %bb.35:                               ;   in Loop: Header=BB43_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB43_43
; %bb.36:                               ;   in Loop: Header=BB43_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB43_44
; %bb.74:                               ;   in Loop: Header=BB43_21 Depth=1
	jmp	.LBB43_28
.LBB43_37:                              ;   in Loop: Header=BB43_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB43_44
; %bb.76:                               ;   in Loop: Header=BB43_21 Depth=1
	jmp	.LBB43_28
.LBB43_38:
	cpx	__rc11
	bcs	.LBB43_78
; %bb.116:
	jmp	.LBB43_17
.LBB43_78:
	jmp	.LBB43_19
.LBB43_39:                              ;   in Loop: Header=BB43_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB43_44
; %bb.80:                               ;   in Loop: Header=BB43_21 Depth=1
	jmp	.LBB43_28
.LBB43_40:
	cpx	__rc10
	bcs	.LBB43_82
; %bb.118:
	jmp	.LBB43_17
.LBB43_82:
	jmp	.LBB43_19
.LBB43_41:                              ;   in Loop: Header=BB43_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB43_44
; %bb.84:                               ;   in Loop: Header=BB43_21 Depth=1
	jmp	.LBB43_28
.LBB43_42:
	cpx	__rc9
	bcs	.LBB43_86
; %bb.120:
	jmp	.LBB43_17
.LBB43_86:
	jmp	.LBB43_19
.LBB43_43:                              ;   in Loop: Header=BB43_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB43_44
; %bb.122:                              ;   in Loop: Header=BB43_21 Depth=1
	jmp	.LBB43_28
.LBB43_44:
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
.LBB43_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB43_46
; %bb.124:
	jmp	.LBB43_30
.LBB43_46:
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
.LBB43_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB43_49
; %bb.48:                               ;   in Loop: Header=BB43_47 Depth=1
	ldy	#0
.LBB43_49:                              ;   in Loop: Header=BB43_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB43_57
; %bb.50:                               ;   in Loop: Header=BB43_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB43_51
; %bb.126:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_60
.LBB43_51:                              ;   in Loop: Header=BB43_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB43_52
; %bb.128:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_61
.LBB43_52:                              ;   in Loop: Header=BB43_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB43_53
; %bb.130:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_62
.LBB43_53:                              ;   in Loop: Header=BB43_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB43_54
; %bb.132:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_63
.LBB43_54:                              ;   in Loop: Header=BB43_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB43_55
; %bb.134:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_64
.LBB43_55:                              ;   in Loop: Header=BB43_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB43_56
; %bb.136:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_65
.LBB43_56:                              ;   in Loop: Header=BB43_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB43_58
	bra	.LBB43_59
.LBB43_57:                              ;   in Loop: Header=BB43_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB43_59
.LBB43_58:                              ;   in Loop: Header=BB43_47 Depth=1
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
.LBB43_59:                              ;   in Loop: Header=BB43_47 Depth=1
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
	beq	.LBB43_88
; %bb.138:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_47
.LBB43_88:
	jmp	.LBB43_30
.LBB43_60:                              ;   in Loop: Header=BB43_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB43_58
	bra	.LBB43_59
.LBB43_61:                              ;   in Loop: Header=BB43_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB43_59
; %bb.140:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_58
.LBB43_62:                              ;   in Loop: Header=BB43_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB43_59
; %bb.142:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_58
.LBB43_63:                              ;   in Loop: Header=BB43_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB43_59
; %bb.144:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_58
.LBB43_64:                              ;   in Loop: Header=BB43_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB43_59
; %bb.146:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_58
.LBB43_65:                              ;   in Loop: Header=BB43_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB43_59
; %bb.148:                              ;   in Loop: Header=BB43_47 Depth=1
	jmp	.LBB43_58
.Lfunc_end43:
	.size	__udivdi3, .Lfunc_end43-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB44_1
; %bb.15:
	jmp	.LBB44_13
.LBB44_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB44_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB44_14
; %bb.3:
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
	cmp	__rc2
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
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB44_13
.LBB44_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB44_12
; %bb.11:                               ;   in Loop: Header=BB44_10 Depth=1
	sec
	sbc	__rc2
.LBB44_12:                              ;   in Loop: Header=BB44_10 Depth=1
	dex
	bne	.LBB44_10
.LBB44_13:
	rts
.LBB44_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end44:
	.size	__umodqi3, .Lfunc_end44-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB45_2
; %bb.1:
	ldx	__rc2
	bne	.LBB45_2
; %bb.22:
	jmp	.LBB45_19
.LBB45_2:
	cmp	__rc3
	bne	.LBB45_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB45_5
; %bb.20:
	jmp	.LBB45_19
.LBB45_4:
	cmp	__rc3
	bcs	.LBB45_5
; %bb.24:
	jmp	.LBB45_19
.LBB45_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB45_6
; %bb.26:
	jmp	.LBB45_18
.LBB45_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB45_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB45_9
; %bb.8:                                ;   in Loop: Header=BB45_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB45_11
	bra	.LBB45_10
.LBB45_9:                               ;   in Loop: Header=BB45_7 Depth=1
	cmp	__rc5
	bcc	.LBB45_11
.LBB45_10:                              ;   in Loop: Header=BB45_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB45_7
	bra	.LBB45_12
.LBB45_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB45_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB45_19
.LBB45_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB45_17
; %bb.14:                               ;   in Loop: Header=BB45_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB45_16
.LBB45_15:                              ;   in Loop: Header=BB45_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB45_16:                              ;   in Loop: Header=BB45_13 Depth=1
	dex
	bne	.LBB45_13
	bra	.LBB45_19
.LBB45_17:                              ;   in Loop: Header=BB45_13 Depth=1
	cmp	__rc5
	bcs	.LBB45_15
	bra	.LBB45_16
.LBB45_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB45_19:
	tax
	tya
	rts
.Lfunc_end45:
	.size	__umodhi3, .Lfunc_end45-__umodhi3
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
	bne	.LBB46_4
; %bb.1:
	ldx	__rc6
	bne	.LBB46_4
; %bb.2:
	ldx	__rc5
	bne	.LBB46_4
; %bb.3:
	ldx	__rc4
	bne	.LBB46_4
; %bb.42:
	jmp	.LBB46_35
.LBB46_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB46_8
; %bb.5:
	cmp	__rc6
	bne	.LBB46_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB46_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB46_11
; %bb.36:
	jmp	.LBB46_35
.LBB46_8:
	cpx	__rc7
	bcs	.LBB46_11
; %bb.38:
	jmp	.LBB46_35
.LBB46_9:
	cmp	__rc6
	bcs	.LBB46_11
; %bb.40:
	jmp	.LBB46_35
.LBB46_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB46_11
; %bb.44:
	jmp	.LBB46_35
.LBB46_11:
	ldx	__rc7
	bpl	.LBB46_12
; %bb.46:
	jmp	.LBB46_33
.LBB46_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB46_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB46_17
; %bb.14:                               ;   in Loop: Header=BB46_13 Depth=1
	cmp	__rc8
	bne	.LBB46_18
; %bb.15:                               ;   in Loop: Header=BB46_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB46_19
; %bb.16:                               ;   in Loop: Header=BB46_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB46_21
	bra	.LBB46_20
.LBB46_17:                              ;   in Loop: Header=BB46_13 Depth=1
	cpy	__rc9
	bcc	.LBB46_21
	bra	.LBB46_20
.LBB46_18:                              ;   in Loop: Header=BB46_13 Depth=1
	cmp	__rc8
	bcc	.LBB46_21
	bra	.LBB46_20
.LBB46_19:                              ;   in Loop: Header=BB46_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB46_21
.LBB46_20:                              ;   in Loop: Header=BB46_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB46_13
	bra	.LBB46_22
.LBB46_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB46_22:
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
	bne	.LBB46_23
; %bb.48:
	jmp	.LBB46_34
.LBB46_23:
	tya
.LBB46_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB46_28
; %bb.25:                               ;   in Loop: Header=BB46_24 Depth=1
	cmp	__rc8
	bne	.LBB46_31
; %bb.26:                               ;   in Loop: Header=BB46_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB46_32
; %bb.27:                               ;   in Loop: Header=BB46_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB46_29
	bra	.LBB46_30
.LBB46_28:                              ;   in Loop: Header=BB46_24 Depth=1
	cpy	__rc9
	bcc	.LBB46_30
.LBB46_29:                              ;   in Loop: Header=BB46_24 Depth=1
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
.LBB46_30:                              ;   in Loop: Header=BB46_24 Depth=1
	dex
	bne	.LBB46_24
	bra	.LBB46_35
.LBB46_31:                              ;   in Loop: Header=BB46_24 Depth=1
	cmp	__rc8
	bcs	.LBB46_29
	bra	.LBB46_30
.LBB46_32:                              ;   in Loop: Header=BB46_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB46_29
	bra	.LBB46_30
.LBB46_33:
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
	bra	.LBB46_35
.LBB46_34:
	tya
.LBB46_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end46:
	.size	__umodsi3, .Lfunc_end46-__umodsi3
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
	bne	.LBB47_8
; %bb.90:
	jmp	.LBB47_61
.LBB47_8:
	cmp	__rc15
	bne	.LBB47_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB47_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB47_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB47_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB47_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB47_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB47_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB47_23
; %bb.62:
	jmp	.LBB47_61
.LBB47_16:
	cmp	__rc15
	bcs	.LBB47_23
; %bb.64:
	jmp	.LBB47_61
.LBB47_17:
	cpx	__rc14
	bcs	.LBB47_23
; %bb.66:
	jmp	.LBB47_61
.LBB47_18:
	cpx	__rc13
	bcs	.LBB47_23
; %bb.68:
	jmp	.LBB47_61
.LBB47_19:
	cpx	__rc12
	bcs	.LBB47_23
; %bb.70:
	jmp	.LBB47_61
.LBB47_20:
	cpx	__rc11
	bcs	.LBB47_23
; %bb.72:
	jmp	.LBB47_61
.LBB47_21:
	cpx	__rc10
	bcs	.LBB47_23
; %bb.74:
	jmp	.LBB47_61
.LBB47_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB47_23
; %bb.92:
	jmp	.LBB47_61
.LBB47_23:
	ldx	__rc15
	bpl	.LBB47_24
; %bb.94:
	jmp	.LBB47_33
.LBB47_24:
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
.LBB47_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB47_29
; %bb.26:                               ;   in Loop: Header=BB47_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB47_30
; %bb.27:                               ;   in Loop: Header=BB47_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB47_31
; %bb.28:                               ;   in Loop: Header=BB47_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB47_76
; %bb.96:                               ;   in Loop: Header=BB47_25 Depth=1
	jmp	.LBB47_38
.LBB47_76:                              ;   in Loop: Header=BB47_25 Depth=1
	jmp	.LBB47_34
.LBB47_29:                              ;   in Loop: Header=BB47_25 Depth=1
	cmp	__rc19
	bcs	.LBB47_32
; %bb.98:
	jmp	.LBB47_42
.LBB47_30:                              ;   in Loop: Header=BB47_25 Depth=1
	cpy	__rc18
	bcs	.LBB47_32
; %bb.100:
	jmp	.LBB47_42
.LBB47_31:                              ;   in Loop: Header=BB47_25 Depth=1
	cpy	__rc7
	bcs	.LBB47_32
; %bb.102:
	jmp	.LBB47_42
.LBB47_32:                              ;   in Loop: Header=BB47_25 Depth=1
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
	bmi	.LBB47_78
; %bb.104:                              ;   in Loop: Header=BB47_25 Depth=1
	jmp	.LBB47_25
.LBB47_78:
	jmp	.LBB47_43
.LBB47_33:
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
	jmp	.LBB47_61
.LBB47_34:                              ;   in Loop: Header=BB47_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB47_39
; %bb.35:                               ;   in Loop: Header=BB47_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB47_40
; %bb.36:                               ;   in Loop: Header=BB47_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB47_41
; %bb.37:                               ;   in Loop: Header=BB47_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB47_42
; %bb.82:                               ;   in Loop: Header=BB47_25 Depth=1
	jmp	.LBB47_32
.LBB47_38:                              ;   in Loop: Header=BB47_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB47_42
; %bb.84:                               ;   in Loop: Header=BB47_25 Depth=1
	jmp	.LBB47_32
.LBB47_39:                              ;   in Loop: Header=BB47_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB47_42
; %bb.86:                               ;   in Loop: Header=BB47_25 Depth=1
	jmp	.LBB47_32
.LBB47_40:                              ;   in Loop: Header=BB47_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB47_42
; %bb.88:                               ;   in Loop: Header=BB47_25 Depth=1
	jmp	.LBB47_32
.LBB47_41:                              ;   in Loop: Header=BB47_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB47_42
; %bb.106:                              ;   in Loop: Header=BB47_25 Depth=1
	jmp	.LBB47_32
.LBB47_42:
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
.LBB47_43:
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
	bne	.LBB47_44
; %bb.108:
	jmp	.LBB47_61
.LBB47_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB47_52
; %bb.45:                               ;   in Loop: Header=BB47_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB47_46
; %bb.110:                              ;   in Loop: Header=BB47_44 Depth=1
	jmp	.LBB47_55
.LBB47_46:                              ;   in Loop: Header=BB47_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB47_47
; %bb.112:                              ;   in Loop: Header=BB47_44 Depth=1
	jmp	.LBB47_56
.LBB47_47:                              ;   in Loop: Header=BB47_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB47_48
; %bb.114:                              ;   in Loop: Header=BB47_44 Depth=1
	jmp	.LBB47_57
.LBB47_48:                              ;   in Loop: Header=BB47_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB47_49
; %bb.116:                              ;   in Loop: Header=BB47_44 Depth=1
	jmp	.LBB47_58
.LBB47_49:                              ;   in Loop: Header=BB47_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB47_50
; %bb.118:                              ;   in Loop: Header=BB47_44 Depth=1
	jmp	.LBB47_59
.LBB47_50:                              ;   in Loop: Header=BB47_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB47_51
; %bb.120:                              ;   in Loop: Header=BB47_44 Depth=1
	jmp	.LBB47_60
.LBB47_51:                              ;   in Loop: Header=BB47_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB47_53
	bra	.LBB47_54
.LBB47_52:                              ;   in Loop: Header=BB47_44 Depth=1
	cmp	__rc19
	bcc	.LBB47_54
.LBB47_53:                              ;   in Loop: Header=BB47_44 Depth=1
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
.LBB47_54:                              ;   in Loop: Header=BB47_44 Depth=1
	dex
	beq	.LBB47_61
; %bb.122:                              ;   in Loop: Header=BB47_44 Depth=1
	jmp	.LBB47_44
.LBB47_55:                              ;   in Loop: Header=BB47_44 Depth=1
	cpy	__rc18
	bcs	.LBB47_53
	bra	.LBB47_54
.LBB47_56:                              ;   in Loop: Header=BB47_44 Depth=1
	cpy	__rc7
	bcs	.LBB47_53
	bra	.LBB47_54
.LBB47_57:                              ;   in Loop: Header=BB47_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB47_53
	bra	.LBB47_54
.LBB47_58:                              ;   in Loop: Header=BB47_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB47_53
	bra	.LBB47_54
.LBB47_59:                              ;   in Loop: Header=BB47_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB47_53
	bra	.LBB47_54
.LBB47_60:                              ;   in Loop: Header=BB47_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB47_54
; %bb.124:                              ;   in Loop: Header=BB47_44 Depth=1
	jmp	.LBB47_53
.LBB47_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end47:
	.size	__umoddi3, .Lfunc_end47-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB48_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB48_2
; %bb.18:
	jmp	.LBB48_17
.LBB48_2:
	lda	__rc5
	bpl	.LBB48_3
; %bb.20:
	jmp	.LBB48_15
.LBB48_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB48_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB48_6
; %bb.5:                                ;   in Loop: Header=BB48_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB48_9
	bra	.LBB48_7
.LBB48_6:                               ;   in Loop: Header=BB48_4 Depth=1
	cpy	__rc6
	bcc	.LBB48_9
.LBB48_7:                               ;   in Loop: Header=BB48_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB48_4
	bra	.LBB48_10
.LBB48_8:
	sty	__rc7
	bra	.LBB48_17
.LBB48_9:
	ldy	__rc5
	sty	__rc4
.LBB48_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB48_16
; %bb.11:
	lda	#1
.LBB48_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB48_14
; %bb.13:                               ;   in Loop: Header=BB48_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB48_14:                              ;   in Loop: Header=BB48_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB48_12
	bra	.LBB48_17
.LBB48_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB48_16:
	lda	#1
.LBB48_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end48:
	.size	__udivmodqi4, .Lfunc_end48-__udivmodqi4
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
	bne	.LBB49_2
; %bb.1:
	ldx	__rc2
	beq	.LBB49_4
.LBB49_2:
	cmp	__rc3
	bne	.LBB49_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB49_6
.LBB49_4:
	ldx	#0
; %bb.26:
	jmp	.LBB49_24
.LBB49_5:
	cmp	__rc3
	bcc	.LBB49_4
.LBB49_6:
	tay
	ldx	__rc3
	bpl	.LBB49_7
; %bb.28:
	jmp	.LBB49_22
.LBB49_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB49_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB49_10
; %bb.9:                                ;   in Loop: Header=BB49_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB49_11
	bra	.LBB49_12
.LBB49_10:                              ;   in Loop: Header=BB49_8 Depth=1
	cmp	__rc8
	bcc	.LBB49_12
.LBB49_11:                              ;   in Loop: Header=BB49_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB49_8
	bra	.LBB49_13
.LBB49_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB49_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB49_14
; %bb.30:
	jmp	.LBB49_23
.LBB49_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB49_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB49_17
; %bb.16:                               ;   in Loop: Header=BB49_15 Depth=1
	ldy	#0
.LBB49_17:                              ;   in Loop: Header=BB49_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB49_21
; %bb.18:                               ;   in Loop: Header=BB49_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB49_20
.LBB49_19:                              ;   in Loop: Header=BB49_15 Depth=1
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
.LBB49_20:                              ;   in Loop: Header=BB49_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB49_15
	bra	.LBB49_25
.LBB49_21:                              ;   in Loop: Header=BB49_15 Depth=1
	cmp	__rc8
	bcs	.LBB49_19
	bra	.LBB49_20
.LBB49_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB49_23:
	ldx	#1
.LBB49_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB49_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end49:
	.size	__udivmodhi4, .Lfunc_end49-__udivmodhi4
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
	bpl	.LBB50_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB50_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB50_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB50_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB50_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB50_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB50_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB50_8:
	lda	__rc2
	rts
.Lfunc_end50:
	.size	__divqi3, .Lfunc_end50-__divqi3
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
	bmi	.LBB51_2
; %bb.1:
	bra	.LBB51_6
.LBB51_2:
	cpx	#128
	bne	.LBB51_5
; %bb.3:
	lda	__rc4
	bne	.LBB51_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB51_6
.LBB51_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB51_6:
	tya
	bmi	.LBB51_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB51_12
.LBB51_8:
	cpy	#128
	bne	.LBB51_11
; %bb.9:
	lda	__rc2
	bne	.LBB51_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB51_12
.LBB51_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB51_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB51_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB51_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end51:
	.size	__divhi3, .Lfunc_end51-__divhi3
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
	bmi	.LBB52_2
; %bb.1:
	ldy	__rc3
	bra	.LBB52_8
.LBB52_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB52_7
; %bb.3:
	lda	__rc2
	bne	.LBB52_7
; %bb.4:
	lda	__rc8
	bne	.LBB52_7
; %bb.5:
	lda	__rc9
	bne	.LBB52_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB52_8
.LBB52_7:
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
.LBB52_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB52_10
; %bb.9:
	lda	__rc7
	bra	.LBB52_16
.LBB52_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB52_15
; %bb.11:
	lda	__rc6
	bne	.LBB52_15
; %bb.12:
	lda	__rc5
	bne	.LBB52_15
; %bb.13:
	lda	__rc4
	bne	.LBB52_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB52_16
.LBB52_15:
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
.LBB52_16:
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
	bne	.LBB52_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB52_19
.LBB52_18:
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
.LBB52_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end52:
	.size	__divsi3, .Lfunc_end52-__divsi3
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
	bmi	.LBB53_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB53_12
.LBB53_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB53_11
; %bb.3:
	lda	__rc6
	bne	.LBB53_11
; %bb.4:
	lda	__rc5
	bne	.LBB53_11
; %bb.5:
	lda	__rc4
	bne	.LBB53_11
; %bb.6:
	lda	__rc3
	bne	.LBB53_11
; %bb.7:
	lda	__rc2
	bne	.LBB53_11
; %bb.8:
	lda	__rc18
	bne	.LBB53_11
; %bb.9:
	lda	__rc19
	bne	.LBB53_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB53_12
.LBB53_11:
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
.LBB53_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB53_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB53_24
.LBB53_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB53_23
; %bb.15:
	lda	__rc14
	bne	.LBB53_23
; %bb.16:
	lda	__rc13
	bne	.LBB53_23
; %bb.17:
	lda	__rc12
	bne	.LBB53_23
; %bb.18:
	lda	__rc11
	bne	.LBB53_23
; %bb.19:
	lda	__rc10
	bne	.LBB53_23
; %bb.20:
	lda	__rc9
	bne	.LBB53_23
; %bb.21:
	lda	__rc8
	bne	.LBB53_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB53_24
.LBB53_23:
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
.LBB53_24:
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
	bne	.LBB53_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB53_27
.LBB53_26:
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
.LBB53_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end53:
	.size	__divdi3, .Lfunc_end53-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB54_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB54_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB54_3:
	tay
	lda	__rc2
	bmi	.LBB54_5
; %bb.4:
	lda	__rc2
	bra	.LBB54_7
.LBB54_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB54_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB54_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB54_9
; %bb.8:
	rts
.LBB54_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end54:
	.size	__modqi3, .Lfunc_end54-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB55_2
; %bb.1:
	txa
	bra	.LBB55_6
.LBB55_2:
	cpx	#128
	bne	.LBB55_5
; %bb.3:
	lda	__rc4
	bne	.LBB55_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB55_6
.LBB55_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB55_6:
	ldx	__rc3
	bpl	.LBB55_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB55_10
; %bb.8:
	ldx	__rc2
	bne	.LBB55_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB55_11
.LBB55_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB55_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB55_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB55_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end55:
	.size	__modhi3, .Lfunc_end55-__modhi3
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
	bmi	.LBB56_2
; %bb.1:
	lda	__rc3
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
	lda	#128
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
	sbc	mos8(.L__modsi3_zp_stk)
.LBB56_8:
	ldx	__rc7
	bpl	.LBB56_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB56_14
; %bb.10:
	ldx	__rc6
	bne	.LBB56_14
; %bb.11:
	ldx	__rc5
	bne	.LBB56_14
; %bb.12:
	ldx	__rc4
	bne	.LBB56_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB56_15
.LBB56_14:
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
.LBB56_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB56_17
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
.LBB56_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end56:
	.size	__modsi3, .Lfunc_end56-__modsi3
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
	bmi	.LBB57_2
; %bb.1:
	lda	__rc7
; %bb.26:
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
	lda	#128
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
	sbc	mos8(.L__moddi3_zp_stk)
.LBB57_12:
	ldx	__rc15
	bmi	.LBB57_13
; %bb.28:
	jmp	.LBB57_23
.LBB57_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB57_22
; %bb.14:
	ldx	__rc14
	bne	.LBB57_22
; %bb.15:
	ldx	__rc13
	bne	.LBB57_22
; %bb.16:
	ldx	__rc12
	bne	.LBB57_22
; %bb.17:
	ldx	__rc11
	bne	.LBB57_22
; %bb.18:
	ldx	__rc10
	bne	.LBB57_22
; %bb.19:
	ldx	__rc9
	bne	.LBB57_22
; %bb.20:
	ldx	__rc8
	bne	.LBB57_22
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
	bra	.LBB57_23
.LBB57_22:
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
.LBB57_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB57_25
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
.LBB57_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end57:
	.size	__moddi3, .Lfunc_end57-__moddi3
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
	bpl	.LBB58_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB58_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB58_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB58_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB58_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB58_11
.LBB58_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB58_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB58_8
; %bb.34:
	jmp	.LBB58_24
.LBB58_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB58_24
.LBB58_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB58_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB58_12
.LBB58_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB58_24
.LBB58_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB58_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB58_15
; %bb.14:                               ;   in Loop: Header=BB58_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB58_18
	bra	.LBB58_16
.LBB58_15:                              ;   in Loop: Header=BB58_13 Depth=1
	cmp	__rc7
	bcc	.LBB58_18
.LBB58_16:                              ;   in Loop: Header=BB58_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB58_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB58_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB58_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB58_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB58_22
; %bb.21:                               ;   in Loop: Header=BB58_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB58_22:                              ;   in Loop: Header=BB58_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB58_20
	bra	.LBB58_24
.LBB58_23:
	sta	__rc7
	sty	__rc6
.LBB58_24:
	lda	__rc4
	bmi	.LBB58_26
; %bb.25:
	lda	__rc7
	bra	.LBB58_27
.LBB58_26:
	lda	#0
	sec
	sbc	__rc7
.LBB58_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB58_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB58_29:
	lda	__rc6
	rts
.Lfunc_end58:
	.size	__divmodqi4, .Lfunc_end58-__divmodqi4
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
	bmi	.LBB59_2
.LBB59_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB59_6
.LBB59_2:
	cpx	#128
	bne	.LBB59_5
; %bb.3:
	lda	__rc7
	bne	.LBB59_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB59_1
.LBB59_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB59_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB59_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB59_15
; %bb.8:
	lda	__rc2
	bne	.LBB59_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB59_18
.LBB59_10:
	cpy	#128
	bne	.LBB59_14
; %bb.11:
	ldy	__rc2
	bne	.LBB59_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB59_13
; %bb.48:
	jmp	.LBB59_45
.LBB59_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB59_18
.LBB59_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB59_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB59_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB59_20
.LBB59_17:
	sta	__rc11
.LBB59_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB59_39
.LBB59_19:
	cmp	__rc7
	bcc	.LBB59_17
.LBB59_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB59_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB59_23
; %bb.22:                               ;   in Loop: Header=BB59_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB59_24
	bra	.LBB59_26
.LBB59_23:                              ;   in Loop: Header=BB59_21 Depth=1
	cmp	__rc9
	bcc	.LBB59_26
.LBB59_24:                              ;   in Loop: Header=BB59_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB59_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB59_27
.LBB59_26:
	tay
.LBB59_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB59_28
; %bb.50:
	jmp	.LBB59_37
.LBB59_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB59_32
.LBB59_29:                              ;   in Loop: Header=BB59_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB59_36
.LBB59_30:                              ;   in Loop: Header=BB59_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB59_31:                              ;   in Loop: Header=BB59_32 Depth=1
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
	beq	.LBB59_39
.LBB59_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB59_34
; %bb.33:                               ;   in Loop: Header=BB59_32 Depth=1
	ldy	#0
.LBB59_34:                              ;   in Loop: Header=BB59_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB59_29
; %bb.35:                               ;   in Loop: Header=BB59_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB59_30
.LBB59_36:                              ;   in Loop: Header=BB59_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB59_31
.LBB59_37:
	sta	__rc11
	ldx	#1
.LBB59_38:
	stx	__rc9
.LBB59_39:
	lda	__rc6
	bmi	.LBB59_41
; %bb.40:
	lda	__rc10
	bra	.LBB59_42
.LBB59_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB59_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB59_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB59_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB59_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB59_38
.Lfunc_end59:
	.size	__divmodhi4, .Lfunc_end59-__divmodhi4
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB60_2
; %bb.1:
	tya
	beq	.LBB60_11
.LBB60_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB60_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB60_5
; %bb.4:                                ;   in Loop: Header=BB60_3 Depth=1
	inc	__rc7
.LBB60_5:                               ;   in Loop: Header=BB60_3 Depth=1
	inc	__rc4
	bne	.LBB60_7
; %bb.6:                                ;   in Loop: Header=BB60_3 Depth=1
	inc	__rc5
.LBB60_7:                               ;   in Loop: Header=BB60_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB60_9
; %bb.8:                                ;   in Loop: Header=BB60_3 Depth=1
	dex
.LBB60_9:                               ;   in Loop: Header=BB60_3 Depth=1
	txa
	bne	.LBB60_3
; %bb.10:                               ;   in Loop: Header=BB60_3 Depth=1
	tya
	bne	.LBB60_3
.LBB60_11:
	rts
.Lfunc_end60:
	.size	memcpy, .Lfunc_end60-memcpy
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
.Lfunc_end61:
	.size	memset, .Lfunc_end61-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB62_4
.LBB62_1:                               ;   in Loop: Header=BB62_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB62_3
; %bb.2:                                ;   in Loop: Header=BB62_4 Depth=1
	inc	__rc3
.LBB62_3:                               ;   in Loop: Header=BB62_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB62_7
.LBB62_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB62_1
; %bb.5:                                ;   in Loop: Header=BB62_4 Depth=1
	cpx	#0
	bne	.LBB62_1
; %bb.6:
	rts
.LBB62_7:                               ;   in Loop: Header=BB62_4 Depth=1
	dec	__rc4
	jmp	.LBB62_4
.Lfunc_end62:
	.size	__memset, .Lfunc_end62-__memset
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
	beq	.LBB63_1
; %bb.15:
	jmp	.LBB63_13
.LBB63_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB63_2
; %bb.17:
	jmp	.LBB63_14
.LBB63_2:
	lda	__rc7
	bne	.LBB63_4
; %bb.3:
	lda	__rc6
	beq	.LBB63_12
.LBB63_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB63_6
; %bb.5:                                ;   in Loop: Header=BB63_4 Depth=1
	dec	__rc9
.LBB63_6:                               ;   in Loop: Header=BB63_4 Depth=1
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
	bne	.LBB63_8
; %bb.7:                                ;   in Loop: Header=BB63_4 Depth=1
	dec	__rc11
.LBB63_8:                               ;   in Loop: Header=BB63_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB63_10
; %bb.9:                                ;   in Loop: Header=BB63_4 Depth=1
	dex
.LBB63_10:                              ;   in Loop: Header=BB63_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB63_4
; %bb.11:                               ;   in Loop: Header=BB63_4 Depth=1
	tya
	bne	.LBB63_4
.LBB63_12:
	rts
.LBB63_13:
	cpx	__rc3
	bcs	.LBB63_14
; %bb.19:
	jmp	.LBB63_2
.LBB63_14:
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
.Lfunc_end63:
	.size	memmove, .Lfunc_end63-memmove
                                        ; -- End function
	.type	filelist,@object                ; @filelist
	.section	.bss.filelist,"aw",@nobits
filelist:
	.zero	1170
	.size	filelist, 1170

	.type	.L.str,@object                  ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	" Choose disk image file: "
	.size	.L.str, 26

	.type	.L.str.1,@object                ; @.str.1
.L.str.1:
	.asciz	"mount failed"
	.size	.L.str.1, 13

	.type	curfile,@object                 ; @curfile
	.section	.bss.curfile,"aw",@nobits
curfile:
	.zero	65
	.size	curfile, 65

	.type	.L.str.2,@object                ; @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"val="
	.size	.L.str.2, 5

	.type	.L.str.3,@object                ; @.str.3
.L.str.3:
	.asciz	"already mounted"
	.size	.L.str.3, 16

	.type	.L.str.4,@object                ; @.str.4
.L.str.4:
	.asciz	" "
	.size	.L.str.4, 2

	.type	.L.str.5,@object                ; @.str.5
.L.str.5:
	.asciz	"not yet implemented"
	.size	.L.str.5, 20

	.type	testtrack,@object               ; @testtrack
	.section	.bss.testtrack,"aw",@nobits
testtrack:
	.byte	0                               ; 0x0
	.size	testtrack, 1

	.type	testsector,@object              ; @testsector
	.section	.zp.bss.testsector,"aw",@nobits
testsector:
	.byte	0                               ; 0x0
	.size	testsector, 1

	.type	.L.str.6,@object                ; @.str.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6:
	.asciz	"t="
	.size	.L.str.6, 3

	.type	.L.str.7,@object                ; @.str.7
.L.str.7:
	.asciz	" s="
	.size	.L.str.7, 4

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

	.type	BAMsector,@object               ; @BAMsector
	.section	.bss.BAMsector,"aw",@nobits
BAMsector:
	.zero	4
	.size	BAMsector, 4

	.type	worksector,@object              ; @worksector
	.section	.bss.worksector,"aw",@nobits
worksector:
	.zero	4
	.size	worksector, 4

	.type	worksectorasBAM.0,@object       ; @worksectorasBAM.0
	.section	.zp.bss.worksectorasBAM.0,"aw",@nobits
worksectorasBAM.0:
	.short	0
	.size	worksectorasBAM.0, 2

	.type	direntryblock.0,@object         ; @direntryblock.0
	.section	.bss.direntryblock.0,"aw",@nobits
direntryblock.0:
	.short	0
	.size	direntryblock.0, 2

	.type	ptrMiniOffs,@object             ; @ptrMiniOffs
	.section	.bss.ptrMiniOffs,"aw",@nobits
ptrMiniOffs:
	.long	0                               ; 0x0
	.size	ptrMiniOffs, 4

	.type	i,@object                       ; @i
	.section	.zp.bss.i,"aw",@nobits
i:
	.byte	0                               ; 0x0
	.size	i, 1

	.type	BAMside,@object                 ; @BAMside
	.section	.bss.BAMside,"aw",@nobits
BAMside:
	.byte	0                               ; 0x0
	.size	BAMside, 1

	.type	.L.str.48,@object               ; @.str.48
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.48:
	.asciz	"nexttrack "
	.size	.L.str.48, 11

	.type	.L.str.49,@object               ; @.str.49
.L.str.49:
	.asciz	" nextsector "
	.size	.L.str.49, 13

	.type	.L.str.50,@object               ; @.str.50
.L.str.50:
	.asciz	"number of sectors too big"
	.size	.L.str.50, 26

	.type	.L.str.51,@object               ; @.str.51
.L.str.51:
	.asciz	" nt="
	.size	.L.str.51, 5

	.type	.L.str.52,@object               ; @.str.52
.L.str.52:
	.asciz	" ns="
	.size	.L.str.52, 5

	.type	.L.str.53,@object               ; @.str.53
.L.str.53:
	.asciz	" a1="
	.size	.L.str.53, 5

	.type	s,@object                       ; @s
	.section	.zp.bss.s,"aw",@nobits
s:
	.zero	40
	.size	s, 40

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

	.type	.L.str.57,@object               ; @.str.57
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.57:
	.asciz	"UPPERCASE lowercase."
	.size	.L.str.57, 21

	.type	.L.str.58,@object               ; @.str.58
.L.str.58:
	.asciz	"Have fun with your Mega65!"
	.size	.L.str.58, 27

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
	.section	.rodata.cst16,"aM",@progbits,16
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
	.zero	35
	.size	.Lzp_stack, 35

.set .L__udivmodhi4_zp_stk, .Lzp_stack+34
	.size	.L__udivmodhi4_zp_stk, 1
.set .Lcputsxy_zp_stk, .Lzp_stack+25
	.size	.Lcputsxy_zp_stk, 9
.set .Lcputln_zp_stk, .Lzp_stack
	.size	.Lcputln_zp_stk, 6
.set .Lclrscr_zp_stk, .Lzp_stack
	.size	.Lclrscr_zp_stk, 3
.set .Lmprintf_zp_stk, .Lzp_stack
	.size	.Lmprintf_zp_stk, 25
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
.set .Lmemset_zp_stk, .Lzp_stack
	.size	.Lmemset_zp_stk, 2
.set .Lmemmove_zp_stk, .Lzp_stack
	.size	.Lmemmove_zp_stk, 2
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
	.addrsig_sym filelist
	.addrsig_sym curfile
	.addrsig_sym offsCurrIdx
	.addrsig_sym flagCurrSec
	.addrsig_sym s
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

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
	ldx	__rc7
	stx	mos8(.Lmprintf_zp_stk+1)
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
	stx	__rc28
	ldx	#3
	stx	__rc29
	ldx	#mos16lo(.L.str.7)
	stx	__rc2
	ldx	#mos16hi(.L.str.7)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB2_7
.LBB2_1:                                ;   in Loop: Header=BB2_7 Depth=1
	cmp	#192
	bcc	.LBB2_3
; %bb.2:                                ;   in Loop: Header=BB2_7 Depth=1
	eor	#128
	bra	.LBB2_4
.LBB2_3:                                ;   in Loop: Header=BB2_7 Depth=1
	clc
	adc	#224
.LBB2_4:                                ;   in Loop: Header=BB2_7 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB2_6
; %bb.5:                                ;   in Loop: Header=BB2_7 Depth=1
	inc	__rc5
.LBB2_6:                                ;   in Loop: Header=BB2_7 Depth=1
	tax
	beq	.LBB2_12
.LBB2_7:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB2_9
; %bb.8:                                ;   in Loop: Header=BB2_7 Depth=1
	inc	__rc3
.LBB2_9:                                ;   in Loop: Header=BB2_7 Depth=1
	cmp	#64
	bcc	.LBB2_4
; %bb.10:                               ;   in Loop: Header=BB2_7 Depth=1
	cmp	#96
	bcs	.LBB2_1
; %bb.11:                               ;   in Loop: Header=BB2_7 Depth=1
	clc
	adc	#192
	bra	.LBB2_4
.LBB2_12:
	ldx	#mos16lo(.L.str.8)
	stx	__rc20
	ldx	#mos16hi(.L.str.8)
	stx	__rc21
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
	bra	.LBB2_19
.LBB2_13:                               ;   in Loop: Header=BB2_19 Depth=1
	cmp	#192
	bcc	.LBB2_15
; %bb.14:                               ;   in Loop: Header=BB2_19 Depth=1
	eor	#128
	bra	.LBB2_16
.LBB2_15:                               ;   in Loop: Header=BB2_19 Depth=1
	clc
	adc	#224
.LBB2_16:                               ;   in Loop: Header=BB2_19 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB2_18
; %bb.17:                               ;   in Loop: Header=BB2_19 Depth=1
	inc	__rc3
.LBB2_18:                               ;   in Loop: Header=BB2_19 Depth=1
	tax
	beq	.LBB2_24
.LBB2_19:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc20)
	inc	__rc20
	bne	.LBB2_21
; %bb.20:                               ;   in Loop: Header=BB2_19 Depth=1
	inc	__rc21
.LBB2_21:                               ;   in Loop: Header=BB2_19 Depth=1
	cmp	#64
	bcc	.LBB2_16
; %bb.22:                               ;   in Loop: Header=BB2_19 Depth=1
	cmp	#96
	bcs	.LBB2_13
; %bb.23:                               ;   in Loop: Header=BB2_19 Depth=1
	clc
	adc	#192
	bra	.LBB2_16
.LBB2_24:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
.LBB2_25:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB2_25
; %bb.26:
	stz	54800
	lda	__rc25
	bne	.LBB2_27
; %bb.93:
	jmp	.LBB2_90
.LBB2_27:
	ldx	#mos16lo(.L.str.6)
	stx	__rc2
	ldx	#mos16hi(.L.str.6)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB2_34
.LBB2_28:                               ;   in Loop: Header=BB2_34 Depth=1
	cmp	#192
	bcc	.LBB2_30
; %bb.29:                               ;   in Loop: Header=BB2_34 Depth=1
	eor	#128
	bra	.LBB2_31
.LBB2_30:                               ;   in Loop: Header=BB2_34 Depth=1
	clc
	adc	#224
.LBB2_31:                               ;   in Loop: Header=BB2_34 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB2_33
; %bb.32:                               ;   in Loop: Header=BB2_34 Depth=1
	inc	__rc5
.LBB2_33:                               ;   in Loop: Header=BB2_34 Depth=1
	tax
	beq	.LBB2_39
.LBB2_34:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB2_36
; %bb.35:                               ;   in Loop: Header=BB2_34 Depth=1
	inc	__rc3
.LBB2_36:                               ;   in Loop: Header=BB2_34 Depth=1
	cmp	#64
	bcc	.LBB2_31
; %bb.37:                               ;   in Loop: Header=BB2_34 Depth=1
	cmp	#96
	bcs	.LBB2_28
; %bb.38:                               ;   in Loop: Header=BB2_34 Depth=1
	clc
	adc	#192
	bra	.LBB2_31
.LBB2_39:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	lda	#97
	ldx	__rc25
	ldy	__rc24
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
	cmp	#2
	bcc	.LBB2_40
; %bb.95:
	jmp	.LBB2_92
.LBB2_40:
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
	stz	__rc20
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
	stz	__rc20
	stz	__rc21
.LBB2_41:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_48 Depth 2
	ldx	mos8(ptrMiniOffs+2)
	stx	__rc2
	clc
	ldx	mos8(ptrMiniOffs+3)
	lda	__rc20
	adc	mos8(ptrMiniOffs)
	tay
	lda	__rc21
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
	adc	__rc20
	sta	__rc2
	lda	__rc23
	adc	__rc21
	sta	__rc3
	txa
	stx	__rc27
	sta	(__rc2)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB2_48
.LBB2_42:                               ;   in Loop: Header=BB2_48 Depth=2
	cmp	#192
	bcc	.LBB2_44
; %bb.43:                               ;   in Loop: Header=BB2_48 Depth=2
	eor	#128
	bra	.LBB2_45
.LBB2_44:                               ;   in Loop: Header=BB2_48 Depth=2
	clc
	adc	#224
.LBB2_45:                               ;   in Loop: Header=BB2_48 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB2_47
; %bb.46:                               ;   in Loop: Header=BB2_48 Depth=2
	inc	__rc3
.LBB2_47:                               ;   in Loop: Header=BB2_48 Depth=2
	tax
	beq	.LBB2_53
.LBB2_48:                               ;   Parent Loop BB2_41 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc30)
	inc	__rc30
	bne	.LBB2_50
; %bb.49:                               ;   in Loop: Header=BB2_48 Depth=2
	inc	__rc31
.LBB2_50:                               ;   in Loop: Header=BB2_48 Depth=2
	cmp	#64
	bcc	.LBB2_45
; %bb.51:                               ;   in Loop: Header=BB2_48 Depth=2
	cmp	#96
	bcs	.LBB2_42
; %bb.52:                               ;   in Loop: Header=BB2_48 Depth=2
	clc
	adc	#192
	bra	.LBB2_45
.LBB2_53:                               ;   in Loop: Header=BB2_41 Depth=1
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
	ldy	__rc21
	ldx	__rc20
	inx
	bne	.LBB2_55
; %bb.54:                               ;   in Loop: Header=BB2_41 Depth=1
	iny
.LBB2_55:                               ;   in Loop: Header=BB2_41 Depth=1
	stx	__rc20
	sty	__rc21
	cpy	#1
	beq	.LBB2_56
; %bb.97:                               ;   in Loop: Header=BB2_41 Depth=1
	jmp	.LBB2_41
.LBB2_56:                               ;   in Loop: Header=BB2_41 Depth=1
	stx	__rc20
	sty	__rc21
	txa
	beq	.LBB2_57
; %bb.99:                               ;   in Loop: Header=BB2_41 Depth=1
	jmp	.LBB2_41
.LBB2_57:
	jsr	cputln
.LBB2_58:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB2_58
; %bb.59:
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
	stz	__rc20
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
	stz	__rc20
	stz	__rc21
.LBB2_60:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_67 Depth 2
	ldx	mos8(ptrMiniOffs+2)
	stx	__rc2
	clc
	ldx	mos8(ptrMiniOffs+3)
	lda	__rc20
	adc	mos8(ptrMiniOffs)
	tay
	lda	__rc21
	adc	mos8(ptrMiniOffs+1)
	sta	__rc4
	lda	__rc2
	adc	#0
	sta	__rc2
	txa
	adc	#0
	ldx	#mos16lo(.L.str.1)
	stx	__rc24
	ldx	#mos16hi(.L.str.1)
	stx	__rc25
	sta	__rc3
	ldx	__rc4
	tya
	jsr	lpeek
	tax
	lda	__rc22
	clc
	adc	__rc20
	sta	__rc2
	lda	__rc23
	adc	__rc21
	sta	__rc3
	txa
	stx	__rc27
	sta	(__rc2)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB2_67
.LBB2_61:                               ;   in Loop: Header=BB2_67 Depth=2
	cmp	#192
	bcc	.LBB2_63
; %bb.62:                               ;   in Loop: Header=BB2_67 Depth=2
	eor	#128
	bra	.LBB2_64
.LBB2_63:                               ;   in Loop: Header=BB2_67 Depth=2
	clc
	adc	#224
.LBB2_64:                               ;   in Loop: Header=BB2_67 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB2_66
; %bb.65:                               ;   in Loop: Header=BB2_67 Depth=2
	inc	__rc3
.LBB2_66:                               ;   in Loop: Header=BB2_67 Depth=2
	tax
	beq	.LBB2_72
.LBB2_67:                               ;   Parent Loop BB2_60 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB2_69
; %bb.68:                               ;   in Loop: Header=BB2_67 Depth=2
	inc	__rc25
.LBB2_69:                               ;   in Loop: Header=BB2_67 Depth=2
	cmp	#64
	bcc	.LBB2_64
; %bb.70:                               ;   in Loop: Header=BB2_67 Depth=2
	cmp	#96
	bcs	.LBB2_61
; %bb.71:                               ;   in Loop: Header=BB2_67 Depth=2
	clc
	adc	#192
	bra	.LBB2_64
.LBB2_72:                               ;   in Loop: Header=BB2_60 Depth=1
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
	ldx	__rc20
	ldy	__rc21
	inx
	bne	.LBB2_74
; %bb.73:                               ;   in Loop: Header=BB2_60 Depth=1
	iny
.LBB2_74:                               ;   in Loop: Header=BB2_60 Depth=1
	stx	__rc20
	sty	__rc21
	cpy	#1
	beq	.LBB2_75
; %bb.101:                              ;   in Loop: Header=BB2_60 Depth=1
	jmp	.LBB2_60
.LBB2_75:                               ;   in Loop: Header=BB2_60 Depth=1
	stx	__rc20
	sty	__rc21
	txa
	beq	.LBB2_76
; %bb.103:                              ;   in Loop: Header=BB2_60 Depth=1
	jmp	.LBB2_60
.LBB2_76:
	jsr	cputln
.LBB2_77:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB2_77
; %bb.78:
	ldx	#mos16lo(.L.str.12)
	stx	__rc20
	ldx	#mos16hi(.L.str.12)
	stx	__rc21
	stz	54800
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB2_85
.LBB2_79:                               ;   in Loop: Header=BB2_85 Depth=1
	cmp	#192
	bcc	.LBB2_81
; %bb.80:                               ;   in Loop: Header=BB2_85 Depth=1
	eor	#128
	bra	.LBB2_82
.LBB2_81:                               ;   in Loop: Header=BB2_85 Depth=1
	clc
	adc	#224
.LBB2_82:                               ;   in Loop: Header=BB2_85 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB2_84
; %bb.83:                               ;   in Loop: Header=BB2_85 Depth=1
	inc	__rc3
.LBB2_84:                               ;   in Loop: Header=BB2_85 Depth=1
	tax
	beq	.LBB2_91
.LBB2_85:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc20)
	inc	__rc20
	bne	.LBB2_87
; %bb.86:                               ;   in Loop: Header=BB2_85 Depth=1
	inc	__rc21
.LBB2_87:                               ;   in Loop: Header=BB2_85 Depth=1
	cmp	#64
	bcc	.LBB2_82
; %bb.88:                               ;   in Loop: Header=BB2_85 Depth=1
	cmp	#96
	bcs	.LBB2_79
; %bb.89:                               ;   in Loop: Header=BB2_85 Depth=1
	clc
	adc	#192
	bra	.LBB2_82
.LBB2_90:
	lda	#252
	bra	.LBB2_92
.LBB2_91:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
.LBB2_92:
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
.Lfunc_end2:
	.size	GetWholeSector, .Lfunc_end2-GetWholeSector
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
	stx	__rc20
	cmp	#2
	bcc	.LBB3_1
; %bb.57:
	jmp	.LBB3_56
.LBB3_1:
	sta	__rc27
	ldy	__rc4
	ldx	__rc2
	stx	__rc24
	ldx	__rc3
	stx	__rc25
	ldx	#52
	stx	__rc22
	ldx	#3
	stx	__rc23
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
	sty	__rc26
	lda	__rc20
	jsr	mprintf
	ldx	#mos16lo(.L.str.10)
	stx	__rc2
	ldx	#mos16hi(.L.str.10)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc26
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	mprintf
	jsr	cputln
.LBB3_2:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB3_2
; %bb.3:
	stz	__rc21
	stz	54800
	stz	__rc26
	ldx	#0
.LBB3_4:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_11 Depth 2
	lda	__rc26
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
	bra	.LBB3_11
.LBB3_5:                                ;   in Loop: Header=BB3_11 Depth=2
	cmp	#192
	bcc	.LBB3_7
; %bb.6:                                ;   in Loop: Header=BB3_11 Depth=2
	eor	#128
	bra	.LBB3_8
.LBB3_7:                                ;   in Loop: Header=BB3_11 Depth=2
	clc
	adc	#224
.LBB3_8:                                ;   in Loop: Header=BB3_11 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB3_10
; %bb.9:                                ;   in Loop: Header=BB3_11 Depth=2
	inc	__rc5
.LBB3_10:                               ;   in Loop: Header=BB3_11 Depth=2
	tax
	beq	.LBB3_16
.LBB3_11:                               ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB3_13
; %bb.12:                               ;   in Loop: Header=BB3_11 Depth=2
	inc	__rc3
.LBB3_13:                               ;   in Loop: Header=BB3_11 Depth=2
	cmp	#64
	bcc	.LBB3_8
; %bb.14:                               ;   in Loop: Header=BB3_11 Depth=2
	cmp	#96
	bcs	.LBB3_5
; %bb.15:                               ;   in Loop: Header=BB3_11 Depth=2
	clc
	adc	#192
	bra	.LBB3_8
.LBB3_16:                               ;   in Loop: Header=BB3_4 Depth=1
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
	lda	__rc26
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
	inc	__rc26
	bne	.LBB3_18
; %bb.17:                               ;   in Loop: Header=BB3_4 Depth=1
	inx
.LBB3_18:                               ;   in Loop: Header=BB3_4 Depth=1
	cpx	#1
	beq	.LBB3_19
; %bb.59:                               ;   in Loop: Header=BB3_4 Depth=1
	jmp	.LBB3_4
.LBB3_19:                               ;   in Loop: Header=BB3_4 Depth=1
	lda	__rc26
	beq	.LBB3_20
; %bb.61:                               ;   in Loop: Header=BB3_4 Depth=1
	jmp	.LBB3_4
.LBB3_20:
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
	stz	__rc26
	ldx	#mos16lo(.L.str.14)
	stx	__rc2
	ldx	#mos16hi(.L.str.14)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc20
	jsr	mprintf
	ldx	#mos16lo(.L.str.10)
	stx	__rc2
	ldx	#mos16hi(.L.str.10)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	mprintf
	jsr	cputln
	stz	__rc26
	ldx	#0
.LBB3_21:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_28 Depth 2
	lda	__rc26
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
	bra	.LBB3_28
.LBB3_22:                               ;   in Loop: Header=BB3_28 Depth=2
	cmp	#192
	bcc	.LBB3_24
; %bb.23:                               ;   in Loop: Header=BB3_28 Depth=2
	eor	#128
	bra	.LBB3_25
.LBB3_24:                               ;   in Loop: Header=BB3_28 Depth=2
	clc
	adc	#224
.LBB3_25:                               ;   in Loop: Header=BB3_28 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB3_27
; %bb.26:                               ;   in Loop: Header=BB3_28 Depth=2
	inc	__rc5
.LBB3_27:                               ;   in Loop: Header=BB3_28 Depth=2
	tax
	beq	.LBB3_33
.LBB3_28:                               ;   Parent Loop BB3_21 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB3_30
; %bb.29:                               ;   in Loop: Header=BB3_28 Depth=2
	inc	__rc3
.LBB3_30:                               ;   in Loop: Header=BB3_28 Depth=2
	cmp	#64
	bcc	.LBB3_25
; %bb.31:                               ;   in Loop: Header=BB3_28 Depth=2
	cmp	#96
	bcs	.LBB3_22
; %bb.32:                               ;   in Loop: Header=BB3_28 Depth=2
	clc
	adc	#192
	bra	.LBB3_25
.LBB3_33:                               ;   in Loop: Header=BB3_21 Depth=1
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
	lda	__rc26
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
	inc	__rc26
	bne	.LBB3_35
; %bb.34:                               ;   in Loop: Header=BB3_21 Depth=1
	inx
.LBB3_35:                               ;   in Loop: Header=BB3_21 Depth=1
	cpx	#1
	beq	.LBB3_36
; %bb.63:                               ;   in Loop: Header=BB3_21 Depth=1
	jmp	.LBB3_21
.LBB3_36:                               ;   in Loop: Header=BB3_21 Depth=1
	lda	__rc26
	beq	.LBB3_37
; %bb.65:                               ;   in Loop: Header=BB3_21 Depth=1
	jmp	.LBB3_21
.LBB3_37:
	jsr	cputln
.LBB3_38:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB3_38
; %bb.39:
	ldx	#mos16lo(.L.str.15)
	stx	__rc24
	ldx	#mos16hi(.L.str.15)
	stx	__rc25
	stz	54800
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB3_46
.LBB3_40:                               ;   in Loop: Header=BB3_46 Depth=1
	cmp	#192
	bcc	.LBB3_42
; %bb.41:                               ;   in Loop: Header=BB3_46 Depth=1
	eor	#128
	bra	.LBB3_43
.LBB3_42:                               ;   in Loop: Header=BB3_46 Depth=1
	clc
	adc	#224
.LBB3_43:                               ;   in Loop: Header=BB3_46 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB3_45
; %bb.44:                               ;   in Loop: Header=BB3_46 Depth=1
	inc	__rc3
.LBB3_45:                               ;   in Loop: Header=BB3_46 Depth=1
	tax
	beq	.LBB3_51
.LBB3_46:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB3_48
; %bb.47:                               ;   in Loop: Header=BB3_46 Depth=1
	inc	__rc25
.LBB3_48:                               ;   in Loop: Header=BB3_46 Depth=1
	cmp	#64
	bcc	.LBB3_43
; %bb.49:                               ;   in Loop: Header=BB3_46 Depth=1
	cmp	#96
	bcs	.LBB3_40
; %bb.50:                               ;   in Loop: Header=BB3_46 Depth=1
	clc
	adc	#192
	bra	.LBB3_43
.LBB3_51:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
.LBB3_52:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB3_52
; %bb.53:
	stz	54800
	sec
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sbc	__rc27
	tay
	cmp	#20
	lda	#97
	bcc	.LBB3_55
; %bb.54:
	lda	#105
.LBB3_55:
	ldx	__rc20
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
.LBB3_56:
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
.Lfunc_end3:
	.size	PutWholeSector, .Lfunc_end3-PutWholeSector
                                        ; -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            ; -- Begin function main
	.type	main,@function
main:                                   ; @main
; %bb.0:
	clc
	lda	__rc0
	adc	#247
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
	bpl	.LBB4_2
; %bb.1:
	ldx	#80
.LBB4_2:
	ldy	#mos8(dmalist)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	stx	mos8(g_curScreenW)
	lda	53297
	and	#8
	beq	.LBB4_4
; %bb.3:
	ldx	#50
	bra	.LBB4_5
.LBB4_4:
	ldx	#25
.LBB4_5:
	stx	mos8(g_curScreenH)
	bra	.LBB4_7
.LBB4_6:                                ;   in Loop: Header=BB4_7 Depth=1
	stz	54800
.LBB4_7:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB4_6
; %bb.8:
	ldx	#52
	stx	__rc20
	ldx	#3
	stx	__rc21
	stz	__rc22
	ldx	#0
	stx	__rc26
	ldx	#97
	stx	__rc27
	ldx	#65
	stx	__rc24
	ldx	#97
	stx	__rc25
	ldx	__rc2
	stx	__rc31
	ldx	#255
	ldy	#mos16lo(escapeCode)
	sty	__rc2
	ldy	#mos16hi(escapeCode)
	sty	__rc3
	ldy	#1
.LBB4_9:                                ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB4_11
; %bb.10:                               ;   in Loop: Header=BB4_9 Depth=1
	inc	__rc5
.LBB4_11:                               ;   in Loop: Header=BB4_9 Depth=1
	lda	#mos16hi(escNOP)
	sta	(__rc4),y
	dex
	bne	.LBB4_9
	bra	.LBB4_13
.LBB4_12:                               ;   in Loop: Header=BB4_13 Depth=1
	stz	54800
.LBB4_13:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB4_12
; %bb.14:
	ldx	#mos16lo(.L.str.48)
	stx	__rc2
	ldx	#mos16hi(.L.str.48)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB4_21
.LBB4_15:                               ;   in Loop: Header=BB4_21 Depth=1
	cmp	#192
	bcc	.LBB4_17
; %bb.16:                               ;   in Loop: Header=BB4_21 Depth=1
	eor	#128
	bra	.LBB4_18
.LBB4_17:                               ;   in Loop: Header=BB4_21 Depth=1
	clc
	adc	#224
.LBB4_18:                               ;   in Loop: Header=BB4_21 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_20
; %bb.19:                               ;   in Loop: Header=BB4_21 Depth=1
	inc	__rc5
.LBB4_20:                               ;   in Loop: Header=BB4_21 Depth=1
	tax
	beq	.LBB4_26
.LBB4_21:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_23
; %bb.22:                               ;   in Loop: Header=BB4_21 Depth=1
	inc	__rc3
.LBB4_23:                               ;   in Loop: Header=BB4_21 Depth=1
	cmp	#64
	bcc	.LBB4_18
; %bb.24:                               ;   in Loop: Header=BB4_21 Depth=1
	cmp	#96
	bcs	.LBB4_15
; %bb.25:                               ;   in Loop: Header=BB4_21 Depth=1
	clc
	adc	#192
	bra	.LBB4_18
.LBB4_26:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB4_27:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_27
; %bb.28:
	ldx	#11
	txa
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	54800
	lda	#15
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	stz	53280
	stz	53281
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	;APP
	lda	53272
	ora	#6
	sta	53272

	;NO_APP
	lda	#240
	and	mos8(g_curTextColor)
	ora	#1
	ldx	mos8(g_curTextColor)
	stx	__rc28
	sta	mos8(g_curTextColor)
	lda	#10
	ldx	#4
	ldy	#79
	sty	__rc2
	jsr	cputcxy
	lda	#9
	ldx	#76
	stx	__rc2
	tax
	inc
	jsr	cputcxy
	lda	#70
	ldx	#80
	stx	__rc2
	ldx	#4
	jsr	cputcxy
	ldx	#122
	stx	__rc2
	ldx	#9
	lda	#70
	jsr	cputcxy
.LBB4_29:                               ; =>This Inner Loop Header: Depth=1
	ldx	#119
	stx	__rc2
	ldx	#4
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	jsr	cputcxy
	ldx	#111
	stx	__rc2
	ldx	#9
	lda	__rc23
	jsr	cputcxy
	inc	__rc23
	lda	__rc23
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc23
	cpx	#70
	bne	.LBB4_29
; %bb.30:
	ldx	#5
.LBB4_31:                               ; =>This Inner Loop Header: Depth=1
	ldy	#116
	sty	__rc2
	stx	__rc23
	lda	#10
	jsr	cputcxy
	ldx	#106
	stx	__rc2
	ldx	__rc23
	lda	#70
	jsr	cputcxy
	ldx	__rc23
	inx
	cpx	#9
	bne	.LBB4_31
; %bb.32:
	ldx	mos8(g_curScreenH)
	cpx	#10
	bcs	.LBB4_33
; %bb.434:
	jmp	.LBB4_36
.LBB4_33:
	lda	mos8(g_curScreenW)
	cmp	#71
	bcs	.LBB4_34
; %bb.436:
	jmp	.LBB4_36
.LBB4_34:
	stz	__rc23
	ldx	#5
	pha
	txa
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldx	#10
	stx	__rc2
	stz	__rc3
	ldx	#0
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
.LBB4_35:                               ; =>This Inner Loop Header: Depth=1
	ldx	mos8(g_curScreenW)
	stz	__rc3
	stx	__rc2
	ldx	#0
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
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
	ldx	__rc23
	inx
	txa
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	cpx	#11
	stz	__rc23
	bcc	.LBB4_35
.LBB4_36:
	lda	__rc28
	and	#15
	sta	__rc2
	lda	#240
	and	mos8(g_curTextColor)
	ora	__rc2
	sta	mos8(g_curTextColor)
.LBB4_37:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_37
; %bb.38:
	ldx	#mos16lo(.L.str.49)
	stx	__rc28
	ldx	#mos16hi(.L.str.49)
	stx	__rc29
	stz	__rc23
	stz	54800
	jsr	cputln
	jsr	cputln
	ldx	#97
	stx	mos8(fnamehi)
	ldx	#0
	stx	__rc2
	ldx	#97
	stx	__rc3
	ldx	#mos16lo(.L.str.50)
	stx	__rc4
	ldx	#mos16hi(.L.str.50)
	stx	__rc5
	lda	#10
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
	bcc	errhypsetnam2
	lda	#0
	sta	__rc23
	jmp	donehypsetnam2
errhypsetnam2:
	lda	#255
	sta	__rc23
donehypsetnam2:
	nop

	;NO_APP
	bra	.LBB4_45
.LBB4_39:                               ;   in Loop: Header=BB4_45 Depth=1
	cmp	#192
	bcc	.LBB4_41
; %bb.40:                               ;   in Loop: Header=BB4_45 Depth=1
	eor	#128
	bra	.LBB4_42
.LBB4_41:                               ;   in Loop: Header=BB4_45 Depth=1
	clc
	adc	#224
.LBB4_42:                               ;   in Loop: Header=BB4_45 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_44
; %bb.43:                               ;   in Loop: Header=BB4_45 Depth=1
	inc	__rc3
.LBB4_44:                               ;   in Loop: Header=BB4_45 Depth=1
	tax
	beq	.LBB4_50
.LBB4_45:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc28)
	inc	__rc28
	bne	.LBB4_47
; %bb.46:                               ;   in Loop: Header=BB4_45 Depth=1
	inc	__rc29
.LBB4_47:                               ;   in Loop: Header=BB4_45 Depth=1
	cmp	#64
	bcc	.LBB4_42
; %bb.48:                               ;   in Loop: Header=BB4_45 Depth=1
	cmp	#96
	bcs	.LBB4_39
; %bb.49:                               ;   in Loop: Header=BB4_45 Depth=1
	clc
	adc	#192
	bra	.LBB4_42
.LBB4_50:
	ldx	#mos16lo(.L.str.51)
	stx	__rc28
	ldx	#mos16hi(.L.str.51)
	stx	__rc29
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
	lda	__rc23
	jsr	cputhex
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_57
.LBB4_51:                               ;   in Loop: Header=BB4_57 Depth=1
	cmp	#192
	bcc	.LBB4_53
; %bb.52:                               ;   in Loop: Header=BB4_57 Depth=1
	eor	#128
	bra	.LBB4_54
.LBB4_53:                               ;   in Loop: Header=BB4_57 Depth=1
	clc
	adc	#224
.LBB4_54:                               ;   in Loop: Header=BB4_57 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_56
; %bb.55:                               ;   in Loop: Header=BB4_57 Depth=1
	inc	__rc3
.LBB4_56:                               ;   in Loop: Header=BB4_57 Depth=1
	tax
	beq	.LBB4_62
.LBB4_57:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc28)
	inc	__rc28
	bne	.LBB4_59
; %bb.58:                               ;   in Loop: Header=BB4_57 Depth=1
	inc	__rc29
.LBB4_59:                               ;   in Loop: Header=BB4_57 Depth=1
	cmp	#64
	bcc	.LBB4_54
; %bb.60:                               ;   in Loop: Header=BB4_57 Depth=1
	cmp	#96
	bcs	.LBB4_51
; %bb.61:                               ;   in Loop: Header=BB4_57 Depth=1
	clc
	adc	#192
	bra	.LBB4_54
.LBB4_62:
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
	bra	.LBB4_69
.LBB4_63:                               ;   in Loop: Header=BB4_69 Depth=1
	cmp	#192
	bcc	.LBB4_65
; %bb.64:                               ;   in Loop: Header=BB4_69 Depth=1
	eor	#128
	bra	.LBB4_66
.LBB4_65:                               ;   in Loop: Header=BB4_69 Depth=1
	clc
	adc	#224
.LBB4_66:                               ;   in Loop: Header=BB4_69 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_68
; %bb.67:                               ;   in Loop: Header=BB4_69 Depth=1
	inc	__rc5
.LBB4_68:                               ;   in Loop: Header=BB4_69 Depth=1
	tax
	beq	.LBB4_74
.LBB4_69:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_71
; %bb.70:                               ;   in Loop: Header=BB4_69 Depth=1
	inc	__rc3
.LBB4_71:                               ;   in Loop: Header=BB4_69 Depth=1
	cmp	#64
	bcc	.LBB4_66
; %bb.72:                               ;   in Loop: Header=BB4_69 Depth=1
	cmp	#96
	bcs	.LBB4_63
; %bb.73:                               ;   in Loop: Header=BB4_69 Depth=1
	clc
	adc	#192
	bra	.LBB4_66
.LBB4_74:
	ldx	#mos16lo(.L.str.53)
	stx	__rc28
	ldx	#mos16hi(.L.str.53)
	stx	__rc29
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
	ldx	#mos16lo(.L.str.52)
	stx	__rc4
	ldx	#mos16hi(.L.str.52)
	stx	__rc5
	lda	#10
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
	sta	__rc30
	jmp	donehyp1att4
errhyp1att4:
	lda	#255
	sta	__rc30
donehyp1att4:
	nop

	;NO_APP
	bra	.LBB4_81
.LBB4_75:                               ;   in Loop: Header=BB4_81 Depth=1
	cmp	#192
	bcc	.LBB4_77
; %bb.76:                               ;   in Loop: Header=BB4_81 Depth=1
	eor	#128
	bra	.LBB4_78
.LBB4_77:                               ;   in Loop: Header=BB4_81 Depth=1
	clc
	adc	#224
.LBB4_78:                               ;   in Loop: Header=BB4_81 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_80
; %bb.79:                               ;   in Loop: Header=BB4_81 Depth=1
	inc	__rc3
.LBB4_80:                               ;   in Loop: Header=BB4_81 Depth=1
	tax
	beq	.LBB4_86
.LBB4_81:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc28)
	inc	__rc28
	bne	.LBB4_83
; %bb.82:                               ;   in Loop: Header=BB4_81 Depth=1
	inc	__rc29
.LBB4_83:                               ;   in Loop: Header=BB4_81 Depth=1
	cmp	#64
	bcc	.LBB4_78
; %bb.84:                               ;   in Loop: Header=BB4_81 Depth=1
	cmp	#96
	bcs	.LBB4_75
; %bb.85:                               ;   in Loop: Header=BB4_81 Depth=1
	clc
	adc	#192
	bra	.LBB4_78
.LBB4_86:
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
	stz	__rc23
	ldx	#2
	stz	__rc2
	stz	__rc3
	stx	__rc4
	ldx	#0
	lda	__rc30
	jsr	cputhex
	jsr	cputln
	ldx	#9
	;APP
	lda	#6
	sta	54848
	clv
	bcc	errseldrv5
	stx	__rc28
	jmp	doneseldrv5
errseldrv5:
	lda	#255
	sta	__rc28
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
	lda	__rc28
	jsr	mprintf
	jsr	cputln
	;APP
	ldx	#0
	lda	#4
	sta	54848
	clv
	bcc	errgetcurdrv6
	sta	__rc23
	jmp	donegetcurdrv6
errgetcurdrv6:
	lda	#255
	sta	__rc23
donegetcurdrv6:
	nop
	;NO_APP
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_93
.LBB4_87:                               ;   in Loop: Header=BB4_93 Depth=1
	cmp	#192
	bcc	.LBB4_89
; %bb.88:                               ;   in Loop: Header=BB4_93 Depth=1
	eor	#128
	bra	.LBB4_90
.LBB4_89:                               ;   in Loop: Header=BB4_93 Depth=1
	clc
	adc	#224
.LBB4_90:                               ;   in Loop: Header=BB4_93 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_92
; %bb.91:                               ;   in Loop: Header=BB4_93 Depth=1
	inc	__rc3
.LBB4_92:                               ;   in Loop: Header=BB4_93 Depth=1
	tax
	beq	.LBB4_98
.LBB4_93:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc26)
	inc	__rc26
	bne	.LBB4_95
; %bb.94:                               ;   in Loop: Header=BB4_93 Depth=1
	inc	__rc27
.LBB4_95:                               ;   in Loop: Header=BB4_93 Depth=1
	cmp	#64
	bcc	.LBB4_90
; %bb.96:                               ;   in Loop: Header=BB4_93 Depth=1
	cmp	#96
	bcs	.LBB4_87
; %bb.97:                               ;   in Loop: Header=BB4_93 Depth=1
	clc
	adc	#192
	bra	.LBB4_90
.LBB4_98:
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
	lda	__rc23
	jsr	cputhex
	jsr	cputln
	ldx	__rc23
	cpx	#255
	bne	.LBB4_99
; %bb.438:
	jmp	.LBB4_179
.LBB4_99:
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
	sta	__rc26
	jmp	donehypopendir7
errhypopendir7:
	lda	#255
	sta	__rc26
donehypopendir7:
	nop

	;NO_APP
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB4_106
.LBB4_100:                              ;   in Loop: Header=BB4_106 Depth=1
	cmp	#192
	bcc	.LBB4_102
; %bb.101:                              ;   in Loop: Header=BB4_106 Depth=1
	eor	#128
	bra	.LBB4_103
.LBB4_102:                              ;   in Loop: Header=BB4_106 Depth=1
	clc
	adc	#224
.LBB4_103:                              ;   in Loop: Header=BB4_106 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_105
; %bb.104:                              ;   in Loop: Header=BB4_106 Depth=1
	inc	__rc5
.LBB4_105:                              ;   in Loop: Header=BB4_106 Depth=1
	tax
	beq	.LBB4_111
.LBB4_106:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_108
; %bb.107:                              ;   in Loop: Header=BB4_106 Depth=1
	inc	__rc3
.LBB4_108:                              ;   in Loop: Header=BB4_106 Depth=1
	cmp	#64
	bcc	.LBB4_103
; %bb.109:                              ;   in Loop: Header=BB4_106 Depth=1
	cmp	#96
	bcs	.LBB4_100
; %bb.110:                              ;   in Loop: Header=BB4_106 Depth=1
	clc
	adc	#192
	bra	.LBB4_103
.LBB4_111:
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
	lda	__rc26
	jsr	cputhex
	jsr	cputln
	ldy	__rc26
	cpy	#132
	bne	.LBB4_112
; %bb.440:
	jmp	.LBB4_179
.LBB4_112:
	cpy	#135
	bne	.LBB4_113
; %bb.442:
	jmp	.LBB4_179
.LBB4_113:
	cpy	#255
	bne	.LBB4_114
; %bb.444:
	jmp	.LBB4_179
.LBB4_114:
	stz	__rc23
; %bb.420:
	jmp	.LBB4_163
.LBB4_115:                              ;   in Loop: Header=BB4_121 Depth=2
	cmp	#192
	bcc	.LBB4_117
; %bb.116:                              ;   in Loop: Header=BB4_121 Depth=2
	eor	#128
	bra	.LBB4_118
.LBB4_117:                              ;   in Loop: Header=BB4_121 Depth=2
	clc
	adc	#224
.LBB4_118:                              ;   in Loop: Header=BB4_121 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_120
; %bb.119:                              ;   in Loop: Header=BB4_121 Depth=2
	inc	__rc5
.LBB4_120:                              ;   in Loop: Header=BB4_121 Depth=2
	tax
	beq	.LBB4_126
.LBB4_121:                              ;   Parent Loop BB4_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_123
; %bb.122:                              ;   in Loop: Header=BB4_121 Depth=2
	inc	__rc3
.LBB4_123:                              ;   in Loop: Header=BB4_121 Depth=2
	cmp	#64
	bcc	.LBB4_118
; %bb.124:                              ;   in Loop: Header=BB4_121 Depth=2
	cmp	#96
	bcs	.LBB4_115
; %bb.125:                              ;   in Loop: Header=BB4_121 Depth=2
	clc
	adc	#192
	bra	.LBB4_118
.LBB4_126:                              ;   in Loop: Header=BB4_163 Depth=1
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
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	ldx	__rc27
	cpx	#133
	bne	.LBB4_127
; %bb.446:
	jmp	.LBB4_164
.LBB4_127:                              ;   in Loop: Header=BB4_163 Depth=1
	cpx	#255
	bne	.LBB4_128
; %bb.448:
	jmp	.LBB4_164
.LBB4_128:                              ;   in Loop: Header=BB4_163 Depth=1
	ldy	#0
	ldx	#0
.LBB4_129:                              ;   Parent Loop BB4_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	24641,y
	cmp	#32
	beq	.LBB4_133
; %bb.130:                              ;   in Loop: Header=BB4_129 Depth=2
	cmp	#33
	bcc	.LBB4_132
; %bb.131:                              ;   in Loop: Header=BB4_129 Depth=2
	sta	24897,x
	inx
.LBB4_132:                              ;   in Loop: Header=BB4_129 Depth=2
	iny
	cpy	#8
	bne	.LBB4_129
.LBB4_133:                              ;   in Loop: Header=BB4_163 Depth=1
	ldy	#0
	lda	#46
	sta	24897,x
	inx
.LBB4_134:                              ;   Parent Loop BB4_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	24649,y
	cmp	#32
	beq	.LBB4_138
; %bb.135:                              ;   in Loop: Header=BB4_134 Depth=2
	cmp	#33
	bcc	.LBB4_137
; %bb.136:                              ;   in Loop: Header=BB4_134 Depth=2
	sta	24897,x
	inx
.LBB4_137:                              ;   in Loop: Header=BB4_134 Depth=2
	iny
	cpy	#3
	bne	.LBB4_134
.LBB4_138:                              ;   in Loop: Header=BB4_163 Depth=1
	ldy	#mos16lo(.L.str.59)
	sty	__rc2
	ldy	#mos16hi(.L.str.59)
	sty	__rc3
	stz	24897,x
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB4_145
.LBB4_139:                              ;   in Loop: Header=BB4_145 Depth=2
	cmp	#192
	bcc	.LBB4_141
; %bb.140:                              ;   in Loop: Header=BB4_145 Depth=2
	eor	#128
	bra	.LBB4_142
.LBB4_141:                              ;   in Loop: Header=BB4_145 Depth=2
	clc
	adc	#224
.LBB4_142:                              ;   in Loop: Header=BB4_145 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_144
; %bb.143:                              ;   in Loop: Header=BB4_145 Depth=2
	inc	__rc5
.LBB4_144:                              ;   in Loop: Header=BB4_145 Depth=2
	tax
	beq	.LBB4_150
.LBB4_145:                              ;   Parent Loop BB4_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_147
; %bb.146:                              ;   in Loop: Header=BB4_145 Depth=2
	inc	__rc3
.LBB4_147:                              ;   in Loop: Header=BB4_145 Depth=2
	cmp	#64
	bcc	.LBB4_142
; %bb.148:                              ;   in Loop: Header=BB4_145 Depth=2
	cmp	#96
	bcs	.LBB4_139
; %bb.149:                              ;   in Loop: Header=BB4_145 Depth=2
	clc
	adc	#192
	bra	.LBB4_142
.LBB4_150:                              ;   in Loop: Header=BB4_163 Depth=1
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
	bra	.LBB4_157
.LBB4_151:                              ;   in Loop: Header=BB4_157 Depth=2
	cmp	#192
	bcc	.LBB4_153
; %bb.152:                              ;   in Loop: Header=BB4_157 Depth=2
	eor	#128
	bra	.LBB4_154
.LBB4_153:                              ;   in Loop: Header=BB4_157 Depth=2
	clc
	adc	#224
.LBB4_154:                              ;   in Loop: Header=BB4_157 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_156
; %bb.155:                              ;   in Loop: Header=BB4_157 Depth=2
	inc	__rc5
.LBB4_156:                              ;   in Loop: Header=BB4_157 Depth=2
	tax
	beq	.LBB4_162
.LBB4_157:                              ;   Parent Loop BB4_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_159
; %bb.158:                              ;   in Loop: Header=BB4_157 Depth=2
	inc	__rc3
.LBB4_159:                              ;   in Loop: Header=BB4_157 Depth=2
	cmp	#64
	bcc	.LBB4_154
; %bb.160:                              ;   in Loop: Header=BB4_157 Depth=2
	cmp	#96
	bcs	.LBB4_151
; %bb.161:                              ;   in Loop: Header=BB4_157 Depth=2
	clc
	adc	#192
	bra	.LBB4_154
.LBB4_162:                              ;   in Loop: Header=BB4_163 Depth=1
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
	ldx	#97
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
	ldy	__rc26
.LBB4_163:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_121 Depth 2
                                        ;     Child Loop BB4_129 Depth 2
                                        ;     Child Loop BB4_134 Depth 2
                                        ;     Child Loop BB4_145 Depth 2
                                        ;     Child Loop BB4_157 Depth 2
	ldx	#mos16lo(.L.str.58)
	stx	__rc2
	ldx	#mos16hi(.L.str.58)
	stx	__rc3
	;APP
	phx
	ldx	#0
	txa
hypreaddirloop8:
	sta	24576,x
	dex
	bne	hypreaddirloop8
	plx
	tya
	tax
	ldy	#mos16hi(24576)
	lda	#20
	sta	54848
	clv
	bcc	errhypreaddir8
	stx	__rc27
	jmp	donehypreaddir8
errhypreaddir8:
	sta	__rc27
donehypreaddir8:
	nop

	;NO_APP
	ldx	24640
	stz	24576,x
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
; %bb.422:                              ;   in Loop: Header=BB4_163 Depth=1
	jmp	.LBB4_121
.LBB4_164:
	ldx	#mos16lo(.L.str.61)
	stx	__rc2
	ldx	#mos16hi(.L.str.61)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	ldx	__rc26
	;APP
	lda	#22
	sta	54848
	clv
	bcc	errhypclosedir9
	stx	__rc23
	jmp	donehypclosedir9
errhypclosedir9:
	sta	__rc23
donehypclosedir9:
	nop

	;NO_APP
	bra	.LBB4_171
.LBB4_165:                              ;   in Loop: Header=BB4_171 Depth=1
	cmp	#192
	bcc	.LBB4_167
; %bb.166:                              ;   in Loop: Header=BB4_171 Depth=1
	eor	#128
	bra	.LBB4_168
.LBB4_167:                              ;   in Loop: Header=BB4_171 Depth=1
	clc
	adc	#224
.LBB4_168:                              ;   in Loop: Header=BB4_171 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_170
; %bb.169:                              ;   in Loop: Header=BB4_171 Depth=1
	inc	__rc5
.LBB4_170:                              ;   in Loop: Header=BB4_171 Depth=1
	tax
	beq	.LBB4_176
.LBB4_171:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_173
; %bb.172:                              ;   in Loop: Header=BB4_171 Depth=1
	inc	__rc3
.LBB4_173:                              ;   in Loop: Header=BB4_171 Depth=1
	cmp	#64
	bcc	.LBB4_168
; %bb.174:                              ;   in Loop: Header=BB4_171 Depth=1
	cmp	#96
	bcs	.LBB4_165
; %bb.175:                              ;   in Loop: Header=BB4_171 Depth=1
	clc
	adc	#192
	bra	.LBB4_168
.LBB4_176:
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
	lda	__rc23
	jsr	cputhex
	jsr	cputln
.LBB4_177:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_177
; %bb.178:
	stz	54800
.LBB4_179:
	stz	mos8(BAMsector)
	ldx	#23
	stx	mos8(BAMsector+3)
	inx
	stx	mos8(worksector+1)
	inx
	stx	mos8(worksector+3)
	ldx	#22
	stx	mos8(BAMsector+1)
	stz	mos8(BAMsector+2)
	stz	mos8(worksector)
	stz	mos8(worksector+2)
	ldy	#11
	sty	mos8(dmalist)
	ldy	#128
	sty	mos8(dmalist+1)
	stz	mos8(dmalist+2)
	iny
	sty	mos8(dmalist+3)
	stz	mos8(dmalist+4)
	ldy	#133
	sty	mos8(dmalist+5)
	ldy	#1
	sty	mos8(dmalist+6)
	stz	mos8(dmalist+7)
	ldy	#3
	sty	mos8(dmalist+8)
	stz	mos8(dmalist+17)
	stz	mos8(dmalist+9)
	iny
	sty	mos8(dmalist+10)
	ldy	#170
	sty	mos8(dmalist+11)
	stz	mos8(dmalist+12)
	stz	mos8(dmalist+14)
	stx	mos8(dmalist+15)
	stz	mos8(dmalist+16)
	ldx	#71
	stx	53295
	ldx	#83
	stx	53295
	ldx	#65
	stx	0
	ldx	#mos16lo(.L.str)
	stx	__rc2
	ldx	#mos16hi(.L.str)
	stx	__rc3
	stz	55042
	stz	55044
	ldx	#mos8(0)
	stx	55041
	ldx	__rc31
	stx	55045
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
	stx	__rc26
	ldx	mos8(ptrMiniOffs+3)
	stx	__rc27
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB4_186
.LBB4_180:                              ;   in Loop: Header=BB4_186 Depth=1
	cmp	#192
	bcc	.LBB4_182
; %bb.181:                              ;   in Loop: Header=BB4_186 Depth=1
	eor	#128
	bra	.LBB4_183
.LBB4_182:                              ;   in Loop: Header=BB4_186 Depth=1
	clc
	adc	#224
.LBB4_183:                              ;   in Loop: Header=BB4_186 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_185
; %bb.184:                              ;   in Loop: Header=BB4_186 Depth=1
	inc	__rc5
.LBB4_185:                              ;   in Loop: Header=BB4_186 Depth=1
	tax
	beq	.LBB4_191
.LBB4_186:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_188
; %bb.187:                              ;   in Loop: Header=BB4_186 Depth=1
	inc	__rc3
.LBB4_188:                              ;   in Loop: Header=BB4_186 Depth=1
	cmp	#64
	bcc	.LBB4_183
; %bb.189:                              ;   in Loop: Header=BB4_186 Depth=1
	cmp	#96
	bcs	.LBB4_180
; %bb.190:                              ;   in Loop: Header=BB4_186 Depth=1
	clc
	adc	#192
	bra	.LBB4_183
.LBB4_191:
	ldx	#mos16lo(.L.str.1)
	stx	__rc24
	ldx	#mos16hi(.L.str.1)
	stx	__rc25
	stz	__rc23
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
	ldx	__rc27
	lda	__rc26
	jsr	cputhex
	ldx	mos8(ptrMiniOffs)
	stx	__rc26
	ldx	mos8(ptrMiniOffs+1)
	stx	__rc27
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_198
.LBB4_192:                              ;   in Loop: Header=BB4_198 Depth=1
	cmp	#192
	bcc	.LBB4_194
; %bb.193:                              ;   in Loop: Header=BB4_198 Depth=1
	eor	#128
	bra	.LBB4_195
.LBB4_194:                              ;   in Loop: Header=BB4_198 Depth=1
	clc
	adc	#224
.LBB4_195:                              ;   in Loop: Header=BB4_198 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_197
; %bb.196:                              ;   in Loop: Header=BB4_198 Depth=1
	inc	__rc3
.LBB4_197:                              ;   in Loop: Header=BB4_198 Depth=1
	tax
	beq	.LBB4_203
.LBB4_198:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_200
; %bb.199:                              ;   in Loop: Header=BB4_198 Depth=1
	inc	__rc25
.LBB4_200:                              ;   in Loop: Header=BB4_198 Depth=1
	cmp	#64
	bcc	.LBB4_195
; %bb.201:                              ;   in Loop: Header=BB4_198 Depth=1
	cmp	#96
	bcs	.LBB4_192
; %bb.202:                              ;   in Loop: Header=BB4_198 Depth=1
	clc
	adc	#192
	bra	.LBB4_195
.LBB4_203:
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
	ldx	__rc27
	lda	__rc26
	jsr	cputhex
	jsr	cputln
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_210
.LBB4_204:                              ;   in Loop: Header=BB4_210 Depth=1
	cmp	#192
	bcc	.LBB4_206
; %bb.205:                              ;   in Loop: Header=BB4_210 Depth=1
	eor	#128
	bra	.LBB4_207
.LBB4_206:                              ;   in Loop: Header=BB4_210 Depth=1
	clc
	adc	#224
.LBB4_207:                              ;   in Loop: Header=BB4_210 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_209
; %bb.208:                              ;   in Loop: Header=BB4_210 Depth=1
	inc	__rc3
.LBB4_209:                              ;   in Loop: Header=BB4_210 Depth=1
	tax
	beq	.LBB4_215
.LBB4_210:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_212
; %bb.211:                              ;   in Loop: Header=BB4_210 Depth=1
	inc	__rc25
.LBB4_212:                              ;   in Loop: Header=BB4_210 Depth=1
	cmp	#64
	bcc	.LBB4_207
; %bb.213:                              ;   in Loop: Header=BB4_210 Depth=1
	cmp	#96
	bcs	.LBB4_204
; %bb.214:                              ;   in Loop: Header=BB4_210 Depth=1
	clc
	adc	#192
	bra	.LBB4_207
.LBB4_215:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
.LBB4_216:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_216
; %bb.217:
	ldx	#mos16lo(.L.str.12)
	stx	__rc24
	ldx	#mos16hi(.L.str.12)
	stx	__rc25
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
	bra	.LBB4_224
.LBB4_218:                              ;   in Loop: Header=BB4_224 Depth=1
	cmp	#192
	bcc	.LBB4_220
; %bb.219:                              ;   in Loop: Header=BB4_224 Depth=1
	eor	#128
	bra	.LBB4_221
.LBB4_220:                              ;   in Loop: Header=BB4_224 Depth=1
	clc
	adc	#224
.LBB4_221:                              ;   in Loop: Header=BB4_224 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_223
; %bb.222:                              ;   in Loop: Header=BB4_224 Depth=1
	inc	__rc3
.LBB4_223:                              ;   in Loop: Header=BB4_224 Depth=1
	tax
	beq	.LBB4_229
.LBB4_224:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_226
; %bb.225:                              ;   in Loop: Header=BB4_224 Depth=1
	inc	__rc25
.LBB4_226:                              ;   in Loop: Header=BB4_224 Depth=1
	cmp	#64
	bcc	.LBB4_221
; %bb.227:                              ;   in Loop: Header=BB4_224 Depth=1
	cmp	#96
	bcs	.LBB4_218
; %bb.228:                              ;   in Loop: Header=BB4_224 Depth=1
	clc
	adc	#192
	bra	.LBB4_221
.LBB4_229:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#1
	stx	mos8(datNextTrk)
	ldx	#30
	stx	mos8(i)
	stz	__rc23
; %bb.424:
	jmp	.LBB4_400
.LBB4_230:                              ;   in Loop: Header=BB4_236 Depth=2
	cmp	#192
	bcc	.LBB4_232
; %bb.231:                              ;   in Loop: Header=BB4_236 Depth=2
	eor	#128
	bra	.LBB4_233
.LBB4_232:                              ;   in Loop: Header=BB4_236 Depth=2
	clc
	adc	#224
.LBB4_233:                              ;   in Loop: Header=BB4_236 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_235
; %bb.234:                              ;   in Loop: Header=BB4_236 Depth=2
	inc	__rc3
.LBB4_235:                              ;   in Loop: Header=BB4_236 Depth=2
	tax
	beq	.LBB4_241
.LBB4_236:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_238
; %bb.237:                              ;   in Loop: Header=BB4_236 Depth=2
	inc	__rc25
.LBB4_238:                              ;   in Loop: Header=BB4_236 Depth=2
	cmp	#64
	bcc	.LBB4_233
; %bb.239:                              ;   in Loop: Header=BB4_236 Depth=2
	cmp	#96
	bcs	.LBB4_230
; %bb.240:                              ;   in Loop: Header=BB4_236 Depth=2
	clc
	adc	#192
	bra	.LBB4_233
.LBB4_241:                              ;   in Loop: Header=BB4_400 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldy	#2
	lda	mos8(datNextTrk)
	and	#1
	bne	.LBB4_243
; %bb.242:                              ;   in Loop: Header=BB4_400 Depth=1
	ldy	#0
.LBB4_243:                              ;   in Loop: Header=BB4_400 Depth=1
	ldx	#mos16lo(.L.str.34)
	stx	__rc24
	ldx	#mos16hi(.L.str.34)
	stx	__rc25
	ldx	mos8(datNextSec)
	lda	#0
	sta	__rc2
	lda	#24
	sta	__rc3
	tya
	jsr	GetWholeSector
	sta	mos8(workside)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_250
.LBB4_244:                              ;   in Loop: Header=BB4_250 Depth=2
	cmp	#192
	bcc	.LBB4_246
; %bb.245:                              ;   in Loop: Header=BB4_250 Depth=2
	eor	#128
	bra	.LBB4_247
.LBB4_246:                              ;   in Loop: Header=BB4_250 Depth=2
	clc
	adc	#224
.LBB4_247:                              ;   in Loop: Header=BB4_250 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_249
; %bb.248:                              ;   in Loop: Header=BB4_250 Depth=2
	inc	__rc3
.LBB4_249:                              ;   in Loop: Header=BB4_250 Depth=2
	tax
	beq	.LBB4_255
.LBB4_250:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_252
; %bb.251:                              ;   in Loop: Header=BB4_250 Depth=2
	inc	__rc25
.LBB4_252:                              ;   in Loop: Header=BB4_250 Depth=2
	cmp	#64
	bcc	.LBB4_247
; %bb.253:                              ;   in Loop: Header=BB4_250 Depth=2
	cmp	#96
	bcs	.LBB4_244
; %bb.254:                              ;   in Loop: Header=BB4_250 Depth=2
	clc
	adc	#192
	bra	.LBB4_247
.LBB4_255:                              ;   in Loop: Header=BB4_400 Depth=1
	ldx	#2
	txa
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
	lda	mos8(workside)
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos8(worksector)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos8(0)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc24
	ldy	#1
	lda	(__rc2),y
	sta	__rc25
	lda	mos8(datNextTrk)
	and	#1
	bne	.LBB4_257
; %bb.256:                              ;   in Loop: Header=BB4_400 Depth=1
	stz	__rc2
	lda	#0
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB4_257:                              ;   in Loop: Header=BB4_400 Depth=1
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	(__rc24)
	sta	__rc6
	lda	mos8(datNextSec)
	inc
	ldy	#1
	sta	(__rc24),y
	ldy	#3
	sta	(__rc24),y
	dey
	lda	__rc6
	sta	(__rc24),y
	lda	#238
	ldy	#254
	sta	(__rc24),y
	iny
	lda	#170
	sta	(__rc24),y
	ldx	#mos16lo(.L.str.35)
	stx	__rc2
	ldx	#mos16hi(.L.str.35)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc6
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
.LBB4_258:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB4_258
; %bb.259:                              ;   in Loop: Header=BB4_400 Depth=1
	stz	54800
	lda	mos8(BAMside)
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos8(BAMsector)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos8(0)
	adc	__rc3
	sta	__rc3
	lda	mos8(datNextTrk)
	and	#1
	tax
	lda	(__rc2)
	sta	__rc26
	ldy	#1
	lda	(__rc2),y
	sta	__rc25
	lda	mos8(i)
	cpx	#0
	bne	.LBB4_261
; %bb.260:                              ;   in Loop: Header=BB4_400 Depth=1
	ldy	#255
.LBB4_261:                              ;   in Loop: Header=BB4_400 Depth=1
	ldx	#6
	stz	__rc24
	cmp	#8
	bcs	.LBB4_263
; %bb.262:                              ;   in Loop: Header=BB4_400 Depth=1
	stx	__rc2
	stz	__rc3
	ldx	#0
	sty	__rc30
	sta	__rc27
	tya
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldx	__rc26
	stx	__rc31
	lda	__rc26
	clc
	adc	__rc2
	tax
	lda	__rc25
	adc	__rc3
	tay
	clc
	txa
	adc	#17
; %bb.426:                              ;   in Loop: Header=BB4_400 Depth=1
	jmp	.LBB4_270
.LBB4_263:                              ;   in Loop: Header=BB4_400 Depth=1
	cmp	#16
	bcs	.LBB4_265
; %bb.264:                              ;   in Loop: Header=BB4_400 Depth=1
	clc
	adc	#248
	stx	__rc2
	stz	__rc3
	ldx	#0
	sty	__rc30
	sta	__rc27
	tya
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldx	__rc26
	stx	__rc31
	lda	__rc26
	clc
	adc	__rc2
	tax
	lda	__rc25
	adc	__rc3
	tay
	clc
	txa
	adc	#18
; %bb.428:                              ;   in Loop: Header=BB4_400 Depth=1
	jmp	.LBB4_270
.LBB4_265:                              ;   in Loop: Header=BB4_400 Depth=1
	cmp	#24
	bcs	.LBB4_267
; %bb.266:                              ;   in Loop: Header=BB4_400 Depth=1
	clc
	adc	#240
	stx	__rc2
	stz	__rc3
	ldx	#0
	sty	__rc30
	sta	__rc27
	tya
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldx	__rc26
	stx	__rc31
	lda	__rc26
	clc
	adc	__rc2
	tax
	lda	__rc25
	adc	__rc3
	tay
	clc
	txa
	adc	#19
; %bb.430:                              ;   in Loop: Header=BB4_400 Depth=1
	jmp	.LBB4_270
.LBB4_267:                              ;   in Loop: Header=BB4_400 Depth=1
	cmp	#32
	bcs	.LBB4_269
; %bb.268:                              ;   in Loop: Header=BB4_400 Depth=1
	clc
	adc	#232
	stx	__rc2
	stz	__rc3
	ldx	#0
	sty	__rc30
	sta	__rc27
	tya
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldx	__rc26
	stx	__rc31
	lda	__rc26
	clc
	adc	__rc2
	tax
	lda	__rc25
	adc	__rc3
	tay
	clc
	txa
	adc	#20
	bra	.LBB4_270
.LBB4_269:                              ;   in Loop: Header=BB4_400 Depth=1
	clc
	adc	#224
	stx	__rc2
	stz	__rc3
	ldx	#0
	sty	__rc30
	sta	__rc27
	tya
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldx	__rc26
	stx	__rc31
	lda	__rc26
	clc
	adc	__rc2
	tax
	lda	__rc25
	adc	__rc3
	tay
	clc
	txa
	adc	#21
.LBB4_270:                              ;   in Loop: Header=BB4_400 Depth=1
	sta	__rc28
	tya
	adc	#0
	sta	__rc29
	ldx	__rc27
	stx	__rc2
	ldx	#mos16lo(.L.str.37)
	stx	__rc26
	ldx	#mos16hi(.L.str.37)
	stx	__rc27
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	eor	#255
	and	(__rc28)
	sta	(__rc28)
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc30
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	__rc31
	clc
	adc	__rc2
	sta	__rc2
	lda	__rc25
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
	bra	.LBB4_277
.LBB4_271:                              ;   in Loop: Header=BB4_277 Depth=2
	cmp	#192
	bcc	.LBB4_273
; %bb.272:                              ;   in Loop: Header=BB4_277 Depth=2
	eor	#128
	bra	.LBB4_274
.LBB4_273:                              ;   in Loop: Header=BB4_277 Depth=2
	clc
	adc	#224
.LBB4_274:                              ;   in Loop: Header=BB4_277 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_276
; %bb.275:                              ;   in Loop: Header=BB4_277 Depth=2
	inc	__rc3
.LBB4_276:                              ;   in Loop: Header=BB4_277 Depth=2
	tax
	beq	.LBB4_282
.LBB4_277:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc26)
	inc	__rc26
	bne	.LBB4_279
; %bb.278:                              ;   in Loop: Header=BB4_277 Depth=2
	inc	__rc27
.LBB4_279:                              ;   in Loop: Header=BB4_277 Depth=2
	cmp	#64
	bcc	.LBB4_274
; %bb.280:                              ;   in Loop: Header=BB4_277 Depth=2
	cmp	#96
	bcs	.LBB4_271
; %bb.281:                              ;   in Loop: Header=BB4_277 Depth=2
	clc
	adc	#192
	bra	.LBB4_274
.LBB4_282:                              ;   in Loop: Header=BB4_400 Depth=1
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
	stx	__rc26
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_289
.LBB4_283:                              ;   in Loop: Header=BB4_289 Depth=2
	cmp	#192
	bcc	.LBB4_285
; %bb.284:                              ;   in Loop: Header=BB4_289 Depth=2
	eor	#128
	bra	.LBB4_286
.LBB4_285:                              ;   in Loop: Header=BB4_289 Depth=2
	clc
	adc	#224
.LBB4_286:                              ;   in Loop: Header=BB4_289 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_288
; %bb.287:                              ;   in Loop: Header=BB4_289 Depth=2
	inc	__rc3
.LBB4_288:                              ;   in Loop: Header=BB4_289 Depth=2
	tax
	beq	.LBB4_294
.LBB4_289:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_291
; %bb.290:                              ;   in Loop: Header=BB4_289 Depth=2
	inc	__rc25
.LBB4_291:                              ;   in Loop: Header=BB4_289 Depth=2
	cmp	#64
	bcc	.LBB4_286
; %bb.292:                              ;   in Loop: Header=BB4_289 Depth=2
	cmp	#96
	bcs	.LBB4_283
; %bb.293:                              ;   in Loop: Header=BB4_289 Depth=2
	clc
	adc	#192
	bra	.LBB4_286
.LBB4_294:                              ;   in Loop: Header=BB4_400 Depth=1
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
	stz	__rc2
	stz	__rc3
	ldx	#2
	stx	__rc4
	ldx	#0
	lda	__rc26
	jsr	cputhex
	ldx	5889
	stx	__rc26
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_301
.LBB4_295:                              ;   in Loop: Header=BB4_301 Depth=2
	cmp	#192
	bcc	.LBB4_297
; %bb.296:                              ;   in Loop: Header=BB4_301 Depth=2
	eor	#128
	bra	.LBB4_298
.LBB4_297:                              ;   in Loop: Header=BB4_301 Depth=2
	clc
	adc	#224
.LBB4_298:                              ;   in Loop: Header=BB4_301 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_300
; %bb.299:                              ;   in Loop: Header=BB4_301 Depth=2
	inc	__rc3
.LBB4_300:                              ;   in Loop: Header=BB4_301 Depth=2
	tax
	beq	.LBB4_306
.LBB4_301:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_303
; %bb.302:                              ;   in Loop: Header=BB4_301 Depth=2
	inc	__rc25
.LBB4_303:                              ;   in Loop: Header=BB4_301 Depth=2
	cmp	#64
	bcc	.LBB4_298
; %bb.304:                              ;   in Loop: Header=BB4_301 Depth=2
	cmp	#96
	bcs	.LBB4_295
; %bb.305:                              ;   in Loop: Header=BB4_301 Depth=2
	clc
	adc	#192
	bra	.LBB4_298
.LBB4_306:                              ;   in Loop: Header=BB4_400 Depth=1
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
	stz	__rc2
	stz	__rc3
	ldx	#2
	stx	__rc4
	ldx	#0
	lda	__rc26
	jsr	cputhex
	ldx	6142
	stx	__rc26
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_313
.LBB4_307:                              ;   in Loop: Header=BB4_313 Depth=2
	cmp	#192
	bcc	.LBB4_309
; %bb.308:                              ;   in Loop: Header=BB4_313 Depth=2
	eor	#128
	bra	.LBB4_310
.LBB4_309:                              ;   in Loop: Header=BB4_313 Depth=2
	clc
	adc	#224
.LBB4_310:                              ;   in Loop: Header=BB4_313 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_312
; %bb.311:                              ;   in Loop: Header=BB4_313 Depth=2
	inc	__rc3
.LBB4_312:                              ;   in Loop: Header=BB4_313 Depth=2
	tax
	beq	.LBB4_318
.LBB4_313:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_315
; %bb.314:                              ;   in Loop: Header=BB4_313 Depth=2
	inc	__rc25
.LBB4_315:                              ;   in Loop: Header=BB4_313 Depth=2
	cmp	#64
	bcc	.LBB4_310
; %bb.316:                              ;   in Loop: Header=BB4_313 Depth=2
	cmp	#96
	bcs	.LBB4_307
; %bb.317:                              ;   in Loop: Header=BB4_313 Depth=2
	clc
	adc	#192
	bra	.LBB4_310
.LBB4_318:                              ;   in Loop: Header=BB4_400 Depth=1
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
	stz	__rc2
	stz	__rc3
	ldx	#2
	stx	__rc4
	ldx	#0
	lda	__rc26
	jsr	cputhex
	ldx	6143
	stx	__rc26
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_325
.LBB4_319:                              ;   in Loop: Header=BB4_325 Depth=2
	cmp	#192
	bcc	.LBB4_321
; %bb.320:                              ;   in Loop: Header=BB4_325 Depth=2
	eor	#128
	bra	.LBB4_322
.LBB4_321:                              ;   in Loop: Header=BB4_325 Depth=2
	clc
	adc	#224
.LBB4_322:                              ;   in Loop: Header=BB4_325 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_324
; %bb.323:                              ;   in Loop: Header=BB4_325 Depth=2
	inc	__rc3
.LBB4_324:                              ;   in Loop: Header=BB4_325 Depth=2
	tax
	beq	.LBB4_330
.LBB4_325:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_327
; %bb.326:                              ;   in Loop: Header=BB4_325 Depth=2
	inc	__rc25
.LBB4_327:                              ;   in Loop: Header=BB4_325 Depth=2
	cmp	#64
	bcc	.LBB4_322
; %bb.328:                              ;   in Loop: Header=BB4_325 Depth=2
	cmp	#96
	bcs	.LBB4_319
; %bb.329:                              ;   in Loop: Header=BB4_325 Depth=2
	clc
	adc	#192
	bra	.LBB4_322
.LBB4_330:                              ;   in Loop: Header=BB4_400 Depth=1
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
	jsr	cputln
.LBB4_331:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB4_331
; %bb.332:                              ;   in Loop: Header=BB4_400 Depth=1
	ldx	#mos16lo(.L.str.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.41)
	stx	__rc3
	stz	54800
	ldx	5632
	stx	__rc26
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB4_339
.LBB4_333:                              ;   in Loop: Header=BB4_339 Depth=2
	cmp	#192
	bcc	.LBB4_335
; %bb.334:                              ;   in Loop: Header=BB4_339 Depth=2
	eor	#128
	bra	.LBB4_336
.LBB4_335:                              ;   in Loop: Header=BB4_339 Depth=2
	clc
	adc	#224
.LBB4_336:                              ;   in Loop: Header=BB4_339 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_338
; %bb.337:                              ;   in Loop: Header=BB4_339 Depth=2
	inc	__rc5
.LBB4_338:                              ;   in Loop: Header=BB4_339 Depth=2
	tax
	beq	.LBB4_344
.LBB4_339:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_341
; %bb.340:                              ;   in Loop: Header=BB4_339 Depth=2
	inc	__rc3
.LBB4_341:                              ;   in Loop: Header=BB4_339 Depth=2
	cmp	#64
	bcc	.LBB4_336
; %bb.342:                              ;   in Loop: Header=BB4_339 Depth=2
	cmp	#96
	bcs	.LBB4_333
; %bb.343:                              ;   in Loop: Header=BB4_339 Depth=2
	clc
	adc	#192
	bra	.LBB4_336
.LBB4_344:                              ;   in Loop: Header=BB4_400 Depth=1
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
	stz	__rc2
	stz	__rc3
	ldx	#2
	stx	__rc4
	ldx	#0
	lda	__rc26
	jsr	cputhex
	ldx	5633
	stx	__rc26
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_351
.LBB4_345:                              ;   in Loop: Header=BB4_351 Depth=2
	cmp	#192
	bcc	.LBB4_347
; %bb.346:                              ;   in Loop: Header=BB4_351 Depth=2
	eor	#128
	bra	.LBB4_348
.LBB4_347:                              ;   in Loop: Header=BB4_351 Depth=2
	clc
	adc	#224
.LBB4_348:                              ;   in Loop: Header=BB4_351 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_350
; %bb.349:                              ;   in Loop: Header=BB4_351 Depth=2
	inc	__rc3
.LBB4_350:                              ;   in Loop: Header=BB4_351 Depth=2
	tax
	beq	.LBB4_356
.LBB4_351:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_353
; %bb.352:                              ;   in Loop: Header=BB4_351 Depth=2
	inc	__rc25
.LBB4_353:                              ;   in Loop: Header=BB4_351 Depth=2
	cmp	#64
	bcc	.LBB4_348
; %bb.354:                              ;   in Loop: Header=BB4_351 Depth=2
	cmp	#96
	bcs	.LBB4_345
; %bb.355:                              ;   in Loop: Header=BB4_351 Depth=2
	clc
	adc	#192
	bra	.LBB4_348
.LBB4_356:                              ;   in Loop: Header=BB4_400 Depth=1
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
	stz	__rc2
	stz	__rc3
	ldx	#2
	stx	__rc4
	ldx	#0
	lda	__rc26
	jsr	cputhex
	ldx	5634
	stx	__rc26
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_363
.LBB4_357:                              ;   in Loop: Header=BB4_363 Depth=2
	cmp	#192
	bcc	.LBB4_359
; %bb.358:                              ;   in Loop: Header=BB4_363 Depth=2
	eor	#128
	bra	.LBB4_360
.LBB4_359:                              ;   in Loop: Header=BB4_363 Depth=2
	clc
	adc	#224
.LBB4_360:                              ;   in Loop: Header=BB4_363 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_362
; %bb.361:                              ;   in Loop: Header=BB4_363 Depth=2
	inc	__rc3
.LBB4_362:                              ;   in Loop: Header=BB4_363 Depth=2
	tax
	beq	.LBB4_368
.LBB4_363:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_365
; %bb.364:                              ;   in Loop: Header=BB4_363 Depth=2
	inc	__rc25
.LBB4_365:                              ;   in Loop: Header=BB4_363 Depth=2
	cmp	#64
	bcc	.LBB4_360
; %bb.366:                              ;   in Loop: Header=BB4_363 Depth=2
	cmp	#96
	bcs	.LBB4_357
; %bb.367:                              ;   in Loop: Header=BB4_363 Depth=2
	clc
	adc	#192
	bra	.LBB4_360
.LBB4_368:                              ;   in Loop: Header=BB4_400 Depth=1
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
	stz	__rc2
	stz	__rc3
	ldx	#2
	stx	__rc4
	ldx	#0
	lda	__rc26
	jsr	cputhex
	ldx	5635
	stx	__rc26
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_375
.LBB4_369:                              ;   in Loop: Header=BB4_375 Depth=2
	cmp	#192
	bcc	.LBB4_371
; %bb.370:                              ;   in Loop: Header=BB4_375 Depth=2
	eor	#128
	bra	.LBB4_372
.LBB4_371:                              ;   in Loop: Header=BB4_375 Depth=2
	clc
	adc	#224
.LBB4_372:                              ;   in Loop: Header=BB4_375 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_374
; %bb.373:                              ;   in Loop: Header=BB4_375 Depth=2
	inc	__rc3
.LBB4_374:                              ;   in Loop: Header=BB4_375 Depth=2
	tax
	beq	.LBB4_380
.LBB4_375:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_377
; %bb.376:                              ;   in Loop: Header=BB4_375 Depth=2
	inc	__rc25
.LBB4_377:                              ;   in Loop: Header=BB4_375 Depth=2
	cmp	#64
	bcc	.LBB4_372
; %bb.378:                              ;   in Loop: Header=BB4_375 Depth=2
	cmp	#96
	bcs	.LBB4_369
; %bb.379:                              ;   in Loop: Header=BB4_375 Depth=2
	clc
	adc	#192
	bra	.LBB4_372
.LBB4_380:                              ;   in Loop: Header=BB4_400 Depth=1
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
	jsr	cputln
.LBB4_381:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB4_381
; %bb.382:                              ;   in Loop: Header=BB4_400 Depth=1
	stz	54800
	ldy	mos8(workside)
	lda	mos8(datNextTrk)
	and	#1
	beq	.LBB4_384
; %bb.383:                              ;   in Loop: Header=BB4_400 Depth=1
	ldx	#2
	bra	.LBB4_385
.LBB4_384:                              ;   in Loop: Header=BB4_400 Depth=1
	ldx	#0
.LBB4_385:                              ;   in Loop: Header=BB4_400 Depth=1
	lda	#mos16lo(.L.str.42)
	sta	__rc24
	lda	#mos16hi(.L.str.42)
	sta	__rc25
	lda	mos8(datNextSec)
	phy
	ldy	#0
	sty	__rc2
	ldy	#24
	sty	__rc3
	ply
	sta	__rc4
	tya
	jsr	PutWholeSector
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB4_392
.LBB4_386:                              ;   in Loop: Header=BB4_392 Depth=2
	cmp	#192
	bcc	.LBB4_388
; %bb.387:                              ;   in Loop: Header=BB4_392 Depth=2
	eor	#128
	bra	.LBB4_389
.LBB4_388:                              ;   in Loop: Header=BB4_392 Depth=2
	clc
	adc	#224
.LBB4_389:                              ;   in Loop: Header=BB4_392 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_391
; %bb.390:                              ;   in Loop: Header=BB4_392 Depth=2
	inc	__rc3
.LBB4_391:                              ;   in Loop: Header=BB4_392 Depth=2
	tax
	beq	.LBB4_397
.LBB4_392:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB4_394
; %bb.393:                              ;   in Loop: Header=BB4_392 Depth=2
	inc	__rc25
.LBB4_394:                              ;   in Loop: Header=BB4_392 Depth=2
	cmp	#64
	bcc	.LBB4_389
; %bb.395:                              ;   in Loop: Header=BB4_392 Depth=2
	cmp	#96
	bcs	.LBB4_386
; %bb.396:                              ;   in Loop: Header=BB4_392 Depth=2
	clc
	adc	#192
	bra	.LBB4_389
.LBB4_397:                              ;   in Loop: Header=BB4_400 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB4_398:                              ;   Parent Loop BB4_400 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB4_398
; %bb.399:                              ;   in Loop: Header=BB4_400 Depth=1
	stz	54800
	ldx	mos8(i)
	inx
	inc	mos8(i)
	cpx	#38
	bcs	.LBB4_401
.LBB4_400:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_236 Depth 2
                                        ;     Child Loop BB4_250 Depth 2
                                        ;     Child Loop BB4_258 Depth 2
                                        ;     Child Loop BB4_277 Depth 2
                                        ;     Child Loop BB4_289 Depth 2
                                        ;     Child Loop BB4_301 Depth 2
                                        ;     Child Loop BB4_313 Depth 2
                                        ;     Child Loop BB4_325 Depth 2
                                        ;     Child Loop BB4_331 Depth 2
                                        ;     Child Loop BB4_339 Depth 2
                                        ;     Child Loop BB4_351 Depth 2
                                        ;     Child Loop BB4_363 Depth 2
                                        ;     Child Loop BB4_375 Depth 2
                                        ;     Child Loop BB4_381 Depth 2
                                        ;     Child Loop BB4_392 Depth 2
                                        ;     Child Loop BB4_398 Depth 2
	ldy	#mos16lo(.L.str.33)
	sty	__rc24
	ldy	#mos16hi(.L.str.33)
	sty	__rc25
	stx	mos8(datNextSec)
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
; %bb.432:                              ;   in Loop: Header=BB4_400 Depth=1
	jmp	.LBB4_236
.LBB4_401:
	ldx	mos8(BAMsector)
	ldy	mos8(BAMsector+1)
	stx	__rc2
	sty	__rc3
	lda	mos8(BAMside)
	ldx	#40
	ldy	#1
	sty	__rc4
	jsr	PutWholeSector
	ldy	#2
	lda	mos8(datNextTrk)
	and	#1
	bne	.LBB4_403
; %bb.402:
	ldy	#0
.LBB4_403:
	ldx	#mos16lo(.L.str.43)
	stx	__rc2
	ldx	#mos16hi(.L.str.43)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	tya
	jsr	mprintf
	lda	mos8(datNextSec)
	stz	__rc22
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
.LBB4_404:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_404
; %bb.405:
	ldx	#mos16lo(.L.str.62)
	stx	__rc2
	ldx	#mos16hi(.L.str.62)
	stx	__rc3
	stz	54800
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB4_412
.LBB4_406:                              ;   in Loop: Header=BB4_412 Depth=1
	cmp	#192
	bcc	.LBB4_408
; %bb.407:                              ;   in Loop: Header=BB4_412 Depth=1
	eor	#128
	bra	.LBB4_409
.LBB4_408:                              ;   in Loop: Header=BB4_412 Depth=1
	clc
	adc	#224
.LBB4_409:                              ;   in Loop: Header=BB4_412 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_411
; %bb.410:                              ;   in Loop: Header=BB4_412 Depth=1
	inc	__rc5
.LBB4_411:                              ;   in Loop: Header=BB4_412 Depth=1
	tax
	beq	.LBB4_417
.LBB4_412:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_414
; %bb.413:                              ;   in Loop: Header=BB4_412 Depth=1
	inc	__rc3
.LBB4_414:                              ;   in Loop: Header=BB4_412 Depth=1
	cmp	#64
	bcc	.LBB4_409
; %bb.415:                              ;   in Loop: Header=BB4_412 Depth=1
	cmp	#96
	bcs	.LBB4_406
; %bb.416:                              ;   in Loop: Header=BB4_412 Depth=1
	clc
	adc	#192
	bra	.LBB4_409
.LBB4_417:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB4_418:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_418
; %bb.419:
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
	adc	#9
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end5:
	.size	escNOP, .Lfunc_end5-escNOP
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
.Lfunc_end6:
	.size	clrscr, .Lfunc_end6-clrscr
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
	bne	.LBB7_2
; %bb.1:
	dec	__rc20
.LBB7_2:
	lda	__rc20
	bne	.LBB7_5
; %bb.3:
	ldy	__rc23
	cpx	__rc22
	bne	.LBB7_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB7_7
.LBB7_5:
	ldy	__rc23
.LBB7_6:
	ldx	__rc22
	inx
.LBB7_7:
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
.Lfunc_end7:
	.size	cputcxy, .Lfunc_end7-cputcxy
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
.Lfunc_end8:
	.size	cputhex, .Lfunc_end8-cputhex
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
.Lfunc_end9:
	.size	cputsxy, .Lfunc_end9-cputsxy
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
	bcs	.LBB10_2
; %bb.1:
	clv
.LBB10_2:
	ror	__rc3
	ldy	__rc2
	sty	__rc12
	ror	__rc12
	lsr	__rc8
	ror
	ldy	#1
	bcs	.LBB10_4
; %bb.3:
	ldy	#0
.LBB10_4:
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	phy
	ldy	#1
	bcs	.LBB10_6
; %bb.5:
	ldy	#0
.LBB10_6:
	sty	__rc13
	ply
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	lda	#1
	bcs	.LBB10_8
; %bb.7:
	lda	#0
.LBB10_8:
	sta	__rc8
	ror	__rc3
	lda	__rc12
	ror
	sta	__rc3
	sec
	bvs	.LBB10_10
; %bb.9:
	clc
.LBB10_10:
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
.Lfunc_end10:
	.size	lcopy, .Lfunc_end10-lcopy
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
.Lfunc_end11:
	.size	lfill, .Lfunc_end11-lfill
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB12_2
; %bb.1:
	tya
	beq	.LBB12_11
.LBB12_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB12_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB12_5
; %bb.4:                                ;   in Loop: Header=BB12_3 Depth=1
	inc	__rc7
.LBB12_5:                               ;   in Loop: Header=BB12_3 Depth=1
	inc	__rc4
	bne	.LBB12_7
; %bb.6:                                ;   in Loop: Header=BB12_3 Depth=1
	inc	__rc5
.LBB12_7:                               ;   in Loop: Header=BB12_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB12_9
; %bb.8:                                ;   in Loop: Header=BB12_3 Depth=1
	dex
.LBB12_9:                               ;   in Loop: Header=BB12_3 Depth=1
	txa
	bne	.LBB12_3
; %bb.10:                               ;   in Loop: Header=BB12_3 Depth=1
	tya
	bne	.LBB12_3
.LBB12_11:
	rts
.Lfunc_end12:
	.size	memcpy, .Lfunc_end12-memcpy
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
.Lfunc_end13:
	.size	memset, .Lfunc_end13-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB14_4
.LBB14_1:                               ;   in Loop: Header=BB14_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB14_3
; %bb.2:                                ;   in Loop: Header=BB14_4 Depth=1
	inc	__rc3
.LBB14_3:                               ;   in Loop: Header=BB14_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB14_7
.LBB14_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB14_1
; %bb.5:                                ;   in Loop: Header=BB14_4 Depth=1
	cpx	#0
	bne	.LBB14_1
; %bb.6:
	rts
.LBB14_7:                               ;   in Loop: Header=BB14_4 Depth=1
	dec	__rc4
	jmp	.LBB14_4
.Lfunc_end14:
	.size	__memset, .Lfunc_end14-__memset
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
	beq	.LBB15_1
; %bb.15:
	jmp	.LBB15_13
.LBB15_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB15_2
; %bb.17:
	jmp	.LBB15_14
.LBB15_2:
	lda	__rc7
	bne	.LBB15_4
; %bb.3:
	lda	__rc6
	beq	.LBB15_12
.LBB15_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB15_6
; %bb.5:                                ;   in Loop: Header=BB15_4 Depth=1
	dec	__rc9
.LBB15_6:                               ;   in Loop: Header=BB15_4 Depth=1
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
	bne	.LBB15_8
; %bb.7:                                ;   in Loop: Header=BB15_4 Depth=1
	dec	__rc11
.LBB15_8:                               ;   in Loop: Header=BB15_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB15_10
; %bb.9:                                ;   in Loop: Header=BB15_4 Depth=1
	dex
.LBB15_10:                              ;   in Loop: Header=BB15_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB15_4
; %bb.11:                               ;   in Loop: Header=BB15_4 Depth=1
	tya
	bne	.LBB15_4
.LBB15_12:
	rts
.LBB15_13:
	cpx	__rc3
	bcs	.LBB15_14
; %bb.19:
	jmp	.LBB15_2
.LBB15_14:
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
.Lfunc_end15:
	.size	memmove, .Lfunc_end15-memmove
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB16_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB16_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB16_4
; %bb.3:                                ;   in Loop: Header=BB16_2 Depth=1
	inx
.LBB16_4:                               ;   in Loop: Header=BB16_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB16_2
	bra	.LBB16_6
.LBB16_5:
	stz	__rc4
	ldx	#0
.LBB16_6:
	lda	__rc4
	rts
.Lfunc_end16:
	.size	strlen, .Lfunc_end16-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB17_2
.LBB17_1:                               ;   in Loop: Header=BB17_2 Depth=1
	dex
	asl
.LBB17_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB17_1
; %bb.3:
	rts
.Lfunc_end17:
	.size	__ashlqi3, .Lfunc_end17-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB18_3
; %bb.1:
	ldx	__rc2
.LBB18_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB18_2
.LBB18_3:
	ldx	__rc3
	rts
.Lfunc_end18:
	.size	__ashlhi3, .Lfunc_end18-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB19_3
; %bb.1:
	ldx	__rc4
.LBB19_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB19_2
.LBB19_3:
	ldx	__rc5
	rts
.Lfunc_end19:
	.size	__ashlsi3, .Lfunc_end19-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB20_3
; %bb.1:
	ldx	__rc8
.LBB20_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB20_2
.LBB20_3:
	ldx	__rc9
	rts
.Lfunc_end20:
	.size	__ashldi3, .Lfunc_end20-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB21_2
.LBB21_1:                               ;   in Loop: Header=BB21_2 Depth=1
	dex
	lsr
.LBB21_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB21_1
; %bb.3:
	rts
.Lfunc_end21:
	.size	__lshrqi3, .Lfunc_end21-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB22_3
; %bb.1:
	ldx	__rc2
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB22_2
.LBB22_3:
	ldx	__rc3
	rts
.Lfunc_end22:
	.size	__lshrhi3, .Lfunc_end22-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB23_3
; %bb.1:
	ldx	__rc4
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB23_2
.LBB23_3:
	ldx	__rc5
	rts
.Lfunc_end23:
	.size	__lshrsi3, .Lfunc_end23-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB24_3
; %bb.1:
	ldx	__rc8
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB24_2
.LBB24_3:
	ldx	__rc9
	rts
.Lfunc_end24:
	.size	__lshrdi3, .Lfunc_end24-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB25_2
.LBB25_1:                               ;   in Loop: Header=BB25_2 Depth=1
	dex
	cmp	#128
	ror
.LBB25_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB25_1
; %bb.3:
	rts
.Lfunc_end25:
	.size	__ashrqi3, .Lfunc_end25-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
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
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB26_2
.LBB26_3:
	tax
	lda	__rc3
	rts
.Lfunc_end26:
	.size	__ashrhi3, .Lfunc_end26-__ashrhi3
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
	beq	.LBB27_3
; %bb.1:
	ldx	__rc4
.LBB27_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB27_2
.LBB27_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end27:
	.size	__ashrsi3, .Lfunc_end27-__ashrsi3
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
	beq	.LBB28_3
; %bb.1:
	ldx	__rc8
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB28_2
.LBB28_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end28:
	.size	__ashrdi3, .Lfunc_end28-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB29_2
.LBB29_1:                               ;   in Loop: Header=BB29_2 Depth=1
	dex
	cmp	#128
	rol
.LBB29_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB29_1
; %bb.3:
	rts
.Lfunc_end29:
	.size	__rotlqi3, .Lfunc_end29-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB30_3
; %bb.1:
	ldx	__rc2
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB30_2
.LBB30_3:
	tax
	lda	__rc3
	rts
.Lfunc_end30:
	.size	__rotlhi3, .Lfunc_end30-__rotlhi3
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
	beq	.LBB31_3
; %bb.1:
	ldx	__rc4
.LBB31_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB31_2
.LBB31_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end31:
	.size	__rotlsi3, .Lfunc_end31-__rotlsi3
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
	beq	.LBB32_3
; %bb.1:
	ldx	__rc8
.LBB32_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB32_2
.LBB32_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end32:
	.size	__rotldi3, .Lfunc_end32-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB33_2
.LBB33_1:                               ;   in Loop: Header=BB33_2 Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror
.LBB33_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB33_1
; %bb.3:
	rts
.Lfunc_end33:
	.size	__rotrqi3, .Lfunc_end33-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB34_3
; %bb.1:
	ldx	__rc2
.LBB34_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB34_2
.LBB34_3:
	ldx	__rc3
	rts
.Lfunc_end34:
	.size	__rotrhi3, .Lfunc_end34-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB35_3
; %bb.1:
	ldx	__rc4
.LBB35_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB35_2
.LBB35_3:
	ldx	__rc5
	rts
.Lfunc_end35:
	.size	__rotrsi3, .Lfunc_end35-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB36_3
; %bb.1:
	ldx	__rc8
.LBB36_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB36_2
.LBB36_3:
	ldx	__rc9
	rts
.Lfunc_end36:
	.size	__rotrdi3, .Lfunc_end36-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB37_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB37_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB37_4
; %bb.3:                                ;   in Loop: Header=BB37_2 Depth=1
	clc
	adc	__rc2
.LBB37_4:                               ;   in Loop: Header=BB37_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB37_2
; %bb.5:
	rts
.LBB37_6:
	lda	#0
	rts
.Lfunc_end37:
	.size	__mulqi3, .Lfunc_end37-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB38_2
; %bb.1:
	ldy	__rc2
	beq	.LBB38_7
.LBB38_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB38_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB38_5
; %bb.4:                                ;   in Loop: Header=BB38_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB38_5:                               ;   in Loop: Header=BB38_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB38_3
; %bb.6:                                ;   in Loop: Header=BB38_3 Depth=1
	ldx	__rc2
	bne	.LBB38_3
	bra	.LBB38_8
.LBB38_7:
	ldy	#0
	tya
.LBB38_8:
	tax
	tya
	rts
.Lfunc_end38:
	.size	__mulhi3, .Lfunc_end38-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
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
	bne	.LBB39_4
; %bb.13:
	jmp	.LBB39_12
.LBB39_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB39_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB39_7
; %bb.6:                                ;   in Loop: Header=BB39_5 Depth=1
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
.LBB39_7:                               ;   in Loop: Header=BB39_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB39_5
; %bb.8:                                ;   in Loop: Header=BB39_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB39_5
; %bb.9:                                ;   in Loop: Header=BB39_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB39_5
; %bb.10:                               ;   in Loop: Header=BB39_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB39_5
.LBB39_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB39_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB39_11
.Lfunc_end39:
	.size	__mulsi3, .Lfunc_end39-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB40_8
; %bb.1:
	ldy	__rc14
	bne	.LBB40_8
; %bb.2:
	ldy	__rc13
	bne	.LBB40_8
; %bb.3:
	ldy	__rc12
	bne	.LBB40_8
; %bb.4:
	ldy	__rc11
	bne	.LBB40_8
; %bb.5:
	ldy	__rc10
	bne	.LBB40_8
; %bb.6:
	ldy	__rc9
	bne	.LBB40_8
; %bb.7:
	ldy	__rc8
	bne	.LBB40_8
; %bb.21:
	jmp	.LBB40_20
.LBB40_8:
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
.LBB40_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB40_11
; %bb.10:                               ;   in Loop: Header=BB40_9 Depth=1
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
.LBB40_11:                              ;   in Loop: Header=BB40_9 Depth=1
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
	beq	.LBB40_12
; %bb.23:                               ;   in Loop: Header=BB40_9 Depth=1
	jmp	.LBB40_9
.LBB40_12:                              ;   in Loop: Header=BB40_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB40_13
; %bb.25:                               ;   in Loop: Header=BB40_9 Depth=1
	jmp	.LBB40_9
.LBB40_13:                              ;   in Loop: Header=BB40_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB40_14
; %bb.27:                               ;   in Loop: Header=BB40_9 Depth=1
	jmp	.LBB40_9
.LBB40_14:                              ;   in Loop: Header=BB40_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB40_15
; %bb.29:                               ;   in Loop: Header=BB40_9 Depth=1
	jmp	.LBB40_9
.LBB40_15:                              ;   in Loop: Header=BB40_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB40_16
; %bb.31:                               ;   in Loop: Header=BB40_9 Depth=1
	jmp	.LBB40_9
.LBB40_16:                              ;   in Loop: Header=BB40_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB40_17
; %bb.33:                               ;   in Loop: Header=BB40_9 Depth=1
	jmp	.LBB40_9
.LBB40_17:                              ;   in Loop: Header=BB40_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB40_18
; %bb.35:                               ;   in Loop: Header=BB40_9 Depth=1
	jmp	.LBB40_9
.LBB40_18:                              ;   in Loop: Header=BB40_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB40_19
; %bb.37:                               ;   in Loop: Header=BB40_9 Depth=1
	jmp	.LBB40_9
.LBB40_19:
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
.LBB40_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB40_19
.Lfunc_end40:
	.size	__muldi3, .Lfunc_end40-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB41_1
; %bb.15:
	jmp	.LBB41_14
.LBB41_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB41_2
; %bb.17:
	jmp	.LBB41_14
.LBB41_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB41_3
; %bb.19:
	jmp	.LBB41_14
.LBB41_3:
	sty	__rc5
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
	lda	__rc5
	cmp	__rc2
	lda	#1
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
	cpx	#0
	beq	.LBB41_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB41_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB41_13
; %bb.12:                               ;   in Loop: Header=BB41_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB41_13:                              ;   in Loop: Header=BB41_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB41_11
.LBB41_14:
	rts
.Lfunc_end41:
	.size	__udivqi3, .Lfunc_end41-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB42_2
; %bb.1:
	ldy	__rc2
	beq	.LBB42_4
.LBB42_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB42_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB42_6
.LBB42_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB42_22
.LBB42_5:
	cmp	__rc3
	bcc	.LBB42_4
.LBB42_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB42_7
; %bb.25:
	jmp	.LBB42_22
.LBB42_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB42_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB42_10
; %bb.9:                                ;   in Loop: Header=BB42_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB42_12
	bra	.LBB42_11
.LBB42_10:                              ;   in Loop: Header=BB42_8 Depth=1
	cmp	__rc6
	bcc	.LBB42_12
.LBB42_11:                              ;   in Loop: Header=BB42_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB42_8
	bra	.LBB42_13
.LBB42_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB42_13:
	cpx	#0
	bne	.LBB42_14
; %bb.27:
	jmp	.LBB42_22
.LBB42_14:
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
.LBB42_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB42_17
; %bb.16:                               ;   in Loop: Header=BB42_15 Depth=1
	ldy	#0
.LBB42_17:                              ;   in Loop: Header=BB42_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB42_21
; %bb.18:                               ;   in Loop: Header=BB42_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB42_20
.LBB42_19:                              ;   in Loop: Header=BB42_15 Depth=1
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
.LBB42_20:                              ;   in Loop: Header=BB42_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB42_15
	bra	.LBB42_22
.LBB42_21:                              ;   in Loop: Header=BB42_15 Depth=1
	cmp	__rc6
	bcs	.LBB42_19
	bra	.LBB42_20
.LBB42_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end42:
	.size	__udivhi3, .Lfunc_end42-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
	ldy	__rc7
	bne	.LBB43_4
; %bb.1:
	ldy	__rc6
	bne	.LBB43_4
; %bb.2:
	ldy	__rc5
	bne	.LBB43_4
; %bb.3:
	ldy	__rc4
	beq	.LBB43_9
.LBB43_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB43_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB43_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB43_7
; %bb.45:
	jmp	.LBB43_38
.LBB43_7:
	cmp	__rc4
	bcc	.LBB43_9
	bra	.LBB43_11
.LBB43_8:
	cpx	__rc7
	bcs	.LBB43_11
.LBB43_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB43_21
.LBB43_10:
	cpx	__rc6
	bcc	.LBB43_9
.LBB43_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB43_12
; %bb.47:
	jmp	.LBB43_21
.LBB43_12:
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
.LBB43_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB43_17
; %bb.14:                               ;   in Loop: Header=BB43_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB43_18
; %bb.15:                               ;   in Loop: Header=BB43_13 Depth=1
	cmp	__rc10
	bne	.LBB43_19
; %bb.16:                               ;   in Loop: Header=BB43_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB43_23
	bra	.LBB43_20
.LBB43_17:                              ;   in Loop: Header=BB43_13 Depth=1
	cpy	__rc12
	bcc	.LBB43_23
	bra	.LBB43_20
.LBB43_18:                              ;   in Loop: Header=BB43_13 Depth=1
	cpy	__rc11
	bcc	.LBB43_23
	bra	.LBB43_20
.LBB43_19:                              ;   in Loop: Header=BB43_13 Depth=1
	cmp	__rc10
	bcc	.LBB43_23
.LBB43_20:                              ;   in Loop: Header=BB43_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB43_13
	bra	.LBB43_24
.LBB43_21:
	stz	__rc2
	stz	__rc3
.LBB43_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB43_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB43_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB43_22
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
.LBB43_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB43_28
; %bb.27:                               ;   in Loop: Header=BB43_26 Depth=1
	ldy	#0
.LBB43_28:                              ;   in Loop: Header=BB43_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB43_32
; %bb.29:                               ;   in Loop: Header=BB43_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB43_34
; %bb.30:                               ;   in Loop: Header=BB43_26 Depth=1
	cmp	__rc10
	bne	.LBB43_37
; %bb.31:                               ;   in Loop: Header=BB43_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB43_33
	bra	.LBB43_35
.LBB43_32:                              ;   in Loop: Header=BB43_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB43_35
.LBB43_33:                              ;   in Loop: Header=BB43_26 Depth=1
	lda	__rc6
	bra	.LBB43_36
.LBB43_34:                              ;   in Loop: Header=BB43_26 Depth=1
	cpy	__rc11
	bcc	.LBB43_33
.LBB43_35:                              ;   in Loop: Header=BB43_26 Depth=1
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
.LBB43_36:                              ;   in Loop: Header=BB43_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB43_41
; %bb.49:                               ;   in Loop: Header=BB43_26 Depth=1
	jmp	.LBB43_26
.LBB43_41:
	jmp	.LBB43_22
.LBB43_37:                              ;   in Loop: Header=BB43_26 Depth=1
	cmp	__rc10
	bcc	.LBB43_33
	bra	.LBB43_35
.LBB43_38:
	cpx	__rc5
	bcs	.LBB43_43
; %bb.51:
	jmp	.LBB43_9
.LBB43_43:
	jmp	.LBB43_11
.Lfunc_end43:
	.size	__udivsi3, .Lfunc_end43-__udivsi3
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
	beq	.LBB44_17
.LBB44_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB44_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB44_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB44_11
; %bb.90:
	jmp	.LBB44_31
.LBB44_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB44_12
; %bb.92:
	jmp	.LBB44_32
.LBB44_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB44_13
; %bb.94:
	jmp	.LBB44_38
.LBB44_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB44_14
; %bb.96:
	jmp	.LBB44_40
.LBB44_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB44_15
; %bb.98:
	jmp	.LBB44_42
.LBB44_15:
	cmp	__rc8
	bcc	.LBB44_17
	bra	.LBB44_19
.LBB44_16:
	cpx	__rc15
	bcs	.LBB44_19
.LBB44_17:
	lda	#0
; %bb.66:
	jmp	.LBB44_29
.LBB44_18:
	cpx	__rc14
	bcc	.LBB44_17
.LBB44_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB44_20
; %bb.100:
	jmp	.LBB44_29
.LBB44_20:
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
.LBB44_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB44_25
; %bb.22:                               ;   in Loop: Header=BB44_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB44_26
; %bb.23:                               ;   in Loop: Header=BB44_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB44_27
; %bb.24:                               ;   in Loop: Header=BB44_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB44_102
; %bb.150:                              ;   in Loop: Header=BB44_21 Depth=1
	jmp	.LBB44_33
.LBB44_102:                             ;   in Loop: Header=BB44_21 Depth=1
	jmp	.LBB44_37
.LBB44_25:                              ;   in Loop: Header=BB44_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB44_28
; %bb.104:
	jmp	.LBB44_44
.LBB44_26:                              ;   in Loop: Header=BB44_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB44_28
; %bb.106:
	jmp	.LBB44_44
.LBB44_27:                              ;   in Loop: Header=BB44_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB44_28
; %bb.108:
	jmp	.LBB44_44
.LBB44_28:                              ;   in Loop: Header=BB44_21 Depth=1
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
	bmi	.LBB44_68
; %bb.110:                              ;   in Loop: Header=BB44_21 Depth=1
	jmp	.LBB44_21
.LBB44_68:
	jmp	.LBB44_45
.LBB44_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB44_30:
	ldx	__rc18
	rts
.LBB44_31:
	cpx	__rc13
	bcs	.LBB44_70
; %bb.112:
	jmp	.LBB44_17
.LBB44_70:
	jmp	.LBB44_19
.LBB44_32:
	cpx	__rc12
	bcs	.LBB44_72
; %bb.114:
	jmp	.LBB44_17
.LBB44_72:
	jmp	.LBB44_19
.LBB44_33:                              ;   in Loop: Header=BB44_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB44_39
; %bb.34:                               ;   in Loop: Header=BB44_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB44_41
; %bb.35:                               ;   in Loop: Header=BB44_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB44_43
; %bb.36:                               ;   in Loop: Header=BB44_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB44_44
; %bb.74:                               ;   in Loop: Header=BB44_21 Depth=1
	jmp	.LBB44_28
.LBB44_37:                              ;   in Loop: Header=BB44_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB44_44
; %bb.76:                               ;   in Loop: Header=BB44_21 Depth=1
	jmp	.LBB44_28
.LBB44_38:
	cpx	__rc11
	bcs	.LBB44_78
; %bb.116:
	jmp	.LBB44_17
.LBB44_78:
	jmp	.LBB44_19
.LBB44_39:                              ;   in Loop: Header=BB44_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB44_44
; %bb.80:                               ;   in Loop: Header=BB44_21 Depth=1
	jmp	.LBB44_28
.LBB44_40:
	cpx	__rc10
	bcs	.LBB44_82
; %bb.118:
	jmp	.LBB44_17
.LBB44_82:
	jmp	.LBB44_19
.LBB44_41:                              ;   in Loop: Header=BB44_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB44_44
; %bb.84:                               ;   in Loop: Header=BB44_21 Depth=1
	jmp	.LBB44_28
.LBB44_42:
	cpx	__rc9
	bcs	.LBB44_86
; %bb.120:
	jmp	.LBB44_17
.LBB44_86:
	jmp	.LBB44_19
.LBB44_43:                              ;   in Loop: Header=BB44_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB44_44
; %bb.122:                              ;   in Loop: Header=BB44_21 Depth=1
	jmp	.LBB44_28
.LBB44_44:
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
.LBB44_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB44_46
; %bb.124:
	jmp	.LBB44_30
.LBB44_46:
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
.LBB44_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB44_49
; %bb.48:                               ;   in Loop: Header=BB44_47 Depth=1
	ldy	#0
.LBB44_49:                              ;   in Loop: Header=BB44_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB44_57
; %bb.50:                               ;   in Loop: Header=BB44_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB44_51
; %bb.126:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_60
.LBB44_51:                              ;   in Loop: Header=BB44_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB44_52
; %bb.128:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_61
.LBB44_52:                              ;   in Loop: Header=BB44_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB44_53
; %bb.130:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_62
.LBB44_53:                              ;   in Loop: Header=BB44_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB44_54
; %bb.132:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_63
.LBB44_54:                              ;   in Loop: Header=BB44_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB44_55
; %bb.134:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_64
.LBB44_55:                              ;   in Loop: Header=BB44_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB44_56
; %bb.136:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_65
.LBB44_56:                              ;   in Loop: Header=BB44_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB44_58
	bra	.LBB44_59
.LBB44_57:                              ;   in Loop: Header=BB44_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB44_59
.LBB44_58:                              ;   in Loop: Header=BB44_47 Depth=1
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
.LBB44_59:                              ;   in Loop: Header=BB44_47 Depth=1
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
	beq	.LBB44_88
; %bb.138:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_47
.LBB44_88:
	jmp	.LBB44_30
.LBB44_60:                              ;   in Loop: Header=BB44_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB44_58
	bra	.LBB44_59
.LBB44_61:                              ;   in Loop: Header=BB44_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB44_59
; %bb.140:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_58
.LBB44_62:                              ;   in Loop: Header=BB44_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB44_59
; %bb.142:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_58
.LBB44_63:                              ;   in Loop: Header=BB44_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB44_59
; %bb.144:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_58
.LBB44_64:                              ;   in Loop: Header=BB44_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB44_59
; %bb.146:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_58
.LBB44_65:                              ;   in Loop: Header=BB44_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB44_59
; %bb.148:                              ;   in Loop: Header=BB44_47 Depth=1
	jmp	.LBB44_58
.Lfunc_end44:
	.size	__udivdi3, .Lfunc_end44-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB45_1
; %bb.15:
	jmp	.LBB45_13
.LBB45_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB45_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB45_14
; %bb.3:
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB45_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB45_6
; %bb.5:                                ;   in Loop: Header=BB45_4 Depth=1
	cmp	__rc2
	bcc	.LBB45_8
	bra	.LBB45_7
.LBB45_6:                               ;   in Loop: Header=BB45_4 Depth=1
	cpy	__rc4
	bcc	.LBB45_8
.LBB45_7:                               ;   in Loop: Header=BB45_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB45_4
	bra	.LBB45_9
.LBB45_8:
	ldy	__rc3
	sty	__rc2
.LBB45_9:
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB45_13
.LBB45_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB45_12
; %bb.11:                               ;   in Loop: Header=BB45_10 Depth=1
	sec
	sbc	__rc2
.LBB45_12:                              ;   in Loop: Header=BB45_10 Depth=1
	dex
	bne	.LBB45_10
.LBB45_13:
	rts
.LBB45_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end45:
	.size	__umodqi3, .Lfunc_end45-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB46_2
; %bb.1:
	ldx	__rc2
	bne	.LBB46_2
; %bb.22:
	jmp	.LBB46_19
.LBB46_2:
	cmp	__rc3
	bne	.LBB46_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB46_5
; %bb.20:
	jmp	.LBB46_19
.LBB46_4:
	cmp	__rc3
	bcs	.LBB46_5
; %bb.24:
	jmp	.LBB46_19
.LBB46_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB46_6
; %bb.26:
	jmp	.LBB46_18
.LBB46_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB46_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB46_9
; %bb.8:                                ;   in Loop: Header=BB46_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB46_11
	bra	.LBB46_10
.LBB46_9:                               ;   in Loop: Header=BB46_7 Depth=1
	cmp	__rc5
	bcc	.LBB46_11
.LBB46_10:                              ;   in Loop: Header=BB46_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB46_7
	bra	.LBB46_12
.LBB46_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB46_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB46_19
.LBB46_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB46_17
; %bb.14:                               ;   in Loop: Header=BB46_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB46_16
.LBB46_15:                              ;   in Loop: Header=BB46_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB46_16:                              ;   in Loop: Header=BB46_13 Depth=1
	dex
	bne	.LBB46_13
	bra	.LBB46_19
.LBB46_17:                              ;   in Loop: Header=BB46_13 Depth=1
	cmp	__rc5
	bcs	.LBB46_15
	bra	.LBB46_16
.LBB46_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB46_19:
	tax
	tya
	rts
.Lfunc_end46:
	.size	__umodhi3, .Lfunc_end46-__umodhi3
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
	bne	.LBB47_4
; %bb.1:
	ldx	__rc6
	bne	.LBB47_4
; %bb.2:
	ldx	__rc5
	bne	.LBB47_4
; %bb.3:
	ldx	__rc4
	bne	.LBB47_4
; %bb.42:
	jmp	.LBB47_35
.LBB47_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB47_8
; %bb.5:
	cmp	__rc6
	bne	.LBB47_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB47_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB47_11
; %bb.36:
	jmp	.LBB47_35
.LBB47_8:
	cpx	__rc7
	bcs	.LBB47_11
; %bb.38:
	jmp	.LBB47_35
.LBB47_9:
	cmp	__rc6
	bcs	.LBB47_11
; %bb.40:
	jmp	.LBB47_35
.LBB47_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB47_11
; %bb.44:
	jmp	.LBB47_35
.LBB47_11:
	ldx	__rc7
	bpl	.LBB47_12
; %bb.46:
	jmp	.LBB47_33
.LBB47_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB47_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB47_17
; %bb.14:                               ;   in Loop: Header=BB47_13 Depth=1
	cmp	__rc8
	bne	.LBB47_18
; %bb.15:                               ;   in Loop: Header=BB47_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB47_19
; %bb.16:                               ;   in Loop: Header=BB47_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB47_21
	bra	.LBB47_20
.LBB47_17:                              ;   in Loop: Header=BB47_13 Depth=1
	cpy	__rc9
	bcc	.LBB47_21
	bra	.LBB47_20
.LBB47_18:                              ;   in Loop: Header=BB47_13 Depth=1
	cmp	__rc8
	bcc	.LBB47_21
	bra	.LBB47_20
.LBB47_19:                              ;   in Loop: Header=BB47_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB47_21
.LBB47_20:                              ;   in Loop: Header=BB47_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB47_13
	bra	.LBB47_22
.LBB47_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB47_22:
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
	bne	.LBB47_23
; %bb.48:
	jmp	.LBB47_34
.LBB47_23:
	tya
.LBB47_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB47_28
; %bb.25:                               ;   in Loop: Header=BB47_24 Depth=1
	cmp	__rc8
	bne	.LBB47_31
; %bb.26:                               ;   in Loop: Header=BB47_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB47_32
; %bb.27:                               ;   in Loop: Header=BB47_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB47_29
	bra	.LBB47_30
.LBB47_28:                              ;   in Loop: Header=BB47_24 Depth=1
	cpy	__rc9
	bcc	.LBB47_30
.LBB47_29:                              ;   in Loop: Header=BB47_24 Depth=1
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
.LBB47_30:                              ;   in Loop: Header=BB47_24 Depth=1
	dex
	bne	.LBB47_24
	bra	.LBB47_35
.LBB47_31:                              ;   in Loop: Header=BB47_24 Depth=1
	cmp	__rc8
	bcs	.LBB47_29
	bra	.LBB47_30
.LBB47_32:                              ;   in Loop: Header=BB47_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB47_29
	bra	.LBB47_30
.LBB47_33:
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
	bra	.LBB47_35
.LBB47_34:
	tya
.LBB47_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end47:
	.size	__umodsi3, .Lfunc_end47-__umodsi3
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
	bne	.LBB48_8
; %bb.1:
	ldx	__rc14
	bne	.LBB48_8
; %bb.2:
	ldx	__rc13
	bne	.LBB48_8
; %bb.3:
	ldx	__rc12
	bne	.LBB48_8
; %bb.4:
	ldx	__rc11
	bne	.LBB48_8
; %bb.5:
	ldx	__rc10
	bne	.LBB48_8
; %bb.6:
	ldx	__rc9
	bne	.LBB48_8
; %bb.7:
	ldx	__rc8
	bne	.LBB48_8
; %bb.90:
	jmp	.LBB48_61
.LBB48_8:
	cmp	__rc15
	bne	.LBB48_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB48_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB48_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB48_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB48_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB48_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB48_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB48_23
; %bb.62:
	jmp	.LBB48_61
.LBB48_16:
	cmp	__rc15
	bcs	.LBB48_23
; %bb.64:
	jmp	.LBB48_61
.LBB48_17:
	cpx	__rc14
	bcs	.LBB48_23
; %bb.66:
	jmp	.LBB48_61
.LBB48_18:
	cpx	__rc13
	bcs	.LBB48_23
; %bb.68:
	jmp	.LBB48_61
.LBB48_19:
	cpx	__rc12
	bcs	.LBB48_23
; %bb.70:
	jmp	.LBB48_61
.LBB48_20:
	cpx	__rc11
	bcs	.LBB48_23
; %bb.72:
	jmp	.LBB48_61
.LBB48_21:
	cpx	__rc10
	bcs	.LBB48_23
; %bb.74:
	jmp	.LBB48_61
.LBB48_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB48_23
; %bb.92:
	jmp	.LBB48_61
.LBB48_23:
	ldx	__rc15
	bpl	.LBB48_24
; %bb.94:
	jmp	.LBB48_33
.LBB48_24:
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
.LBB48_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB48_29
; %bb.26:                               ;   in Loop: Header=BB48_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB48_30
; %bb.27:                               ;   in Loop: Header=BB48_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB48_31
; %bb.28:                               ;   in Loop: Header=BB48_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB48_76
; %bb.96:                               ;   in Loop: Header=BB48_25 Depth=1
	jmp	.LBB48_38
.LBB48_76:                              ;   in Loop: Header=BB48_25 Depth=1
	jmp	.LBB48_34
.LBB48_29:                              ;   in Loop: Header=BB48_25 Depth=1
	cmp	__rc19
	bcs	.LBB48_32
; %bb.98:
	jmp	.LBB48_42
.LBB48_30:                              ;   in Loop: Header=BB48_25 Depth=1
	cpy	__rc18
	bcs	.LBB48_32
; %bb.100:
	jmp	.LBB48_42
.LBB48_31:                              ;   in Loop: Header=BB48_25 Depth=1
	cpy	__rc7
	bcs	.LBB48_32
; %bb.102:
	jmp	.LBB48_42
.LBB48_32:                              ;   in Loop: Header=BB48_25 Depth=1
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
	bmi	.LBB48_78
; %bb.104:                              ;   in Loop: Header=BB48_25 Depth=1
	jmp	.LBB48_25
.LBB48_78:
	jmp	.LBB48_43
.LBB48_33:
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
	jmp	.LBB48_61
.LBB48_34:                              ;   in Loop: Header=BB48_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB48_39
; %bb.35:                               ;   in Loop: Header=BB48_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB48_40
; %bb.36:                               ;   in Loop: Header=BB48_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB48_41
; %bb.37:                               ;   in Loop: Header=BB48_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB48_42
; %bb.82:                               ;   in Loop: Header=BB48_25 Depth=1
	jmp	.LBB48_32
.LBB48_38:                              ;   in Loop: Header=BB48_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB48_42
; %bb.84:                               ;   in Loop: Header=BB48_25 Depth=1
	jmp	.LBB48_32
.LBB48_39:                              ;   in Loop: Header=BB48_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB48_42
; %bb.86:                               ;   in Loop: Header=BB48_25 Depth=1
	jmp	.LBB48_32
.LBB48_40:                              ;   in Loop: Header=BB48_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB48_42
; %bb.88:                               ;   in Loop: Header=BB48_25 Depth=1
	jmp	.LBB48_32
.LBB48_41:                              ;   in Loop: Header=BB48_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB48_42
; %bb.106:                              ;   in Loop: Header=BB48_25 Depth=1
	jmp	.LBB48_32
.LBB48_42:
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
.LBB48_43:
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
	bne	.LBB48_44
; %bb.108:
	jmp	.LBB48_61
.LBB48_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB48_52
; %bb.45:                               ;   in Loop: Header=BB48_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB48_46
; %bb.110:                              ;   in Loop: Header=BB48_44 Depth=1
	jmp	.LBB48_55
.LBB48_46:                              ;   in Loop: Header=BB48_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB48_47
; %bb.112:                              ;   in Loop: Header=BB48_44 Depth=1
	jmp	.LBB48_56
.LBB48_47:                              ;   in Loop: Header=BB48_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB48_48
; %bb.114:                              ;   in Loop: Header=BB48_44 Depth=1
	jmp	.LBB48_57
.LBB48_48:                              ;   in Loop: Header=BB48_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB48_49
; %bb.116:                              ;   in Loop: Header=BB48_44 Depth=1
	jmp	.LBB48_58
.LBB48_49:                              ;   in Loop: Header=BB48_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB48_50
; %bb.118:                              ;   in Loop: Header=BB48_44 Depth=1
	jmp	.LBB48_59
.LBB48_50:                              ;   in Loop: Header=BB48_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB48_51
; %bb.120:                              ;   in Loop: Header=BB48_44 Depth=1
	jmp	.LBB48_60
.LBB48_51:                              ;   in Loop: Header=BB48_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB48_53
	bra	.LBB48_54
.LBB48_52:                              ;   in Loop: Header=BB48_44 Depth=1
	cmp	__rc19
	bcc	.LBB48_54
.LBB48_53:                              ;   in Loop: Header=BB48_44 Depth=1
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
.LBB48_54:                              ;   in Loop: Header=BB48_44 Depth=1
	dex
	beq	.LBB48_61
; %bb.122:                              ;   in Loop: Header=BB48_44 Depth=1
	jmp	.LBB48_44
.LBB48_55:                              ;   in Loop: Header=BB48_44 Depth=1
	cpy	__rc18
	bcs	.LBB48_53
	bra	.LBB48_54
.LBB48_56:                              ;   in Loop: Header=BB48_44 Depth=1
	cpy	__rc7
	bcs	.LBB48_53
	bra	.LBB48_54
.LBB48_57:                              ;   in Loop: Header=BB48_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB48_53
	bra	.LBB48_54
.LBB48_58:                              ;   in Loop: Header=BB48_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB48_53
	bra	.LBB48_54
.LBB48_59:                              ;   in Loop: Header=BB48_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB48_53
	bra	.LBB48_54
.LBB48_60:                              ;   in Loop: Header=BB48_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB48_54
; %bb.124:                              ;   in Loop: Header=BB48_44 Depth=1
	jmp	.LBB48_53
.LBB48_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end48:
	.size	__umoddi3, .Lfunc_end48-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB49_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB49_2
; %bb.18:
	jmp	.LBB49_17
.LBB49_2:
	lda	__rc5
	bpl	.LBB49_3
; %bb.20:
	jmp	.LBB49_15
.LBB49_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB49_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB49_6
; %bb.5:                                ;   in Loop: Header=BB49_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB49_9
	bra	.LBB49_7
.LBB49_6:                               ;   in Loop: Header=BB49_4 Depth=1
	cpy	__rc6
	bcc	.LBB49_9
.LBB49_7:                               ;   in Loop: Header=BB49_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB49_4
	bra	.LBB49_10
.LBB49_8:
	sty	__rc7
	bra	.LBB49_17
.LBB49_9:
	ldy	__rc5
	sty	__rc4
.LBB49_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB49_16
; %bb.11:
	lda	#1
.LBB49_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB49_14
; %bb.13:                               ;   in Loop: Header=BB49_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB49_14:                              ;   in Loop: Header=BB49_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB49_12
	bra	.LBB49_17
.LBB49_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB49_16:
	lda	#1
.LBB49_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end49:
	.size	__udivmodqi4, .Lfunc_end49-__udivmodqi4
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
	bne	.LBB50_2
; %bb.1:
	ldx	__rc2
	beq	.LBB50_4
.LBB50_2:
	cmp	__rc3
	bne	.LBB50_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB50_6
.LBB50_4:
	ldx	#0
; %bb.26:
	jmp	.LBB50_24
.LBB50_5:
	cmp	__rc3
	bcc	.LBB50_4
.LBB50_6:
	tay
	ldx	__rc3
	bpl	.LBB50_7
; %bb.28:
	jmp	.LBB50_22
.LBB50_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB50_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB50_10
; %bb.9:                                ;   in Loop: Header=BB50_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB50_11
	bra	.LBB50_12
.LBB50_10:                              ;   in Loop: Header=BB50_8 Depth=1
	cmp	__rc8
	bcc	.LBB50_12
.LBB50_11:                              ;   in Loop: Header=BB50_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB50_8
	bra	.LBB50_13
.LBB50_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB50_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB50_14
; %bb.30:
	jmp	.LBB50_23
.LBB50_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB50_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB50_17
; %bb.16:                               ;   in Loop: Header=BB50_15 Depth=1
	ldy	#0
.LBB50_17:                              ;   in Loop: Header=BB50_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB50_21
; %bb.18:                               ;   in Loop: Header=BB50_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB50_20
.LBB50_19:                              ;   in Loop: Header=BB50_15 Depth=1
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
.LBB50_20:                              ;   in Loop: Header=BB50_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB50_15
	bra	.LBB50_25
.LBB50_21:                              ;   in Loop: Header=BB50_15 Depth=1
	cmp	__rc8
	bcs	.LBB50_19
	bra	.LBB50_20
.LBB50_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB50_23:
	ldx	#1
.LBB50_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB50_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end50:
	.size	__udivmodhi4, .Lfunc_end50-__udivmodhi4
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
	bpl	.LBB51_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB51_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB51_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB51_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB51_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB51_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB51_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB51_8:
	lda	__rc2
	rts
.Lfunc_end51:
	.size	__divqi3, .Lfunc_end51-__divqi3
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
	bmi	.LBB52_2
; %bb.1:
	bra	.LBB52_6
.LBB52_2:
	cpx	#128
	bne	.LBB52_5
; %bb.3:
	lda	__rc4
	bne	.LBB52_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB52_6
.LBB52_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB52_6:
	tya
	bmi	.LBB52_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB52_12
.LBB52_8:
	cpy	#128
	bne	.LBB52_11
; %bb.9:
	lda	__rc2
	bne	.LBB52_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB52_12
.LBB52_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB52_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB52_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB52_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end52:
	.size	__divhi3, .Lfunc_end52-__divhi3
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
	bmi	.LBB53_2
; %bb.1:
	ldy	__rc3
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
	ldy	#128
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
	sbc	mos8(.L__divsi3_zp_stk+1)
	tay
.LBB53_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB53_10
; %bb.9:
	lda	__rc7
	bra	.LBB53_16
.LBB53_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB53_15
; %bb.11:
	lda	__rc6
	bne	.LBB53_15
; %bb.12:
	lda	__rc5
	bne	.LBB53_15
; %bb.13:
	lda	__rc4
	bne	.LBB53_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB53_16
.LBB53_15:
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
.LBB53_16:
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
	bne	.LBB53_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB53_19
.LBB53_18:
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
.LBB53_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end53:
	.size	__divsi3, .Lfunc_end53-__divsi3
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
	bmi	.LBB54_2
; %bb.1:
	ldy	__rc7
; %bb.28:
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
	ldy	#128
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
	sbc	mos8(.L__divdi3_zp_stk+1)
	tay
.LBB54_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB54_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB54_24
.LBB54_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB54_23
; %bb.15:
	lda	__rc14
	bne	.LBB54_23
; %bb.16:
	lda	__rc13
	bne	.LBB54_23
; %bb.17:
	lda	__rc12
	bne	.LBB54_23
; %bb.18:
	lda	__rc11
	bne	.LBB54_23
; %bb.19:
	lda	__rc10
	bne	.LBB54_23
; %bb.20:
	lda	__rc9
	bne	.LBB54_23
; %bb.21:
	lda	__rc8
	bne	.LBB54_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB54_24
.LBB54_23:
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
.LBB54_24:
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
	bne	.LBB54_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB54_27
.LBB54_26:
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
.LBB54_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end54:
	.size	__divdi3, .Lfunc_end54-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB55_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB55_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB55_3:
	tay
	lda	__rc2
	bmi	.LBB55_5
; %bb.4:
	lda	__rc2
	bra	.LBB55_7
.LBB55_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB55_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB55_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB55_9
; %bb.8:
	rts
.LBB55_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end55:
	.size	__modqi3, .Lfunc_end55-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB56_2
; %bb.1:
	txa
	bra	.LBB56_6
.LBB56_2:
	cpx	#128
	bne	.LBB56_5
; %bb.3:
	lda	__rc4
	bne	.LBB56_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB56_6
.LBB56_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB56_6:
	ldx	__rc3
	bpl	.LBB56_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB56_10
; %bb.8:
	ldx	__rc2
	bne	.LBB56_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB56_11
.LBB56_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB56_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB56_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB56_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end56:
	.size	__modhi3, .Lfunc_end56-__modhi3
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
	bmi	.LBB57_2
; %bb.1:
	lda	__rc3
	bra	.LBB57_8
.LBB57_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB57_7
; %bb.3:
	lda	__rc2
	bne	.LBB57_7
; %bb.4:
	lda	__rc8
	bne	.LBB57_7
; %bb.5:
	lda	__rc9
	bne	.LBB57_7
; %bb.6:
	stz	__rc9
	lda	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB57_8
.LBB57_7:
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
.LBB57_8:
	ldx	__rc7
	bpl	.LBB57_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB57_14
; %bb.10:
	ldx	__rc6
	bne	.LBB57_14
; %bb.11:
	ldx	__rc5
	bne	.LBB57_14
; %bb.12:
	ldx	__rc4
	bne	.LBB57_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB57_15
.LBB57_14:
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
.LBB57_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB57_17
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
.LBB57_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end57:
	.size	__modsi3, .Lfunc_end57-__modsi3
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
	bmi	.LBB58_2
; %bb.1:
	lda	__rc7
; %bb.26:
	jmp	.LBB58_12
.LBB58_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB58_11
; %bb.3:
	lda	__rc6
	bne	.LBB58_11
; %bb.4:
	lda	__rc5
	bne	.LBB58_11
; %bb.5:
	lda	__rc4
	bne	.LBB58_11
; %bb.6:
	lda	__rc3
	bne	.LBB58_11
; %bb.7:
	lda	__rc2
	bne	.LBB58_11
; %bb.8:
	lda	__rc18
	bne	.LBB58_11
; %bb.9:
	lda	__rc19
	bne	.LBB58_11
; %bb.10:
	stz	__rc19
	lda	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB58_12
.LBB58_11:
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
.LBB58_12:
	ldx	__rc15
	bmi	.LBB58_13
; %bb.28:
	jmp	.LBB58_23
.LBB58_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB58_22
; %bb.14:
	ldx	__rc14
	bne	.LBB58_22
; %bb.15:
	ldx	__rc13
	bne	.LBB58_22
; %bb.16:
	ldx	__rc12
	bne	.LBB58_22
; %bb.17:
	ldx	__rc11
	bne	.LBB58_22
; %bb.18:
	ldx	__rc10
	bne	.LBB58_22
; %bb.19:
	ldx	__rc9
	bne	.LBB58_22
; %bb.20:
	ldx	__rc8
	bne	.LBB58_22
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
	bra	.LBB58_23
.LBB58_22:
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
.LBB58_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB58_25
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
.LBB58_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end58:
	.size	__moddi3, .Lfunc_end58-__moddi3
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
	bpl	.LBB59_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB59_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB59_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB59_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB59_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB59_11
.LBB59_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB59_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB59_8
; %bb.34:
	jmp	.LBB59_24
.LBB59_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB59_24
.LBB59_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB59_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB59_12
.LBB59_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB59_24
.LBB59_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB59_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB59_15
; %bb.14:                               ;   in Loop: Header=BB59_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB59_18
	bra	.LBB59_16
.LBB59_15:                              ;   in Loop: Header=BB59_13 Depth=1
	cmp	__rc7
	bcc	.LBB59_18
.LBB59_16:                              ;   in Loop: Header=BB59_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB59_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB59_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB59_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB59_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB59_22
; %bb.21:                               ;   in Loop: Header=BB59_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB59_22:                              ;   in Loop: Header=BB59_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB59_20
	bra	.LBB59_24
.LBB59_23:
	sta	__rc7
	sty	__rc6
.LBB59_24:
	lda	__rc4
	bmi	.LBB59_26
; %bb.25:
	lda	__rc7
	bra	.LBB59_27
.LBB59_26:
	lda	#0
	sec
	sbc	__rc7
.LBB59_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB59_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB59_29:
	lda	__rc6
	rts
.Lfunc_end59:
	.size	__divmodqi4, .Lfunc_end59-__divmodqi4
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
	bmi	.LBB60_2
.LBB60_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB60_6
.LBB60_2:
	cpx	#128
	bne	.LBB60_5
; %bb.3:
	lda	__rc7
	bne	.LBB60_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB60_1
.LBB60_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB60_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB60_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB60_15
; %bb.8:
	lda	__rc2
	bne	.LBB60_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB60_18
.LBB60_10:
	cpy	#128
	bne	.LBB60_14
; %bb.11:
	ldy	__rc2
	bne	.LBB60_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB60_13
; %bb.48:
	jmp	.LBB60_45
.LBB60_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB60_18
.LBB60_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB60_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB60_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB60_20
.LBB60_17:
	sta	__rc11
.LBB60_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB60_39
.LBB60_19:
	cmp	__rc7
	bcc	.LBB60_17
.LBB60_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB60_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB60_23
; %bb.22:                               ;   in Loop: Header=BB60_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB60_24
	bra	.LBB60_26
.LBB60_23:                              ;   in Loop: Header=BB60_21 Depth=1
	cmp	__rc9
	bcc	.LBB60_26
.LBB60_24:                              ;   in Loop: Header=BB60_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB60_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB60_27
.LBB60_26:
	tay
.LBB60_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB60_28
; %bb.50:
	jmp	.LBB60_37
.LBB60_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB60_32
.LBB60_29:                              ;   in Loop: Header=BB60_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB60_36
.LBB60_30:                              ;   in Loop: Header=BB60_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB60_31:                              ;   in Loop: Header=BB60_32 Depth=1
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
	beq	.LBB60_39
.LBB60_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB60_34
; %bb.33:                               ;   in Loop: Header=BB60_32 Depth=1
	ldy	#0
.LBB60_34:                              ;   in Loop: Header=BB60_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB60_29
; %bb.35:                               ;   in Loop: Header=BB60_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB60_30
.LBB60_36:                              ;   in Loop: Header=BB60_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB60_31
.LBB60_37:
	sta	__rc11
	ldx	#1
.LBB60_38:
	stx	__rc9
.LBB60_39:
	lda	__rc6
	bmi	.LBB60_41
; %bb.40:
	lda	__rc10
	bra	.LBB60_42
.LBB60_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB60_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB60_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB60_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB60_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB60_38
.Lfunc_end60:
	.size	__divmodhi4, .Lfunc_end60-__divmodhi4
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

	.type	.L.str.32,@object               ; @.str.32
	.section	.rodata.str1.1,"aMS",@progbits,1
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
	.short	24576
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
	.asciz	"EMPTY.d81"
	.size	.L.str.50, 10

	.type	.L.str.51,@object               ; @.str.51
.L.str.51:
	.asciz	" hyppofn: "
	.size	.L.str.51, 11

	.type	.L.str.52,@object               ; @.str.52
.L.str.52:
	.asciz	"EMPTY.D81"
	.size	.L.str.52, 10

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
	.asciz	"Have fun with your Mega65!"
	.size	.L.str.62, 27

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
	.zero	41
	.size	.Lzp_stack, 41

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

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
	.section	.text.ReadSector,"ax",@progbits
	.type	ReadSector,@function            ; -- Begin function ReadSector
ReadSector:                             ; @ReadSector
; %bb.0:
	tay
	bne	.LBB2_1
; %bb.15:
	jmp	.LBB2_14
.LBB2_1:
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
	bra	.LBB2_8
.LBB2_2:                                ;   in Loop: Header=BB2_8 Depth=1
	cmp	#192
	bcc	.LBB2_4
; %bb.3:                                ;   in Loop: Header=BB2_8 Depth=1
	eor	#128
	bra	.LBB2_5
.LBB2_4:                                ;   in Loop: Header=BB2_8 Depth=1
	clc
	adc	#224
.LBB2_5:                                ;   in Loop: Header=BB2_8 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB2_7
; %bb.6:                                ;   in Loop: Header=BB2_8 Depth=1
	inc	__rc7
.LBB2_7:                                ;   in Loop: Header=BB2_8 Depth=1
	tax
	beq	.LBB2_13
.LBB2_8:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB2_10
; %bb.9:                                ;   in Loop: Header=BB2_8 Depth=1
	inc	__rc5
.LBB2_10:                               ;   in Loop: Header=BB2_8 Depth=1
	cmp	#64
	bcc	.LBB2_5
; %bb.11:                               ;   in Loop: Header=BB2_8 Depth=1
	cmp	#96
	bcs	.LBB2_2
; %bb.12:                               ;   in Loop: Header=BB2_8 Depth=1
	clc
	adc	#192
	bra	.LBB2_5
.LBB2_13:
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
.LBB2_14:
	lda	#252
	rts
.Lfunc_end2:
	.size	ReadSector, .Lfunc_end2-ReadSector
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
	bra	.LBB3_7
.LBB3_1:                                ;   in Loop: Header=BB3_7 Depth=1
	cmp	#192
	bcc	.LBB3_3
; %bb.2:                                ;   in Loop: Header=BB3_7 Depth=1
	eor	#128
	bra	.LBB3_4
.LBB3_3:                                ;   in Loop: Header=BB3_7 Depth=1
	clc
	adc	#224
.LBB3_4:                                ;   in Loop: Header=BB3_7 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB3_6
; %bb.5:                                ;   in Loop: Header=BB3_7 Depth=1
	inc	__rc5
.LBB3_6:                                ;   in Loop: Header=BB3_7 Depth=1
	tax
	beq	.LBB3_12
.LBB3_7:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB3_9
; %bb.8:                                ;   in Loop: Header=BB3_7 Depth=1
	inc	__rc3
.LBB3_9:                                ;   in Loop: Header=BB3_7 Depth=1
	cmp	#64
	bcc	.LBB3_4
; %bb.10:                               ;   in Loop: Header=BB3_7 Depth=1
	cmp	#96
	bcs	.LBB3_1
; %bb.11:                               ;   in Loop: Header=BB3_7 Depth=1
	clc
	adc	#192
	bra	.LBB3_4
.LBB3_12:
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
	bra	.LBB3_19
.LBB3_13:                               ;   in Loop: Header=BB3_19 Depth=1
	cmp	#192
	bcc	.LBB3_15
; %bb.14:                               ;   in Loop: Header=BB3_19 Depth=1
	eor	#128
	bra	.LBB3_16
.LBB3_15:                               ;   in Loop: Header=BB3_19 Depth=1
	clc
	adc	#224
.LBB3_16:                               ;   in Loop: Header=BB3_19 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB3_18
; %bb.17:                               ;   in Loop: Header=BB3_19 Depth=1
	inc	__rc3
.LBB3_18:                               ;   in Loop: Header=BB3_19 Depth=1
	tax
	beq	.LBB3_24
.LBB3_19:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc28)
	inc	__rc28
	bne	.LBB3_21
; %bb.20:                               ;   in Loop: Header=BB3_19 Depth=1
	inc	__rc29
.LBB3_21:                               ;   in Loop: Header=BB3_19 Depth=1
	cmp	#64
	bcc	.LBB3_16
; %bb.22:                               ;   in Loop: Header=BB3_19 Depth=1
	cmp	#96
	bcs	.LBB3_13
; %bb.23:                               ;   in Loop: Header=BB3_19 Depth=1
	clc
	adc	#192
	bra	.LBB3_16
.LBB3_24:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
.LBB3_25:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB3_25
; %bb.26:
	stz	54800
	ldx	__rc24
	lda	__rc25
	jsr	ReadSector
	cmp	#2
	bcc	.LBB3_27
; %bb.79:
	jmp	.LBB3_78
.LBB3_27:
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
.LBB3_28:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_35 Depth 2
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
	bra	.LBB3_35
.LBB3_29:                               ;   in Loop: Header=BB3_35 Depth=2
	cmp	#192
	bcc	.LBB3_31
; %bb.30:                               ;   in Loop: Header=BB3_35 Depth=2
	eor	#128
	bra	.LBB3_32
.LBB3_31:                               ;   in Loop: Header=BB3_35 Depth=2
	clc
	adc	#224
.LBB3_32:                               ;   in Loop: Header=BB3_35 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB3_34
; %bb.33:                               ;   in Loop: Header=BB3_35 Depth=2
	inc	__rc3
.LBB3_34:                               ;   in Loop: Header=BB3_35 Depth=2
	tax
	beq	.LBB3_40
.LBB3_35:                               ;   Parent Loop BB3_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc30)
	inc	__rc30
	bne	.LBB3_37
; %bb.36:                               ;   in Loop: Header=BB3_35 Depth=2
	inc	__rc31
.LBB3_37:                               ;   in Loop: Header=BB3_35 Depth=2
	cmp	#64
	bcc	.LBB3_32
; %bb.38:                               ;   in Loop: Header=BB3_35 Depth=2
	cmp	#96
	bcs	.LBB3_29
; %bb.39:                               ;   in Loop: Header=BB3_35 Depth=2
	clc
	adc	#192
	bra	.LBB3_32
.LBB3_40:                               ;   in Loop: Header=BB3_28 Depth=1
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
	ldx	__rc27
	ldy	__rc28
	inx
	bne	.LBB3_42
; %bb.41:                               ;   in Loop: Header=BB3_28 Depth=1
	iny
.LBB3_42:                               ;   in Loop: Header=BB3_28 Depth=1
	stx	__rc27
	sty	__rc28
	cpy	#1
	beq	.LBB3_43
; %bb.81:                               ;   in Loop: Header=BB3_28 Depth=1
	jmp	.LBB3_28
.LBB3_43:                               ;   in Loop: Header=BB3_28 Depth=1
	stx	__rc27
	sty	__rc28
	txa
	beq	.LBB3_44
; %bb.83:                               ;   in Loop: Header=BB3_28 Depth=1
	jmp	.LBB3_28
.LBB3_44:
	jsr	cputln
.LBB3_45:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB3_45
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
.LBB3_47:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_54 Depth 2
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
	bra	.LBB3_54
.LBB3_48:                               ;   in Loop: Header=BB3_54 Depth=2
	cmp	#192
	bcc	.LBB3_50
; %bb.49:                               ;   in Loop: Header=BB3_54 Depth=2
	eor	#128
	bra	.LBB3_51
.LBB3_50:                               ;   in Loop: Header=BB3_54 Depth=2
	clc
	adc	#224
.LBB3_51:                               ;   in Loop: Header=BB3_54 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB3_53
; %bb.52:                               ;   in Loop: Header=BB3_54 Depth=2
	inc	__rc3
.LBB3_53:                               ;   in Loop: Header=BB3_54 Depth=2
	tax
	beq	.LBB3_59
.LBB3_54:                               ;   Parent Loop BB3_47 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc28)
	inc	__rc28
	bne	.LBB3_56
; %bb.55:                               ;   in Loop: Header=BB3_54 Depth=2
	inc	__rc29
.LBB3_56:                               ;   in Loop: Header=BB3_54 Depth=2
	cmp	#64
	bcc	.LBB3_51
; %bb.57:                               ;   in Loop: Header=BB3_54 Depth=2
	cmp	#96
	bcs	.LBB3_48
; %bb.58:                               ;   in Loop: Header=BB3_54 Depth=2
	clc
	adc	#192
	bra	.LBB3_51
.LBB3_59:                               ;   in Loop: Header=BB3_47 Depth=1
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
	bne	.LBB3_61
; %bb.60:                               ;   in Loop: Header=BB3_47 Depth=1
	iny
.LBB3_61:                               ;   in Loop: Header=BB3_47 Depth=1
	stx	__rc24
	sty	__rc25
	cpy	#1
	beq	.LBB3_62
; %bb.85:                               ;   in Loop: Header=BB3_47 Depth=1
	jmp	.LBB3_47
.LBB3_62:                               ;   in Loop: Header=BB3_47 Depth=1
	stx	__rc24
	sty	__rc25
	txa
	beq	.LBB3_63
; %bb.87:                               ;   in Loop: Header=BB3_47 Depth=1
	jmp	.LBB3_47
.LBB3_63:
	jsr	cputln
.LBB3_64:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB3_64
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
	bra	.LBB3_72
.LBB3_66:                               ;   in Loop: Header=BB3_72 Depth=1
	cmp	#192
	bcc	.LBB3_68
; %bb.67:                               ;   in Loop: Header=BB3_72 Depth=1
	eor	#128
	bra	.LBB3_69
.LBB3_68:                               ;   in Loop: Header=BB3_72 Depth=1
	clc
	adc	#224
.LBB3_69:                               ;   in Loop: Header=BB3_72 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB3_71
; %bb.70:                               ;   in Loop: Header=BB3_72 Depth=1
	inc	__rc3
.LBB3_71:                               ;   in Loop: Header=BB3_72 Depth=1
	tax
	beq	.LBB3_77
.LBB3_72:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB3_74
; %bb.73:                               ;   in Loop: Header=BB3_72 Depth=1
	inc	__rc23
.LBB3_74:                               ;   in Loop: Header=BB3_72 Depth=1
	cmp	#64
	bcc	.LBB3_69
; %bb.75:                               ;   in Loop: Header=BB3_72 Depth=1
	cmp	#96
	bcs	.LBB3_66
; %bb.76:                               ;   in Loop: Header=BB3_72 Depth=1
	clc
	adc	#192
	bra	.LBB3_69
.LBB3_77:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
.LBB3_78:
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
.Lfunc_end3:
	.size	GetWholeSector, .Lfunc_end3-GetWholeSector
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
	bcc	.LBB4_1
; %bb.60:
	jmp	.LBB4_57
.LBB4_1:
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
	bne	.LBB4_2
; %bb.62:
	jmp	.LBB4_19
.LBB4_2:
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
.LBB4_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_10 Depth 2
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
	bra	.LBB4_10
.LBB4_4:                                ;   in Loop: Header=BB4_10 Depth=2
	cmp	#192
	bcc	.LBB4_6
; %bb.5:                                ;   in Loop: Header=BB4_10 Depth=2
	eor	#128
	bra	.LBB4_7
.LBB4_6:                                ;   in Loop: Header=BB4_10 Depth=2
	clc
	adc	#224
.LBB4_7:                                ;   in Loop: Header=BB4_10 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_9
; %bb.8:                                ;   in Loop: Header=BB4_10 Depth=2
	inc	__rc5
.LBB4_9:                                ;   in Loop: Header=BB4_10 Depth=2
	tax
	beq	.LBB4_15
.LBB4_10:                               ;   Parent Loop BB4_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_12
; %bb.11:                               ;   in Loop: Header=BB4_10 Depth=2
	inc	__rc3
.LBB4_12:                               ;   in Loop: Header=BB4_10 Depth=2
	cmp	#64
	bcc	.LBB4_7
; %bb.13:                               ;   in Loop: Header=BB4_10 Depth=2
	cmp	#96
	bcs	.LBB4_4
; %bb.14:                               ;   in Loop: Header=BB4_10 Depth=2
	clc
	adc	#192
	bra	.LBB4_7
.LBB4_15:                               ;   in Loop: Header=BB4_3 Depth=1
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
	bne	.LBB4_17
; %bb.16:                               ;   in Loop: Header=BB4_3 Depth=1
	inx
.LBB4_17:                               ;   in Loop: Header=BB4_3 Depth=1
	cpx	#1
	beq	.LBB4_18
; %bb.64:                               ;   in Loop: Header=BB4_3 Depth=1
	jmp	.LBB4_3
.LBB4_18:                               ;   in Loop: Header=BB4_3 Depth=1
	lda	__rc20
	beq	.LBB4_58
; %bb.66:                               ;   in Loop: Header=BB4_3 Depth=1
	jmp	.LBB4_3
.LBB4_58:
	jmp	.LBB4_38
.LBB4_19:
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
.LBB4_20:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_20
; %bb.21:
	stz	__rc21
	stz	54800
	stz	__rc20
	ldx	#0
.LBB4_22:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_29 Depth 2
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
	bra	.LBB4_29
.LBB4_23:                               ;   in Loop: Header=BB4_29 Depth=2
	cmp	#192
	bcc	.LBB4_25
; %bb.24:                               ;   in Loop: Header=BB4_29 Depth=2
	eor	#128
	bra	.LBB4_26
.LBB4_25:                               ;   in Loop: Header=BB4_29 Depth=2
	clc
	adc	#224
.LBB4_26:                               ;   in Loop: Header=BB4_29 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB4_28
; %bb.27:                               ;   in Loop: Header=BB4_29 Depth=2
	inc	__rc5
.LBB4_28:                               ;   in Loop: Header=BB4_29 Depth=2
	tax
	beq	.LBB4_34
.LBB4_29:                               ;   Parent Loop BB4_22 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB4_31
; %bb.30:                               ;   in Loop: Header=BB4_29 Depth=2
	inc	__rc3
.LBB4_31:                               ;   in Loop: Header=BB4_29 Depth=2
	cmp	#64
	bcc	.LBB4_26
; %bb.32:                               ;   in Loop: Header=BB4_29 Depth=2
	cmp	#96
	bcs	.LBB4_23
; %bb.33:                               ;   in Loop: Header=BB4_29 Depth=2
	clc
	adc	#192
	bra	.LBB4_26
.LBB4_34:                               ;   in Loop: Header=BB4_22 Depth=1
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
	bne	.LBB4_36
; %bb.35:                               ;   in Loop: Header=BB4_22 Depth=1
	inx
.LBB4_36:                               ;   in Loop: Header=BB4_22 Depth=1
	cpx	#1
	beq	.LBB4_37
; %bb.68:                               ;   in Loop: Header=BB4_22 Depth=1
	jmp	.LBB4_22
.LBB4_37:                               ;   in Loop: Header=BB4_22 Depth=1
	lda	__rc20
	beq	.LBB4_38
; %bb.70:                               ;   in Loop: Header=BB4_22 Depth=1
	jmp	.LBB4_22
.LBB4_38:
	jsr	cputln
.LBB4_39:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_39
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
	bra	.LBB4_47
.LBB4_41:                               ;   in Loop: Header=BB4_47 Depth=1
	cmp	#192
	bcc	.LBB4_43
; %bb.42:                               ;   in Loop: Header=BB4_47 Depth=1
	eor	#128
	bra	.LBB4_44
.LBB4_43:                               ;   in Loop: Header=BB4_47 Depth=1
	clc
	adc	#224
.LBB4_44:                               ;   in Loop: Header=BB4_47 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB4_46
; %bb.45:                               ;   in Loop: Header=BB4_47 Depth=1
	inc	__rc3
.LBB4_46:                               ;   in Loop: Header=BB4_47 Depth=1
	tax
	beq	.LBB4_52
.LBB4_47:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc20)
	inc	__rc20
	bne	.LBB4_49
; %bb.48:                               ;   in Loop: Header=BB4_47 Depth=1
	inc	__rc21
.LBB4_49:                               ;   in Loop: Header=BB4_47 Depth=1
	cmp	#64
	bcc	.LBB4_44
; %bb.50:                               ;   in Loop: Header=BB4_47 Depth=1
	cmp	#96
	bcs	.LBB4_41
; %bb.51:                               ;   in Loop: Header=BB4_47 Depth=1
	clc
	adc	#192
	bra	.LBB4_44
.LBB4_52:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
.LBB4_53:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_53
; %bb.54:
	ldx	#97
	stz	54800
	sec
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sbc	__rc27
	cmp	#20
	bcc	.LBB4_56
; %bb.55:
	ldx	#105
.LBB4_56:
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
.LBB4_57:
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
.Lfunc_end4:
	.size	PutWholeSector, .Lfunc_end4-PutWholeSector
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
	bpl	.LBB5_2
; %bb.1:
	ldx	#80
.LBB5_2:
	ldy	#mos8(dmalist)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	stx	mos8(g_curScreenW)
	lda	53297
	and	#8
	beq	.LBB5_4
; %bb.3:
	ldx	#50
	bra	.LBB5_5
.LBB5_4:
	ldx	#25
.LBB5_5:
	stx	mos8(g_curScreenH)
	bra	.LBB5_7
.LBB5_6:                                ;   in Loop: Header=BB5_7 Depth=1
	stz	54800
.LBB5_7:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB5_6
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
.LBB5_9:                                ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB5_11
; %bb.10:                               ;   in Loop: Header=BB5_9 Depth=1
	inc	__rc5
.LBB5_11:                               ;   in Loop: Header=BB5_9 Depth=1
	lda	#mos16hi(escNOP)
	sta	(__rc4),y
	dex
	bne	.LBB5_9
	bra	.LBB5_13
.LBB5_12:                               ;   in Loop: Header=BB5_13 Depth=1
	stz	54800
.LBB5_13:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB5_12
; %bb.14:
	ldx	#mos16lo(.L.str.48)
	stx	__rc2
	ldx	#mos16hi(.L.str.48)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB5_21
.LBB5_15:                               ;   in Loop: Header=BB5_21 Depth=1
	cmp	#192
	bcc	.LBB5_17
; %bb.16:                               ;   in Loop: Header=BB5_21 Depth=1
	eor	#128
	bra	.LBB5_18
.LBB5_17:                               ;   in Loop: Header=BB5_21 Depth=1
	clc
	adc	#224
.LBB5_18:                               ;   in Loop: Header=BB5_21 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_20
; %bb.19:                               ;   in Loop: Header=BB5_21 Depth=1
	inc	__rc5
.LBB5_20:                               ;   in Loop: Header=BB5_21 Depth=1
	tax
	beq	.LBB5_26
.LBB5_21:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_23
; %bb.22:                               ;   in Loop: Header=BB5_21 Depth=1
	inc	__rc3
.LBB5_23:                               ;   in Loop: Header=BB5_21 Depth=1
	cmp	#64
	bcc	.LBB5_18
; %bb.24:                               ;   in Loop: Header=BB5_21 Depth=1
	cmp	#96
	bcs	.LBB5_15
; %bb.25:                               ;   in Loop: Header=BB5_21 Depth=1
	clc
	adc	#192
	bra	.LBB5_18
.LBB5_26:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB5_27:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB5_27
; %bb.28:
	ldx	#11
	txa
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
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
.LBB5_29:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB5_29
; %bb.30:
	ldx	#5
.LBB5_31:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB5_31
; %bb.32:
	ldx	mos8(g_curScreenH)
	cpx	#10
	bcs	.LBB5_33
; %bb.433:
	jmp	.LBB5_36
.LBB5_33:
	lda	mos8(g_curScreenW)
	cmp	#71
	bcs	.LBB5_34
; %bb.435:
	jmp	.LBB5_36
.LBB5_34:
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
.LBB5_35:                               ; =>This Inner Loop Header: Depth=1
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
	bcc	.LBB5_35
.LBB5_36:
	lda	__rc28
	and	#15
	sta	__rc2
	lda	#240
	and	mos8(g_curTextColor)
	ora	__rc2
	sta	mos8(g_curTextColor)
.LBB5_37:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB5_37
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
	bra	.LBB5_45
.LBB5_39:                               ;   in Loop: Header=BB5_45 Depth=1
	cmp	#192
	bcc	.LBB5_41
; %bb.40:                               ;   in Loop: Header=BB5_45 Depth=1
	eor	#128
	bra	.LBB5_42
.LBB5_41:                               ;   in Loop: Header=BB5_45 Depth=1
	clc
	adc	#224
.LBB5_42:                               ;   in Loop: Header=BB5_45 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_44
; %bb.43:                               ;   in Loop: Header=BB5_45 Depth=1
	inc	__rc3
.LBB5_44:                               ;   in Loop: Header=BB5_45 Depth=1
	tax
	beq	.LBB5_50
.LBB5_45:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc28)
	inc	__rc28
	bne	.LBB5_47
; %bb.46:                               ;   in Loop: Header=BB5_45 Depth=1
	inc	__rc29
.LBB5_47:                               ;   in Loop: Header=BB5_45 Depth=1
	cmp	#64
	bcc	.LBB5_42
; %bb.48:                               ;   in Loop: Header=BB5_45 Depth=1
	cmp	#96
	bcs	.LBB5_39
; %bb.49:                               ;   in Loop: Header=BB5_45 Depth=1
	clc
	adc	#192
	bra	.LBB5_42
.LBB5_50:
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
	bra	.LBB5_57
.LBB5_51:                               ;   in Loop: Header=BB5_57 Depth=1
	cmp	#192
	bcc	.LBB5_53
; %bb.52:                               ;   in Loop: Header=BB5_57 Depth=1
	eor	#128
	bra	.LBB5_54
.LBB5_53:                               ;   in Loop: Header=BB5_57 Depth=1
	clc
	adc	#224
.LBB5_54:                               ;   in Loop: Header=BB5_57 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_56
; %bb.55:                               ;   in Loop: Header=BB5_57 Depth=1
	inc	__rc3
.LBB5_56:                               ;   in Loop: Header=BB5_57 Depth=1
	tax
	beq	.LBB5_62
.LBB5_57:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc28)
	inc	__rc28
	bne	.LBB5_59
; %bb.58:                               ;   in Loop: Header=BB5_57 Depth=1
	inc	__rc29
.LBB5_59:                               ;   in Loop: Header=BB5_57 Depth=1
	cmp	#64
	bcc	.LBB5_54
; %bb.60:                               ;   in Loop: Header=BB5_57 Depth=1
	cmp	#96
	bcs	.LBB5_51
; %bb.61:                               ;   in Loop: Header=BB5_57 Depth=1
	clc
	adc	#192
	bra	.LBB5_54
.LBB5_62:
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
	bra	.LBB5_69
.LBB5_63:                               ;   in Loop: Header=BB5_69 Depth=1
	cmp	#192
	bcc	.LBB5_65
; %bb.64:                               ;   in Loop: Header=BB5_69 Depth=1
	eor	#128
	bra	.LBB5_66
.LBB5_65:                               ;   in Loop: Header=BB5_69 Depth=1
	clc
	adc	#224
.LBB5_66:                               ;   in Loop: Header=BB5_69 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_68
; %bb.67:                               ;   in Loop: Header=BB5_69 Depth=1
	inc	__rc5
.LBB5_68:                               ;   in Loop: Header=BB5_69 Depth=1
	tax
	beq	.LBB5_74
.LBB5_69:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_71
; %bb.70:                               ;   in Loop: Header=BB5_69 Depth=1
	inc	__rc3
.LBB5_71:                               ;   in Loop: Header=BB5_69 Depth=1
	cmp	#64
	bcc	.LBB5_66
; %bb.72:                               ;   in Loop: Header=BB5_69 Depth=1
	cmp	#96
	bcs	.LBB5_63
; %bb.73:                               ;   in Loop: Header=BB5_69 Depth=1
	clc
	adc	#192
	bra	.LBB5_66
.LBB5_74:
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
	bra	.LBB5_81
.LBB5_75:                               ;   in Loop: Header=BB5_81 Depth=1
	cmp	#192
	bcc	.LBB5_77
; %bb.76:                               ;   in Loop: Header=BB5_81 Depth=1
	eor	#128
	bra	.LBB5_78
.LBB5_77:                               ;   in Loop: Header=BB5_81 Depth=1
	clc
	adc	#224
.LBB5_78:                               ;   in Loop: Header=BB5_81 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_80
; %bb.79:                               ;   in Loop: Header=BB5_81 Depth=1
	inc	__rc3
.LBB5_80:                               ;   in Loop: Header=BB5_81 Depth=1
	tax
	beq	.LBB5_86
.LBB5_81:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc28)
	inc	__rc28
	bne	.LBB5_83
; %bb.82:                               ;   in Loop: Header=BB5_81 Depth=1
	inc	__rc29
.LBB5_83:                               ;   in Loop: Header=BB5_81 Depth=1
	cmp	#64
	bcc	.LBB5_78
; %bb.84:                               ;   in Loop: Header=BB5_81 Depth=1
	cmp	#96
	bcs	.LBB5_75
; %bb.85:                               ;   in Loop: Header=BB5_81 Depth=1
	clc
	adc	#192
	bra	.LBB5_78
.LBB5_86:
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
	bra	.LBB5_93
.LBB5_87:                               ;   in Loop: Header=BB5_93 Depth=1
	cmp	#192
	bcc	.LBB5_89
; %bb.88:                               ;   in Loop: Header=BB5_93 Depth=1
	eor	#128
	bra	.LBB5_90
.LBB5_89:                               ;   in Loop: Header=BB5_93 Depth=1
	clc
	adc	#224
.LBB5_90:                               ;   in Loop: Header=BB5_93 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_92
; %bb.91:                               ;   in Loop: Header=BB5_93 Depth=1
	inc	__rc3
.LBB5_92:                               ;   in Loop: Header=BB5_93 Depth=1
	tax
	beq	.LBB5_98
.LBB5_93:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc26)
	inc	__rc26
	bne	.LBB5_95
; %bb.94:                               ;   in Loop: Header=BB5_93 Depth=1
	inc	__rc27
.LBB5_95:                               ;   in Loop: Header=BB5_93 Depth=1
	cmp	#64
	bcc	.LBB5_90
; %bb.96:                               ;   in Loop: Header=BB5_93 Depth=1
	cmp	#96
	bcs	.LBB5_87
; %bb.97:                               ;   in Loop: Header=BB5_93 Depth=1
	clc
	adc	#192
	bra	.LBB5_90
.LBB5_98:
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
	bne	.LBB5_99
; %bb.437:
	jmp	.LBB5_179
.LBB5_99:
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
	bra	.LBB5_106
.LBB5_100:                              ;   in Loop: Header=BB5_106 Depth=1
	cmp	#192
	bcc	.LBB5_102
; %bb.101:                              ;   in Loop: Header=BB5_106 Depth=1
	eor	#128
	bra	.LBB5_103
.LBB5_102:                              ;   in Loop: Header=BB5_106 Depth=1
	clc
	adc	#224
.LBB5_103:                              ;   in Loop: Header=BB5_106 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_105
; %bb.104:                              ;   in Loop: Header=BB5_106 Depth=1
	inc	__rc5
.LBB5_105:                              ;   in Loop: Header=BB5_106 Depth=1
	tax
	beq	.LBB5_111
.LBB5_106:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_108
; %bb.107:                              ;   in Loop: Header=BB5_106 Depth=1
	inc	__rc3
.LBB5_108:                              ;   in Loop: Header=BB5_106 Depth=1
	cmp	#64
	bcc	.LBB5_103
; %bb.109:                              ;   in Loop: Header=BB5_106 Depth=1
	cmp	#96
	bcs	.LBB5_100
; %bb.110:                              ;   in Loop: Header=BB5_106 Depth=1
	clc
	adc	#192
	bra	.LBB5_103
.LBB5_111:
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
	bne	.LBB5_112
; %bb.439:
	jmp	.LBB5_179
.LBB5_112:
	cpy	#135
	bne	.LBB5_113
; %bb.441:
	jmp	.LBB5_179
.LBB5_113:
	cpy	#255
	bne	.LBB5_114
; %bb.443:
	jmp	.LBB5_179
.LBB5_114:
	stz	__rc23
; %bb.419:
	jmp	.LBB5_163
.LBB5_115:                              ;   in Loop: Header=BB5_121 Depth=2
	cmp	#192
	bcc	.LBB5_117
; %bb.116:                              ;   in Loop: Header=BB5_121 Depth=2
	eor	#128
	bra	.LBB5_118
.LBB5_117:                              ;   in Loop: Header=BB5_121 Depth=2
	clc
	adc	#224
.LBB5_118:                              ;   in Loop: Header=BB5_121 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_120
; %bb.119:                              ;   in Loop: Header=BB5_121 Depth=2
	inc	__rc5
.LBB5_120:                              ;   in Loop: Header=BB5_121 Depth=2
	tax
	beq	.LBB5_126
.LBB5_121:                              ;   Parent Loop BB5_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_123
; %bb.122:                              ;   in Loop: Header=BB5_121 Depth=2
	inc	__rc3
.LBB5_123:                              ;   in Loop: Header=BB5_121 Depth=2
	cmp	#64
	bcc	.LBB5_118
; %bb.124:                              ;   in Loop: Header=BB5_121 Depth=2
	cmp	#96
	bcs	.LBB5_115
; %bb.125:                              ;   in Loop: Header=BB5_121 Depth=2
	clc
	adc	#192
	bra	.LBB5_118
.LBB5_126:                              ;   in Loop: Header=BB5_163 Depth=1
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
	bne	.LBB5_127
; %bb.445:
	jmp	.LBB5_164
.LBB5_127:                              ;   in Loop: Header=BB5_163 Depth=1
	cpx	#255
	bne	.LBB5_128
; %bb.447:
	jmp	.LBB5_164
.LBB5_128:                              ;   in Loop: Header=BB5_163 Depth=1
	ldy	#0
	ldx	#0
.LBB5_129:                              ;   Parent Loop BB5_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	24641,y
	cmp	#32
	beq	.LBB5_133
; %bb.130:                              ;   in Loop: Header=BB5_129 Depth=2
	cmp	#33
	bcc	.LBB5_132
; %bb.131:                              ;   in Loop: Header=BB5_129 Depth=2
	sta	24897,x
	inx
.LBB5_132:                              ;   in Loop: Header=BB5_129 Depth=2
	iny
	cpy	#8
	bne	.LBB5_129
.LBB5_133:                              ;   in Loop: Header=BB5_163 Depth=1
	ldy	#0
	lda	#46
	sta	24897,x
	inx
.LBB5_134:                              ;   Parent Loop BB5_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	24649,y
	cmp	#32
	beq	.LBB5_138
; %bb.135:                              ;   in Loop: Header=BB5_134 Depth=2
	cmp	#33
	bcc	.LBB5_137
; %bb.136:                              ;   in Loop: Header=BB5_134 Depth=2
	sta	24897,x
	inx
.LBB5_137:                              ;   in Loop: Header=BB5_134 Depth=2
	iny
	cpy	#3
	bne	.LBB5_134
.LBB5_138:                              ;   in Loop: Header=BB5_163 Depth=1
	ldy	#mos16lo(.L.str.59)
	sty	__rc2
	ldy	#mos16hi(.L.str.59)
	sty	__rc3
	stz	24897,x
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB5_145
.LBB5_139:                              ;   in Loop: Header=BB5_145 Depth=2
	cmp	#192
	bcc	.LBB5_141
; %bb.140:                              ;   in Loop: Header=BB5_145 Depth=2
	eor	#128
	bra	.LBB5_142
.LBB5_141:                              ;   in Loop: Header=BB5_145 Depth=2
	clc
	adc	#224
.LBB5_142:                              ;   in Loop: Header=BB5_145 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_144
; %bb.143:                              ;   in Loop: Header=BB5_145 Depth=2
	inc	__rc5
.LBB5_144:                              ;   in Loop: Header=BB5_145 Depth=2
	tax
	beq	.LBB5_150
.LBB5_145:                              ;   Parent Loop BB5_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_147
; %bb.146:                              ;   in Loop: Header=BB5_145 Depth=2
	inc	__rc3
.LBB5_147:                              ;   in Loop: Header=BB5_145 Depth=2
	cmp	#64
	bcc	.LBB5_142
; %bb.148:                              ;   in Loop: Header=BB5_145 Depth=2
	cmp	#96
	bcs	.LBB5_139
; %bb.149:                              ;   in Loop: Header=BB5_145 Depth=2
	clc
	adc	#192
	bra	.LBB5_142
.LBB5_150:                              ;   in Loop: Header=BB5_163 Depth=1
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
	bra	.LBB5_157
.LBB5_151:                              ;   in Loop: Header=BB5_157 Depth=2
	cmp	#192
	bcc	.LBB5_153
; %bb.152:                              ;   in Loop: Header=BB5_157 Depth=2
	eor	#128
	bra	.LBB5_154
.LBB5_153:                              ;   in Loop: Header=BB5_157 Depth=2
	clc
	adc	#224
.LBB5_154:                              ;   in Loop: Header=BB5_157 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_156
; %bb.155:                              ;   in Loop: Header=BB5_157 Depth=2
	inc	__rc5
.LBB5_156:                              ;   in Loop: Header=BB5_157 Depth=2
	tax
	beq	.LBB5_162
.LBB5_157:                              ;   Parent Loop BB5_163 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_159
; %bb.158:                              ;   in Loop: Header=BB5_157 Depth=2
	inc	__rc3
.LBB5_159:                              ;   in Loop: Header=BB5_157 Depth=2
	cmp	#64
	bcc	.LBB5_154
; %bb.160:                              ;   in Loop: Header=BB5_157 Depth=2
	cmp	#96
	bcs	.LBB5_151
; %bb.161:                              ;   in Loop: Header=BB5_157 Depth=2
	clc
	adc	#192
	bra	.LBB5_154
.LBB5_162:                              ;   in Loop: Header=BB5_163 Depth=1
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
.LBB5_163:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_121 Depth 2
                                        ;     Child Loop BB5_129 Depth 2
                                        ;     Child Loop BB5_134 Depth 2
                                        ;     Child Loop BB5_145 Depth 2
                                        ;     Child Loop BB5_157 Depth 2
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
; %bb.421:                              ;   in Loop: Header=BB5_163 Depth=1
	jmp	.LBB5_121
.LBB5_164:
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
	bra	.LBB5_171
.LBB5_165:                              ;   in Loop: Header=BB5_171 Depth=1
	cmp	#192
	bcc	.LBB5_167
; %bb.166:                              ;   in Loop: Header=BB5_171 Depth=1
	eor	#128
	bra	.LBB5_168
.LBB5_167:                              ;   in Loop: Header=BB5_171 Depth=1
	clc
	adc	#224
.LBB5_168:                              ;   in Loop: Header=BB5_171 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_170
; %bb.169:                              ;   in Loop: Header=BB5_171 Depth=1
	inc	__rc5
.LBB5_170:                              ;   in Loop: Header=BB5_171 Depth=1
	tax
	beq	.LBB5_176
.LBB5_171:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_173
; %bb.172:                              ;   in Loop: Header=BB5_171 Depth=1
	inc	__rc3
.LBB5_173:                              ;   in Loop: Header=BB5_171 Depth=1
	cmp	#64
	bcc	.LBB5_168
; %bb.174:                              ;   in Loop: Header=BB5_171 Depth=1
	cmp	#96
	bcs	.LBB5_165
; %bb.175:                              ;   in Loop: Header=BB5_171 Depth=1
	clc
	adc	#192
	bra	.LBB5_168
.LBB5_176:
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
.LBB5_177:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB5_177
; %bb.178:
	stz	54800
.LBB5_179:
	stz	mos8(BAMsector)
	ldx	#23
	stx	mos8(BAMsector+3)
	inx
	stx	mos8(worksector+1)
	stx	mos8(worksectorasBAM+1)
	inx
	stx	mos8(worksector+3)
	stx	mos8(worksectorasBAM+3)
	ldx	#22
	stx	mos8(BAMsector+1)
	stz	mos8(BAMsector+2)
	stz	mos8(worksector)
	stz	mos8(worksector+2)
	stz	mos8(worksectorasBAM)
	stz	mos8(worksectorasBAM+2)
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
	bra	.LBB5_186
.LBB5_180:                              ;   in Loop: Header=BB5_186 Depth=1
	cmp	#192
	bcc	.LBB5_182
; %bb.181:                              ;   in Loop: Header=BB5_186 Depth=1
	eor	#128
	bra	.LBB5_183
.LBB5_182:                              ;   in Loop: Header=BB5_186 Depth=1
	clc
	adc	#224
.LBB5_183:                              ;   in Loop: Header=BB5_186 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_185
; %bb.184:                              ;   in Loop: Header=BB5_186 Depth=1
	inc	__rc5
.LBB5_185:                              ;   in Loop: Header=BB5_186 Depth=1
	tax
	beq	.LBB5_191
.LBB5_186:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_188
; %bb.187:                              ;   in Loop: Header=BB5_186 Depth=1
	inc	__rc3
.LBB5_188:                              ;   in Loop: Header=BB5_186 Depth=1
	cmp	#64
	bcc	.LBB5_183
; %bb.189:                              ;   in Loop: Header=BB5_186 Depth=1
	cmp	#96
	bcs	.LBB5_180
; %bb.190:                              ;   in Loop: Header=BB5_186 Depth=1
	clc
	adc	#192
	bra	.LBB5_183
.LBB5_191:
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
	bra	.LBB5_198
.LBB5_192:                              ;   in Loop: Header=BB5_198 Depth=1
	cmp	#192
	bcc	.LBB5_194
; %bb.193:                              ;   in Loop: Header=BB5_198 Depth=1
	eor	#128
	bra	.LBB5_195
.LBB5_194:                              ;   in Loop: Header=BB5_198 Depth=1
	clc
	adc	#224
.LBB5_195:                              ;   in Loop: Header=BB5_198 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_197
; %bb.196:                              ;   in Loop: Header=BB5_198 Depth=1
	inc	__rc3
.LBB5_197:                              ;   in Loop: Header=BB5_198 Depth=1
	tax
	beq	.LBB5_203
.LBB5_198:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_200
; %bb.199:                              ;   in Loop: Header=BB5_198 Depth=1
	inc	__rc25
.LBB5_200:                              ;   in Loop: Header=BB5_198 Depth=1
	cmp	#64
	bcc	.LBB5_195
; %bb.201:                              ;   in Loop: Header=BB5_198 Depth=1
	cmp	#96
	bcs	.LBB5_192
; %bb.202:                              ;   in Loop: Header=BB5_198 Depth=1
	clc
	adc	#192
	bra	.LBB5_195
.LBB5_203:
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
	bra	.LBB5_210
.LBB5_204:                              ;   in Loop: Header=BB5_210 Depth=1
	cmp	#192
	bcc	.LBB5_206
; %bb.205:                              ;   in Loop: Header=BB5_210 Depth=1
	eor	#128
	bra	.LBB5_207
.LBB5_206:                              ;   in Loop: Header=BB5_210 Depth=1
	clc
	adc	#224
.LBB5_207:                              ;   in Loop: Header=BB5_210 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_209
; %bb.208:                              ;   in Loop: Header=BB5_210 Depth=1
	inc	__rc3
.LBB5_209:                              ;   in Loop: Header=BB5_210 Depth=1
	tax
	beq	.LBB5_215
.LBB5_210:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_212
; %bb.211:                              ;   in Loop: Header=BB5_210 Depth=1
	inc	__rc25
.LBB5_212:                              ;   in Loop: Header=BB5_210 Depth=1
	cmp	#64
	bcc	.LBB5_207
; %bb.213:                              ;   in Loop: Header=BB5_210 Depth=1
	cmp	#96
	bcs	.LBB5_204
; %bb.214:                              ;   in Loop: Header=BB5_210 Depth=1
	clc
	adc	#192
	bra	.LBB5_207
.LBB5_215:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
.LBB5_216:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB5_216
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
	bra	.LBB5_224
.LBB5_218:                              ;   in Loop: Header=BB5_224 Depth=1
	cmp	#192
	bcc	.LBB5_220
; %bb.219:                              ;   in Loop: Header=BB5_224 Depth=1
	eor	#128
	bra	.LBB5_221
.LBB5_220:                              ;   in Loop: Header=BB5_224 Depth=1
	clc
	adc	#224
.LBB5_221:                              ;   in Loop: Header=BB5_224 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_223
; %bb.222:                              ;   in Loop: Header=BB5_224 Depth=1
	inc	__rc3
.LBB5_223:                              ;   in Loop: Header=BB5_224 Depth=1
	tax
	beq	.LBB5_229
.LBB5_224:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_226
; %bb.225:                              ;   in Loop: Header=BB5_224 Depth=1
	inc	__rc25
.LBB5_226:                              ;   in Loop: Header=BB5_224 Depth=1
	cmp	#64
	bcc	.LBB5_221
; %bb.227:                              ;   in Loop: Header=BB5_224 Depth=1
	cmp	#96
	bcs	.LBB5_218
; %bb.228:                              ;   in Loop: Header=BB5_224 Depth=1
	clc
	adc	#192
	bra	.LBB5_221
.LBB5_229:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#1
	stx	mos8(datNextTrk)
	stx	mos8(i)
	stz	__rc23
; %bb.423:
	jmp	.LBB5_399
.LBB5_230:                              ;   in Loop: Header=BB5_236 Depth=2
	cmp	#192
	bcc	.LBB5_232
; %bb.231:                              ;   in Loop: Header=BB5_236 Depth=2
	eor	#128
	bra	.LBB5_233
.LBB5_232:                              ;   in Loop: Header=BB5_236 Depth=2
	clc
	adc	#224
.LBB5_233:                              ;   in Loop: Header=BB5_236 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_235
; %bb.234:                              ;   in Loop: Header=BB5_236 Depth=2
	inc	__rc3
.LBB5_235:                              ;   in Loop: Header=BB5_236 Depth=2
	tax
	beq	.LBB5_241
.LBB5_236:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_238
; %bb.237:                              ;   in Loop: Header=BB5_236 Depth=2
	inc	__rc25
.LBB5_238:                              ;   in Loop: Header=BB5_236 Depth=2
	cmp	#64
	bcc	.LBB5_233
; %bb.239:                              ;   in Loop: Header=BB5_236 Depth=2
	cmp	#96
	bcs	.LBB5_230
; %bb.240:                              ;   in Loop: Header=BB5_236 Depth=2
	clc
	adc	#192
	bra	.LBB5_233
.LBB5_241:                              ;   in Loop: Header=BB5_399 Depth=1
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
	ldy	#2
	lda	mos8(datNextTrk)
	and	#1
	bne	.LBB5_243
; %bb.242:                              ;   in Loop: Header=BB5_399 Depth=1
	ldy	#0
.LBB5_243:                              ;   in Loop: Header=BB5_399 Depth=1
	ldx	#mos16lo(.L.str.34)
	stx	__rc24
	ldx	#mos16hi(.L.str.34)
	stx	__rc25
	ldx	mos8(datNextSec)
	tya
	jsr	GetWholeSector
	sta	mos8(workside)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB5_250
.LBB5_244:                              ;   in Loop: Header=BB5_250 Depth=2
	cmp	#192
	bcc	.LBB5_246
; %bb.245:                              ;   in Loop: Header=BB5_250 Depth=2
	eor	#128
	bra	.LBB5_247
.LBB5_246:                              ;   in Loop: Header=BB5_250 Depth=2
	clc
	adc	#224
.LBB5_247:                              ;   in Loop: Header=BB5_250 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_249
; %bb.248:                              ;   in Loop: Header=BB5_250 Depth=2
	inc	__rc3
.LBB5_249:                              ;   in Loop: Header=BB5_250 Depth=2
	tax
	beq	.LBB5_255
.LBB5_250:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_252
; %bb.251:                              ;   in Loop: Header=BB5_250 Depth=2
	inc	__rc25
.LBB5_252:                              ;   in Loop: Header=BB5_250 Depth=2
	cmp	#64
	bcc	.LBB5_247
; %bb.253:                              ;   in Loop: Header=BB5_250 Depth=2
	cmp	#96
	bcs	.LBB5_244
; %bb.254:                              ;   in Loop: Header=BB5_250 Depth=2
	clc
	adc	#192
	bra	.LBB5_247
.LBB5_255:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bne	.LBB5_257
; %bb.256:                              ;   in Loop: Header=BB5_399 Depth=1
	stz	__rc2
	lda	#0
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB5_257:                              ;   in Loop: Header=BB5_399 Depth=1
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
.LBB5_258:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB5_258
; %bb.259:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bne	.LBB5_261
; %bb.260:                              ;   in Loop: Header=BB5_399 Depth=1
	ldy	#255
.LBB5_261:                              ;   in Loop: Header=BB5_399 Depth=1
	ldx	#6
	stz	__rc24
	cmp	#8
	bcs	.LBB5_263
; %bb.262:                              ;   in Loop: Header=BB5_399 Depth=1
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
; %bb.425:                              ;   in Loop: Header=BB5_399 Depth=1
	jmp	.LBB5_270
.LBB5_263:                              ;   in Loop: Header=BB5_399 Depth=1
	cmp	#16
	bcs	.LBB5_265
; %bb.264:                              ;   in Loop: Header=BB5_399 Depth=1
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
; %bb.427:                              ;   in Loop: Header=BB5_399 Depth=1
	jmp	.LBB5_270
.LBB5_265:                              ;   in Loop: Header=BB5_399 Depth=1
	cmp	#24
	bcs	.LBB5_267
; %bb.266:                              ;   in Loop: Header=BB5_399 Depth=1
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
; %bb.429:                              ;   in Loop: Header=BB5_399 Depth=1
	jmp	.LBB5_270
.LBB5_267:                              ;   in Loop: Header=BB5_399 Depth=1
	cmp	#32
	bcs	.LBB5_269
; %bb.268:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bra	.LBB5_270
.LBB5_269:                              ;   in Loop: Header=BB5_399 Depth=1
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
.LBB5_270:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bra	.LBB5_277
.LBB5_271:                              ;   in Loop: Header=BB5_277 Depth=2
	cmp	#192
	bcc	.LBB5_273
; %bb.272:                              ;   in Loop: Header=BB5_277 Depth=2
	eor	#128
	bra	.LBB5_274
.LBB5_273:                              ;   in Loop: Header=BB5_277 Depth=2
	clc
	adc	#224
.LBB5_274:                              ;   in Loop: Header=BB5_277 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_276
; %bb.275:                              ;   in Loop: Header=BB5_277 Depth=2
	inc	__rc3
.LBB5_276:                              ;   in Loop: Header=BB5_277 Depth=2
	tax
	beq	.LBB5_282
.LBB5_277:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc26)
	inc	__rc26
	bne	.LBB5_279
; %bb.278:                              ;   in Loop: Header=BB5_277 Depth=2
	inc	__rc27
.LBB5_279:                              ;   in Loop: Header=BB5_277 Depth=2
	cmp	#64
	bcc	.LBB5_274
; %bb.280:                              ;   in Loop: Header=BB5_277 Depth=2
	cmp	#96
	bcs	.LBB5_271
; %bb.281:                              ;   in Loop: Header=BB5_277 Depth=2
	clc
	adc	#192
	bra	.LBB5_274
.LBB5_282:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bra	.LBB5_289
.LBB5_283:                              ;   in Loop: Header=BB5_289 Depth=2
	cmp	#192
	bcc	.LBB5_285
; %bb.284:                              ;   in Loop: Header=BB5_289 Depth=2
	eor	#128
	bra	.LBB5_286
.LBB5_285:                              ;   in Loop: Header=BB5_289 Depth=2
	clc
	adc	#224
.LBB5_286:                              ;   in Loop: Header=BB5_289 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_288
; %bb.287:                              ;   in Loop: Header=BB5_289 Depth=2
	inc	__rc3
.LBB5_288:                              ;   in Loop: Header=BB5_289 Depth=2
	tax
	beq	.LBB5_294
.LBB5_289:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_291
; %bb.290:                              ;   in Loop: Header=BB5_289 Depth=2
	inc	__rc25
.LBB5_291:                              ;   in Loop: Header=BB5_289 Depth=2
	cmp	#64
	bcc	.LBB5_286
; %bb.292:                              ;   in Loop: Header=BB5_289 Depth=2
	cmp	#96
	bcs	.LBB5_283
; %bb.293:                              ;   in Loop: Header=BB5_289 Depth=2
	clc
	adc	#192
	bra	.LBB5_286
.LBB5_294:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bra	.LBB5_301
.LBB5_295:                              ;   in Loop: Header=BB5_301 Depth=2
	cmp	#192
	bcc	.LBB5_297
; %bb.296:                              ;   in Loop: Header=BB5_301 Depth=2
	eor	#128
	bra	.LBB5_298
.LBB5_297:                              ;   in Loop: Header=BB5_301 Depth=2
	clc
	adc	#224
.LBB5_298:                              ;   in Loop: Header=BB5_301 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_300
; %bb.299:                              ;   in Loop: Header=BB5_301 Depth=2
	inc	__rc3
.LBB5_300:                              ;   in Loop: Header=BB5_301 Depth=2
	tax
	beq	.LBB5_306
.LBB5_301:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_303
; %bb.302:                              ;   in Loop: Header=BB5_301 Depth=2
	inc	__rc25
.LBB5_303:                              ;   in Loop: Header=BB5_301 Depth=2
	cmp	#64
	bcc	.LBB5_298
; %bb.304:                              ;   in Loop: Header=BB5_301 Depth=2
	cmp	#96
	bcs	.LBB5_295
; %bb.305:                              ;   in Loop: Header=BB5_301 Depth=2
	clc
	adc	#192
	bra	.LBB5_298
.LBB5_306:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bra	.LBB5_313
.LBB5_307:                              ;   in Loop: Header=BB5_313 Depth=2
	cmp	#192
	bcc	.LBB5_309
; %bb.308:                              ;   in Loop: Header=BB5_313 Depth=2
	eor	#128
	bra	.LBB5_310
.LBB5_309:                              ;   in Loop: Header=BB5_313 Depth=2
	clc
	adc	#224
.LBB5_310:                              ;   in Loop: Header=BB5_313 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_312
; %bb.311:                              ;   in Loop: Header=BB5_313 Depth=2
	inc	__rc3
.LBB5_312:                              ;   in Loop: Header=BB5_313 Depth=2
	tax
	beq	.LBB5_318
.LBB5_313:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_315
; %bb.314:                              ;   in Loop: Header=BB5_313 Depth=2
	inc	__rc25
.LBB5_315:                              ;   in Loop: Header=BB5_313 Depth=2
	cmp	#64
	bcc	.LBB5_310
; %bb.316:                              ;   in Loop: Header=BB5_313 Depth=2
	cmp	#96
	bcs	.LBB5_307
; %bb.317:                              ;   in Loop: Header=BB5_313 Depth=2
	clc
	adc	#192
	bra	.LBB5_310
.LBB5_318:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bra	.LBB5_325
.LBB5_319:                              ;   in Loop: Header=BB5_325 Depth=2
	cmp	#192
	bcc	.LBB5_321
; %bb.320:                              ;   in Loop: Header=BB5_325 Depth=2
	eor	#128
	bra	.LBB5_322
.LBB5_321:                              ;   in Loop: Header=BB5_325 Depth=2
	clc
	adc	#224
.LBB5_322:                              ;   in Loop: Header=BB5_325 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_324
; %bb.323:                              ;   in Loop: Header=BB5_325 Depth=2
	inc	__rc3
.LBB5_324:                              ;   in Loop: Header=BB5_325 Depth=2
	tax
	beq	.LBB5_330
.LBB5_325:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_327
; %bb.326:                              ;   in Loop: Header=BB5_325 Depth=2
	inc	__rc25
.LBB5_327:                              ;   in Loop: Header=BB5_325 Depth=2
	cmp	#64
	bcc	.LBB5_322
; %bb.328:                              ;   in Loop: Header=BB5_325 Depth=2
	cmp	#96
	bcs	.LBB5_319
; %bb.329:                              ;   in Loop: Header=BB5_325 Depth=2
	clc
	adc	#192
	bra	.LBB5_322
.LBB5_330:                              ;   in Loop: Header=BB5_399 Depth=1
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
.LBB5_331:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB5_331
; %bb.332:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bra	.LBB5_339
.LBB5_333:                              ;   in Loop: Header=BB5_339 Depth=2
	cmp	#192
	bcc	.LBB5_335
; %bb.334:                              ;   in Loop: Header=BB5_339 Depth=2
	eor	#128
	bra	.LBB5_336
.LBB5_335:                              ;   in Loop: Header=BB5_339 Depth=2
	clc
	adc	#224
.LBB5_336:                              ;   in Loop: Header=BB5_339 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_338
; %bb.337:                              ;   in Loop: Header=BB5_339 Depth=2
	inc	__rc5
.LBB5_338:                              ;   in Loop: Header=BB5_339 Depth=2
	tax
	beq	.LBB5_344
.LBB5_339:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_341
; %bb.340:                              ;   in Loop: Header=BB5_339 Depth=2
	inc	__rc3
.LBB5_341:                              ;   in Loop: Header=BB5_339 Depth=2
	cmp	#64
	bcc	.LBB5_336
; %bb.342:                              ;   in Loop: Header=BB5_339 Depth=2
	cmp	#96
	bcs	.LBB5_333
; %bb.343:                              ;   in Loop: Header=BB5_339 Depth=2
	clc
	adc	#192
	bra	.LBB5_336
.LBB5_344:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bra	.LBB5_351
.LBB5_345:                              ;   in Loop: Header=BB5_351 Depth=2
	cmp	#192
	bcc	.LBB5_347
; %bb.346:                              ;   in Loop: Header=BB5_351 Depth=2
	eor	#128
	bra	.LBB5_348
.LBB5_347:                              ;   in Loop: Header=BB5_351 Depth=2
	clc
	adc	#224
.LBB5_348:                              ;   in Loop: Header=BB5_351 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_350
; %bb.349:                              ;   in Loop: Header=BB5_351 Depth=2
	inc	__rc3
.LBB5_350:                              ;   in Loop: Header=BB5_351 Depth=2
	tax
	beq	.LBB5_356
.LBB5_351:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_353
; %bb.352:                              ;   in Loop: Header=BB5_351 Depth=2
	inc	__rc25
.LBB5_353:                              ;   in Loop: Header=BB5_351 Depth=2
	cmp	#64
	bcc	.LBB5_348
; %bb.354:                              ;   in Loop: Header=BB5_351 Depth=2
	cmp	#96
	bcs	.LBB5_345
; %bb.355:                              ;   in Loop: Header=BB5_351 Depth=2
	clc
	adc	#192
	bra	.LBB5_348
.LBB5_356:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bra	.LBB5_363
.LBB5_357:                              ;   in Loop: Header=BB5_363 Depth=2
	cmp	#192
	bcc	.LBB5_359
; %bb.358:                              ;   in Loop: Header=BB5_363 Depth=2
	eor	#128
	bra	.LBB5_360
.LBB5_359:                              ;   in Loop: Header=BB5_363 Depth=2
	clc
	adc	#224
.LBB5_360:                              ;   in Loop: Header=BB5_363 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_362
; %bb.361:                              ;   in Loop: Header=BB5_363 Depth=2
	inc	__rc3
.LBB5_362:                              ;   in Loop: Header=BB5_363 Depth=2
	tax
	beq	.LBB5_368
.LBB5_363:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_365
; %bb.364:                              ;   in Loop: Header=BB5_363 Depth=2
	inc	__rc25
.LBB5_365:                              ;   in Loop: Header=BB5_363 Depth=2
	cmp	#64
	bcc	.LBB5_360
; %bb.366:                              ;   in Loop: Header=BB5_363 Depth=2
	cmp	#96
	bcs	.LBB5_357
; %bb.367:                              ;   in Loop: Header=BB5_363 Depth=2
	clc
	adc	#192
	bra	.LBB5_360
.LBB5_368:                              ;   in Loop: Header=BB5_399 Depth=1
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
	bra	.LBB5_375
.LBB5_369:                              ;   in Loop: Header=BB5_375 Depth=2
	cmp	#192
	bcc	.LBB5_371
; %bb.370:                              ;   in Loop: Header=BB5_375 Depth=2
	eor	#128
	bra	.LBB5_372
.LBB5_371:                              ;   in Loop: Header=BB5_375 Depth=2
	clc
	adc	#224
.LBB5_372:                              ;   in Loop: Header=BB5_375 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_374
; %bb.373:                              ;   in Loop: Header=BB5_375 Depth=2
	inc	__rc3
.LBB5_374:                              ;   in Loop: Header=BB5_375 Depth=2
	tax
	beq	.LBB5_380
.LBB5_375:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_377
; %bb.376:                              ;   in Loop: Header=BB5_375 Depth=2
	inc	__rc25
.LBB5_377:                              ;   in Loop: Header=BB5_375 Depth=2
	cmp	#64
	bcc	.LBB5_372
; %bb.378:                              ;   in Loop: Header=BB5_375 Depth=2
	cmp	#96
	bcs	.LBB5_369
; %bb.379:                              ;   in Loop: Header=BB5_375 Depth=2
	clc
	adc	#192
	bra	.LBB5_372
.LBB5_380:                              ;   in Loop: Header=BB5_399 Depth=1
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
.LBB5_381:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB5_381
; %bb.382:                              ;   in Loop: Header=BB5_399 Depth=1
	stz	54800
	ldx	mos8(workside)
	stx	__rc6
	stx	__rc2
	asl	__rc2
	stz	__rc3
	rol	__rc3
	lda	#mos8(worksectorasBAM)
	clc
	adc	__rc2
	sta	__rc4
	lda	#mos8(0)
	adc	__rc3
	ldx	#2
	sta	__rc5
	lda	(__rc4)
	sta	__rc2
	ldy	#1
	lda	(__rc4),y
	sta	__rc3
	lda	mos8(datNextTrk)
	and	#1
	bne	.LBB5_384
; %bb.383:                              ;   in Loop: Header=BB5_399 Depth=1
	ldx	#0
.LBB5_384:                              ;   in Loop: Header=BB5_399 Depth=1
	ldy	#mos16lo(.L.str.42)
	sty	__rc24
	ldy	#mos16hi(.L.str.42)
	sty	__rc25
	ldy	mos8(datNextSec)
	sty	__rc4
	lda	__rc6
	jsr	PutWholeSector
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB5_391
.LBB5_385:                              ;   in Loop: Header=BB5_391 Depth=2
	cmp	#192
	bcc	.LBB5_387
; %bb.386:                              ;   in Loop: Header=BB5_391 Depth=2
	eor	#128
	bra	.LBB5_388
.LBB5_387:                              ;   in Loop: Header=BB5_391 Depth=2
	clc
	adc	#224
.LBB5_388:                              ;   in Loop: Header=BB5_391 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB5_390
; %bb.389:                              ;   in Loop: Header=BB5_391 Depth=2
	inc	__rc3
.LBB5_390:                              ;   in Loop: Header=BB5_391 Depth=2
	tax
	beq	.LBB5_396
.LBB5_391:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc24)
	inc	__rc24
	bne	.LBB5_393
; %bb.392:                              ;   in Loop: Header=BB5_391 Depth=2
	inc	__rc25
.LBB5_393:                              ;   in Loop: Header=BB5_391 Depth=2
	cmp	#64
	bcc	.LBB5_388
; %bb.394:                              ;   in Loop: Header=BB5_391 Depth=2
	cmp	#96
	bcs	.LBB5_385
; %bb.395:                              ;   in Loop: Header=BB5_391 Depth=2
	clc
	adc	#192
	bra	.LBB5_388
.LBB5_396:                              ;   in Loop: Header=BB5_399 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB5_397:                              ;   Parent Loop BB5_399 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB5_397
; %bb.398:                              ;   in Loop: Header=BB5_399 Depth=1
	stz	54800
	ldx	mos8(i)
	inx
	inc	mos8(i)
	cpx	#38
	bcs	.LBB5_400
.LBB5_399:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_236 Depth 2
                                        ;     Child Loop BB5_250 Depth 2
                                        ;     Child Loop BB5_258 Depth 2
                                        ;     Child Loop BB5_277 Depth 2
                                        ;     Child Loop BB5_289 Depth 2
                                        ;     Child Loop BB5_301 Depth 2
                                        ;     Child Loop BB5_313 Depth 2
                                        ;     Child Loop BB5_325 Depth 2
                                        ;     Child Loop BB5_331 Depth 2
                                        ;     Child Loop BB5_339 Depth 2
                                        ;     Child Loop BB5_351 Depth 2
                                        ;     Child Loop BB5_363 Depth 2
                                        ;     Child Loop BB5_375 Depth 2
                                        ;     Child Loop BB5_381 Depth 2
                                        ;     Child Loop BB5_391 Depth 2
                                        ;     Child Loop BB5_397 Depth 2
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
; %bb.431:                              ;   in Loop: Header=BB5_399 Depth=1
	jmp	.LBB5_236
.LBB5_400:
	ldx	mos8(BAMside)
	lda	#0
	stx	__rc2
	stx	__rc6
	asl	__rc2
	rol
	clc
	sta	__rc3
	lda	#mos8(BAMsector)
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
	ldx	#40
	sty	__rc4
	lda	__rc6
	jsr	PutWholeSector
	ldy	#2
	lda	mos8(datNextTrk)
	and	#1
	bne	.LBB5_402
; %bb.401:
	ldy	#0
.LBB5_402:
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
.LBB5_403:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB5_403
; %bb.404:
	ldx	#mos16lo(.L.str.62)
	stx	__rc2
	ldx	#mos16hi(.L.str.62)
	stx	__rc3
	stz	54800
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB5_411
.LBB5_405:                              ;   in Loop: Header=BB5_411 Depth=1
	cmp	#192
	bcc	.LBB5_407
; %bb.406:                              ;   in Loop: Header=BB5_411 Depth=1
	eor	#128
	bra	.LBB5_408
.LBB5_407:                              ;   in Loop: Header=BB5_411 Depth=1
	clc
	adc	#224
.LBB5_408:                              ;   in Loop: Header=BB5_411 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB5_410
; %bb.409:                              ;   in Loop: Header=BB5_411 Depth=1
	inc	__rc5
.LBB5_410:                              ;   in Loop: Header=BB5_411 Depth=1
	tax
	beq	.LBB5_416
.LBB5_411:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB5_413
; %bb.412:                              ;   in Loop: Header=BB5_411 Depth=1
	inc	__rc3
.LBB5_413:                              ;   in Loop: Header=BB5_411 Depth=1
	cmp	#64
	bcc	.LBB5_408
; %bb.414:                              ;   in Loop: Header=BB5_411 Depth=1
	cmp	#96
	bcs	.LBB5_405
; %bb.415:                              ;   in Loop: Header=BB5_411 Depth=1
	clc
	adc	#192
	bra	.LBB5_408
.LBB5_416:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB5_417:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB5_417
; %bb.418:
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
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end6:
	.size	escNOP, .Lfunc_end6-escNOP
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
.Lfunc_end7:
	.size	clrscr, .Lfunc_end7-clrscr
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
	bne	.LBB8_2
; %bb.1:
	dec	__rc20
.LBB8_2:
	lda	__rc20
	bne	.LBB8_5
; %bb.3:
	ldy	__rc23
	cpx	__rc22
	bne	.LBB8_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB8_7
.LBB8_5:
	ldy	__rc23
.LBB8_6:
	ldx	__rc22
	inx
.LBB8_7:
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
.Lfunc_end8:
	.size	cputcxy, .Lfunc_end8-cputcxy
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
.Lfunc_end9:
	.size	cputhex, .Lfunc_end9-cputhex
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
.Lfunc_end10:
	.size	cputsxy, .Lfunc_end10-cputsxy
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
	bcs	.LBB11_2
; %bb.1:
	clv
.LBB11_2:
	ror	__rc3
	ldy	__rc2
	sty	__rc12
	ror	__rc12
	lsr	__rc8
	ror
	ldy	#1
	bcs	.LBB11_4
; %bb.3:
	ldy	#0
.LBB11_4:
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	phy
	ldy	#1
	bcs	.LBB11_6
; %bb.5:
	ldy	#0
.LBB11_6:
	sty	__rc13
	ply
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	lda	#1
	bcs	.LBB11_8
; %bb.7:
	lda	#0
.LBB11_8:
	sta	__rc8
	ror	__rc3
	lda	__rc12
	ror
	sta	__rc3
	sec
	bvs	.LBB11_10
; %bb.9:
	clc
.LBB11_10:
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
.Lfunc_end11:
	.size	lcopy, .Lfunc_end11-lcopy
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
.Lfunc_end12:
	.size	lfill, .Lfunc_end12-lfill
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB13_2
; %bb.1:
	tya
	beq	.LBB13_11
.LBB13_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB13_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB13_5
; %bb.4:                                ;   in Loop: Header=BB13_3 Depth=1
	inc	__rc7
.LBB13_5:                               ;   in Loop: Header=BB13_3 Depth=1
	inc	__rc4
	bne	.LBB13_7
; %bb.6:                                ;   in Loop: Header=BB13_3 Depth=1
	inc	__rc5
.LBB13_7:                               ;   in Loop: Header=BB13_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB13_9
; %bb.8:                                ;   in Loop: Header=BB13_3 Depth=1
	dex
.LBB13_9:                               ;   in Loop: Header=BB13_3 Depth=1
	txa
	bne	.LBB13_3
; %bb.10:                               ;   in Loop: Header=BB13_3 Depth=1
	tya
	bne	.LBB13_3
.LBB13_11:
	rts
.Lfunc_end13:
	.size	memcpy, .Lfunc_end13-memcpy
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
.Lfunc_end14:
	.size	memset, .Lfunc_end14-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB15_4
.LBB15_1:                               ;   in Loop: Header=BB15_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB15_3
; %bb.2:                                ;   in Loop: Header=BB15_4 Depth=1
	inc	__rc3
.LBB15_3:                               ;   in Loop: Header=BB15_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB15_7
.LBB15_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB15_1
; %bb.5:                                ;   in Loop: Header=BB15_4 Depth=1
	cpx	#0
	bne	.LBB15_1
; %bb.6:
	rts
.LBB15_7:                               ;   in Loop: Header=BB15_4 Depth=1
	dec	__rc4
	jmp	.LBB15_4
.Lfunc_end15:
	.size	__memset, .Lfunc_end15-__memset
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
	beq	.LBB16_1
; %bb.15:
	jmp	.LBB16_13
.LBB16_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB16_2
; %bb.17:
	jmp	.LBB16_14
.LBB16_2:
	lda	__rc7
	bne	.LBB16_4
; %bb.3:
	lda	__rc6
	beq	.LBB16_12
.LBB16_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB16_6
; %bb.5:                                ;   in Loop: Header=BB16_4 Depth=1
	dec	__rc9
.LBB16_6:                               ;   in Loop: Header=BB16_4 Depth=1
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
	bne	.LBB16_8
; %bb.7:                                ;   in Loop: Header=BB16_4 Depth=1
	dec	__rc11
.LBB16_8:                               ;   in Loop: Header=BB16_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB16_10
; %bb.9:                                ;   in Loop: Header=BB16_4 Depth=1
	dex
.LBB16_10:                              ;   in Loop: Header=BB16_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB16_4
; %bb.11:                               ;   in Loop: Header=BB16_4 Depth=1
	tya
	bne	.LBB16_4
.LBB16_12:
	rts
.LBB16_13:
	cpx	__rc3
	bcs	.LBB16_14
; %bb.19:
	jmp	.LBB16_2
.LBB16_14:
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
.Lfunc_end16:
	.size	memmove, .Lfunc_end16-memmove
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB17_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB17_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB17_4
; %bb.3:                                ;   in Loop: Header=BB17_2 Depth=1
	inx
.LBB17_4:                               ;   in Loop: Header=BB17_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB17_2
	bra	.LBB17_6
.LBB17_5:
	stz	__rc4
	ldx	#0
.LBB17_6:
	lda	__rc4
	rts
.Lfunc_end17:
	.size	strlen, .Lfunc_end17-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB18_2
.LBB18_1:                               ;   in Loop: Header=BB18_2 Depth=1
	dex
	asl
.LBB18_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB18_1
; %bb.3:
	rts
.Lfunc_end18:
	.size	__ashlqi3, .Lfunc_end18-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB19_3
; %bb.1:
	ldx	__rc2
.LBB19_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB19_2
.LBB19_3:
	ldx	__rc3
	rts
.Lfunc_end19:
	.size	__ashlhi3, .Lfunc_end19-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB20_3
; %bb.1:
	ldx	__rc4
.LBB20_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB20_2
.LBB20_3:
	ldx	__rc5
	rts
.Lfunc_end20:
	.size	__ashlsi3, .Lfunc_end20-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB21_3
; %bb.1:
	ldx	__rc8
.LBB21_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB21_2
.LBB21_3:
	ldx	__rc9
	rts
.Lfunc_end21:
	.size	__ashldi3, .Lfunc_end21-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB22_2
.LBB22_1:                               ;   in Loop: Header=BB22_2 Depth=1
	dex
	lsr
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB22_1
; %bb.3:
	rts
.Lfunc_end22:
	.size	__lshrqi3, .Lfunc_end22-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB23_3
; %bb.1:
	ldx	__rc2
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB23_2
.LBB23_3:
	ldx	__rc3
	rts
.Lfunc_end23:
	.size	__lshrhi3, .Lfunc_end23-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB24_3
; %bb.1:
	ldx	__rc4
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB24_2
.LBB24_3:
	ldx	__rc5
	rts
.Lfunc_end24:
	.size	__lshrsi3, .Lfunc_end24-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB25_3
; %bb.1:
	ldx	__rc8
.LBB25_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB25_2
.LBB25_3:
	ldx	__rc9
	rts
.Lfunc_end25:
	.size	__lshrdi3, .Lfunc_end25-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB26_2
.LBB26_1:                               ;   in Loop: Header=BB26_2 Depth=1
	dex
	cmp	#128
	ror
.LBB26_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB26_1
; %bb.3:
	rts
.Lfunc_end26:
	.size	__ashrqi3, .Lfunc_end26-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
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
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB27_2
.LBB27_3:
	tax
	lda	__rc3
	rts
.Lfunc_end27:
	.size	__ashrhi3, .Lfunc_end27-__ashrhi3
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
	beq	.LBB28_3
; %bb.1:
	ldx	__rc4
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB28_2
.LBB28_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end28:
	.size	__ashrsi3, .Lfunc_end28-__ashrsi3
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
	beq	.LBB29_3
; %bb.1:
	ldx	__rc8
.LBB29_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB29_2
.LBB29_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end29:
	.size	__ashrdi3, .Lfunc_end29-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB30_2
.LBB30_1:                               ;   in Loop: Header=BB30_2 Depth=1
	dex
	cmp	#128
	rol
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB30_1
; %bb.3:
	rts
.Lfunc_end30:
	.size	__rotlqi3, .Lfunc_end30-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB31_3
; %bb.1:
	ldx	__rc2
.LBB31_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB31_2
.LBB31_3:
	tax
	lda	__rc3
	rts
.Lfunc_end31:
	.size	__rotlhi3, .Lfunc_end31-__rotlhi3
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
	beq	.LBB32_3
; %bb.1:
	ldx	__rc4
.LBB32_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB32_2
.LBB32_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end32:
	.size	__rotlsi3, .Lfunc_end32-__rotlsi3
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
	beq	.LBB33_3
; %bb.1:
	ldx	__rc8
.LBB33_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB33_2
.LBB33_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end33:
	.size	__rotldi3, .Lfunc_end33-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB34_2
.LBB34_1:                               ;   in Loop: Header=BB34_2 Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror
.LBB34_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB34_1
; %bb.3:
	rts
.Lfunc_end34:
	.size	__rotrqi3, .Lfunc_end34-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB35_3
; %bb.1:
	ldx	__rc2
.LBB35_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB35_2
.LBB35_3:
	ldx	__rc3
	rts
.Lfunc_end35:
	.size	__rotrhi3, .Lfunc_end35-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB36_3
; %bb.1:
	ldx	__rc4
.LBB36_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB36_2
.LBB36_3:
	ldx	__rc5
	rts
.Lfunc_end36:
	.size	__rotrsi3, .Lfunc_end36-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB37_3
; %bb.1:
	ldx	__rc8
.LBB37_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB37_2
.LBB37_3:
	ldx	__rc9
	rts
.Lfunc_end37:
	.size	__rotrdi3, .Lfunc_end37-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB38_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB38_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB38_4
; %bb.3:                                ;   in Loop: Header=BB38_2 Depth=1
	clc
	adc	__rc2
.LBB38_4:                               ;   in Loop: Header=BB38_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB38_2
; %bb.5:
	rts
.LBB38_6:
	lda	#0
	rts
.Lfunc_end38:
	.size	__mulqi3, .Lfunc_end38-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB39_2
; %bb.1:
	ldy	__rc2
	beq	.LBB39_7
.LBB39_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB39_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB39_5
; %bb.4:                                ;   in Loop: Header=BB39_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB39_5:                               ;   in Loop: Header=BB39_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB39_3
; %bb.6:                                ;   in Loop: Header=BB39_3 Depth=1
	ldx	__rc2
	bne	.LBB39_3
	bra	.LBB39_8
.LBB39_7:
	ldy	#0
	tya
.LBB39_8:
	tax
	tya
	rts
.Lfunc_end39:
	.size	__mulhi3, .Lfunc_end39-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
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
	bne	.LBB40_4
; %bb.13:
	jmp	.LBB40_12
.LBB40_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB40_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB40_7
; %bb.6:                                ;   in Loop: Header=BB40_5 Depth=1
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
.LBB40_7:                               ;   in Loop: Header=BB40_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB40_5
; %bb.8:                                ;   in Loop: Header=BB40_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB40_5
; %bb.9:                                ;   in Loop: Header=BB40_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB40_5
; %bb.10:                               ;   in Loop: Header=BB40_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB40_5
.LBB40_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB40_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB40_11
.Lfunc_end40:
	.size	__mulsi3, .Lfunc_end40-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB41_8
; %bb.1:
	ldy	__rc14
	bne	.LBB41_8
; %bb.2:
	ldy	__rc13
	bne	.LBB41_8
; %bb.3:
	ldy	__rc12
	bne	.LBB41_8
; %bb.4:
	ldy	__rc11
	bne	.LBB41_8
; %bb.5:
	ldy	__rc10
	bne	.LBB41_8
; %bb.6:
	ldy	__rc9
	bne	.LBB41_8
; %bb.7:
	ldy	__rc8
	bne	.LBB41_8
; %bb.21:
	jmp	.LBB41_20
.LBB41_8:
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
.LBB41_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB41_11
; %bb.10:                               ;   in Loop: Header=BB41_9 Depth=1
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
.LBB41_11:                              ;   in Loop: Header=BB41_9 Depth=1
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
	beq	.LBB41_12
; %bb.23:                               ;   in Loop: Header=BB41_9 Depth=1
	jmp	.LBB41_9
.LBB41_12:                              ;   in Loop: Header=BB41_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB41_13
; %bb.25:                               ;   in Loop: Header=BB41_9 Depth=1
	jmp	.LBB41_9
.LBB41_13:                              ;   in Loop: Header=BB41_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB41_14
; %bb.27:                               ;   in Loop: Header=BB41_9 Depth=1
	jmp	.LBB41_9
.LBB41_14:                              ;   in Loop: Header=BB41_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB41_15
; %bb.29:                               ;   in Loop: Header=BB41_9 Depth=1
	jmp	.LBB41_9
.LBB41_15:                              ;   in Loop: Header=BB41_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB41_16
; %bb.31:                               ;   in Loop: Header=BB41_9 Depth=1
	jmp	.LBB41_9
.LBB41_16:                              ;   in Loop: Header=BB41_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB41_17
; %bb.33:                               ;   in Loop: Header=BB41_9 Depth=1
	jmp	.LBB41_9
.LBB41_17:                              ;   in Loop: Header=BB41_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB41_18
; %bb.35:                               ;   in Loop: Header=BB41_9 Depth=1
	jmp	.LBB41_9
.LBB41_18:                              ;   in Loop: Header=BB41_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB41_19
; %bb.37:                               ;   in Loop: Header=BB41_9 Depth=1
	jmp	.LBB41_9
.LBB41_19:
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
.LBB41_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB41_19
.Lfunc_end41:
	.size	__muldi3, .Lfunc_end41-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB42_1
; %bb.15:
	jmp	.LBB42_14
.LBB42_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB42_2
; %bb.17:
	jmp	.LBB42_14
.LBB42_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB42_3
; %bb.19:
	jmp	.LBB42_14
.LBB42_3:
	sty	__rc5
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
	lda	__rc5
	cmp	__rc2
	lda	#1
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
	cpx	#0
	beq	.LBB42_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB42_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB42_13
; %bb.12:                               ;   in Loop: Header=BB42_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB42_13:                              ;   in Loop: Header=BB42_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB42_11
.LBB42_14:
	rts
.Lfunc_end42:
	.size	__udivqi3, .Lfunc_end42-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB43_2
; %bb.1:
	ldy	__rc2
	beq	.LBB43_4
.LBB43_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB43_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB43_6
.LBB43_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB43_22
.LBB43_5:
	cmp	__rc3
	bcc	.LBB43_4
.LBB43_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB43_7
; %bb.25:
	jmp	.LBB43_22
.LBB43_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB43_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB43_10
; %bb.9:                                ;   in Loop: Header=BB43_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB43_12
	bra	.LBB43_11
.LBB43_10:                              ;   in Loop: Header=BB43_8 Depth=1
	cmp	__rc6
	bcc	.LBB43_12
.LBB43_11:                              ;   in Loop: Header=BB43_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB43_8
	bra	.LBB43_13
.LBB43_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB43_13:
	cpx	#0
	bne	.LBB43_14
; %bb.27:
	jmp	.LBB43_22
.LBB43_14:
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
.LBB43_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB43_17
; %bb.16:                               ;   in Loop: Header=BB43_15 Depth=1
	ldy	#0
.LBB43_17:                              ;   in Loop: Header=BB43_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB43_21
; %bb.18:                               ;   in Loop: Header=BB43_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB43_20
.LBB43_19:                              ;   in Loop: Header=BB43_15 Depth=1
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
.LBB43_20:                              ;   in Loop: Header=BB43_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB43_15
	bra	.LBB43_22
.LBB43_21:                              ;   in Loop: Header=BB43_15 Depth=1
	cmp	__rc6
	bcs	.LBB43_19
	bra	.LBB43_20
.LBB43_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end43:
	.size	__udivhi3, .Lfunc_end43-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
	ldy	__rc7
	bne	.LBB44_4
; %bb.1:
	ldy	__rc6
	bne	.LBB44_4
; %bb.2:
	ldy	__rc5
	bne	.LBB44_4
; %bb.3:
	ldy	__rc4
	beq	.LBB44_9
.LBB44_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB44_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB44_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB44_7
; %bb.45:
	jmp	.LBB44_38
.LBB44_7:
	cmp	__rc4
	bcc	.LBB44_9
	bra	.LBB44_11
.LBB44_8:
	cpx	__rc7
	bcs	.LBB44_11
.LBB44_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB44_21
.LBB44_10:
	cpx	__rc6
	bcc	.LBB44_9
.LBB44_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB44_12
; %bb.47:
	jmp	.LBB44_21
.LBB44_12:
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
.LBB44_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB44_17
; %bb.14:                               ;   in Loop: Header=BB44_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB44_18
; %bb.15:                               ;   in Loop: Header=BB44_13 Depth=1
	cmp	__rc10
	bne	.LBB44_19
; %bb.16:                               ;   in Loop: Header=BB44_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB44_23
	bra	.LBB44_20
.LBB44_17:                              ;   in Loop: Header=BB44_13 Depth=1
	cpy	__rc12
	bcc	.LBB44_23
	bra	.LBB44_20
.LBB44_18:                              ;   in Loop: Header=BB44_13 Depth=1
	cpy	__rc11
	bcc	.LBB44_23
	bra	.LBB44_20
.LBB44_19:                              ;   in Loop: Header=BB44_13 Depth=1
	cmp	__rc10
	bcc	.LBB44_23
.LBB44_20:                              ;   in Loop: Header=BB44_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB44_13
	bra	.LBB44_24
.LBB44_21:
	stz	__rc2
	stz	__rc3
.LBB44_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB44_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB44_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB44_22
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
.LBB44_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB44_28
; %bb.27:                               ;   in Loop: Header=BB44_26 Depth=1
	ldy	#0
.LBB44_28:                              ;   in Loop: Header=BB44_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB44_32
; %bb.29:                               ;   in Loop: Header=BB44_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB44_34
; %bb.30:                               ;   in Loop: Header=BB44_26 Depth=1
	cmp	__rc10
	bne	.LBB44_37
; %bb.31:                               ;   in Loop: Header=BB44_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB44_33
	bra	.LBB44_35
.LBB44_32:                              ;   in Loop: Header=BB44_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB44_35
.LBB44_33:                              ;   in Loop: Header=BB44_26 Depth=1
	lda	__rc6
	bra	.LBB44_36
.LBB44_34:                              ;   in Loop: Header=BB44_26 Depth=1
	cpy	__rc11
	bcc	.LBB44_33
.LBB44_35:                              ;   in Loop: Header=BB44_26 Depth=1
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
.LBB44_36:                              ;   in Loop: Header=BB44_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB44_41
; %bb.49:                               ;   in Loop: Header=BB44_26 Depth=1
	jmp	.LBB44_26
.LBB44_41:
	jmp	.LBB44_22
.LBB44_37:                              ;   in Loop: Header=BB44_26 Depth=1
	cmp	__rc10
	bcc	.LBB44_33
	bra	.LBB44_35
.LBB44_38:
	cpx	__rc5
	bcs	.LBB44_43
; %bb.51:
	jmp	.LBB44_9
.LBB44_43:
	jmp	.LBB44_11
.Lfunc_end44:
	.size	__udivsi3, .Lfunc_end44-__udivsi3
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
	beq	.LBB45_17
.LBB45_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB45_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB45_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB45_11
; %bb.90:
	jmp	.LBB45_31
.LBB45_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB45_12
; %bb.92:
	jmp	.LBB45_32
.LBB45_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB45_13
; %bb.94:
	jmp	.LBB45_38
.LBB45_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB45_14
; %bb.96:
	jmp	.LBB45_40
.LBB45_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB45_15
; %bb.98:
	jmp	.LBB45_42
.LBB45_15:
	cmp	__rc8
	bcc	.LBB45_17
	bra	.LBB45_19
.LBB45_16:
	cpx	__rc15
	bcs	.LBB45_19
.LBB45_17:
	lda	#0
; %bb.66:
	jmp	.LBB45_29
.LBB45_18:
	cpx	__rc14
	bcc	.LBB45_17
.LBB45_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB45_20
; %bb.100:
	jmp	.LBB45_29
.LBB45_20:
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
.LBB45_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB45_25
; %bb.22:                               ;   in Loop: Header=BB45_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB45_26
; %bb.23:                               ;   in Loop: Header=BB45_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB45_27
; %bb.24:                               ;   in Loop: Header=BB45_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB45_102
; %bb.150:                              ;   in Loop: Header=BB45_21 Depth=1
	jmp	.LBB45_33
.LBB45_102:                             ;   in Loop: Header=BB45_21 Depth=1
	jmp	.LBB45_37
.LBB45_25:                              ;   in Loop: Header=BB45_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB45_28
; %bb.104:
	jmp	.LBB45_44
.LBB45_26:                              ;   in Loop: Header=BB45_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB45_28
; %bb.106:
	jmp	.LBB45_44
.LBB45_27:                              ;   in Loop: Header=BB45_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB45_28
; %bb.108:
	jmp	.LBB45_44
.LBB45_28:                              ;   in Loop: Header=BB45_21 Depth=1
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
	bmi	.LBB45_68
; %bb.110:                              ;   in Loop: Header=BB45_21 Depth=1
	jmp	.LBB45_21
.LBB45_68:
	jmp	.LBB45_45
.LBB45_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB45_30:
	ldx	__rc18
	rts
.LBB45_31:
	cpx	__rc13
	bcs	.LBB45_70
; %bb.112:
	jmp	.LBB45_17
.LBB45_70:
	jmp	.LBB45_19
.LBB45_32:
	cpx	__rc12
	bcs	.LBB45_72
; %bb.114:
	jmp	.LBB45_17
.LBB45_72:
	jmp	.LBB45_19
.LBB45_33:                              ;   in Loop: Header=BB45_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB45_39
; %bb.34:                               ;   in Loop: Header=BB45_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB45_41
; %bb.35:                               ;   in Loop: Header=BB45_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB45_43
; %bb.36:                               ;   in Loop: Header=BB45_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB45_44
; %bb.74:                               ;   in Loop: Header=BB45_21 Depth=1
	jmp	.LBB45_28
.LBB45_37:                              ;   in Loop: Header=BB45_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB45_44
; %bb.76:                               ;   in Loop: Header=BB45_21 Depth=1
	jmp	.LBB45_28
.LBB45_38:
	cpx	__rc11
	bcs	.LBB45_78
; %bb.116:
	jmp	.LBB45_17
.LBB45_78:
	jmp	.LBB45_19
.LBB45_39:                              ;   in Loop: Header=BB45_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB45_44
; %bb.80:                               ;   in Loop: Header=BB45_21 Depth=1
	jmp	.LBB45_28
.LBB45_40:
	cpx	__rc10
	bcs	.LBB45_82
; %bb.118:
	jmp	.LBB45_17
.LBB45_82:
	jmp	.LBB45_19
.LBB45_41:                              ;   in Loop: Header=BB45_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB45_44
; %bb.84:                               ;   in Loop: Header=BB45_21 Depth=1
	jmp	.LBB45_28
.LBB45_42:
	cpx	__rc9
	bcs	.LBB45_86
; %bb.120:
	jmp	.LBB45_17
.LBB45_86:
	jmp	.LBB45_19
.LBB45_43:                              ;   in Loop: Header=BB45_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB45_44
; %bb.122:                              ;   in Loop: Header=BB45_21 Depth=1
	jmp	.LBB45_28
.LBB45_44:
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
.LBB45_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB45_46
; %bb.124:
	jmp	.LBB45_30
.LBB45_46:
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
.LBB45_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB45_49
; %bb.48:                               ;   in Loop: Header=BB45_47 Depth=1
	ldy	#0
.LBB45_49:                              ;   in Loop: Header=BB45_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB45_57
; %bb.50:                               ;   in Loop: Header=BB45_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB45_51
; %bb.126:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_60
.LBB45_51:                              ;   in Loop: Header=BB45_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB45_52
; %bb.128:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_61
.LBB45_52:                              ;   in Loop: Header=BB45_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB45_53
; %bb.130:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_62
.LBB45_53:                              ;   in Loop: Header=BB45_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB45_54
; %bb.132:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_63
.LBB45_54:                              ;   in Loop: Header=BB45_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB45_55
; %bb.134:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_64
.LBB45_55:                              ;   in Loop: Header=BB45_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB45_56
; %bb.136:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_65
.LBB45_56:                              ;   in Loop: Header=BB45_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB45_58
	bra	.LBB45_59
.LBB45_57:                              ;   in Loop: Header=BB45_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB45_59
.LBB45_58:                              ;   in Loop: Header=BB45_47 Depth=1
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
.LBB45_59:                              ;   in Loop: Header=BB45_47 Depth=1
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
	beq	.LBB45_88
; %bb.138:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_47
.LBB45_88:
	jmp	.LBB45_30
.LBB45_60:                              ;   in Loop: Header=BB45_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB45_58
	bra	.LBB45_59
.LBB45_61:                              ;   in Loop: Header=BB45_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB45_59
; %bb.140:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_58
.LBB45_62:                              ;   in Loop: Header=BB45_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB45_59
; %bb.142:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_58
.LBB45_63:                              ;   in Loop: Header=BB45_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB45_59
; %bb.144:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_58
.LBB45_64:                              ;   in Loop: Header=BB45_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB45_59
; %bb.146:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_58
.LBB45_65:                              ;   in Loop: Header=BB45_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB45_59
; %bb.148:                              ;   in Loop: Header=BB45_47 Depth=1
	jmp	.LBB45_58
.Lfunc_end45:
	.size	__udivdi3, .Lfunc_end45-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB46_1
; %bb.15:
	jmp	.LBB46_13
.LBB46_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB46_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB46_14
; %bb.3:
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB46_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB46_6
; %bb.5:                                ;   in Loop: Header=BB46_4 Depth=1
	cmp	__rc2
	bcc	.LBB46_8
	bra	.LBB46_7
.LBB46_6:                               ;   in Loop: Header=BB46_4 Depth=1
	cpy	__rc4
	bcc	.LBB46_8
.LBB46_7:                               ;   in Loop: Header=BB46_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB46_4
	bra	.LBB46_9
.LBB46_8:
	ldy	__rc3
	sty	__rc2
.LBB46_9:
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB46_13
.LBB46_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB46_12
; %bb.11:                               ;   in Loop: Header=BB46_10 Depth=1
	sec
	sbc	__rc2
.LBB46_12:                              ;   in Loop: Header=BB46_10 Depth=1
	dex
	bne	.LBB46_10
.LBB46_13:
	rts
.LBB46_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end46:
	.size	__umodqi3, .Lfunc_end46-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB47_2
; %bb.1:
	ldx	__rc2
	bne	.LBB47_2
; %bb.22:
	jmp	.LBB47_19
.LBB47_2:
	cmp	__rc3
	bne	.LBB47_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB47_5
; %bb.20:
	jmp	.LBB47_19
.LBB47_4:
	cmp	__rc3
	bcs	.LBB47_5
; %bb.24:
	jmp	.LBB47_19
.LBB47_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB47_6
; %bb.26:
	jmp	.LBB47_18
.LBB47_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB47_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB47_9
; %bb.8:                                ;   in Loop: Header=BB47_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB47_11
	bra	.LBB47_10
.LBB47_9:                               ;   in Loop: Header=BB47_7 Depth=1
	cmp	__rc5
	bcc	.LBB47_11
.LBB47_10:                              ;   in Loop: Header=BB47_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB47_7
	bra	.LBB47_12
.LBB47_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB47_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB47_19
.LBB47_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB47_17
; %bb.14:                               ;   in Loop: Header=BB47_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB47_16
.LBB47_15:                              ;   in Loop: Header=BB47_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB47_16:                              ;   in Loop: Header=BB47_13 Depth=1
	dex
	bne	.LBB47_13
	bra	.LBB47_19
.LBB47_17:                              ;   in Loop: Header=BB47_13 Depth=1
	cmp	__rc5
	bcs	.LBB47_15
	bra	.LBB47_16
.LBB47_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB47_19:
	tax
	tya
	rts
.Lfunc_end47:
	.size	__umodhi3, .Lfunc_end47-__umodhi3
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
	bne	.LBB48_4
; %bb.1:
	ldx	__rc6
	bne	.LBB48_4
; %bb.2:
	ldx	__rc5
	bne	.LBB48_4
; %bb.3:
	ldx	__rc4
	bne	.LBB48_4
; %bb.42:
	jmp	.LBB48_35
.LBB48_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB48_8
; %bb.5:
	cmp	__rc6
	bne	.LBB48_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB48_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB48_11
; %bb.36:
	jmp	.LBB48_35
.LBB48_8:
	cpx	__rc7
	bcs	.LBB48_11
; %bb.38:
	jmp	.LBB48_35
.LBB48_9:
	cmp	__rc6
	bcs	.LBB48_11
; %bb.40:
	jmp	.LBB48_35
.LBB48_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB48_11
; %bb.44:
	jmp	.LBB48_35
.LBB48_11:
	ldx	__rc7
	bpl	.LBB48_12
; %bb.46:
	jmp	.LBB48_33
.LBB48_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB48_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB48_17
; %bb.14:                               ;   in Loop: Header=BB48_13 Depth=1
	cmp	__rc8
	bne	.LBB48_18
; %bb.15:                               ;   in Loop: Header=BB48_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB48_19
; %bb.16:                               ;   in Loop: Header=BB48_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB48_21
	bra	.LBB48_20
.LBB48_17:                              ;   in Loop: Header=BB48_13 Depth=1
	cpy	__rc9
	bcc	.LBB48_21
	bra	.LBB48_20
.LBB48_18:                              ;   in Loop: Header=BB48_13 Depth=1
	cmp	__rc8
	bcc	.LBB48_21
	bra	.LBB48_20
.LBB48_19:                              ;   in Loop: Header=BB48_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB48_21
.LBB48_20:                              ;   in Loop: Header=BB48_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB48_13
	bra	.LBB48_22
.LBB48_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB48_22:
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
	bne	.LBB48_23
; %bb.48:
	jmp	.LBB48_34
.LBB48_23:
	tya
.LBB48_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB48_28
; %bb.25:                               ;   in Loop: Header=BB48_24 Depth=1
	cmp	__rc8
	bne	.LBB48_31
; %bb.26:                               ;   in Loop: Header=BB48_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB48_32
; %bb.27:                               ;   in Loop: Header=BB48_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB48_29
	bra	.LBB48_30
.LBB48_28:                              ;   in Loop: Header=BB48_24 Depth=1
	cpy	__rc9
	bcc	.LBB48_30
.LBB48_29:                              ;   in Loop: Header=BB48_24 Depth=1
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
.LBB48_30:                              ;   in Loop: Header=BB48_24 Depth=1
	dex
	bne	.LBB48_24
	bra	.LBB48_35
.LBB48_31:                              ;   in Loop: Header=BB48_24 Depth=1
	cmp	__rc8
	bcs	.LBB48_29
	bra	.LBB48_30
.LBB48_32:                              ;   in Loop: Header=BB48_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB48_29
	bra	.LBB48_30
.LBB48_33:
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
	bra	.LBB48_35
.LBB48_34:
	tya
.LBB48_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end48:
	.size	__umodsi3, .Lfunc_end48-__umodsi3
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
	bne	.LBB49_8
; %bb.1:
	ldx	__rc14
	bne	.LBB49_8
; %bb.2:
	ldx	__rc13
	bne	.LBB49_8
; %bb.3:
	ldx	__rc12
	bne	.LBB49_8
; %bb.4:
	ldx	__rc11
	bne	.LBB49_8
; %bb.5:
	ldx	__rc10
	bne	.LBB49_8
; %bb.6:
	ldx	__rc9
	bne	.LBB49_8
; %bb.7:
	ldx	__rc8
	bne	.LBB49_8
; %bb.90:
	jmp	.LBB49_61
.LBB49_8:
	cmp	__rc15
	bne	.LBB49_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB49_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB49_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB49_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB49_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB49_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB49_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB49_23
; %bb.62:
	jmp	.LBB49_61
.LBB49_16:
	cmp	__rc15
	bcs	.LBB49_23
; %bb.64:
	jmp	.LBB49_61
.LBB49_17:
	cpx	__rc14
	bcs	.LBB49_23
; %bb.66:
	jmp	.LBB49_61
.LBB49_18:
	cpx	__rc13
	bcs	.LBB49_23
; %bb.68:
	jmp	.LBB49_61
.LBB49_19:
	cpx	__rc12
	bcs	.LBB49_23
; %bb.70:
	jmp	.LBB49_61
.LBB49_20:
	cpx	__rc11
	bcs	.LBB49_23
; %bb.72:
	jmp	.LBB49_61
.LBB49_21:
	cpx	__rc10
	bcs	.LBB49_23
; %bb.74:
	jmp	.LBB49_61
.LBB49_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB49_23
; %bb.92:
	jmp	.LBB49_61
.LBB49_23:
	ldx	__rc15
	bpl	.LBB49_24
; %bb.94:
	jmp	.LBB49_33
.LBB49_24:
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
.LBB49_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB49_29
; %bb.26:                               ;   in Loop: Header=BB49_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB49_30
; %bb.27:                               ;   in Loop: Header=BB49_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB49_31
; %bb.28:                               ;   in Loop: Header=BB49_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB49_76
; %bb.96:                               ;   in Loop: Header=BB49_25 Depth=1
	jmp	.LBB49_38
.LBB49_76:                              ;   in Loop: Header=BB49_25 Depth=1
	jmp	.LBB49_34
.LBB49_29:                              ;   in Loop: Header=BB49_25 Depth=1
	cmp	__rc19
	bcs	.LBB49_32
; %bb.98:
	jmp	.LBB49_42
.LBB49_30:                              ;   in Loop: Header=BB49_25 Depth=1
	cpy	__rc18
	bcs	.LBB49_32
; %bb.100:
	jmp	.LBB49_42
.LBB49_31:                              ;   in Loop: Header=BB49_25 Depth=1
	cpy	__rc7
	bcs	.LBB49_32
; %bb.102:
	jmp	.LBB49_42
.LBB49_32:                              ;   in Loop: Header=BB49_25 Depth=1
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
	bmi	.LBB49_78
; %bb.104:                              ;   in Loop: Header=BB49_25 Depth=1
	jmp	.LBB49_25
.LBB49_78:
	jmp	.LBB49_43
.LBB49_33:
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
	jmp	.LBB49_61
.LBB49_34:                              ;   in Loop: Header=BB49_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB49_39
; %bb.35:                               ;   in Loop: Header=BB49_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB49_40
; %bb.36:                               ;   in Loop: Header=BB49_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB49_41
; %bb.37:                               ;   in Loop: Header=BB49_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB49_42
; %bb.82:                               ;   in Loop: Header=BB49_25 Depth=1
	jmp	.LBB49_32
.LBB49_38:                              ;   in Loop: Header=BB49_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB49_42
; %bb.84:                               ;   in Loop: Header=BB49_25 Depth=1
	jmp	.LBB49_32
.LBB49_39:                              ;   in Loop: Header=BB49_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB49_42
; %bb.86:                               ;   in Loop: Header=BB49_25 Depth=1
	jmp	.LBB49_32
.LBB49_40:                              ;   in Loop: Header=BB49_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB49_42
; %bb.88:                               ;   in Loop: Header=BB49_25 Depth=1
	jmp	.LBB49_32
.LBB49_41:                              ;   in Loop: Header=BB49_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB49_42
; %bb.106:                              ;   in Loop: Header=BB49_25 Depth=1
	jmp	.LBB49_32
.LBB49_42:
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
.LBB49_43:
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
	bne	.LBB49_44
; %bb.108:
	jmp	.LBB49_61
.LBB49_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB49_52
; %bb.45:                               ;   in Loop: Header=BB49_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB49_46
; %bb.110:                              ;   in Loop: Header=BB49_44 Depth=1
	jmp	.LBB49_55
.LBB49_46:                              ;   in Loop: Header=BB49_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB49_47
; %bb.112:                              ;   in Loop: Header=BB49_44 Depth=1
	jmp	.LBB49_56
.LBB49_47:                              ;   in Loop: Header=BB49_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB49_48
; %bb.114:                              ;   in Loop: Header=BB49_44 Depth=1
	jmp	.LBB49_57
.LBB49_48:                              ;   in Loop: Header=BB49_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB49_49
; %bb.116:                              ;   in Loop: Header=BB49_44 Depth=1
	jmp	.LBB49_58
.LBB49_49:                              ;   in Loop: Header=BB49_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB49_50
; %bb.118:                              ;   in Loop: Header=BB49_44 Depth=1
	jmp	.LBB49_59
.LBB49_50:                              ;   in Loop: Header=BB49_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB49_51
; %bb.120:                              ;   in Loop: Header=BB49_44 Depth=1
	jmp	.LBB49_60
.LBB49_51:                              ;   in Loop: Header=BB49_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB49_53
	bra	.LBB49_54
.LBB49_52:                              ;   in Loop: Header=BB49_44 Depth=1
	cmp	__rc19
	bcc	.LBB49_54
.LBB49_53:                              ;   in Loop: Header=BB49_44 Depth=1
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
.LBB49_54:                              ;   in Loop: Header=BB49_44 Depth=1
	dex
	beq	.LBB49_61
; %bb.122:                              ;   in Loop: Header=BB49_44 Depth=1
	jmp	.LBB49_44
.LBB49_55:                              ;   in Loop: Header=BB49_44 Depth=1
	cpy	__rc18
	bcs	.LBB49_53
	bra	.LBB49_54
.LBB49_56:                              ;   in Loop: Header=BB49_44 Depth=1
	cpy	__rc7
	bcs	.LBB49_53
	bra	.LBB49_54
.LBB49_57:                              ;   in Loop: Header=BB49_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB49_53
	bra	.LBB49_54
.LBB49_58:                              ;   in Loop: Header=BB49_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB49_53
	bra	.LBB49_54
.LBB49_59:                              ;   in Loop: Header=BB49_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB49_53
	bra	.LBB49_54
.LBB49_60:                              ;   in Loop: Header=BB49_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB49_54
; %bb.124:                              ;   in Loop: Header=BB49_44 Depth=1
	jmp	.LBB49_53
.LBB49_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end49:
	.size	__umoddi3, .Lfunc_end49-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB50_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB50_2
; %bb.18:
	jmp	.LBB50_17
.LBB50_2:
	lda	__rc5
	bpl	.LBB50_3
; %bb.20:
	jmp	.LBB50_15
.LBB50_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB50_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB50_6
; %bb.5:                                ;   in Loop: Header=BB50_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB50_9
	bra	.LBB50_7
.LBB50_6:                               ;   in Loop: Header=BB50_4 Depth=1
	cpy	__rc6
	bcc	.LBB50_9
.LBB50_7:                               ;   in Loop: Header=BB50_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB50_4
	bra	.LBB50_10
.LBB50_8:
	sty	__rc7
	bra	.LBB50_17
.LBB50_9:
	ldy	__rc5
	sty	__rc4
.LBB50_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB50_16
; %bb.11:
	lda	#1
.LBB50_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB50_14
; %bb.13:                               ;   in Loop: Header=BB50_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB50_14:                              ;   in Loop: Header=BB50_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB50_12
	bra	.LBB50_17
.LBB50_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB50_16:
	lda	#1
.LBB50_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end50:
	.size	__udivmodqi4, .Lfunc_end50-__udivmodqi4
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
	bne	.LBB51_2
; %bb.1:
	ldx	__rc2
	beq	.LBB51_4
.LBB51_2:
	cmp	__rc3
	bne	.LBB51_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB51_6
.LBB51_4:
	ldx	#0
; %bb.26:
	jmp	.LBB51_24
.LBB51_5:
	cmp	__rc3
	bcc	.LBB51_4
.LBB51_6:
	tay
	ldx	__rc3
	bpl	.LBB51_7
; %bb.28:
	jmp	.LBB51_22
.LBB51_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB51_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB51_10
; %bb.9:                                ;   in Loop: Header=BB51_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB51_11
	bra	.LBB51_12
.LBB51_10:                              ;   in Loop: Header=BB51_8 Depth=1
	cmp	__rc8
	bcc	.LBB51_12
.LBB51_11:                              ;   in Loop: Header=BB51_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB51_8
	bra	.LBB51_13
.LBB51_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB51_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB51_14
; %bb.30:
	jmp	.LBB51_23
.LBB51_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB51_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB51_17
; %bb.16:                               ;   in Loop: Header=BB51_15 Depth=1
	ldy	#0
.LBB51_17:                              ;   in Loop: Header=BB51_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB51_21
; %bb.18:                               ;   in Loop: Header=BB51_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB51_20
.LBB51_19:                              ;   in Loop: Header=BB51_15 Depth=1
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
.LBB51_20:                              ;   in Loop: Header=BB51_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB51_15
	bra	.LBB51_25
.LBB51_21:                              ;   in Loop: Header=BB51_15 Depth=1
	cmp	__rc8
	bcs	.LBB51_19
	bra	.LBB51_20
.LBB51_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB51_23:
	ldx	#1
.LBB51_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB51_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end51:
	.size	__udivmodhi4, .Lfunc_end51-__udivmodhi4
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
	bpl	.LBB52_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB52_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB52_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB52_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB52_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB52_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB52_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB52_8:
	lda	__rc2
	rts
.Lfunc_end52:
	.size	__divqi3, .Lfunc_end52-__divqi3
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
	bmi	.LBB53_2
; %bb.1:
	bra	.LBB53_6
.LBB53_2:
	cpx	#128
	bne	.LBB53_5
; %bb.3:
	lda	__rc4
	bne	.LBB53_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB53_6
.LBB53_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB53_6:
	tya
	bmi	.LBB53_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB53_12
.LBB53_8:
	cpy	#128
	bne	.LBB53_11
; %bb.9:
	lda	__rc2
	bne	.LBB53_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB53_12
.LBB53_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB53_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB53_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB53_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end53:
	.size	__divhi3, .Lfunc_end53-__divhi3
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
	bmi	.LBB54_2
; %bb.1:
	ldy	__rc3
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
	ldy	#128
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
	sbc	mos8(.L__divsi3_zp_stk+1)
	tay
.LBB54_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB54_10
; %bb.9:
	lda	__rc7
	bra	.LBB54_16
.LBB54_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB54_15
; %bb.11:
	lda	__rc6
	bne	.LBB54_15
; %bb.12:
	lda	__rc5
	bne	.LBB54_15
; %bb.13:
	lda	__rc4
	bne	.LBB54_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB54_16
.LBB54_15:
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
.LBB54_16:
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
	bne	.LBB54_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB54_19
.LBB54_18:
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
.LBB54_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end54:
	.size	__divsi3, .Lfunc_end54-__divsi3
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
	bmi	.LBB55_2
; %bb.1:
	ldy	__rc7
; %bb.28:
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
	ldy	#128
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
	sbc	mos8(.L__divdi3_zp_stk+1)
	tay
.LBB55_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB55_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB55_24
.LBB55_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB55_23
; %bb.15:
	lda	__rc14
	bne	.LBB55_23
; %bb.16:
	lda	__rc13
	bne	.LBB55_23
; %bb.17:
	lda	__rc12
	bne	.LBB55_23
; %bb.18:
	lda	__rc11
	bne	.LBB55_23
; %bb.19:
	lda	__rc10
	bne	.LBB55_23
; %bb.20:
	lda	__rc9
	bne	.LBB55_23
; %bb.21:
	lda	__rc8
	bne	.LBB55_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB55_24
.LBB55_23:
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
.LBB55_24:
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
	bne	.LBB55_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB55_27
.LBB55_26:
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
.LBB55_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end55:
	.size	__divdi3, .Lfunc_end55-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB56_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB56_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB56_3:
	tay
	lda	__rc2
	bmi	.LBB56_5
; %bb.4:
	lda	__rc2
	bra	.LBB56_7
.LBB56_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB56_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB56_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB56_9
; %bb.8:
	rts
.LBB56_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end56:
	.size	__modqi3, .Lfunc_end56-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB57_2
; %bb.1:
	txa
	bra	.LBB57_6
.LBB57_2:
	cpx	#128
	bne	.LBB57_5
; %bb.3:
	lda	__rc4
	bne	.LBB57_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB57_6
.LBB57_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB57_6:
	ldx	__rc3
	bpl	.LBB57_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB57_10
; %bb.8:
	ldx	__rc2
	bne	.LBB57_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB57_11
.LBB57_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB57_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB57_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB57_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end57:
	.size	__modhi3, .Lfunc_end57-__modhi3
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
	bmi	.LBB58_2
; %bb.1:
	lda	__rc3
	bra	.LBB58_8
.LBB58_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB58_7
; %bb.3:
	lda	__rc2
	bne	.LBB58_7
; %bb.4:
	lda	__rc8
	bne	.LBB58_7
; %bb.5:
	lda	__rc9
	bne	.LBB58_7
; %bb.6:
	stz	__rc9
	lda	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB58_8
.LBB58_7:
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
.LBB58_8:
	ldx	__rc7
	bpl	.LBB58_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB58_14
; %bb.10:
	ldx	__rc6
	bne	.LBB58_14
; %bb.11:
	ldx	__rc5
	bne	.LBB58_14
; %bb.12:
	ldx	__rc4
	bne	.LBB58_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB58_15
.LBB58_14:
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
.LBB58_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB58_17
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
.LBB58_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end58:
	.size	__modsi3, .Lfunc_end58-__modsi3
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
	bmi	.LBB59_2
; %bb.1:
	lda	__rc7
; %bb.26:
	jmp	.LBB59_12
.LBB59_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB59_11
; %bb.3:
	lda	__rc6
	bne	.LBB59_11
; %bb.4:
	lda	__rc5
	bne	.LBB59_11
; %bb.5:
	lda	__rc4
	bne	.LBB59_11
; %bb.6:
	lda	__rc3
	bne	.LBB59_11
; %bb.7:
	lda	__rc2
	bne	.LBB59_11
; %bb.8:
	lda	__rc18
	bne	.LBB59_11
; %bb.9:
	lda	__rc19
	bne	.LBB59_11
; %bb.10:
	stz	__rc19
	lda	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB59_12
.LBB59_11:
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
.LBB59_12:
	ldx	__rc15
	bmi	.LBB59_13
; %bb.28:
	jmp	.LBB59_23
.LBB59_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB59_22
; %bb.14:
	ldx	__rc14
	bne	.LBB59_22
; %bb.15:
	ldx	__rc13
	bne	.LBB59_22
; %bb.16:
	ldx	__rc12
	bne	.LBB59_22
; %bb.17:
	ldx	__rc11
	bne	.LBB59_22
; %bb.18:
	ldx	__rc10
	bne	.LBB59_22
; %bb.19:
	ldx	__rc9
	bne	.LBB59_22
; %bb.20:
	ldx	__rc8
	bne	.LBB59_22
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
	bra	.LBB59_23
.LBB59_22:
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
.LBB59_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB59_25
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
.LBB59_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end59:
	.size	__moddi3, .Lfunc_end59-__moddi3
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
	bpl	.LBB60_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB60_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB60_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB60_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB60_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB60_11
.LBB60_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB60_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB60_8
; %bb.34:
	jmp	.LBB60_24
.LBB60_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB60_24
.LBB60_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB60_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB60_12
.LBB60_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB60_24
.LBB60_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB60_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB60_15
; %bb.14:                               ;   in Loop: Header=BB60_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB60_18
	bra	.LBB60_16
.LBB60_15:                              ;   in Loop: Header=BB60_13 Depth=1
	cmp	__rc7
	bcc	.LBB60_18
.LBB60_16:                              ;   in Loop: Header=BB60_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB60_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB60_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB60_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB60_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB60_22
; %bb.21:                               ;   in Loop: Header=BB60_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB60_22:                              ;   in Loop: Header=BB60_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB60_20
	bra	.LBB60_24
.LBB60_23:
	sta	__rc7
	sty	__rc6
.LBB60_24:
	lda	__rc4
	bmi	.LBB60_26
; %bb.25:
	lda	__rc7
	bra	.LBB60_27
.LBB60_26:
	lda	#0
	sec
	sbc	__rc7
.LBB60_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB60_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB60_29:
	lda	__rc6
	rts
.Lfunc_end60:
	.size	__divmodqi4, .Lfunc_end60-__divmodqi4
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
	bmi	.LBB61_2
.LBB61_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB61_6
.LBB61_2:
	cpx	#128
	bne	.LBB61_5
; %bb.3:
	lda	__rc7
	bne	.LBB61_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB61_1
.LBB61_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB61_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB61_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB61_15
; %bb.8:
	lda	__rc2
	bne	.LBB61_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB61_18
.LBB61_10:
	cpy	#128
	bne	.LBB61_14
; %bb.11:
	ldy	__rc2
	bne	.LBB61_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB61_13
; %bb.48:
	jmp	.LBB61_45
.LBB61_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB61_18
.LBB61_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB61_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB61_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB61_20
.LBB61_17:
	sta	__rc11
.LBB61_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB61_39
.LBB61_19:
	cmp	__rc7
	bcc	.LBB61_17
.LBB61_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB61_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB61_23
; %bb.22:                               ;   in Loop: Header=BB61_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB61_24
	bra	.LBB61_26
.LBB61_23:                              ;   in Loop: Header=BB61_21 Depth=1
	cmp	__rc9
	bcc	.LBB61_26
.LBB61_24:                              ;   in Loop: Header=BB61_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB61_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB61_27
.LBB61_26:
	tay
.LBB61_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB61_28
; %bb.50:
	jmp	.LBB61_37
.LBB61_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB61_32
.LBB61_29:                              ;   in Loop: Header=BB61_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB61_36
.LBB61_30:                              ;   in Loop: Header=BB61_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB61_31:                              ;   in Loop: Header=BB61_32 Depth=1
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
	beq	.LBB61_39
.LBB61_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB61_34
; %bb.33:                               ;   in Loop: Header=BB61_32 Depth=1
	ldy	#0
.LBB61_34:                              ;   in Loop: Header=BB61_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB61_29
; %bb.35:                               ;   in Loop: Header=BB61_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB61_30
.LBB61_36:                              ;   in Loop: Header=BB61_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB61_31
.LBB61_37:
	sta	__rc11
	ldx	#1
.LBB61_38:
	stx	__rc9
.LBB61_39:
	lda	__rc6
	bmi	.LBB61_41
; %bb.40:
	lda	__rc10
	bra	.LBB61_42
.LBB61_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB61_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB61_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB61_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB61_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB61_38
.Lfunc_end61:
	.size	__divmodhi4, .Lfunc_end61-__divmodhi4
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

	.type	worksectorasBAM,@object         ; @worksectorasBAM
	.section	.zp.bss.worksectorasBAM,"aw",@nobits
worksectorasBAM:
	.zero	4
	.size	worksectorasBAM, 4

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

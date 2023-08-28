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
	.section	.text.readblockchain,"ax",@progbits
	.type	readblockchain,@function        ; -- Begin function readblockchain
readblockchain:                         ; @readblockchain
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#242
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
	ldy	#11
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc2
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc3
	stx	__rc26
	lda	__rc4
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc5
	stx	__rc22
	ldx	__rc6
	stx	__rc21
	ldx	#24
	stx	mos8(worksector+1)
	inx
	stx	mos8(worksector+3)
	ldx	#52
	stx	__rc24
	ldx	#3
	stx	__rc25
	stz	mos8(worksector)
	stz	mos8(worksector+2)
	stz	mos8(offsCurrIdx)
	stz	mos8(flagCurrSec)
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
	stz	mos8(i)
	stz	__rc23
; %bb.34:
	jmp	.LBB2_26
.LBB2_1:                                ;   in Loop: Header=BB2_8 Depth=2
	cmp	#96
	bcc	.LBB2_3
; %bb.2:                                ;   in Loop: Header=BB2_8 Depth=2
	clc
	adc	#160
	bra	.LBB2_5
.LBB2_3:                                ;   in Loop: Header=BB2_8 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB2_5
; %bb.4:                                ;   in Loop: Header=BB2_8 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB2_5:                                ;   in Loop: Header=BB2_8 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB2_7
; %bb.6:                                ;   in Loop: Header=BB2_8 Depth=2
	inc	__rc3
.LBB2_7:                                ;   in Loop: Header=BB2_8 Depth=2
	tax
	beq	.LBB2_12
.LBB2_8:                                ;   Parent Loop BB2_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc28)
	inc	__rc28
	bne	.LBB2_10
; %bb.9:                                ;   in Loop: Header=BB2_8 Depth=2
	inc	__rc29
.LBB2_10:                               ;   in Loop: Header=BB2_8 Depth=2
	cmp	#192
	bcc	.LBB2_1
; %bb.11:                               ;   in Loop: Header=BB2_8 Depth=2
	eor	#128
	bra	.LBB2_5
.LBB2_12:                               ;   in Loop: Header=BB2_26 Depth=1
	ldx	#mos16lo(.L.str.44)
	stx	__rc30
	ldx	#mos16hi(.L.str.44)
	stx	__rc31
	clc
	lda	__rc0
	adc	#12
	sta	__rc28
	lda	__rc1
	adc	#0
	sta	__rc29
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc2
	stz	__rc3
	ldx	#4
	stx	__rc4
	ldx	__rc29
	lda	__rc28
	jsr	cputhex
	lda	mos8(workside)
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos8(worksector)
	clc
	adc	__rc2
	sta	__rc4
	lda	#mos8(0)
	adc	__rc3
	sta	__rc5
	lda	(__rc4)
	sta	__rc27
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldy	#1
	lda	(__rc4),y
	sta	__rc20
	bra	.LBB2_20
.LBB2_13:                               ;   in Loop: Header=BB2_20 Depth=2
	cmp	#96
	bcc	.LBB2_15
; %bb.14:                               ;   in Loop: Header=BB2_20 Depth=2
	clc
	adc	#160
	bra	.LBB2_17
.LBB2_15:                               ;   in Loop: Header=BB2_20 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB2_17
; %bb.16:                               ;   in Loop: Header=BB2_20 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB2_17:                               ;   in Loop: Header=BB2_20 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB2_19
; %bb.18:                               ;   in Loop: Header=BB2_20 Depth=2
	inc	__rc3
.LBB2_19:                               ;   in Loop: Header=BB2_20 Depth=2
	tax
	beq	.LBB2_24
.LBB2_20:                               ;   Parent Loop BB2_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc30)
	inc	__rc30
	bne	.LBB2_22
; %bb.21:                               ;   in Loop: Header=BB2_20 Depth=2
	inc	__rc31
.LBB2_22:                               ;   in Loop: Header=BB2_20 Depth=2
	cmp	#192
	bcc	.LBB2_13
; %bb.23:                               ;   in Loop: Header=BB2_20 Depth=2
	eor	#128
	bra	.LBB2_17
.LBB2_24:                               ;   in Loop: Header=BB2_26 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc2
	stz	__rc3
	ldx	#4
	stx	__rc4
	ldx	__rc20
	lda	__rc27
	jsr	cputhex
	jsr	cputln
	lda	#0
	clc
	pha
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	pla
	adc	__rc2
	sta	__rc7
	lda	(__rc28)
	sta	__rc10
	ldy	#1
	lda	(__rc28),y
	tax
	sty	__rc17
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	mos8(i)
	sta	__rc3
	lda	#0
	pha
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	__rc17
	sta	__rc2
	pla
	adc	__rc2
	sta	__rc6
	lda	#0
	adc	__rc26
	phy
	ldy	__rc7
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
	sta	__rc7
	stz	__rc2
	stz	__rc3
	stz	__rc8
	sty	__rc9
	lda	__rc10
	jsr	lcopy
	lda	__rc22
	bne	.LBB2_25
; %bb.38:
	jmp	.LBB2_33
.LBB2_25:                               ;   in Loop: Header=BB2_26 Depth=1
	ldx	mos8(i)
	inx
	inc	mos8(i)
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	cpx	__rc2
	bcc	.LBB2_26
; %bb.40:
	jmp	.LBB2_33
.LBB2_26:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_28 Depth 2
                                        ;     Child Loop BB2_30 Depth 2
                                        ;     Child Loop BB2_8 Depth 2
                                        ;     Child Loop BB2_20 Depth 2
	ldx	__rc22
	ldy	__rc21
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
	sta	__rc2

	;NO_APP
	lda	__rc2
	cmp	#2
	bcc	.LBB2_27
; %bb.42:                               ;   in Loop: Header=BB2_26 Depth=1
	jmp	.LBB2_32
.LBB2_27:                               ;   in Loop: Header=BB2_26 Depth=1
	sta	__rc20
	ldy	#0
	stz	mos8(ptrMiniOffs)
	ldx	#108
	stx	mos8(ptrMiniOffs+1)
	ldx	#253
	stx	mos8(ptrMiniOffs+2)
	ldx	#15
	stx	mos8(ptrMiniOffs+3)
.LBB2_28:                               ;   Parent Loop BB2_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	mos8(ptrMiniOffs+1)
	stx	__rc2
	clc
	ldx	mos8(ptrMiniOffs+2)
	stx	__rc3
	ldx	mos8(ptrMiniOffs+3)
	tya
	adc	mos8(ptrMiniOffs)
	sta	__rc4
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
	lda	__rc4
	sty	__rc21
	jsr	lpeek
	ldy	__rc21
	sta	6144,y
	iny
	bne	.LBB2_28
; %bb.29:                               ;   in Loop: Header=BB2_26 Depth=1
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
.LBB2_30:                               ;   Parent Loop BB2_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	mos8(ptrMiniOffs+1)
	stx	__rc2
	clc
	ldx	mos8(ptrMiniOffs+2)
	stx	__rc3
	ldy	mos8(ptrMiniOffs+3)
	lda	__rc21
	adc	mos8(ptrMiniOffs)
	sta	__rc4
	lda	__rc2
	adc	#0
	tax
	lda	__rc3
	adc	#0
	sta	__rc2
	tya
	adc	#0
	sta	__rc3
	lda	__rc4
	jsr	lpeek
	ldx	__rc21
	sta	6400,x
	inx
	stx	__rc21
	bne	.LBB2_30
; %bb.31:                               ;   in Loop: Header=BB2_26 Depth=1
	jsr	cputln
	lda	__rc20
.LBB2_32:                               ;   in Loop: Header=BB2_26 Depth=1
	sta	mos8(workside)
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
	clc
	pha
	lda	__rc0
	adc	#12
	sta	__rc4
	lda	__rc1
	adc	#0
	sta	__rc5
	pla
	ldx	#mos16lo(.L.str.17)
	stx	__rc28
	ldx	#mos16hi(.L.str.17)
	stx	__rc29
	sta	__rc3
	lda	(__rc2)
	sta	__rc6
	ldy	#1
	lda	(__rc2),y
	sta	__rc7
	lda	(__rc2)
	sta	(__rc4)
	lda	(__rc2),y
	sta	(__rc4),y
	lda	(__rc6)
	sta	__rc8
	lda	(__rc6),y
	sta	__rc20
	ldx	#mos16lo(.L.str.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.41)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc8
	sta	__rc22
	jsr	mprintf
	ldx	#mos16lo(.L.str.42)
	stx	__rc2
	ldx	#mos16hi(.L.str.42)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc20
	sta	__rc21
	jsr	mprintf
	lda	mos8(workside)
	ldx	#mos16lo(.L.str.34)
	stx	__rc2
	ldx	#mos16hi(.L.str.34)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	lda	mos8(i)
	ldx	#mos16lo(.L.str.43)
	stx	__rc2
	ldx	#mos16hi(.L.str.43)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
; %bb.36:                               ;   in Loop: Header=BB2_26 Depth=1
	jmp	.LBB2_8
.LBB2_33:
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
	adc	#14
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end2:
	.size	readblockchain, .Lfunc_end2-readblockchain
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
	bpl	.LBB3_2
; %bb.1:
	ldx	#80
.LBB3_2:
	stx	mos8(g_curScreenW)
	lda	53297
	and	#8
	beq	.LBB3_4
; %bb.3:
	ldx	#50
	bra	.LBB3_5
.LBB3_4:
	ldx	#25
.LBB3_5:
	stx	mos8(g_curScreenH)
	bra	.LBB3_7
.LBB3_6:                                ;   in Loop: Header=BB3_7 Depth=1
	stz	54800
.LBB3_7:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB3_6
; %bb.8:
	ldx	#52
	stx	__rc20
	ldx	#3
	stx	__rc21
	ldx	#0
	stx	__rc24
	ldx	#28
	stx	__rc25
	ldx	#65
	stx	__rc22
	ldx	#28
	stx	__rc23
	ldx	#255
	ldy	#mos16lo(escapeCode)
	sty	__rc2
	ldy	#mos16hi(escapeCode)
	sty	__rc3
	ldy	#1
.LBB3_9:                                ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB3_11
; %bb.10:                               ;   in Loop: Header=BB3_9 Depth=1
	inc	__rc5
.LBB3_11:                               ;   in Loop: Header=BB3_9 Depth=1
	lda	#mos16hi(escNOP)
	sta	(__rc4),y
	dex
	bne	.LBB3_9
; %bb.12:
	stz	53352
	ldx	#208
	stx	53353
	ldx	#2
	stx	53354
	lda	53272
	eor	#2
	sta	53272
	bra	.LBB3_14
.LBB3_13:                               ;   in Loop: Header=BB3_14 Depth=1
	stz	54800
.LBB3_14:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB3_13
; %bb.15:
	lda	#191
	and	53297
	sta	53297
	lda	#191
	and	53332
	sta	53332
	ldx	#mos16lo(.L.str.47)
	stx	__rc2
	ldx	#mos16hi(.L.str.47)
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB3_23
.LBB3_16:                               ;   in Loop: Header=BB3_23 Depth=1
	cmp	#96
	bcc	.LBB3_18
; %bb.17:                               ;   in Loop: Header=BB3_23 Depth=1
	clc
	adc	#160
	bra	.LBB3_20
.LBB3_18:                               ;   in Loop: Header=BB3_23 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_20
; %bb.19:                               ;   in Loop: Header=BB3_23 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_20:                               ;   in Loop: Header=BB3_23 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB3_22
; %bb.21:                               ;   in Loop: Header=BB3_23 Depth=1
	inc	__rc5
.LBB3_22:                               ;   in Loop: Header=BB3_23 Depth=1
	tax
	beq	.LBB3_27
.LBB3_23:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB3_25
; %bb.24:                               ;   in Loop: Header=BB3_23 Depth=1
	inc	__rc3
.LBB3_25:                               ;   in Loop: Header=BB3_23 Depth=1
	cmp	#192
	bcc	.LBB3_16
; %bb.26:                               ;   in Loop: Header=BB3_23 Depth=1
	eor	#128
	bra	.LBB3_20
.LBB3_27:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB3_28:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB3_28
; %bb.29:
	ldx	#mos16lo(.L.str.48)
	stx	__rc28
	ldx	#mos16hi(.L.str.48)
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
	ldx	#28
	stx	mos8(fnamehi)
	ldx	#0
	stx	__rc2
	ldx	#28
	stx	__rc3
	ldx	#mos16lo(.L.str.49)
	stx	__rc4
	ldx	#mos16hi(.L.str.49)
	stx	__rc5
	lda	#13
	ldx	#0
	jsr	memcpy
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldy	#28
	;APP
	ldx	#0
	lda	#46
	sta	54848
	clv
	bcc	errhypsetnam1
	lda	#0
	sta	__rc30
	jmp	donehypsetnam1
errhypsetnam1:
	lda	#255
	sta	__rc30
donehypsetnam1:
	nop

	;NO_APP
	bra	.LBB3_37
.LBB3_30:                               ;   in Loop: Header=BB3_37 Depth=1
	cmp	#96
	bcc	.LBB3_32
; %bb.31:                               ;   in Loop: Header=BB3_37 Depth=1
	clc
	adc	#160
	bra	.LBB3_34
.LBB3_32:                               ;   in Loop: Header=BB3_37 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_34
; %bb.33:                               ;   in Loop: Header=BB3_37 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_34:                               ;   in Loop: Header=BB3_37 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB3_36
; %bb.35:                               ;   in Loop: Header=BB3_37 Depth=1
	inc	__rc3
.LBB3_36:                               ;   in Loop: Header=BB3_37 Depth=1
	tax
	beq	.LBB3_41
.LBB3_37:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc28)
	inc	__rc28
	bne	.LBB3_39
; %bb.38:                               ;   in Loop: Header=BB3_37 Depth=1
	inc	__rc29
.LBB3_39:                               ;   in Loop: Header=BB3_37 Depth=1
	cmp	#192
	bcc	.LBB3_30
; %bb.40:                               ;   in Loop: Header=BB3_37 Depth=1
	eor	#128
	bra	.LBB3_34
.LBB3_41:
	ldx	#mos16lo(.L.str.50)
	stx	__rc26
	ldx	#mos16hi(.L.str.50)
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
	bra	.LBB3_49
.LBB3_42:                               ;   in Loop: Header=BB3_49 Depth=1
	cmp	#96
	bcc	.LBB3_44
; %bb.43:                               ;   in Loop: Header=BB3_49 Depth=1
	clc
	adc	#160
	bra	.LBB3_46
.LBB3_44:                               ;   in Loop: Header=BB3_49 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_46
; %bb.45:                               ;   in Loop: Header=BB3_49 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_46:                               ;   in Loop: Header=BB3_49 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB3_48
; %bb.47:                               ;   in Loop: Header=BB3_49 Depth=1
	inc	__rc3
.LBB3_48:                               ;   in Loop: Header=BB3_49 Depth=1
	tax
	beq	.LBB3_53
.LBB3_49:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc26)
	inc	__rc26
	bne	.LBB3_51
; %bb.50:                               ;   in Loop: Header=BB3_49 Depth=1
	inc	__rc27
.LBB3_51:                               ;   in Loop: Header=BB3_49 Depth=1
	cmp	#192
	bcc	.LBB3_42
; %bb.52:                               ;   in Loop: Header=BB3_49 Depth=1
	eor	#128
	bra	.LBB3_46
.LBB3_53:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#0
	stx	__rc2
	ldx	#28
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB3_61
.LBB3_54:                               ;   in Loop: Header=BB3_61 Depth=1
	cmp	#96
	bcc	.LBB3_56
; %bb.55:                               ;   in Loop: Header=BB3_61 Depth=1
	clc
	adc	#160
	bra	.LBB3_58
.LBB3_56:                               ;   in Loop: Header=BB3_61 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_58
; %bb.57:                               ;   in Loop: Header=BB3_61 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_58:                               ;   in Loop: Header=BB3_61 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB3_60
; %bb.59:                               ;   in Loop: Header=BB3_61 Depth=1
	inc	__rc5
.LBB3_60:                               ;   in Loop: Header=BB3_61 Depth=1
	tax
	beq	.LBB3_65
.LBB3_61:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB3_63
; %bb.62:                               ;   in Loop: Header=BB3_61 Depth=1
	inc	__rc3
.LBB3_63:                               ;   in Loop: Header=BB3_61 Depth=1
	cmp	#192
	bcc	.LBB3_54
; %bb.64:                               ;   in Loop: Header=BB3_61 Depth=1
	eor	#128
	bra	.LBB3_58
.LBB3_65:
	ldx	#mos16lo(.L.str.52)
	stx	__rc26
	ldx	#mos16hi(.L.str.52)
	stx	__rc27
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#28
	stx	mos8(fnamehi)
	ldx	#0
	stx	__rc2
	ldx	#28
	stx	__rc3
	ldx	#mos16lo(.L.str.51)
	stx	__rc4
	ldx	#mos16hi(.L.str.51)
	stx	__rc5
	lda	#13
	ldx	#0
	jsr	memcpy
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldy	#28
	;APP
	ldx	#0
	lda	#46
	sta	54848
	clv
	bcc	errhypsetnam2
	lda	#0
	sta	__rc4
	jmp	donehypsetnam2
errhypsetnam2:
	lda	#255
	sta	__rc4
donehypsetnam2:
	nop

	;NO_APP
	;APP
	ldx	#0
	lda	#70
	sta	54848
	clv
	bcc	errhyp1att3
	lda	#0
	sta	__rc25
	jmp	donehyp1att3
errhyp1att3:
	lda	#255
	sta	__rc25
donehyp1att3:
	nop

	;NO_APP
	bra	.LBB3_73
.LBB3_66:                               ;   in Loop: Header=BB3_73 Depth=1
	cmp	#96
	bcc	.LBB3_68
; %bb.67:                               ;   in Loop: Header=BB3_73 Depth=1
	clc
	adc	#160
	bra	.LBB3_70
.LBB3_68:                               ;   in Loop: Header=BB3_73 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_70
; %bb.69:                               ;   in Loop: Header=BB3_73 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_70:                               ;   in Loop: Header=BB3_73 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB3_72
; %bb.71:                               ;   in Loop: Header=BB3_73 Depth=1
	inc	__rc3
.LBB3_72:                               ;   in Loop: Header=BB3_73 Depth=1
	tax
	beq	.LBB3_77
.LBB3_73:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc26)
	inc	__rc26
	bne	.LBB3_75
; %bb.74:                               ;   in Loop: Header=BB3_73 Depth=1
	inc	__rc27
.LBB3_75:                               ;   in Loop: Header=BB3_73 Depth=1
	cmp	#192
	bcc	.LBB3_66
; %bb.76:                               ;   in Loop: Header=BB3_73 Depth=1
	eor	#128
	bra	.LBB3_70
.LBB3_77:
	ldx	#mos16lo(.L.str.54)
	stx	__rc26
	ldx	#mos16hi(.L.str.54)
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
	bcc	errseldrv4
	stx	__rc25
	jmp	doneseldrv4
errseldrv4:
	lda	#255
	sta	__rc25
doneseldrv4:
	nop

	;NO_APP
	lda	#9
	ldx	#mos16lo(.L.str.53)
	stx	__rc2
	ldx	#mos16hi(.L.str.53)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	ldx	#mos16lo(.L.str.17)
	stx	__rc2
	ldx	#mos16hi(.L.str.17)
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
	bcc	errgetcurdrv5
	sta	__rc24
	jmp	donegetcurdrv5
errgetcurdrv5:
	lda	#255
	sta	__rc24
donegetcurdrv5:
	nop
	;NO_APP
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB3_85
.LBB3_78:                               ;   in Loop: Header=BB3_85 Depth=1
	cmp	#96
	bcc	.LBB3_80
; %bb.79:                               ;   in Loop: Header=BB3_85 Depth=1
	clc
	adc	#160
	bra	.LBB3_82
.LBB3_80:                               ;   in Loop: Header=BB3_85 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_82
; %bb.81:                               ;   in Loop: Header=BB3_85 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_82:                               ;   in Loop: Header=BB3_85 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB3_84
; %bb.83:                               ;   in Loop: Header=BB3_85 Depth=1
	inc	__rc3
.LBB3_84:                               ;   in Loop: Header=BB3_85 Depth=1
	tax
	beq	.LBB3_89
.LBB3_85:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc26)
	inc	__rc26
	bne	.LBB3_87
; %bb.86:                               ;   in Loop: Header=BB3_85 Depth=1
	inc	__rc27
.LBB3_87:                               ;   in Loop: Header=BB3_85 Depth=1
	cmp	#192
	bcc	.LBB3_78
; %bb.88:                               ;   in Loop: Header=BB3_85 Depth=1
	eor	#128
	bra	.LBB3_82
.LBB3_89:
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
	bne	.LBB3_90
; %bb.203:
	jmp	.LBB3_170
.LBB3_90:
	ldx	#mos16lo(.L.str.55)
	stx	__rc2
	ldx	#mos16hi(.L.str.55)
	stx	__rc3
	;APP
	ldx	#0
	lda	#18
	sta	54848
	clv
	bcc	errhypopendir6
	sta	__rc25
	jmp	donehypopendir6
errhypopendir6:
	lda	#255
	sta	__rc25
donehypopendir6:
	nop

	;NO_APP
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB3_98
.LBB3_91:                               ;   in Loop: Header=BB3_98 Depth=1
	cmp	#96
	bcc	.LBB3_93
; %bb.92:                               ;   in Loop: Header=BB3_98 Depth=1
	clc
	adc	#160
	bra	.LBB3_95
.LBB3_93:                               ;   in Loop: Header=BB3_98 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_95
; %bb.94:                               ;   in Loop: Header=BB3_98 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_95:                               ;   in Loop: Header=BB3_98 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB3_97
; %bb.96:                               ;   in Loop: Header=BB3_98 Depth=1
	inc	__rc5
.LBB3_97:                               ;   in Loop: Header=BB3_98 Depth=1
	tax
	beq	.LBB3_102
.LBB3_98:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB3_100
; %bb.99:                               ;   in Loop: Header=BB3_98 Depth=1
	inc	__rc3
.LBB3_100:                              ;   in Loop: Header=BB3_98 Depth=1
	cmp	#192
	bcc	.LBB3_91
; %bb.101:                              ;   in Loop: Header=BB3_98 Depth=1
	eor	#128
	bra	.LBB3_95
.LBB3_102:
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
	bne	.LBB3_103
; %bb.205:
	jmp	.LBB3_170
.LBB3_103:
	cpy	#135
	bne	.LBB3_104
; %bb.207:
	jmp	.LBB3_170
.LBB3_104:
	cpy	#255
	bne	.LBB3_105
; %bb.209:
	jmp	.LBB3_170
.LBB3_105:
	stz	__rc24
; %bb.199:
	jmp	.LBB3_154
.LBB3_106:                              ;   in Loop: Header=BB3_113 Depth=2
	cmp	#96
	bcc	.LBB3_108
; %bb.107:                              ;   in Loop: Header=BB3_113 Depth=2
	clc
	adc	#160
	bra	.LBB3_110
.LBB3_108:                              ;   in Loop: Header=BB3_113 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_110
; %bb.109:                              ;   in Loop: Header=BB3_113 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_110:                              ;   in Loop: Header=BB3_113 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB3_112
; %bb.111:                              ;   in Loop: Header=BB3_113 Depth=2
	inc	__rc5
.LBB3_112:                              ;   in Loop: Header=BB3_113 Depth=2
	tax
	beq	.LBB3_117
.LBB3_113:                              ;   Parent Loop BB3_154 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB3_115
; %bb.114:                              ;   in Loop: Header=BB3_113 Depth=2
	inc	__rc3
.LBB3_115:                              ;   in Loop: Header=BB3_113 Depth=2
	cmp	#192
	bcc	.LBB3_106
; %bb.116:                              ;   in Loop: Header=BB3_113 Depth=2
	eor	#128
	bra	.LBB3_110
.LBB3_117:                              ;   in Loop: Header=BB3_154 Depth=1
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
	jsr	cputc
	ldx	__rc26
	cpx	#133
	bne	.LBB3_118
; %bb.211:
	jmp	.LBB3_155
.LBB3_118:                              ;   in Loop: Header=BB3_154 Depth=1
	cpx	#255
	bne	.LBB3_119
; %bb.213:
	jmp	.LBB3_155
.LBB3_119:                              ;   in Loop: Header=BB3_154 Depth=1
	ldy	#0
	ldx	#0
.LBB3_120:                              ;   Parent Loop BB3_154 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	6721,y
	cmp	#32
	beq	.LBB3_124
; %bb.121:                              ;   in Loop: Header=BB3_120 Depth=2
	cmp	#33
	bcc	.LBB3_123
; %bb.122:                              ;   in Loop: Header=BB3_120 Depth=2
	sta	7233,x
	inx
.LBB3_123:                              ;   in Loop: Header=BB3_120 Depth=2
	iny
	cpy	#8
	bne	.LBB3_120
.LBB3_124:                              ;   in Loop: Header=BB3_154 Depth=1
	ldy	#0
	lda	#46
	sta	7233,x
	inx
.LBB3_125:                              ;   Parent Loop BB3_154 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	6729,y
	cmp	#32
	beq	.LBB3_129
; %bb.126:                              ;   in Loop: Header=BB3_125 Depth=2
	cmp	#33
	bcc	.LBB3_128
; %bb.127:                              ;   in Loop: Header=BB3_125 Depth=2
	sta	7233,x
	inx
.LBB3_128:                              ;   in Loop: Header=BB3_125 Depth=2
	iny
	cpy	#3
	bne	.LBB3_125
.LBB3_129:                              ;   in Loop: Header=BB3_154 Depth=1
	ldy	#mos16lo(.L.str.57)
	sty	__rc2
	ldy	#mos16hi(.L.str.57)
	sty	__rc3
	stz	7233,x
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB3_137
.LBB3_130:                              ;   in Loop: Header=BB3_137 Depth=2
	cmp	#96
	bcc	.LBB3_132
; %bb.131:                              ;   in Loop: Header=BB3_137 Depth=2
	clc
	adc	#160
	bra	.LBB3_134
.LBB3_132:                              ;   in Loop: Header=BB3_137 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_134
; %bb.133:                              ;   in Loop: Header=BB3_137 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_134:                              ;   in Loop: Header=BB3_137 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB3_136
; %bb.135:                              ;   in Loop: Header=BB3_137 Depth=2
	inc	__rc5
.LBB3_136:                              ;   in Loop: Header=BB3_137 Depth=2
	tax
	beq	.LBB3_141
.LBB3_137:                              ;   Parent Loop BB3_154 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB3_139
; %bb.138:                              ;   in Loop: Header=BB3_137 Depth=2
	inc	__rc3
.LBB3_139:                              ;   in Loop: Header=BB3_137 Depth=2
	cmp	#192
	bcc	.LBB3_130
; %bb.140:                              ;   in Loop: Header=BB3_137 Depth=2
	eor	#128
	bra	.LBB3_134
.LBB3_141:                              ;   in Loop: Header=BB3_154 Depth=1
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	ldx	#65
	stx	__rc2
	ldx	#28
	stx	__rc3
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB3_149
.LBB3_142:                              ;   in Loop: Header=BB3_149 Depth=2
	cmp	#96
	bcc	.LBB3_144
; %bb.143:                              ;   in Loop: Header=BB3_149 Depth=2
	clc
	adc	#160
	bra	.LBB3_146
.LBB3_144:                              ;   in Loop: Header=BB3_149 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_146
; %bb.145:                              ;   in Loop: Header=BB3_149 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_146:                              ;   in Loop: Header=BB3_149 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB3_148
; %bb.147:                              ;   in Loop: Header=BB3_149 Depth=2
	inc	__rc5
.LBB3_148:                              ;   in Loop: Header=BB3_149 Depth=2
	tax
	beq	.LBB3_153
.LBB3_149:                              ;   Parent Loop BB3_154 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB3_151
; %bb.150:                              ;   in Loop: Header=BB3_149 Depth=2
	inc	__rc3
.LBB3_151:                              ;   in Loop: Header=BB3_149 Depth=2
	cmp	#192
	bcc	.LBB3_142
; %bb.152:                              ;   in Loop: Header=BB3_149 Depth=2
	eor	#128
	bra	.LBB3_146
.LBB3_153:                              ;   in Loop: Header=BB3_154 Depth=1
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
	ldx	#28
	stx	__rc3
	jsr	strlen
	ldy	#mos16lo(.L.str.58)
	sty	__rc2
	ldy	#mos16hi(.L.str.58)
	sty	__rc3
	stz	__rc4
	stz	__rc5
	jsr	mprintf
	jsr	cputln
	ldy	__rc25
.LBB3_154:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_113 Depth 2
                                        ;     Child Loop BB3_120 Depth 2
                                        ;     Child Loop BB3_125 Depth 2
                                        ;     Child Loop BB3_137 Depth 2
                                        ;     Child Loop BB3_149 Depth 2
	ldx	#mos16lo(.L.str.56)
	stx	__rc2
	ldx	#mos16hi(.L.str.56)
	stx	__rc3
	;APP
	phx
	ldx	#0
	txa
hypreaddirloop7:
	sta	6656,x
	dex
	bne	hypreaddirloop7
	plx
	tya
	tax
	ldy	#mos16hi(6656)
	lda	#20
	sta	54848
	clv
	bcc	errhypreaddir7
	stx	__rc26
	jmp	donehypreaddir7
errhypreaddir7:
	sta	__rc26
donehypreaddir7:
	nop

	;NO_APP
	ldx	6720
	stz	6656,x
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
; %bb.201:                              ;   in Loop: Header=BB3_154 Depth=1
	jmp	.LBB3_113
.LBB3_155:
	ldx	#mos16lo(.L.str.59)
	stx	__rc2
	ldx	#mos16hi(.L.str.59)
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
	bcc	errhypclosedir8
	stx	__rc22
	jmp	donehypclosedir8
errhypclosedir8:
	sta	__rc22
donehypclosedir8:
	nop

	;NO_APP
	bra	.LBB3_163
.LBB3_156:                              ;   in Loop: Header=BB3_163 Depth=1
	cmp	#96
	bcc	.LBB3_158
; %bb.157:                              ;   in Loop: Header=BB3_163 Depth=1
	clc
	adc	#160
	bra	.LBB3_160
.LBB3_158:                              ;   in Loop: Header=BB3_163 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_160
; %bb.159:                              ;   in Loop: Header=BB3_163 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_160:                              ;   in Loop: Header=BB3_163 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB3_162
; %bb.161:                              ;   in Loop: Header=BB3_163 Depth=1
	inc	__rc5
.LBB3_162:                              ;   in Loop: Header=BB3_163 Depth=1
	tax
	beq	.LBB3_167
.LBB3_163:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB3_165
; %bb.164:                              ;   in Loop: Header=BB3_163 Depth=1
	inc	__rc3
.LBB3_165:                              ;   in Loop: Header=BB3_163 Depth=1
	cmp	#192
	bcc	.LBB3_156
; %bb.166:                              ;   in Loop: Header=BB3_163 Depth=1
	eor	#128
	bra	.LBB3_160
.LBB3_167:
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
.LBB3_168:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB3_168
; %bb.169:
	stz	54800
.LBB3_170:
	ldx	#mos16lo(.L.str.60)
	stx	__rc24
	ldx	#mos16hi(.L.str.60)
	stx	__rc25
	stz	__rc22
	ldx	#4
	ldy	#40
	lda	#3
	stx	__rc4
	stz	__rc2
	ldx	#8
	stx	__rc3
	sty	__rc5
	sta	__rc6
	ldx	#0
	txa
	jsr	readblockchain
	lda	#45
	ldx	#8
	ldy	#8
	sty	__rc3
	ldy	#99
	sty	__rc4
	stz	__rc2
	sta	__rc5
	stx	__rc6
	ldx	#4
	lda	#0
	jsr	readblockchain
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB3_178
.LBB3_171:                              ;   in Loop: Header=BB3_178 Depth=1
	cmp	#96
	bcc	.LBB3_173
; %bb.172:                              ;   in Loop: Header=BB3_178 Depth=1
	clc
	adc	#160
	bra	.LBB3_175
.LBB3_173:                              ;   in Loop: Header=BB3_178 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_175
; %bb.174:                              ;   in Loop: Header=BB3_178 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_175:                              ;   in Loop: Header=BB3_178 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB3_177
; %bb.176:                              ;   in Loop: Header=BB3_178 Depth=1
	inc	__rc3
.LBB3_177:                              ;   in Loop: Header=BB3_178 Depth=1
	tax
	beq	.LBB3_182
.LBB3_178:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc24)
	inc	__rc24
	bne	.LBB3_180
; %bb.179:                              ;   in Loop: Header=BB3_178 Depth=1
	inc	__rc25
.LBB3_180:                              ;   in Loop: Header=BB3_178 Depth=1
	cmp	#192
	bcc	.LBB3_171
; %bb.181:                              ;   in Loop: Header=BB3_178 Depth=1
	eor	#128
	bra	.LBB3_175
.LBB3_182:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
.LBB3_183:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB3_183
; %bb.184:
	ldx	#mos16lo(.L.str.61)
	stx	__rc2
	ldx	#mos16hi(.L.str.61)
	stx	__rc3
	stz	54800
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB3_192
.LBB3_185:                              ;   in Loop: Header=BB3_192 Depth=1
	cmp	#96
	bcc	.LBB3_187
; %bb.186:                              ;   in Loop: Header=BB3_192 Depth=1
	clc
	adc	#160
	bra	.LBB3_189
.LBB3_187:                              ;   in Loop: Header=BB3_192 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB3_189
; %bb.188:                              ;   in Loop: Header=BB3_192 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB3_189:                              ;   in Loop: Header=BB3_192 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB3_191
; %bb.190:                              ;   in Loop: Header=BB3_192 Depth=1
	inc	__rc5
.LBB3_191:                              ;   in Loop: Header=BB3_192 Depth=1
	tax
	beq	.LBB3_196
.LBB3_192:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB3_194
; %bb.193:                              ;   in Loop: Header=BB3_192 Depth=1
	inc	__rc3
.LBB3_194:                              ;   in Loop: Header=BB3_192 Depth=1
	cmp	#192
	bcc	.LBB3_185
; %bb.195:                              ;   in Loop: Header=BB3_192 Depth=1
	eor	#128
	bra	.LBB3_189
.LBB3_196:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	jsr	cputln
.LBB3_197:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB3_197
; %bb.198:
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
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end4:
	.size	escNOP, .Lfunc_end4-escNOP
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
.Lfunc_end5:
	.size	clrscr, .Lfunc_end5-clrscr
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
	ldx	mos8(g_curTextColor)
	ldy	#248
	lda	#15
	sty	__rc2
	sta	__rc3
	stx	__rc4
	ldx	__rc24
	lda	__rc23
	jsr	lpoke
	ldx	mos8(g_curScreenW)
	phx
	ply
	dex
	cpy	#0
	bne	.LBB6_2
; %bb.1:
	dec	__rc20
.LBB6_2:
	lda	__rc20
	bne	.LBB6_5
; %bb.3:
	ldy	__rc22
	cpx	__rc21
	bne	.LBB6_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB6_7
.LBB6_5:
	ldy	__rc22
.LBB6_6:
	ldx	__rc21
	inx
.LBB6_7:
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
.Lfunc_end6:
	.size	cputc, .Lfunc_end6-cputc
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
.Lfunc_end7:
	.size	cputhex, .Lfunc_end7-cputhex
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
.Lfunc_end8:
	.size	cputsxy, .Lfunc_end8-cputsxy
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
	bcs	.LBB9_2
; %bb.1:
	clv
.LBB9_2:
	ror	__rc3
	ldy	__rc2
	sty	__rc12
	ror	__rc12
	lsr	__rc8
	ror
	ldy	#1
	bcs	.LBB9_4
; %bb.3:
	ldy	#0
.LBB9_4:
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	phy
	ldy	#1
	bcs	.LBB9_6
; %bb.5:
	ldy	#0
.LBB9_6:
	sty	__rc13
	ply
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	lda	#1
	bcs	.LBB9_8
; %bb.7:
	lda	#0
.LBB9_8:
	sta	__rc8
	ror	__rc3
	lda	__rc12
	ror
	sta	__rc3
	sec
	bvs	.LBB9_10
; %bb.9:
	clc
.LBB9_10:
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
.Lfunc_end9:
	.size	lcopy, .Lfunc_end9-lcopy
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
.Lfunc_end10:
	.size	lfill, .Lfunc_end10-lfill
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB11_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB11_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB11_4
; %bb.3:                                ;   in Loop: Header=BB11_2 Depth=1
	inx
.LBB11_4:                               ;   in Loop: Header=BB11_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB11_2
	bra	.LBB11_6
.LBB11_5:
	stz	__rc4
	ldx	#0
.LBB11_6:
	lda	__rc4
	rts
.Lfunc_end11:
	.size	strlen, .Lfunc_end11-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB12_2
.LBB12_1:                               ;   in Loop: Header=BB12_2 Depth=1
	dex
	asl
.LBB12_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB12_1
; %bb.3:
	rts
.Lfunc_end12:
	.size	__ashlqi3, .Lfunc_end12-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB13_3
; %bb.1:
	ldx	__rc2
.LBB13_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB13_2
.LBB13_3:
	ldx	__rc3
	rts
.Lfunc_end13:
	.size	__ashlhi3, .Lfunc_end13-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB14_3
; %bb.1:
	ldx	__rc4
.LBB14_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB14_2
.LBB14_3:
	ldx	__rc5
	rts
.Lfunc_end14:
	.size	__ashlsi3, .Lfunc_end14-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB15_3
; %bb.1:
	ldx	__rc8
.LBB15_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB15_2
.LBB15_3:
	ldx	__rc9
	rts
.Lfunc_end15:
	.size	__ashldi3, .Lfunc_end15-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB16_2
.LBB16_1:                               ;   in Loop: Header=BB16_2 Depth=1
	dex
	lsr
.LBB16_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB16_1
; %bb.3:
	rts
.Lfunc_end16:
	.size	__lshrqi3, .Lfunc_end16-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB17_3
; %bb.1:
	ldx	__rc2
.LBB17_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB17_2
.LBB17_3:
	ldx	__rc3
	rts
.Lfunc_end17:
	.size	__lshrhi3, .Lfunc_end17-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB18_3
; %bb.1:
	ldx	__rc4
.LBB18_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB18_2
.LBB18_3:
	ldx	__rc5
	rts
.Lfunc_end18:
	.size	__lshrsi3, .Lfunc_end18-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB19_3
; %bb.1:
	ldx	__rc8
.LBB19_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB19_2
.LBB19_3:
	ldx	__rc9
	rts
.Lfunc_end19:
	.size	__lshrdi3, .Lfunc_end19-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB20_2
.LBB20_1:                               ;   in Loop: Header=BB20_2 Depth=1
	dex
	cmp	#128
	ror
.LBB20_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB20_1
; %bb.3:
	rts
.Lfunc_end20:
	.size	__ashrqi3, .Lfunc_end20-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB21_3
; %bb.1:
	ldx	__rc2
.LBB21_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB21_2
.LBB21_3:
	tax
	lda	__rc3
	rts
.Lfunc_end21:
	.size	__ashrhi3, .Lfunc_end21-__ashrhi3
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
	beq	.LBB22_3
; %bb.1:
	ldx	__rc4
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB22_2
.LBB22_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end22:
	.size	__ashrsi3, .Lfunc_end22-__ashrsi3
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
	beq	.LBB23_3
; %bb.1:
	ldx	__rc8
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB23_2
.LBB23_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end23:
	.size	__ashrdi3, .Lfunc_end23-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB24_2
.LBB24_1:                               ;   in Loop: Header=BB24_2 Depth=1
	dex
	cmp	#128
	rol
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB24_1
; %bb.3:
	rts
.Lfunc_end24:
	.size	__rotlqi3, .Lfunc_end24-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
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
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB25_2
.LBB25_3:
	tax
	lda	__rc3
	rts
.Lfunc_end25:
	.size	__rotlhi3, .Lfunc_end25-__rotlhi3
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
	beq	.LBB26_3
; %bb.1:
	ldx	__rc4
.LBB26_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB26_2
.LBB26_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end26:
	.size	__rotlsi3, .Lfunc_end26-__rotlsi3
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
	beq	.LBB27_3
; %bb.1:
	ldx	__rc8
.LBB27_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB27_2
.LBB27_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end27:
	.size	__rotldi3, .Lfunc_end27-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB28_2
.LBB28_1:                               ;   in Loop: Header=BB28_2 Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB28_1
; %bb.3:
	rts
.Lfunc_end28:
	.size	__rotrqi3, .Lfunc_end28-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB29_3
; %bb.1:
	ldx	__rc2
.LBB29_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB29_2
.LBB29_3:
	ldx	__rc3
	rts
.Lfunc_end29:
	.size	__rotrhi3, .Lfunc_end29-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB30_3
; %bb.1:
	ldx	__rc4
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB30_2
.LBB30_3:
	ldx	__rc5
	rts
.Lfunc_end30:
	.size	__rotrsi3, .Lfunc_end30-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB31_3
; %bb.1:
	ldx	__rc8
.LBB31_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB31_2
.LBB31_3:
	ldx	__rc9
	rts
.Lfunc_end31:
	.size	__rotrdi3, .Lfunc_end31-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB32_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB32_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB32_4
; %bb.3:                                ;   in Loop: Header=BB32_2 Depth=1
	clc
	adc	__rc2
.LBB32_4:                               ;   in Loop: Header=BB32_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB32_2
; %bb.5:
	rts
.LBB32_6:
	lda	#0
	rts
.Lfunc_end32:
	.size	__mulqi3, .Lfunc_end32-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB33_2
; %bb.1:
	ldy	__rc2
	beq	.LBB33_7
.LBB33_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB33_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB33_5
; %bb.4:                                ;   in Loop: Header=BB33_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB33_5:                               ;   in Loop: Header=BB33_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB33_3
; %bb.6:                                ;   in Loop: Header=BB33_3 Depth=1
	ldx	__rc2
	bne	.LBB33_3
	bra	.LBB33_8
.LBB33_7:
	ldy	#0
	tya
.LBB33_8:
	tax
	tya
	rts
.Lfunc_end33:
	.size	__mulhi3, .Lfunc_end33-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB34_4
; %bb.1:
	ldy	__rc6
	bne	.LBB34_4
; %bb.2:
	ldy	__rc5
	bne	.LBB34_4
; %bb.3:
	ldy	__rc4
	bne	.LBB34_4
; %bb.13:
	jmp	.LBB34_12
.LBB34_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB34_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB34_7
; %bb.6:                                ;   in Loop: Header=BB34_5 Depth=1
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
.LBB34_7:                               ;   in Loop: Header=BB34_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB34_5
; %bb.8:                                ;   in Loop: Header=BB34_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB34_5
; %bb.9:                                ;   in Loop: Header=BB34_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB34_5
; %bb.10:                               ;   in Loop: Header=BB34_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB34_5
.LBB34_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB34_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB34_11
.Lfunc_end34:
	.size	__mulsi3, .Lfunc_end34-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB35_8
; %bb.1:
	ldy	__rc14
	bne	.LBB35_8
; %bb.2:
	ldy	__rc13
	bne	.LBB35_8
; %bb.3:
	ldy	__rc12
	bne	.LBB35_8
; %bb.4:
	ldy	__rc11
	bne	.LBB35_8
; %bb.5:
	ldy	__rc10
	bne	.LBB35_8
; %bb.6:
	ldy	__rc9
	bne	.LBB35_8
; %bb.7:
	ldy	__rc8
	bne	.LBB35_8
; %bb.21:
	jmp	.LBB35_20
.LBB35_8:
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
.LBB35_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB35_11
; %bb.10:                               ;   in Loop: Header=BB35_9 Depth=1
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
.LBB35_11:                              ;   in Loop: Header=BB35_9 Depth=1
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
	beq	.LBB35_12
; %bb.23:                               ;   in Loop: Header=BB35_9 Depth=1
	jmp	.LBB35_9
.LBB35_12:                              ;   in Loop: Header=BB35_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB35_13
; %bb.25:                               ;   in Loop: Header=BB35_9 Depth=1
	jmp	.LBB35_9
.LBB35_13:                              ;   in Loop: Header=BB35_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB35_14
; %bb.27:                               ;   in Loop: Header=BB35_9 Depth=1
	jmp	.LBB35_9
.LBB35_14:                              ;   in Loop: Header=BB35_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB35_15
; %bb.29:                               ;   in Loop: Header=BB35_9 Depth=1
	jmp	.LBB35_9
.LBB35_15:                              ;   in Loop: Header=BB35_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB35_16
; %bb.31:                               ;   in Loop: Header=BB35_9 Depth=1
	jmp	.LBB35_9
.LBB35_16:                              ;   in Loop: Header=BB35_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB35_17
; %bb.33:                               ;   in Loop: Header=BB35_9 Depth=1
	jmp	.LBB35_9
.LBB35_17:                              ;   in Loop: Header=BB35_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB35_18
; %bb.35:                               ;   in Loop: Header=BB35_9 Depth=1
	jmp	.LBB35_9
.LBB35_18:                              ;   in Loop: Header=BB35_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB35_19
; %bb.37:                               ;   in Loop: Header=BB35_9 Depth=1
	jmp	.LBB35_9
.LBB35_19:
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
.LBB35_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB35_19
.Lfunc_end35:
	.size	__muldi3, .Lfunc_end35-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB36_1
; %bb.15:
	jmp	.LBB36_14
.LBB36_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB36_2
; %bb.17:
	jmp	.LBB36_14
.LBB36_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB36_3
; %bb.19:
	jmp	.LBB36_14
.LBB36_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB36_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB36_6
; %bb.5:                                ;   in Loop: Header=BB36_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB36_8
	bra	.LBB36_7
.LBB36_6:                               ;   in Loop: Header=BB36_4 Depth=1
	cpy	__rc4
	bcc	.LBB36_8
.LBB36_7:                               ;   in Loop: Header=BB36_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB36_4
	bra	.LBB36_9
.LBB36_8:
	ldy	__rc3
	sty	__rc2
.LBB36_9:
	cpx	#0
	beq	.LBB36_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB36_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB36_13
; %bb.12:                               ;   in Loop: Header=BB36_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB36_13:                              ;   in Loop: Header=BB36_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB36_11
.LBB36_14:
	rts
.Lfunc_end36:
	.size	__udivqi3, .Lfunc_end36-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB37_2
; %bb.1:
	ldy	__rc2
	beq	.LBB37_4
.LBB37_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB37_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB37_6
.LBB37_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB37_22
.LBB37_5:
	cmp	__rc3
	bcc	.LBB37_4
.LBB37_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB37_7
; %bb.25:
	jmp	.LBB37_22
.LBB37_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB37_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB37_10
; %bb.9:                                ;   in Loop: Header=BB37_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB37_12
	bra	.LBB37_11
.LBB37_10:                              ;   in Loop: Header=BB37_8 Depth=1
	cmp	__rc6
	bcc	.LBB37_12
.LBB37_11:                              ;   in Loop: Header=BB37_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB37_8
	bra	.LBB37_13
.LBB37_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB37_13:
	cpx	#0
	bne	.LBB37_14
; %bb.27:
	jmp	.LBB37_22
.LBB37_14:
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
.LBB37_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB37_17
; %bb.16:                               ;   in Loop: Header=BB37_15 Depth=1
	ldy	#0
.LBB37_17:                              ;   in Loop: Header=BB37_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB37_21
; %bb.18:                               ;   in Loop: Header=BB37_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB37_20
.LBB37_19:                              ;   in Loop: Header=BB37_15 Depth=1
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
.LBB37_20:                              ;   in Loop: Header=BB37_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB37_15
	bra	.LBB37_22
.LBB37_21:                              ;   in Loop: Header=BB37_15 Depth=1
	cmp	__rc6
	bcs	.LBB37_19
	bra	.LBB37_20
.LBB37_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end37:
	.size	__udivhi3, .Lfunc_end37-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
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
	beq	.LBB38_9
.LBB38_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB38_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB38_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB38_7
; %bb.45:
	jmp	.LBB38_38
.LBB38_7:
	cmp	__rc4
	bcc	.LBB38_9
	bra	.LBB38_11
.LBB38_8:
	cpx	__rc7
	bcs	.LBB38_11
.LBB38_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB38_21
.LBB38_10:
	cpx	__rc6
	bcc	.LBB38_9
.LBB38_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB38_12
; %bb.47:
	jmp	.LBB38_21
.LBB38_12:
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
.LBB38_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB38_17
; %bb.14:                               ;   in Loop: Header=BB38_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB38_18
; %bb.15:                               ;   in Loop: Header=BB38_13 Depth=1
	cmp	__rc10
	bne	.LBB38_19
; %bb.16:                               ;   in Loop: Header=BB38_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB38_23
	bra	.LBB38_20
.LBB38_17:                              ;   in Loop: Header=BB38_13 Depth=1
	cpy	__rc12
	bcc	.LBB38_23
	bra	.LBB38_20
.LBB38_18:                              ;   in Loop: Header=BB38_13 Depth=1
	cpy	__rc11
	bcc	.LBB38_23
	bra	.LBB38_20
.LBB38_19:                              ;   in Loop: Header=BB38_13 Depth=1
	cmp	__rc10
	bcc	.LBB38_23
.LBB38_20:                              ;   in Loop: Header=BB38_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB38_13
	bra	.LBB38_24
.LBB38_21:
	stz	__rc2
	stz	__rc3
.LBB38_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB38_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB38_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB38_22
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
.LBB38_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB38_28
; %bb.27:                               ;   in Loop: Header=BB38_26 Depth=1
	ldy	#0
.LBB38_28:                              ;   in Loop: Header=BB38_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB38_32
; %bb.29:                               ;   in Loop: Header=BB38_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB38_34
; %bb.30:                               ;   in Loop: Header=BB38_26 Depth=1
	cmp	__rc10
	bne	.LBB38_37
; %bb.31:                               ;   in Loop: Header=BB38_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB38_33
	bra	.LBB38_35
.LBB38_32:                              ;   in Loop: Header=BB38_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB38_35
.LBB38_33:                              ;   in Loop: Header=BB38_26 Depth=1
	lda	__rc6
	bra	.LBB38_36
.LBB38_34:                              ;   in Loop: Header=BB38_26 Depth=1
	cpy	__rc11
	bcc	.LBB38_33
.LBB38_35:                              ;   in Loop: Header=BB38_26 Depth=1
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
.LBB38_36:                              ;   in Loop: Header=BB38_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB38_41
; %bb.49:                               ;   in Loop: Header=BB38_26 Depth=1
	jmp	.LBB38_26
.LBB38_41:
	jmp	.LBB38_22
.LBB38_37:                              ;   in Loop: Header=BB38_26 Depth=1
	cmp	__rc10
	bcc	.LBB38_33
	bra	.LBB38_35
.LBB38_38:
	cpx	__rc5
	bcs	.LBB38_43
; %bb.51:
	jmp	.LBB38_9
.LBB38_43:
	jmp	.LBB38_11
.Lfunc_end38:
	.size	__udivsi3, .Lfunc_end38-__udivsi3
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
	bne	.LBB39_8
; %bb.1:
	ldx	__rc14
	bne	.LBB39_8
; %bb.2:
	ldx	__rc13
	bne	.LBB39_8
; %bb.3:
	ldx	__rc12
	bne	.LBB39_8
; %bb.4:
	ldx	__rc11
	bne	.LBB39_8
; %bb.5:
	ldx	__rc10
	bne	.LBB39_8
; %bb.6:
	ldx	__rc9
	bne	.LBB39_8
; %bb.7:
	ldx	__rc8
	beq	.LBB39_17
.LBB39_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB39_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB39_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB39_11
; %bb.90:
	jmp	.LBB39_31
.LBB39_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB39_12
; %bb.92:
	jmp	.LBB39_32
.LBB39_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB39_13
; %bb.94:
	jmp	.LBB39_38
.LBB39_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB39_14
; %bb.96:
	jmp	.LBB39_40
.LBB39_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB39_15
; %bb.98:
	jmp	.LBB39_42
.LBB39_15:
	cmp	__rc8
	bcc	.LBB39_17
	bra	.LBB39_19
.LBB39_16:
	cpx	__rc15
	bcs	.LBB39_19
.LBB39_17:
	lda	#0
; %bb.66:
	jmp	.LBB39_29
.LBB39_18:
	cpx	__rc14
	bcc	.LBB39_17
.LBB39_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB39_20
; %bb.100:
	jmp	.LBB39_29
.LBB39_20:
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
.LBB39_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB39_25
; %bb.22:                               ;   in Loop: Header=BB39_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB39_26
; %bb.23:                               ;   in Loop: Header=BB39_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB39_27
; %bb.24:                               ;   in Loop: Header=BB39_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB39_102
; %bb.150:                              ;   in Loop: Header=BB39_21 Depth=1
	jmp	.LBB39_33
.LBB39_102:                             ;   in Loop: Header=BB39_21 Depth=1
	jmp	.LBB39_37
.LBB39_25:                              ;   in Loop: Header=BB39_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB39_28
; %bb.104:
	jmp	.LBB39_44
.LBB39_26:                              ;   in Loop: Header=BB39_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB39_28
; %bb.106:
	jmp	.LBB39_44
.LBB39_27:                              ;   in Loop: Header=BB39_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB39_28
; %bb.108:
	jmp	.LBB39_44
.LBB39_28:                              ;   in Loop: Header=BB39_21 Depth=1
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
	bmi	.LBB39_68
; %bb.110:                              ;   in Loop: Header=BB39_21 Depth=1
	jmp	.LBB39_21
.LBB39_68:
	jmp	.LBB39_45
.LBB39_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB39_30:
	ldx	__rc18
	rts
.LBB39_31:
	cpx	__rc13
	bcs	.LBB39_70
; %bb.112:
	jmp	.LBB39_17
.LBB39_70:
	jmp	.LBB39_19
.LBB39_32:
	cpx	__rc12
	bcs	.LBB39_72
; %bb.114:
	jmp	.LBB39_17
.LBB39_72:
	jmp	.LBB39_19
.LBB39_33:                              ;   in Loop: Header=BB39_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB39_39
; %bb.34:                               ;   in Loop: Header=BB39_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB39_41
; %bb.35:                               ;   in Loop: Header=BB39_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB39_43
; %bb.36:                               ;   in Loop: Header=BB39_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB39_44
; %bb.74:                               ;   in Loop: Header=BB39_21 Depth=1
	jmp	.LBB39_28
.LBB39_37:                              ;   in Loop: Header=BB39_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB39_44
; %bb.76:                               ;   in Loop: Header=BB39_21 Depth=1
	jmp	.LBB39_28
.LBB39_38:
	cpx	__rc11
	bcs	.LBB39_78
; %bb.116:
	jmp	.LBB39_17
.LBB39_78:
	jmp	.LBB39_19
.LBB39_39:                              ;   in Loop: Header=BB39_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB39_44
; %bb.80:                               ;   in Loop: Header=BB39_21 Depth=1
	jmp	.LBB39_28
.LBB39_40:
	cpx	__rc10
	bcs	.LBB39_82
; %bb.118:
	jmp	.LBB39_17
.LBB39_82:
	jmp	.LBB39_19
.LBB39_41:                              ;   in Loop: Header=BB39_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB39_44
; %bb.84:                               ;   in Loop: Header=BB39_21 Depth=1
	jmp	.LBB39_28
.LBB39_42:
	cpx	__rc9
	bcs	.LBB39_86
; %bb.120:
	jmp	.LBB39_17
.LBB39_86:
	jmp	.LBB39_19
.LBB39_43:                              ;   in Loop: Header=BB39_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB39_44
; %bb.122:                              ;   in Loop: Header=BB39_21 Depth=1
	jmp	.LBB39_28
.LBB39_44:
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
.LBB39_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB39_46
; %bb.124:
	jmp	.LBB39_30
.LBB39_46:
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
.LBB39_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB39_49
; %bb.48:                               ;   in Loop: Header=BB39_47 Depth=1
	ldy	#0
.LBB39_49:                              ;   in Loop: Header=BB39_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB39_57
; %bb.50:                               ;   in Loop: Header=BB39_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB39_51
; %bb.126:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_60
.LBB39_51:                              ;   in Loop: Header=BB39_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB39_52
; %bb.128:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_61
.LBB39_52:                              ;   in Loop: Header=BB39_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB39_53
; %bb.130:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_62
.LBB39_53:                              ;   in Loop: Header=BB39_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB39_54
; %bb.132:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_63
.LBB39_54:                              ;   in Loop: Header=BB39_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB39_55
; %bb.134:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_64
.LBB39_55:                              ;   in Loop: Header=BB39_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB39_56
; %bb.136:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_65
.LBB39_56:                              ;   in Loop: Header=BB39_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB39_58
	bra	.LBB39_59
.LBB39_57:                              ;   in Loop: Header=BB39_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB39_59
.LBB39_58:                              ;   in Loop: Header=BB39_47 Depth=1
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
.LBB39_59:                              ;   in Loop: Header=BB39_47 Depth=1
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
	beq	.LBB39_88
; %bb.138:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_47
.LBB39_88:
	jmp	.LBB39_30
.LBB39_60:                              ;   in Loop: Header=BB39_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB39_58
	bra	.LBB39_59
.LBB39_61:                              ;   in Loop: Header=BB39_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB39_59
; %bb.140:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_58
.LBB39_62:                              ;   in Loop: Header=BB39_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB39_59
; %bb.142:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_58
.LBB39_63:                              ;   in Loop: Header=BB39_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB39_59
; %bb.144:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_58
.LBB39_64:                              ;   in Loop: Header=BB39_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB39_59
; %bb.146:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_58
.LBB39_65:                              ;   in Loop: Header=BB39_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB39_59
; %bb.148:                              ;   in Loop: Header=BB39_47 Depth=1
	jmp	.LBB39_58
.Lfunc_end39:
	.size	__udivdi3, .Lfunc_end39-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB40_1
; %bb.15:
	jmp	.LBB40_13
.LBB40_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB40_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB40_14
; %bb.3:
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
	cmp	__rc2
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
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB40_13
.LBB40_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB40_12
; %bb.11:                               ;   in Loop: Header=BB40_10 Depth=1
	sec
	sbc	__rc2
.LBB40_12:                              ;   in Loop: Header=BB40_10 Depth=1
	dex
	bne	.LBB40_10
.LBB40_13:
	rts
.LBB40_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end40:
	.size	__umodqi3, .Lfunc_end40-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB41_2
; %bb.1:
	ldx	__rc2
	bne	.LBB41_2
; %bb.22:
	jmp	.LBB41_19
.LBB41_2:
	cmp	__rc3
	bne	.LBB41_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB41_5
; %bb.20:
	jmp	.LBB41_19
.LBB41_4:
	cmp	__rc3
	bcs	.LBB41_5
; %bb.24:
	jmp	.LBB41_19
.LBB41_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB41_6
; %bb.26:
	jmp	.LBB41_18
.LBB41_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB41_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB41_9
; %bb.8:                                ;   in Loop: Header=BB41_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB41_11
	bra	.LBB41_10
.LBB41_9:                               ;   in Loop: Header=BB41_7 Depth=1
	cmp	__rc5
	bcc	.LBB41_11
.LBB41_10:                              ;   in Loop: Header=BB41_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB41_7
	bra	.LBB41_12
.LBB41_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB41_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB41_19
.LBB41_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB41_17
; %bb.14:                               ;   in Loop: Header=BB41_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB41_16
.LBB41_15:                              ;   in Loop: Header=BB41_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB41_16:                              ;   in Loop: Header=BB41_13 Depth=1
	dex
	bne	.LBB41_13
	bra	.LBB41_19
.LBB41_17:                              ;   in Loop: Header=BB41_13 Depth=1
	cmp	__rc5
	bcs	.LBB41_15
	bra	.LBB41_16
.LBB41_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB41_19:
	tax
	tya
	rts
.Lfunc_end41:
	.size	__umodhi3, .Lfunc_end41-__umodhi3
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
	bne	.LBB42_4
; %bb.1:
	ldx	__rc6
	bne	.LBB42_4
; %bb.2:
	ldx	__rc5
	bne	.LBB42_4
; %bb.3:
	ldx	__rc4
	bne	.LBB42_4
; %bb.42:
	jmp	.LBB42_35
.LBB42_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB42_8
; %bb.5:
	cmp	__rc6
	bne	.LBB42_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB42_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB42_11
; %bb.36:
	jmp	.LBB42_35
.LBB42_8:
	cpx	__rc7
	bcs	.LBB42_11
; %bb.38:
	jmp	.LBB42_35
.LBB42_9:
	cmp	__rc6
	bcs	.LBB42_11
; %bb.40:
	jmp	.LBB42_35
.LBB42_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB42_11
; %bb.44:
	jmp	.LBB42_35
.LBB42_11:
	ldx	__rc7
	bpl	.LBB42_12
; %bb.46:
	jmp	.LBB42_33
.LBB42_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB42_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB42_17
; %bb.14:                               ;   in Loop: Header=BB42_13 Depth=1
	cmp	__rc8
	bne	.LBB42_18
; %bb.15:                               ;   in Loop: Header=BB42_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB42_19
; %bb.16:                               ;   in Loop: Header=BB42_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB42_21
	bra	.LBB42_20
.LBB42_17:                              ;   in Loop: Header=BB42_13 Depth=1
	cpy	__rc9
	bcc	.LBB42_21
	bra	.LBB42_20
.LBB42_18:                              ;   in Loop: Header=BB42_13 Depth=1
	cmp	__rc8
	bcc	.LBB42_21
	bra	.LBB42_20
.LBB42_19:                              ;   in Loop: Header=BB42_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB42_21
.LBB42_20:                              ;   in Loop: Header=BB42_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB42_13
	bra	.LBB42_22
.LBB42_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB42_22:
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
	bne	.LBB42_23
; %bb.48:
	jmp	.LBB42_34
.LBB42_23:
	tya
.LBB42_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB42_28
; %bb.25:                               ;   in Loop: Header=BB42_24 Depth=1
	cmp	__rc8
	bne	.LBB42_31
; %bb.26:                               ;   in Loop: Header=BB42_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB42_32
; %bb.27:                               ;   in Loop: Header=BB42_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB42_29
	bra	.LBB42_30
.LBB42_28:                              ;   in Loop: Header=BB42_24 Depth=1
	cpy	__rc9
	bcc	.LBB42_30
.LBB42_29:                              ;   in Loop: Header=BB42_24 Depth=1
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
.LBB42_30:                              ;   in Loop: Header=BB42_24 Depth=1
	dex
	bne	.LBB42_24
	bra	.LBB42_35
.LBB42_31:                              ;   in Loop: Header=BB42_24 Depth=1
	cmp	__rc8
	bcs	.LBB42_29
	bra	.LBB42_30
.LBB42_32:                              ;   in Loop: Header=BB42_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB42_29
	bra	.LBB42_30
.LBB42_33:
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
	bra	.LBB42_35
.LBB42_34:
	tya
.LBB42_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end42:
	.size	__umodsi3, .Lfunc_end42-__umodsi3
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
	bne	.LBB43_8
; %bb.90:
	jmp	.LBB43_61
.LBB43_8:
	cmp	__rc15
	bne	.LBB43_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB43_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB43_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB43_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB43_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB43_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB43_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB43_23
; %bb.62:
	jmp	.LBB43_61
.LBB43_16:
	cmp	__rc15
	bcs	.LBB43_23
; %bb.64:
	jmp	.LBB43_61
.LBB43_17:
	cpx	__rc14
	bcs	.LBB43_23
; %bb.66:
	jmp	.LBB43_61
.LBB43_18:
	cpx	__rc13
	bcs	.LBB43_23
; %bb.68:
	jmp	.LBB43_61
.LBB43_19:
	cpx	__rc12
	bcs	.LBB43_23
; %bb.70:
	jmp	.LBB43_61
.LBB43_20:
	cpx	__rc11
	bcs	.LBB43_23
; %bb.72:
	jmp	.LBB43_61
.LBB43_21:
	cpx	__rc10
	bcs	.LBB43_23
; %bb.74:
	jmp	.LBB43_61
.LBB43_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB43_23
; %bb.92:
	jmp	.LBB43_61
.LBB43_23:
	ldx	__rc15
	bpl	.LBB43_24
; %bb.94:
	jmp	.LBB43_33
.LBB43_24:
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
.LBB43_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB43_29
; %bb.26:                               ;   in Loop: Header=BB43_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB43_30
; %bb.27:                               ;   in Loop: Header=BB43_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB43_31
; %bb.28:                               ;   in Loop: Header=BB43_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB43_76
; %bb.96:                               ;   in Loop: Header=BB43_25 Depth=1
	jmp	.LBB43_38
.LBB43_76:                              ;   in Loop: Header=BB43_25 Depth=1
	jmp	.LBB43_34
.LBB43_29:                              ;   in Loop: Header=BB43_25 Depth=1
	cmp	__rc19
	bcs	.LBB43_32
; %bb.98:
	jmp	.LBB43_42
.LBB43_30:                              ;   in Loop: Header=BB43_25 Depth=1
	cpy	__rc18
	bcs	.LBB43_32
; %bb.100:
	jmp	.LBB43_42
.LBB43_31:                              ;   in Loop: Header=BB43_25 Depth=1
	cpy	__rc7
	bcs	.LBB43_32
; %bb.102:
	jmp	.LBB43_42
.LBB43_32:                              ;   in Loop: Header=BB43_25 Depth=1
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
	bmi	.LBB43_78
; %bb.104:                              ;   in Loop: Header=BB43_25 Depth=1
	jmp	.LBB43_25
.LBB43_78:
	jmp	.LBB43_43
.LBB43_33:
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
	jmp	.LBB43_61
.LBB43_34:                              ;   in Loop: Header=BB43_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB43_39
; %bb.35:                               ;   in Loop: Header=BB43_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB43_40
; %bb.36:                               ;   in Loop: Header=BB43_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB43_41
; %bb.37:                               ;   in Loop: Header=BB43_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB43_42
; %bb.82:                               ;   in Loop: Header=BB43_25 Depth=1
	jmp	.LBB43_32
.LBB43_38:                              ;   in Loop: Header=BB43_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB43_42
; %bb.84:                               ;   in Loop: Header=BB43_25 Depth=1
	jmp	.LBB43_32
.LBB43_39:                              ;   in Loop: Header=BB43_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB43_42
; %bb.86:                               ;   in Loop: Header=BB43_25 Depth=1
	jmp	.LBB43_32
.LBB43_40:                              ;   in Loop: Header=BB43_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB43_42
; %bb.88:                               ;   in Loop: Header=BB43_25 Depth=1
	jmp	.LBB43_32
.LBB43_41:                              ;   in Loop: Header=BB43_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB43_42
; %bb.106:                              ;   in Loop: Header=BB43_25 Depth=1
	jmp	.LBB43_32
.LBB43_42:
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
.LBB43_43:
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
	bne	.LBB43_44
; %bb.108:
	jmp	.LBB43_61
.LBB43_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB43_52
; %bb.45:                               ;   in Loop: Header=BB43_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB43_46
; %bb.110:                              ;   in Loop: Header=BB43_44 Depth=1
	jmp	.LBB43_55
.LBB43_46:                              ;   in Loop: Header=BB43_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB43_47
; %bb.112:                              ;   in Loop: Header=BB43_44 Depth=1
	jmp	.LBB43_56
.LBB43_47:                              ;   in Loop: Header=BB43_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB43_48
; %bb.114:                              ;   in Loop: Header=BB43_44 Depth=1
	jmp	.LBB43_57
.LBB43_48:                              ;   in Loop: Header=BB43_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB43_49
; %bb.116:                              ;   in Loop: Header=BB43_44 Depth=1
	jmp	.LBB43_58
.LBB43_49:                              ;   in Loop: Header=BB43_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB43_50
; %bb.118:                              ;   in Loop: Header=BB43_44 Depth=1
	jmp	.LBB43_59
.LBB43_50:                              ;   in Loop: Header=BB43_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB43_51
; %bb.120:                              ;   in Loop: Header=BB43_44 Depth=1
	jmp	.LBB43_60
.LBB43_51:                              ;   in Loop: Header=BB43_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB43_53
	bra	.LBB43_54
.LBB43_52:                              ;   in Loop: Header=BB43_44 Depth=1
	cmp	__rc19
	bcc	.LBB43_54
.LBB43_53:                              ;   in Loop: Header=BB43_44 Depth=1
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
.LBB43_54:                              ;   in Loop: Header=BB43_44 Depth=1
	dex
	beq	.LBB43_61
; %bb.122:                              ;   in Loop: Header=BB43_44 Depth=1
	jmp	.LBB43_44
.LBB43_55:                              ;   in Loop: Header=BB43_44 Depth=1
	cpy	__rc18
	bcs	.LBB43_53
	bra	.LBB43_54
.LBB43_56:                              ;   in Loop: Header=BB43_44 Depth=1
	cpy	__rc7
	bcs	.LBB43_53
	bra	.LBB43_54
.LBB43_57:                              ;   in Loop: Header=BB43_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB43_53
	bra	.LBB43_54
.LBB43_58:                              ;   in Loop: Header=BB43_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB43_53
	bra	.LBB43_54
.LBB43_59:                              ;   in Loop: Header=BB43_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB43_53
	bra	.LBB43_54
.LBB43_60:                              ;   in Loop: Header=BB43_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB43_54
; %bb.124:                              ;   in Loop: Header=BB43_44 Depth=1
	jmp	.LBB43_53
.LBB43_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end43:
	.size	__umoddi3, .Lfunc_end43-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB44_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB44_2
; %bb.18:
	jmp	.LBB44_17
.LBB44_2:
	lda	__rc5
	bpl	.LBB44_3
; %bb.20:
	jmp	.LBB44_15
.LBB44_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB44_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB44_6
; %bb.5:                                ;   in Loop: Header=BB44_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB44_9
	bra	.LBB44_7
.LBB44_6:                               ;   in Loop: Header=BB44_4 Depth=1
	cpy	__rc6
	bcc	.LBB44_9
.LBB44_7:                               ;   in Loop: Header=BB44_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB44_4
	bra	.LBB44_10
.LBB44_8:
	sty	__rc7
	bra	.LBB44_17
.LBB44_9:
	ldy	__rc5
	sty	__rc4
.LBB44_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB44_16
; %bb.11:
	lda	#1
.LBB44_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB44_14
; %bb.13:                               ;   in Loop: Header=BB44_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB44_14:                              ;   in Loop: Header=BB44_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB44_12
	bra	.LBB44_17
.LBB44_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB44_16:
	lda	#1
.LBB44_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end44:
	.size	__udivmodqi4, .Lfunc_end44-__udivmodqi4
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
	bne	.LBB45_2
; %bb.1:
	ldx	__rc2
	beq	.LBB45_4
.LBB45_2:
	cmp	__rc3
	bne	.LBB45_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB45_6
.LBB45_4:
	ldx	#0
; %bb.26:
	jmp	.LBB45_24
.LBB45_5:
	cmp	__rc3
	bcc	.LBB45_4
.LBB45_6:
	tay
	ldx	__rc3
	bpl	.LBB45_7
; %bb.28:
	jmp	.LBB45_22
.LBB45_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB45_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB45_10
; %bb.9:                                ;   in Loop: Header=BB45_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB45_11
	bra	.LBB45_12
.LBB45_10:                              ;   in Loop: Header=BB45_8 Depth=1
	cmp	__rc8
	bcc	.LBB45_12
.LBB45_11:                              ;   in Loop: Header=BB45_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB45_8
	bra	.LBB45_13
.LBB45_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB45_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB45_14
; %bb.30:
	jmp	.LBB45_23
.LBB45_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB45_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB45_17
; %bb.16:                               ;   in Loop: Header=BB45_15 Depth=1
	ldy	#0
.LBB45_17:                              ;   in Loop: Header=BB45_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB45_21
; %bb.18:                               ;   in Loop: Header=BB45_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB45_20
.LBB45_19:                              ;   in Loop: Header=BB45_15 Depth=1
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
.LBB45_20:                              ;   in Loop: Header=BB45_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB45_15
	bra	.LBB45_25
.LBB45_21:                              ;   in Loop: Header=BB45_15 Depth=1
	cmp	__rc8
	bcs	.LBB45_19
	bra	.LBB45_20
.LBB45_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB45_23:
	ldx	#1
.LBB45_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB45_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end45:
	.size	__udivmodhi4, .Lfunc_end45-__udivmodhi4
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
	bpl	.LBB46_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB46_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB46_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB46_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB46_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB46_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB46_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB46_8:
	lda	__rc2
	rts
.Lfunc_end46:
	.size	__divqi3, .Lfunc_end46-__divqi3
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
	bmi	.LBB47_2
; %bb.1:
	bra	.LBB47_6
.LBB47_2:
	cpx	#128
	bne	.LBB47_5
; %bb.3:
	lda	__rc4
	bne	.LBB47_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB47_6
.LBB47_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB47_6:
	tya
	bmi	.LBB47_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB47_12
.LBB47_8:
	cpy	#128
	bne	.LBB47_11
; %bb.9:
	lda	__rc2
	bne	.LBB47_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB47_12
.LBB47_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB47_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB47_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB47_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end47:
	.size	__divhi3, .Lfunc_end47-__divhi3
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
	bmi	.LBB48_2
; %bb.1:
	ldy	__rc3
	bra	.LBB48_8
.LBB48_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB48_7
; %bb.3:
	lda	__rc2
	bne	.LBB48_7
; %bb.4:
	lda	__rc8
	bne	.LBB48_7
; %bb.5:
	lda	__rc9
	bne	.LBB48_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB48_8
.LBB48_7:
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
.LBB48_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB48_10
; %bb.9:
	lda	__rc7
	bra	.LBB48_16
.LBB48_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB48_15
; %bb.11:
	lda	__rc6
	bne	.LBB48_15
; %bb.12:
	lda	__rc5
	bne	.LBB48_15
; %bb.13:
	lda	__rc4
	bne	.LBB48_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB48_16
.LBB48_15:
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
.LBB48_16:
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
	bne	.LBB48_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB48_19
.LBB48_18:
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
.LBB48_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end48:
	.size	__divsi3, .Lfunc_end48-__divsi3
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
	bmi	.LBB49_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB49_12
.LBB49_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB49_11
; %bb.3:
	lda	__rc6
	bne	.LBB49_11
; %bb.4:
	lda	__rc5
	bne	.LBB49_11
; %bb.5:
	lda	__rc4
	bne	.LBB49_11
; %bb.6:
	lda	__rc3
	bne	.LBB49_11
; %bb.7:
	lda	__rc2
	bne	.LBB49_11
; %bb.8:
	lda	__rc18
	bne	.LBB49_11
; %bb.9:
	lda	__rc19
	bne	.LBB49_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB49_12
.LBB49_11:
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
.LBB49_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB49_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB49_24
.LBB49_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB49_23
; %bb.15:
	lda	__rc14
	bne	.LBB49_23
; %bb.16:
	lda	__rc13
	bne	.LBB49_23
; %bb.17:
	lda	__rc12
	bne	.LBB49_23
; %bb.18:
	lda	__rc11
	bne	.LBB49_23
; %bb.19:
	lda	__rc10
	bne	.LBB49_23
; %bb.20:
	lda	__rc9
	bne	.LBB49_23
; %bb.21:
	lda	__rc8
	bne	.LBB49_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB49_24
.LBB49_23:
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
.LBB49_24:
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
	bne	.LBB49_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB49_27
.LBB49_26:
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
.LBB49_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end49:
	.size	__divdi3, .Lfunc_end49-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB50_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB50_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB50_3:
	tay
	lda	__rc2
	bmi	.LBB50_5
; %bb.4:
	lda	__rc2
	bra	.LBB50_7
.LBB50_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB50_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB50_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB50_9
; %bb.8:
	rts
.LBB50_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end50:
	.size	__modqi3, .Lfunc_end50-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB51_2
; %bb.1:
	txa
	bra	.LBB51_6
.LBB51_2:
	cpx	#128
	bne	.LBB51_5
; %bb.3:
	lda	__rc4
	bne	.LBB51_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB51_6
.LBB51_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB51_6:
	ldx	__rc3
	bpl	.LBB51_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB51_10
; %bb.8:
	ldx	__rc2
	bne	.LBB51_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB51_11
.LBB51_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB51_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB51_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB51_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end51:
	.size	__modhi3, .Lfunc_end51-__modhi3
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
	bmi	.LBB52_2
; %bb.1:
	lda	__rc3
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
	lda	#128
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
	sbc	mos8(.L__modsi3_zp_stk)
.LBB52_8:
	ldx	__rc7
	bpl	.LBB52_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB52_14
; %bb.10:
	ldx	__rc6
	bne	.LBB52_14
; %bb.11:
	ldx	__rc5
	bne	.LBB52_14
; %bb.12:
	ldx	__rc4
	bne	.LBB52_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB52_15
.LBB52_14:
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
.LBB52_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB52_17
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
.LBB52_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end52:
	.size	__modsi3, .Lfunc_end52-__modsi3
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
	bmi	.LBB53_2
; %bb.1:
	lda	__rc7
; %bb.26:
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
	lda	#128
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
	sbc	mos8(.L__moddi3_zp_stk)
.LBB53_12:
	ldx	__rc15
	bmi	.LBB53_13
; %bb.28:
	jmp	.LBB53_23
.LBB53_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB53_22
; %bb.14:
	ldx	__rc14
	bne	.LBB53_22
; %bb.15:
	ldx	__rc13
	bne	.LBB53_22
; %bb.16:
	ldx	__rc12
	bne	.LBB53_22
; %bb.17:
	ldx	__rc11
	bne	.LBB53_22
; %bb.18:
	ldx	__rc10
	bne	.LBB53_22
; %bb.19:
	ldx	__rc9
	bne	.LBB53_22
; %bb.20:
	ldx	__rc8
	bne	.LBB53_22
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
	bra	.LBB53_23
.LBB53_22:
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
.LBB53_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB53_25
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
.LBB53_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end53:
	.size	__moddi3, .Lfunc_end53-__moddi3
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
	bpl	.LBB54_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB54_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB54_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB54_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB54_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB54_11
.LBB54_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB54_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB54_8
; %bb.34:
	jmp	.LBB54_24
.LBB54_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB54_24
.LBB54_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB54_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB54_12
.LBB54_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB54_24
.LBB54_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB54_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB54_15
; %bb.14:                               ;   in Loop: Header=BB54_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB54_18
	bra	.LBB54_16
.LBB54_15:                              ;   in Loop: Header=BB54_13 Depth=1
	cmp	__rc7
	bcc	.LBB54_18
.LBB54_16:                              ;   in Loop: Header=BB54_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB54_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB54_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB54_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB54_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB54_22
; %bb.21:                               ;   in Loop: Header=BB54_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB54_22:                              ;   in Loop: Header=BB54_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB54_20
	bra	.LBB54_24
.LBB54_23:
	sta	__rc7
	sty	__rc6
.LBB54_24:
	lda	__rc4
	bmi	.LBB54_26
; %bb.25:
	lda	__rc7
	bra	.LBB54_27
.LBB54_26:
	lda	#0
	sec
	sbc	__rc7
.LBB54_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB54_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB54_29:
	lda	__rc6
	rts
.Lfunc_end54:
	.size	__divmodqi4, .Lfunc_end54-__divmodqi4
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
	bmi	.LBB55_2
.LBB55_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB55_6
.LBB55_2:
	cpx	#128
	bne	.LBB55_5
; %bb.3:
	lda	__rc7
	bne	.LBB55_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB55_1
.LBB55_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB55_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB55_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB55_15
; %bb.8:
	lda	__rc2
	bne	.LBB55_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB55_18
.LBB55_10:
	cpy	#128
	bne	.LBB55_14
; %bb.11:
	ldy	__rc2
	bne	.LBB55_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB55_13
; %bb.48:
	jmp	.LBB55_45
.LBB55_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB55_18
.LBB55_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB55_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB55_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB55_20
.LBB55_17:
	sta	__rc11
.LBB55_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB55_39
.LBB55_19:
	cmp	__rc7
	bcc	.LBB55_17
.LBB55_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB55_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB55_23
; %bb.22:                               ;   in Loop: Header=BB55_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB55_24
	bra	.LBB55_26
.LBB55_23:                              ;   in Loop: Header=BB55_21 Depth=1
	cmp	__rc9
	bcc	.LBB55_26
.LBB55_24:                              ;   in Loop: Header=BB55_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB55_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB55_27
.LBB55_26:
	tay
.LBB55_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB55_28
; %bb.50:
	jmp	.LBB55_37
.LBB55_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB55_32
.LBB55_29:                              ;   in Loop: Header=BB55_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB55_36
.LBB55_30:                              ;   in Loop: Header=BB55_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB55_31:                              ;   in Loop: Header=BB55_32 Depth=1
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
	beq	.LBB55_39
.LBB55_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB55_34
; %bb.33:                               ;   in Loop: Header=BB55_32 Depth=1
	ldy	#0
.LBB55_34:                              ;   in Loop: Header=BB55_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB55_29
; %bb.35:                               ;   in Loop: Header=BB55_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB55_30
.LBB55_36:                              ;   in Loop: Header=BB55_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB55_31
.LBB55_37:
	sta	__rc11
	ldx	#1
.LBB55_38:
	stx	__rc9
.LBB55_39:
	lda	__rc6
	bmi	.LBB55_41
; %bb.40:
	lda	__rc10
	bra	.LBB55_42
.LBB55_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB55_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB55_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB55_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB55_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB55_38
.Lfunc_end55:
	.size	__divmodhi4, .Lfunc_end55-__divmodhi4
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB56_2
; %bb.1:
	tya
	beq	.LBB56_11
.LBB56_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB56_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB56_5
; %bb.4:                                ;   in Loop: Header=BB56_3 Depth=1
	inc	__rc7
.LBB56_5:                               ;   in Loop: Header=BB56_3 Depth=1
	inc	__rc4
	bne	.LBB56_7
; %bb.6:                                ;   in Loop: Header=BB56_3 Depth=1
	inc	__rc5
.LBB56_7:                               ;   in Loop: Header=BB56_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB56_9
; %bb.8:                                ;   in Loop: Header=BB56_3 Depth=1
	dex
.LBB56_9:                               ;   in Loop: Header=BB56_3 Depth=1
	txa
	bne	.LBB56_3
; %bb.10:                               ;   in Loop: Header=BB56_3 Depth=1
	tya
	bne	.LBB56_3
.LBB56_11:
	rts
.Lfunc_end56:
	.size	memcpy, .Lfunc_end56-memcpy
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
.Lfunc_end57:
	.size	memset, .Lfunc_end57-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB58_4
.LBB58_1:                               ;   in Loop: Header=BB58_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB58_3
; %bb.2:                                ;   in Loop: Header=BB58_4 Depth=1
	inc	__rc3
.LBB58_3:                               ;   in Loop: Header=BB58_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB58_7
.LBB58_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB58_1
; %bb.5:                                ;   in Loop: Header=BB58_4 Depth=1
	cpx	#0
	bne	.LBB58_1
; %bb.6:
	rts
.LBB58_7:                               ;   in Loop: Header=BB58_4 Depth=1
	dec	__rc4
	jmp	.LBB58_4
.Lfunc_end58:
	.size	__memset, .Lfunc_end58-__memset
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
	beq	.LBB59_1
; %bb.15:
	jmp	.LBB59_13
.LBB59_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB59_2
; %bb.17:
	jmp	.LBB59_14
.LBB59_2:
	lda	__rc7
	bne	.LBB59_4
; %bb.3:
	lda	__rc6
	beq	.LBB59_12
.LBB59_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB59_6
; %bb.5:                                ;   in Loop: Header=BB59_4 Depth=1
	dec	__rc9
.LBB59_6:                               ;   in Loop: Header=BB59_4 Depth=1
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
	bne	.LBB59_8
; %bb.7:                                ;   in Loop: Header=BB59_4 Depth=1
	dec	__rc11
.LBB59_8:                               ;   in Loop: Header=BB59_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB59_10
; %bb.9:                                ;   in Loop: Header=BB59_4 Depth=1
	dex
.LBB59_10:                              ;   in Loop: Header=BB59_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB59_4
; %bb.11:                               ;   in Loop: Header=BB59_4 Depth=1
	tya
	bne	.LBB59_4
.LBB59_12:
	rts
.LBB59_13:
	cpx	__rc3
	bcs	.LBB59_14
; %bb.19:
	jmp	.LBB59_2
.LBB59_14:
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
.Lfunc_end59:
	.size	memmove, .Lfunc_end59-memmove
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

	.type	worksector,@object              ; @worksector
	.section	.zp.bss.worksector,"aw",@nobits
worksector:
	.zero	4
	.size	worksector, 4

	.type	ptrMiniOffs,@object             ; @ptrMiniOffs
	.section	.zp.bss.ptrMiniOffs,"aw",@nobits
ptrMiniOffs:
	.long	0                               ; 0x0
	.size	ptrMiniOffs, 4

	.type	i,@object                       ; @i
	.section	.zp.bss.i,"aw",@nobits
i:
	.byte	0                               ; 0x0
	.size	i, 1

	.type	.L.str.17,@object               ; @.str.17
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.17:
	.asciz	" is: "
	.size	.L.str.17, 6

	.type	workside,@object                ; @workside
	.section	.zp.bss.workside,"aw",@nobits
workside:
	.byte	0                               ; 0x0
	.size	workside, 1

	.type	.L.str.34,@object               ; @.str.34
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.34:
	.asciz	" workside "
	.size	.L.str.34, 11

	.type	.L.str.41,@object               ; @.str.41
.L.str.41:
	.asciz	"nexttrack "
	.size	.L.str.41, 11

	.type	.L.str.42,@object               ; @.str.42
.L.str.42:
	.asciz	" nextsector "
	.size	.L.str.42, 13

	.type	.L.str.43,@object               ; @.str.43
.L.str.43:
	.asciz	" block "
	.size	.L.str.43, 8

	.type	.L.str.44,@object               ; @.str.44
.L.str.44:
	.asciz	" worksector[workside]: "
	.size	.L.str.44, 24

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

	.type	.L.str.47,@object               ; @.str.47
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.47:
	.asciz	"UPPERCASE lowercase."
	.size	.L.str.47, 21

	.type	.L.str.48,@object               ; @.str.48
.L.str.48:
	.asciz	"hyppo_setname is: "
	.size	.L.str.48, 19

	.type	.L.str.49,@object               ; @.str.49
.L.str.49:
	.asciz	"DATADISK.d81"
	.size	.L.str.49, 13

	.type	.L.str.50,@object               ; @.str.50
.L.str.50:
	.asciz	" hyppofn: "
	.size	.L.str.50, 11

	.type	.L.str.51,@object               ; @.str.51
.L.str.51:
	.asciz	"DATADISK.D81"
	.size	.L.str.51, 13

	.type	.L.str.52,@object               ; @.str.52
.L.str.52:
	.asciz	" hyppo_d81attach1 is: "
	.size	.L.str.52, 23

	.type	.L.str.53,@object               ; @.str.53
.L.str.53:
	.asciz	"hyppo_selectdrive "
	.size	.L.str.53, 19

	.type	.L.str.54,@object               ; @.str.54
.L.str.54:
	.asciz	"hyppo_getcurrentdrive is: "
	.size	.L.str.54, 27

	.type	.L.str.55,@object               ; @.str.55
.L.str.55:
	.asciz	"hyppo_opendir, file descriptor is: "
	.size	.L.str.55, 36

	.type	.L.str.56,@object               ; @.str.56
.L.str.56:
	.asciz	"hyppo_readdir, err is: "
	.size	.L.str.56, 24

	.type	.L.str.57,@object               ; @.str.57
.L.str.57:
	.asciz	"filename is: "
	.size	.L.str.57, 14

	.type	.L.str.58,@object               ; @.str.58
.L.str.58:
	.asciz	"filenamelength is: "
	.size	.L.str.58, 20

	.type	.L.str.59,@object               ; @.str.59
.L.str.59:
	.asciz	"hyppo_closedir is: "
	.size	.L.str.59, 20

	.type	.L.str.60,@object               ; @.str.60
.L.str.60:
	.asciz	"dirent in attic done."
	.size	.L.str.60, 22

	.type	.L.str.61,@object               ; @.str.61
.L.str.61:
	.asciz	"Have fun with your Mega65!"
	.size	.L.str.61, 27

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

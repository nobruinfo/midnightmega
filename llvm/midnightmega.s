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
	.section	.text.main,"ax",@progbits
	.globl	main                            ; -- Begin function main
	.type	main,@function
main:                                   ; @main
; %bb.0:
	clc
	lda	__rc0
	adc	#253
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
	ldy	#2
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc25
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc26
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
	bpl	.LBB0_2
; %bb.1:
	ldx	#80
.LBB0_2:
	ldy	#mos16lo(dmalist)
	sty	__rc2
	ldy	#mos16hi(dmalist)
	sty	__rc3
	stx	mos8(g_curScreenW)
	lda	53297
	and	#8
	beq	.LBB0_4
; %bb.3:
	ldx	#50
	bra	.LBB0_5
.LBB0_4:
	ldx	#25
.LBB0_5:
	stx	g_curScreenH
	bra	.LBB0_7
.LBB0_6:                                ;   in Loop: Header=BB0_7 Depth=1
	stz	54800
.LBB0_7:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB0_6
; %bb.8:
	ldx	__rc2
	stx	__rc24
	ldx	#52
	stx	__rc20
	ldx	#3
	stx	__rc21
	ldx	#255
	ldy	#mos16lo(escapeCode)
	sty	__rc2
	ldy	#mos16hi(escapeCode)
	sty	__rc3
	ldy	#1
.LBB0_9:                                ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB0_11
; %bb.10:                               ;   in Loop: Header=BB0_9 Depth=1
	inc	__rc5
.LBB0_11:                               ;   in Loop: Header=BB0_9 Depth=1
	lda	#mos16hi(escNOP)
	sta	(__rc4),y
	dex
	bne	.LBB0_9
; %bb.12:
	ldx	#mos16lo(.L.str.27)
	stx	__rc22
	ldx	#mos16hi(.L.str.27)
	stx	__rc23
	ldx	mos8(g_curScreenW)
	stz	__rc3
	lda	g_curScreenH
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
	stx	__rc25
	ldx	__rc6
	stx	__rc26
	ldx	__rc7
	tya
	jsr	lfill
	ldx	#11
	stx	dmalist
	ldx	#128
	stx	dmalist+1
	stz	dmalist+2
	inx
	stx	dmalist+3
	ldx	#255
	stx	dmalist+4
	ldx	#133
	stx	dmalist+5
	ldy	#1
	sty	dmalist+6
	stz	dmalist+7
	ldx	#3
	stx	dmalist+8
	stz	dmalist+17
	ldx	__rc25
	stx	dmalist+9
	ldx	__rc26
	stx	dmalist+10
	sty	dmalist+11
	stz	dmalist+12
	stz	dmalist+14
	stz	dmalist+15
	ldx	#8
	stx	dmalist+16
	ldx	#71
	stx	53295
	ldx	#83
	stx	53295
	ldx	#65
	stx	0
	stz	55042
	stz	55044
	ldx	#mos16hi(dmalist)
	stx	55041
	ldx	#0
	ldy	__rc24
	sty	55045
	stz	g_curX
	stz	g_curY
	ldy	#97
	sty	fnamehi
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
	sta	__rc24
	jmp	done04
error04:
	lda	#255
	sta	__rc24
done04:
	nop

	;NO_APP
	bra	.LBB0_19
.LBB0_13:                               ;   in Loop: Header=BB0_19 Depth=1
	cmp	#192
	bcc	.LBB0_15
; %bb.14:                               ;   in Loop: Header=BB0_19 Depth=1
	eor	#128
	bra	.LBB0_16
.LBB0_15:                               ;   in Loop: Header=BB0_19 Depth=1
	clc
	adc	#224
.LBB0_16:                               ;   in Loop: Header=BB0_19 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB0_18
; %bb.17:                               ;   in Loop: Header=BB0_19 Depth=1
	inc	__rc3
.LBB0_18:                               ;   in Loop: Header=BB0_19 Depth=1
	tax
	beq	.LBB0_24
.LBB0_19:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB0_21
; %bb.20:                               ;   in Loop: Header=BB0_19 Depth=1
	inc	__rc23
.LBB0_21:                               ;   in Loop: Header=BB0_19 Depth=1
	cmp	#64
	bcc	.LBB0_16
; %bb.22:                               ;   in Loop: Header=BB0_19 Depth=1
	cmp	#96
	bcs	.LBB0_13
; %bb.23:                               ;   in Loop: Header=BB0_19 Depth=1
	clc
	adc	#192
	bra	.LBB0_16
.LBB0_24:
	ldx	#mos16lo(.L.str.29)
	stx	__rc22
	ldx	#mos16hi(.L.str.29)
	stx	__rc23
	lda	g_curX
	ldx	g_curY
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
	sta	__rc24
	jmp	done06
error06:
	lda	#255
	sta	__rc24
done06:
	nop

	;NO_APP
	bra	.LBB0_31
.LBB0_25:                               ;   in Loop: Header=BB0_31 Depth=1
	cmp	#192
	bcc	.LBB0_27
; %bb.26:                               ;   in Loop: Header=BB0_31 Depth=1
	eor	#128
	bra	.LBB0_28
.LBB0_27:                               ;   in Loop: Header=BB0_31 Depth=1
	clc
	adc	#224
.LBB0_28:                               ;   in Loop: Header=BB0_31 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB0_30
; %bb.29:                               ;   in Loop: Header=BB0_31 Depth=1
	inc	__rc3
.LBB0_30:                               ;   in Loop: Header=BB0_31 Depth=1
	tax
	beq	.LBB0_36
.LBB0_31:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB0_33
; %bb.32:                               ;   in Loop: Header=BB0_31 Depth=1
	inc	__rc23
.LBB0_33:                               ;   in Loop: Header=BB0_31 Depth=1
	cmp	#64
	bcc	.LBB0_28
; %bb.34:                               ;   in Loop: Header=BB0_31 Depth=1
	cmp	#96
	bcs	.LBB0_25
; %bb.35:                               ;   in Loop: Header=BB0_31 Depth=1
	clc
	adc	#192
	bra	.LBB0_28
.LBB0_36:
	lda	g_curX
	ldx	g_curY
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc20
	stz	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc24
	jsr	cputhex
	stz	g_curX
	inc	g_curY
	lda	#40
	ldx	#0
	sta	__rc16
	ldy	#0
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
	adc	#3
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end1:
	.size	escNOP, .Lfunc_end1-escNOP
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
	bne	.LBB2_2
; %bb.1:
	inc	__rc3
.LBB2_2:
	stz	__rc4
	lda	#48
	ldx	#6
	jsr	__memset
	ldx	mos8(.Lcputhex_zp_stk+13)       ; 1-byte Folded Reload
	lda	hexDigits,x
	tax
	stx	mos8(.Lcputhex_zp_stk+7)
	lda	mos8(.Lcputhex_zp_stk+12)       ; 1-byte Folded Reload
	and	#15
	tax
	lda	hexDigits,x
	tax
	stx	mos8(.Lcputhex_zp_stk+8)
	stz	mos8(.Lcputhex_zp_stk+9)
	ldx	#36
	stx	mos8(.Lcputhex_zp_stk+4)
	lda	g_curX
	ldx	g_curY
	ldy	mos8(.Lcputhex_zp_stk+10)       ; 1-byte Folded Reload
	sty	__rc2
	ldy	mos8(.Lcputhex_zp_stk+11)       ; 1-byte Folded Reload
	sty	__rc3
	jmp	cputsxy
.Lfunc_end2:
	.size	cputhex, .Lfunc_end2-cputhex
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
	ldx	#mos16lo(dmalist)
	stx	__rc2
	ldx	#mos16hi(dmalist)
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
	stx	dmalist
	ldx	#128
	stx	dmalist+1
	stz	dmalist+2
	inx
	stx	dmalist+3
	sta	dmalist+4
	ldx	#133
	stx	dmalist+5
	ldx	#1
	stx	dmalist+6
	stz	dmalist+7
	stz	dmalist+17
	stz	dmalist+8
	ldy	mos8(.Lcputsxy_zp_stk+2)        ; 1-byte Folded Reload
	sty	dmalist+9
	stz	dmalist+10
	stz	dmalist+17
	ldy	mos8(.Lcputsxy_zp_stk+3)        ; 1-byte Folded Reload
	sty	__rc2
	ldy	mos8(.Lcputsxy_zp_stk+4)        ; 1-byte Folded Reload
	sty	__rc3
	ldy	__rc2
	sty	dmalist+11
	ldy	__rc3
	sty	dmalist+12
	stz	dmalist+13
	ldy	__rc5
	sty	dmalist+14
	ldy	__rc6
	sty	dmalist+15
	lda	__rc4
	and	#15
	sta	dmalist+16
	ldy	#71
	sty	53295
	ldy	#83
	sty	53295
	ldy	#65
	sty	0
	stz	55042
	stz	55044
	ldy	#mos16hi(dmalist)
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
	sta	g_curY
	stx	g_curX
	rts
.Lfunc_end3:
	.size	cputsxy, .Lfunc_end3-cputsxy
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
	sta	dmalist
	lda	#128
	sta	dmalist+1
	stz	dmalist+2
	inc
	sta	dmalist+3
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
	sta	dmalist+4
	lda	#133
	sta	dmalist+5
	lda	#1
	sta	dmalist+6
	stz	dmalist+7
	lda	#3
	sta	dmalist+8
	stz	dmalist+17
	stx	dmalist+9
	sty	dmalist+10
	ldx	__rc4
	stx	dmalist+11
	stz	dmalist+12
	ldx	__rc7
	stx	dmalist+14
	ldx	#mos16hi(dmalist)
	ldy	#mos16lo(dmalist)
	sty	__rc4
	ldy	#mos16hi(dmalist)
	sty	__rc5
	ldy	__rc8
	sty	dmalist+15
	ldy	__rc4
	lda	__rc2
	and	#15
	sta	dmalist+16
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
.Lfunc_end4:
	.size	lfill, .Lfunc_end4-lfill
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB5_2
; %bb.1:
	tya
	beq	.LBB5_11
.LBB5_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB5_3:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB5_5
; %bb.4:                                ;   in Loop: Header=BB5_3 Depth=1
	inc	__rc7
.LBB5_5:                                ;   in Loop: Header=BB5_3 Depth=1
	inc	__rc4
	bne	.LBB5_7
; %bb.6:                                ;   in Loop: Header=BB5_3 Depth=1
	inc	__rc5
.LBB5_7:                                ;   in Loop: Header=BB5_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB5_9
; %bb.8:                                ;   in Loop: Header=BB5_3 Depth=1
	dex
.LBB5_9:                                ;   in Loop: Header=BB5_3 Depth=1
	txa
	bne	.LBB5_3
; %bb.10:                               ;   in Loop: Header=BB5_3 Depth=1
	tya
	bne	.LBB5_3
.LBB5_11:
	rts
.Lfunc_end5:
	.size	memcpy, .Lfunc_end5-memcpy
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
.Lfunc_end6:
	.size	memset, .Lfunc_end6-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB7_4
.LBB7_1:                                ;   in Loop: Header=BB7_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB7_3
; %bb.2:                                ;   in Loop: Header=BB7_4 Depth=1
	inc	__rc3
.LBB7_3:                                ;   in Loop: Header=BB7_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB7_7
.LBB7_4:                                ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB7_1
; %bb.5:                                ;   in Loop: Header=BB7_4 Depth=1
	cpx	#0
	bne	.LBB7_1
; %bb.6:
	rts
.LBB7_7:                                ;   in Loop: Header=BB7_4 Depth=1
	dec	__rc4
	jmp	.LBB7_4
.Lfunc_end7:
	.size	__memset, .Lfunc_end7-__memset
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
	beq	.LBB8_1
; %bb.15:
	jmp	.LBB8_13
.LBB8_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB8_2
; %bb.17:
	jmp	.LBB8_14
.LBB8_2:
	lda	__rc7
	bne	.LBB8_4
; %bb.3:
	lda	__rc6
	beq	.LBB8_12
.LBB8_4:                                ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB8_6
; %bb.5:                                ;   in Loop: Header=BB8_4 Depth=1
	dec	__rc9
.LBB8_6:                                ;   in Loop: Header=BB8_4 Depth=1
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
	bne	.LBB8_8
; %bb.7:                                ;   in Loop: Header=BB8_4 Depth=1
	dec	__rc11
.LBB8_8:                                ;   in Loop: Header=BB8_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB8_10
; %bb.9:                                ;   in Loop: Header=BB8_4 Depth=1
	dex
.LBB8_10:                               ;   in Loop: Header=BB8_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB8_4
; %bb.11:                               ;   in Loop: Header=BB8_4 Depth=1
	tya
	bne	.LBB8_4
.LBB8_12:
	rts
.LBB8_13:
	cpx	__rc3
	bcs	.LBB8_14
; %bb.19:
	jmp	.LBB8_2
.LBB8_14:
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
.Lfunc_end8:
	.size	memmove, .Lfunc_end8-memmove
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB9_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB9_2:                                ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB9_4
; %bb.3:                                ;   in Loop: Header=BB9_2 Depth=1
	inx
.LBB9_4:                                ;   in Loop: Header=BB9_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB9_2
	bra	.LBB9_6
.LBB9_5:
	stz	__rc4
	ldx	#0
.LBB9_6:
	lda	__rc4
	rts
.Lfunc_end9:
	.size	strlen, .Lfunc_end9-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB10_2
.LBB10_1:                               ;   in Loop: Header=BB10_2 Depth=1
	dex
	asl
.LBB10_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB10_1
; %bb.3:
	rts
.Lfunc_end10:
	.size	__ashlqi3, .Lfunc_end10-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB11_3
; %bb.1:
	ldx	__rc2
.LBB11_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB11_2
.LBB11_3:
	ldx	__rc3
	rts
.Lfunc_end11:
	.size	__ashlhi3, .Lfunc_end11-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB12_3
; %bb.1:
	ldx	__rc4
.LBB12_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB12_2
.LBB12_3:
	ldx	__rc5
	rts
.Lfunc_end12:
	.size	__ashlsi3, .Lfunc_end12-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB13_3
; %bb.1:
	ldx	__rc8
.LBB13_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB13_2
.LBB13_3:
	ldx	__rc9
	rts
.Lfunc_end13:
	.size	__ashldi3, .Lfunc_end13-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB14_2
.LBB14_1:                               ;   in Loop: Header=BB14_2 Depth=1
	dex
	lsr
.LBB14_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB14_1
; %bb.3:
	rts
.Lfunc_end14:
	.size	__lshrqi3, .Lfunc_end14-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB15_3
; %bb.1:
	ldx	__rc2
.LBB15_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB15_2
.LBB15_3:
	ldx	__rc3
	rts
.Lfunc_end15:
	.size	__lshrhi3, .Lfunc_end15-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB16_3
; %bb.1:
	ldx	__rc4
.LBB16_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB16_2
.LBB16_3:
	ldx	__rc5
	rts
.Lfunc_end16:
	.size	__lshrsi3, .Lfunc_end16-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB17_3
; %bb.1:
	ldx	__rc8
.LBB17_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB17_2
.LBB17_3:
	ldx	__rc9
	rts
.Lfunc_end17:
	.size	__lshrdi3, .Lfunc_end17-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB18_2
.LBB18_1:                               ;   in Loop: Header=BB18_2 Depth=1
	dex
	cmp	#128
	ror
.LBB18_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB18_1
; %bb.3:
	rts
.Lfunc_end18:
	.size	__ashrqi3, .Lfunc_end18-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB19_3
; %bb.1:
	ldx	__rc2
.LBB19_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB19_2
.LBB19_3:
	tax
	lda	__rc3
	rts
.Lfunc_end19:
	.size	__ashrhi3, .Lfunc_end19-__ashrhi3
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
	beq	.LBB20_3
; %bb.1:
	ldx	__rc4
.LBB20_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB20_2
.LBB20_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end20:
	.size	__ashrsi3, .Lfunc_end20-__ashrsi3
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
	beq	.LBB21_3
; %bb.1:
	ldx	__rc8
.LBB21_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB21_2
.LBB21_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end21:
	.size	__ashrdi3, .Lfunc_end21-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB22_2
.LBB22_1:                               ;   in Loop: Header=BB22_2 Depth=1
	dex
	cmp	#128
	rol
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB22_1
; %bb.3:
	rts
.Lfunc_end22:
	.size	__rotlqi3, .Lfunc_end22-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
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
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB23_2
.LBB23_3:
	tax
	lda	__rc3
	rts
.Lfunc_end23:
	.size	__rotlhi3, .Lfunc_end23-__rotlhi3
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
	beq	.LBB24_3
; %bb.1:
	ldx	__rc4
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB24_2
.LBB24_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end24:
	.size	__rotlsi3, .Lfunc_end24-__rotlsi3
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
	beq	.LBB25_3
; %bb.1:
	ldx	__rc8
.LBB25_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB25_2
.LBB25_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end25:
	.size	__rotldi3, .Lfunc_end25-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB26_2
.LBB26_1:                               ;   in Loop: Header=BB26_2 Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror
.LBB26_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB26_1
; %bb.3:
	rts
.Lfunc_end26:
	.size	__rotrqi3, .Lfunc_end26-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB27_3
; %bb.1:
	ldx	__rc2
.LBB27_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB27_2
.LBB27_3:
	ldx	__rc3
	rts
.Lfunc_end27:
	.size	__rotrhi3, .Lfunc_end27-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB28_3
; %bb.1:
	ldx	__rc4
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB28_2
.LBB28_3:
	ldx	__rc5
	rts
.Lfunc_end28:
	.size	__rotrsi3, .Lfunc_end28-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB29_3
; %bb.1:
	ldx	__rc8
.LBB29_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB29_2
.LBB29_3:
	ldx	__rc9
	rts
.Lfunc_end29:
	.size	__rotrdi3, .Lfunc_end29-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB30_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB30_4
; %bb.3:                                ;   in Loop: Header=BB30_2 Depth=1
	clc
	adc	__rc2
.LBB30_4:                               ;   in Loop: Header=BB30_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB30_2
; %bb.5:
	rts
.LBB30_6:
	lda	#0
	rts
.Lfunc_end30:
	.size	__mulqi3, .Lfunc_end30-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB31_2
; %bb.1:
	ldy	__rc2
	beq	.LBB31_7
.LBB31_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB31_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB31_5
; %bb.4:                                ;   in Loop: Header=BB31_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB31_5:                               ;   in Loop: Header=BB31_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB31_3
; %bb.6:                                ;   in Loop: Header=BB31_3 Depth=1
	ldx	__rc2
	bne	.LBB31_3
	bra	.LBB31_8
.LBB31_7:
	ldy	#0
	tya
.LBB31_8:
	tax
	tya
	rts
.Lfunc_end31:
	.size	__mulhi3, .Lfunc_end31-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB32_4
; %bb.1:
	ldy	__rc6
	bne	.LBB32_4
; %bb.2:
	ldy	__rc5
	bne	.LBB32_4
; %bb.3:
	ldy	__rc4
	bne	.LBB32_4
; %bb.13:
	jmp	.LBB32_12
.LBB32_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB32_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB32_7
; %bb.6:                                ;   in Loop: Header=BB32_5 Depth=1
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
.LBB32_7:                               ;   in Loop: Header=BB32_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB32_5
; %bb.8:                                ;   in Loop: Header=BB32_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB32_5
; %bb.9:                                ;   in Loop: Header=BB32_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB32_5
; %bb.10:                               ;   in Loop: Header=BB32_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB32_5
.LBB32_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB32_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB32_11
.Lfunc_end32:
	.size	__mulsi3, .Lfunc_end32-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB33_8
; %bb.1:
	ldy	__rc14
	bne	.LBB33_8
; %bb.2:
	ldy	__rc13
	bne	.LBB33_8
; %bb.3:
	ldy	__rc12
	bne	.LBB33_8
; %bb.4:
	ldy	__rc11
	bne	.LBB33_8
; %bb.5:
	ldy	__rc10
	bne	.LBB33_8
; %bb.6:
	ldy	__rc9
	bne	.LBB33_8
; %bb.7:
	ldy	__rc8
	bne	.LBB33_8
; %bb.21:
	jmp	.LBB33_20
.LBB33_8:
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
.LBB33_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB33_11
; %bb.10:                               ;   in Loop: Header=BB33_9 Depth=1
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
.LBB33_11:                              ;   in Loop: Header=BB33_9 Depth=1
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
	beq	.LBB33_12
; %bb.23:                               ;   in Loop: Header=BB33_9 Depth=1
	jmp	.LBB33_9
.LBB33_12:                              ;   in Loop: Header=BB33_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB33_13
; %bb.25:                               ;   in Loop: Header=BB33_9 Depth=1
	jmp	.LBB33_9
.LBB33_13:                              ;   in Loop: Header=BB33_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB33_14
; %bb.27:                               ;   in Loop: Header=BB33_9 Depth=1
	jmp	.LBB33_9
.LBB33_14:                              ;   in Loop: Header=BB33_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB33_15
; %bb.29:                               ;   in Loop: Header=BB33_9 Depth=1
	jmp	.LBB33_9
.LBB33_15:                              ;   in Loop: Header=BB33_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB33_16
; %bb.31:                               ;   in Loop: Header=BB33_9 Depth=1
	jmp	.LBB33_9
.LBB33_16:                              ;   in Loop: Header=BB33_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB33_17
; %bb.33:                               ;   in Loop: Header=BB33_9 Depth=1
	jmp	.LBB33_9
.LBB33_17:                              ;   in Loop: Header=BB33_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB33_18
; %bb.35:                               ;   in Loop: Header=BB33_9 Depth=1
	jmp	.LBB33_9
.LBB33_18:                              ;   in Loop: Header=BB33_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB33_19
; %bb.37:                               ;   in Loop: Header=BB33_9 Depth=1
	jmp	.LBB33_9
.LBB33_19:
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
.LBB33_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB33_19
.Lfunc_end33:
	.size	__muldi3, .Lfunc_end33-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB34_1
; %bb.15:
	jmp	.LBB34_14
.LBB34_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB34_2
; %bb.17:
	jmp	.LBB34_14
.LBB34_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB34_3
; %bb.19:
	jmp	.LBB34_14
.LBB34_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB34_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB34_6
; %bb.5:                                ;   in Loop: Header=BB34_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB34_8
	bra	.LBB34_7
.LBB34_6:                               ;   in Loop: Header=BB34_4 Depth=1
	cpy	__rc4
	bcc	.LBB34_8
.LBB34_7:                               ;   in Loop: Header=BB34_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB34_4
	bra	.LBB34_9
.LBB34_8:
	ldy	__rc3
	sty	__rc2
.LBB34_9:
	cpx	#0
	beq	.LBB34_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB34_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB34_13
; %bb.12:                               ;   in Loop: Header=BB34_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB34_13:                              ;   in Loop: Header=BB34_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB34_11
.LBB34_14:
	rts
.Lfunc_end34:
	.size	__udivqi3, .Lfunc_end34-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB35_2
; %bb.1:
	ldy	__rc2
	beq	.LBB35_4
.LBB35_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB35_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB35_6
.LBB35_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB35_22
.LBB35_5:
	cmp	__rc3
	bcc	.LBB35_4
.LBB35_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB35_7
; %bb.25:
	jmp	.LBB35_22
.LBB35_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB35_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB35_10
; %bb.9:                                ;   in Loop: Header=BB35_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB35_12
	bra	.LBB35_11
.LBB35_10:                              ;   in Loop: Header=BB35_8 Depth=1
	cmp	__rc6
	bcc	.LBB35_12
.LBB35_11:                              ;   in Loop: Header=BB35_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB35_8
	bra	.LBB35_13
.LBB35_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB35_13:
	cpx	#0
	bne	.LBB35_14
; %bb.27:
	jmp	.LBB35_22
.LBB35_14:
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
.LBB35_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB35_17
; %bb.16:                               ;   in Loop: Header=BB35_15 Depth=1
	ldy	#0
.LBB35_17:                              ;   in Loop: Header=BB35_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB35_21
; %bb.18:                               ;   in Loop: Header=BB35_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB35_20
.LBB35_19:                              ;   in Loop: Header=BB35_15 Depth=1
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
.LBB35_20:                              ;   in Loop: Header=BB35_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB35_15
	bra	.LBB35_22
.LBB35_21:                              ;   in Loop: Header=BB35_15 Depth=1
	cmp	__rc6
	bcs	.LBB35_19
	bra	.LBB35_20
.LBB35_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end35:
	.size	__udivhi3, .Lfunc_end35-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
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
	beq	.LBB36_9
.LBB36_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB36_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB36_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB36_7
; %bb.45:
	jmp	.LBB36_38
.LBB36_7:
	cmp	__rc4
	bcc	.LBB36_9
	bra	.LBB36_11
.LBB36_8:
	cpx	__rc7
	bcs	.LBB36_11
.LBB36_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB36_21
.LBB36_10:
	cpx	__rc6
	bcc	.LBB36_9
.LBB36_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB36_12
; %bb.47:
	jmp	.LBB36_21
.LBB36_12:
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
.LBB36_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB36_17
; %bb.14:                               ;   in Loop: Header=BB36_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB36_18
; %bb.15:                               ;   in Loop: Header=BB36_13 Depth=1
	cmp	__rc10
	bne	.LBB36_19
; %bb.16:                               ;   in Loop: Header=BB36_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB36_23
	bra	.LBB36_20
.LBB36_17:                              ;   in Loop: Header=BB36_13 Depth=1
	cpy	__rc12
	bcc	.LBB36_23
	bra	.LBB36_20
.LBB36_18:                              ;   in Loop: Header=BB36_13 Depth=1
	cpy	__rc11
	bcc	.LBB36_23
	bra	.LBB36_20
.LBB36_19:                              ;   in Loop: Header=BB36_13 Depth=1
	cmp	__rc10
	bcc	.LBB36_23
.LBB36_20:                              ;   in Loop: Header=BB36_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB36_13
	bra	.LBB36_24
.LBB36_21:
	stz	__rc2
	stz	__rc3
.LBB36_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB36_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB36_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB36_22
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
.LBB36_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB36_28
; %bb.27:                               ;   in Loop: Header=BB36_26 Depth=1
	ldy	#0
.LBB36_28:                              ;   in Loop: Header=BB36_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB36_32
; %bb.29:                               ;   in Loop: Header=BB36_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB36_34
; %bb.30:                               ;   in Loop: Header=BB36_26 Depth=1
	cmp	__rc10
	bne	.LBB36_37
; %bb.31:                               ;   in Loop: Header=BB36_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB36_33
	bra	.LBB36_35
.LBB36_32:                              ;   in Loop: Header=BB36_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB36_35
.LBB36_33:                              ;   in Loop: Header=BB36_26 Depth=1
	lda	__rc6
	bra	.LBB36_36
.LBB36_34:                              ;   in Loop: Header=BB36_26 Depth=1
	cpy	__rc11
	bcc	.LBB36_33
.LBB36_35:                              ;   in Loop: Header=BB36_26 Depth=1
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
.LBB36_36:                              ;   in Loop: Header=BB36_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB36_41
; %bb.49:                               ;   in Loop: Header=BB36_26 Depth=1
	jmp	.LBB36_26
.LBB36_41:
	jmp	.LBB36_22
.LBB36_37:                              ;   in Loop: Header=BB36_26 Depth=1
	cmp	__rc10
	bcc	.LBB36_33
	bra	.LBB36_35
.LBB36_38:
	cpx	__rc5
	bcs	.LBB36_43
; %bb.51:
	jmp	.LBB36_9
.LBB36_43:
	jmp	.LBB36_11
.Lfunc_end36:
	.size	__udivsi3, .Lfunc_end36-__udivsi3
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
	bne	.LBB37_8
; %bb.1:
	ldx	__rc14
	bne	.LBB37_8
; %bb.2:
	ldx	__rc13
	bne	.LBB37_8
; %bb.3:
	ldx	__rc12
	bne	.LBB37_8
; %bb.4:
	ldx	__rc11
	bne	.LBB37_8
; %bb.5:
	ldx	__rc10
	bne	.LBB37_8
; %bb.6:
	ldx	__rc9
	bne	.LBB37_8
; %bb.7:
	ldx	__rc8
	beq	.LBB37_17
.LBB37_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB37_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB37_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB37_11
; %bb.90:
	jmp	.LBB37_31
.LBB37_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB37_12
; %bb.92:
	jmp	.LBB37_32
.LBB37_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB37_13
; %bb.94:
	jmp	.LBB37_38
.LBB37_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB37_14
; %bb.96:
	jmp	.LBB37_40
.LBB37_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB37_15
; %bb.98:
	jmp	.LBB37_42
.LBB37_15:
	cmp	__rc8
	bcc	.LBB37_17
	bra	.LBB37_19
.LBB37_16:
	cpx	__rc15
	bcs	.LBB37_19
.LBB37_17:
	lda	#0
; %bb.66:
	jmp	.LBB37_29
.LBB37_18:
	cpx	__rc14
	bcc	.LBB37_17
.LBB37_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB37_20
; %bb.100:
	jmp	.LBB37_29
.LBB37_20:
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
.LBB37_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB37_25
; %bb.22:                               ;   in Loop: Header=BB37_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB37_26
; %bb.23:                               ;   in Loop: Header=BB37_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB37_27
; %bb.24:                               ;   in Loop: Header=BB37_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB37_102
; %bb.150:                              ;   in Loop: Header=BB37_21 Depth=1
	jmp	.LBB37_33
.LBB37_102:                             ;   in Loop: Header=BB37_21 Depth=1
	jmp	.LBB37_37
.LBB37_25:                              ;   in Loop: Header=BB37_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB37_28
; %bb.104:
	jmp	.LBB37_44
.LBB37_26:                              ;   in Loop: Header=BB37_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB37_28
; %bb.106:
	jmp	.LBB37_44
.LBB37_27:                              ;   in Loop: Header=BB37_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB37_28
; %bb.108:
	jmp	.LBB37_44
.LBB37_28:                              ;   in Loop: Header=BB37_21 Depth=1
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
	bmi	.LBB37_68
; %bb.110:                              ;   in Loop: Header=BB37_21 Depth=1
	jmp	.LBB37_21
.LBB37_68:
	jmp	.LBB37_45
.LBB37_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB37_30:
	ldx	__rc18
	rts
.LBB37_31:
	cpx	__rc13
	bcs	.LBB37_70
; %bb.112:
	jmp	.LBB37_17
.LBB37_70:
	jmp	.LBB37_19
.LBB37_32:
	cpx	__rc12
	bcs	.LBB37_72
; %bb.114:
	jmp	.LBB37_17
.LBB37_72:
	jmp	.LBB37_19
.LBB37_33:                              ;   in Loop: Header=BB37_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB37_39
; %bb.34:                               ;   in Loop: Header=BB37_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB37_41
; %bb.35:                               ;   in Loop: Header=BB37_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB37_43
; %bb.36:                               ;   in Loop: Header=BB37_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB37_44
; %bb.74:                               ;   in Loop: Header=BB37_21 Depth=1
	jmp	.LBB37_28
.LBB37_37:                              ;   in Loop: Header=BB37_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB37_44
; %bb.76:                               ;   in Loop: Header=BB37_21 Depth=1
	jmp	.LBB37_28
.LBB37_38:
	cpx	__rc11
	bcs	.LBB37_78
; %bb.116:
	jmp	.LBB37_17
.LBB37_78:
	jmp	.LBB37_19
.LBB37_39:                              ;   in Loop: Header=BB37_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB37_44
; %bb.80:                               ;   in Loop: Header=BB37_21 Depth=1
	jmp	.LBB37_28
.LBB37_40:
	cpx	__rc10
	bcs	.LBB37_82
; %bb.118:
	jmp	.LBB37_17
.LBB37_82:
	jmp	.LBB37_19
.LBB37_41:                              ;   in Loop: Header=BB37_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB37_44
; %bb.84:                               ;   in Loop: Header=BB37_21 Depth=1
	jmp	.LBB37_28
.LBB37_42:
	cpx	__rc9
	bcs	.LBB37_86
; %bb.120:
	jmp	.LBB37_17
.LBB37_86:
	jmp	.LBB37_19
.LBB37_43:                              ;   in Loop: Header=BB37_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB37_44
; %bb.122:                              ;   in Loop: Header=BB37_21 Depth=1
	jmp	.LBB37_28
.LBB37_44:
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
.LBB37_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB37_46
; %bb.124:
	jmp	.LBB37_30
.LBB37_46:
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
.LBB37_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB37_49
; %bb.48:                               ;   in Loop: Header=BB37_47 Depth=1
	ldy	#0
.LBB37_49:                              ;   in Loop: Header=BB37_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB37_57
; %bb.50:                               ;   in Loop: Header=BB37_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB37_51
; %bb.126:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_60
.LBB37_51:                              ;   in Loop: Header=BB37_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB37_52
; %bb.128:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_61
.LBB37_52:                              ;   in Loop: Header=BB37_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB37_53
; %bb.130:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_62
.LBB37_53:                              ;   in Loop: Header=BB37_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB37_54
; %bb.132:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_63
.LBB37_54:                              ;   in Loop: Header=BB37_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB37_55
; %bb.134:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_64
.LBB37_55:                              ;   in Loop: Header=BB37_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB37_56
; %bb.136:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_65
.LBB37_56:                              ;   in Loop: Header=BB37_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB37_58
	bra	.LBB37_59
.LBB37_57:                              ;   in Loop: Header=BB37_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB37_59
.LBB37_58:                              ;   in Loop: Header=BB37_47 Depth=1
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
.LBB37_59:                              ;   in Loop: Header=BB37_47 Depth=1
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
	beq	.LBB37_88
; %bb.138:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_47
.LBB37_88:
	jmp	.LBB37_30
.LBB37_60:                              ;   in Loop: Header=BB37_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB37_58
	bra	.LBB37_59
.LBB37_61:                              ;   in Loop: Header=BB37_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB37_59
; %bb.140:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_58
.LBB37_62:                              ;   in Loop: Header=BB37_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB37_59
; %bb.142:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_58
.LBB37_63:                              ;   in Loop: Header=BB37_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB37_59
; %bb.144:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_58
.LBB37_64:                              ;   in Loop: Header=BB37_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB37_59
; %bb.146:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_58
.LBB37_65:                              ;   in Loop: Header=BB37_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB37_59
; %bb.148:                              ;   in Loop: Header=BB37_47 Depth=1
	jmp	.LBB37_58
.Lfunc_end37:
	.size	__udivdi3, .Lfunc_end37-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB38_1
; %bb.15:
	jmp	.LBB38_13
.LBB38_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB38_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB38_14
; %bb.3:
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
	cmp	__rc2
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
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB38_13
.LBB38_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB38_12
; %bb.11:                               ;   in Loop: Header=BB38_10 Depth=1
	sec
	sbc	__rc2
.LBB38_12:                              ;   in Loop: Header=BB38_10 Depth=1
	dex
	bne	.LBB38_10
.LBB38_13:
	rts
.LBB38_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end38:
	.size	__umodqi3, .Lfunc_end38-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB39_2
; %bb.1:
	ldx	__rc2
	bne	.LBB39_2
; %bb.22:
	jmp	.LBB39_19
.LBB39_2:
	cmp	__rc3
	bne	.LBB39_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB39_5
; %bb.20:
	jmp	.LBB39_19
.LBB39_4:
	cmp	__rc3
	bcs	.LBB39_5
; %bb.24:
	jmp	.LBB39_19
.LBB39_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB39_6
; %bb.26:
	jmp	.LBB39_18
.LBB39_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB39_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB39_9
; %bb.8:                                ;   in Loop: Header=BB39_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB39_11
	bra	.LBB39_10
.LBB39_9:                               ;   in Loop: Header=BB39_7 Depth=1
	cmp	__rc5
	bcc	.LBB39_11
.LBB39_10:                              ;   in Loop: Header=BB39_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB39_7
	bra	.LBB39_12
.LBB39_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB39_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB39_19
.LBB39_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB39_17
; %bb.14:                               ;   in Loop: Header=BB39_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB39_16
.LBB39_15:                              ;   in Loop: Header=BB39_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB39_16:                              ;   in Loop: Header=BB39_13 Depth=1
	dex
	bne	.LBB39_13
	bra	.LBB39_19
.LBB39_17:                              ;   in Loop: Header=BB39_13 Depth=1
	cmp	__rc5
	bcs	.LBB39_15
	bra	.LBB39_16
.LBB39_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB39_19:
	tax
	tya
	rts
.Lfunc_end39:
	.size	__umodhi3, .Lfunc_end39-__umodhi3
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
	bne	.LBB40_4
; %bb.1:
	ldx	__rc6
	bne	.LBB40_4
; %bb.2:
	ldx	__rc5
	bne	.LBB40_4
; %bb.3:
	ldx	__rc4
	bne	.LBB40_4
; %bb.42:
	jmp	.LBB40_35
.LBB40_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB40_8
; %bb.5:
	cmp	__rc6
	bne	.LBB40_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB40_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB40_11
; %bb.36:
	jmp	.LBB40_35
.LBB40_8:
	cpx	__rc7
	bcs	.LBB40_11
; %bb.38:
	jmp	.LBB40_35
.LBB40_9:
	cmp	__rc6
	bcs	.LBB40_11
; %bb.40:
	jmp	.LBB40_35
.LBB40_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB40_11
; %bb.44:
	jmp	.LBB40_35
.LBB40_11:
	ldx	__rc7
	bpl	.LBB40_12
; %bb.46:
	jmp	.LBB40_33
.LBB40_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB40_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB40_17
; %bb.14:                               ;   in Loop: Header=BB40_13 Depth=1
	cmp	__rc8
	bne	.LBB40_18
; %bb.15:                               ;   in Loop: Header=BB40_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB40_19
; %bb.16:                               ;   in Loop: Header=BB40_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB40_21
	bra	.LBB40_20
.LBB40_17:                              ;   in Loop: Header=BB40_13 Depth=1
	cpy	__rc9
	bcc	.LBB40_21
	bra	.LBB40_20
.LBB40_18:                              ;   in Loop: Header=BB40_13 Depth=1
	cmp	__rc8
	bcc	.LBB40_21
	bra	.LBB40_20
.LBB40_19:                              ;   in Loop: Header=BB40_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB40_21
.LBB40_20:                              ;   in Loop: Header=BB40_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB40_13
	bra	.LBB40_22
.LBB40_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB40_22:
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
	bne	.LBB40_23
; %bb.48:
	jmp	.LBB40_34
.LBB40_23:
	tya
.LBB40_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB40_28
; %bb.25:                               ;   in Loop: Header=BB40_24 Depth=1
	cmp	__rc8
	bne	.LBB40_31
; %bb.26:                               ;   in Loop: Header=BB40_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB40_32
; %bb.27:                               ;   in Loop: Header=BB40_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB40_29
	bra	.LBB40_30
.LBB40_28:                              ;   in Loop: Header=BB40_24 Depth=1
	cpy	__rc9
	bcc	.LBB40_30
.LBB40_29:                              ;   in Loop: Header=BB40_24 Depth=1
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
.LBB40_30:                              ;   in Loop: Header=BB40_24 Depth=1
	dex
	bne	.LBB40_24
	bra	.LBB40_35
.LBB40_31:                              ;   in Loop: Header=BB40_24 Depth=1
	cmp	__rc8
	bcs	.LBB40_29
	bra	.LBB40_30
.LBB40_32:                              ;   in Loop: Header=BB40_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB40_29
	bra	.LBB40_30
.LBB40_33:
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
	bra	.LBB40_35
.LBB40_34:
	tya
.LBB40_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end40:
	.size	__umodsi3, .Lfunc_end40-__umodsi3
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
	bne	.LBB41_8
; %bb.90:
	jmp	.LBB41_61
.LBB41_8:
	cmp	__rc15
	bne	.LBB41_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB41_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB41_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB41_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB41_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB41_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB41_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB41_23
; %bb.62:
	jmp	.LBB41_61
.LBB41_16:
	cmp	__rc15
	bcs	.LBB41_23
; %bb.64:
	jmp	.LBB41_61
.LBB41_17:
	cpx	__rc14
	bcs	.LBB41_23
; %bb.66:
	jmp	.LBB41_61
.LBB41_18:
	cpx	__rc13
	bcs	.LBB41_23
; %bb.68:
	jmp	.LBB41_61
.LBB41_19:
	cpx	__rc12
	bcs	.LBB41_23
; %bb.70:
	jmp	.LBB41_61
.LBB41_20:
	cpx	__rc11
	bcs	.LBB41_23
; %bb.72:
	jmp	.LBB41_61
.LBB41_21:
	cpx	__rc10
	bcs	.LBB41_23
; %bb.74:
	jmp	.LBB41_61
.LBB41_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB41_23
; %bb.92:
	jmp	.LBB41_61
.LBB41_23:
	ldx	__rc15
	bpl	.LBB41_24
; %bb.94:
	jmp	.LBB41_33
.LBB41_24:
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
.LBB41_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB41_29
; %bb.26:                               ;   in Loop: Header=BB41_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB41_30
; %bb.27:                               ;   in Loop: Header=BB41_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB41_31
; %bb.28:                               ;   in Loop: Header=BB41_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB41_76
; %bb.96:                               ;   in Loop: Header=BB41_25 Depth=1
	jmp	.LBB41_38
.LBB41_76:                              ;   in Loop: Header=BB41_25 Depth=1
	jmp	.LBB41_34
.LBB41_29:                              ;   in Loop: Header=BB41_25 Depth=1
	cmp	__rc19
	bcs	.LBB41_32
; %bb.98:
	jmp	.LBB41_42
.LBB41_30:                              ;   in Loop: Header=BB41_25 Depth=1
	cpy	__rc18
	bcs	.LBB41_32
; %bb.100:
	jmp	.LBB41_42
.LBB41_31:                              ;   in Loop: Header=BB41_25 Depth=1
	cpy	__rc7
	bcs	.LBB41_32
; %bb.102:
	jmp	.LBB41_42
.LBB41_32:                              ;   in Loop: Header=BB41_25 Depth=1
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
	bmi	.LBB41_78
; %bb.104:                              ;   in Loop: Header=BB41_25 Depth=1
	jmp	.LBB41_25
.LBB41_78:
	jmp	.LBB41_43
.LBB41_33:
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
	jmp	.LBB41_61
.LBB41_34:                              ;   in Loop: Header=BB41_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB41_39
; %bb.35:                               ;   in Loop: Header=BB41_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB41_40
; %bb.36:                               ;   in Loop: Header=BB41_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB41_41
; %bb.37:                               ;   in Loop: Header=BB41_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB41_42
; %bb.82:                               ;   in Loop: Header=BB41_25 Depth=1
	jmp	.LBB41_32
.LBB41_38:                              ;   in Loop: Header=BB41_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB41_42
; %bb.84:                               ;   in Loop: Header=BB41_25 Depth=1
	jmp	.LBB41_32
.LBB41_39:                              ;   in Loop: Header=BB41_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB41_42
; %bb.86:                               ;   in Loop: Header=BB41_25 Depth=1
	jmp	.LBB41_32
.LBB41_40:                              ;   in Loop: Header=BB41_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB41_42
; %bb.88:                               ;   in Loop: Header=BB41_25 Depth=1
	jmp	.LBB41_32
.LBB41_41:                              ;   in Loop: Header=BB41_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB41_42
; %bb.106:                              ;   in Loop: Header=BB41_25 Depth=1
	jmp	.LBB41_32
.LBB41_42:
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
.LBB41_43:
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
	bne	.LBB41_44
; %bb.108:
	jmp	.LBB41_61
.LBB41_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB41_52
; %bb.45:                               ;   in Loop: Header=BB41_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB41_46
; %bb.110:                              ;   in Loop: Header=BB41_44 Depth=1
	jmp	.LBB41_55
.LBB41_46:                              ;   in Loop: Header=BB41_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB41_47
; %bb.112:                              ;   in Loop: Header=BB41_44 Depth=1
	jmp	.LBB41_56
.LBB41_47:                              ;   in Loop: Header=BB41_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB41_48
; %bb.114:                              ;   in Loop: Header=BB41_44 Depth=1
	jmp	.LBB41_57
.LBB41_48:                              ;   in Loop: Header=BB41_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB41_49
; %bb.116:                              ;   in Loop: Header=BB41_44 Depth=1
	jmp	.LBB41_58
.LBB41_49:                              ;   in Loop: Header=BB41_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB41_50
; %bb.118:                              ;   in Loop: Header=BB41_44 Depth=1
	jmp	.LBB41_59
.LBB41_50:                              ;   in Loop: Header=BB41_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB41_51
; %bb.120:                              ;   in Loop: Header=BB41_44 Depth=1
	jmp	.LBB41_60
.LBB41_51:                              ;   in Loop: Header=BB41_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB41_53
	bra	.LBB41_54
.LBB41_52:                              ;   in Loop: Header=BB41_44 Depth=1
	cmp	__rc19
	bcc	.LBB41_54
.LBB41_53:                              ;   in Loop: Header=BB41_44 Depth=1
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
.LBB41_54:                              ;   in Loop: Header=BB41_44 Depth=1
	dex
	beq	.LBB41_61
; %bb.122:                              ;   in Loop: Header=BB41_44 Depth=1
	jmp	.LBB41_44
.LBB41_55:                              ;   in Loop: Header=BB41_44 Depth=1
	cpy	__rc18
	bcs	.LBB41_53
	bra	.LBB41_54
.LBB41_56:                              ;   in Loop: Header=BB41_44 Depth=1
	cpy	__rc7
	bcs	.LBB41_53
	bra	.LBB41_54
.LBB41_57:                              ;   in Loop: Header=BB41_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB41_53
	bra	.LBB41_54
.LBB41_58:                              ;   in Loop: Header=BB41_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB41_53
	bra	.LBB41_54
.LBB41_59:                              ;   in Loop: Header=BB41_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB41_53
	bra	.LBB41_54
.LBB41_60:                              ;   in Loop: Header=BB41_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB41_54
; %bb.124:                              ;   in Loop: Header=BB41_44 Depth=1
	jmp	.LBB41_53
.LBB41_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end41:
	.size	__umoddi3, .Lfunc_end41-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB42_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB42_2
; %bb.18:
	jmp	.LBB42_17
.LBB42_2:
	lda	__rc5
	bpl	.LBB42_3
; %bb.20:
	jmp	.LBB42_15
.LBB42_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB42_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB42_6
; %bb.5:                                ;   in Loop: Header=BB42_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB42_9
	bra	.LBB42_7
.LBB42_6:                               ;   in Loop: Header=BB42_4 Depth=1
	cpy	__rc6
	bcc	.LBB42_9
.LBB42_7:                               ;   in Loop: Header=BB42_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB42_4
	bra	.LBB42_10
.LBB42_8:
	sty	__rc7
	bra	.LBB42_17
.LBB42_9:
	ldy	__rc5
	sty	__rc4
.LBB42_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB42_16
; %bb.11:
	lda	#1
.LBB42_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB42_14
; %bb.13:                               ;   in Loop: Header=BB42_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB42_14:                              ;   in Loop: Header=BB42_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB42_12
	bra	.LBB42_17
.LBB42_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB42_16:
	lda	#1
.LBB42_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end42:
	.size	__udivmodqi4, .Lfunc_end42-__udivmodqi4
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
	bne	.LBB43_2
; %bb.1:
	ldx	__rc2
	beq	.LBB43_4
.LBB43_2:
	cmp	__rc3
	bne	.LBB43_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB43_6
.LBB43_4:
	ldx	#0
; %bb.26:
	jmp	.LBB43_24
.LBB43_5:
	cmp	__rc3
	bcc	.LBB43_4
.LBB43_6:
	tay
	ldx	__rc3
	bpl	.LBB43_7
; %bb.28:
	jmp	.LBB43_22
.LBB43_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB43_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB43_10
; %bb.9:                                ;   in Loop: Header=BB43_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB43_11
	bra	.LBB43_12
.LBB43_10:                              ;   in Loop: Header=BB43_8 Depth=1
	cmp	__rc8
	bcc	.LBB43_12
.LBB43_11:                              ;   in Loop: Header=BB43_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB43_8
	bra	.LBB43_13
.LBB43_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB43_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB43_14
; %bb.30:
	jmp	.LBB43_23
.LBB43_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB43_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB43_17
; %bb.16:                               ;   in Loop: Header=BB43_15 Depth=1
	ldy	#0
.LBB43_17:                              ;   in Loop: Header=BB43_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB43_21
; %bb.18:                               ;   in Loop: Header=BB43_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB43_20
.LBB43_19:                              ;   in Loop: Header=BB43_15 Depth=1
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
.LBB43_20:                              ;   in Loop: Header=BB43_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB43_15
	bra	.LBB43_25
.LBB43_21:                              ;   in Loop: Header=BB43_15 Depth=1
	cmp	__rc8
	bcs	.LBB43_19
	bra	.LBB43_20
.LBB43_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB43_23:
	ldx	#1
.LBB43_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB43_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end43:
	.size	__udivmodhi4, .Lfunc_end43-__udivmodhi4
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
	bpl	.LBB44_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB44_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB44_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB44_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB44_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB44_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB44_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB44_8:
	lda	__rc2
	rts
.Lfunc_end44:
	.size	__divqi3, .Lfunc_end44-__divqi3
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
	bmi	.LBB45_2
; %bb.1:
	bra	.LBB45_6
.LBB45_2:
	cpx	#128
	bne	.LBB45_5
; %bb.3:
	lda	__rc4
	bne	.LBB45_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB45_6
.LBB45_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB45_6:
	tya
	bmi	.LBB45_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB45_12
.LBB45_8:
	cpy	#128
	bne	.LBB45_11
; %bb.9:
	lda	__rc2
	bne	.LBB45_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB45_12
.LBB45_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB45_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB45_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB45_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end45:
	.size	__divhi3, .Lfunc_end45-__divhi3
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
	bmi	.LBB46_2
; %bb.1:
	ldy	__rc3
	bra	.LBB46_8
.LBB46_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB46_7
; %bb.3:
	lda	__rc2
	bne	.LBB46_7
; %bb.4:
	lda	__rc8
	bne	.LBB46_7
; %bb.5:
	lda	__rc9
	bne	.LBB46_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB46_8
.LBB46_7:
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
.LBB46_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB46_10
; %bb.9:
	lda	__rc7
	bra	.LBB46_16
.LBB46_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB46_15
; %bb.11:
	lda	__rc6
	bne	.LBB46_15
; %bb.12:
	lda	__rc5
	bne	.LBB46_15
; %bb.13:
	lda	__rc4
	bne	.LBB46_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB46_16
.LBB46_15:
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
.LBB46_16:
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
	bne	.LBB46_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB46_19
.LBB46_18:
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
.LBB46_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end46:
	.size	__divsi3, .Lfunc_end46-__divsi3
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
	bmi	.LBB47_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB47_12
.LBB47_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB47_11
; %bb.3:
	lda	__rc6
	bne	.LBB47_11
; %bb.4:
	lda	__rc5
	bne	.LBB47_11
; %bb.5:
	lda	__rc4
	bne	.LBB47_11
; %bb.6:
	lda	__rc3
	bne	.LBB47_11
; %bb.7:
	lda	__rc2
	bne	.LBB47_11
; %bb.8:
	lda	__rc18
	bne	.LBB47_11
; %bb.9:
	lda	__rc19
	bne	.LBB47_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB47_12
.LBB47_11:
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
.LBB47_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB47_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB47_24
.LBB47_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB47_23
; %bb.15:
	lda	__rc14
	bne	.LBB47_23
; %bb.16:
	lda	__rc13
	bne	.LBB47_23
; %bb.17:
	lda	__rc12
	bne	.LBB47_23
; %bb.18:
	lda	__rc11
	bne	.LBB47_23
; %bb.19:
	lda	__rc10
	bne	.LBB47_23
; %bb.20:
	lda	__rc9
	bne	.LBB47_23
; %bb.21:
	lda	__rc8
	bne	.LBB47_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB47_24
.LBB47_23:
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
.LBB47_24:
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
	bne	.LBB47_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB47_27
.LBB47_26:
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
.LBB47_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end47:
	.size	__divdi3, .Lfunc_end47-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB48_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB48_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB48_3:
	tay
	lda	__rc2
	bmi	.LBB48_5
; %bb.4:
	lda	__rc2
	bra	.LBB48_7
.LBB48_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB48_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB48_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB48_9
; %bb.8:
	rts
.LBB48_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end48:
	.size	__modqi3, .Lfunc_end48-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB49_2
; %bb.1:
	txa
	bra	.LBB49_6
.LBB49_2:
	cpx	#128
	bne	.LBB49_5
; %bb.3:
	lda	__rc4
	bne	.LBB49_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB49_6
.LBB49_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB49_6:
	ldx	__rc3
	bpl	.LBB49_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB49_10
; %bb.8:
	ldx	__rc2
	bne	.LBB49_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB49_11
.LBB49_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB49_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB49_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB49_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end49:
	.size	__modhi3, .Lfunc_end49-__modhi3
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
	bmi	.LBB50_2
; %bb.1:
	lda	__rc3
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
	lda	#128
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
	sbc	mos8(.L__modsi3_zp_stk)
.LBB50_8:
	ldx	__rc7
	bpl	.LBB50_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB50_14
; %bb.10:
	ldx	__rc6
	bne	.LBB50_14
; %bb.11:
	ldx	__rc5
	bne	.LBB50_14
; %bb.12:
	ldx	__rc4
	bne	.LBB50_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB50_15
.LBB50_14:
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
.LBB50_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB50_17
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
.LBB50_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end50:
	.size	__modsi3, .Lfunc_end50-__modsi3
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
	bmi	.LBB51_2
; %bb.1:
	lda	__rc7
; %bb.26:
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
	lda	#128
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
	sbc	mos8(.L__moddi3_zp_stk)
.LBB51_12:
	ldx	__rc15
	bmi	.LBB51_13
; %bb.28:
	jmp	.LBB51_23
.LBB51_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB51_22
; %bb.14:
	ldx	__rc14
	bne	.LBB51_22
; %bb.15:
	ldx	__rc13
	bne	.LBB51_22
; %bb.16:
	ldx	__rc12
	bne	.LBB51_22
; %bb.17:
	ldx	__rc11
	bne	.LBB51_22
; %bb.18:
	ldx	__rc10
	bne	.LBB51_22
; %bb.19:
	ldx	__rc9
	bne	.LBB51_22
; %bb.20:
	ldx	__rc8
	bne	.LBB51_22
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
	bra	.LBB51_23
.LBB51_22:
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
.LBB51_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB51_25
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
.LBB51_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end51:
	.size	__moddi3, .Lfunc_end51-__moddi3
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
	bpl	.LBB52_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB52_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB52_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB52_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB52_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB52_11
.LBB52_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB52_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB52_8
; %bb.34:
	jmp	.LBB52_24
.LBB52_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB52_24
.LBB52_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB52_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB52_12
.LBB52_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB52_24
.LBB52_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB52_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB52_15
; %bb.14:                               ;   in Loop: Header=BB52_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB52_18
	bra	.LBB52_16
.LBB52_15:                              ;   in Loop: Header=BB52_13 Depth=1
	cmp	__rc7
	bcc	.LBB52_18
.LBB52_16:                              ;   in Loop: Header=BB52_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB52_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB52_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB52_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB52_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB52_22
; %bb.21:                               ;   in Loop: Header=BB52_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB52_22:                              ;   in Loop: Header=BB52_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB52_20
	bra	.LBB52_24
.LBB52_23:
	sta	__rc7
	sty	__rc6
.LBB52_24:
	lda	__rc4
	bmi	.LBB52_26
; %bb.25:
	lda	__rc7
	bra	.LBB52_27
.LBB52_26:
	lda	#0
	sec
	sbc	__rc7
.LBB52_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB52_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB52_29:
	lda	__rc6
	rts
.Lfunc_end52:
	.size	__divmodqi4, .Lfunc_end52-__divmodqi4
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
	bmi	.LBB53_2
.LBB53_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB53_6
.LBB53_2:
	cpx	#128
	bne	.LBB53_5
; %bb.3:
	lda	__rc7
	bne	.LBB53_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB53_1
.LBB53_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB53_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB53_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB53_15
; %bb.8:
	lda	__rc2
	bne	.LBB53_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB53_18
.LBB53_10:
	cpy	#128
	bne	.LBB53_14
; %bb.11:
	ldy	__rc2
	bne	.LBB53_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB53_13
; %bb.48:
	jmp	.LBB53_45
.LBB53_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB53_18
.LBB53_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB53_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB53_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB53_20
.LBB53_17:
	sta	__rc11
.LBB53_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB53_39
.LBB53_19:
	cmp	__rc7
	bcc	.LBB53_17
.LBB53_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB53_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB53_23
; %bb.22:                               ;   in Loop: Header=BB53_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB53_24
	bra	.LBB53_26
.LBB53_23:                              ;   in Loop: Header=BB53_21 Depth=1
	cmp	__rc9
	bcc	.LBB53_26
.LBB53_24:                              ;   in Loop: Header=BB53_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB53_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB53_27
.LBB53_26:
	tay
.LBB53_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB53_28
; %bb.50:
	jmp	.LBB53_37
.LBB53_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB53_32
.LBB53_29:                              ;   in Loop: Header=BB53_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB53_36
.LBB53_30:                              ;   in Loop: Header=BB53_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB53_31:                              ;   in Loop: Header=BB53_32 Depth=1
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
	beq	.LBB53_39
.LBB53_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB53_34
; %bb.33:                               ;   in Loop: Header=BB53_32 Depth=1
	ldy	#0
.LBB53_34:                              ;   in Loop: Header=BB53_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB53_29
; %bb.35:                               ;   in Loop: Header=BB53_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB53_30
.LBB53_36:                              ;   in Loop: Header=BB53_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB53_31
.LBB53_37:
	sta	__rc11
	ldx	#1
.LBB53_38:
	stx	__rc9
.LBB53_39:
	lda	__rc6
	bmi	.LBB53_41
; %bb.40:
	lda	__rc10
	bra	.LBB53_42
.LBB53_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB53_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB53_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB53_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB53_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB53_38
.Lfunc_end53:
	.size	__divmodhi4, .Lfunc_end53-__divmodhi4
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
	.section	.bss.fnamehi,"aw",@nobits
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

	.type	g_curScreenW,@object            ; @g_curScreenW
	.section	.zp.bss.g_curScreenW,"aw",@nobits
g_curScreenW:
	.byte	0                               ; 0x0
	.size	g_curScreenW, 1

	.type	g_curScreenH,@object            ; @g_curScreenH
	.section	.bss.g_curScreenH,"aw",@nobits
g_curScreenH:
	.byte	0                               ; 0x0
	.size	g_curScreenH, 1

	.type	escapeCode,@object              ; @escapeCode
	.section	.bss.escapeCode,"aw",@nobits
escapeCode:
	.zero	765
	.size	escapeCode, 765

	.type	g_curX,@object                  ; @g_curX
	.section	.bss.g_curX,"aw",@nobits
g_curX:
	.byte	0                               ; 0x0
	.size	g_curX, 1

	.type	g_curY,@object                  ; @g_curY
	.section	.bss.g_curY,"aw",@nobits
g_curY:
	.byte	0                               ; 0x0
	.size	g_curY, 1

	.type	hexDigits,@object               ; @hexDigits
	.section	.rodata.cst16,"aM",@progbits,16
hexDigits:
	.ascii	"0123456789ABCDEF"
	.size	hexDigits, 16

	.type	dmalist,@object                 ; @dmalist
	.section	.bss.dmalist,"aw",@nobits
dmalist:
	.zero	20
	.size	dmalist, 20

	.type	.Lzp_stack,@object              ; @zp_stack
	.section	.zp.noinit..Lzp_stack,"aw",@nobits
.Lzp_stack:
	.zero	23
	.size	.Lzp_stack, 23

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
.set .L__udivmodhi4_zp_stk, .Lzp_stack+22
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
.set .Lcputsxy_zp_stk, .Lzp_stack+14
	.size	.Lcputsxy_zp_stk, 8
.set .Lcputhex_zp_stk, .Lzp_stack
	.size	.Lcputhex_zp_stk, 14
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
	;Declaring this symbol tells the CRT that the stack pointer needs to be initialized.
	.globl	__do_init_stack
	;Declaring this symbol tells the CRT that the stack pointer needs to be initialized.
	.globl	__do_init_stack

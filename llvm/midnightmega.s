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
	.section	.text.main,"ax",@progbits
	.globl	main                            ; -- Begin function main
	.type	main,@function
main:                                   ; @main
; %bb.0:
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
	bpl	.LBB0_2
; %bb.1:
	ldx	#80
.LBB0_2:
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
	clc
	lda	__rc0
	adc	#227
	sta	__rc0
	lda	__rc1
	adc	#255
	sta	__rc1
	ldy	__rc20
	phy
	ldy	__rc21
	phy
	ldy	__rc22
	phy
	ldy	__rc23
	phy
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
	stx	g_curScreenH
	bra	.LBB0_7
.LBB0_6:                                ;   in Loop: Header=BB0_7 Depth=1
	stz	54800
.LBB0_7:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB0_6
; %bb.8:
	ldx	#255
	ldy	#mos16lo(escapeCode)
	sty	__rc2
	ldy	#mos16hi(escapeCode)
	sty	__rc3
	ldy	#1
	bra	.LBB0_12
.LBB0_9:                                ;   in Loop: Header=BB0_12 Depth=1
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
; %bb.10:                               ;   in Loop: Header=BB0_12 Depth=1
	inc	__rc5
.LBB0_11:                               ;   in Loop: Header=BB0_12 Depth=1
	lda	#mos16hi(escNOP)
	sta	(__rc4),y
	dex
.LBB0_12:                               ; =>This Inner Loop Header: Depth=1
	txa
	bne	.LBB0_9
; %bb.13:
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	stz	53280
	ldx	#6
	stx	53281
	lda	53297
	ora	#128
	sta	53297
	ldx	#80
	stx	53324
	lda	53297
	and	#247
	sta	53297
	stx	mos8(g_curScreenW)
	ldx	#25
	stx	g_curScreenH
	jsr	clrhome
	ldx	#22
	ldy	#mos16lo(.L.str)
	sty	__rc2
	ldy	#mos16hi(.L.str)
	sty	__rc3
	lda	#0
	jsr	mcputsxy
	ldx	#mos16lo(.L.str.1)
	stx	__rc2
	ldx	#mos16hi(.L.str.1)
	stx	__rc3
	jsr	msprintf
	ldx	#23
	ldy	#mos16lo(.L.str.2)
	sty	__rc2
	ldy	#mos16hi(.L.str.2)
	sty	__rc3
	lda	#0
	jsr	mcputsxy
	lda	#16
	jsr	shortcuts
	lda	#1
	ldx	#mos16lo(.L.str.3)
	stx	__rc2
	ldx	#mos16hi(.L.str.3)
	stx	__rc3
	ldx	#mos16lo(.L.str.4)
	stx	__rc4
	ldx	#mos16hi(.L.str.4)
	stx	__rc5
	ldx	#mos16lo(.L.str.5)
	stx	__rc6
	ldx	#mos16hi(.L.str.5)
	stx	__rc7
	jsr	messagebox
	tax
	bne	.LBB0_14
; %bb.405:
	jmp	.LBB0_262
.LBB0_14:
	ldx	#40
	txa
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc22
	stz	__rc4
; %bb.287:
	jmp	.LBB0_16
.LBB0_15:                               ;   in Loop: Header=BB0_16 Depth=1
	ldx	__rc22
	lda	midnight,x
	sta	__rc20
	clc
	adc	#3
	sta	__rc2
	lda	midnight+1,x
	sta	__rc21
	adc	#0
	sta	__rc3
	lda	__rc4
	sta	(__rc20)
	sta	__rc23
	ldx	#mos16lo(.L.str.26)
	stx	__rc4
	ldx	#mos16hi(.L.str.26)
	stx	__rc5
	ldx	#0
	lda	#16
	jsr	memcpy
	lda	#1
	ldy	#70
	ora	(__rc20),y
	sta	(__rc20),y
	ldy	#1
	lda	#0
	sta	(__rc20),y
	ldx	#mos16lo(.L.str.27)
	stx	__rc2
	ldx	#mos16hi(.L.str.27)
	stx	__rc3
	ldx	#mos16lo(.L.str.28)
	stx	__rc4
	ldx	#mos16hi(.L.str.28)
	stx	__rc5
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	jsr	progress
	lda	(__rc20)
	ldx	__rc23
	jsr	UpdateSectors
	lda	__rc22
	inc	__rc23
	ldx	__rc23
	stx	__rc4
	clc
	adc	#2
	sta	__rc22
	clc
	lda	__rc24
	adc	#40
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_16:                               ; =>This Inner Loop Header: Depth=1
	ldx	__rc4
	cpx	#2
	beq	.LBB0_17
; %bb.407:                              ;   in Loop: Header=BB0_16 Depth=1
	jmp	.LBB0_15
.LBB0_17:
	stz	__rc26
	stz	__rc2
	lda	#0
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_18:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_19 Depth 2
                                        ;       Child Loop BB0_30 Depth 3
                                        ;         Child Loop BB0_46 Depth 4
                                        ;         Child Loop BB0_52 Depth 4
                                        ;     Child Loop BB0_91 Depth 2
                                        ;       Child Loop BB0_92 Depth 3
                                        ;     Child Loop BB0_109 Depth 2
                                        ;       Child Loop BB0_107 Depth 3
                                        ;     Child Loop BB0_114 Depth 2
                                        ;       Child Loop BB0_112 Depth 3
                                        ;     Child Loop BB0_154 Depth 2
                                        ;     Child Loop BB0_196 Depth 2
                                        ;     Child Loop BB0_187 Depth 2
                                        ;     Child Loop BB0_229 Depth 2
                                        ;     Child Loop BB0_251 Depth 2
	stz	__rc30
	stz	__rc31
.LBB0_19:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_30 Depth 3
                                        ;         Child Loop BB0_46 Depth 4
                                        ;         Child Loop BB0_52 Depth 4
	ldx	__rc26
	cpx	#2
	bne	.LBB0_20
; %bb.409:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_90
.LBB0_20:                               ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc31
	ldy	midnight,x
	sty	__rc22
	sty	__rc20
	lda	midnight+1,x
	tax
	stx	__rc24
	stx	__rc21
	ldy	#2
	lda	(__rc20),y
	dey
	cmp	(__rc20),y
	bcs	.LBB0_22
; %bb.21:                               ;   in Loop: Header=BB0_19 Depth=2
	sta	(__rc20),y
.LBB0_22:                               ;   in Loop: Header=BB0_19 Depth=2
	ldx	#40
	lda	__rc26
	jsr	__mulqi3
	sta	__rc23
	clc
	adc	#39
	sta	__rc2
	ldx	#23
	stx	__rc3
	stz	__rc4
	ldx	#0
	lda	__rc23
	jsr	mcbox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	__rc23
	stx	__rc28
	lda	__rc23
	ora	#2
	ldx	#mos16lo(.L.str.29)
	stx	__rc2
	ldx	#mos16hi(.L.str.29)
	stx	__rc3
	ldx	#0
	sta	__rc23
	jsr	mcputsxy
	lda	#mos16lo(diskname)
	clc
	adc	__rc30
	sta	__rc2
	lda	#mos16hi(diskname)
	adc	#0
	sta	__rc3
	jsr	msprintf
	lda	#32
	jsr	cputc
	lda	#1
	ldy	#70
	and	(__rc20),y
	beq	.LBB0_24
; %bb.23:                               ;   in Loop: Header=BB0_19 Depth=2
	lda	mos8(g_curX)
	inc
	ldx	#mos16lo(.L.str.29)
	stx	__rc2
	ldx	#mos16hi(.L.str.29)
	stx	__rc3
	ldx	#0
	jsr	mcputsxy
	lda	__rc22
	clc
	adc	#3
	sta	__rc2
	lda	__rc24
	adc	#0
	sta	__rc3
	jsr	msprintf
	lda	#32
	jsr	cputc
.LBB0_24:                               ;   in Loop: Header=BB0_19 Depth=2
	ldx	#mos16lo(.L.str.30)
	stx	__rc2
	ldx	#mos16hi(.L.str.30)
	stx	__rc3
	ldx	#23
	lda	__rc23
	jsr	mcputsxy
	lda	(__rc20)
	stz	__rc2
	stz	__rc3
	stz	__rc4
	ldx	#0
	jsr	csputdec
	lda	#32
	jsr	cputc
	clc
	lda	__rc22
	adc	#68
	tax
	lda	__rc24
	adc	#0
	stx	__rc22
	stx	__rc2
	sta	__rc23
	sta	__rc3
	ldy	#1
	lda	(__rc2),y
	cmp	#255
	bne	.LBB0_26
; %bb.25:                               ;   in Loop: Header=BB0_19 Depth=2
	ldy	#68
	lda	(__rc20),y
	ldy	#1
	cmp	#255
	beq	.LBB0_27
.LBB0_26:                               ;   in Loop: Header=BB0_19 Depth=2
	clc
	lda	__rc28
	adc	#12
	ldx	#mos16lo(.L.str.29)
	stx	__rc2
	ldx	#mos16hi(.L.str.29)
	stx	__rc3
	ldx	#23
	jsr	mcputsxy
	ldx	__rc22
	stx	__rc2
	ldx	__rc23
	stx	__rc3
	ldy	#68
	lda	(__rc20),y
	sta	__rc5
	ldy	#1
	lda	(__rc2),y
	stz	__rc2
	stz	__rc3
	stz	__rc4
	tax
	lda	__rc5
	jsr	csputdec
	ldx	#mos16lo(.L.str.31)
	stx	__rc2
	ldx	#mos16hi(.L.str.31)
	stx	__rc3
	jsr	msprintf
	ldy	#1
.LBB0_27:                               ;   in Loop: Header=BB0_19 Depth=2
	stz	__rc22
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	lda	(__rc20),y
	sta	__rc23
	tax
	cmp	#21
	stz	__rc24
	stz	__rc25
	ldy	#2
	lda	(__rc20),y
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	bcc	.LBB0_29
; %bb.28:                               ;   in Loop: Header=BB0_19 Depth=2
	clc
	txa
	adc	#235
	sta	__rc24
	lda	#0
	adc	#255
	sta	__rc25
.LBB0_29:                               ;   in Loop: Header=BB0_19 Depth=2
	lda	__rc28
	ora	#1
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc28
.LBB0_30:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_46 Depth 4
                                        ;         Child Loop BB0_52 Depth 4
	lda	__rc28
	bne	.LBB0_32
; %bb.31:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	__rc22
	cpx	#22
	bne	.LBB0_32
; %bb.411:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_73
.LBB0_32:                               ;   in Loop: Header=BB0_30 Depth=3
	lda	__rc22
	clc
	adc	__rc24
	ldx	#1
	bcs	.LBB0_34
; %bb.33:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	#0
.LBB0_34:                               ;   in Loop: Header=BB0_30 Depth=3
	stx	__rc29
	sta	__rc27
	tax
	lda	__rc26
	jsr	getdirententry
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	ldx	__rc21
	ldy	#0
	sty	__rc2
	ldy	#0
	sty	__rc3
	cpx	__rc3
	bne	.LBB0_36
; %bb.35:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	__rc20
	cpx	__rc2
	bne	.LBB0_36
; %bb.413:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_73
.LBB0_36:                               ;   in Loop: Header=BB0_30 Depth=3
	lda	__rc28
	ldx	__rc29
	cpx	#1
	adc	__rc25
	sta	__rc2
	ldx	#0
	cpx	__rc2
	bne	.LBB0_38
; %bb.37:                               ;   in Loop: Header=BB0_30 Depth=3
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	cmp	__rc27
	bcs	.LBB0_39
; %bb.289:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_73
.LBB0_38:                               ;   in Loop: Header=BB0_30 Depth=3
	cpx	__rc2
	bcs	.LBB0_39
; %bb.415:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_73
.LBB0_39:                               ;   in Loop: Header=BB0_30 Depth=3
	lda	__rc2
	bne	.LBB0_41
; %bb.40:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	__rc27
	cpx	__rc23
	bne	.LBB0_41
; %bb.417:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_75
.LBB0_41:                               ;   in Loop: Header=BB0_30 Depth=3
	lda	#1
.LBB0_42:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	#32
	and	#1
	bne	.LBB0_44
; %bb.43:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	#62
.LBB0_44:                               ;   in Loop: Header=BB0_30 Depth=3
	lda	#0
	stx	mos8(s)
	ldx	#32
	stx	mos8(s+1)
	bra	.LBB0_46
.LBB0_45:                               ;   in Loop: Header=BB0_46 Depth=4
	sta	mos8(s+2),y
	iny
	tya
.LBB0_46:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ;       Parent Loop BB0_30 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	sta	__rc3
	clc
	adc	__rc20
	sta	__rc4
	lda	__rc21
	adc	#0
	sta	__rc5
	ldy	#5
	lda	(__rc4),y
	cmp	#160
	beq	.LBB0_49
; %bb.47:                               ;   in Loop: Header=BB0_46 Depth=4
	tax
	beq	.LBB0_49
; %bb.48:                               ;   in Loop: Header=BB0_46 Depth=4
	ldy	__rc3
	cpy	#16
	bne	.LBB0_45
; %bb.291:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_74
.LBB0_49:                               ;   in Loop: Header=BB0_30 Depth=3
	clc
	ldy	__rc3
	lda	__rc3
	adc	#2
.LBB0_50:                               ;   in Loop: Header=BB0_30 Depth=3
	tax
	clc
	adc	#16
	sty	__rc3
	sec
	sbc	__rc3
	sta	__rc4
	clc
	tya
	adc	#240
	sta	__rc3
	lda	__rc4
	bra	.LBB0_52
.LBB0_51:                               ;   in Loop: Header=BB0_52 Depth=4
	phx
	ply
	iny
	lda	#32
	sta	mos8(s),x
	lda	__rc4
	inc	__rc3
	phy
	plx
.LBB0_52:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ;       Parent Loop BB0_30 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldy	__rc3
	bne	.LBB0_51
; %bb.53:                               ;   in Loop: Header=BB0_30 Depth=3
	tax
	sta	__rc3
	lda	#32
	sta	mos8(s),x
	ldx	__rc3
	inx
	clc
	lda	__rc3
	adc	#2
	tay
	lda	#93
	sta	mos8(s),x
	clc
	lda	__rc3
	adc	#3
	sta	__rc6
	lda	#32
	sta	mos8(s),y
	ldy	#2
	lda	(__rc20),y
	tay
	and	#64
	beq	.LBB0_54
; %bb.419:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_71
.LBB0_54:                               ;   in Loop: Header=BB0_30 Depth=3
	tya
	and	#15
	ldx	#0
	tay
	dec
	cpy	#0
	bne	.LBB0_55
; %bb.421:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_76
.LBB0_55:                               ;   in Loop: Header=BB0_30 Depth=3
	tay
	txa
	beq	.LBB0_293
; %bb.423:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_78
.LBB0_293:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_77
.LBB0_56:                               ;   in Loop: Header=BB0_30 Depth=3
	lda	__rc4
	bcs	.LBB0_295
; %bb.425:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_81
.LBB0_295:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_79
.LBB0_57:                               ;   in Loop: Header=BB0_30 Depth=3
	sta	mos8(s),y
	bra	.LBB0_59
.LBB0_58:                               ;   in Loop: Header=BB0_30 Depth=3
	sta	mos8(s),x
.LBB0_59:                               ;   in Loop: Header=BB0_30 Depth=3
	clc
	lda	__rc4
	adc	#6
	tax
	clc
	lda	__rc4
	adc	#7
	tay
	clc
	lda	__rc4
	adc	#8
	sta	__rc5
	lda	#32
	sta	mos8(s),x
	lda	#93
	sta	mos8(s),y
	ldx	__rc5
	lda	#32
	sta	mos8(s),x
	clc
	lda	__rc4
	adc	#9
	tax
	stz	mos8(s),x
	lda	mos8(g_curTextColor)
	ldx	__rc2
	bne	.LBB0_61
; %bb.60:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	__rc27
	cpx	__rc23
	bne	.LBB0_61
; %bb.427:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_83
.LBB0_61:                               ;   in Loop: Header=BB0_30 Depth=3
	and	#223
.LBB0_62:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	__rc2
	bne	.LBB0_64
; %bb.63:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	#1
	ldy	__rc27
	cpy	__rc23
	beq	.LBB0_65
.LBB0_64:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	#0
.LBB0_65:                               ;   in Loop: Header=BB0_30 Depth=3
	ldy	#1
	stz	__rc2
	cpx	#0
	bne	.LBB0_67
; %bb.66:                               ;   in Loop: Header=BB0_30 Depth=3
	sty	__rc2
.LBB0_67:                               ;   in Loop: Header=BB0_30 Depth=3
	sta	mos8(g_curTextColor)
	lda	__rc2
	and	#1
	sta	__rc27
	ldx	__rc22
	inx
	ldy	#mos8(s)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	cputsxy
	lda	__rc20
	clc
	adc	#30
	sta	__rc2
	lda	__rc21
	adc	#0
	sta	__rc3
	ldy	#1
	lda	(__rc2),y
	sta	__rc5
	ldy	#30
	lda	(__rc20),y
	stz	__rc2
	stz	__rc3
	ldx	#5
	stx	__rc4
	ldx	__rc5
	jsr	csputdec
	lda	#32
	jsr	cputc
	lda	#32
	ldx	__rc27
	bne	.LBB0_69
; %bb.68:                               ;   in Loop: Header=BB0_30 Depth=3
	lda	#60
.LBB0_69:                               ;   in Loop: Header=BB0_30 Depth=3
	jsr	cputc
	inc	__rc22
	beq	.LBB0_70
; %bb.429:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_30
.LBB0_70:                               ;   in Loop: Header=BB0_30 Depth=3
	inc	__rc28
; %bb.297:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_30
.LBB0_71:                               ;   in Loop: Header=BB0_30 Depth=3
	clc
	lda	__rc3
	adc	#4
	sta	__rc5
	clc
	lda	__rc3
	adc	#5
	tax
	tya
	and	#191
	cmp	#16
	beq	.LBB0_72
; %bb.431:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_85
.LBB0_72:                               ;   in Loop: Header=BB0_30 Depth=3
	stx	__rc3
	ldx	__rc5
	lda	#68
	ldy	__rc6
	sta	mos8(s),y
	lda	#73
	sta	mos8(s),x
	lda	#82
	ldx	__rc3
; %bb.299:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_58
.LBB0_73:                               ;   in Loop: Header=BB0_19 Depth=2
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	jsr	cputln
	inc	__rc26
	clc
	lda	__rc31
	adc	#2
	sta	__rc31
	clc
	lda	__rc30
	adc	#17
	sta	__rc30
; %bb.301:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_74:                               ;   in Loop: Header=BB0_30 Depth=3
	lda	#18
	ldy	#16
; %bb.303:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_50
.LBB0_75:                               ;   in Loop: Header=BB0_30 Depth=3
	lda	#0
; %bb.305:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_42
.LBB0_76:                               ;   in Loop: Header=BB0_30 Depth=3
	dex
; %bb.307:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_55
.LBB0_77:                               ;   in Loop: Header=BB0_30 Depth=3
	cpy	#5
; %bb.309:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_56
.LBB0_78:                               ;   in Loop: Header=BB0_30 Depth=3
	cpx	#0
; %bb.311:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_56
.LBB0_79:                               ;   in Loop: Header=BB0_30 Depth=3
	clc
	tay
	adc	#4
	sta	__rc3
	lda	#68
.LBB0_80:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	__rc6
	sta	mos8(s),x
	clc
	sty	__rc4
	tya
	adc	#5
	tay
	lda	#69
	ldx	__rc3
	sta	mos8(s),x
	lda	#76
; %bb.313:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_57
.LBB0_81:                               ;   in Loop: Header=BB0_30 Depth=3
	ldx	.LJTI0_0,y
	pha
	lda	.LJTI0_0+5,y
	tay
	pla
	stx	__rc4
	sty	__rc5
	jmp	(__rc4)
.LBB0_82:                               ;   in Loop: Header=BB0_30 Depth=3
	clc
	tay
	adc	#4
	sta	__rc3
	lda	#83
	ldx	__rc6
	sta	mos8(s),x
	clc
	sty	__rc4
	tya
	adc	#5
	tay
	lda	#69
	ldx	__rc3
	sta	mos8(s),x
	lda	#81
; %bb.315:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_57
.LBB0_83:                               ;   in Loop: Header=BB0_30 Depth=3
	pha
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	cpx	__rc26
	beq	.LBB0_84
; %bb.433:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_61
.LBB0_84:                               ;   in Loop: Header=BB0_30 Depth=3
	ora	#32
; %bb.317:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_62
.LBB0_85:                               ;   in Loop: Header=BB0_30 Depth=3
	lda	#32
	ldy	__rc6
	sta	mos8(s),y
	ldy	__rc5
	sta	mos8(s),y
; %bb.319:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_58
.LBB0_86:                               ;   in Loop: Header=BB0_30 Depth=3
	clc
	tay
	adc	#4
	sta	__rc3
	lda	#80
	ldx	__rc6
	sta	mos8(s),x
	clc
	sty	__rc4
	tya
	adc	#5
	tay
	lda	#82
	ldx	__rc3
	sta	mos8(s),x
	lda	#71
; %bb.321:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_57
.LBB0_87:                               ;   in Loop: Header=BB0_30 Depth=3
	clc
	tay
	adc	#4
	sta	__rc3
	lda	#85
	ldx	__rc6
	sta	mos8(s),x
	clc
	sty	__rc4
	tya
	adc	#5
	tay
	lda	#83
	ldx	__rc3
	sta	mos8(s),x
	dec
; %bb.323:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_57
.LBB0_88:                               ;   in Loop: Header=BB0_30 Depth=3
	clc
	tay
	adc	#4
	sta	__rc3
	lda	#82
; %bb.325:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_80
.LBB0_89:                               ;   in Loop: Header=BB0_30 Depth=3
	clc
	tay
	adc	#4
	sta	__rc3
	lda	#67
	ldx	__rc6
	sta	mos8(s),x
	clc
	sty	__rc4
	tya
	adc	#5
	tay
	lda	#66
	ldx	__rc3
	sta	mos8(s),x
	lda	#77
; %bb.327:                              ;   in Loop: Header=BB0_30 Depth=3
	jmp	.LBB0_57
.LBB0_90:                               ;   in Loop: Header=BB0_18 Depth=1
	lda	#0
                                        ; implicit-def: $rc2
.LBB0_91:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_92 Depth 3
	ldx	__rc2
	stx	__rc24
	jsr	shortcuts
.LBB0_92:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_91 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	54800
	bne	.LBB0_94
; %bb.93:                               ;   in Loop: Header=BB0_92 Depth=3
	lda	54801
	sta	__rc2
	cmp	__rc24
	beq	.LBB0_92
	bra	.LBB0_91
.LBB0_94:                               ;   in Loop: Header=BB0_18 Depth=1
	stz	54800
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	stz	53280
	sta	__rc27
	sec
	sbc	#241
	tax
	lda	__rc24
	sbc	#0
	bne	.LBB0_100
; %bb.95:                               ;   in Loop: Header=BB0_18 Depth=1
	cpx	#10
	bcs	.LBB0_101
.LBB0_96:                               ;   in Loop: Header=BB0_18 Depth=1
	ldy	.LJTI0_1,x
	lda	.LJTI0_1+10,x
	tax
	sty	__rc2
	stx	__rc3
	jmp	(__rc2)
.LBB0_97:                               ;   in Loop: Header=BB0_18 Depth=1
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	sta	__rc2
	asl	__rc2
	stz	__rc3
	rol	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(midnight)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc22
	ldy	#1
	lda	(__rc2),y
	sta	__rc23
	tya
	ldy	#70
	and	(__rc22),y
	and	#1
	beq	.LBB0_98
; %bb.435:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_137
.LBB0_98:                               ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.32)
	stx	__rc2
	ldx	#mos16hi(.L.str.32)
.LBB0_99:                               ;   in Loop: Header=BB0_18 Depth=1
	stx	__rc3
	ldx	#mos16lo(.L.str.33)
	stx	__rc4
	ldx	#mos16hi(.L.str.33)
	bra	.LBB0_104
.LBB0_100:                              ;   in Loop: Header=BB0_18 Depth=1
	cmp	#0
	bcc	.LBB0_96
.LBB0_101:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	eor	#1
	sta	__rc25
	lda	__rc27
	sec
	sbc	#31
	tax
	lda	__rc24
	sbc	#0
	beq	.LBB0_102
; %bb.437:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_116
.LBB0_102:                              ;   in Loop: Header=BB0_18 Depth=1
	cpx	#2
	bcc	.LBB0_103
; %bb.439:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_117
.LBB0_103:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.59)
	stx	__rc2
	ldx	#mos16hi(.L.str.59)
	stx	__rc3
	ldx	#mos16lo(.L.str.60.82)
	stx	__rc4
	ldx	#mos16hi(.L.str.60.82)
.LBB0_104:                              ;   in Loop: Header=BB0_18 Depth=1
	stx	__rc5
	ldx	#mos16lo(.L.str.29)
	stx	__rc6
	ldx	#mos16hi(.L.str.29)
.LBB0_105:                              ;   in Loop: Header=BB0_18 Depth=1
	stx	__rc7
	lda	#0
	stz	__rc26
	jsr	messagebox
; %bb.329:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_106:                              ;   in Loop: Header=BB0_107 Depth=3
	stx	__rc29
	sta	__rc31
	lda	__rc28
	jsr	tracksectorstring
	ldx	__rc30
	stx	__rc2
	asl	__rc2
	lda	__rc31
	rol
	asl	__rc2
	rol
	ldx	#mos16lo(.L.str.38)
	stx	__rc2
	ldx	#mos16hi(.L.str.38)
	stx	__rc3
	ldx	#mos8(s)
	stx	__rc4
	ldx	#mos8(0)
	stx	__rc5
	jsr	progress
	ldx	#0
	stx	__rc2
	ldx	#24
	stx	__rc3
	ldx	__rc29
	stx	__rc4
	ldx	__rc28
	lda	__rc26
	jsr	GetOneSector
	clc
	lda	__rc30
	adc	#32
	sta	__rc5
	lda	__rc31
	adc	#0
	sta	__rc6
	lda	#0
	adc	#8
	stz	__rc2
	stz	__rc3
	stz	__rc4
	sta	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	ldx	#24
	lda	#0
	jsr	lcopy
	ldx	__rc29
	inx
.LBB0_107:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_109 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	stx	__rc2
	lda	__rc22
	clc
	adc	__rc2
	sta	__rc30
	lda	__rc23
	adc	#0
	cpx	#40
	beq	.LBB0_108
; %bb.441:                              ;   in Loop: Header=BB0_107 Depth=3
	jmp	.LBB0_106
.LBB0_108:                              ;   in Loop: Header=BB0_109 Depth=2
	ldx	__rc30
	stx	__rc22
	sta	__rc23
	ldx	__rc28
	inx
.LBB0_109:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_107 Depth 3
	cpx	#81
	bne	.LBB0_110
; %bb.443:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_276
.LBB0_110:                              ;   in Loop: Header=BB0_109 Depth=2
	stx	__rc28
	ldx	#0
	bra	.LBB0_107
.LBB0_111:                              ;   in Loop: Header=BB0_112 Depth=3
	stx	__rc28
	sty	__rc30
	lda	__rc27
	jsr	tracksectorstring
	ldx	__rc30
	stx	__rc2
	asl	__rc2
	lda	__rc29
	rol
	asl	__rc2
	rol
	clc
	adc	#50
	ldx	#mos16lo(.L.str.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.41)
	stx	__rc3
	ldx	#mos8(s)
	stx	__rc4
	ldx	#mos8(0)
	stx	__rc5
	jsr	progress
	clc
	lda	__rc30
	adc	#32
	sta	__rc10
	lda	__rc29
	adc	#0
	sta	__rc2
	lda	#0
	adc	#8
	sta	__rc3
	stz	__rc4
	ldx	#24
	stx	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	ldx	__rc10
	lda	#0
	jsr	lcopy
	ldx	#0
	stx	__rc2
	ldx	#24
	stx	__rc3
	ldx	__rc28
	stx	__rc4
	ldx	__rc27
	lda	__rc24
	jsr	PutOneSector
	ldx	__rc28
	inx
.LBB0_112:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_114 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	stx	__rc2
	lda	__rc22
	clc
	adc	__rc2
	tay
	lda	__rc23
	adc	#0
	sta	__rc29
	cpx	#40
	beq	.LBB0_113
; %bb.445:                              ;   in Loop: Header=BB0_112 Depth=3
	jmp	.LBB0_111
.LBB0_113:                              ;   in Loop: Header=BB0_114 Depth=2
	sty	__rc22
	sta	__rc23
	ldx	__rc27
	inx
.LBB0_114:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_112 Depth 3
	cpx	#81
	bne	.LBB0_115
; %bb.447:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_277
.LBB0_115:                              ;   in Loop: Header=BB0_114 Depth=2
	stx	__rc27
	ldx	#0
	bra	.LBB0_112
.LBB0_116:                              ;   in Loop: Header=BB0_18 Depth=1
	cmp	#0
	bcs	.LBB0_117
; %bb.449:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_103
.LBB0_117:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc24
	bne	.LBB0_119
; %bb.118:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	phy
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	ldx	__rc27
	cpx	#3
	bne	.LBB0_120
; %bb.331:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_150
.LBB0_119:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	(__rc0),y                       ; 1-byte Folded Reload
.LBB0_120:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	bne	.LBB0_123
; %bb.121:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#9
	bne	.LBB0_123
; %bb.122:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc25
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
; %bb.333:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_175
.LBB0_123:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	beq	.LBB0_124
; %bb.451:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_129
.LBB0_124:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#13
	beq	.LBB0_125
; %bb.453:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_129
.LBB0_125:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	sta	__rc4
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(midnight)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc22
	lda	(__rc2),y
	sta	__rc23
	lda	(__rc22),y
	tax
	lda	__rc4
	jsr	getdirententry
	lda	#1
	ldy	#70
	and	(__rc22),y
	and	#1
	beq	.LBB0_126
; %bb.455:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_170
.LBB0_126:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	#16
	ldy	#2
	and	(__rc2),y
	beq	.LBB0_127
; %bb.457:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_184
.LBB0_127:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc2
	clc
	adc	#5
	sta	__rc20
	lda	__rc3
	adc	#0
	sta	__rc21
	lda	(__rc22)
	sta	__rc24
	ldx	__rc20
	stx	__rc2
	ldx	__rc21
	stx	__rc3
	jsr	hyppo_setname
	lda	__rc24
	bne	.LBB0_128
; %bb.459:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_220
.LBB0_128:                              ;   in Loop: Header=BB0_18 Depth=1
	;APP
	ldx	#0
	lda	#70
	sta	54848
	clv
	bcc	errhyp1att0
	lda	#0
	sta	__rc2
	jmp	donehyp1att0
errhyp1att0:
	lda	#255
	sta	__rc2
donehyp1att0:
	nop

	;NO_APP
; %bb.335:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_221
.LBB0_129:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	bne	.LBB0_132
; %bb.130:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#17
	bne	.LBB0_132
; %bb.131:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	__rc26
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(midnight)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc4
	ldy	#1
	lda	(__rc2),y
	sta	__rc5
	lda	(__rc4),y
	inc
	sta	(__rc4),y
; %bb.337:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_132:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	ldx	__rc24
	bne	.LBB0_134
; %bb.133:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#27
	bne	.LBB0_134
; %bb.461:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_150
.LBB0_134:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	beq	.LBB0_135
; %bb.463:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_148
.LBB0_135:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#29
	beq	.LBB0_136
; %bb.465:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_148
.LBB0_136:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	__rc26
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(midnight)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc4
	lda	(__rc2),y
	sta	__rc5
	lda	#10
	clc
	adc	(__rc4),y
	sta	(__rc4),y
; %bb.339:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_137:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	lda	(__rc22),y
	tax
	lda	__rc4
	jsr	getdirententry
	ldy	#2
	lda	(__rc2),y
	tax
	and	#15
	stz	__rc26
	cmp	#5
	bne	.LBB0_138
; %bb.467:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_138:                              ;   in Loop: Header=BB0_18 Depth=1
	txa
	bne	.LBB0_139
; %bb.469:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_139:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	lda	__rc24
	beq	.LBB0_140
; %bb.471:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_176
.LBB0_140:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#245
	beq	.LBB0_141
; %bb.473:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_176
.LBB0_141:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc20
	clc
	adc	#30
	sta	__rc2
	lda	__rc21
	adc	#0
	sta	__rc3
	ldy	#1
	lda	(__rc2),y
	sta	__rc2
	tya
	pha
	phy
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	pla
	cpx	#0
	beq	.LBB0_143
; %bb.142:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	#0
.LBB0_143:                              ;   in Loop: Header=BB0_18 Depth=1
	asl
	tax
	lda	midnight,x
	sta	__rc8
	clc
	adc	#68
	sta	__rc4
	lda	midnight+1,x
	sta	__rc9
                                        ; kill: def $rs4 killed $rs4
	pha
	phy
	lda	__rc8
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc9
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	pla
	adc	#0
	sta	__rc5
	lda	(__rc4),y
	cmp	__rc2
	bne	.LBB0_145
; %bb.144:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#30
	lda	(__rc20),y
	sta	__rc2
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	ldy	#68
	lda	(__rc4),y
.LBB0_145:                              ;   in Loop: Header=BB0_18 Depth=1
	cmp	__rc2
	bcs	.LBB0_146
; %bb.475:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_225
.LBB0_146:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc20
	clc
	adc	#5
	sta	__rc4
	lda	__rc21
	adc	#0
	sta	__rc5
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	bne	.LBB0_147
; %bb.477:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_226
.LBB0_147:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.36)
	stx	__rc6
	ldx	#mos16hi(.L.str.36)
; %bb.341:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_227
.LBB0_148:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	beq	.LBB0_149
; %bb.479:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_160
.LBB0_149:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#95
	beq	.LBB0_150
; %bb.481:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_160
.LBB0_150:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	__rc26
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(midnight)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc22
	lda	(__rc2),y
	sta	__rc23
	lda	#1
	ldy	#70
	and	(__rc22),y
	and	#1
	beq	.LBB0_151
; %bb.483:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_151:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	__rc24
	bra	.LBB0_154
.LBB0_152:                              ;   in Loop: Header=BB0_154 Depth=2
	lda	(__rc22)
	pha
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	jsr	UpdateSectors
.LBB0_153:                              ;   in Loop: Header=BB0_154 Depth=2
	inc	__rc24
.LBB0_154:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldy	#2
	lda	(__rc22),y
	cmp	__rc24
	bcs	.LBB0_155
; %bb.485:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_175
.LBB0_155:                              ;   in Loop: Header=BB0_154 Depth=2
	ldx	__rc24
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	getdirententry
	ldy	#2
	lda	#16
	and	(__rc2),y
	beq	.LBB0_153
; %bb.156:                              ;   in Loop: Header=BB0_154 Depth=2
	ldy	#5
	lda	(__rc2),y
	cmp	#46
	bne	.LBB0_153
; %bb.157:                              ;   in Loop: Header=BB0_154 Depth=2
	ldy	#6
	lda	(__rc2),y
	cmp	#46
	bne	.LBB0_153
; %bb.158:                              ;   in Loop: Header=BB0_154 Depth=2
	lda	__rc2
	clc
	adc	#5
	sta	__rc20
	lda	__rc3
	adc	#0
	sta	__rc21
	ldx	__rc20
	stx	__rc2
	sta	__rc3
	jsr	hyppo_setname
	;APP
	ldx	#0
	lda	#52
	sta	54848
	clv
	bcc	errhypchdir1
	lda	#12
	sta	54848
	clv
	sta	__rc2
	jmp	donehypchdir1
errhypchdir1:
	lda	#255
	sta	__rc2
donehypchdir1:
	nop

	;NO_APP
	ldx	__rc2
	cpx	#16
	bcs	.LBB0_159
; %bb.487:                              ;   in Loop: Header=BB0_154 Depth=2
	jmp	.LBB0_152
.LBB0_159:                              ;   in Loop: Header=BB0_154 Depth=2
	ldx	#mos16lo(.L.str.52)
	stx	__rc2
	ldx	#mos16hi(.L.str.52)
	stx	__rc3
	ldx	#mos16lo(.L.str.53)
	stx	__rc4
	ldx	#mos16hi(.L.str.53)
	stx	__rc5
	ldx	__rc20
	stx	__rc6
	ldx	__rc21
	stx	__rc7
	lda	#0
	jsr	messagebox
; %bb.343:                              ;   in Loop: Header=BB0_154 Depth=2
	jmp	.LBB0_153
.LBB0_160:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	bne	.LBB0_164
; %bb.161:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#145
	bne	.LBB0_164
.LBB0_162:                              ;   in Loop: Header=BB0_18 Depth=1
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc4
	lda	#mos16hi(midnight)
	adc	__rc3
	sta	__rc5
	lda	(__rc4)
	sta	__rc2
	ldy	#1
	lda	(__rc4),y
	sta	__rc3
	lda	(__rc2),y
	stz	__rc26
	bne	.LBB0_163
; %bb.489:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_163:                              ;   in Loop: Header=BB0_18 Depth=1
	dec
	sta	(__rc2),y
; %bb.345:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_164:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	bne	.LBB0_166
; %bb.165:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#157
	beq	.LBB0_168
.LBB0_166:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	cpx	#1
	bne	.LBB0_171
; %bb.167:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#157
	bne	.LBB0_171
.LBB0_168:                              ;   in Loop: Header=BB0_18 Depth=1
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc4
	lda	#mos16hi(midnight)
	adc	__rc3
	sta	__rc5
	lda	(__rc4)
	sta	__rc2
	ldy	#1
	lda	(__rc4),y
	sta	__rc3
	lda	(__rc2),y
	cmp	#11
	bcs	.LBB0_169
; %bb.491:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_188
.LBB0_169:                              ;   in Loop: Header=BB0_18 Depth=1
	clc
	adc	#246
	sta	(__rc2),y
	bra	.LBB0_175
.LBB0_170:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.57)
	stx	__rc2
	ldx	#mos16hi(.L.str.57)
	stx	__rc3
	ldx	#mos16lo(.L.str.58)
	stx	__rc4
	ldx	#mos16hi(.L.str.58)
; %bb.347:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_104
.LBB0_171:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	cpx	#1
	beq	.LBB0_172
; %bb.493:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_178
.LBB0_172:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#242
	beq	.LBB0_173
; %bb.569:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_178
.LBB0_173:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(midnight)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc4
	ldy	#1
	lda	(__rc2),y
	sta	__rc5
	tya
	ldy	#70
	eor	(__rc4),y
	sta	(__rc4),y
	lda	(__rc4)
.LBB0_174:                              ;   in Loop: Header=BB0_18 Depth=1
	jsr	UpdateSectors
.LBB0_175:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	__rc26
; %bb.349:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_176:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc20
	clc
	adc	#5
	sta	__rc4
	lda	__rc21
	adc	#0
	sta	__rc5
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	bne	.LBB0_177
; %bb.495:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_193
.LBB0_177:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.45)
	stx	__rc6
	ldx	#mos16hi(.L.str.45)
; %bb.351:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_194
.LBB0_178:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	cpx	#1
	bne	.LBB0_180
; %bb.179:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#248
	bne	.LBB0_180
; %bb.497:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_97
.LBB0_180:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	cpx	#1
	beq	.LBB0_181
; %bb.499:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_189
.LBB0_181:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#250
	beq	.LBB0_182
; %bb.501:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_189
.LBB0_182:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	54801
	stz	__rc26
	cpx	#1
	bne	.LBB0_183
; %bb.503:
	jmp	.LBB0_262
.LBB0_183:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	54801
	cpx	#2
	beq	.LBB0_353
; %bb.505:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_353:
	jmp	.LBB0_262
.LBB0_184:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc2
	clc
	adc	#5
	sta	__rc20
	lda	__rc3
	adc	#0
	sta	__rc21
	ldx	__rc20
	stx	__rc2
	sta	__rc3
	jsr	hyppo_setname
	;APP
	ldx	#0
	lda	#52
	sta	54848
	clv
	bcc	errhypchdir2
	lda	#12
	sta	54848
	clv
	sta	__rc2
	jmp	donehypchdir2
errhypchdir2:
	lda	#255
	sta	__rc2
donehypchdir2:
	nop

	;NO_APP
	ldx	__rc2
	cpx	#16
	bcs	.LBB0_185
; %bb.507:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_219
.LBB0_185:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.54)
	stx	__rc2
	ldx	#mos16hi(.L.str.54)
	stx	__rc3
	ldx	#mos16lo(.L.str.53)
	stx	__rc4
	ldx	#mos16hi(.L.str.53)
; %bb.355:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_223
.LBB0_186:                              ;   in Loop: Header=BB0_187 Depth=2
	lda	#0
	sta	__rc2
	lda	#24
	sta	__rc3
	sty	__rc4
	stx	__rc20
	sty	__rc21
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	GetOneSector
	ldx	#0
	stx	__rc2
	ldx	#22
	stx	__rc3
	ldx	#0
	stx	__rc4
	ldx	#23
	stx	__rc5
	stz	__rc6
	ldx	__rc21
	lda	__rc20
	jsr	BAMSectorUpdate
	ldx	6144
	ldy	6145
.LBB0_187:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	txa
	bne	.LBB0_186
; %bb.357:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_283
.LBB0_188:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	#0
	stz	__rc26
	sta	(__rc2),y
; %bb.359:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_189:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	cpx	#8
	beq	.LBB0_190
; %bb.509:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_206
.LBB0_190:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc27
	cmp	#246
	beq	.LBB0_191
; %bb.511:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_206
.LBB0_191:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(midnight)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc20
	ldy	#1
	lda	(__rc2),y
	sta	__rc21
	tya
	ldy	#70
	and	(__rc20),y
	and	#1
	beq	.LBB0_192
; %bb.513:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_259
.LBB0_192:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.49)
	stx	__rc2
	ldx	#mos16hi(.L.str.49)
; %bb.361:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_99
.LBB0_193:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.46.81)
	stx	__rc6
	ldx	#mos16hi(.L.str.46.81)
.LBB0_194:                              ;   in Loop: Header=BB0_18 Depth=1
	stx	__rc7
	ldx	#mos16lo(.L.str.44)
	stx	__rc2
	ldx	#mos16hi(.L.str.44)
	stx	__rc3
	lda	#0
	jsr	messagebox
	tax
	bne	.LBB0_195
; %bb.515:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_195:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#3
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#mos16lo(.L.str.38)
	stx	__rc2
	ldx	#mos16hi(.L.str.38)
	stx	__rc3
	ldx	#mos16lo(.L.str.40)
	stx	__rc4
	ldx	#mos16hi(.L.str.40)
	stx	__rc5
	lda	#20
	jsr	progress
	lda	#0
	ldy	#2
	sta	(__rc20),y
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	jsr	GetBAM
	ldx	#mos16lo(.L.str.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.41)
	stx	__rc3
	ldx	#mos16lo(.L.str.47)
	stx	__rc4
	ldx	#mos16hi(.L.str.47)
	stx	__rc5
	lda	#40
	tax
	pha
	txa
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	jsr	progress
	lda	(__rc22)
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#1
	lda	(__rc22),y
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	53376
	stz	__rc2
	stz	__rc3
	stz	__rc4
	ldx	#14
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#0
	lda	__rc20
	jsr	__mulsi3
	sta	__rc24
	stx	__rc21
	ldx	__rc2
	stx	__rc20
	lda	__rc3
	ldx	#8
	pha
	txa
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ora	#8
	sta	__rc31
	ldy	#14
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc29
	stz	__rc2
	stz	__rc28
	stz	__rc30
	ldy	#0
.LBB0_196:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	__rc2
	stx	__rc25
	ldx	__rc29
	stx	__rc2
	cpy	__rc2
	bne	.LBB0_198
; %bb.197:                              ;   in Loop: Header=BB0_196 Depth=2
	ldx	__rc25
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	cpx	__rc2
	bcc	.LBB0_199
; %bb.517:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_205
.LBB0_198:                              ;   in Loop: Header=BB0_196 Depth=2
	stx	__rc2
	cpy	__rc2
	bcc	.LBB0_199
; %bb.519:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_205
.LBB0_199:                              ;   in Loop: Header=BB0_196 Depth=2
	lda	__rc25
	lsr
	tax
	lda	#0
	ror
	stx	__rc2
	lsr	__rc2
	ror
	lsr	__rc2
	ror
	clc
	adc	__rc24
	sta	__rc11
	lda	__rc2
	adc	__rc21
	sta	__rc10
	lda	__rc20
	adc	#0
	sta	__rc2
	lda	__rc31
	adc	#0
	tax
	lda	__rc2
	phy
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stx	__rc3
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	sty	__rc4
	ldx	#26
	stx	__rc5
	sty	__rc6
	sty	__rc7
	ldx	#32
	stx	__rc8
	sty	__rc9
	ldx	__rc10
	stx	__rc26
	ldx	__rc10
	ldy	__rc11
	sty	__rc27
	lda	__rc11
	jsr	lcopy
	lda	__rc25
	beq	.LBB0_202
; %bb.200:                              ;   in Loop: Header=BB0_196 Depth=2
	lda	__rc25
	and	#7
	bne	.LBB0_202
; %bb.201:                              ;   in Loop: Header=BB0_196 Depth=2
	ldx	__rc28
	txa
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc30
	txa
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_202:                              ;   in Loop: Header=BB0_196 Depth=2
	ldx	6656
	beq	.LBB0_204
; %bb.203:                              ;   in Loop: Header=BB0_196 Depth=2
	clc
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc29
	adc	#0
	sta	__rc29
	stx	__rc28
	ldx	6657
	stx	__rc30
.LBB0_204:                              ;   in Loop: Header=BB0_196 Depth=2
	ldy	#0
	lda	#32
	ldx	__rc25
	inx
	stx	__rc2
	pha
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	pla
	cpx	__rc25
	beq	.LBB0_363
; %bb.521:                              ;   in Loop: Header=BB0_196 Depth=2
	jmp	.LBB0_196
.LBB0_363:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_284
.LBB0_205:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.41)
	stx	__rc3
	ldx	#mos16lo(.L.str.48)
	stx	__rc4
	ldx	#mos16hi(.L.str.48)
	stx	__rc5
	stz	__rc26
	lda	#80
	jsr	progress
	lda	(__rc22)
	pha
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	pla
	ldx	__rc20
	jsr	PutBAM
	lda	(__rc22)
	ldx	__rc20
	jsr	UpdateSectors
; %bb.365:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_206:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldx	__rc24
	cpx	#2
	bne	.LBB0_208
; %bb.207:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#157
	bne	.LBB0_208
; %bb.523:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_168
.LBB0_208:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	cpx	#2
	bne	.LBB0_210
; %bb.209:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#242
	bne	.LBB0_210
; %bb.525:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_173
.LBB0_210:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	cpx	#2
	bne	.LBB0_212
; %bb.211:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#248
	bne	.LBB0_212
; %bb.527:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_97
.LBB0_212:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	cpx	#2
	bne	.LBB0_214
; %bb.213:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc27
	cpx	#250
	bne	.LBB0_214
; %bb.529:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_182
.LBB0_214:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	ldy	__rc27
	cpx	#4
	bne	.LBB0_216
; %bb.215:                              ;   in Loop: Header=BB0_18 Depth=1
	cpy	#18
	bne	.LBB0_216
; %bb.531:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_280
.LBB0_216:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	cpx	#4
	bne	.LBB0_217
; %bb.533:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_274
.LBB0_217:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc24
	ldy	__rc27
	cpx	#2
	bne	.LBB0_218
; %bb.535:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_278
.LBB0_218:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.61)
	stx	__rc2
	ldx	#mos16hi(.L.str.61)
	stx	__rc3
	sty	__rc20
	jsr	asciitoscreencode_s
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	jsr	cputs
	stz	__rc2
	stz	__rc26
	stz	__rc3
	ldx	#4
	stx	__rc4
	ldx	__rc24
	lda	__rc20
	jsr	cputhex
	lda	#32
	jsr	cputc
; %bb.367:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_219:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	(__rc22)
	pha
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
; %bb.369:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_174
.LBB0_220:                              ;   in Loop: Header=BB0_18 Depth=1
	;APP
	ldx	#0
	lda	#64
	sta	54848
	clv
	bcc	errhyp0att3
	lda	#0
	sta	__rc2
	jmp	donehyp0att3
errhyp0att3:
	lda	#255
	sta	__rc2
donehyp0att3:
	nop

	;NO_APP
.LBB0_221:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc2
	beq	.LBB0_224
; %bb.222:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.55)
	stx	__rc2
	ldx	#mos16hi(.L.str.55)
	stx	__rc3
	ldx	#mos16lo(.L.str.56)
	stx	__rc4
	ldx	#mos16hi(.L.str.56)
.LBB0_223:                              ;   in Loop: Header=BB0_18 Depth=1
	stx	__rc5
	ldx	__rc20
	stx	__rc6
	ldx	__rc21
; %bb.371:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_105
.LBB0_224:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	__rc26
	lda	#1
	ldy	#70
	ora	(__rc22),y
	sta	(__rc22),y
	lda	(__rc22)
	pha
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	jsr	UpdateSectors
; %bb.373:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_225:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.34)
	stx	__rc2
	ldx	#mos16hi(.L.str.34)
	stx	__rc3
	ldx	#mos16lo(.L.str.35)
	stx	__rc4
	ldx	#mos16hi(.L.str.35)
	stx	__rc5
	ldx	#mos16lo(.L.str.29)
	stx	__rc6
	ldx	#mos16hi(.L.str.29)
	stx	__rc7
	lda	#0
	jsr	messagebox
; %bb.375:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_226:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.37)
	stx	__rc6
	ldx	#mos16hi(.L.str.37)
.LBB0_227:                              ;   in Loop: Header=BB0_18 Depth=1
	stx	__rc7
	ldx	#mos16lo(.L.str.34)
	stx	__rc2
	ldx	#mos16hi(.L.str.34)
	stx	__rc3
	lda	#0
	jsr	messagebox
	tax
	bne	.LBB0_228
; %bb.537:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_228:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.38)
	stx	__rc2
	ldx	#mos16hi(.L.str.38)
	stx	__rc3
                                        ; kill: def $rs1 killed $rs1
	lda	__rc2
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc3
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	#mos16lo(.L.str.39)
	stx	__rc4
	ldx	#mos16hi(.L.str.39)
	stx	__rc5
	tya
	jsr	progress
	lda	(__rc22)
	sta	__rc6
	ldy	#3
	lda	(__rc20),y
	sta	__rc7
	iny
	lda	(__rc20),y
	stz	__rc2
	ldx	#8
	stx	__rc3
	ldx	#128
	stx	__rc4
	ldx	#12
	stx	__rc5
	sta	__rc8
	ldx	#32
	lda	#0
	jsr	readblockchain
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	#mos16lo(.L.str.40)
	stx	__rc4
	ldx	#mos16hi(.L.str.40)
	stx	__rc5
	lda	#30
	jsr	progress
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	eor	#1
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	GetBAM
	ldx	#mos16lo(.L.str.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.41)
	stx	__rc3
	ldx	#mos16lo(.L.str.42)
	stx	__rc4
	ldx	#mos16hi(.L.str.42)
	stx	__rc5
	lda	#40
	jsr	progress
	clc
	lda	__rc0
	adc	#26
	sta	__rc24
	lda	__rc1
	adc	#0
	sta	__rc25
	lda	#0
	sta	(__rc24)
	clc
	lda	__rc0
	adc	#25
	sta	__rc28
	lda	__rc1
	adc	#0
	sta	__rc29
	lda	#255
	tax
	pha
	txa
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	(__rc28)
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	lda	(__rc2)
	sta	__rc30
	stz	53376
	clc
	lda	__rc0
	adc	#24
	sta	__rc22
	lda	__rc1
	adc	#0
	sta	__rc23
	ldx	__rc22
	stx	__rc2
	sta	__rc3
	clc
	lda	__rc0
	adc	#23
	sta	__rc26
	lda	__rc1
	adc	#0
	sta	__rc27
	ldx	__rc26
	stx	__rc4
	sta	__rc5
	stz	__rc31
	lda	#0
	jsr	findnextBAMtracksector
	lda	(__rc26)
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc26
	lda	(__rc22)
	ldx	__rc24
	stx	__rc22
	ldx	__rc25
	stx	__rc23
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc27
	ldy	#0
	ldx	#0
.LBB0_229:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cpx	#12
	bne	.LBB0_231
; %bb.230:                              ;   in Loop: Header=BB0_229 Depth=2
	cpy	#128
	bne	.LBB0_231
; %bb.539:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_236
.LBB0_231:                              ;   in Loop: Header=BB0_229 Depth=2
	clc
	sty	__rc25
	tya
	adc	#32
	sta	__rc10
	stx	__rc24
	txa
	adc	#0
	sta	__rc2
	lda	#0
	adc	#8
	sta	__rc3
	stz	__rc4
	ldx	#24
	stx	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	ldx	__rc10
	lda	#0
	jsr	lcopy
	ldx	6144
	beq	.LBB0_233
; %bb.232:                              ;   in Loop: Header=BB0_229 Depth=2
	ldx	__rc22
	stx	__rc2
	ldx	__rc23
	stx	__rc3
	ldx	__rc28
	stx	__rc4
	ldx	__rc29
	stx	__rc5
	lda	#0
	jsr	findnextBAMtracksector
	lda	(__rc22)
	sta	6144
	lda	(__rc28)
	sta	6145
	lda	(__rc22)
	sta	__rc31
	lda	(__rc28)
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_233:                              ;   in Loop: Header=BB0_229 Depth=2
	ldx	#0
	stx	__rc2
	ldx	#24
	stx	__rc3
	ldx	__rc26
	stx	__rc4
	ldx	__rc27
	lda	__rc30
	jsr	PutOneSector
	lda	6144
	ldy	__rc25
	ldx	__rc24
	iny
	bne	.LBB0_235
; %bb.234:                              ;   in Loop: Header=BB0_229 Depth=2
	inx
.LBB0_235:                              ;   in Loop: Header=BB0_229 Depth=2
	pha
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc26
	pla
	phy
	ldy	__rc31
	sty	__rc27
	ply
	cmp	#0
	beq	.LBB0_238
; %bb.541:                              ;   in Loop: Header=BB0_229 Depth=2
	jmp	.LBB0_229
.LBB0_236:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc31
	beq	.LBB0_238
; %bb.237:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.16)
	stx	__rc2
	ldx	#mos16hi(.L.str.16)
	stx	__rc3
	ldx	#mos16lo(.L.str.17)
	stx	__rc4
	ldx	#mos16hi(.L.str.17)
	stx	__rc5
	ldx	#mos16lo(.L.str.29)
	stx	__rc6
	ldx	#mos16hi(.L.str.29)
	stx	__rc7
	lda	#0
	jsr	messagebox
.LBB0_238:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#3
	phy
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc20),y
	ldy	#4
	phy
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc20),y
	ldx	#mos16lo(.L.str.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.41)
	stx	__rc3
	ldx	#mos16lo(.L.str.43)
	stx	__rc4
	ldx	#mos16hi(.L.str.43)
	stx	__rc5
	lda	#60
	jsr	progress
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	lda	(__rc2)
	ldy	#14
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	53376
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	bne	.LBB0_239
; %bb.543:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_275
.LBB0_239:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	__rc23
.LBB0_240:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#8
	stx	__rc22
	stz	__rc24
	ldx	#0
	stz	__rc30
	ldy	#3
	tya
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#40
	tya
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#8
	tya
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc26
	stz	__rc27
	ldy	#0
	tya
; %bb.377:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_251
.LBB0_241:                              ;   in Loop: Header=BB0_251 Depth=2
	sta	__rc2
	cpx	__rc2
	bcc	.LBB0_242
; %bb.545:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_253
.LBB0_242:                              ;   in Loop: Header=BB0_251 Depth=2
	sta	__rc28
	sty	__rc2
	lsr	__rc2
	sty	__rc25
	lda	#0
	ror
	lsr	__rc2
	ror
	pha
	lda	__rc2
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	lsr	__rc2
	ldx	__rc2
	stx	__rc3
	ror
	sta	__rc2
	lda	#0
	clc
	adc	__rc2
	tay
	lda	__rc3
	adc	__rc23
	sta	__rc10
	lda	#0
	adc	#0
	tax
	lda	__rc22
	adc	#0
	phy
	pha
	txa
	ldy	#12
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stx	__rc2
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	sta	__rc3
	stz	__rc4
	ldx	#27
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc10
	stx	__rc29
	tya
	sty	__rc31
	jsr	lcopy
	lda	__rc25
	and	#7
	beq	.LBB0_244
; %bb.243:                              ;   in Loop: Header=BB0_251 Depth=2
	ldy	#1
	ldx	__rc25
	bra	.LBB0_246
.LBB0_244:                              ;   in Loop: Header=BB0_251 Depth=2
	ldy	#1
	ldx	__rc25
	bne	.LBB0_245
; %bb.547:                              ;   in Loop: Header=BB0_251 Depth=2
	jmp	.LBB0_285
.LBB0_245:                              ;   in Loop: Header=BB0_251 Depth=2
	stx	__rc27
	lda	__rc26
	phy
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc30
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
.LBB0_246:                              ;   in Loop: Header=BB0_251 Depth=2
	lda	6912
	beq	.LBB0_248
; %bb.247:                              ;   in Loop: Header=BB0_251 Depth=2
	stx	__rc2
	clc
	sta	__rc26
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	lda	__rc28
	adc	#0
	sta	__rc28
	ldx	6913
	stx	__rc30
	ldx	__rc26
	stx	__rc3
	bra	.LBB0_249
.LBB0_248:                              ;   in Loop: Header=BB0_251 Depth=2
	sta	__rc3
	stx	__rc2
.LBB0_249:                              ;   in Loop: Header=BB0_251 Depth=2
	lda	#15
	and	6914
	bne	.LBB0_250
; %bb.549:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_286
.LBB0_250:                              ;   in Loop: Header=BB0_251 Depth=2
	ldy	__rc2
	iny
	ldx	#0
	lda	__rc28
.LBB0_251:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sta	__rc2
	cpx	__rc2
	beq	.LBB0_252
; %bb.551:                              ;   in Loop: Header=BB0_251 Depth=2
	jmp	.LBB0_241
.LBB0_252:                              ;   in Loop: Header=BB0_251 Depth=2
	pha
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	pla
	cpy	__rc2
	bcs	.LBB0_253
; %bb.553:                              ;   in Loop: Header=BB0_251 Depth=2
	jmp	.LBB0_242
.LBB0_253:                              ;   in Loop: Header=BB0_18 Depth=1
	lsr	__rc27
	ldx	#1
	bcs	.LBB0_255
; %bb.254:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#0
.LBB0_255:                              ;   in Loop: Header=BB0_18 Depth=1
	stx	__rc6
	ldx	__rc22
	stx	__rc4
	phy
	lda	__rc22
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc23
	stx	__rc5
	lda	__rc23
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	stz	__rc29
	clc
	lda	__rc0
	adc	#28
	sta	__rc22
	lda	__rc1
	adc	#0
	sta	__rc23
	clc
	lda	__rc0
	adc	#27
	sta	__rc24
	lda	__rc1
	adc	#0
	sta	__rc25
	lda	__rc26
	sta	(__rc22)
	lda	__rc30
	sta	(__rc24)
	sty	__rc30
	lda	#0
	ldx	__rc6
	cpx	#1
	ror
	lsr	__rc27
	ror
	ldx	__rc27
	stx	__rc2
	lsr	__rc2
	ror
	sta	__rc3
	lda	#0
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	adc	__rc3
	sta	__rc31
	lda	__rc5
	adc	__rc2
	sta	__rc26
	lda	#0
	adc	#0
	sta	__rc28
	lda	__rc4
	ldy	#11
	sta	(__rc0),y                       ; 1-byte Folded Spill
	adc	#0
	sta	__rc29
	ldx	__rc28
	stx	__rc2
	sta	__rc3
	stz	__rc4
	ldx	#27
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc26
	lda	__rc31
	jsr	lcopy
	ldx	__rc22
	stx	__rc2
	ldx	__rc23
	stx	__rc3
	ldx	__rc24
	stx	__rc4
	ldx	__rc25
	stx	__rc5
	lda	#1
	jsr	findnextBAMtracksector
	lda	(__rc22)
	sta	6912
	lda	(__rc24)
	sta	6913
	lda	(__rc22)
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	(__rc24)
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc31
	stx	__rc4
	ldx	__rc26
	stx	__rc5
	ldx	__rc28
	stx	__rc6
	stz	__rc2
	stz	__rc3
	ldx	__rc29
	stx	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	#27
	lda	#0
	jsr	lcopy
	lsr	__rc27
	lda	#0
	stz	__rc2
	clc
	adc	__rc2
	ldx	#1
	bcs	.LBB0_257
; %bb.256:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#0
.LBB0_257:                              ;   in Loop: Header=BB0_18 Depth=1
	stx	__rc24
	sta	__rc23
	lda	__rc27
	pha
	ldy	#9
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	pla
	adc	__rc22
	sta	__rc10
	lda	#0
	adc	__rc2
	tax
	lda	#0
	pha
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc27
	pla
	adc	__rc27
	stx	__rc2
	sta	__rc3
	stz	__rc4
	ldx	#24
	stx	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	ldx	__rc10
	lda	__rc23
	jsr	lcopy
	ldx	#0
	stx	__rc2
	ldx	#24
	stx	__rc3
                                        ; kill: def $rs1 killed $rs1
	lda	__rc2
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc3
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc26
	jsr	PutOneSector
	lsr	__rc30
	lda	#0
	ror
	lsr	__rc30
	ror
	ldx	__rc30
	stx	__rc3
	lsr	__rc3
	ror
	sta	__rc2
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	clc
	adc	__rc2
	sta	__rc31
	lda	__rc3
	adc	__rc22
	sta	__rc29
	ldy	__rc22
	sty	__rc28
	txa
	adc	#0
	sta	__rc22
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#0
	sta	__rc25
	ldx	__rc22
	stx	__rc2
	sta	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#1
	stx	__rc6
	ldx	__rc29
	lda	__rc31
	jsr	lfill
	lda	#0
	sta	(__rc20)
	dec
	ldy	#1
	sta	(__rc20),y
	ldx	__rc31
	stx	__rc4
	ldx	__rc29
	stx	__rc5
	ldx	__rc22
	stx	__rc6
	stz	__rc2
	stz	__rc3
	stz	__rc9
	ldx	__rc25
	stx	__rc7
	ldx	#32
	stx	__rc8
	ldx	__rc21
	lda	__rc20
	jsr	lcopy
	lda	__rc30
	lsr
	ldx	__rc24
	cpx	#1
	adc	__rc28
	tax
	lda	#0
	stz	__rc2
	adc	__rc2
	sta	__rc2
	lda	#0
	adc	__rc27
	sta	__rc3
	stz	__rc4
	ldy	#24
	sty	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldy	#1
	sty	__rc9
	lda	__rc23
	jsr	lcopy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	lda	__rc26
.LBB0_258:                              ;   in Loop: Header=BB0_18 Depth=1
	jsr	PutOneSector
	ldx	#mos16lo(.L.str.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.41)
	stx	__rc3
	ldx	#mos16lo(.L.str.40)
	stx	__rc4
	ldx	#mos16hi(.L.str.40)
	stx	__rc5
	lda	#80
	jsr	progress
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc21
	lda	(__rc20)
	pha
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	pla
	ldx	__rc22
	jsr	PutBAM
	lda	(__rc20)
	ldx	__rc22
; %bb.379:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_174
.LBB0_259:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.50)
	stx	__rc2
	ldx	#mos16hi(.L.str.50)
	stx	__rc3
	ldx	#mos16lo(.L.str.51)
	stx	__rc4
	ldx	#mos16hi(.L.str.51)
	stx	__rc5
	ldx	#mos16lo(.L.str.29)
	stx	__rc6
	ldx	#mos16hi(.L.str.29)
	stx	__rc7
	lda	#0
	stz	__rc26
	jsr	messagebox
	tax
	bne	.LBB0_260
; %bb.555:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_260:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	beq	.LBB0_261
; %bb.557:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_281
.LBB0_261:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	#1
; %bb.381:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_282
.LBB0_262:
	ldx	#128
	txa
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#30
	txa
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#132
	txa
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	clrhome
	ldx	#mos16lo(.L.str.6)
	stx	__rc2
	ldx	#mos16hi(.L.str.6)
	stx	__rc3
	jsr	msprintf
	ldy	#0
	bra	.LBB0_268
.LBB0_263:                              ;   in Loop: Header=BB0_268 Depth=1
	cpx	#0
	bcs	.LBB0_265
; %bb.559:
	jmp	.LBB0_273
.LBB0_264:                              ;   in Loop: Header=BB0_268 Depth=1
	cmp	#0
	bcs	.LBB0_265
; %bb.561:
	jmp	.LBB0_273
.LBB0_265:                              ;   in Loop: Header=BB0_268 Depth=1
	ldx	53266
	stx	__rc2
.LBB0_266:                              ;   Parent Loop BB0_268 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	53266
	cpx	__rc2
	beq	.LBB0_266
; %bb.267:                              ;   in Loop: Header=BB0_268 Depth=1
	clc
	phy
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#192
	sta	(__rc0),y                       ; 1-byte Folded Spill
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#255
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#255
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	tya
	adc	#255
	tay
.LBB0_268:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_266 Depth 2
	tya
	bne	.LBB0_272
; %bb.269:                              ;   in Loop: Header=BB0_268 Depth=1
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	cpx	#0
	bne	.LBB0_263
; %bb.270:                              ;   in Loop: Header=BB0_268 Depth=1
	tax
	bne	.LBB0_264
; %bb.271:                              ;   in Loop: Header=BB0_268 Depth=1
	phy
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	cmp	#65
	bcc	.LBB0_273
	bra	.LBB0_265
.LBB0_272:                              ;   in Loop: Header=BB0_268 Depth=1
	cpy	#0
	bcc	.LBB0_273
; %bb.563:                              ;   in Loop: Header=BB0_268 Depth=1
	jmp	.LBB0_265
.LBB0_273:
	ldx	#0
	;APP
	lda	#126
	sta	54848
	clv

	;NO_APP
	txa
	sta	__rc16
	tay
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
	adc	#29
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.LBB0_274:                              ;   in Loop: Header=BB0_18 Depth=1
	cpy	#21
	bne	.LBB0_383
; %bb.565:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_103
.LBB0_383:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_217
.LBB0_275:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#14
	stx	__rc23
; %bb.385:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_240
.LBB0_276:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	__rc22
	ldx	#1
	stz	__rc23
; %bb.387:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_114
.LBB0_277:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	(__rc20)
	ldx	__rc25
; %bb.389:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_174
.LBB0_278:                              ;   in Loop: Header=BB0_18 Depth=1
	cpy	#145
	beq	.LBB0_279
; %bb.567:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_218
.LBB0_279:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
; %bb.391:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_162
.LBB0_280:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	__rc26
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(midnight)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc4
	ldy	#1
	lda	(__rc2),y
	sta	__rc5
	lda	(__rc4)
	jsr	UpdateSectors
; %bb.393:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_281:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	#0
.LBB0_282:                              ;   in Loop: Header=BB0_18 Depth=1
	asl
	tax
	lda	(__rc20)
	sta	__rc26
	stz	__rc22
	ldy	midnight,x
	sty	__rc20
	lda	midnight+1,x
	tax
	stx	__rc21
	ldx	#1
	stz	__rc23
	lda	(__rc20)
	sta	__rc24
; %bb.395:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_109
.LBB0_283:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#0
	stx	__rc2
	ldx	#22
	stx	__rc3
	ldx	#1
	stx	__rc4
	ldx	#40
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	jsr	PutOneSector
	ldx	5632
	ldy	5633
	lda	#0
	sta	__rc2
	lda	#23
	sta	__rc3
	sty	__rc4
	lda	__rc20
	jsr	PutOneSector
; %bb.397:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_205
.LBB0_284:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	6658
	ldx	__rc27
	stx	__rc4
	ldx	__rc26
	stx	__rc5
	pha
	phy
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc6
	sty	__rc2
	sty	__rc3
	phy
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc7
	pla
	sta	__rc8
	sty	__rc9
	ldx	#26
	lda	#0
	jsr	lcopy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	lsr
	lsr
	lsr
	tax
	clc
	lda	#0
	adc	__rc24
	tay
	txa
	adc	__rc21
	sta	__rc10
	lda	#0
	adc	__rc20
	tax
	lda	#0
	pha
	phy
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	pla
	adc	__rc2
	stx	__rc2
	sta	__rc3
	stz	__rc4
	ldx	#24
	stx	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	ldx	__rc10
	tya
	jsr	lcopy
	ldx	#0
	stx	__rc2
	ldx	#24
	stx	__rc3
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	jsr	PutOneSector
	ldx	6659
	stx	__rc21
	ldx	6660
	stx	__rc24
	stz	53376
	ldx	#0
	stx	__rc2
	ldx	#22
	stx	__rc3
	ldx	#1
	stx	__rc4
	ldx	#40
	lda	__rc20
	jsr	GetOneSector
	ldx	5632
	ldy	5633
	lda	#0
	sta	__rc2
	lda	#23
	sta	__rc3
	sty	__rc4
	lda	__rc20
	jsr	GetOneSector
	ldy	__rc24
	ldx	__rc21
; %bb.399:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_187
.LBB0_285:                              ;   in Loop: Header=BB0_251 Depth=2
	stz	__rc27
; %bb.401:                              ;   in Loop: Header=BB0_251 Depth=2
	jmp	.LBB0_246
.LBB0_286:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc3
	sta	(__rc20)
	lda	6913
	sta	(__rc20),y
	ldx	__rc31
	stx	__rc4
	ldx	__rc29
	stx	__rc5
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc6
	stz	__rc2
	stz	__rc3
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc21
	lda	__rc20
	jsr	lcopy
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	lsr
	tax
	clc
	lda	#0
	adc	__rc24
	tay
	txa
	adc	__rc23
	sta	__rc10
	lda	#0
	adc	__rc24
	sta	__rc2
	lda	#0
	adc	__rc22
	sta	__rc3
	stz	__rc4
	ldx	#24
	stx	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	ldx	__rc10
	tya
	jsr	lcopy
	ldx	#0
	stx	__rc2
	ldx	#24
	stx	__rc3
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
; %bb.403:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_258
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.section	.rodata.main,"a",@progbits
.LJTI0_0:
	.byte	.LBB0_82@mos16lo
	.byte	.LBB0_86@mos16lo
	.byte	.LBB0_87@mos16lo
	.byte	.LBB0_88@mos16lo
	.byte	.LBB0_89@mos16lo
	.byte	.LBB0_82@mos16hi
	.byte	.LBB0_86@mos16hi
	.byte	.LBB0_87@mos16hi
	.byte	.LBB0_88@mos16hi
	.byte	.LBB0_89@mos16hi
.LJTI0_1:
	.byte	.LBB0_103@mos16lo
	.byte	.LBB0_173@mos16lo
	.byte	.LBB0_103@mos16lo
	.byte	.LBB0_103@mos16lo
	.byte	.LBB0_97@mos16lo
	.byte	.LBB0_103@mos16lo
	.byte	.LBB0_103@mos16lo
	.byte	.LBB0_97@mos16lo
	.byte	.LBB0_103@mos16lo
	.byte	.LBB0_182@mos16lo
	.byte	.LBB0_103@mos16hi
	.byte	.LBB0_173@mos16hi
	.byte	.LBB0_103@mos16hi
	.byte	.LBB0_103@mos16hi
	.byte	.LBB0_97@mos16hi
	.byte	.LBB0_103@mos16hi
	.byte	.LBB0_103@mos16hi
	.byte	.LBB0_97@mos16hi
	.byte	.LBB0_103@mos16hi
	.byte	.LBB0_182@mos16hi
                                        ; -- End function
	.section	.text.hyppo_setname,"ax",@progbits
	.type	hyppo_setname,@function         ; -- Begin function hyppo_setname
hyppo_setname:                          ; @hyppo_setname
; %bb.0:
	ldx	__rc2
	stx	__rc4
	ldx	__rc3
	stx	__rc5
	ldx	#28
	ldy	#0
	sty	__rc2
	ldy	#28
	sty	__rc3
	stx	fnamehi
	jsr	strcpy
	ldy	fnamehi
	;APP
	ldx	#0
	lda	#46
	sta	54848
	clv
	bcc	errhypsetnam4
	lda	#0
	sta	__rc2
	jmp	donehypsetnam4
errhypsetnam4:
	lda	#255
	sta	__rc2
donehypsetnam4:
	nop

	;NO_APP
	rts
.Lfunc_end1:
	.size	hyppo_setname, .Lfunc_end1-hyppo_setname
                                        ; -- End function
	.section	.text.getsfn,"ax",@progbits
	.type	getsfn,@function                ; -- Begin function getsfn
getsfn:                                 ; @getsfn
; %bb.0:
	ldx	#0
	ldy	#0
	bra	.LBB2_4
.LBB2_1:                                ;   in Loop: Header=BB2_4 Depth=1
	cmp	#33
	bcc	.LBB2_3
; %bb.2:                                ;   in Loop: Header=BB2_4 Depth=1
	sty	__rc2
	inc	__rc2
	sta	7233,y
	ldy	__rc2
.LBB2_3:                                ;   in Loop: Header=BB2_4 Depth=1
	inx
.LBB2_4:                                ; =>This Inner Loop Header: Depth=1
	cpx	#8
	beq	.LBB2_6
; %bb.5:                                ;   in Loop: Header=BB2_4 Depth=1
	lda	6721,x
	cmp	#32
	bne	.LBB2_1
.LBB2_6:
	ldx	#0
	stz	__rc3
	lda	#46
	sta	7233,y
	tya
	inc
	sta	__rc2
	bra	.LBB2_10
.LBB2_7:                                ;   in Loop: Header=BB2_10 Depth=1
	cmp	#33
	bcc	.LBB2_9
; %bb.8:                                ;   in Loop: Header=BB2_10 Depth=1
	sty	__rc4
	ldy	__rc2
	sta	7233,y
	ldy	__rc4
	inc	__rc2
.LBB2_9:                                ;   in Loop: Header=BB2_10 Depth=1
	inx
.LBB2_10:                               ; =>This Inner Loop Header: Depth=1
	cpx	#3
	beq	.LBB2_12
; %bb.11:                               ;   in Loop: Header=BB2_10 Depth=1
	lda	6729,x
	cmp	#32
	bne	.LBB2_7
.LBB2_12:
	tya
	inc
	bne	.LBB2_14
; %bb.13:
	inc	__rc3
.LBB2_14:
	ldx	__rc3
	bne	.LBB2_17
; %bb.15:
	ldx	__rc2
	cmp	__rc2
	bne	.LBB2_18
; %bb.16:
	phy
	plx
	bra	.LBB2_18
.LBB2_17:
	ldx	__rc2
.LBB2_18:
	stz	7233,x
	rts
.Lfunc_end2:
	.size	getsfn, .Lfunc_end2-getsfn
                                        ; -- End function
	.section	.text.ReadSector,"ax",@progbits
	.type	ReadSector,@function            ; -- Begin function ReadSector
ReadSector:                             ; @ReadSector
; %bb.0:
	cpx	#0
	bne	.LBB3_1
; %bb.7:
	jmp	.LBB3_5
.LBB3_1:
	phx
	ply
	ldx	#32
	clc
	adc	#32
	sta	53376
	stx	53377
	tya
	dec
	sta	53380
	ldx	__rc2
	stx	.LReadSector_sstk               ; 1-byte Folded Spill
	lda	__rc2
	lsr
	inc
	sta	53381
	stz	53382
	ldx	#65
	stx	53377
.LBB3_2:                                ; =>This Inner Loop Header: Depth=1
	ldx	53378
	bmi	.LBB3_2
; %bb.3:
	lda	53378
	and	#24
	beq	.LBB3_6
; %bb.4:
	ldx	#64
	stx	53376
	ldx	#2
	stx	53280
	ldx	#mos16lo(.L.str.4.14)
	stx	__rc2
	ldx	#mos16hi(.L.str.4.14)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	tya
	jsr	mprintf
	ldx	#mos16lo(.L.str.5.15)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.15)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	.LReadSector_sstk               ; 1-byte Folded Reload
	jsr	mprintf
	lda	53378
	stz	__rc2
	stz	__rc3
	ldx	#0
	jsr	mhprintf
	jsr	cputln
	jsr	cgetc
	lda	#255
	rts
.LBB3_5:
	lda	#252
	rts
.LBB3_6:
	lda	54921
	and	#127
	sta	54921
	ldx	.LReadSector_sstk               ; 1-byte Folded Reload
	txa
	and	#1
	rts
.Lfunc_end3:
	.size	ReadSector, .Lfunc_end3-ReadSector
                                        ; -- End function
	.section	.text.GetOneSector,"ax",@progbits
	.type	GetOneSector,@function          ; -- Begin function GetOneSector
GetOneSector:                           ; @GetOneSector
; %bb.0:
	ldy	__rc20
	phy
	ldy	__rc21
	phy
	ldy	__rc4
	pha
	lda	__rc2
	sta	__rc20
	lda	__rc3
	sta	__rc21
	pla
	sty	__rc2
	jsr	ReadSector
	cmp	#2
	bcs	.LBB4_5
; %bb.1:
	tax
	beq	.LBB4_3
; %bb.2:
	ldx	#109
	bra	.LBB4_4
.LBB4_3:
	ldx	#108
.LBB4_4:
	ldy	#1
	lda	#253
	sta	__rc2
	lda	#15
	sta	__rc3
	lda	__rc20
	sta	__rc4
	lda	__rc21
	sta	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	sty	__rc9
	lda	#0
	jsr	lcopy
.LBB4_5:
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.Lfunc_end4:
	.size	GetOneSector, .Lfunc_end4-GetOneSector
                                        ; -- End function
	.section	.text.PutOneSector,"ax",@progbits
	.type	PutOneSector,@function          ; -- Begin function PutOneSector
PutOneSector:                           ; @PutOneSector
; %bb.0:
	ldy	__rc22
	phy
	ldy	__rc23
	phy
	stx	mos8(.LPutOneSector_zp_stk)
	ldy	__rc4
	sty	mos8(.LPutOneSector_zp_stk+3)
	ldy	__rc2
	sty	__rc22
	ldy	__rc3
	sty	__rc23
	ldy	__rc4
	sty	__rc2
	sta	mos8(.LPutOneSector_zp_stk+2)
	jsr	ReadSector
	ldy	#108
	ldx	mos8(.LPutOneSector_zp_stk+3)
	stx	mos8(.LPutOneSector_zp_stk+1)
	lsr	mos8(.LPutOneSector_zp_stk+3)
	bcc	.LBB5_2
; %bb.1:
	ldy	#109
.LBB5_2:
	ldx	#1
	sty	__rc5
	ldy	#253
	sty	__rc6
	stz	__rc2
	stz	__rc3
	stz	__rc4
	ldy	#15
	sty	__rc7
	stz	__rc8
	stx	__rc9
	ldx	__rc23
	lda	__rc22
	jsr	lcopy
	lda	mos8(.LPutOneSector_zp_stk+1)
	and	#254
	cmp	#20
	sta	mos8(.LPutOneSector_zp_stk+1)
	lda	mos8(.LPutOneSector_zp_stk+2)
	bcc	.LBB5_4
; %bb.3:
	clc
	adc	#40
	bra	.LBB5_5
.LBB5_4:
	clc
	adc	#32
.LBB5_5:
	sta	53376
	ldx	#32
	stx	53377
	ldx	mos8(.LPutOneSector_zp_stk)
	dex
	stx	53380
	ldx	mos8(.LPutOneSector_zp_stk+3)
	inx
	stx	53381
	stz	53382
	ldx	#132
	stx	53377
.LBB5_6:                                ; =>This Inner Loop Header: Depth=1
	ldx	53378
	bmi	.LBB5_6
; %bb.7:
	lda	53378
	and	#24
	beq	.LBB5_9
; %bb.8:
	ldx	#64
	stx	53376
	ldx	#2
	stx	53280
	ldx	#mos16lo(.L.str.7.17)
	stx	__rc2
	ldx	#mos16hi(.L.str.7.17)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	mos8(.LPutOneSector_zp_stk)
	jsr	mprintf
	ldx	#mos16lo(.L.str.5.15)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.15)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	mos8(.LPutOneSector_zp_stk+1)
	jsr	mprintf
	lda	53378
	stz	__rc2
	stz	__rc3
	ldx	#0
	jsr	mhprintf
	jsr	cputln
	jsr	cgetc
	bra	.LBB5_10
.LBB5_9:
	lda	54921
	and	#127
	sta	54921
.LBB5_10:
	plx
	stx	__rc23
	plx
	stx	__rc22
	rts
.Lfunc_end5:
	.size	PutOneSector, .Lfunc_end5-PutOneSector
                                        ; -- End function
	.section	.text.GetBAM,"ax",@progbits
	.type	GetBAM,@function                ; -- Begin function GetBAM
GetBAM:                                 ; @GetBAM
; %bb.0:
	asl
	tax
	lda	#0
	rol
	tay
	lda	#0
	rol
	sta	__rc2
	clc
	txa
	adc	#28
	sta	__rc10
	tya
	adc	#0
	sta	__rc4
	lda	__rc2
	adc	#8
	ldx	#22
	ldy	#2
	pha
	lda	__rc4
	sta	__rc2
	pla
	sta	__rc3
	stx	__rc5
	stz	__rc4
	stz	__rc6
	stz	__rc7
	stz	__rc8
	sty	__rc9
	ldx	__rc10
	lda	#0
	jmp	lcopy
.Lfunc_end6:
	.size	GetBAM, .Lfunc_end6-GetBAM
                                        ; -- End function
	.section	.text.PutBAM,"ax",@progbits
	.type	PutBAM,@function                ; -- Begin function PutBAM
PutBAM:                                 ; @PutBAM
; %bb.0:
	sta	.LPutBAM_sstk+1                 ; 1-byte Folded Spill
	stx	.LPutBAM_sstk                   ; 1-byte Folded Spill
	ldx	#0
	stx	__rc2
	ldx	#22
	stx	__rc3
	ldx	#40
	ldy	#1
	sty	__rc4
	jsr	PutOneSector
	ldx	5632
	ldy	5633
	lda	#0
	sta	__rc2
	lda	#23
	sta	__rc3
	sty	__rc4
	lda	.LPutBAM_sstk+1                 ; 1-byte Folded Reload
	jsr	PutOneSector
	ldx	.LPutBAM_sstk                   ; 1-byte Folded Reload
	stx	__rc2
	asl	__rc2
	lda	#0
	rol
	tax
	lda	#0
	rol
	tay
	clc
	lda	__rc2
	adc	#28
	sta	__rc5
	txa
	adc	#0
	sta	__rc6
	tya
	adc	#8
	ldx	#2
	sta	__rc7
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc8
	stx	__rc9
	ldx	#22
	lda	#0
	jmp	lcopy
.Lfunc_end7:
	.size	PutBAM, .Lfunc_end7-PutBAM
                                        ; -- End function
	.section	.text.readblockchain,"ax",@progbits
	.type	readblockchain,@function        ; -- Begin function readblockchain
readblockchain:                         ; @readblockchain
; %bb.0:
	ldy	__rc20
	phy
	ldy	__rc21
	phy
	ldy	__rc22
	phy
	ldy	__rc23
	phy
	ldy	__rc24
	sty	.Lreadblockchain_sstk           ; 1-byte Folded Spill
	ldy	__rc25
	sty	.Lreadblockchain_sstk+1         ; 1-byte Folded Spill
	ldy	__rc26
	sty	.Lreadblockchain_sstk+2         ; 1-byte Folded Spill
	ldy	__rc27
	sty	.Lreadblockchain_sstk+3         ; 1-byte Folded Spill
	ldy	__rc28
	sty	.Lreadblockchain_sstk+4         ; 1-byte Folded Spill
	ldy	__rc29
	sty	.Lreadblockchain_sstk+5         ; 1-byte Folded Spill
	ldy	__rc30
	sty	.Lreadblockchain_sstk+6         ; 1-byte Folded Spill
	sta	__rc25
	stx	__rc26
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	ldx	__rc4
	stx	__rc22
	ldx	__rc5
	stx	__rc23
	ldx	__rc6
	stx	__rc24
	lda	__rc7
	ldx	__rc8
	stx	__rc29
	stz	53376
	ldx	#0
	ldy	#0
.LBB8_1:                                ; =>This Inner Loop Header: Depth=1
	cpy	__rc23
	bne	.LBB8_3
; %bb.2:                                ;   in Loop: Header=BB8_1 Depth=1
	cpx	__rc22
	bne	.LBB8_3
; %bb.9:
	jmp	.LBB8_6
.LBB8_3:                                ;   in Loop: Header=BB8_1 Depth=1
	sty	__rc28
	stx	__rc27
	ldx	#0
	stx	__rc2
	ldx	#24
	stx	__rc3
	ldx	__rc29
	stx	__rc4
	tax
	lda	__rc24
	jsr	GetOneSector
	lda	#0
	clc
	adc	__rc25
	sta	__rc4
	lda	__rc27
	adc	__rc26
	sta	__rc5
	lda	__rc28
	adc	__rc20
	sta	__rc6
	lda	#0
	adc	__rc21
	ldx	6144
	stx	__rc30
	ldx	6145
	stx	__rc29
	stz	__rc2
	stz	__rc3
	sta	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	ldx	#24
	lda	#0
	jsr	lcopy
	ldy	__rc28
	lda	__rc30
	ldx	__rc27
	inx
	bne	.LBB8_5
; %bb.4:                                ;   in Loop: Header=BB8_1 Depth=1
	iny
.LBB8_5:                                ;   in Loop: Header=BB8_1 Depth=1
	inc	__rc30
	dec	__rc30
	beq	.LBB8_8
; %bb.11:                               ;   in Loop: Header=BB8_1 Depth=1
	jmp	.LBB8_1
.LBB8_6:
	tax
	beq	.LBB8_8
; %bb.7:
	lda	#0
	ldx	#mos16lo(.L.str.14)
	stx	__rc2
	ldx	#mos16hi(.L.str.14)
	stx	__rc3
	ldx	#mos16lo(.L.str.15)
	stx	__rc4
	ldx	#mos16hi(.L.str.15)
	stx	__rc5
	ldx	#mos16lo(.L.str.29)
	stx	__rc6
	ldx	#mos16hi(.L.str.29)
	stx	__rc7
	jsr	messagebox
.LBB8_8:
	ldx	.Lreadblockchain_sstk+6         ; 1-byte Folded Reload
	stx	__rc30
	ldx	.Lreadblockchain_sstk+5         ; 1-byte Folded Reload
	stx	__rc29
	ldx	.Lreadblockchain_sstk+4         ; 1-byte Folded Reload
	stx	__rc28
	ldx	.Lreadblockchain_sstk+3         ; 1-byte Folded Reload
	stx	__rc27
	ldx	.Lreadblockchain_sstk+2         ; 1-byte Folded Reload
	stx	__rc26
	ldx	.Lreadblockchain_sstk+1         ; 1-byte Folded Reload
	stx	__rc25
	ldx	.Lreadblockchain_sstk           ; 1-byte Folded Reload
	stx	__rc24
	plx
	stx	__rc23
	plx
	stx	__rc22
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.Lfunc_end8:
	.size	readblockchain, .Lfunc_end8-readblockchain
                                        ; -- End function
	.section	.text.BAMSectorUpdate,"ax",@progbits
	.type	BAMSectorUpdate,@function       ; -- Begin function BAMSectorUpdate
BAMSectorUpdate:                        ; @BAMSectorUpdate
; %bb.0:
	ldy	__rc20
	phy
	ldy	__rc21
	phy
	ldy	__rc22
	phy
	ldy	__rc23
	phy
	tay
	cmp	#41
	bcc	.LBB9_2
; %bb.1:
	ldy	__rc4
	sty	__rc20
	ldy	__rc5
	sty	__rc21
	clc
	adc	#216
	tay
	bra	.LBB9_3
.LBB9_2:
	lda	__rc2
	sta	__rc20
	lda	__rc3
	sta	__rc21
.LBB9_3:
	dey
	sty	__rc5
	lda	__rc6
	beq	.LBB9_6
; %bb.4:
	stx	mos8(.LBAMSectorUpdate_zp_stk)
	cpx	#8
	bcs	.LBB9_8
; %bb.5:
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+2) ; 1-byte Folded Spill
	tya
	sty	mos8(.LBAMSectorUpdate_zp_stk+3) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	__rc20
	tay
	txa
	adc	__rc21
	sta	__rc2
	clc
	tya
	adc	#17
; %bb.25:
	jmp	.LBB9_21
.LBB9_6:
	stx	mos8(.LBAMSectorUpdate_zp_stk)
	cpx	#8
	bcc	.LBB9_7
; %bb.41:
	jmp	.LBB9_10
.LBB9_7:
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+2) ; 1-byte Folded Spill
	tya
	sty	mos8(.LBAMSectorUpdate_zp_stk+3) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	__rc20
	tay
	txa
	adc	__rc21
	sta	__rc2
	clc
	tya
	adc	#17
; %bb.27:
	jmp	.LBB9_23
.LBB9_8:
	cpx	#16
	ldx	#0
	bcc	.LBB9_9
; %bb.43:
	jmp	.LBB9_12
.LBB9_9:
	clc
	lda	mos8(.LBAMSectorUpdate_zp_stk)
	adc	#248
	sta	mos8(.LBAMSectorUpdate_zp_stk)
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	mos8(.LBAMSectorUpdate_zp_stk+2) ; 1-byte Folded Spill
	ldy	__rc5
	sty	mos8(.LBAMSectorUpdate_zp_stk+3) ; 1-byte Folded Spill
	lda	__rc5
	jsr	__mulhi3
	clc
	adc	__rc20
	tay
	txa
	adc	__rc21
	sta	__rc2
	clc
	tya
	adc	#18
; %bb.29:
	jmp	.LBB9_21
.LBB9_10:
	cpx	#16
	bcc	.LBB9_11
; %bb.45:
	jmp	.LBB9_14
.LBB9_11:
	clc
	txa
	adc	#248
	sta	mos8(.LBAMSectorUpdate_zp_stk)
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+2) ; 1-byte Folded Spill
	sty	mos8(.LBAMSectorUpdate_zp_stk+3) ; 1-byte Folded Spill
	tya
	jsr	__mulhi3
	clc
	adc	__rc20
	tay
	txa
	adc	__rc21
	sta	__rc2
	clc
	tya
	adc	#18
; %bb.31:
	jmp	.LBB9_23
.LBB9_12:
	ldy	mos8(.LBAMSectorUpdate_zp_stk)
	cpy	#24
	bcc	.LBB9_13
; %bb.47:
	jmp	.LBB9_16
.LBB9_13:
	clc
	lda	mos8(.LBAMSectorUpdate_zp_stk)
	adc	#240
	sta	mos8(.LBAMSectorUpdate_zp_stk)
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	mos8(.LBAMSectorUpdate_zp_stk+2) ; 1-byte Folded Spill
	ldy	__rc5
	sty	mos8(.LBAMSectorUpdate_zp_stk+3) ; 1-byte Folded Spill
	lda	__rc5
	jsr	__mulhi3
	clc
	adc	__rc20
	tay
	txa
	adc	__rc21
	sta	__rc2
	clc
	tya
	adc	#19
; %bb.33:
	jmp	.LBB9_21
.LBB9_14:
	cpx	#24
	bcc	.LBB9_15
; %bb.49:
	jmp	.LBB9_18
.LBB9_15:
	clc
	txa
	adc	#240
	sta	mos8(.LBAMSectorUpdate_zp_stk)
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+2) ; 1-byte Folded Spill
	tya
	sty	mos8(.LBAMSectorUpdate_zp_stk+3) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	__rc20
	tay
	txa
	adc	__rc21
	sta	__rc2
	clc
	tya
	adc	#19
; %bb.35:
	jmp	.LBB9_23
.LBB9_16:
	ldy	mos8(.LBAMSectorUpdate_zp_stk)
	cpy	#32
	bcc	.LBB9_17
; %bb.51:
	jmp	.LBB9_20
.LBB9_17:
	clc
	lda	mos8(.LBAMSectorUpdate_zp_stk)
	adc	#232
	sta	mos8(.LBAMSectorUpdate_zp_stk)
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	mos8(.LBAMSectorUpdate_zp_stk+2) ; 1-byte Folded Spill
	lda	__rc5
	ldy	__rc5
	sty	mos8(.LBAMSectorUpdate_zp_stk+3) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	__rc20
	tay
	txa
	adc	__rc21
	sta	__rc2
	clc
	tya
	adc	#20
; %bb.37:
	jmp	.LBB9_21
.LBB9_18:
	cpx	#32
	bcc	.LBB9_19
; %bb.53:
	jmp	.LBB9_22
.LBB9_19:
	clc
	txa
	adc	#232
	sta	mos8(.LBAMSectorUpdate_zp_stk)
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+2) ; 1-byte Folded Spill
	tya
	sty	mos8(.LBAMSectorUpdate_zp_stk+3) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	__rc20
	tay
	txa
	adc	__rc21
	sta	__rc2
	clc
	tya
	adc	#20
; %bb.39:
	jmp	.LBB9_23
.LBB9_20:
	clc
	lda	mos8(.LBAMSectorUpdate_zp_stk)
	adc	#224
	sta	mos8(.LBAMSectorUpdate_zp_stk)
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	mos8(.LBAMSectorUpdate_zp_stk+2) ; 1-byte Folded Spill
	lda	__rc5
	ldy	__rc5
	sty	mos8(.LBAMSectorUpdate_zp_stk+3) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	__rc20
	tay
	txa
	adc	__rc21
	sta	__rc2
	clc
	tya
	adc	#21
.LBB9_21:
	sta	__rc22
	lda	__rc2
	adc	#0
	sta	__rc23
	lda	#1
	ldx	#0
	ldy	mos8(.LBAMSectorUpdate_zp_stk)
	sty	__rc2
	jsr	__ashlhi3
	eor	#255
	and	(__rc22)
	sta	(__rc22)
	ldx	#255
	stx	mos8(.LBAMSectorUpdate_zp_stk+1) ; 1-byte Folded Spill
	bra	.LBB9_24
.LBB9_22:
	clc
	txa
	adc	#224
	sta	mos8(.LBAMSectorUpdate_zp_stk)
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+2) ; 1-byte Folded Spill
	tya
	sty	mos8(.LBAMSectorUpdate_zp_stk+3) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	__rc20
	tay
	txa
	adc	__rc21
	sta	__rc2
	clc
	tya
	adc	#21
.LBB9_23:
	sta	__rc22
	lda	__rc2
	adc	#0
	sta	__rc23
	ldx	mos8(.LBAMSectorUpdate_zp_stk)
	stx	__rc2
	ldx	#0
	lda	#1
	tay
	sty	mos8(.LBAMSectorUpdate_zp_stk+1) ; 1-byte Folded Spill
	jsr	__ashlhi3
	ora	(__rc22)
	sta	(__rc22)
.LBB9_24:
	ldx	mos8(.LBAMSectorUpdate_zp_stk+2) ; 1-byte Folded Reload
	lda	mos8(.LBAMSectorUpdate_zp_stk+3) ; 1-byte Folded Reload
	ldy	#6
	stz	__rc3
	sty	__rc2
	jsr	__mulhi3
	stx	__rc2
	clc
	adc	__rc20
	sta	__rc4
	lda	__rc21
	adc	__rc2
	sta	__rc5
	ldy	#16
	clc
	lda	mos8(.LBAMSectorUpdate_zp_stk+1) ; 1-byte Folded Reload
	adc	(__rc4),y
	sta	(__rc4),y
	plx
	stx	__rc23
	plx
	stx	__rc22
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.Lfunc_end9:
	.size	BAMSectorUpdate, .Lfunc_end9-BAMSectorUpdate
                                        ; -- End function
	.section	.text.findnextBAMtracksector,"ax",@progbits
	.type	findnextBAMtracksector,@function ; -- Begin function findnextBAMtracksector
findnextBAMtracksector:                 ; @findnextBAMtracksector
; %bb.0:
	ldx	__rc22
	phx
	ldx	__rc23
	phx
	ldx	__rc26
	phx
	ldx	__rc27
	phx
	ldx	__rc28
	stx	.LfindnextBAMtracksector_sstk   ; 1-byte Folded Spill
	ldx	__rc29
	stx	.LfindnextBAMtracksector_sstk+1 ; 1-byte Folded Spill
	sta	mos8(.LfindnextBAMtracksector_zp_stk+2)
	ldx	__rc2
	stx	__rc26
	ldx	__rc3
	stx	__rc27
	ldx	__rc4
	stx	__rc22
	ldx	__rc5
	stx	__rc23
	ldx	#0
.LBB10_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_19 Depth 2
	cpx	#80
	bne	.LBB10_2
; %bb.30:
	jmp	.LBB10_25
.LBB10_2:                               ;   in Loop: Header=BB10_1 Depth=1
	stx	mos8(.LfindnextBAMtracksector_zp_stk+4)
	lda	.L__const.findnextBAMtracksector.strategy,x
	tax
	lda	mos8(.LfindnextBAMtracksector_zp_stk+2)
	beq	.LBB10_4
; %bb.3:                                ;   in Loop: Header=BB10_1 Depth=1
	inx
.LBB10_4:                               ;   in Loop: Header=BB10_1 Depth=1
	cpx	#80
	ldy	#mos16lo(BAMsector)
	sty	__rc2
	ldy	#mos16hi(BAMsector)
	sty	__rc3
	stz	mos8(.LfindnextBAMtracksector_zp_stk)
	stz	__rc4
	bcs	.LBB10_8
; %bb.5:                                ;   in Loop: Header=BB10_1 Depth=1
	cpx	#40
	bcs	.LBB10_7
; %bb.6:                                ;   in Loop: Header=BB10_1 Depth=1
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
	stx	__rc4
	bra	.LBB10_8
.LBB10_7:                               ;   in Loop: Header=BB10_1 Depth=1
	ldy	#mos16lo(BAMsector+2)
	sty	__rc2
	ldy	#mos16hi(BAMsector+2)
	sty	__rc3
	clc
	txa
	adc	#216
	sta	__rc4
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
.LBB10_8:                               ;   in Loop: Header=BB10_1 Depth=1
	lda	(__rc2)
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	ldy	#1
	lda	(__rc2),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+1)
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc4
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	clc
	lda	mos8(.LfindnextBAMtracksector_zp_stk+3)
	adc	__rc2
	sta	__rc28
	lda	mos8(.LfindnextBAMtracksector_zp_stk+1)
	adc	__rc3
	sta	__rc29
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+4)
	lda	#0
; %bb.26:                               ;   in Loop: Header=BB10_1 Depth=1
	jmp	.LBB10_19
.LBB10_9:                               ;   in Loop: Header=BB10_19 Depth=2
	cmp	#16
	bcs	.LBB10_11
; %bb.10:                               ;   in Loop: Header=BB10_19 Depth=2
	ldy	#18
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
	adc	#248
	bra	.LBB10_16
.LBB10_11:                              ;   in Loop: Header=BB10_19 Depth=2
	cmp	#24
	bcs	.LBB10_13
; %bb.12:                               ;   in Loop: Header=BB10_19 Depth=2
	ldy	#19
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
	adc	#240
	bra	.LBB10_16
.LBB10_13:                              ;   in Loop: Header=BB10_19 Depth=2
	cmp	#32
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	bcs	.LBB10_15
; %bb.14:                               ;   in Loop: Header=BB10_19 Depth=2
	ldy	#20
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
	adc	#232
	bra	.LBB10_16
.LBB10_15:                              ;   in Loop: Header=BB10_19 Depth=2
	ldy	#21
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
	adc	#224
.LBB10_16:                              ;   in Loop: Header=BB10_19 Depth=2
	sta	__rc2
.LBB10_17:                              ;   in Loop: Header=BB10_19 Depth=2
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	and	mos8(.LfindnextBAMtracksector_zp_stk+3)
	bne	.LBB10_23
; %bb.18:                               ;   in Loop: Header=BB10_19 Depth=2
	inc	mos8(.LfindnextBAMtracksector_zp_stk+5)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+4)
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
.LBB10_19:                              ;   Parent Loop BB10_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cmp	#40
	beq	.LBB10_22
; %bb.20:                               ;   in Loop: Header=BB10_19 Depth=2
	cmp	#8
	bcc	.LBB10_21
; %bb.32:                               ;   in Loop: Header=BB10_19 Depth=2
	jmp	.LBB10_9
.LBB10_21:                              ;   in Loop: Header=BB10_19 Depth=2
	ldy	#17
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+5)
	stx	__rc2
	bra	.LBB10_17
.LBB10_22:                              ;   in Loop: Header=BB10_1 Depth=1
	inx
; %bb.28:                               ;   in Loop: Header=BB10_1 Depth=1
	jmp	.LBB10_1
.LBB10_23:
	ldx	#1
	inc	mos8(.LfindnextBAMtracksector_zp_stk)
	ldy	#0
	sty	__rc2
	ldy	#22
	sty	__rc3
	ldy	#0
	sty	__rc4
	ldy	#23
	sty	__rc5
	stx	__rc6
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+5)
	ldy	mos8(.LfindnextBAMtracksector_zp_stk)
	sty	mos8(.LfindnextBAMtracksector_zp_stk+6) ; 1-byte Folded Spill
	lda	mos8(.LfindnextBAMtracksector_zp_stk)
	jsr	BAMSectorUpdate
.LBB10_24:
	lda	mos8(.LfindnextBAMtracksector_zp_stk+6) ; 1-byte Folded Reload
	sta	(__rc26)
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
	sta	(__rc22)
	ldx	.LfindnextBAMtracksector_sstk+1 ; 1-byte Folded Reload
	stx	__rc29
	ldx	.LfindnextBAMtracksector_sstk   ; 1-byte Folded Reload
	stx	__rc28
	plx
	stx	__rc27
	plx
	stx	__rc26
	plx
	stx	__rc23
	plx
	stx	__rc22
	rts
.LBB10_25:
	ldx	#255
	stx	mos8(.LfindnextBAMtracksector_zp_stk+6) ; 1-byte Folded Spill
	stz	mos8(.LfindnextBAMtracksector_zp_stk+5)
	bra	.LBB10_24
.Lfunc_end10:
	.size	findnextBAMtracksector, .Lfunc_end10-findnextBAMtracksector
                                        ; -- End function
	.section	.text.tracksectorstring,"ax",@progbits
	.type	tracksectorstring,@function     ; -- Begin function tracksectorstring
tracksectorstring:                      ; @tracksectorstring
; %bb.0:
	stx	mos8(.Ltracksectorstring_zp_stk+2) ; 1-byte Folded Spill
	ldx	#84
	stx	mos8(s)
	ldx	#114
	stx	mos8(s+1)
	ldx	#97
	stx	mos8(s+2)
	ldx	#99
	stx	mos8(s+3)
	ldx	#107
	stx	mos8(s+4)
	ldx	#58
	stx	mos8(s+5)
	ldx	#32
	stx	mos8(s+6)
	ldx	#mos8(.Ltracksectorstring_zp_stk+1)
	ldy	#mos8(0)
	stx	__rc2
	sty	__rc3
	ldx	#10
	jsr	__udivmodqi4
	clc
	adc	#48
	tax
	lda	mos8(.Ltracksectorstring_zp_stk+1)
	stx	mos8(s+7)
	ora	#48
	sta	mos8(s+8)
	ldx	#83
	stx	mos8(s+10)
	ldx	#101
	stx	mos8(s+11)
	ldx	#99
	stx	mos8(s+12)
	ldx	#116
	stx	mos8(s+13)
	ldx	#111
	stx	mos8(s+14)
	ldx	#114
	stx	mos8(s+15)
	ldx	#58
	stx	mos8(s+16)
	ldx	#32
	stx	mos8(s+9)
	stx	mos8(s+17)
	ldx	#mos8(.Ltracksectorstring_zp_stk)
	stx	__rc2
	ldx	#mos8(0)
	stx	__rc3
	ldx	#10
	lda	mos8(.Ltracksectorstring_zp_stk+2) ; 1-byte Folded Reload
	jsr	__udivmodqi4
	clc
	adc	#48
	tax
	lda	mos8(.Ltracksectorstring_zp_stk)
	stx	mos8(s+18)
	ora	#48
	sta	mos8(s+19)
	stz	mos8(s+20)
	rts
.Lfunc_end11:
	.size	tracksectorstring, .Lfunc_end11-tracksectorstring
                                        ; -- End function
	.section	.text.getdirententry,"ax",@progbits
	.type	getdirententry,@function        ; -- Begin function getdirententry
getdirententry:                         ; @getdirententry
; %bb.0:
	stx	mos8(.Lgetdirententry_zp_stk+2)
	ldx	#0
	stx	mos8(.Lgetdirententry_zp_stk)
	ldx	#0
	stx	mos8(.Lgetdirententry_zp_stk+1)
	stz	53376
	ldx	#14
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#0
	jsr	__mulsi3
	sta	mos8(.Lgetdirententry_zp_stk+3)
	stx	mos8(.Lgetdirententry_zp_stk+4)
	ldx	__rc2
	stx	mos8(.Lgetdirententry_zp_stk+5)
	lda	__rc3
	ldx	#8
	stx	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Spill
	ora	#8
	sta	mos8(.Lgetdirententry_zp_stk+6)
	ldx	#0
	txa
.LBB12_1:                               ; =>This Inner Loop Header: Depth=1
	phx
	ply
	sta	__rc2
	ldx	#0
	cpx	__rc2
	bne	.LBB12_3
; %bb.2:                                ;   in Loop: Header=BB12_1 Depth=1
	sty	__rc3
	ldy	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Reload
	sty	__rc2
	ldy	__rc3
	cpy	__rc2
	bcc	.LBB12_4
; %bb.11:
	jmp	.LBB12_10
.LBB12_3:                               ;   in Loop: Header=BB12_1 Depth=1
	sta	__rc2
	cpx	__rc2
	bcc	.LBB12_4
; %bb.13:
	jmp	.LBB12_10
.LBB12_4:                               ;   in Loop: Header=BB12_1 Depth=1
	sta	mos8(.Lgetdirententry_zp_stk+7)
	sty	mos8(.Lgetdirententry_zp_stk+8)
	tya
	lsr
	tay
	lda	#0
	ror
	sty	__rc2
	lsr	__rc2
	ror
	lsr	__rc2
	ror
	clc
	adc	mos8(.Lgetdirententry_zp_stk+3)
	sta	__rc11
	lda	__rc2
	adc	mos8(.Lgetdirententry_zp_stk+4)
	sta	__rc10
	lda	mos8(.Lgetdirententry_zp_stk+5)
	adc	#0
	sta	__rc2
	lda	mos8(.Lgetdirententry_zp_stk+6)
	adc	#0
	sta	__rc3
	stz	__rc4
	ldy	#26
	sty	__rc5
	stz	__rc6
	stz	__rc7
	ldy	#32
	sty	__rc8
	stz	__rc9
	ldx	__rc10
	lda	__rc11
	jsr	lcopy
	ldx	6659
	beq	.LBB12_10
; %bb.5:                                ;   in Loop: Header=BB12_1 Depth=1
	ldx	6656
	beq	.LBB12_7
; %bb.6:                                ;   in Loop: Header=BB12_1 Depth=1
	clc
	lda	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Reload
	adc	#8
	sta	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Spill
	lda	mos8(.Lgetdirententry_zp_stk+7)
	adc	#0
	bra	.LBB12_8
.LBB12_7:                               ;   in Loop: Header=BB12_1 Depth=1
	lda	mos8(.Lgetdirententry_zp_stk+7)
.LBB12_8:                               ;   in Loop: Header=BB12_1 Depth=1
	ldy	mos8(.Lgetdirententry_zp_stk+8)
	ldx	mos8(.Lgetdirententry_zp_stk+8)
	inx
	cpy	mos8(.Lgetdirententry_zp_stk+2)
	beq	.LBB12_9
; %bb.15:                               ;   in Loop: Header=BB12_1 Depth=1
	jmp	.LBB12_1
.LBB12_9:
	ldx	#0
	stx	mos8(.Lgetdirententry_zp_stk)
	ldx	#26
	stx	mos8(.Lgetdirententry_zp_stk+1)
.LBB12_10:
	ldx	mos8(.Lgetdirententry_zp_stk)
	stx	__rc2
	ldx	mos8(.Lgetdirententry_zp_stk+1)
	stx	__rc3
	rts
.Lfunc_end12:
	.size	getdirententry, .Lfunc_end12-getdirententry
                                        ; -- End function
	.section	.text.strcopy,"ax",@progbits
	.type	strcopy,@function               ; -- Begin function strcopy
strcopy:                                ; @strcopy
; %bb.0:
	ldy	#0
	bra	.LBB13_2
.LBB13_1:                               ;   in Loop: Header=BB13_2 Depth=1
	lda	.L.str.25,y
	sta	(__rc2),y
	iny
.LBB13_2:                               ; =>This Inner Loop Header: Depth=1
	cpy	#12
	bne	.LBB13_1
; %bb.3:
	lda	#0
	sta	(__rc2),y
	rts
.Lfunc_end13:
	.size	strcopy, .Lfunc_end13-strcopy
                                        ; -- End function
	.section	.text.cputln,"ax",@progbits
	.type	cputln,@function                ; -- Begin function cputln
cputln:                                 ; @cputln
; %bb.0:
	ldx	g_curScreenH
	stx	__rc4
	ldx	mos8(g_curY)
	lda	#0
	phx
	ply
	iny
	bne	.LBB14_2
; %bb.1:
	inc
.LBB14_2:
	cmp	#0
	bne	.LBB14_5
; %bb.3:
	cpy	__rc4
	bcs	.LBB14_6
.LBB14_4:
	inx
; %bb.10:
	jmp	.LBB14_9
.LBB14_5:
	cmp	#0
	bcc	.LBB14_4
.LBB14_6:
	ldx	mos8(g_curScreenW)
	stx	__rc2
	stx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Spill
	ldx	#0
	stz	__rc3
	lda	__rc4
	jsr	__mulhi3
	sta	mos8(.Lcputln_zp_stk+4)         ; 1-byte Folded Spill
	stx	mos8(.Lcputln_zp_stk+3)         ; 1-byte Folded Spill
	jsr	getscreenaddr
	stx	__rc4
	clc
	ldx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Reload
	stx	__rc5
	adc	__rc5
	sta	mos8(.Lcputln_zp_stk+7)         ; 1-byte Folded Spill
	stx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Spill
	stx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Spill
	lda	__rc4
	adc	#0
	sta	mos8(.Lcputln_zp_stk+6)         ; 1-byte Folded Spill
	lda	__rc2
	adc	#0
	sta	mos8(.Lcputln_zp_stk+8)         ; 1-byte Folded Spill
	lda	__rc3
	adc	#0
	sta	mos8(.Lcputln_zp_stk+9)         ; 1-byte Folded Spill
	jsr	getscreenaddr
	sta	__rc4
	stx	__rc5
	ldx	__rc2
	stx	__rc6
	ldy	__rc3
	lda	mos8(.Lcputln_zp_stk+4)         ; 1-byte Folded Reload
	sec
	ldx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Reload
	stx	__rc2
	sbc	__rc2
	sta	__rc8
	sta	mos8(.Lcputln_zp_stk+1)         ; 1-byte Folded Spill
	lda	mos8(.Lcputln_zp_stk+3)         ; 1-byte Folded Reload
	sbc	#0
	ldx	#1
	bcs	.LBB14_8
; %bb.7:
	ldx	#0
.LBB14_8:
	stx	mos8(.Lcputln_zp_stk+5)         ; 1-byte Folded Spill
	sta	__rc9
	sta	mos8(.Lcputln_zp_stk+2)         ; 1-byte Folded Spill
	ldx	mos8(.Lcputln_zp_stk+8)         ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lcputln_zp_stk+9)         ; 1-byte Folded Reload
	stx	__rc3
	sty	__rc7
	ldx	mos8(.Lcputln_zp_stk+6)         ; 1-byte Folded Reload
	lda	mos8(.Lcputln_zp_stk+7)         ; 1-byte Folded Reload
	jsr	lcopy
	ldx	#248
	ldy	#15
	stx	__rc2
	sty	__rc3
	stz	__rc4
	stz	__rc5
	stx	__rc6
	sty	__rc7
	ldx	mos8(.Lcputln_zp_stk+1)         ; 1-byte Folded Reload
	stx	__rc8
	ldx	mos8(.Lcputln_zp_stk+2)         ; 1-byte Folded Reload
	stx	__rc9
	ldx	#0
	lda	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Reload
	jsr	lcopy
	jsr	getscreenaddr
	stx	__rc5
	ldx	mos8(.Lcputln_zp_stk+4)         ; 1-byte Folded Reload
	stx	__rc4
	clc
	adc	__rc4
	tay
	ldx	mos8(.Lcputln_zp_stk+3)         ; 1-byte Folded Reload
	stx	__rc4
	lda	__rc5
	adc	__rc4
	sta	__rc6
	lda	__rc2
	adc	#0
	sta	__rc2
	lda	__rc3
	adc	#0
	sta	__rc4
	ldx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Reload
	stx	__rc5
	stx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Spill
	sec
	tya
	sbc	__rc5
	tay
	lda	__rc6
	sbc	#0
	sta	__rc7
	lda	__rc2
	sbc	#0
	sta	__rc2
	lda	__rc4
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
.LBB14_9:
	stz	mos8(g_curX)
	stx	mos8(g_curY)
	rts
.Lfunc_end14:
	.size	cputln, .Lfunc_end14-cputln
                                        ; -- End function
	.section	.text.csputdec,"ax",@progbits
	.type	csputdec,@function              ; -- Begin function csputdec
csputdec:                               ; @csputdec
; %bb.0:
	sta	mos8(.Lcsputdec_zp_stk+2)
	ldy	__rc4
	sty	mos8(.Lcsputdec_zp_stk)
	ldy	__rc2
	sty	mos8(.Lcsputdec_zp_stk+4)
	ldy	__rc3
	sty	mos8(.Lcsputdec_zp_stk+5)
	stz	mos8(.Lcsputdec_zp_stk+17)
	ldy	#9
.LBB15_1:                               ; =>This Inner Loop Header: Depth=1
	sty	mos8(.Lcsputdec_zp_stk+6)
	stx	mos8(.Lcsputdec_zp_stk+3)
	ldx	#mos8(.Lcsputdec_zp_stk+18)
	stx	__rc8
	ldx	#mos8(0)
	stx	__rc9
	ldx	#10
	stx	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	ldx	mos8(.Lcsputdec_zp_stk+3)
	lda	mos8(.Lcsputdec_zp_stk+2)
	sty	mos8(.Lcsputdec_zp_stk+1)
	jsr	__udivmodsi4
	sta	__rc4
	lda	#48
	ora	mos8(.Lcsputdec_zp_stk+18)
	ldy	mos8(.Lcsputdec_zp_stk+6)
	sta	mos8(.Lcsputdec_zp_stk+7),y
	dec	mos8(.Lcsputdec_zp_stk+1)
	lda	mos8(.Lcsputdec_zp_stk+5)
	bne	.LBB15_5
; %bb.2:                                ;   in Loop: Header=BB15_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+4)
	bne	.LBB15_6
; %bb.3:                                ;   in Loop: Header=BB15_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+3)
	bne	.LBB15_7
; %bb.4:                                ;   in Loop: Header=BB15_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+2)
	cmp	#10
	bra	.LBB15_8
.LBB15_5:                               ;   in Loop: Header=BB15_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+5)
	bra	.LBB15_7
.LBB15_6:                               ;   in Loop: Header=BB15_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+4)
.LBB15_7:                               ;   in Loop: Header=BB15_1 Depth=1
	cmp	#0
.LBB15_8:                               ;   in Loop: Header=BB15_1 Depth=1
	ldy	__rc4
	sty	mos8(.Lcsputdec_zp_stk+2)
	ldy	__rc2
	sty	mos8(.Lcsputdec_zp_stk+4)
	ldy	__rc3
	sty	mos8(.Lcsputdec_zp_stk+5)
	ldy	mos8(.Lcsputdec_zp_stk+1)
	bcs	.LBB15_1
; %bb.9:
	sec
	lda	#10
	sbc	mos8(.Lcsputdec_zp_stk)
	sta	__rc3
	lda	#0
	sbc	#0
	sta	__rc4
	bra	.LBB15_11
.LBB15_10:                              ;   in Loop: Header=BB15_11 Depth=1
	lda	#32
	sta	mos8(.Lcsputdec_zp_stk+7),y
	dey
.LBB15_11:                              ; =>This Inner Loop Header: Depth=1
	sty	__rc2
	ldx	__rc3
	cpx	__rc2
	lda	__rc4
	sbc	#0
	bvc	.LBB15_13
; %bb.12:                               ;   in Loop: Header=BB15_11 Depth=1
	eor	#128
.LBB15_13:                              ;   in Loop: Header=BB15_11 Depth=1
	ldx	#1
	cmp	#0
	bmi	.LBB15_15
; %bb.14:                               ;   in Loop: Header=BB15_11 Depth=1
	ldx	#0
.LBB15_15:                              ;   in Loop: Header=BB15_11 Depth=1
	tya
	bne	.LBB15_17
; %bb.16:                               ;   in Loop: Header=BB15_11 Depth=1
	ldx	#0
.LBB15_17:                              ;   in Loop: Header=BB15_11 Depth=1
	txa
	bne	.LBB15_10
; %bb.18:
	lda	#mos8(.Lcsputdec_zp_stk+7)
	clc
	sty	__rc2
	adc	__rc2
	sta	__rc2
	lda	#mos8(0)
	adc	#0
	sta	__rc3
	inc	__rc2
	bne	.LBB15_20
; %bb.19:
	inc	__rc3
.LBB15_20:
	jmp	cputs
.Lfunc_end15:
	.size	csputdec, .Lfunc_end15-csputdec
                                        ; -- End function
	.section	.text.asciitoscreencode_s,"ax",@progbits
	.type	asciitoscreencode_s,@function   ; -- Begin function asciitoscreencode_s
asciitoscreencode_s:                    ; @asciitoscreencode_s
; %bb.0:
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
.LBB16_1:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB16_3
; %bb.2:                                ;   in Loop: Header=BB16_1 Depth=1
	inc	__rc3
.LBB16_3:                               ;   in Loop: Header=BB16_1 Depth=1
	ldy	#32
	cmp	#160
	beq	.LBB16_9
; %bb.4:                                ;   in Loop: Header=BB16_1 Depth=1
	tax
	cpx	#192
	bcc	.LBB16_6
; %bb.5:                                ;   in Loop: Header=BB16_1 Depth=1
	eor	#128
	bra	.LBB16_8
.LBB16_6:                               ;   in Loop: Header=BB16_1 Depth=1
	cmp	#96
	bcc	.LBB16_12
; %bb.7:                                ;   in Loop: Header=BB16_1 Depth=1
	clc
	adc	#160
.LBB16_8:                               ;   in Loop: Header=BB16_1 Depth=1
	tay
.LBB16_9:                               ;   in Loop: Header=BB16_1 Depth=1
	tya
	sta	(__rc4)
	inc	__rc4
	bne	.LBB16_11
; %bb.10:                               ;   in Loop: Header=BB16_1 Depth=1
	inc	__rc5
.LBB16_11:                              ;   in Loop: Header=BB16_1 Depth=1
	tya
	bne	.LBB16_1
	bra	.LBB16_14
.LBB16_12:                              ;   in Loop: Header=BB16_1 Depth=1
	clc
	tay
	adc	#165
	cmp	#5
	bcs	.LBB16_9
; %bb.13:                               ;   in Loop: Header=BB16_1 Depth=1
	tax
	ldy	mos8(.Lswitch.table.asciitoscreencode),x
	bra	.LBB16_9
.LBB16_14:
	ldx	820
	beq	.LBB16_16
; %bb.15:
	rts
.LBB16_16:
	ldx	#32
	stx	820
	stz	821
	rts
.Lfunc_end16:
	.size	asciitoscreencode_s, .Lfunc_end16-asciitoscreencode_s
                                        ; -- End function
	.section	.text.clrhome,"ax",@progbits
	.type	clrhome,@function               ; -- Begin function clrhome
clrhome:                                ; @clrhome
; %bb.0:
	ldx	mos8(g_curScreenW)
	lda	g_curScreenH
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	tay
	lda	53332
	and	#1
	sta	__rc2
	tya
	jsr	__ashlhi3
	sta	__rc5
	sta	mos8(.Lclrhome_zp_stk)          ; 1-byte Folded Spill
	stx	__rc6
	stx	mos8(.Lclrhome_zp_stk+1)        ; 1-byte Folded Spill
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
	ldy	#248
	lda	#15
	sty	__rc2
	sta	__rc3
	stx	__rc4
	ldx	mos8(.Lclrhome_zp_stk)          ; 1-byte Folded Reload
	stx	__rc5
	ldx	mos8(.Lclrhome_zp_stk+1)        ; 1-byte Folded Reload
	stx	__rc6
	ldx	#0
	txa
	jsr	lfill
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	rts
.Lfunc_end17:
	.size	clrhome, .Lfunc_end17-clrhome
                                        ; -- End function
	.section	.text.msprintf,"ax",@progbits
	.type	msprintf,@function              ; -- Begin function msprintf
msprintf:                               ; @msprintf
; %bb.0:
	jsr	asciitoscreencode_s
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	jmp	cputs
.Lfunc_end18:
	.size	msprintf, .Lfunc_end18-msprintf
                                        ; -- End function
	.section	.text.mprintf,"ax",@progbits
	.type	mprintf,@function               ; -- Begin function mprintf
mprintf:                                ; @mprintf
; %bb.0:
	sta	mos8(.Lmprintf_zp_stk)          ; 1-byte Folded Spill
	stx	mos8(.Lmprintf_zp_stk+1)        ; 1-byte Folded Spill
	ldx	__rc4
	stx	mos8(.Lmprintf_zp_stk+2)        ; 1-byte Folded Spill
	ldx	__rc5
	stx	mos8(.Lmprintf_zp_stk+3)        ; 1-byte Folded Spill
	jsr	asciitoscreencode_s
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	jsr	cputs
	stz	__rc4
	ldx	mos8(.Lmprintf_zp_stk+2)        ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lmprintf_zp_stk+3)        ; 1-byte Folded Reload
	stx	__rc3
	ldx	mos8(.Lmprintf_zp_stk+1)        ; 1-byte Folded Reload
	lda	mos8(.Lmprintf_zp_stk)          ; 1-byte Folded Reload
	jmp	csputdec
.Lfunc_end19:
	.size	mprintf, .Lfunc_end19-mprintf
                                        ; -- End function
	.section	.text.mhprintf,"ax",@progbits
	.type	mhprintf,@function              ; -- Begin function mhprintf
mhprintf:                               ; @mhprintf
; %bb.0:
	sta	.Lmhprintf_sstk                 ; 1-byte Folded Spill
	stx	.Lmhprintf_sstk+1               ; 1-byte Folded Spill
	ldx	__rc2
	stx	.Lmhprintf_sstk+2               ; 1-byte Folded Spill
	ldx	__rc3
	stx	.Lmhprintf_sstk+3               ; 1-byte Folded Spill
	ldx	#mos16lo(.L.str.6.16)
	stx	__rc2
	ldx	#mos16hi(.L.str.6.16)
	stx	__rc3
	jsr	asciitoscreencode_s
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	jsr	cputs
	ldx	#2
	ldy	.Lmhprintf_sstk+2               ; 1-byte Folded Reload
	sty	__rc2
	ldy	.Lmhprintf_sstk+3               ; 1-byte Folded Reload
	sty	__rc3
	stx	__rc4
	ldx	.Lmhprintf_sstk+1               ; 1-byte Folded Reload
	lda	.Lmhprintf_sstk                 ; 1-byte Folded Reload
	jmp	cputhex
.Lfunc_end20:
	.size	mhprintf, .Lfunc_end20-mhprintf
                                        ; -- End function
	.section	.text.mcputsxy,"ax",@progbits
	.type	mcputsxy,@function              ; -- Begin function mcputsxy
mcputsxy:                               ; @mcputsxy
; %bb.0:
	sta	mos8(.Lmcputsxy_zp_stk)         ; 1-byte Folded Spill
	stx	mos8(.Lmcputsxy_zp_stk+1)       ; 1-byte Folded Spill
	jsr	asciitoscreencode_s
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldx	mos8(.Lmcputsxy_zp_stk+1)       ; 1-byte Folded Reload
	lda	mos8(.Lmcputsxy_zp_stk)         ; 1-byte Folded Reload
	jmp	cputsxy
.Lfunc_end21:
	.size	mcputsxy, .Lfunc_end21-mcputsxy
                                        ; -- End function
	.section	.text.mcbox,"ax",@progbits
	.type	mcbox,@function                 ; -- Begin function mcbox
mcbox:                                  ; @mcbox
; %bb.0:
	tay
	stx	mos8(.Lmcbox_zp_stk+2)
	ldx	__rc4
	stx	mos8(.Lmcbox_zp_stk)
	ldx	__rc2
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	sec
	sty	__rc2
	txa
	sbc	__rc2
	sta	mos8(.Lmcbox_zp_stk+6)
	sty	.Lmcbox_sstk
	sty	mos8(.Lmcbox_zp_stk+5)
	lda	mos8(.Lmcbox_zp_stk+2)
	sta	.Lmcbox_sstk+1
	stx	.Lmcbox_sstk+2
	stx	mos8(.Lmcbox_zp_stk+4)
	ldx	__rc3
	stx	.Lmcbox_sstk+3
	stx	mos8(.Lmcbox_zp_stk+3)
	ldx	#mos16lo(.Lmcbox_sstk)
	ldy	#mos16hi(.Lmcbox_sstk)
	stx	__rc2
	sty	__rc3
	jsr	fillrect
	ldx	#112
	stx	__rc2
	ldx	mos8(.Lmcbox_zp_stk+2)
	lda	mos8(.Lmcbox_zp_stk+5)
	jsr	cputcxy
	ldx	#109
	stx	__rc2
	ldx	mos8(.Lmcbox_zp_stk+3)
	ldy	mos8(.Lmcbox_zp_stk+5)
	sty	mos8(.Lmcbox_zp_stk+1)
	lda	mos8(.Lmcbox_zp_stk+5)
	jsr	cputcxy
	ldx	#110
	stx	__rc2
	ldx	mos8(.Lmcbox_zp_stk+2)
	lda	mos8(.Lmcbox_zp_stk+4)
	jsr	cputcxy
	ldx	#125
	stx	__rc2
	ldx	mos8(.Lmcbox_zp_stk+3)
	stx	mos8(.Lmcbox_zp_stk+5)
	ldy	mos8(.Lmcbox_zp_stk+4)
	sty	mos8(.Lmcbox_zp_stk+3)
	lda	mos8(.Lmcbox_zp_stk+4)
	jsr	cputcxy
	lda	mos8(.Lmcbox_zp_stk+6)
	cmp	#2
	ldx	mos8(.Lmcbox_zp_stk+6)
	stx	mos8(.Lmcbox_zp_stk+7)          ; 1-byte Folded Spill
	bcs	.LBB22_2
; %bb.1:
	ldx	#1
.LBB22_2:
	lda	mos8(.Lmcbox_zp_stk+1)
	sta	mos8(.Lmcbox_zp_stk+4)
	bra	.LBB22_4
.LBB22_3:                               ;   in Loop: Header=BB22_4 Depth=1
	inc	mos8(.Lmcbox_zp_stk+1)
	ldy	#64
	sty	__rc2
	stx	mos8(.Lmcbox_zp_stk+6)
	ldx	mos8(.Lmcbox_zp_stk+2)
	lda	mos8(.Lmcbox_zp_stk+1)
	jsr	cputcxy
	ldx	#64
	stx	__rc2
	ldx	mos8(.Lmcbox_zp_stk+5)
	lda	mos8(.Lmcbox_zp_stk+1)
	jsr	cputcxy
	ldx	mos8(.Lmcbox_zp_stk+6)
	lda	mos8(.Lmcbox_zp_stk+4)
.LBB22_4:                               ; =>This Inner Loop Header: Depth=1
	dex
	bne	.LBB22_3
; %bb.5:
	ldx	mos8(.Lmcbox_zp_stk+2)
	inx
	stx	mos8(.Lmcbox_zp_stk+1)
	bra	.LBB22_7
.LBB22_6:                               ;   in Loop: Header=BB22_7 Depth=1
	ldy	#93
	sty	__rc2
	stx	mos8(.Lmcbox_zp_stk+2)
	lda	mos8(.Lmcbox_zp_stk+4)
	jsr	cputcxy
	ldx	#93
	stx	__rc2
	ldx	mos8(.Lmcbox_zp_stk+2)
	lda	mos8(.Lmcbox_zp_stk+3)
	jsr	cputcxy
	ldx	mos8(.Lmcbox_zp_stk+2)
	lda	mos8(.Lmcbox_zp_stk+4)
	inx
.LBB22_7:                               ; =>This Inner Loop Header: Depth=1
	cpx	mos8(.Lmcbox_zp_stk+5)
	bcc	.LBB22_6
; %bb.8:
	ldx	mos8(.Lmcbox_zp_stk)
	bne	.LBB22_9
; %bb.19:
	jmp	.LBB22_18
.LBB22_9:
	ldx	mos8(.Lmcbox_zp_stk+5)
	cpx	g_curScreenH
	bcc	.LBB22_10
; %bb.21:
	jmp	.LBB22_18
.LBB22_10:
	ldx	mos8(g_curScreenW)
	stx	__rc2
	ldx	mos8(.Lmcbox_zp_stk+3)
	cpx	__rc2
	bcc	.LBB22_11
; %bb.23:
	jmp	.LBB22_18
.LBB22_11:
	stz	__rc3
	ldx	mos8(.Lmcbox_zp_stk+5)
	ldy	#0
	inx
	bne	.LBB22_13
; %bb.12:
	iny
.LBB22_13:
	stx	__rc4
	sty	mos8(.Lmcbox_zp_stk+4)
	ldx	mos8(.Lmcbox_zp_stk+4)
	sta	mos8(.Lmcbox_zp_stk)
	ldy	__rc4
	sty	mos8(.Lmcbox_zp_stk+2)
	lda	__rc4
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	stz	__rc6
	clc
	lda	mos8(.Lmcbox_zp_stk)
	adc	__rc2
	sta	__rc2
	lda	#0
	adc	__rc3
	sta	__rc3
	lda	#0
	adc	#0
	tax
	lda	#0
	adc	#0
	tay
	clc
	lda	__rc2
	adc	#1
	sta	__rc7
	lda	__rc3
	adc	#0
	sta	__rc8
	txa
	adc	#248
	sta	__rc2
	tya
	adc	#15
	ldy	#11
	sta	__rc3
	ldx	mos8(.Lmcbox_zp_stk+7)          ; 1-byte Folded Reload
	stx	__rc5
	sty	__rc4
	ldx	__rc8
	lda	__rc7
	jsr	lfill
	ldx	mos8(.Lmcbox_zp_stk+3)
	inx
	ldy	mos8(.Lmcbox_zp_stk+1)
	sty	mos8(.Lmcbox_zp_stk)
	stx	mos8(.Lmcbox_zp_stk+1)
	stz	mos8(.Lmcbox_zp_stk+3)
	bra	.LBB22_16
.LBB22_14:                              ;   in Loop: Header=BB22_16 Depth=1
	cpy	#0
	bcc	.LBB22_18
.LBB22_15:                              ;   in Loop: Header=BB22_16 Depth=1
	lda	mos8(g_curScreenW)
	ldx	mos8(.Lmcbox_zp_stk)
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	mos8(.Lmcbox_zp_stk+1)
	tay
	txa
	adc	mos8(.Lmcbox_zp_stk+3)
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
	inc	mos8(.Lmcbox_zp_stk)
.LBB22_16:                              ; =>This Inner Loop Header: Depth=1
	ldy	mos8(.Lmcbox_zp_stk+4)
	bne	.LBB22_14
; %bb.17:                               ;   in Loop: Header=BB22_16 Depth=1
	ldx	mos8(.Lmcbox_zp_stk+2)
	cpx	mos8(.Lmcbox_zp_stk)
	bcs	.LBB22_15
.LBB22_18:
	rts
.Lfunc_end22:
	.size	mcbox, .Lfunc_end22-mcbox
                                        ; -- End function
	.section	.text.messagebox,"ax",@progbits
	.type	messagebox,@function            ; -- Begin function messagebox
messagebox:                             ; @messagebox
; %bb.0:
	sta	.Lmessagebox_sstk+6             ; 1-byte Folded Spill
	ldx	__rc2
	stx	.Lmessagebox_sstk+4             ; 1-byte Folded Spill
	ldx	__rc3
	stx	.Lmessagebox_sstk+5             ; 1-byte Folded Spill
	ldx	__rc4
	stx	.Lmessagebox_sstk+2             ; 1-byte Folded Spill
	ldx	__rc5
	stx	.Lmessagebox_sstk+3             ; 1-byte Folded Spill
	ldx	__rc6
	stx	.Lmessagebox_sstk               ; 1-byte Folded Spill
	ldx	__rc7
	stx	.Lmessagebox_sstk+1             ; 1-byte Folded Spill
	ldx	#70
	lda	#12
	ldy	#1
	stx	__rc2
	sty	__rc4
	sta	__rc3
	ldx	#4
	lda	#10
	jsr	mcbox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	lda	#14
	ldx	#mos16lo(.L.str.46)
	stx	__rc2
	ldx	#mos16hi(.L.str.46)
	stx	__rc3
	ldx	#4
	jsr	mcputsxy
	lda	#40
	ldx	#mos16lo(.L.str.1.47)
	stx	__rc2
	ldx	#mos16hi(.L.str.1.47)
	stx	__rc3
	ldx	#4
	jsr	mcputsxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#6
	ldy	.Lmessagebox_sstk+4             ; 1-byte Folded Reload
	sty	__rc2
	ldy	.Lmessagebox_sstk+5             ; 1-byte Folded Reload
	sty	__rc3
	lda	#12
	jsr	mcputsxy
	ldx	#7
	ldy	.Lmessagebox_sstk+2             ; 1-byte Folded Reload
	sty	__rc2
	ldy	.Lmessagebox_sstk+3             ; 1-byte Folded Reload
	sty	__rc3
	lda	#12
	jsr	mcputsxy
	ldx	#8
	ldy	.Lmessagebox_sstk               ; 1-byte Folded Reload
	sty	__rc2
	ldy	.Lmessagebox_sstk+1             ; 1-byte Folded Reload
	sty	__rc3
	lda	#12
	jsr	mcputsxy
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.2.48)
	stx	__rc2
	ldx	#mos16hi(.L.str.2.48)
	stx	__rc3
	ldx	#10
	lda	#12
	jsr	mcputsxy
	lda	#60
	ldx	#mos16lo(.L.str.3.49)
	stx	__rc2
	ldx	#mos16hi(.L.str.3.49)
	stx	__rc3
	ldx	#10
	jsr	mcputsxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	.Lmessagebox_sstk+6             ; 1-byte Folded Reload
	beq	.LBB23_3
; %bb.1:
	lda	#2
	ldx	#mos16lo(.L.str.4.50)
	stx	__rc2
	ldx	#mos16hi(.L.str.4.50)
	stx	__rc3
	ldx	#1
	jsr	mcputsxy
	lda	#58
	ldx	#mos16lo(.L.str.5.51)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.51)
	stx	__rc3
	ldx	#1
	jsr	mcputsxy
	bra	.LBB23_3
.LBB23_2:                               ;   in Loop: Header=BB23_3 Depth=1
	ldx	#mos16lo(.L.str.6.52)
	stx	__rc2
	ldx	#mos16hi(.L.str.6.52)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	lda	#32
	jsr	cputc
.LBB23_3:                               ; =>This Inner Loop Header: Depth=1
	jsr	cgetc
	cmp	#3
	beq	.LBB23_6
; %bb.4:                                ;   in Loop: Header=BB23_3 Depth=1
	cmp	#13
	beq	.LBB23_7
; %bb.5:                                ;   in Loop: Header=BB23_3 Depth=1
	cmp	#27
	bne	.LBB23_2
.LBB23_6:
	lda	#0
	rts
.LBB23_7:
	lda	#1
	rts
.Lfunc_end23:
	.size	messagebox, .Lfunc_end23-messagebox
                                        ; -- End function
	.section	.text.progress,"ax",@progbits
	.type	progress,@function              ; -- Begin function progress
progress:                               ; @progress
; %bb.0:
	sta	mos8(.Lprogress_zp_stk+4)       ; 1-byte Folded Spill
	ldx	__rc2
	stx	mos8(.Lprogress_zp_stk)
	ldx	__rc3
	stx	mos8(.Lprogress_zp_stk+1)
	ldx	__rc4
	stx	mos8(.Lprogress_zp_stk+2)
	ldx	__rc5
	stx	mos8(.Lprogress_zp_stk+3)
	ldx	#mos16lo(.L__const.progress.rc)
	stx	__rc2
	ldx	#mos16hi(.L__const.progress.rc)
	stx	__rc3
	jsr	fillrect
	ldx	#6
	ldy	mos8(.Lprogress_zp_stk)
	sty	__rc2
	ldy	mos8(.Lprogress_zp_stk+1)
	sty	__rc3
	ldy	mos8(.Lprogress_zp_stk+4)       ; 1-byte Folded Reload
	sty	mos8(.Lprogress_zp_stk)
	lda	#12
	jsr	mcputsxy
	ldx	#7
	ldy	mos8(.Lprogress_zp_stk+2)
	sty	__rc2
	ldy	mos8(.Lprogress_zp_stk+3)
	sty	__rc3
	lda	#12
	jsr	mcputsxy
	ldx	#9
	ldy	#160
	sty	__rc2
	lda	#12
	jsr	cputcxy
	ldx	#0
	lda	mos8(.Lprogress_zp_stk)
	lsr
	sta	mos8(.Lprogress_zp_stk+1)
	bra	.LBB24_5
.LBB24_1:                               ;   in Loop: Header=BB24_5 Depth=1
	lda	#1
.LBB24_2:                               ;   in Loop: Header=BB24_5 Depth=1
	ldx	#160
	and	#1
	bne	.LBB24_4
; %bb.3:                                ;   in Loop: Header=BB24_5 Depth=1
	ldx	#123
.LBB24_4:                               ;   in Loop: Header=BB24_5 Depth=1
	txa
	jsr	cputc
	ldx	mos8(.Lprogress_zp_stk+2)
	inx
.LBB24_5:                               ; =>This Inner Loop Header: Depth=1
	cpx	#50
	beq	.LBB24_8
; %bb.6:                                ;   in Loop: Header=BB24_5 Depth=1
	stx	mos8(.Lprogress_zp_stk+2)
	cpx	mos8(.Lprogress_zp_stk+1)
	bcc	.LBB24_1
; %bb.7:                                ;   in Loop: Header=BB24_5 Depth=1
	lda	#0
	bra	.LBB24_2
.LBB24_8:
	lda	#101
	jsr	cputc
	ldx	#mos16lo(.L.str.29)
	stx	__rc2
	ldx	#mos16hi(.L.str.29)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	mos8(.Lprogress_zp_stk)
	jsr	mprintf
	lda	#37
	jsr	cputc
	lda	#12
	ldx	#mos16lo(.L.str.8)
	stx	__rc2
	ldx	#mos16hi(.L.str.8)
	stx	__rc3
	ldx	#10
	jsr	mcputsxy
	lda	#60
	ldx	#mos16lo(.L.str.8)
	stx	__rc2
	ldx	#mos16hi(.L.str.8)
	stx	__rc3
	ldx	#10
	jmp	mcputsxy
.Lfunc_end24:
	.size	progress, .Lfunc_end24-progress
                                        ; -- End function
	.section	.text.shortcutprint,"ax",@progbits
	.type	shortcutprint,@function         ; -- Begin function shortcutprint
shortcutprint:                          ; @shortcutprint
; %bb.0:
	sta	mos8(.Lshortcutprint_zp_stk)
	lda	#240
	and	mos8(g_curTextColor)
	ora	#1
	ldx	mos8(g_curTextColor)
	stx	mos8(.Lshortcutprint_zp_stk+1)
	sta	mos8(g_curTextColor)
	ldx	__rc4
	stx	mos8(.Lshortcutprint_zp_stk+2)
	ldx	__rc5
	stx	mos8(.Lshortcutprint_zp_stk+3)
	jsr	msprintf
	lda	mos8(.Lshortcutprint_zp_stk)
	beq	.LBB25_2
; %bb.1:
	ldx	#3
	bra	.LBB25_3
.LBB25_2:
	ldx	#12
.LBB25_3:
	stx	__rc2
	lda	mos8(.Lshortcutprint_zp_stk+1)
	and	#208
	ora	__rc2
	sta	mos8(.Lshortcutprint_zp_stk)
	ora	#32
	sta	mos8(g_curTextColor)
	ldx	mos8(.Lshortcutprint_zp_stk+2)
	stx	__rc2
	ldx	mos8(.Lshortcutprint_zp_stk+3)
	stx	__rc3
	jsr	msprintf
	ldx	mos8(.Lshortcutprint_zp_stk)
	stx	mos8(g_curTextColor)
	rts
.Lfunc_end25:
	.size	shortcutprint, .Lfunc_end25-shortcutprint
                                        ; -- End function
	.section	.text.shortcuts,"ax",@progbits
	.type	shortcuts,@function             ; -- Begin function shortcuts
shortcuts:                              ; @shortcuts
; %bb.0:
	stz	mos8(g_curX)
	ldx	#24
	stx	mos8(g_curY)
	tax
	and	#20
	bne	.LBB26_1
; %bb.16:
	jmp	.LBB26_2
.LBB26_1:
	ldx	#mos16lo(.L.str.60)
	stx	__rc2
	ldx	#mos16hi(.L.str.60)
	stx	__rc3
	ldx	#mos16lo(.L.str.1.61)
	stx	__rc4
	ldx	#mos16hi(.L.str.1.61)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.2.62)
	stx	__rc2
	ldx	#mos16hi(.L.str.2.62)
	stx	__rc3
	ldx	#mos16lo(.L.str.3.63)
	stx	__rc4
	ldx	#mos16hi(.L.str.3.63)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.4.64)
	stx	__rc2
	ldx	#mos16hi(.L.str.4.64)
	stx	__rc3
	ldx	#mos16lo(.L.str.5.65)
	stx	__rc4
	ldx	#mos16hi(.L.str.5.65)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.6.66)
	stx	__rc2
	ldx	#mos16hi(.L.str.6.66)
	stx	__rc3
	ldx	#mos16lo(.L.str.7.67)
	stx	__rc4
	ldx	#mos16hi(.L.str.7.67)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.8.68)
	stx	__rc2
	ldx	#mos16hi(.L.str.8.68)
	stx	__rc3
	ldx	#mos16lo(.L.str.9)
	stx	__rc4
	ldx	#mos16hi(.L.str.9)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.10.69)
	stx	__rc2
	ldx	#mos16hi(.L.str.10.69)
	stx	__rc3
	ldx	#mos16lo(.L.str.11.70)
	stx	__rc4
	ldx	#mos16hi(.L.str.11.70)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.12.71)
	stx	__rc2
	ldx	#mos16hi(.L.str.12.71)
	stx	__rc3
	ldx	#mos16lo(.L.str.13.72)
	stx	__rc4
	ldx	#mos16hi(.L.str.13.72)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.14.73)
	stx	__rc2
	ldx	#mos16hi(.L.str.14.73)
	stx	__rc3
	ldx	#mos16lo(.L.str.15.74)
	stx	__rc4
	ldx	#mos16hi(.L.str.15.74)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.16.75)
	stx	__rc2
	ldx	#mos16hi(.L.str.16.75)
	stx	__rc3
	ldx	#mos16lo(.L.str.17.76)
	stx	__rc4
	ldx	#mos16hi(.L.str.17.76)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.18.77)
	stx	__rc2
	ldx	#mos16hi(.L.str.18.77)
	stx	__rc3
	ldx	#mos16lo(.L.str.19.78)
	stx	__rc4
	ldx	#mos16hi(.L.str.19.78)
; %bb.10:
	jmp	.LBB26_7
.LBB26_2:
	txa
	and	#8
	beq	.LBB26_3
; %bb.18:
	jmp	.LBB26_5
.LBB26_3:
	txa
	and	#3
	bne	.LBB26_4
; %bb.20:
	jmp	.LBB26_9
.LBB26_4:
	ldx	#mos16lo(.L.str.60)
	stx	__rc2
	ldx	#mos16hi(.L.str.60)
	stx	__rc3
	ldx	#mos16lo(.L.str.3.63)
	stx	__rc4
	ldx	#mos16hi(.L.str.3.63)
	stx	__rc5
	lda	#1
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.2.62)
	stx	__rc2
	ldx	#mos16hi(.L.str.2.62)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.4.64)
	stx	__rc2
	ldx	#mos16hi(.L.str.4.64)
	stx	__rc3
	ldx	#mos16lo(.L.str.7.67)
	stx	__rc4
	ldx	#mos16hi(.L.str.7.67)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.6.66)
	stx	__rc2
	ldx	#mos16hi(.L.str.6.66)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.8.68)
	stx	__rc2
	ldx	#mos16hi(.L.str.8.68)
	stx	__rc3
	ldx	#mos16lo(.L.str.11.70)
	stx	__rc4
	ldx	#mos16hi(.L.str.11.70)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.10.69)
	stx	__rc2
	ldx	#mos16hi(.L.str.10.69)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.12.71)
	stx	__rc2
	ldx	#mos16hi(.L.str.12.71)
	stx	__rc3
	ldx	#mos16lo(.L.str.15.74)
	stx	__rc4
	ldx	#mos16hi(.L.str.15.74)
	stx	__rc5
	lda	#1
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.14.73)
	stx	__rc2
	ldx	#mos16hi(.L.str.14.73)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.16.75)
	stx	__rc2
	ldx	#mos16hi(.L.str.16.75)
	stx	__rc3
	ldx	#mos16lo(.L.str.24)
	stx	__rc4
	ldx	#mos16hi(.L.str.24)
	stx	__rc5
	lda	#1
; %bb.12:
	jmp	.LBB26_6
.LBB26_5:
	ldx	#mos16lo(.L.str.60)
	stx	__rc2
	ldx	#mos16hi(.L.str.60)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.2.62)
	stx	__rc2
	ldx	#mos16hi(.L.str.2.62)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.4.64)
	stx	__rc2
	ldx	#mos16hi(.L.str.4.64)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.6.66)
	stx	__rc2
	ldx	#mos16hi(.L.str.6.66)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	lda	#1
	ldx	#mos16lo(.L.str.8.68)
	stx	__rc2
	ldx	#mos16hi(.L.str.8.68)
	stx	__rc3
	ldx	#mos16lo(.L.str.21)
	stx	__rc4
	ldx	#mos16hi(.L.str.21)
	stx	__rc5
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.10.69)
	stx	__rc2
	ldx	#mos16hi(.L.str.10.69)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.12.71)
	stx	__rc2
	ldx	#mos16hi(.L.str.12.71)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.14.73)
	stx	__rc2
	ldx	#mos16hi(.L.str.14.73)
	stx	__rc3
	ldx	#mos16lo(.L.str.22)
	stx	__rc4
	ldx	#mos16hi(.L.str.22)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.16.75)
	stx	__rc2
	ldx	#mos16hi(.L.str.16.75)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
.LBB26_6:
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.18.77)
	stx	__rc2
	ldx	#mos16hi(.L.str.18.77)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
.LBB26_7:
	stx	__rc5
	lda	#0
.LBB26_8:
	jsr	shortcutprint
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	rts
.LBB26_9:
	ldx	#mos16lo(.L.str.60)
	stx	__rc2
	ldx	#mos16hi(.L.str.60)
	stx	__rc3
	ldx	#mos16lo(.L.str.1.61)
	stx	__rc4
	ldx	#mos16hi(.L.str.1.61)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.2.62)
	stx	__rc2
	ldx	#mos16hi(.L.str.2.62)
	stx	__rc3
	ldx	#mos16lo(.L.str.3.63)
	stx	__rc4
	ldx	#mos16hi(.L.str.3.63)
	stx	__rc5
	lda	#1
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.4.64)
	stx	__rc2
	ldx	#mos16hi(.L.str.4.64)
	stx	__rc3
	ldx	#mos16lo(.L.str.5.65)
	stx	__rc4
	ldx	#mos16hi(.L.str.5.65)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.6.66)
	stx	__rc2
	ldx	#mos16hi(.L.str.6.66)
	stx	__rc3
	ldx	#mos16lo(.L.str.7.67)
	stx	__rc4
	ldx	#mos16hi(.L.str.7.67)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.8.68)
	stx	__rc2
	ldx	#mos16hi(.L.str.8.68)
	stx	__rc3
	ldx	#mos16lo(.L.str.9)
	stx	__rc4
	ldx	#mos16hi(.L.str.9)
	stx	__rc5
	lda	#1
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.10.69)
	stx	__rc2
	ldx	#mos16hi(.L.str.10.69)
	stx	__rc3
	ldx	#mos16lo(.L.str.11.70)
	stx	__rc4
	ldx	#mos16hi(.L.str.11.70)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.12.71)
	stx	__rc2
	ldx	#mos16hi(.L.str.12.71)
	stx	__rc3
	ldx	#mos16lo(.L.str.13.72)
	stx	__rc4
	ldx	#mos16hi(.L.str.13.72)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.14.73)
	stx	__rc2
	ldx	#mos16hi(.L.str.14.73)
	stx	__rc3
	ldx	#mos16lo(.L.str.15.74)
	stx	__rc4
	ldx	#mos16hi(.L.str.15.74)
	stx	__rc5
	lda	#1
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.16.75)
	stx	__rc2
	ldx	#mos16hi(.L.str.16.75)
	stx	__rc3
	ldx	#mos16lo(.L.str.17.76)
	stx	__rc4
	ldx	#mos16hi(.L.str.17.76)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.18.77)
	stx	__rc2
	ldx	#mos16hi(.L.str.18.77)
	stx	__rc3
	ldx	#mos16lo(.L.str.19.78)
	stx	__rc4
	ldx	#mos16hi(.L.str.19.78)
	stx	__rc5
	lda	#1
; %bb.14:
	jmp	.LBB26_8
.Lfunc_end26:
	.size	shortcuts, .Lfunc_end26-shortcuts
                                        ; -- End function
	.section	.text.UpdateSectors,"ax",@progbits
	.type	UpdateSectors,@function         ; -- Begin function UpdateSectors
UpdateSectors:                          ; @UpdateSectors
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#249
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
	pla
	sta	__rc21
	stx	__rc20
	txa
	asl
	stz	__rc2
	rol	__rc2
	clc
	sta	__rc3
	lda	#mos16lo(midnight)
	adc	__rc3
	tax
	lda	#mos16hi(midnight)
	adc	__rc2
	stx	__rc2
	sta	__rc3
	iny
	lda	(__rc2)
	sta	__rc29
	sta	__rc24
	lda	(__rc2),y
	sta	__rc28
	sta	__rc25
	ldy	#70
	lda	#1
	and	(__rc24),y
	beq	.LBB27_1
; %bb.53:
	jmp	.LBB27_17
.LBB27_1:
	ldy	#17
	stz	__rc3
	ldx	#0
	sty	__rc2
	lda	__rc20
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	#mos16lo(diskname)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(diskname)
	adc	__rc3
	sta	__rc3
	jsr	strcopy
	clc
	lda	__rc29
	adc	#3
	sta	__rc2
	lda	__rc28
	adc	#0
	sta	__rc3
	jsr	strcopy
	clc
	lda	__rc29
	adc	#68
	sta	__rc2
	lda	__rc28
	adc	#0
	ldy	#68
	sta	__rc3
	lda	#255
	sta	(__rc24),y
	ldy	#1
	sta	(__rc2),y
	;APP
	ldx	#0
	lda	#4
	sta	54848
	clv
	bcc	errgetcurdrv5
	sta	__rc2
	jmp	donegetcurdrv5
errgetcurdrv5:
	lda	#255
	sta	__rc2
donegetcurdrv5:
	nop
	;NO_APP
	ldx	__rc2
	cpx	#255
	bne	.LBB27_2
; %bb.55:
	jmp	.LBB27_22
.LBB27_2:
	;APP
	ldx	#0
	lda	#18
	sta	54848
	clv
	bcc	errhypopendir6
	sta	__rc2
	jmp	donehypopendir6
errhypopendir6:
	lda	#255
	sta	__rc2
donehypopendir6:
	nop

	;NO_APP
	ldx	__rc2
	cpx	#132
	bne	.LBB27_3
; %bb.57:
	jmp	.LBB27_22
.LBB27_3:
	cpx	#135
	bne	.LBB27_4
; %bb.59:
	jmp	.LBB27_22
.LBB27_4:
	lda	#255
	cpx	#255
	bne	.LBB27_5
; %bb.61:
	jmp	.LBB27_48
.LBB27_5:
	stx	__rc26
	stz	__rc21
	ldx	#14
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#0
	lda	__rc20
	jsr	__mulsi3
	sta	__rc20
	stx	__rc22
	ldy	__rc26
	ldx	__rc2
	stx	__rc27
	lda	__rc3
	ora	#8
	sta	__rc28
	ldx	#32
	stz	__rc23
.LBB27_6:                               ; =>This Inner Loop Header: Depth=1
	txa
	bne	.LBB27_7
; %bb.63:
	jmp	.LBB27_47
.LBB27_7:                               ;   in Loop: Header=BB27_6 Depth=1
	stx	__rc29
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
	stx	__rc2
	jmp	donehypreaddir7
errhypreaddir7:
	sta	__rc2
donehypreaddir7:
	nop

	;NO_APP
	ldy	__rc2
	ldx	6720
	stz	6656,x
	cpy	#133
	beq	.LBB27_9
; %bb.8:                                ;   in Loop: Header=BB27_6 Depth=1
	cpy	#255
	bne	.LBB27_11
.LBB27_9:                               ;   in Loop: Header=BB27_6 Depth=1
	ldx	#32
	stx	6661
	stz	6662
.LBB27_10:                              ;   in Loop: Header=BB27_6 Depth=1
	ldy	__rc26
	ldx	__rc29
	dex
	bra	.LBB27_6
.LBB27_11:                              ;   in Loop: Header=BB27_6 Depth=1
	lda	#16
	and	6742
	bne	.LBB27_16
; %bb.12:                               ;   in Loop: Header=BB27_6 Depth=1
	ldx	6729
	cpx	#100
	beq	.LBB27_14
; %bb.13:                               ;   in Loop: Header=BB27_6 Depth=1
	cpx	#68
	bne	.LBB27_9
.LBB27_14:                              ;   in Loop: Header=BB27_6 Depth=1
	ldx	6730
	cpx	#56
	bne	.LBB27_9
; %bb.15:                               ;   in Loop: Header=BB27_6 Depth=1
	ldx	6731
	cpx	#49
	bne	.LBB27_9
.LBB27_16:                              ;   in Loop: Header=BB27_6 Depth=1
	jsr	getsfn
	jsr	getsfn
	ldx	#5
	stx	__rc2
	ldx	#26
	stx	__rc3
	ldx	#65
	stx	__rc4
	ldx	#28
	stx	__rc5
	jsr	strcpy
	lda	#128
	ora	6737
	sta	6656
	lda	#128
	ora	6735
	sta	6659
	lda	#64
	ora	6742
	sta	6658
	lda	6741
	lsr
	sta	__rc2
	lda	6740
	ror
	tax
	lda	6739
	ror
	lsr	__rc2
	stx	__rc2
	ror	__rc2
	ror
	sta	6686
	ldx	6734
	ldy	6736
	sty	6657
	stx	6660
	ldx	__rc2
	stx	6687
	lda	__rc23
	lsr
	tax
	lda	#0
	ror
	stx	__rc2
	lsr	__rc2
	ror
	lsr	__rc2
	ror
	clc
	adc	__rc20
	sta	__rc4
	lda	__rc2
	adc	__rc22
	sta	__rc5
	lda	__rc27
	adc	#0
	sta	__rc6
	lda	__rc28
	adc	#0
	stz	6688
	stz	__rc2
	stz	__rc3
	sta	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	#26
	lda	#0
	jsr	lcopy
	inc	__rc23
; %bb.49:                               ;   in Loop: Header=BB27_6 Depth=1
	jmp	.LBB27_10
.LBB27_17:
	ldx	#0
	stx	__rc22
	ldx	#22
	stx	__rc23
	ldy	#28
	sty	fnamehi
	;APP
	ldx	#0
	lda	#72
	sta	54848
	clv
	bcc	errgetproc8
	sta	__rc2
	jmp	donegetproc8
errgetproc8:
	lda	#255
	sta	__rc2
donegetproc8:
	nop

	;NO_APP
	lda	__rc21
	beq	.LBB27_23
; %bb.18:
	stz	__rc2
	ldy	#3
	bra	.LBB27_20
.LBB27_19:                              ;   in Loop: Header=BB27_20 Depth=1
	tax
	lda	__rc29
	clc
	adc	__rc2
	sta	__rc4
	lda	__rc28
	adc	#0
	sta	__rc5
	txa
	sta	(__rc4),y
	inc	__rc2
.LBB27_20:                              ; =>This Inner Loop Header: Depth=1
	ldx	__rc2
	lda	7221,x
	beq	.LBB27_27
; %bb.21:                               ;   in Loop: Header=BB27_20 Depth=1
	ldx	__rc2
	cpx	7188
	bcc	.LBB27_19
	bra	.LBB27_27
.LBB27_22:
	lda	#255
; %bb.51:
	jmp	.LBB27_48
.LBB27_23:
	stz	__rc2
	ldy	#3
	bra	.LBB27_25
.LBB27_24:                              ;   in Loop: Header=BB27_25 Depth=1
	tax
	lda	__rc29
	clc
	adc	__rc2
	sta	__rc4
	lda	__rc28
	adc	#0
	sta	__rc5
	txa
	sta	(__rc4),y
	inc	__rc2
.LBB27_25:                              ; =>This Inner Loop Header: Depth=1
	ldx	__rc2
	lda	7189,x
	beq	.LBB27_27
; %bb.26:                               ;   in Loop: Header=BB27_25 Depth=1
	ldx	__rc2
	cpx	7187
	bcc	.LBB27_24
.LBB27_27:
	clc
	lda	__rc29
	adc	__rc2
	sta	__rc2
	lda	__rc28
	adc	#0
	sta	__rc3
	lda	#0
	ldy	#3
	sta	(__rc2),y
	ldx	#17
	stx	__rc2
	stz	__rc3
	tax
	lda	__rc20
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	#mos16lo(diskname)
	clc
	adc	__rc2
	sta	__rc26
	lda	#mos16hi(diskname)
	adc	__rc3
	sta	__rc27
	stz	53376
	ldx	#0
	stx	__rc2
	ldx	#22
	stx	__rc3
	ldx	#40
	stz	__rc4
	lda	__rc21
	jsr	GetOneSector
	ldy	#0
	bra	.LBB27_29
.LBB27_28:                              ;   in Loop: Header=BB27_29 Depth=1
	sta	(__rc26),y
	iny
.LBB27_29:                              ; =>This Inner Loop Header: Depth=1
	lda	5636,y
	cmp	#160
	beq	.LBB27_31
; %bb.30:                               ;   in Loop: Header=BB27_29 Depth=1
	cpy	#16
	bcc	.LBB27_28
.LBB27_31:
	lda	#0
	sta	(__rc26),y
	stz	53376
	lda	__rc20
	beq	.LBB27_33
; %bb.32:
	ldx	#30
	bra	.LBB27_34
.LBB27_33:
	ldx	#28
.LBB27_34:
	stz	__rc5
	lda	#40
	ldy	#8
	sty	__rc3
	ldy	#2
	sty	__rc4
	sta	__rc7
	stz	__rc2
	ldy	__rc21
	sty	__rc6
	ldy	#1
	sty	__rc8
	lda	#0
	jsr	readblockchain
	lda	__rc20
	jsr	GetBAM
	ldx	#0
	stz	__rc27
	stz	__rc26
	bra	.LBB27_38
.LBB27_35:                              ;   in Loop: Header=BB27_38 Depth=1
	clc
	adc	#216
	ldy	#0
	sty	__rc22
	ldy	#23
	sty	__rc23
.LBB27_36:                              ;   in Loop: Header=BB27_38 Depth=1
	stx	__rc30
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	stx	__rc2
	ldx	__rc30
	clc
	adc	__rc22
	tay
	lda	__rc2
	adc	__rc23
	sty	__rc2
	sta	__rc3
	clc
	lda	__rc27
	ldy	#16
	adc	(__rc2),y
	sta	__rc27
	lda	__rc26
	adc	#0
	sta	__rc26
.LBB27_37:                              ;   in Loop: Header=BB27_38 Depth=1
	inx
.LBB27_38:                              ; =>This Inner Loop Header: Depth=1
	ldy	__rc28
	cpx	#80
	beq	.LBB27_41
; %bb.39:                               ;   in Loop: Header=BB27_38 Depth=1
	txa
	cpx	#40
	bcs	.LBB27_35
; %bb.40:                               ;   in Loop: Header=BB27_38 Depth=1
	cpx	#39
	bne	.LBB27_36
	bra	.LBB27_37
.LBB27_41:
	clc
	lda	__rc29
	adc	#68
	sta	__rc2
	tya
	adc	#0
	sta	__rc3
	ldy	#68
	lda	__rc27
	sta	(__rc24),y
	ldy	#1
	lda	__rc26
	sta	(__rc2),y
	stz	53376
	ldx	#14
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#0
	lda	__rc20
	jsr	__mulsi3
	tay
	lda	__rc3
	ora	#8
	sta	__rc3
	lda	#14
	sta	__rc4
	stz	__rc5
	lda	__rc21
	sta	__rc6
	lda	#40
	sta	__rc7
	lda	#3
	sta	__rc8
	tya
	jsr	readblockchain
	lda	#0
	tax
	stx	__rc22
	tax
	stx	__rc23
	ldx	#112
.LBB27_42:                              ; =>This Inner Loop Header: Depth=1
	cpx	#0
	beq	.LBB27_48
; %bb.43:                               ;   in Loop: Header=BB27_42 Depth=1
	stx	__rc21
	lda	__rc20
	jsr	getdirententry
	ldx	__rc3
	cpx	__rc23
	bne	.LBB27_46
; %bb.44:                               ;   in Loop: Header=BB27_42 Depth=1
	lda	__rc21
	ldx	__rc2
	cpx	__rc22
	bne	.LBB27_48
; %bb.45:                               ;   in Loop: Header=BB27_42 Depth=1
	tax
	dex
	lda	#0
	bra	.LBB27_42
.LBB27_46:
	lda	__rc21
	bra	.LBB27_48
.LBB27_47:
	dec	__rc23
	ldx	__rc26
	;APP
	lda	#22
	sta	54848
	clv
	bcc	errhypclosedir9
	stx	__rc2
	jmp	donehypclosedir9
errhypclosedir9:
	sta	__rc2
donehypclosedir9:
	nop

	;NO_APP
	lda	__rc23
.LBB27_48:
	ldy	#2
	sta	(__rc24),y
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
	adc	#7
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end27:
	.size	UpdateSectors, .Lfunc_end27-UpdateSectors
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end28:
	.size	escNOP, .Lfunc_end28-escNOP
                                        ; -- End function
	.section	.text.getscreenaddr,"ax",@progbits
	.type	getscreenaddr,@function         ; -- Begin function getscreenaddr
getscreenaddr:                          ; @getscreenaddr
; %bb.0:
	lda	53347
	and	#7
	ldx	53346
	stx	__rc2
	ldx	53345
	ldy	53344
	sta	__rc3
	tya
	rts
.Lfunc_end29:
	.size	getscreenaddr, .Lfunc_end29-getscreenaddr
                                        ; -- End function
	.section	.text.cputc,"ax",@progbits
	.type	cputc,@function                 ; -- Begin function cputc
cputc:                                  ; @cputc
; %bb.0:
	sta	__rc2
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputcxy
.Lfunc_end30:
	.size	cputc, .Lfunc_end30-cputc
                                        ; -- End function
	.section	.text.cputcxy,"ax",@progbits
	.type	cputcxy,@function               ; -- Begin function cputcxy
cputcxy:                                ; @cputcxy
; %bb.0:
	sta	mos8(.Lcputcxy_zp_stk+4)
	ldy	__rc2
	sty	mos8(.Lcputcxy_zp_stk+5)        ; 1-byte Folded Spill
	lda	mos8(g_curScreenW)
	stx	mos8(.Lcputcxy_zp_stk+3)
	stx	__rc2
	stz	__rc3
	ldx	#0
	stz	mos8(.Lcputcxy_zp_stk+1)
	jsr	__mulhi3
	clc
	adc	mos8(.Lcputcxy_zp_stk+4)
	sta	mos8(.Lcputcxy_zp_stk+2)
	txa
	adc	#0
	sta	mos8(.Lcputcxy_zp_stk)
	lda	53347
	and	#7
	tay
	ldx	53346
	stx	__rc3
	ldx	53345
	stx	__rc2
	lda	mos8(.Lcputcxy_zp_stk+2)
	clc
	adc	#0
	sta	__rc4
	lda	mos8(.Lcputcxy_zp_stk)
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
	sta	__rc3
	ldx	mos8(.Lcputcxy_zp_stk+5)        ; 1-byte Folded Reload
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
	ldx	mos8(.Lcputcxy_zp_stk)
	lda	mos8(.Lcputcxy_zp_stk+2)
	jsr	lpoke
	ldx	mos8(g_curScreenW)
	phx
	ply
	dex
	cpy	#0
	bne	.LBB31_2
; %bb.1:
	dec	mos8(.Lcputcxy_zp_stk+1)
.LBB31_2:
	lda	mos8(.Lcputcxy_zp_stk+1)
	bne	.LBB31_5
; %bb.3:
	ldy	mos8(.Lcputcxy_zp_stk+3)
	cpx	mos8(.Lcputcxy_zp_stk+4)
	bne	.LBB31_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB31_7
.LBB31_5:
	ldy	mos8(.Lcputcxy_zp_stk+3)
.LBB31_6:
	ldx	mos8(.Lcputcxy_zp_stk+4)
	inx
.LBB31_7:
	stx	mos8(g_curX)
	sty	mos8(g_curY)
	rts
.Lfunc_end31:
	.size	cputcxy, .Lfunc_end31-cputcxy
                                        ; -- End function
	.section	.text.cputhex,"ax",@progbits
	.type	cputhex,@function               ; -- Begin function cputhex
cputhex:                                ; @cputhex
; %bb.0:
	sta	__rc3
	txa
	stx	__rc2
	and	#15
	tay
	lda	__rc3
	lsr
	lsr
	lsr
	lsr
	and	#15
	sta	__rc5
	lsr	__rc2
	lsr	__rc2
	lsr	__rc2
	lsr	__rc2
	ldx	__rc2
	lda	hexDigits,x
	tax
	lda	#48
	sta	.Lcputhex_sstk+1
	sta	.Lcputhex_sstk+2
	sta	.Lcputhex_sstk+3
	sta	.Lcputhex_sstk+4
	stx	.Lcputhex_sstk+5
	ldx	hexDigits,y
	stx	.Lcputhex_sstk+6
	lda	__rc3
	and	#15
	tay
	sec
	lda	#8
	sbc	__rc4
	sta	__rc2
	lda	#0
	sbc	#0
	clc
	sta	__rc3
	lda	#mos16lo(.Lcputhex_sstk)
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(.Lcputhex_sstk)
	adc	__rc3
	ldx	__rc5
	pha
	lda	hexDigits,x
	tax
	pla
	stx	.Lcputhex_sstk+7
	ldx	hexDigits,y
	stx	.Lcputhex_sstk+8
	sta	__rc3
	lda	#36
	sta	.Lcputhex_sstk
	stz	.Lcputhex_sstk+9
	sta	(__rc2)
	jmp	cputs
.Lfunc_end32:
	.size	cputhex, .Lfunc_end32-cputhex
                                        ; -- End function
	.section	.text.cputs,"ax",@progbits
	.type	cputs,@function                 ; -- Begin function cputs
cputs:                                  ; @cputs
; %bb.0:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end33:
	.size	cputs, .Lfunc_end33-cputs
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
	ldx	mos8(.Lcputsxy_zp_stk+5)        ; 1-byte Folded Reload
	stx	__rc2
	stz	__rc3
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
.Lfunc_end34:
	.size	cputsxy, .Lfunc_end34-cputsxy
                                        ; -- End function
	.section	.text.fillrect,"ax",@progbits
	.type	fillrect,@function              ; -- Begin function fillrect
fillrect:                               ; @fillrect
; %bb.0:
	ldx	__rc2
	stx	mos8(.Lfillrect_zp_stk)
	ldx	__rc3
	stx	mos8(.Lfillrect_zp_stk+1)
	ldy	#1
	lda	(__rc2),y
	iny
	sta	mos8(.Lfillrect_zp_stk+2)
	lda	(__rc2),y
	sec
	sbc	(__rc2)
	sta	mos8(.Lfillrect_zp_stk+4)
; %bb.4:
	jmp	.LBB35_2
.LBB35_1:                               ;   in Loop: Header=BB35_2 Depth=1
	lda	mos8(g_curScreenW)
	ldx	mos8(.Lfillrect_zp_stk+2)
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	(mos8(.Lfillrect_zp_stk))
	sta	mos8(.Lfillrect_zp_stk+5)
	txa
	adc	#0
	sta	mos8(.Lfillrect_zp_stk+6)
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
	lda	mos8(.Lfillrect_zp_stk+5)
	adc	#0
	tax
	lda	mos8(.Lfillrect_zp_stk+6)
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
	ldx	mos8(.Lfillrect_zp_stk+4)
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
	ldx	mos8(.Lfillrect_zp_stk+4)
	stx	__rc5
	stz	__rc6
	ldx	mos8(.Lfillrect_zp_stk+6)
	lda	mos8(.Lfillrect_zp_stk+5)
	jsr	lfill
	inc	mos8(.Lfillrect_zp_stk+2)
.LBB35_2:                               ; =>This Inner Loop Header: Depth=1
	ldy	#3
	lda	(mos8(.Lfillrect_zp_stk)),y
	cmp	mos8(.Lfillrect_zp_stk+2)
	bcc	.LBB35_3
; %bb.6:                                ;   in Loop: Header=BB35_2 Depth=1
	jmp	.LBB35_1
.LBB35_3:
	rts
.Lfunc_end35:
	.size	fillrect, .Lfunc_end35-fillrect
                                        ; -- End function
	.section	.text.cgetc,"ax",@progbits
	.type	cgetc,@function                 ; -- Begin function cgetc
cgetc:                                  ; @cgetc
; %bb.0:
.LBB36_1:                               ; =>This Inner Loop Header: Depth=1
	lda	54800
	beq	.LBB36_1
; %bb.2:
	stz	54800
	rts
.Lfunc_end36:
	.size	cgetc, .Lfunc_end36-cgetc
                                        ; -- End function
	.section	.text.do_dma,"ax",@progbits
	.type	do_dma,@function                ; -- Begin function do_dma
do_dma:                                 ; @do_dma
; %bb.0:
	ldx	#mos8(0)
	ldy	#mos8(dmalist)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	ldy	__rc2
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
.Lfunc_end37:
	.size	do_dma, .Lfunc_end37-do_dma
                                        ; -- End function
	.section	.text.lcopy,"ax",@progbits
	.type	lcopy,@function                 ; -- Begin function lcopy
lcopy:                                  ; @lcopy
; %bb.0:
	sta	__rc10
	stx	__rc11
	ldx	__rc8
	ldy	__rc9
	lda	#11
	sta	mos8(dmalist)
	lda	#128
	sta	mos8(dmalist+1)
	lsr	__rc3
	lda	__rc2
	ror
	lsr	__rc3
	ror
	lsr	__rc3
	ror
	lsr	__rc3
	ror
	sta	mos8(dmalist+2)
	lda	#129
	sta	mos8(dmalist+3)
	lsr	__rc7
	lda	__rc6
	ror
	lsr	__rc7
	ror
	lsr	__rc7
	ror
	lsr	__rc7
	ror
	sta	mos8(dmalist+4)
	lda	#133
	sta	mos8(dmalist+5)
	lda	#1
	sta	mos8(dmalist+6)
	stz	mos8(dmalist+7)
	stz	mos8(dmalist+17)
	stz	mos8(dmalist+8)
	stx	mos8(dmalist+9)
	sty	mos8(dmalist+10)
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
	ldx	__rc5
	stx	mos8(dmalist+15)
	lda	__rc6
	and	#15
	sta	mos8(dmalist+16)
	jmp	do_dma
.Lfunc_end38:
	.size	lcopy, .Lfunc_end38-lcopy
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
	lsr	__rc3
	lda	__rc2
	ror
	lsr	__rc3
	ror
	lsr	__rc3
	ror
	lsr	__rc3
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
	ldx	__rc8
	stx	mos8(dmalist+15)
	lda	__rc2
	and	#15
	sta	mos8(dmalist+16)
	jmp	do_dma
.Lfunc_end39:
	.size	lfill, .Lfunc_end39-lfill
                                        ; -- End function
	.section	.text.strcpy,"ax",@progbits
	.type	strcpy,@function                ; -- Begin function strcpy
strcpy:                                 ; @strcpy
; %bb.0:
	lda	(__rc4)
	sta	(__rc2)
	lda	(__rc4)
	beq	.LBB40_7
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
.LBB40_2:                               ; =>This Inner Loop Header: Depth=1
	inc	__rc8
	bne	.LBB40_4
; %bb.3:                                ;   in Loop: Header=BB40_2 Depth=1
	inc	__rc9
.LBB40_4:                               ;   in Loop: Header=BB40_2 Depth=1
	lda	(__rc4),y
	sta	(__rc6),y
	lda	(__rc4),y
	inc	__rc6
	bne	.LBB40_6
; %bb.5:                                ;   in Loop: Header=BB40_2 Depth=1
	inc	__rc7
.LBB40_6:                               ;   in Loop: Header=BB40_2 Depth=1
	ldx	__rc8
	stx	__rc4
	ldx	__rc9
	stx	__rc5
	tax
	bne	.LBB40_2
.LBB40_7:
	rts
.Lfunc_end40:
	.size	strcpy, .Lfunc_end40-strcpy
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB41_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB41_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB41_4
; %bb.3:                                ;   in Loop: Header=BB41_2 Depth=1
	inx
.LBB41_4:                               ;   in Loop: Header=BB41_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB41_2
	bra	.LBB41_6
.LBB41_5:
	stz	__rc4
	ldx	#0
.LBB41_6:
	lda	__rc4
	rts
.Lfunc_end41:
	.size	strlen, .Lfunc_end41-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB42_2
.LBB42_1:                               ;   in Loop: Header=BB42_2 Depth=1
	dex
	asl
.LBB42_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB42_1
; %bb.3:
	rts
.Lfunc_end42:
	.size	__ashlqi3, .Lfunc_end42-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB43_3
; %bb.1:
	ldx	__rc2
.LBB43_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB43_2
.LBB43_3:
	ldx	__rc3
	rts
.Lfunc_end43:
	.size	__ashlhi3, .Lfunc_end43-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB44_3
; %bb.1:
	ldx	__rc4
.LBB44_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB44_2
.LBB44_3:
	ldx	__rc5
	rts
.Lfunc_end44:
	.size	__ashlsi3, .Lfunc_end44-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB45_3
; %bb.1:
	ldx	__rc8
.LBB45_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB45_2
.LBB45_3:
	ldx	__rc9
	rts
.Lfunc_end45:
	.size	__ashldi3, .Lfunc_end45-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB46_2
.LBB46_1:                               ;   in Loop: Header=BB46_2 Depth=1
	dex
	lsr
.LBB46_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB46_1
; %bb.3:
	rts
.Lfunc_end46:
	.size	__lshrqi3, .Lfunc_end46-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB47_3
; %bb.1:
	ldx	__rc2
.LBB47_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB47_2
.LBB47_3:
	ldx	__rc3
	rts
.Lfunc_end47:
	.size	__lshrhi3, .Lfunc_end47-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB48_3
; %bb.1:
	ldx	__rc4
.LBB48_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB48_2
.LBB48_3:
	ldx	__rc5
	rts
.Lfunc_end48:
	.size	__lshrsi3, .Lfunc_end48-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB49_3
; %bb.1:
	ldx	__rc8
.LBB49_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB49_2
.LBB49_3:
	ldx	__rc9
	rts
.Lfunc_end49:
	.size	__lshrdi3, .Lfunc_end49-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB50_2
.LBB50_1:                               ;   in Loop: Header=BB50_2 Depth=1
	dex
	cmp	#128
	ror
.LBB50_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB50_1
; %bb.3:
	rts
.Lfunc_end50:
	.size	__ashrqi3, .Lfunc_end50-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB51_3
; %bb.1:
	ldx	__rc2
.LBB51_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB51_2
.LBB51_3:
	tax
	lda	__rc3
	rts
.Lfunc_end51:
	.size	__ashrhi3, .Lfunc_end51-__ashrhi3
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
	beq	.LBB52_3
; %bb.1:
	ldx	__rc4
.LBB52_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB52_2
.LBB52_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end52:
	.size	__ashrsi3, .Lfunc_end52-__ashrsi3
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
	beq	.LBB53_3
; %bb.1:
	ldx	__rc8
.LBB53_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB53_2
.LBB53_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end53:
	.size	__ashrdi3, .Lfunc_end53-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB54_2
.LBB54_1:                               ;   in Loop: Header=BB54_2 Depth=1
	dex
	cmp	#128
	rol
.LBB54_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB54_1
; %bb.3:
	rts
.Lfunc_end54:
	.size	__rotlqi3, .Lfunc_end54-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB55_3
; %bb.1:
	ldx	__rc2
.LBB55_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB55_2
.LBB55_3:
	tax
	lda	__rc3
	rts
.Lfunc_end55:
	.size	__rotlhi3, .Lfunc_end55-__rotlhi3
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
	beq	.LBB56_3
; %bb.1:
	ldx	__rc4
.LBB56_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB56_2
.LBB56_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end56:
	.size	__rotlsi3, .Lfunc_end56-__rotlsi3
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
	beq	.LBB57_3
; %bb.1:
	ldx	__rc8
.LBB57_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB57_2
.LBB57_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end57:
	.size	__rotldi3, .Lfunc_end57-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB58_2
.LBB58_1:                               ;   in Loop: Header=BB58_2 Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror
.LBB58_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB58_1
; %bb.3:
	rts
.Lfunc_end58:
	.size	__rotrqi3, .Lfunc_end58-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB59_3
; %bb.1:
	ldx	__rc2
.LBB59_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB59_2
.LBB59_3:
	ldx	__rc3
	rts
.Lfunc_end59:
	.size	__rotrhi3, .Lfunc_end59-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB60_3
; %bb.1:
	ldx	__rc4
.LBB60_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	lsr	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB60_2
.LBB60_3:
	ldx	__rc5
	rts
.Lfunc_end60:
	.size	__rotrsi3, .Lfunc_end60-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB61_3
; %bb.1:
	ldx	__rc8
.LBB61_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc8
	lsr	__rc8
	ror	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc9
	ror
	cpx	#0
	bne	.LBB61_2
.LBB61_3:
	ldx	__rc9
	rts
.Lfunc_end61:
	.size	__rotrdi3, .Lfunc_end61-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB62_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB62_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB62_4
; %bb.3:                                ;   in Loop: Header=BB62_2 Depth=1
	clc
	adc	__rc2
.LBB62_4:                               ;   in Loop: Header=BB62_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB62_2
; %bb.5:
	rts
.LBB62_6:
	lda	#0
	rts
.Lfunc_end62:
	.size	__mulqi3, .Lfunc_end62-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB63_2
; %bb.1:
	ldy	__rc2
	beq	.LBB63_7
.LBB63_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB63_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB63_5
; %bb.4:                                ;   in Loop: Header=BB63_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB63_5:                               ;   in Loop: Header=BB63_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB63_3
; %bb.6:                                ;   in Loop: Header=BB63_3 Depth=1
	ldx	__rc2
	bne	.LBB63_3
	bra	.LBB63_8
.LBB63_7:
	ldy	#0
	tya
.LBB63_8:
	tax
	tya
	rts
.Lfunc_end63:
	.size	__mulhi3, .Lfunc_end63-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB64_4
; %bb.1:
	ldy	__rc6
	bne	.LBB64_4
; %bb.2:
	ldy	__rc5
	bne	.LBB64_4
; %bb.3:
	ldy	__rc4
	bne	.LBB64_4
; %bb.13:
	jmp	.LBB64_12
.LBB64_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB64_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB64_7
; %bb.6:                                ;   in Loop: Header=BB64_5 Depth=1
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
.LBB64_7:                               ;   in Loop: Header=BB64_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB64_5
; %bb.8:                                ;   in Loop: Header=BB64_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB64_5
; %bb.9:                                ;   in Loop: Header=BB64_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB64_5
; %bb.10:                               ;   in Loop: Header=BB64_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB64_5
.LBB64_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB64_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB64_11
.Lfunc_end64:
	.size	__mulsi3, .Lfunc_end64-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB65_8
; %bb.1:
	ldy	__rc14
	bne	.LBB65_8
; %bb.2:
	ldy	__rc13
	bne	.LBB65_8
; %bb.3:
	ldy	__rc12
	bne	.LBB65_8
; %bb.4:
	ldy	__rc11
	bne	.LBB65_8
; %bb.5:
	ldy	__rc10
	bne	.LBB65_8
; %bb.6:
	ldy	__rc9
	bne	.LBB65_8
; %bb.7:
	ldy	__rc8
	bne	.LBB65_8
; %bb.21:
	jmp	.LBB65_20
.LBB65_8:
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
.LBB65_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB65_11
; %bb.10:                               ;   in Loop: Header=BB65_9 Depth=1
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
.LBB65_11:                              ;   in Loop: Header=BB65_9 Depth=1
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
	beq	.LBB65_12
; %bb.23:                               ;   in Loop: Header=BB65_9 Depth=1
	jmp	.LBB65_9
.LBB65_12:                              ;   in Loop: Header=BB65_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB65_13
; %bb.25:                               ;   in Loop: Header=BB65_9 Depth=1
	jmp	.LBB65_9
.LBB65_13:                              ;   in Loop: Header=BB65_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB65_14
; %bb.27:                               ;   in Loop: Header=BB65_9 Depth=1
	jmp	.LBB65_9
.LBB65_14:                              ;   in Loop: Header=BB65_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB65_15
; %bb.29:                               ;   in Loop: Header=BB65_9 Depth=1
	jmp	.LBB65_9
.LBB65_15:                              ;   in Loop: Header=BB65_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB65_16
; %bb.31:                               ;   in Loop: Header=BB65_9 Depth=1
	jmp	.LBB65_9
.LBB65_16:                              ;   in Loop: Header=BB65_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB65_17
; %bb.33:                               ;   in Loop: Header=BB65_9 Depth=1
	jmp	.LBB65_9
.LBB65_17:                              ;   in Loop: Header=BB65_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB65_18
; %bb.35:                               ;   in Loop: Header=BB65_9 Depth=1
	jmp	.LBB65_9
.LBB65_18:                              ;   in Loop: Header=BB65_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB65_19
; %bb.37:                               ;   in Loop: Header=BB65_9 Depth=1
	jmp	.LBB65_9
.LBB65_19:
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
.LBB65_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB65_19
.Lfunc_end65:
	.size	__muldi3, .Lfunc_end65-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB66_1
; %bb.15:
	jmp	.LBB66_14
.LBB66_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB66_2
; %bb.17:
	jmp	.LBB66_14
.LBB66_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB66_3
; %bb.19:
	jmp	.LBB66_14
.LBB66_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB66_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB66_6
; %bb.5:                                ;   in Loop: Header=BB66_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB66_8
	bra	.LBB66_7
.LBB66_6:                               ;   in Loop: Header=BB66_4 Depth=1
	cpy	__rc4
	bcc	.LBB66_8
.LBB66_7:                               ;   in Loop: Header=BB66_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB66_4
	bra	.LBB66_9
.LBB66_8:
	ldy	__rc3
	sty	__rc2
.LBB66_9:
	cpx	#0
	beq	.LBB66_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB66_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB66_13
; %bb.12:                               ;   in Loop: Header=BB66_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB66_13:                              ;   in Loop: Header=BB66_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB66_11
.LBB66_14:
	rts
.Lfunc_end66:
	.size	__udivqi3, .Lfunc_end66-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB67_2
; %bb.1:
	ldy	__rc2
	beq	.LBB67_4
.LBB67_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB67_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB67_6
.LBB67_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB67_22
.LBB67_5:
	cmp	__rc3
	bcc	.LBB67_4
.LBB67_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB67_7
; %bb.25:
	jmp	.LBB67_22
.LBB67_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB67_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB67_10
; %bb.9:                                ;   in Loop: Header=BB67_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB67_12
	bra	.LBB67_11
.LBB67_10:                              ;   in Loop: Header=BB67_8 Depth=1
	cmp	__rc6
	bcc	.LBB67_12
.LBB67_11:                              ;   in Loop: Header=BB67_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB67_8
	bra	.LBB67_13
.LBB67_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB67_13:
	cpx	#0
	bne	.LBB67_14
; %bb.27:
	jmp	.LBB67_22
.LBB67_14:
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
.LBB67_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB67_17
; %bb.16:                               ;   in Loop: Header=BB67_15 Depth=1
	ldy	#0
.LBB67_17:                              ;   in Loop: Header=BB67_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB67_21
; %bb.18:                               ;   in Loop: Header=BB67_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB67_20
.LBB67_19:                              ;   in Loop: Header=BB67_15 Depth=1
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
.LBB67_20:                              ;   in Loop: Header=BB67_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB67_15
	bra	.LBB67_22
.LBB67_21:                              ;   in Loop: Header=BB67_15 Depth=1
	cmp	__rc6
	bcs	.LBB67_19
	bra	.LBB67_20
.LBB67_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end67:
	.size	__udivhi3, .Lfunc_end67-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
	ldy	__rc7
	bne	.LBB68_4
; %bb.1:
	ldy	__rc6
	bne	.LBB68_4
; %bb.2:
	ldy	__rc5
	bne	.LBB68_4
; %bb.3:
	ldy	__rc4
	beq	.LBB68_9
.LBB68_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB68_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB68_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB68_7
; %bb.45:
	jmp	.LBB68_38
.LBB68_7:
	cmp	__rc4
	bcc	.LBB68_9
	bra	.LBB68_11
.LBB68_8:
	cpx	__rc7
	bcs	.LBB68_11
.LBB68_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB68_21
.LBB68_10:
	cpx	__rc6
	bcc	.LBB68_9
.LBB68_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB68_12
; %bb.47:
	jmp	.LBB68_21
.LBB68_12:
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
.LBB68_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB68_17
; %bb.14:                               ;   in Loop: Header=BB68_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB68_18
; %bb.15:                               ;   in Loop: Header=BB68_13 Depth=1
	cmp	__rc10
	bne	.LBB68_19
; %bb.16:                               ;   in Loop: Header=BB68_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB68_23
	bra	.LBB68_20
.LBB68_17:                              ;   in Loop: Header=BB68_13 Depth=1
	cpy	__rc12
	bcc	.LBB68_23
	bra	.LBB68_20
.LBB68_18:                              ;   in Loop: Header=BB68_13 Depth=1
	cpy	__rc11
	bcc	.LBB68_23
	bra	.LBB68_20
.LBB68_19:                              ;   in Loop: Header=BB68_13 Depth=1
	cmp	__rc10
	bcc	.LBB68_23
.LBB68_20:                              ;   in Loop: Header=BB68_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB68_13
	bra	.LBB68_24
.LBB68_21:
	stz	__rc2
	stz	__rc3
.LBB68_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB68_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB68_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB68_22
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
.LBB68_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB68_28
; %bb.27:                               ;   in Loop: Header=BB68_26 Depth=1
	ldy	#0
.LBB68_28:                              ;   in Loop: Header=BB68_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB68_32
; %bb.29:                               ;   in Loop: Header=BB68_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB68_34
; %bb.30:                               ;   in Loop: Header=BB68_26 Depth=1
	cmp	__rc10
	bne	.LBB68_37
; %bb.31:                               ;   in Loop: Header=BB68_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB68_33
	bra	.LBB68_35
.LBB68_32:                              ;   in Loop: Header=BB68_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB68_35
.LBB68_33:                              ;   in Loop: Header=BB68_26 Depth=1
	lda	__rc6
	bra	.LBB68_36
.LBB68_34:                              ;   in Loop: Header=BB68_26 Depth=1
	cpy	__rc11
	bcc	.LBB68_33
.LBB68_35:                              ;   in Loop: Header=BB68_26 Depth=1
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
.LBB68_36:                              ;   in Loop: Header=BB68_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB68_41
; %bb.49:                               ;   in Loop: Header=BB68_26 Depth=1
	jmp	.LBB68_26
.LBB68_41:
	jmp	.LBB68_22
.LBB68_37:                              ;   in Loop: Header=BB68_26 Depth=1
	cmp	__rc10
	bcc	.LBB68_33
	bra	.LBB68_35
.LBB68_38:
	cpx	__rc5
	bcs	.LBB68_43
; %bb.51:
	jmp	.LBB68_9
.LBB68_43:
	jmp	.LBB68_11
.Lfunc_end68:
	.size	__udivsi3, .Lfunc_end68-__udivsi3
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
	bne	.LBB69_8
; %bb.1:
	ldx	__rc14
	bne	.LBB69_8
; %bb.2:
	ldx	__rc13
	bne	.LBB69_8
; %bb.3:
	ldx	__rc12
	bne	.LBB69_8
; %bb.4:
	ldx	__rc11
	bne	.LBB69_8
; %bb.5:
	ldx	__rc10
	bne	.LBB69_8
; %bb.6:
	ldx	__rc9
	bne	.LBB69_8
; %bb.7:
	ldx	__rc8
	beq	.LBB69_17
.LBB69_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB69_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB69_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB69_11
; %bb.90:
	jmp	.LBB69_31
.LBB69_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB69_12
; %bb.92:
	jmp	.LBB69_32
.LBB69_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB69_13
; %bb.94:
	jmp	.LBB69_38
.LBB69_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB69_14
; %bb.96:
	jmp	.LBB69_40
.LBB69_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB69_15
; %bb.98:
	jmp	.LBB69_42
.LBB69_15:
	cmp	__rc8
	bcc	.LBB69_17
	bra	.LBB69_19
.LBB69_16:
	cpx	__rc15
	bcs	.LBB69_19
.LBB69_17:
	lda	#0
; %bb.66:
	jmp	.LBB69_29
.LBB69_18:
	cpx	__rc14
	bcc	.LBB69_17
.LBB69_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB69_20
; %bb.100:
	jmp	.LBB69_29
.LBB69_20:
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
.LBB69_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB69_25
; %bb.22:                               ;   in Loop: Header=BB69_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB69_26
; %bb.23:                               ;   in Loop: Header=BB69_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB69_27
; %bb.24:                               ;   in Loop: Header=BB69_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB69_102
; %bb.150:                              ;   in Loop: Header=BB69_21 Depth=1
	jmp	.LBB69_33
.LBB69_102:                             ;   in Loop: Header=BB69_21 Depth=1
	jmp	.LBB69_37
.LBB69_25:                              ;   in Loop: Header=BB69_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB69_28
; %bb.104:
	jmp	.LBB69_44
.LBB69_26:                              ;   in Loop: Header=BB69_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB69_28
; %bb.106:
	jmp	.LBB69_44
.LBB69_27:                              ;   in Loop: Header=BB69_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB69_28
; %bb.108:
	jmp	.LBB69_44
.LBB69_28:                              ;   in Loop: Header=BB69_21 Depth=1
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
	bmi	.LBB69_68
; %bb.110:                              ;   in Loop: Header=BB69_21 Depth=1
	jmp	.LBB69_21
.LBB69_68:
	jmp	.LBB69_45
.LBB69_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB69_30:
	ldx	__rc18
	rts
.LBB69_31:
	cpx	__rc13
	bcs	.LBB69_70
; %bb.112:
	jmp	.LBB69_17
.LBB69_70:
	jmp	.LBB69_19
.LBB69_32:
	cpx	__rc12
	bcs	.LBB69_72
; %bb.114:
	jmp	.LBB69_17
.LBB69_72:
	jmp	.LBB69_19
.LBB69_33:                              ;   in Loop: Header=BB69_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB69_39
; %bb.34:                               ;   in Loop: Header=BB69_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB69_41
; %bb.35:                               ;   in Loop: Header=BB69_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB69_43
; %bb.36:                               ;   in Loop: Header=BB69_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB69_44
; %bb.74:                               ;   in Loop: Header=BB69_21 Depth=1
	jmp	.LBB69_28
.LBB69_37:                              ;   in Loop: Header=BB69_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB69_44
; %bb.76:                               ;   in Loop: Header=BB69_21 Depth=1
	jmp	.LBB69_28
.LBB69_38:
	cpx	__rc11
	bcs	.LBB69_78
; %bb.116:
	jmp	.LBB69_17
.LBB69_78:
	jmp	.LBB69_19
.LBB69_39:                              ;   in Loop: Header=BB69_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB69_44
; %bb.80:                               ;   in Loop: Header=BB69_21 Depth=1
	jmp	.LBB69_28
.LBB69_40:
	cpx	__rc10
	bcs	.LBB69_82
; %bb.118:
	jmp	.LBB69_17
.LBB69_82:
	jmp	.LBB69_19
.LBB69_41:                              ;   in Loop: Header=BB69_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB69_44
; %bb.84:                               ;   in Loop: Header=BB69_21 Depth=1
	jmp	.LBB69_28
.LBB69_42:
	cpx	__rc9
	bcs	.LBB69_86
; %bb.120:
	jmp	.LBB69_17
.LBB69_86:
	jmp	.LBB69_19
.LBB69_43:                              ;   in Loop: Header=BB69_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB69_44
; %bb.122:                              ;   in Loop: Header=BB69_21 Depth=1
	jmp	.LBB69_28
.LBB69_44:
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
.LBB69_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB69_46
; %bb.124:
	jmp	.LBB69_30
.LBB69_46:
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
.LBB69_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB69_49
; %bb.48:                               ;   in Loop: Header=BB69_47 Depth=1
	ldy	#0
.LBB69_49:                              ;   in Loop: Header=BB69_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB69_57
; %bb.50:                               ;   in Loop: Header=BB69_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB69_51
; %bb.126:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_60
.LBB69_51:                              ;   in Loop: Header=BB69_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB69_52
; %bb.128:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_61
.LBB69_52:                              ;   in Loop: Header=BB69_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB69_53
; %bb.130:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_62
.LBB69_53:                              ;   in Loop: Header=BB69_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB69_54
; %bb.132:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_63
.LBB69_54:                              ;   in Loop: Header=BB69_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB69_55
; %bb.134:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_64
.LBB69_55:                              ;   in Loop: Header=BB69_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB69_56
; %bb.136:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_65
.LBB69_56:                              ;   in Loop: Header=BB69_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB69_58
	bra	.LBB69_59
.LBB69_57:                              ;   in Loop: Header=BB69_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB69_59
.LBB69_58:                              ;   in Loop: Header=BB69_47 Depth=1
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
.LBB69_59:                              ;   in Loop: Header=BB69_47 Depth=1
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
	beq	.LBB69_88
; %bb.138:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_47
.LBB69_88:
	jmp	.LBB69_30
.LBB69_60:                              ;   in Loop: Header=BB69_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB69_58
	bra	.LBB69_59
.LBB69_61:                              ;   in Loop: Header=BB69_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB69_59
; %bb.140:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_58
.LBB69_62:                              ;   in Loop: Header=BB69_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB69_59
; %bb.142:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_58
.LBB69_63:                              ;   in Loop: Header=BB69_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB69_59
; %bb.144:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_58
.LBB69_64:                              ;   in Loop: Header=BB69_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB69_59
; %bb.146:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_58
.LBB69_65:                              ;   in Loop: Header=BB69_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB69_59
; %bb.148:                              ;   in Loop: Header=BB69_47 Depth=1
	jmp	.LBB69_58
.Lfunc_end69:
	.size	__udivdi3, .Lfunc_end69-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB70_1
; %bb.15:
	jmp	.LBB70_13
.LBB70_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB70_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB70_14
; %bb.3:
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB70_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB70_6
; %bb.5:                                ;   in Loop: Header=BB70_4 Depth=1
	cmp	__rc2
	bcc	.LBB70_8
	bra	.LBB70_7
.LBB70_6:                               ;   in Loop: Header=BB70_4 Depth=1
	cpy	__rc4
	bcc	.LBB70_8
.LBB70_7:                               ;   in Loop: Header=BB70_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB70_4
	bra	.LBB70_9
.LBB70_8:
	ldy	__rc3
	sty	__rc2
.LBB70_9:
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB70_13
.LBB70_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB70_12
; %bb.11:                               ;   in Loop: Header=BB70_10 Depth=1
	sec
	sbc	__rc2
.LBB70_12:                              ;   in Loop: Header=BB70_10 Depth=1
	dex
	bne	.LBB70_10
.LBB70_13:
	rts
.LBB70_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end70:
	.size	__umodqi3, .Lfunc_end70-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB71_2
; %bb.1:
	ldx	__rc2
	bne	.LBB71_2
; %bb.22:
	jmp	.LBB71_19
.LBB71_2:
	cmp	__rc3
	bne	.LBB71_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB71_5
; %bb.20:
	jmp	.LBB71_19
.LBB71_4:
	cmp	__rc3
	bcs	.LBB71_5
; %bb.24:
	jmp	.LBB71_19
.LBB71_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB71_6
; %bb.26:
	jmp	.LBB71_18
.LBB71_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB71_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB71_9
; %bb.8:                                ;   in Loop: Header=BB71_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB71_11
	bra	.LBB71_10
.LBB71_9:                               ;   in Loop: Header=BB71_7 Depth=1
	cmp	__rc5
	bcc	.LBB71_11
.LBB71_10:                              ;   in Loop: Header=BB71_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB71_7
	bra	.LBB71_12
.LBB71_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB71_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB71_19
.LBB71_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB71_17
; %bb.14:                               ;   in Loop: Header=BB71_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB71_16
.LBB71_15:                              ;   in Loop: Header=BB71_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB71_16:                              ;   in Loop: Header=BB71_13 Depth=1
	dex
	bne	.LBB71_13
	bra	.LBB71_19
.LBB71_17:                              ;   in Loop: Header=BB71_13 Depth=1
	cmp	__rc5
	bcs	.LBB71_15
	bra	.LBB71_16
.LBB71_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB71_19:
	tax
	tya
	rts
.Lfunc_end71:
	.size	__umodhi3, .Lfunc_end71-__umodhi3
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
	bne	.LBB72_4
; %bb.1:
	ldx	__rc6
	bne	.LBB72_4
; %bb.2:
	ldx	__rc5
	bne	.LBB72_4
; %bb.3:
	ldx	__rc4
	bne	.LBB72_4
; %bb.42:
	jmp	.LBB72_35
.LBB72_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB72_8
; %bb.5:
	cmp	__rc6
	bne	.LBB72_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB72_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB72_11
; %bb.36:
	jmp	.LBB72_35
.LBB72_8:
	cpx	__rc7
	bcs	.LBB72_11
; %bb.38:
	jmp	.LBB72_35
.LBB72_9:
	cmp	__rc6
	bcs	.LBB72_11
; %bb.40:
	jmp	.LBB72_35
.LBB72_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB72_11
; %bb.44:
	jmp	.LBB72_35
.LBB72_11:
	ldx	__rc7
	bpl	.LBB72_12
; %bb.46:
	jmp	.LBB72_33
.LBB72_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB72_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB72_17
; %bb.14:                               ;   in Loop: Header=BB72_13 Depth=1
	cmp	__rc8
	bne	.LBB72_18
; %bb.15:                               ;   in Loop: Header=BB72_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB72_19
; %bb.16:                               ;   in Loop: Header=BB72_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB72_21
	bra	.LBB72_20
.LBB72_17:                              ;   in Loop: Header=BB72_13 Depth=1
	cpy	__rc9
	bcc	.LBB72_21
	bra	.LBB72_20
.LBB72_18:                              ;   in Loop: Header=BB72_13 Depth=1
	cmp	__rc8
	bcc	.LBB72_21
	bra	.LBB72_20
.LBB72_19:                              ;   in Loop: Header=BB72_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB72_21
.LBB72_20:                              ;   in Loop: Header=BB72_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB72_13
	bra	.LBB72_22
.LBB72_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB72_22:
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
	bne	.LBB72_23
; %bb.48:
	jmp	.LBB72_34
.LBB72_23:
	tya
.LBB72_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB72_28
; %bb.25:                               ;   in Loop: Header=BB72_24 Depth=1
	cmp	__rc8
	bne	.LBB72_31
; %bb.26:                               ;   in Loop: Header=BB72_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB72_32
; %bb.27:                               ;   in Loop: Header=BB72_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB72_29
	bra	.LBB72_30
.LBB72_28:                              ;   in Loop: Header=BB72_24 Depth=1
	cpy	__rc9
	bcc	.LBB72_30
.LBB72_29:                              ;   in Loop: Header=BB72_24 Depth=1
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
.LBB72_30:                              ;   in Loop: Header=BB72_24 Depth=1
	dex
	bne	.LBB72_24
	bra	.LBB72_35
.LBB72_31:                              ;   in Loop: Header=BB72_24 Depth=1
	cmp	__rc8
	bcs	.LBB72_29
	bra	.LBB72_30
.LBB72_32:                              ;   in Loop: Header=BB72_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB72_29
	bra	.LBB72_30
.LBB72_33:
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
	bra	.LBB72_35
.LBB72_34:
	tya
.LBB72_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end72:
	.size	__umodsi3, .Lfunc_end72-__umodsi3
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
	bne	.LBB73_8
; %bb.1:
	ldx	__rc14
	bne	.LBB73_8
; %bb.2:
	ldx	__rc13
	bne	.LBB73_8
; %bb.3:
	ldx	__rc12
	bne	.LBB73_8
; %bb.4:
	ldx	__rc11
	bne	.LBB73_8
; %bb.5:
	ldx	__rc10
	bne	.LBB73_8
; %bb.6:
	ldx	__rc9
	bne	.LBB73_8
; %bb.7:
	ldx	__rc8
	bne	.LBB73_8
; %bb.90:
	jmp	.LBB73_61
.LBB73_8:
	cmp	__rc15
	bne	.LBB73_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB73_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB73_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB73_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB73_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB73_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB73_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB73_23
; %bb.62:
	jmp	.LBB73_61
.LBB73_16:
	cmp	__rc15
	bcs	.LBB73_23
; %bb.64:
	jmp	.LBB73_61
.LBB73_17:
	cpx	__rc14
	bcs	.LBB73_23
; %bb.66:
	jmp	.LBB73_61
.LBB73_18:
	cpx	__rc13
	bcs	.LBB73_23
; %bb.68:
	jmp	.LBB73_61
.LBB73_19:
	cpx	__rc12
	bcs	.LBB73_23
; %bb.70:
	jmp	.LBB73_61
.LBB73_20:
	cpx	__rc11
	bcs	.LBB73_23
; %bb.72:
	jmp	.LBB73_61
.LBB73_21:
	cpx	__rc10
	bcs	.LBB73_23
; %bb.74:
	jmp	.LBB73_61
.LBB73_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB73_23
; %bb.92:
	jmp	.LBB73_61
.LBB73_23:
	ldx	__rc15
	bpl	.LBB73_24
; %bb.94:
	jmp	.LBB73_33
.LBB73_24:
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
.LBB73_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB73_29
; %bb.26:                               ;   in Loop: Header=BB73_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB73_30
; %bb.27:                               ;   in Loop: Header=BB73_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB73_31
; %bb.28:                               ;   in Loop: Header=BB73_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB73_76
; %bb.96:                               ;   in Loop: Header=BB73_25 Depth=1
	jmp	.LBB73_38
.LBB73_76:                              ;   in Loop: Header=BB73_25 Depth=1
	jmp	.LBB73_34
.LBB73_29:                              ;   in Loop: Header=BB73_25 Depth=1
	cmp	__rc19
	bcs	.LBB73_32
; %bb.98:
	jmp	.LBB73_42
.LBB73_30:                              ;   in Loop: Header=BB73_25 Depth=1
	cpy	__rc18
	bcs	.LBB73_32
; %bb.100:
	jmp	.LBB73_42
.LBB73_31:                              ;   in Loop: Header=BB73_25 Depth=1
	cpy	__rc7
	bcs	.LBB73_32
; %bb.102:
	jmp	.LBB73_42
.LBB73_32:                              ;   in Loop: Header=BB73_25 Depth=1
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
	bmi	.LBB73_78
; %bb.104:                              ;   in Loop: Header=BB73_25 Depth=1
	jmp	.LBB73_25
.LBB73_78:
	jmp	.LBB73_43
.LBB73_33:
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
	jmp	.LBB73_61
.LBB73_34:                              ;   in Loop: Header=BB73_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB73_39
; %bb.35:                               ;   in Loop: Header=BB73_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB73_40
; %bb.36:                               ;   in Loop: Header=BB73_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB73_41
; %bb.37:                               ;   in Loop: Header=BB73_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB73_42
; %bb.82:                               ;   in Loop: Header=BB73_25 Depth=1
	jmp	.LBB73_32
.LBB73_38:                              ;   in Loop: Header=BB73_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB73_42
; %bb.84:                               ;   in Loop: Header=BB73_25 Depth=1
	jmp	.LBB73_32
.LBB73_39:                              ;   in Loop: Header=BB73_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB73_42
; %bb.86:                               ;   in Loop: Header=BB73_25 Depth=1
	jmp	.LBB73_32
.LBB73_40:                              ;   in Loop: Header=BB73_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB73_42
; %bb.88:                               ;   in Loop: Header=BB73_25 Depth=1
	jmp	.LBB73_32
.LBB73_41:                              ;   in Loop: Header=BB73_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB73_42
; %bb.106:                              ;   in Loop: Header=BB73_25 Depth=1
	jmp	.LBB73_32
.LBB73_42:
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
.LBB73_43:
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
	bne	.LBB73_44
; %bb.108:
	jmp	.LBB73_61
.LBB73_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB73_52
; %bb.45:                               ;   in Loop: Header=BB73_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB73_46
; %bb.110:                              ;   in Loop: Header=BB73_44 Depth=1
	jmp	.LBB73_55
.LBB73_46:                              ;   in Loop: Header=BB73_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB73_47
; %bb.112:                              ;   in Loop: Header=BB73_44 Depth=1
	jmp	.LBB73_56
.LBB73_47:                              ;   in Loop: Header=BB73_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB73_48
; %bb.114:                              ;   in Loop: Header=BB73_44 Depth=1
	jmp	.LBB73_57
.LBB73_48:                              ;   in Loop: Header=BB73_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB73_49
; %bb.116:                              ;   in Loop: Header=BB73_44 Depth=1
	jmp	.LBB73_58
.LBB73_49:                              ;   in Loop: Header=BB73_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB73_50
; %bb.118:                              ;   in Loop: Header=BB73_44 Depth=1
	jmp	.LBB73_59
.LBB73_50:                              ;   in Loop: Header=BB73_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB73_51
; %bb.120:                              ;   in Loop: Header=BB73_44 Depth=1
	jmp	.LBB73_60
.LBB73_51:                              ;   in Loop: Header=BB73_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB73_53
	bra	.LBB73_54
.LBB73_52:                              ;   in Loop: Header=BB73_44 Depth=1
	cmp	__rc19
	bcc	.LBB73_54
.LBB73_53:                              ;   in Loop: Header=BB73_44 Depth=1
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
.LBB73_54:                              ;   in Loop: Header=BB73_44 Depth=1
	dex
	beq	.LBB73_61
; %bb.122:                              ;   in Loop: Header=BB73_44 Depth=1
	jmp	.LBB73_44
.LBB73_55:                              ;   in Loop: Header=BB73_44 Depth=1
	cpy	__rc18
	bcs	.LBB73_53
	bra	.LBB73_54
.LBB73_56:                              ;   in Loop: Header=BB73_44 Depth=1
	cpy	__rc7
	bcs	.LBB73_53
	bra	.LBB73_54
.LBB73_57:                              ;   in Loop: Header=BB73_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB73_53
	bra	.LBB73_54
.LBB73_58:                              ;   in Loop: Header=BB73_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB73_53
	bra	.LBB73_54
.LBB73_59:                              ;   in Loop: Header=BB73_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB73_53
	bra	.LBB73_54
.LBB73_60:                              ;   in Loop: Header=BB73_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB73_54
; %bb.124:                              ;   in Loop: Header=BB73_44 Depth=1
	jmp	.LBB73_53
.LBB73_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end73:
	.size	__umoddi3, .Lfunc_end73-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB74_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB74_2
; %bb.18:
	jmp	.LBB74_17
.LBB74_2:
	lda	__rc5
	bpl	.LBB74_3
; %bb.20:
	jmp	.LBB74_15
.LBB74_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB74_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB74_6
; %bb.5:                                ;   in Loop: Header=BB74_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB74_9
	bra	.LBB74_7
.LBB74_6:                               ;   in Loop: Header=BB74_4 Depth=1
	cpy	__rc6
	bcc	.LBB74_9
.LBB74_7:                               ;   in Loop: Header=BB74_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB74_4
	bra	.LBB74_10
.LBB74_8:
	sty	__rc7
	bra	.LBB74_17
.LBB74_9:
	ldy	__rc5
	sty	__rc4
.LBB74_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB74_16
; %bb.11:
	lda	#1
.LBB74_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB74_14
; %bb.13:                               ;   in Loop: Header=BB74_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB74_14:                              ;   in Loop: Header=BB74_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB74_12
	bra	.LBB74_17
.LBB74_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB74_16:
	lda	#1
.LBB74_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end74:
	.size	__udivmodqi4, .Lfunc_end74-__udivmodqi4
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
	bne	.LBB75_2
; %bb.1:
	ldx	__rc2
	beq	.LBB75_4
.LBB75_2:
	cmp	__rc3
	bne	.LBB75_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB75_6
.LBB75_4:
	ldx	#0
; %bb.26:
	jmp	.LBB75_24
.LBB75_5:
	cmp	__rc3
	bcc	.LBB75_4
.LBB75_6:
	tay
	ldx	__rc3
	bpl	.LBB75_7
; %bb.28:
	jmp	.LBB75_22
.LBB75_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB75_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB75_10
; %bb.9:                                ;   in Loop: Header=BB75_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB75_11
	bra	.LBB75_12
.LBB75_10:                              ;   in Loop: Header=BB75_8 Depth=1
	cmp	__rc8
	bcc	.LBB75_12
.LBB75_11:                              ;   in Loop: Header=BB75_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB75_8
	bra	.LBB75_13
.LBB75_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB75_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB75_14
; %bb.30:
	jmp	.LBB75_23
.LBB75_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB75_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB75_17
; %bb.16:                               ;   in Loop: Header=BB75_15 Depth=1
	ldy	#0
.LBB75_17:                              ;   in Loop: Header=BB75_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB75_21
; %bb.18:                               ;   in Loop: Header=BB75_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB75_20
.LBB75_19:                              ;   in Loop: Header=BB75_15 Depth=1
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
.LBB75_20:                              ;   in Loop: Header=BB75_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB75_15
	bra	.LBB75_25
.LBB75_21:                              ;   in Loop: Header=BB75_15 Depth=1
	cmp	__rc8
	bcs	.LBB75_19
	bra	.LBB75_20
.LBB75_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB75_23:
	ldx	#1
.LBB75_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB75_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end75:
	.size	__udivmodhi4, .Lfunc_end75-__udivmodhi4
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
	bpl	.LBB76_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB76_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB76_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB76_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB76_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB76_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB76_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB76_8:
	lda	__rc2
	rts
.Lfunc_end76:
	.size	__divqi3, .Lfunc_end76-__divqi3
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
	bmi	.LBB77_2
; %bb.1:
	bra	.LBB77_6
.LBB77_2:
	cpx	#128
	bne	.LBB77_5
; %bb.3:
	lda	__rc4
	bne	.LBB77_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB77_6
.LBB77_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB77_6:
	tya
	bmi	.LBB77_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB77_12
.LBB77_8:
	cpy	#128
	bne	.LBB77_11
; %bb.9:
	lda	__rc2
	bne	.LBB77_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB77_12
.LBB77_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB77_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB77_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB77_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end77:
	.size	__divhi3, .Lfunc_end77-__divhi3
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
	bmi	.LBB78_2
; %bb.1:
	ldy	__rc3
	bra	.LBB78_8
.LBB78_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB78_7
; %bb.3:
	lda	__rc2
	bne	.LBB78_7
; %bb.4:
	lda	__rc8
	bne	.LBB78_7
; %bb.5:
	lda	__rc9
	bne	.LBB78_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB78_8
.LBB78_7:
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
.LBB78_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB78_10
; %bb.9:
	lda	__rc7
	bra	.LBB78_16
.LBB78_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB78_15
; %bb.11:
	lda	__rc6
	bne	.LBB78_15
; %bb.12:
	lda	__rc5
	bne	.LBB78_15
; %bb.13:
	lda	__rc4
	bne	.LBB78_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB78_16
.LBB78_15:
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
.LBB78_16:
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
	bne	.LBB78_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB78_19
.LBB78_18:
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
.LBB78_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end78:
	.size	__divsi3, .Lfunc_end78-__divsi3
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
	bmi	.LBB79_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB79_12
.LBB79_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB79_11
; %bb.3:
	lda	__rc6
	bne	.LBB79_11
; %bb.4:
	lda	__rc5
	bne	.LBB79_11
; %bb.5:
	lda	__rc4
	bne	.LBB79_11
; %bb.6:
	lda	__rc3
	bne	.LBB79_11
; %bb.7:
	lda	__rc2
	bne	.LBB79_11
; %bb.8:
	lda	__rc18
	bne	.LBB79_11
; %bb.9:
	lda	__rc19
	bne	.LBB79_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB79_12
.LBB79_11:
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
.LBB79_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB79_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB79_24
.LBB79_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB79_23
; %bb.15:
	lda	__rc14
	bne	.LBB79_23
; %bb.16:
	lda	__rc13
	bne	.LBB79_23
; %bb.17:
	lda	__rc12
	bne	.LBB79_23
; %bb.18:
	lda	__rc11
	bne	.LBB79_23
; %bb.19:
	lda	__rc10
	bne	.LBB79_23
; %bb.20:
	lda	__rc9
	bne	.LBB79_23
; %bb.21:
	lda	__rc8
	bne	.LBB79_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB79_24
.LBB79_23:
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
.LBB79_24:
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
	bne	.LBB79_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB79_27
.LBB79_26:
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
.LBB79_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end79:
	.size	__divdi3, .Lfunc_end79-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB80_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB80_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB80_3:
	tay
	lda	__rc2
	bmi	.LBB80_5
; %bb.4:
	lda	__rc2
	bra	.LBB80_7
.LBB80_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB80_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB80_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB80_9
; %bb.8:
	rts
.LBB80_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end80:
	.size	__modqi3, .Lfunc_end80-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB81_2
; %bb.1:
	txa
	bra	.LBB81_6
.LBB81_2:
	cpx	#128
	bne	.LBB81_5
; %bb.3:
	lda	__rc4
	bne	.LBB81_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB81_6
.LBB81_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB81_6:
	ldx	__rc3
	bpl	.LBB81_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB81_10
; %bb.8:
	ldx	__rc2
	bne	.LBB81_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB81_11
.LBB81_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB81_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB81_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB81_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end81:
	.size	__modhi3, .Lfunc_end81-__modhi3
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
	bmi	.LBB82_2
; %bb.1:
	lda	__rc3
	bra	.LBB82_8
.LBB82_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB82_7
; %bb.3:
	lda	__rc2
	bne	.LBB82_7
; %bb.4:
	lda	__rc8
	bne	.LBB82_7
; %bb.5:
	lda	__rc9
	bne	.LBB82_7
; %bb.6:
	stz	__rc9
	lda	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB82_8
.LBB82_7:
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
.LBB82_8:
	ldx	__rc7
	bpl	.LBB82_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB82_14
; %bb.10:
	ldx	__rc6
	bne	.LBB82_14
; %bb.11:
	ldx	__rc5
	bne	.LBB82_14
; %bb.12:
	ldx	__rc4
	bne	.LBB82_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB82_15
.LBB82_14:
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
.LBB82_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB82_17
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
.LBB82_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end82:
	.size	__modsi3, .Lfunc_end82-__modsi3
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
	bmi	.LBB83_2
; %bb.1:
	lda	__rc7
; %bb.26:
	jmp	.LBB83_12
.LBB83_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB83_11
; %bb.3:
	lda	__rc6
	bne	.LBB83_11
; %bb.4:
	lda	__rc5
	bne	.LBB83_11
; %bb.5:
	lda	__rc4
	bne	.LBB83_11
; %bb.6:
	lda	__rc3
	bne	.LBB83_11
; %bb.7:
	lda	__rc2
	bne	.LBB83_11
; %bb.8:
	lda	__rc18
	bne	.LBB83_11
; %bb.9:
	lda	__rc19
	bne	.LBB83_11
; %bb.10:
	stz	__rc19
	lda	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB83_12
.LBB83_11:
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
.LBB83_12:
	ldx	__rc15
	bmi	.LBB83_13
; %bb.28:
	jmp	.LBB83_23
.LBB83_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB83_22
; %bb.14:
	ldx	__rc14
	bne	.LBB83_22
; %bb.15:
	ldx	__rc13
	bne	.LBB83_22
; %bb.16:
	ldx	__rc12
	bne	.LBB83_22
; %bb.17:
	ldx	__rc11
	bne	.LBB83_22
; %bb.18:
	ldx	__rc10
	bne	.LBB83_22
; %bb.19:
	ldx	__rc9
	bne	.LBB83_22
; %bb.20:
	ldx	__rc8
	bne	.LBB83_22
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
	bra	.LBB83_23
.LBB83_22:
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
.LBB83_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB83_25
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
.LBB83_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end83:
	.size	__moddi3, .Lfunc_end83-__moddi3
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
	bpl	.LBB84_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB84_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB84_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB84_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB84_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB84_11
.LBB84_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB84_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB84_8
; %bb.34:
	jmp	.LBB84_24
.LBB84_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB84_24
.LBB84_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB84_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB84_12
.LBB84_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB84_24
.LBB84_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB84_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB84_15
; %bb.14:                               ;   in Loop: Header=BB84_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB84_18
	bra	.LBB84_16
.LBB84_15:                              ;   in Loop: Header=BB84_13 Depth=1
	cmp	__rc7
	bcc	.LBB84_18
.LBB84_16:                              ;   in Loop: Header=BB84_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB84_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB84_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB84_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB84_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB84_22
; %bb.21:                               ;   in Loop: Header=BB84_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB84_22:                              ;   in Loop: Header=BB84_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB84_20
	bra	.LBB84_24
.LBB84_23:
	sta	__rc7
	sty	__rc6
.LBB84_24:
	lda	__rc4
	bmi	.LBB84_26
; %bb.25:
	lda	__rc7
	bra	.LBB84_27
.LBB84_26:
	lda	#0
	sec
	sbc	__rc7
.LBB84_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB84_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB84_29:
	lda	__rc6
	rts
.Lfunc_end84:
	.size	__divmodqi4, .Lfunc_end84-__divmodqi4
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
	bmi	.LBB85_2
.LBB85_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB85_6
.LBB85_2:
	cpx	#128
	bne	.LBB85_5
; %bb.3:
	lda	__rc7
	bne	.LBB85_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB85_1
.LBB85_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB85_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB85_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB85_15
; %bb.8:
	lda	__rc2
	bne	.LBB85_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB85_18
.LBB85_10:
	cpy	#128
	bne	.LBB85_14
; %bb.11:
	ldy	__rc2
	bne	.LBB85_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB85_13
; %bb.48:
	jmp	.LBB85_45
.LBB85_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB85_18
.LBB85_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB85_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB85_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB85_20
.LBB85_17:
	sta	__rc11
.LBB85_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB85_39
.LBB85_19:
	cmp	__rc7
	bcc	.LBB85_17
.LBB85_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB85_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB85_23
; %bb.22:                               ;   in Loop: Header=BB85_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB85_24
	bra	.LBB85_26
.LBB85_23:                              ;   in Loop: Header=BB85_21 Depth=1
	cmp	__rc9
	bcc	.LBB85_26
.LBB85_24:                              ;   in Loop: Header=BB85_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB85_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB85_27
.LBB85_26:
	tay
.LBB85_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB85_28
; %bb.50:
	jmp	.LBB85_37
.LBB85_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB85_32
.LBB85_29:                              ;   in Loop: Header=BB85_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB85_36
.LBB85_30:                              ;   in Loop: Header=BB85_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB85_31:                              ;   in Loop: Header=BB85_32 Depth=1
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
	beq	.LBB85_39
.LBB85_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB85_34
; %bb.33:                               ;   in Loop: Header=BB85_32 Depth=1
	ldy	#0
.LBB85_34:                              ;   in Loop: Header=BB85_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB85_29
; %bb.35:                               ;   in Loop: Header=BB85_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB85_30
.LBB85_36:                              ;   in Loop: Header=BB85_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB85_31
.LBB85_37:
	sta	__rc11
	ldx	#1
.LBB85_38:
	stx	__rc9
.LBB85_39:
	lda	__rc6
	bmi	.LBB85_41
; %bb.40:
	lda	__rc10
	bra	.LBB85_42
.LBB85_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB85_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB85_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB85_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB85_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB85_38
.Lfunc_end85:
	.size	__divmodhi4, .Lfunc_end85-__divmodhi4
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB86_2
; %bb.1:
	tya
	beq	.LBB86_11
.LBB86_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB86_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB86_5
; %bb.4:                                ;   in Loop: Header=BB86_3 Depth=1
	inc	__rc7
.LBB86_5:                               ;   in Loop: Header=BB86_3 Depth=1
	inc	__rc4
	bne	.LBB86_7
; %bb.6:                                ;   in Loop: Header=BB86_3 Depth=1
	inc	__rc5
.LBB86_7:                               ;   in Loop: Header=BB86_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB86_9
; %bb.8:                                ;   in Loop: Header=BB86_3 Depth=1
	dex
.LBB86_9:                               ;   in Loop: Header=BB86_3 Depth=1
	txa
	bne	.LBB86_3
; %bb.10:                               ;   in Loop: Header=BB86_3 Depth=1
	tya
	bne	.LBB86_3
.LBB86_11:
	rts
.Lfunc_end86:
	.size	memcpy, .Lfunc_end86-memcpy
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
.Lfunc_end87:
	.size	memset, .Lfunc_end87-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB88_4
.LBB88_1:                               ;   in Loop: Header=BB88_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB88_3
; %bb.2:                                ;   in Loop: Header=BB88_4 Depth=1
	inc	__rc3
.LBB88_3:                               ;   in Loop: Header=BB88_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB88_7
.LBB88_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB88_1
; %bb.5:                                ;   in Loop: Header=BB88_4 Depth=1
	cpx	#0
	bne	.LBB88_1
; %bb.6:
	rts
.LBB88_7:                               ;   in Loop: Header=BB88_4 Depth=1
	dec	__rc4
	jmp	.LBB88_4
.Lfunc_end88:
	.size	__memset, .Lfunc_end88-__memset
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
	beq	.LBB89_1
; %bb.15:
	jmp	.LBB89_13
.LBB89_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB89_2
; %bb.17:
	jmp	.LBB89_14
.LBB89_2:
	lda	__rc7
	bne	.LBB89_4
; %bb.3:
	lda	__rc6
	beq	.LBB89_12
.LBB89_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB89_6
; %bb.5:                                ;   in Loop: Header=BB89_4 Depth=1
	dec	__rc9
.LBB89_6:                               ;   in Loop: Header=BB89_4 Depth=1
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
	bne	.LBB89_8
; %bb.7:                                ;   in Loop: Header=BB89_4 Depth=1
	dec	__rc11
.LBB89_8:                               ;   in Loop: Header=BB89_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB89_10
; %bb.9:                                ;   in Loop: Header=BB89_4 Depth=1
	dex
.LBB89_10:                              ;   in Loop: Header=BB89_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB89_4
; %bb.11:                               ;   in Loop: Header=BB89_4 Depth=1
	tya
	bne	.LBB89_4
.LBB89_12:
	rts
.LBB89_13:
	cpx	__rc3
	bcs	.LBB89_14
; %bb.19:
	jmp	.LBB89_2
.LBB89_14:
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
.Lfunc_end89:
	.size	memmove, .Lfunc_end89-memmove
                                        ; -- End function
	.type	.L.str,@object                  ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"The function keys shown in the bottom line are "
	.size	.L.str, 48

	.type	.L.str.1,@object                ; @.str.1
.L.str.1:
	.asciz	"meant to be used with "
	.size	.L.str.1, 23

	.type	.L.str.2,@object                ; @.str.2
.L.str.2:
	.asciz	"and without [Shift] and [Mega] after the messagebox is dismissed:"
	.size	.L.str.2, 66

	.type	.L.str.3,@object                ; @.str.3
.L.str.3:
	.asciz	"is currently beta and may destroy data structures on"
	.size	.L.str.3, 53

	.type	.L.str.4,@object                ; @.str.4
.L.str.4:
	.asciz	".d81 and real disks! Please work on backed up media."
	.size	.L.str.4, 53

	.type	.L.str.5,@object                ; @.str.5
.L.str.5:
	.asciz	"Press RETURN to continue, STOP to halt."
	.size	.L.str.5, 40

	.type	.L.str.6,@object                ; @.str.6
.L.str.6:
	.asciz	"Have fun with your MEGA65!"
	.size	.L.str.6, 27

	.type	readdir_dirent,@object          ; @readdir_dirent
	.section	.rodata.readdir_dirent,"a",@progbits
	.globl	readdir_dirent
readdir_dirent:
	.short	6656
	.size	readdir_dirent, 2

	.type	fnamehi,@object                 ; @fnamehi
	.section	.bss.fnamehi,"aw",@nobits
fnamehi:
	.byte	0                               ; 0x0
	.size	fnamehi, 1

	.type	BAMsector,@object               ; @BAMsector
	.section	.rodata.cst4,"aM",@progbits,4
BAMsector:
	.short	5632
	.short	5888
	.size	BAMsector, 4

	.type	.L.str.4.14,@object             ; @.str.4.14
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4.14:
	.asciz	"ReadSector. Track="
	.size	.L.str.4.14, 19

	.type	.L.str.5.15,@object             ; @.str.5.15
.L.str.5.15:
	.asciz	" Sector="
	.size	.L.str.5.15, 9

	.type	.L.str.6.16,@object             ; @.str.6.16
.L.str.6.16:
	.asciz	" $d082U="
	.size	.L.str.6.16, 9

	.type	.L.str.7.17,@object             ; @.str.7.17
.L.str.7.17:
	.asciz	"WriteSector. Track="
	.size	.L.str.7.17, 20

	.type	.L.str.14,@object               ; @.str.14
.L.str.14:
	.asciz	"Reading file,"
	.size	.L.str.14, 14

	.type	.L.str.15,@object               ; @.str.15
.L.str.15:
	.asciz	"number of sectors too big."
	.size	.L.str.15, 27

	.type	.L__const.findnextBAMtracksector.strategy,@object ; @__const.findnextBAMtracksector.strategy
	.section	.rodata..L__const.findnextBAMtracksector.strategy,"a",@progbits
.L__const.findnextBAMtracksector.strategy:
	.ascii	"&)(*%+$,#-\".!/ 0\0371\0362\0353\0344\0335\0326\0317\0308\0279\026:\025;\024<\023=\022>\021?\020@\017A\016B\rC\fD\013E\nF\tG\bH\007I\006J\005K\004L\003M\002N\001O\000'"
	.size	.L__const.findnextBAMtracksector.strategy, 80

	.type	.L.str.16,@object               ; @.str.16
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.16:
	.asciz	"Writing file,"
	.size	.L.str.16, 14

	.type	.L.str.17,@object               ; @.str.17
.L.str.17:
	.asciz	"number of sectors too big"
	.size	.L.str.17, 26

	.type	.L.str.46,@object               ; @.str.46
.L.str.46:
	.asciz	" Midnight Mega "
	.size	.L.str.46, 16

	.type	.L.str.1.47,@object             ; @.str.1.47
.L.str.1.47:
	.asciz	" The MEGA65 file commander "
	.size	.L.str.1.47, 28

	.type	.L.str.2.48,@object             ; @.str.2.48
.L.str.2.48:
	.asciz	"   OK   "
	.size	.L.str.2.48, 9

	.type	.L.str.3.49,@object             ; @.str.3.49
.L.str.3.49:
	.asciz	" Cancel "
	.size	.L.str.3.49, 9

	.type	.L.str.4.50,@object             ; @.str.4.50
.L.str.4.50:
	.asciz	"v0.4.1-beta"
	.size	.L.str.4.50, 12

	.type	.L.str.5.51,@object             ; @.str.5.51
.L.str.5.51:
	.asciz	"github.com/nobruinfo"
	.size	.L.str.5.51, 21

	.type	.L.str.6.52,@object             ; @.str.6.52
.L.str.6.52:
	.asciz	"val="
	.size	.L.str.6.52, 5

	.type	.L__const.progress.rc,@object   ; @__const.progress.rc
	.section	.rodata.cst4,"aM",@progbits,4
.L__const.progress.rc:
	.byte	12                              ; 0xc
	.byte	6                               ; 0x6
	.byte	68                              ; 0x44
	.byte	8                               ; 0x8
	.size	.L__const.progress.rc, 4

	.type	.L.str.8,@object                ; @.str.8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.8:
	.asciz	"        "
	.size	.L.str.8, 9

	.type	.Lswitch.table.asciitoscreencode,@object ; @switch.table.asciitoscreencode
	.section	.zp.rodata..Lswitch.table.asciitoscreencode,"a",@progbits
.Lswitch.table.asciitoscreencode:
	.ascii	"\033i\035dd"
	.size	.Lswitch.table.asciitoscreencode, 5

	.type	midnight,@object                ; @midnight
	.section	.rodata.cst4,"aM",@progbits,4
midnight:
	.short	7424
	.short	7680
	.size	midnight, 4

	.type	s,@object                       ; @s
	.section	.zp.bss.s,"aw",@nobits
s:
	.zero	40
	.size	s, 40

	.type	.L.str.60,@object               ; @.str.60
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.60:
	.asciz	" 1"
	.size	.L.str.60, 3

	.type	.L.str.1.61,@object             ; @.str.1.61
.L.str.1.61:
	.asciz	"Help  "
	.size	.L.str.1.61, 7

	.type	.L.str.2.62,@object             ; @.str.2.62
.L.str.2.62:
	.asciz	" 2"
	.size	.L.str.2.62, 3

	.type	.L.str.3.63,@object             ; @.str.3.63
.L.str.3.63:
	.asciz	"Mount "
	.size	.L.str.3.63, 7

	.type	.L.str.4.64,@object             ; @.str.4.64
.L.str.4.64:
	.asciz	" 3"
	.size	.L.str.4.64, 3

	.type	.L.str.5.65,@object             ; @.str.5.65
.L.str.5.65:
	.asciz	"View  "
	.size	.L.str.5.65, 7

	.type	.L.str.6.66,@object             ; @.str.6.66
.L.str.6.66:
	.asciz	" 4"
	.size	.L.str.6.66, 3

	.type	.L.str.7.67,@object             ; @.str.7.67
.L.str.7.67:
	.asciz	"Edit  "
	.size	.L.str.7.67, 7

	.type	.L.str.8.68,@object             ; @.str.8.68
.L.str.8.68:
	.asciz	" 5"
	.size	.L.str.8.68, 3

	.type	.L.str.9,@object                ; @.str.9
.L.str.9:
	.asciz	"Copy  "
	.size	.L.str.9, 7

	.type	.L.str.10.69,@object            ; @.str.10.69
.L.str.10.69:
	.asciz	" 6"
	.size	.L.str.10.69, 3

	.type	.L.str.11.70,@object            ; @.str.11.70
.L.str.11.70:
	.asciz	"RenMov"
	.size	.L.str.11.70, 7

	.type	.L.str.12.71,@object            ; @.str.12.71
.L.str.12.71:
	.asciz	" 7"
	.size	.L.str.12.71, 3

	.type	.L.str.13.72,@object            ; @.str.13.72
.L.str.13.72:
	.asciz	"Mkdir "
	.size	.L.str.13.72, 7

	.type	.L.str.14.73,@object            ; @.str.14.73
.L.str.14.73:
	.asciz	" 8"
	.size	.L.str.14.73, 3

	.type	.L.str.15.74,@object            ; @.str.15.74
.L.str.15.74:
	.asciz	"Delete"
	.size	.L.str.15.74, 7

	.type	.L.str.16.75,@object            ; @.str.16.75
.L.str.16.75:
	.asciz	" 9"
	.size	.L.str.16.75, 3

	.type	.L.str.17.76,@object            ; @.str.17.76
.L.str.17.76:
	.asciz	"Menu  "
	.size	.L.str.17.76, 7

	.type	.L.str.18.77,@object            ; @.str.18.77
.L.str.18.77:
	.asciz	" 10"
	.size	.L.str.18.77, 4

	.type	.L.str.19.78,@object            ; @.str.19.78
.L.str.19.78:
	.asciz	"Quit "
	.size	.L.str.19.78, 6

	.type	.L.str.20,@object               ; @.str.20
.L.str.20:
	.asciz	"      "
	.size	.L.str.20, 7

	.type	.L.str.21,@object               ; @.str.21
.L.str.21:
	.asciz	"DskCpy"
	.size	.L.str.21, 7

	.type	.L.str.22,@object               ; @.str.22
.L.str.22:
	.asciz	"Format"
	.size	.L.str.22, 7

	.type	.L.str.23,@object               ; @.str.23
.L.str.23:
	.asciz	"     "
	.size	.L.str.23, 6

	.type	.L.str.24,@object               ; @.str.24
.L.str.24:
	.asciz	"Quit  "
	.size	.L.str.24, 7

	.type	diskname,@object                ; @diskname
	.section	.bss.diskname,"aw",@nobits
diskname:
	.zero	34
	.size	diskname, 34

	.type	.L.str.25,@object               ; @.str.25
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.25:
	.asciz	"storage card"
	.size	.L.str.25, 13

	.type	.L.str.26,@object               ; @.str.26
.L.str.26:
	.asciz	"already mounted"
	.size	.L.str.26, 16

	.type	.L.str.27,@object               ; @.str.27
.L.str.27:
	.asciz	"Initialising..."
	.size	.L.str.27, 16

	.type	.L.str.28,@object               ; @.str.28
.L.str.28:
	.asciz	"reading disk drives"
	.size	.L.str.28, 20

	.type	.L.str.29,@object               ; @.str.29
.L.str.29:
	.asciz	" "
	.size	.L.str.29, 2

	.type	.L.str.30,@object               ; @.str.30
.L.str.30:
	.asciz	" drv:"
	.size	.L.str.30, 6

	.type	.L.str.31,@object               ; @.str.31
.L.str.31:
	.asciz	" blocks free "
	.size	.L.str.31, 14

	.type	.L.str.32,@object               ; @.str.32
.L.str.32:
	.asciz	"Copying/deleting storage files/folders"
	.size	.L.str.32, 39

	.type	.L.str.33,@object               ; @.str.33
.L.str.33:
	.asciz	"is not supported."
	.size	.L.str.33, 18

	.type	.L.str.34,@object               ; @.str.34
.L.str.34:
	.asciz	"File copy,"
	.size	.L.str.34, 11

	.type	.L.str.35,@object               ; @.str.35
.L.str.35:
	.asciz	"destination disk space insufficient"
	.size	.L.str.35, 36

	.type	.L.str.36,@object               ; @.str.36
.L.str.36:
	.asciz	"from right to left"
	.size	.L.str.36, 19

	.type	.L.str.37,@object               ; @.str.37
.L.str.37:
	.asciz	"from left to right"
	.size	.L.str.37, 19

	.type	.L.str.38,@object               ; @.str.38
.L.str.38:
	.asciz	"Reading..."
	.size	.L.str.38, 11

	.type	.L.str.39,@object               ; @.str.39
.L.str.39:
	.asciz	"source file"
	.size	.L.str.39, 12

	.type	.L.str.40,@object               ; @.str.40
.L.str.40:
	.asciz	"BAM"
	.size	.L.str.40, 4

	.type	.L.str.41,@object               ; @.str.41
.L.str.41:
	.asciz	"Writing..."
	.size	.L.str.41, 11

	.type	.L.str.42,@object               ; @.str.42
.L.str.42:
	.asciz	"destination file"
	.size	.L.str.42, 17

	.type	.L.str.43,@object               ; @.str.43
.L.str.43:
	.asciz	"directory"
	.size	.L.str.43, 10

	.type	.L.str.44,@object               ; @.str.44
.L.str.44:
	.asciz	"File delete,"
	.size	.L.str.44, 13

	.type	.L.str.45,@object               ; @.str.45
.L.str.45:
	.asciz	"from right side"
	.size	.L.str.45, 16

	.type	.L.str.46.81,@object            ; @.str.46.81
.L.str.46.81:
	.asciz	"from left side"
	.size	.L.str.46.81, 15

	.type	.L.str.47,@object               ; @.str.47
.L.str.47:
	.asciz	"removing BAM entries"
	.size	.L.str.47, 21

	.type	.L.str.48,@object               ; @.str.48
.L.str.48:
	.asciz	"updating BAM"
	.size	.L.str.48, 13

	.type	.L.str.49,@object               ; @.str.49
.L.str.49:
	.asciz	"Copying full storage cards"
	.size	.L.str.49, 27

	.type	.L.str.50,@object               ; @.str.50
.L.str.50:
	.asciz	"Disk copy,"
	.size	.L.str.50, 11

	.type	.L.str.51,@object               ; @.str.51
.L.str.51:
	.asciz	"destination disk will be OVERWRITTEN"
	.size	.L.str.51, 37

	.type	.L.str.52,@object               ; @.str.52
.L.str.52:
	.asciz	"Storage card parent directory,"
	.size	.L.str.52, 31

	.type	.L.str.53,@object               ; @.str.53
.L.str.53:
	.asciz	"open failed for"
	.size	.L.str.53, 16

	.type	.L.str.54,@object               ; @.str.54
.L.str.54:
	.asciz	"Storage card change directory,"
	.size	.L.str.54, 31

	.type	.L.str.55,@object               ; @.str.55
.L.str.55:
	.asciz	"Storage card mounting,"
	.size	.L.str.55, 23

	.type	.L.str.56,@object               ; @.str.56
.L.str.56:
	.asciz	"mount failed for"
	.size	.L.str.56, 17

	.type	.L.str.57,@object               ; @.str.57
.L.str.57:
	.asciz	"This file type/directory"
	.size	.L.str.57, 25

	.type	.L.str.58,@object               ; @.str.58
.L.str.58:
	.asciz	"is not yet implemented."
	.size	.L.str.58, 24

	.type	.L.str.59,@object               ; @.str.59
.L.str.59:
	.asciz	"Some function keys,"
	.size	.L.str.59, 20

	.type	.L.str.60.82,@object            ; @.str.60.82
.L.str.60.82:
	.asciz	"are not yet implemented."
	.size	.L.str.60.82, 25

	.type	.L.str.61,@object               ; @.str.61
.L.str.61:
	.asciz	"val=$"
	.size	.L.str.61, 6

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
	.zero	41
	.size	.Lzp_stack, 41

	.type	.Lstatic_stack,@object          ; @static_stack
	.section	.noinit..Lstatic_stack,"aw",@nobits
.Lstatic_stack:
	.zero	22
	.size	.Lstatic_stack, 22

.set .Lclrhome_zp_stk, .Lzp_stack
	.size	.Lclrhome_zp_stk, 2
.set .L__udivmodhi4_zp_stk, .Lzp_stack+40
	.size	.L__udivmodhi4_zp_stk, 1
.set .Lcputsxy_zp_stk, .Lzp_stack+31
	.size	.Lcputsxy_zp_stk, 9
.set .Lmcputsxy_zp_stk, .Lzp_stack+5
	.size	.Lmcputsxy_zp_stk, 2
.set .Lshortcutprint_zp_stk, .Lzp_stack
	.size	.Lshortcutprint_zp_stk, 4
.set .Lfillrect_zp_stk, .Lzp_stack+8
	.size	.Lfillrect_zp_stk, 7
.set .Lcputcxy_zp_stk, .Lzp_stack+8
	.size	.Lcputcxy_zp_stk, 6
.set .Lmcbox_zp_stk, .Lzp_stack
	.size	.Lmcbox_zp_stk, 8
.set .Lcsputdec_zp_stk, .Lzp_stack+9
	.size	.Lcsputdec_zp_stk, 22
.set .Lmprintf_zp_stk, .Lzp_stack+5
	.size	.Lmprintf_zp_stk, 4
.set .Lprogress_zp_stk, .Lzp_stack
	.size	.Lprogress_zp_stk, 5
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
.set .Lcputln_zp_stk, .Lzp_stack+4
	.size	.Lcputln_zp_stk, 10
.set .Lgetdirententry_zp_stk, .Lzp_stack
	.size	.Lgetdirententry_zp_stk, 10
.set .LBAMSectorUpdate_zp_stk, .Lzp_stack+7
	.size	.LBAMSectorUpdate_zp_stk, 4
.set .LfindnextBAMtracksector_zp_stk, .Lzp_stack
	.size	.LfindnextBAMtracksector_zp_stk, 7
.set .LPutOneSector_zp_stk, .Lzp_stack
	.size	.LPutOneSector_zp_stk, 4
.set .Ltracksectorstring_zp_stk, .Lzp_stack
	.size	.Ltracksectorstring_zp_stk, 3
.set .Lmcbox_sstk, .Lstatic_stack+14
	.size	.Lmcbox_sstk, 4
.set .Lmessagebox_sstk, .Lstatic_stack+7
	.size	.Lmessagebox_sstk, 7
.set .Lcputhex_sstk, .Lstatic_stack+12
	.size	.Lcputhex_sstk, 10
.set .Lmhprintf_sstk, .Lstatic_stack+8
	.size	.Lmhprintf_sstk, 4
.set .LReadSector_sstk, .Lstatic_stack+7
	.size	.LReadSector_sstk, 1
.set .Lreadblockchain_sstk, .Lstatic_stack
	.size	.Lreadblockchain_sstk, 7
.set .LfindnextBAMtracksector_sstk, .Lstatic_stack
	.size	.LfindnextBAMtracksector_sstk, 2
.set .LPutBAM_sstk, .Lstatic_stack
	.size	.LPutBAM_sstk, 2
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.ident	"clang version 18.0.0 (https://github.com/llvm-mos/llvm-mos e0380cf4b8a252e7032622846436ede2f1bf9165)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym escNOP
	.addrsig_sym readdir_dirent
	.addrsig_sym fnamehi
	.addrsig_sym s
	.addrsig_sym diskname
	.addrsig_sym dmalist
	.addrsig_sym .Lzp_stack
	.addrsig_sym .Lstatic_stack
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

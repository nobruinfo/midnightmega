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
	;APP
	php
	pha
	phx
	phy
	phz
	;NO_APP
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
	adc	#223
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
	stx	mos8(g_curScreenH)
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
	stz	53352
	ldx	#208
	stx	53353
	ldx	#2
	stx	53354
	lda	53272
	eor	#2
	sta	53272
	bra	.LBB0_14
.LBB0_13:                               ;   in Loop: Header=BB0_14 Depth=1
	stz	54800
.LBB0_14:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB0_13
; %bb.15:
	lda	#191
	and	53297
	sta	53297
	lda	#191
	and	53332
	sta	53332
	ldx	#mos16lo(.L.str)
	stx	__rc2
	ldx	#mos16hi(.L.str)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
                                        ; kill: def $rs1 killed $rs1
	pha
	lda	__rc2
	ldy	#25
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
	pla
	jsr	cputsxy
	jsr	cputln
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
	stx	mos8(g_curScreenH)
	jsr	clrhome
	ldx	#mos16lo(.L.str.1)
	stx	__rc2
	ldx	#mos16hi(.L.str.1)
	stx	__rc3
	ldx	#mos16lo(.L.str.2)
	stx	__rc4
	ldx	#mos16hi(.L.str.2)
	stx	__rc5
	ldx	#mos16lo(.L.str.3)
	stx	__rc6
	ldx	#mos16hi(.L.str.3)
	stx	__rc7
	jsr	messagebox
	ldx	#mos16lo(.L.str.4)
	stx	__rc2
	ldx	#mos16hi(.L.str.4)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	#2
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	ldx	#23
	jsr	cputsxy
	ldx	#mos16lo(.L.str.5)
	stx	__rc2
	ldx	#mos16hi(.L.str.5)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	#58
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
                                        ; kill: def $rs1 killed $rs1
	pha
	lda	__rc2
	ldy	#25
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
	pla
	ldx	#23
	jsr	cputsxy
.LBB0_16:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB0_16
; %bb.17:
	stz	54800
	cpx	#13
	beq	.LBB0_18
; %bb.265:
	jmp	.LBB0_215
.LBB0_18:
	stz	7424
	ldx	#1
	stx	7680
	ldx	#3
	stx	__rc2
	ldx	#29
	stx	__rc3
	ldx	#mos16lo(.L.str.26)
	stx	__rc4
	ldx	#mos16hi(.L.str.26)
	stx	__rc5
	ldx	#0
	lda	#16
	jsr	memcpy
	ldx	#3
	stx	__rc2
	ldx	#30
	stx	__rc3
	ldx	#mos16lo(.L.str.26)
	stx	__rc4
	ldx	#mos16hi(.L.str.26)
	stx	__rc5
	ldx	#0
	lda	#16
	jsr	memcpy
	stz	7425
	stz	7681
	stz	__rc2
	lda	#0
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_19:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_79 Depth 2
                                        ;       Child Loop BB0_23 Depth 3
                                        ;       Child Loop BB0_29 Depth 3
                                        ;       Child Loop BB0_34 Depth 3
                                        ;         Child Loop BB0_47 Depth 4
                                        ;     Child Loop BB0_83 Depth 2
                                        ;     Child Loop BB0_126 Depth 2
                                        ;     Child Loop BB0_212 Depth 2
                                        ;     Child Loop BB0_140 Depth 2
                                        ;     Child Loop BB0_146 Depth 2
                                        ;     Child Loop BB0_155 Depth 2
                                        ;     Child Loop BB0_113 Depth 2
                                        ;       Child Loop BB0_102 Depth 3
                                        ;       Child Loop BB0_107 Depth 3
                                        ;     Child Loop BB0_196 Depth 2
                                        ;       Child Loop BB0_200 Depth 3
                                        ;       Child Loop BB0_179 Depth 3
                                        ;       Child Loop BB0_194 Depth 3
                                        ;     Child Loop BB0_87 Depth 2
	bit	__set_v
	lda	#0
	stz	__rc21
; %bb.219:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_79
.LBB0_20:                               ;   in Loop: Header=BB0_23 Depth=3
	clc
	adc	#216
	ldy	__rc26
	sty	__rc28
	ldy	__rc27
	sty	__rc29
.LBB0_21:                               ;   in Loop: Header=BB0_23 Depth=3
	stx	__rc24
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	stx	__rc2
	ldx	__rc24
	clc
	adc	__rc28
	tay
	lda	__rc2
	adc	__rc29
	sty	__rc2
	sta	__rc3
	clc
	ldy	#16
	lda	__rc20
	adc	(__rc2),y
	sta	__rc20
	lda	__rc25
	adc	#0
	sta	__rc25
.LBB0_22:                               ;   in Loop: Header=BB0_23 Depth=3
	inx
	cpx	#80
	beq	.LBB0_25
.LBB0_23:                               ;   Parent Loop BB0_19 Depth=1
                                        ;     Parent Loop BB0_79 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	txa
	cpx	#40
	bcs	.LBB0_20
; %bb.24:                               ;   in Loop: Header=BB0_23 Depth=3
	cpx	#39
	bne	.LBB0_21
	bra	.LBB0_22
.LBB0_25:                               ;   in Loop: Header=BB0_79 Depth=2
	ldy	#68
	lda	__rc20
	sta	(__rc22),y
	clc
	lda	__rc31
	adc	#68
	tay
	lda	__rc30
	adc	#0
	sty	__rc24
	sty	__rc2
	sta	__rc26
	sta	__rc3
	ldy	#1
	lda	__rc25
	sta	(__rc2),y
	lda	(__rc22)
	ldx	__rc21
	jsr	getdirent
	ldy	#2
	sta	(__rc22),y
	dey
	cmp	(__rc22),y
	bcs	.LBB0_27
; %bb.26:                               ;   in Loop: Header=BB0_79 Depth=2
	sta	(__rc22),y
.LBB0_27:                               ;   in Loop: Header=BB0_79 Depth=2
	ldx	#40
	lda	__rc21
	jsr	__mulqi3
	sta	__rc25
	clc
	adc	#39
	stz	__rc20
	sta	__rc2
	ldx	#23
	stx	__rc3
	stz	__rc4
	ldx	#0
	lda	__rc25
	jsr	mcbox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	__rc25
	stx	__rc27
	lda	__rc25
	ora	#2
	sta	__rc25
	ldx	#mos16lo(.L.str.27)
	stx	__rc2
	ldx	#mos16hi(.L.str.27)
	stx	__rc3
	jsr	asciitoscreencode_s
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	#0
	lda	__rc25
	jsr	cputsxy
	lda	(__rc22)
	stz	mos8(BAMsector.0)
	ldx	#22
	stx	mos8(BAMsector.0+1)
	stz	mos8(BAMsector.1)
	inx
	stx	mos8(BAMsector.1+1)
	stz	mos8(worksector.0)
	inx
	stx	mos8(worksector.0+1)
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	stz	53376
	ldx	mos8(BAMsector.0)
	stx	__rc2
	ldx	mos8(BAMsector.0+1)
	stx	__rc3
	stz	__rc4
	ldx	#40
	jsr	GetOneSector
	lda	5636
	ldx	#0
	cmp	#160
	beq	.LBB0_31
; %bb.28:                               ;   in Loop: Header=BB0_79 Depth=2
	ldy	#0
	ldx	mos8(BAMsector.0)
	stx	__rc4
	ldx	#0
	sta	__rc2
	lda	mos8(BAMsector.0+1)
	sta	__rc6
	lda	__rc2
.LBB0_29:                               ;   Parent Loop BB0_19 Depth=1
                                        ;     Parent Loop BB0_79 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	sta	dosfilename,y
	inx
	sty	__rc2
	lda	__rc4
	clc
	adc	__rc2
	sta	__rc2
	lda	__rc6
	adc	#0
	sta	__rc3
	sty	__rc5
	ldy	#5
	lda	(__rc2),y
	cmp	#160
	beq	.LBB0_31
; %bb.30:                               ;   in Loop: Header=BB0_29 Depth=3
	ldy	__rc5
	cpy	#15
	phx
	ply
	bcc	.LBB0_29
.LBB0_31:                               ;   in Loop: Header=BB0_79 Depth=2
	stz	dosfilename,x
	ldx	#mos16lo(dosfilename)
	stx	__rc2
	ldx	#mos16hi(dosfilename)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
                                        ; kill: def $rs1 killed $rs1
	pha
	lda	__rc2
	ldy	#25
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
	pla
	jsr	cputsxy
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	ldx	mos8(g_curX)
	inx
	stx	__rc28
	ldx	#mos16lo(.L.str.27)
	stx	__rc2
	ldx	#mos16hi(.L.str.27)
	stx	__rc3
                                        ; kill: def $rs1 killed $rs1
	lda	__rc2
	ldy	#23
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
	jsr	asciitoscreencode_s
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	#0
	lda	__rc28
	jsr	cputsxy
	clc
	lda	__rc31
	adc	#3
	sta	__rc2
	lda	__rc30
	adc	#0
	sta	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	ldx	#mos16lo(.L.str.28)
	stx	__rc2
	ldx	#mos16hi(.L.str.28)
	stx	__rc3
	jsr	asciitoscreencode_s
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	#23
	lda	__rc25
	jsr	cputsxy
	lda	(__rc22)
	stz	__rc2
	stz	__rc3
	stz	__rc4
	ldx	#0
	jsr	csputdec
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	lda	__rc27
	clc
	adc	#12
	sta	__rc25
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	jsr	asciitoscreencode_s
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	#23
	lda	__rc25
	jsr	cputsxy
	ldx	__rc24
	stx	__rc2
	ldx	__rc26
	stx	__rc3
	ldy	#68
	lda	(__rc22),y
	sta	__rc5
	ldy	#1
	lda	(__rc2),y
	stz	__rc2
	stz	__rc3
	stz	__rc4
	tax
	lda	__rc5
	jsr	csputdec
	ldx	#mos16lo(.L.str.29)
	stx	__rc2
	ldx	#mos16hi(.L.str.29)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
                                        ; kill: def $rs1 killed $rs1
	pha
	lda	__rc2
	ldy	#25
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
	pla
	jsr	cputsxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldy	#1
	lda	(__rc22),y
	sta	__rc25
	cmp	#21
	stz	__rc26
	bcc	.LBB0_33
; %bb.32:                               ;   in Loop: Header=BB0_79 Depth=2
	clc
	adc	#235
	sta	__rc20
	lda	#0
	adc	#255
	sta	__rc26
.LBB0_33:                               ;   in Loop: Header=BB0_79 Depth=2
	lda	__rc27
	ora	#1
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#0
	stz	__rc27
.LBB0_34:                               ;   Parent Loop BB0_19 Depth=1
                                        ;     Parent Loop BB0_79 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_47 Depth 4
	stx	__rc31
	txa
	clc
	adc	__rc20
	ldx	#1
	bcs	.LBB0_36
; %bb.35:                               ;   in Loop: Header=BB0_34 Depth=3
	ldx	#0
.LBB0_36:                               ;   in Loop: Header=BB0_34 Depth=3
	stx	__rc24
	sta	__rc30
	tax
	lda	__rc21
	jsr	getdirententry
	ldx	__rc2
	stx	__rc22
	ldx	__rc3
	stx	__rc23
	ldx	__rc23
	ldy	#0
	sty	__rc2
	ldy	#0
	sty	__rc3
	cpx	__rc3
	bne	.LBB0_38
; %bb.37:                               ;   in Loop: Header=BB0_34 Depth=3
	ldx	__rc22
	cpx	__rc2
	bne	.LBB0_38
; %bb.267:                              ;   in Loop: Header=BB0_79 Depth=2
	jmp	.LBB0_78
.LBB0_38:                               ;   in Loop: Header=BB0_34 Depth=3
	lda	__rc27
	ldx	__rc24
	cpx	#1
	adc	__rc26
	sta	__rc24
	bne	.LBB0_41
; %bb.39:                               ;   in Loop: Header=BB0_34 Depth=3
	ldx	__rc30
	cpx	__rc25
	bne	.LBB0_41
; %bb.40:                               ;   in Loop: Header=BB0_34 Depth=3
	lda	#0
	bra	.LBB0_42
.LBB0_41:                               ;   in Loop: Header=BB0_34 Depth=3
	lda	#1
.LBB0_42:                               ;   in Loop: Header=BB0_34 Depth=3
	ldx	#32
	and	#1
	bne	.LBB0_44
; %bb.43:                               ;   in Loop: Header=BB0_34 Depth=3
	ldx	#62
.LBB0_44:                               ;   in Loop: Header=BB0_34 Depth=3
	stx	mos8(s)
	ldx	#32
	stx	mos8(s+1)
	ldy	#5
	lda	(__rc22),y
	cmp	#160
	bne	.LBB0_46
; %bb.45:                               ;   in Loop: Header=BB0_34 Depth=3
	stz	__rc28
	lda	#2
	bra	.LBB0_52
.LBB0_46:                               ;   in Loop: Header=BB0_34 Depth=3
	stz	__rc28
.LBB0_47:                               ;   Parent Loop BB0_19 Depth=1
                                        ;     Parent Loop BB0_79 Depth=2
                                        ;       Parent Loop BB0_34 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldy	__rc28
	ldx	__rc28
	sta	mos8(s+2),x
	lda	__rc28
	clc
	adc	__rc22
	sta	__rc2
	lda	__rc23
	adc	#0
	sta	__rc3
	inc	__rc28
	sty	__rc4
	cpy	#15
	ldx	#1
	bcs	.LBB0_49
; %bb.48:                               ;   in Loop: Header=BB0_47 Depth=4
	ldx	#0
.LBB0_49:                               ;   in Loop: Header=BB0_47 Depth=4
	stx	__rc5
	ldy	#6
	lda	(__rc2),y
	cmp	#160
	beq	.LBB0_51
; %bb.50:                               ;   in Loop: Header=BB0_47 Depth=4
	ldx	__rc5
	beq	.LBB0_47
.LBB0_51:                               ;   in Loop: Header=BB0_34 Depth=3
	clc
	lda	__rc4
	adc	#3
	ldx	__rc5
	bne	.LBB0_55
.LBB0_52:                               ;   in Loop: Header=BB0_34 Depth=3
	sta	__rc2
	sta	__rc29
	lda	#mos8(s)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos8(0)
	adc	#0
	sta	__rc3
	lda	#15
	sec
	sbc	__rc28
	stz	__rc4
	inc
	bne	.LBB0_54
; %bb.53:                               ;   in Loop: Header=BB0_34 Depth=3
	inc	__rc4
.LBB0_54:                               ;   in Loop: Header=BB0_34 Depth=3
	tax
	lda	#32
	jsr	__memset
	lda	__rc29
	clc
	adc	#16
	sec
	sbc	__rc28
.LBB0_55:                               ;   in Loop: Header=BB0_34 Depth=3
	tax
	inx
	tay
	sta	__rc2
	lda	#32
	sta	mos8(s),y
	lda	__rc2
	clc
	adc	#2
	tay
	lda	#93
	sta	mos8(s),x
	ldx	__rc2
	stx	__rc3
	lda	__rc2
	clc
	adc	#3
	sta	__rc2
	lda	#32
	sta	mos8(s),y
	lda	#15
	ldy	#2
	and	(__rc22),y
	sta	__rc4
	ldx	#0
	tay
	dec
	cpy	#0
	bne	.LBB0_57
; %bb.56:                               ;   in Loop: Header=BB0_34 Depth=3
	dex
.LBB0_57:                               ;   in Loop: Header=BB0_34 Depth=3
	cpx	#0
	bne	.LBB0_59
; %bb.58:                               ;   in Loop: Header=BB0_34 Depth=3
	cmp	#5
	bra	.LBB0_60
.LBB0_59:                               ;   in Loop: Header=BB0_34 Depth=3
	cpx	#0
.LBB0_60:                               ;   in Loop: Header=BB0_34 Depth=3
	lda	#68
	ldx	#69
	pha
	txa
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#76
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldx	__rc2
	bcs	.LBB0_62
; %bb.61:                               ;   in Loop: Header=BB0_34 Depth=3
	ldy	__rc4
	lda	.Lswitch.table.gettype-1,y
	ldx	.Lswitch.table.gettype.15-1,y
	pha
	txa
	phy
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	ldx	.Lswitch.table.gettype.16-1,y
	txa
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldx	__rc2
.LBB0_62:                               ;   in Loop: Header=BB0_34 Depth=3
	sta	mos8(s),x
	clc
	lda	__rc3
	adc	#4
	tax
	clc
	lda	__rc3
	adc	#5
	tay
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	mos8(s),x
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	mos8(s),y
	clc
	lda	__rc3
	adc	#6
	tax
	clc
	lda	__rc3
	adc	#7
	tay
	clc
	lda	__rc3
	adc	#8
	sta	__rc2
	lda	#32
	sta	mos8(s),x
	lda	#93
	sta	mos8(s),y
	clc
	lda	__rc3
	adc	#9
	tax
	ldy	__rc2
	lda	#32
	sta	mos8(s),y
	stz	mos8(s),x
	lda	mos8(g_curTextColor)
	ldx	__rc24
	bne	.LBB0_66
; %bb.63:                               ;   in Loop: Header=BB0_34 Depth=3
	ldx	__rc30
	cpx	__rc25
	bne	.LBB0_66
; %bb.64:                               ;   in Loop: Header=BB0_34 Depth=3
	pha
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	cpx	__rc21
	bne	.LBB0_66
; %bb.65:                               ;   in Loop: Header=BB0_34 Depth=3
	ora	#32
	bra	.LBB0_67
.LBB0_66:                               ;   in Loop: Header=BB0_34 Depth=3
	and	#223
.LBB0_67:                               ;   in Loop: Header=BB0_34 Depth=3
	ldx	__rc24
	bne	.LBB0_69
; %bb.68:                               ;   in Loop: Header=BB0_34 Depth=3
	ldx	#1
	ldy	__rc30
	cpy	__rc25
	beq	.LBB0_70
.LBB0_69:                               ;   in Loop: Header=BB0_34 Depth=3
	ldx	#0
.LBB0_70:                               ;   in Loop: Header=BB0_34 Depth=3
	ldy	#1
	stz	__rc2
	cpx	#0
	bne	.LBB0_72
; %bb.71:                               ;   in Loop: Header=BB0_34 Depth=3
	sty	__rc2
.LBB0_72:                               ;   in Loop: Header=BB0_34 Depth=3
	sta	mos8(g_curTextColor)
	lda	__rc2
	and	#1
	sta	__rc24
	ldx	__rc31
	stx	__rc28
	ldx	__rc31
	inx
	ldy	#mos8(s)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	cputsxy
	lda	__rc22
	clc
	adc	#30
	sta	__rc2
	lda	__rc23
	adc	#0
	sta	__rc3
	ldy	#1
	lda	(__rc2),y
	sta	__rc5
	ldy	#30
	lda	(__rc22),y
	stz	__rc2
	stz	__rc3
	ldx	#5
	stx	__rc4
	ldx	__rc5
	jsr	csputdec
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	ldy	#32
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	inc	__rc24
	dec	__rc24
	bne	.LBB0_74
; %bb.73:                               ;   in Loop: Header=BB0_34 Depth=3
	ldy	#60
.LBB0_74:                               ;   in Loop: Header=BB0_34 Depth=3
	sty	__rc2
	jsr	cputcxy
	inc	__rc28
	bne	.LBB0_76
; %bb.75:                               ;   in Loop: Header=BB0_34 Depth=3
	inc	__rc27
.LBB0_76:                               ;   in Loop: Header=BB0_34 Depth=3
	ldx	__rc28
	lda	__rc27
	beq	.LBB0_77
; %bb.269:                              ;   in Loop: Header=BB0_34 Depth=3
	jmp	.LBB0_34
.LBB0_77:                               ;   in Loop: Header=BB0_34 Depth=3
	cpx	#22
	beq	.LBB0_78
; %bb.271:                              ;   in Loop: Header=BB0_34 Depth=3
	jmp	.LBB0_34
.LBB0_78:                               ;   in Loop: Header=BB0_79 Depth=2
	lda	#223
	and	mos8(g_curTextColor)
	ldx	mos8(g_curTextColor)
	stx	__rc20
	sta	mos8(g_curTextColor)
	jsr	cputln
	clc
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#2
	clv
	ldx	#1
	stx	__rc21
	pha
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	pla
	ldx	__rc2
	bne	.LBB0_79
; %bb.273:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_82
.LBB0_79:                               ;   Parent Loop BB0_19 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_23 Depth 3
                                        ;       Child Loop BB0_29 Depth 3
                                        ;       Child Loop BB0_34 Depth 3
                                        ;         Child Loop BB0_47 Depth 4
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	tax
	ldy	midnight,x
	sty	__rc31
	sty	__rc22
	lda	midnight+1,x
	tax
	stx	__rc30
	stx	__rc23
	stz	mos8(BAMsector.0)
	ldx	#22
	stx	mos8(BAMsector.0+1)
	stz	mos8(BAMsector.1)
	inx
	stx	mos8(BAMsector.1+1)
	stz	mos8(worksector.0)
	inx
	stx	mos8(worksector.0+1)
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	lda	(__rc22)
	sta	__rc24
	stz	53376
	ldx	mos8(BAMsector.0)
	stx	__rc2
	ldx	mos8(BAMsector.0+1)
	stx	__rc3
	pha
	lda	#1
	bvs	.LBB0_81
; %bb.80:                               ;   in Loop: Header=BB0_79 Depth=2
	lda	#0
.LBB0_81:                               ;   in Loop: Header=BB0_79 Depth=2
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stz	__rc20
	ldx	#1
	stx	__rc4
	ldx	#40
	jsr	GetOneSector
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc2
	sty	__rc3
	ldx	5632
	ldy	5633
	sty	__rc4
	lda	__rc24
	jsr	GetOneSector
	ldx	mos8(BAMsector.0)
	ldy	mos8(BAMsector.0+1)
	stx	__rc28
	sty	__rc29
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc26
	sty	__rc27
	stz	__rc25
	ldx	#0
; %bb.221:                              ;   in Loop: Header=BB0_79 Depth=2
	jmp	.LBB0_23
.LBB0_82:                               ;   in Loop: Header=BB0_19 Depth=1
	lda	__rc20
	and	#208
	ora	#1
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.1.39)
	stx	__rc2
	ldx	#mos16hi(.L.str.1.39)
	stx	__rc3
	jsr	asciitoscreencode_s
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
                                        ; kill: def $rs1 killed $rs1
	lda	__rc2
	ldy	#25
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
	ldx	#24
	lda	#0
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#44
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.2.40)
	stx	__rc2
	ldx	#mos16hi(.L.str.2.40)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#1
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.3.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.3.41)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#35
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.4.42)
	stx	__rc2
	ldx	#mos16hi(.L.str.4.42)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#1
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.5.43)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.43)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#44
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.6.44)
	stx	__rc2
	ldx	#mos16hi(.L.str.6.44)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#1
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.7.45)
	stx	__rc2
	ldx	#mos16hi(.L.str.7.45)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#44
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.8.46)
	stx	__rc2
	ldx	#mos16hi(.L.str.8.46)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#1
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.9.47)
	stx	__rc2
	ldx	#mos16hi(.L.str.9.47)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#35
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.10.48)
	stx	__rc2
	ldx	#mos16hi(.L.str.10.48)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#1
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.11.49)
	stx	__rc2
	ldx	#mos16hi(.L.str.11.49)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#44
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.12.50)
	stx	__rc2
	ldx	#mos16hi(.L.str.12.50)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#1
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.13.51)
	stx	__rc2
	ldx	#mos16hi(.L.str.13.51)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#44
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.14.52)
	stx	__rc2
	ldx	#mos16hi(.L.str.14.52)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#1
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.15)
	stx	__rc2
	ldx	#mos16hi(.L.str.15)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#35
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.16)
	stx	__rc2
	ldx	#mos16hi(.L.str.16)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#1
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.17)
	stx	__rc2
	ldx	#mos16hi(.L.str.17)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#44
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.18)
	stx	__rc2
	ldx	#mos16hi(.L.str.18)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#1
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.19)
	stx	__rc2
	ldx	#mos16hi(.L.str.19)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#35
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.20)
	stx	__rc2
	ldx	#mos16hi(.L.str.20)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
                                        ; kill: def $rs1 killed $rs1
	pha
	lda	__rc2
	ldy	#25
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
	pla
	jsr	cputsxy
	lda	#208
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	stz	mos8(g_curX)
	stz	mos8(g_curY)
.LBB0_83:                               ;   Parent Loop BB0_19 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	54800
	beq	.LBB0_83
; %bb.84:                               ;   in Loop: Header=BB0_19 Depth=1
	sta	__rc21
	sec
	sbc	#241
	stz	54800
	cmp	#34
	bcc	.LBB0_85
; %bb.275:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_92
.LBB0_85:                               ;   in Loop: Header=BB0_19 Depth=1
	tax
	ldy	.LJTI0_0,x
	lda	.LJTI0_0+34,x
	tax
	sty	__rc2
	stx	__rc3
	jmp	(__rc2)
.LBB0_86:                               ;   in Loop: Header=BB0_19 Depth=1
	ldx	#mos16lo(.L.str.30)
	stx	__rc2
	ldx	#mos16hi(.L.str.30)
	stx	__rc3
	ldx	#mos16lo(.L.str.31)
	stx	__rc4
	ldx	#mos16hi(.L.str.31)
	stx	__rc5
	ldx	#mos16lo(.L.str.27)
	stx	__rc6
	ldx	#mos16hi(.L.str.27)
	stx	__rc7
	jsr	messagebox
.LBB0_87:                               ;   Parent Loop BB0_19 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_87
; %bb.88:                               ;   in Loop: Header=BB0_19 Depth=1
	stz	54800
; %bb.223:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_19
.LBB0_89:                               ;   in Loop: Header=BB0_19 Depth=1
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
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
	sta	__rc28
	ldy	#1
	lda	(__rc2),y
	sta	__rc29
	lda	(__rc28),y
	tax
	lda	__rc20
	jsr	getdirententry
	ldx	__rc2
	stx	__rc22
	ldx	__rc3
	stx	__rc23
	ldx	__rc21
	cpx	#245
	beq	.LBB0_90
; %bb.277:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_124
.LBB0_90:                               ;   in Loop: Header=BB0_19 Depth=1
	lda	(__rc28)
	sta	__rc5
	ldy	#3
	lda	(__rc22),y
	sta	__rc6
	iny
	lda	(__rc22),y
	sta	__rc7
	stz	__rc2
	ldx	#8
	stx	__rc3
	ldx	#199
	stx	__rc4
	ldx	#30
	lda	#0
	jsr	readblockchain
	lda	__rc20
	beq	.LBB0_91
; %bb.279:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_138
.LBB0_91:                               ;   in Loop: Header=BB0_19 Depth=1
                                        ; kill: def $rs11 killed $rs11
	lda	__rc22
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc23
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
                                        ; kill: def $rs14 killed $rs14
	lda	__rc28
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc29
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#1
; %bb.225:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_139
.LBB0_92:                               ;   in Loop: Header=BB0_19 Depth=1
	ldx	__rc21
	cpx	#145
	bne	.LBB0_95
; %bb.93:                               ;   in Loop: Header=BB0_19 Depth=1
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
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
	bne	.LBB0_94
; %bb.281:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_19
.LBB0_94:                               ;   in Loop: Header=BB0_19 Depth=1
	dec
	sta	(__rc2),y
; %bb.227:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_19
.LBB0_95:                               ;   in Loop: Header=BB0_19 Depth=1
	stz	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc21
	jsr	mprintf
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
; %bb.229:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_19
.LBB0_96:                               ;   in Loop: Header=BB0_19 Depth=1
	;APP
	ldx	#0
	lda	#4
	sta	54848
	clv
	bcc	errgetcurdrv0
	sta	__rc2
	jmp	donegetcurdrv0
errgetcurdrv0:
	lda	#255
	sta	__rc2
donegetcurdrv0:
	nop
	;NO_APP
	ldx	__rc2
	stz	__rc20
	cpx	#255
	bne	.LBB0_97
; %bb.283:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_175
.LBB0_97:                               ;   in Loop: Header=BB0_19 Depth=1
	;APP
	ldx	#0
	lda	#18
	sta	54848
	clv
	bcc	errhypopendir1
	sta	__rc2
	jmp	donehypopendir1
errhypopendir1:
	lda	#255
	sta	__rc2
donehypopendir1:
	nop

	;NO_APP
	lda	__rc2
	cmp	#132
	bne	.LBB0_98
; %bb.285:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_175
.LBB0_98:                               ;   in Loop: Header=BB0_19 Depth=1
	cmp	#135
	bne	.LBB0_99
; %bb.287:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_175
.LBB0_99:                               ;   in Loop: Header=BB0_19 Depth=1
	cmp	#255
	bne	.LBB0_100
; %bb.289:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_175
.LBB0_100:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	#0
	stz	__rc21
; %bb.231:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_113
.LBB0_101:                              ;   in Loop: Header=BB0_113 Depth=2
	ldy	#0
	ldx	#0
.LBB0_102:                              ;   Parent Loop BB0_19 Depth=1
                                        ;     Parent Loop BB0_113 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	6721,y
	cmp	#32
	beq	.LBB0_106
; %bb.103:                              ;   in Loop: Header=BB0_102 Depth=3
	cmp	#33
	bcc	.LBB0_105
; %bb.104:                              ;   in Loop: Header=BB0_102 Depth=3
	sta	7233,x
	inx
.LBB0_105:                              ;   in Loop: Header=BB0_102 Depth=3
	iny
	cpy	#8
	bne	.LBB0_102
.LBB0_106:                              ;   in Loop: Header=BB0_113 Depth=2
	ldy	#0
	lda	#46
	sta	7233,x
	inx
.LBB0_107:                              ;   Parent Loop BB0_19 Depth=1
                                        ;     Parent Loop BB0_113 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	6729,y
	cmp	#32
	beq	.LBB0_111
; %bb.108:                              ;   in Loop: Header=BB0_107 Depth=3
	cmp	#33
	bcc	.LBB0_110
; %bb.109:                              ;   in Loop: Header=BB0_107 Depth=3
	sta	7233,x
	inx
.LBB0_110:                              ;   in Loop: Header=BB0_107 Depth=3
	iny
	cpy	#3
	bne	.LBB0_107
.LBB0_111:                              ;   in Loop: Header=BB0_113 Depth=2
	stz	7233,x
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	ldy	__rc4
	sty	__rc22
	lda	__rc4
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
	inc	__rc21
.LBB0_112:                              ;   in Loop: Header=BB0_113 Depth=2
	lda	__rc22
	ldx	__rc22
	inx
	cmp	#17
	lda	__rc20
	bcc	.LBB0_113
; %bb.291:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_174
.LBB0_113:                              ;   Parent Loop BB0_19 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_102 Depth 3
                                        ;       Child Loop BB0_107 Depth 3
	stx	__rc4
	sta	__rc20
	tay
	;APP
	phx
	ldx	#0
	txa
hypreaddirloop2:
	sta	6656,x
	dex
	bne	hypreaddirloop2
	plx
	tya
	tax
	ldy	#mos16hi(6656)
	lda	#20
	sta	54848
	clv
	bcc	errhypreaddir2
	stx	__rc2
	jmp	donehypreaddir2
errhypreaddir2:
	sta	__rc2
donehypreaddir2:
	nop

	;NO_APP
	ldy	__rc2
	ldx	6720
	stz	6656,x
	cpy	#133
	beq	.LBB0_115
; %bb.114:                              ;   in Loop: Header=BB0_113 Depth=2
	cpy	#255
	beq	.LBB0_115
; %bb.293:                              ;   in Loop: Header=BB0_113 Depth=2
	jmp	.LBB0_101
.LBB0_115:                              ;   in Loop: Header=BB0_113 Depth=2
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	ldy	__rc4
	sty	__rc22
	lda	__rc4
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
	lda	#32
	sta	(__rc2)
	ldy	#1
	lda	#0
	sta	(__rc2),y
	bra	.LBB0_112
.LBB0_116:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	54801
	cpx	#1
	bne	.LBB0_117
; %bb.295:
	jmp	.LBB0_215
.LBB0_117:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	54801
	cpx	#2
	beq	.LBB0_233
; %bb.297:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_19
.LBB0_233:
	jmp	.LBB0_215
.LBB0_118:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	#1
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	beq	.LBB0_120
; %bb.119:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	#0
.LBB0_120:                              ;   in Loop: Header=BB0_19 Depth=1
	txa
	bne	.LBB0_121
; %bb.299:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_150
.LBB0_121:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	#1
; %bb.235:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_151
.LBB0_122:                              ;   in Loop: Header=BB0_19 Depth=1
	ldy	#16
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
	sta	__rc4
	ldy	#1
	lda	(__rc2),y
	sta	__rc5
	lda	(__rc4),y
	inc
	sta	(__rc4),y
; %bb.237:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_19
.LBB0_123:                              ;   in Loop: Header=BB0_19 Depth=1
	ldy	#16
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
	sta	__rc20
	ldy	#1
	lda	(__rc2),y
	sta	__rc21
	txa
	eor	#1
	tax
	lda	(__rc20)
; %bb.239:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_152
.LBB0_124:                              ;   in Loop: Header=BB0_19 Depth=1
	ldy	#2
	lda	(__rc22),y
	bne	.LBB0_125
; %bb.301:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_173
.LBB0_125:                              ;   in Loop: Header=BB0_19 Depth=1
	lda	#0
	sta	(__rc22),y
	stz	mos8(BAMsector.0)
	ldx	#22
	stx	mos8(BAMsector.0+1)
	stz	mos8(BAMsector.1)
	inx
	stx	mos8(BAMsector.1+1)
	stz	mos8(worksector.0)
	inx
	stx	mos8(worksector.0+1)
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	lda	(__rc28)
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#1
	lda	(__rc28),y
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	53376
	ldx	#3
	txa
	ldy	#11
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#40
	txa
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	mos8(direntryblock.0)
	txa
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	mos8(direntryblock.0+1)
	txa
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc2
	stz	__rc3
	stz	__rc4
	ldx	#14
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#0
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	__mulsi3
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc2
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc3
	ldx	#8
	pha
	txa
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ora	#8
	sta	__rc26
	ldy	#9
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#0
	stz	__rc24
	stz	__rc27
	stz	__rc25
	stz	__rc30
.LBB0_126:                              ;   Parent Loop BB0_19 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sty	__rc23
	tya
	lsr
	ldx	__rc24
	stx	__rc2
	ror	__rc2
	stz	__rc3
	ror	__rc3
	lsr
	ror	__rc2
	ror	__rc3
	lsr
	ldx	__rc2
	stx	__rc6
	ror	__rc6
	lda	__rc3
	ror
	clc
	pha
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	pla
	adc	__rc2
	tay
	phy
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	lda	__rc6
	adc	__rc2
	sta	__rc10
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#0
	sta	__rc2
	lda	__rc26
	adc	#0
	ldx	__rc2
	stx	__rc20
	sta	__rc22
	sta	__rc3
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc10
	stx	__rc21
	tya
	sty	__rc31
	jsr	lcopy
	lda	__rc24
	beq	.LBB0_130
; %bb.127:                              ;   in Loop: Header=BB0_126 Depth=2
	lda	__rc24
	and	#7
	ldx	__rc23
	bne	.LBB0_130
; %bb.128:                              ;   in Loop: Header=BB0_126 Depth=2
	tax
	bne	.LBB0_130
; %bb.129:                              ;   in Loop: Header=BB0_126 Depth=2
	ldx	__rc25
	txa
	ldy	#12
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc27
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_130:                              ;   in Loop: Header=BB0_126 Depth=2
	ldx	6656
	beq	.LBB0_132
; %bb.131:                              ;   in Loop: Header=BB0_126 Depth=2
	clc
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	__rc30
	adc	#0
	sta	__rc3
	stx	__rc25
	ldx	6657
	stx	__rc27
	bra	.LBB0_133
.LBB0_132:                              ;   in Loop: Header=BB0_126 Depth=2
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	ldx	__rc30
	stx	__rc3
.LBB0_133:                              ;   in Loop: Header=BB0_126 Depth=2
	ldx	#0
	ldy	#32
	phy
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	cmp	__rc24
	bne	.LBB0_134
; %bb.303:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_210
.LBB0_134:                              ;   in Loop: Header=BB0_126 Depth=2
	ldx	__rc24
	inx
	ldy	#0
	cpy	__rc3
	bne	.LBB0_136
; %bb.135:                              ;   in Loop: Header=BB0_126 Depth=2
	cpx	__rc2
	bra	.LBB0_137
.LBB0_136:                              ;   in Loop: Header=BB0_126 Depth=2
	cpy	__rc3
.LBB0_137:                              ;   in Loop: Header=BB0_126 Depth=2
	stx	__rc24
	lda	__rc2
	phy
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	ldx	__rc3
	stx	__rc30
	bcs	.LBB0_241
; %bb.305:                              ;   in Loop: Header=BB0_126 Depth=2
	jmp	.LBB0_126
.LBB0_241:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_173
.LBB0_138:                              ;   in Loop: Header=BB0_19 Depth=1
                                        ; kill: def $rs11 killed $rs11
	lda	__rc22
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc23
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
                                        ; kill: def $rs14 killed $rs14
	lda	__rc28
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc29
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#0
.LBB0_139:                              ;   in Loop: Header=BB0_19 Depth=1
	asl
	tax
	ldy	midnight,x
	lda	midnight+1,x
	tax
	sty	__rc4
	stx	__rc5
	clc
	lda	__rc0
	adc	#30
	sta	__rc22
	lda	__rc1
	adc	#0
	sta	__rc23
	lda	#0
	stz	__rc30
	sta	(__rc22)
	clc
	lda	__rc0
	adc	#29
	sta	__rc24
	lda	__rc1
	adc	#0
	sta	__rc25
	lda	#255
	tax
	pha
	txa
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	(__rc24)
	stz	mos8(BAMsector.0)
	ldx	#22
	stx	mos8(BAMsector.0+1)
	stz	mos8(BAMsector.1)
	inx
	stx	mos8(BAMsector.1+1)
	stz	mos8(worksector.0)
	inx
	stx	mos8(worksector.0+1)
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
                                        ; kill: def $rs2 killed $rs2
	lda	__rc4
	ldy	#14
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	(__rc4)
	stz	53376
	ldx	mos8(worksector.0)
	pha
	txa
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stx	__rc26
	ldx	mos8(worksector.0+1)
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stx	__rc27
	clc
	lda	__rc0
	adc	#28
	sta	__rc28
	lda	__rc1
	adc	#0
	sta	__rc29
	ldx	__rc28
	stx	__rc2
	sta	__rc3
	clc
	lda	__rc0
	adc	#27
	sta	__rc20
	lda	__rc1
	adc	#0
	sta	__rc21
	pla
	ldx	__rc20
	stx	__rc4
	ldx	__rc21
	stx	__rc5
	sta	__rc31
	jsr	findnextBAMtracksector
	lda	(__rc28)
	ldx	#0
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc28
	lda	(__rc20)
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc29
.LBB0_140:                              ;   Parent Loop BB0_19 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	clc
	stx	__rc21
	txa
	adc	#30
	sta	__rc10
	lda	#0
	adc	#0
	sta	__rc2
	lda	#0
	adc	#8
	sta	__rc3
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	ldx	__rc10
	lda	#0
	jsr	lcopy
	ldx	6144
	beq	.LBB0_142
; %bb.141:                              ;   in Loop: Header=BB0_140 Depth=2
	ldx	__rc22
	stx	__rc2
	ldx	__rc23
	stx	__rc3
	ldx	__rc24
	stx	__rc4
	ldx	__rc25
	stx	__rc5
	lda	__rc31
	jsr	findnextBAMtracksector
	lda	(__rc22)
	sta	6144
	lda	(__rc24)
	sta	6145
	lda	(__rc22)
	sta	__rc30
	lda	(__rc24)
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_142:                              ;   in Loop: Header=BB0_140 Depth=2
	ldx	__rc26
	stx	__rc2
	ldx	__rc27
	stx	__rc3
	ldx	__rc29
	stx	__rc4
	ldx	__rc28
	lda	__rc31
	jsr	PutOneSector
	ldx	6144
	beq	.LBB0_148
; %bb.143:                              ;   in Loop: Header=BB0_140 Depth=2
	ldx	__rc21
	inx
	ldy	__rc30
	sty	__rc28
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
	cpx	#199
	beq	.LBB0_144
; %bb.307:                              ;   in Loop: Header=BB0_140 Depth=2
	jmp	.LBB0_140
.LBB0_144:                              ;   in Loop: Header=BB0_19 Depth=1
	lda	__rc30
	beq	.LBB0_148
; %bb.145:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	#mos16lo(.L.str.13)
	stx	__rc2
	ldx	#mos16hi(.L.str.13)
	stx	__rc3
	ldx	#mos16lo(.L.str.14)
	stx	__rc4
	ldx	#mos16hi(.L.str.14)
	stx	__rc5
	ldx	#mos16lo(.L.str.27)
	stx	__rc6
	ldx	#mos16hi(.L.str.27)
	stx	__rc7
	jsr	messagebox
.LBB0_146:                              ;   Parent Loop BB0_19 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_146
; %bb.147:                              ;   in Loop: Header=BB0_19 Depth=1
	stz	54800
.LBB0_148:                              ;   in Loop: Header=BB0_19 Depth=1
	ldy	#3
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc4),y
	ldy	#4
                                        ; kill: def $rs2 killed $rs2
	phy
	lda	__rc4
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc4),y
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	lda	(__rc2)
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	mos8(BAMsector.0)
	ldx	#22
	stx	mos8(BAMsector.0+1)
	stz	mos8(BAMsector.1)
	inx
	stx	mos8(BAMsector.1+1)
	stz	mos8(worksector.0)
	inx
	stx	mos8(worksector.0+1)
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	stz	53376
	ldx	mos8(direntryblock.1)
	txa
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	mos8(direntryblock.1+1)
	txa
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	beq	.LBB0_153
; %bb.149:                              ;   in Loop: Header=BB0_19 Depth=1
	stz	__rc2
	lda	#0
	bra	.LBB0_154
.LBB0_150:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	#0
.LBB0_151:                              ;   in Loop: Header=BB0_19 Depth=1
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	eor	#1
	sta	__rc4
	stx	__rc2
	asl	__rc2
	ldx	__rc2
	ldy	midnight,x
	lda	midnight+1,x
	tax
	sty	__rc20
	stx	__rc21
	lda	(__rc20)
	pha
	lda	__rc4
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldx	__rc4
.LBB0_152:                              ;   in Loop: Header=BB0_19 Depth=1
	jsr	getdirent
	ldy	#2
	sta	(__rc20),y
; %bb.243:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_19
.LBB0_153:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	#14
	txa
.LBB0_154:                              ;   in Loop: Header=BB0_19 Depth=1
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#8
	stx	__rc6
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
	ldx	#0
	ldy	#3
	tya
	ldy	#11
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#40
	tya
	ldy	#12
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	ldy	#8
	stz	__rc24
	stz	__rc2
	pha
	txa
	phy
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	pla
	stz	__rc20
	stz	__rc27
.LBB0_155:                              ;   Parent Loop BB0_19 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sty	__rc25
	stx	__rc22
	sta	__rc23
	lsr
	stx	__rc3
	ror	__rc3
	stz	__rc2
	ror	__rc2
	lsr
	ror	__rc3
	ror	__rc2
	lsr
	ldx	__rc3
	stx	__rc7
	ror	__rc7
	ror	__rc2
	ldx	#0
	txa
	clc
	adc	__rc2
	tay
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	lda	__rc7
	adc	__rc2
	sta	__rc10
	txa
	adc	#0
	tax
	ldy	__rc6
	sty	__rc30
	lda	__rc6
	adc	#0
	pha
	txa
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stx	__rc2
	sta	__rc31
	sta	__rc3
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc10
	stx	__rc26
	tya
	sty	__rc21
	jsr	lcopy
	lda	__rc22
	and	#7
	ldx	__rc23
	bne	.LBB0_160
; %bb.156:                              ;   in Loop: Header=BB0_155 Depth=2
	tax
	bne	.LBB0_160
; %bb.157:                              ;   in Loop: Header=BB0_155 Depth=2
	lda	__rc22
	bne	.LBB0_158
; %bb.309:                              ;   in Loop: Header=BB0_155 Depth=2
	jmp	.LBB0_208
.LBB0_158:                              ;   in Loop: Header=BB0_155 Depth=2
	lda	__rc22
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc20
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc27
	txa
	dey
.LBB0_159:                              ;   in Loop: Header=BB0_155 Depth=2
	sta	(__rc0),y                       ; 2-byte Folded Spill
.LBB0_160:                              ;   in Loop: Header=BB0_155 Depth=2
	lda	__rc25
	ldx	6912
	beq	.LBB0_162
; %bb.161:                              ;   in Loop: Header=BB0_155 Depth=2
	clc
	adc	#8
	stx	__rc20
	sta	__rc2
	lda	__rc24
	adc	#0
	sta	__rc3
	ldx	6913
	stx	__rc27
	ldx	__rc20
	bra	.LBB0_163
.LBB0_162:                              ;   in Loop: Header=BB0_155 Depth=2
	sta	__rc2
	ldy	__rc24
	sty	__rc3
.LBB0_163:                              ;   in Loop: Header=BB0_155 Depth=2
	lda	#15
	and	6914
	bne	.LBB0_164
; %bb.311:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_209
.LBB0_164:                              ;   in Loop: Header=BB0_155 Depth=2
	ldx	__rc22
	inx
	lda	#0
	cmp	__rc3
	bne	.LBB0_166
; %bb.165:                              ;   in Loop: Header=BB0_155 Depth=2
	cpx	__rc2
	bra	.LBB0_167
.LBB0_166:                              ;   in Loop: Header=BB0_155 Depth=2
	cmp	__rc3
.LBB0_167:                              ;   in Loop: Header=BB0_155 Depth=2
	ldy	__rc2
	pha
	lda	__rc3
	sta	__rc24
	lda	__rc30
	sta	__rc6
	pla
	bcs	.LBB0_168
; %bb.313:                              ;   in Loop: Header=BB0_155 Depth=2
	jmp	.LBB0_155
.LBB0_168:                              ;   in Loop: Header=BB0_19 Depth=1
                                        ; kill: def $rs14 killed $rs14
	lda	__rc28
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc29
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	__rc30
	phy
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	lsr
	ldx	#1
	bcs	.LBB0_170
; %bb.169:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	#0
.LBB0_170:                              ;   in Loop: Header=BB0_19 Depth=1
	stx	__rc2
	tax
	clc
	lda	__rc0
	adc	#32
	sta	__rc22
	lda	__rc1
	adc	#0
	sta	__rc23
	clc
	lda	__rc0
	adc	#31
	sta	__rc24
	lda	__rc1
	adc	#0
	sta	__rc25
	lda	__rc20
	sta	(__rc22)
	lda	__rc27
	sta	(__rc24)
	lda	#0
	ldy	__rc2
	cpy	#1
	ror
	stx	__rc30
	lsr	__rc30
	ror
	ldx	__rc30
	stx	__rc2
	lsr	__rc2
	ror
	sta	__rc3
	stz	__rc29
	lda	#0
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	adc	__rc3
	sta	__rc31
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc21
	adc	__rc2
	sta	__rc27
	lda	#0
	adc	#0
	sta	__rc28
	tya
	ldy	#9
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pha
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	adc	#0
	ldx	__rc28
	stx	__rc2
	sta	__rc3
	sta	__rc29
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc26
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	sta	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc27
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
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	findnextBAMtracksector
	lda	(__rc22)
	sta	6912
	lda	(__rc24)
	sta	6913
	lda	(__rc22)
	sta	__rc23
	lda	(__rc24)
	sta	__rc24
	ldx	__rc31
	stx	__rc4
	ldx	__rc27
	stx	__rc5
	ldx	__rc28
	stx	__rc6
	ldx	__rc29
	stx	__rc7
	stz	__rc2
	stz	__rc3
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc20
	lda	__rc26
	jsr	lcopy
	lda	__rc30
	lsr
	sta	__rc3
	lda	#0
	stz	__rc2
	clc
	adc	__rc2
	ldx	#1
	bcs	.LBB0_172
; %bb.171:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	#0
.LBB0_172:                              ;   in Loop: Header=BB0_19 Depth=1
	stx	__rc30
	sta	__rc26
	lda	__rc3
	ldx	__rc21
	stx	__rc20
	adc	__rc21
	tax
	lda	#0
	adc	__rc2
	tay
	lda	#0
	pha
	phy
	ldy	#9
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc21
	pla
	adc	__rc21
	sty	__rc2
	sta	__rc3
	stz	__rc4
	ldy	#24
	sty	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldy	#1
	sty	__rc9
	lda	__rc26
	jsr	lcopy
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc27
	jsr	PutOneSector
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc31
	lsr	__rc31
	lda	#0
	ror
	lsr	__rc31
	ror
	ldx	__rc31
	stx	__rc3
	lsr	__rc3
	ror
	sta	__rc2
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	clc
	adc	__rc2
	sta	__rc22
	lda	__rc3
	adc	__rc20
	sta	__rc29
	ldy	__rc20
	sty	__rc28
	txa
	adc	#0
	sta	__rc20
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#0
	sta	__rc25
	ldx	__rc20
	stx	__rc2
	sta	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#1
	stx	__rc6
	ldx	__rc29
	lda	__rc22
	jsr	lfill
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc10
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc11
	lda	#0
	sta	(__rc10)
	dec
	ldy	#1
	sta	(__rc10),y
	ldx	__rc22
	stx	__rc4
	ldx	__rc29
	stx	__rc5
	ldx	__rc20
	stx	__rc6
	stz	__rc2
	stz	__rc3
	stz	__rc9
	ldx	__rc25
	stx	__rc7
	ldx	#32
	stx	__rc8
	ldx	__rc11
	lda	__rc10
	jsr	lcopy
	lda	__rc31
	lsr
	ldx	__rc30
	cpx	#1
	adc	__rc28
	sta	__rc10
	lda	#0
	stz	__rc2
	adc	__rc2
	sta	__rc2
	lda	#0
	adc	__rc21
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
	lda	__rc26
	jsr	lcopy
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldx	__rc24
	stx	__rc4
	ldx	__rc23
	lda	__rc27
	jsr	PutOneSector
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
.LBB0_173:                              ;   in Loop: Header=BB0_19 Depth=1
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	eor	#1
	tax
	lda	(__rc28)
	jsr	getdirent
	ldy	#2
	sta	(__rc28),y
; %bb.245:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_19
.LBB0_174:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	__rc21
	stx	__rc20
	tax
	;APP
	lda	#22
	sta	54848
	clv
	bcc	errhypclosedir3
	stx	__rc2
	jmp	donehypclosedir3
errhypclosedir3:
	sta	__rc2
donehypclosedir3:
	nop

	;NO_APP
.LBB0_175:                              ;   in Loop: Header=BB0_19 Depth=1
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc24
	lda	#mos16hi(midnight)
	adc	__rc3
	sta	__rc25
	lda	#0
; %bb.247:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_196
.LBB0_176:                              ;   in Loop: Header=BB0_200 Depth=3
	ora	#32
; %bb.249:                              ;   in Loop: Header=BB0_200 Depth=3
	jmp	.LBB0_204
.LBB0_177:                              ;   in Loop: Header=BB0_196 Depth=2
	lda	mos8(g_curTextColor)
.LBB0_178:                              ;   in Loop: Header=BB0_196 Depth=2
	and	#223
	sta	mos8(g_curTextColor)
	jsr	cputln
.LBB0_179:                              ;   Parent Loop BB0_19 Depth=1
                                        ;     Parent Loop BB0_196 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	54800
	beq	.LBB0_179
; %bb.180:                              ;   in Loop: Header=BB0_196 Depth=2
	stz	54800
	cmp	#145
	beq	.LBB0_186
; %bb.181:                              ;   in Loop: Header=BB0_196 Depth=2
	cmp	#13
	beq	.LBB0_188
; %bb.182:                              ;   in Loop: Header=BB0_196 Depth=2
	ldx	__rc21
	stx	__rc20
	cmp	#17
	bne	.LBB0_183
; %bb.315:                              ;   in Loop: Header=BB0_196 Depth=2
	jmp	.LBB0_190
.LBB0_183:                              ;   in Loop: Header=BB0_196 Depth=2
	cmp	#3
	bne	.LBB0_184
; %bb.317:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_19
.LBB0_184:                              ;   in Loop: Header=BB0_196 Depth=2
	cmp	#27
	bne	.LBB0_185
; %bb.319:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_19
.LBB0_185:                              ;   in Loop: Header=BB0_196 Depth=2
	stz	__rc2
	stz	__rc3
	ldx	#0
	jsr	mprintf
	lda	__rc31
; %bb.251:                              ;   in Loop: Header=BB0_196 Depth=2
	jmp	.LBB0_196
.LBB0_186:                              ;   in Loop: Header=BB0_196 Depth=2
	lda	#0
	ldx	__rc21
	stx	__rc20
	ldx	__rc31
	bne	.LBB0_187
; %bb.321:                              ;   in Loop: Header=BB0_196 Depth=2
	jmp	.LBB0_196
.LBB0_187:                              ;   in Loop: Header=BB0_196 Depth=2
	dec	__rc31
	lda	__rc31
; %bb.253:                              ;   in Loop: Header=BB0_196 Depth=2
	jmp	.LBB0_196
.LBB0_188:                              ;   in Loop: Header=BB0_196 Depth=2
	lda	(__rc26)
	sta	__rc28
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc31
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	#mos16lo(filelist)
	clc
	adc	__rc2
	sta	__rc22
	lda	#mos16hi(filelist)
	adc	__rc3
	sta	__rc23
	ldx	#28
	stx	fnamehi
	ldx	#0
	stx	__rc2
	ldx	#28
	stx	__rc3
	ldx	__rc22
	stx	__rc4
	sta	__rc5
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
	lda	__rc28
	beq	.LBB0_191
; %bb.189:                              ;   in Loop: Header=BB0_196 Depth=2
	;APP
	ldx	#0
	lda	#70
	sta	54848
	clv
	bcc	errhyp1att5
	lda	#0
	sta	__rc2
	jmp	donehyp1att5
errhyp1att5:
	lda	#255
	sta	__rc2
donehyp1att5:
	nop

	;NO_APP
	bra	.LBB0_192
.LBB0_190:                              ;   in Loop: Header=BB0_196 Depth=2
	inc	__rc31
	lda	__rc31
	bra	.LBB0_196
.LBB0_191:                              ;   in Loop: Header=BB0_196 Depth=2
	;APP
	ldx	#0
	lda	#64
	sta	54848
	clv
	bcc	errhyp0att6
	lda	#0
	sta	__rc2
	jmp	donehyp0att6
errhyp0att6:
	lda	#255
	sta	__rc2
donehyp0att6:
	nop

	;NO_APP
.LBB0_192:                              ;   in Loop: Header=BB0_196 Depth=2
	lda	__rc2
	bne	.LBB0_193
; %bb.323:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_207
.LBB0_193:                              ;   in Loop: Header=BB0_196 Depth=2
	ldx	#mos16lo(.L.str.23)
	stx	__rc2
	ldx	#mos16hi(.L.str.23)
	stx	__rc3
	ldx	#mos16lo(.L.str.24)
	stx	__rc4
	ldx	#mos16hi(.L.str.24)
	stx	__rc5
	ldx	__rc22
	stx	__rc6
	ldx	__rc23
	stx	__rc7
	jsr	messagebox
.LBB0_194:                              ;   Parent Loop BB0_19 Depth=1
                                        ;     Parent Loop BB0_196 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	54800
	beq	.LBB0_194
; %bb.195:                              ;   in Loop: Header=BB0_196 Depth=2
	stz	54800
	lda	__rc31
	ldx	__rc21
	stx	__rc20
.LBB0_196:                              ;   Parent Loop BB0_19 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_200 Depth 3
                                        ;       Child Loop BB0_179 Depth 3
                                        ;       Child Loop BB0_194 Depth 3
	ldx	__rc20
	stx	__rc21
	cmp	__rc20
	bcs	.LBB0_198
; %bb.197:                              ;   in Loop: Header=BB0_196 Depth=2
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	sta	__rc31
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
	bne	.LBB0_199
.LBB0_198:                              ;   in Loop: Header=BB0_196 Depth=2
	stz	__rc31
.LBB0_199:                              ;   in Loop: Header=BB0_196 Depth=2
	ldx	#5
	txa
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#mos16lo(filelist)
	stx	__rc22
	ldx	#mos16hi(filelist)
	stx	__rc23
	ldx	#73
	stx	__rc2
	ldx	#23
	stx	__rc3
	ldx	#1
	stx	__rc4
	ldx	#3
	lda	#8
	jsr	mcbox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.21)
	stx	__rc2
	ldx	#mos16hi(.L.str.21)
	stx	__rc3
	jsr	asciitoscreencode_s
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
                                        ; kill: def $rs1 killed $rs1
	lda	__rc2
	ldy	#25
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
	ldx	#3
	lda	#12
	jsr	cputsxy
	lda	(__rc24)
	sta	__rc30
	sta	__rc26
	ldy	#1
	lda	(__rc24),y
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc27
	lda	(__rc26)
	stz	__rc2
	stz	__rc3
	stz	__rc4
	ldx	#0
	jsr	csputdec
	ldx	#mos16lo(.L.str.22)
	stx	__rc2
	ldx	#mos16hi(.L.str.22)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
                                        ; kill: def $rs1 killed $rs1
	pha
	lda	__rc2
	ldy	#25
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
	pla
	jsr	cputsxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	__rc31
	stx	__rc28
	stz	__rc29
.LBB0_200:                              ;   Parent Loop BB0_19 Depth=1
                                        ;     Parent Loop BB0_196 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc22)
	tax
	lda	mos8(g_curTextColor)
	cpx	#0
	bne	.LBB0_201
; %bb.325:                              ;   in Loop: Header=BB0_196 Depth=2
	jmp	.LBB0_178
.LBB0_201:                              ;   in Loop: Header=BB0_200 Depth=3
	ldx	__rc29
	bne	.LBB0_203
; %bb.202:                              ;   in Loop: Header=BB0_200 Depth=3
	ldx	__rc28
	bne	.LBB0_203
; %bb.327:                              ;   in Loop: Header=BB0_200 Depth=3
	jmp	.LBB0_176
.LBB0_203:                              ;   in Loop: Header=BB0_200 Depth=3
	and	#223
.LBB0_204:                              ;   in Loop: Header=BB0_200 Depth=3
	sta	mos8(g_curTextColor)
	ldx	__rc22
	stx	__rc2
	ldx	__rc23
	stx	__rc3
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	tax
	lda	#10
	jsr	cputsxy
	lda	__rc22
	clc
	adc	#65
	sta	__rc22
	lda	__rc23
	adc	#0
	sta	__rc23
	inc	__rc20
	ldx	__rc28
	dec	__rc28
	cpx	#0
	bne	.LBB0_206
; %bb.205:                              ;   in Loop: Header=BB0_200 Depth=3
	dec	__rc29
.LBB0_206:                              ;   in Loop: Header=BB0_200 Depth=3
	lda	__rc20
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc20
	cpx	#23
	bne	.LBB0_200
; %bb.255:                              ;   in Loop: Header=BB0_196 Depth=2
	jmp	.LBB0_177
.LBB0_207:                              ;   in Loop: Header=BB0_19 Depth=1
	clc
	lda	__rc30
	adc	#3
	tax
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#0
	stx	__rc2
	sta	__rc3
	ldx	__rc22
	stx	__rc4
	ldx	__rc23
	stx	__rc5
	jsr	strcpy
	lda	(__rc26)
	pha
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	jsr	getdirent
	ldy	#2
	sta	(__rc26),y
; %bb.257:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_19
.LBB0_208:                              ;   in Loop: Header=BB0_155 Depth=2
	stz	__rc2
	lda	#0
	ldy	#13
; %bb.259:                              ;   in Loop: Header=BB0_155 Depth=2
	jmp	.LBB0_159
.LBB0_209:                              ;   in Loop: Header=BB0_19 Depth=1
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc10
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc11
	txa
	sta	(__rc10)
	lda	6913
	ldy	#1
	sta	(__rc10),y
	ldx	__rc21
	stx	__rc4
	ldx	__rc26
	stx	__rc5
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc6
	stz	__rc2
	stz	__rc3
	ldx	__rc31
	stx	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc11
	lda	__rc10
	jsr	lcopy
	lda	__rc22
	lsr
	lsr
	lsr
	tax
	stz	__rc2
	clc
	lda	#0
	adc	__rc2
	tay
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc3
	txa
	adc	__rc3
	sta	__rc10
	lda	#0
	adc	__rc2
	sta	__rc2
	lda	#0
	adc	__rc30
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
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
; %bb.261:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_214
.LBB0_210:                              ;   in Loop: Header=BB0_19 Depth=1
	stz	6658
	ldx	__rc31
	stx	__rc4
	ldx	__rc21
	stx	__rc5
	ldx	__rc20
	stx	__rc6
	ldx	__rc22
	stx	__rc7
	stz	__rc2
	stz	__rc3
	sty	__rc8
	stz	__rc9
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	lcopy
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	lsr
	lsr
	lsr
	tax
	clc
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	lda	#0
	adc	__rc2
	tay
	sty	__rc17
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	txa
	adc	__rc2
	sta	__rc10
	lda	#0
	pha
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	pla
	adc	__rc2
	tax
	lda	#0
	pha
	ldy	#9
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	__rc17
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
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	jsr	PutOneSector
	ldx	6659
	stx	__rc21
	ldx	6660
	stx	__rc22
	stz	mos8(BAMsector.0)
	ldx	#22
	stx	mos8(BAMsector.0+1)
	stz	mos8(BAMsector.1)
	inx
	stx	mos8(BAMsector.1+1)
	stz	mos8(worksector.0)
	inx
	stx	mos8(worksector.0+1)
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	stz	53376
	ldx	mos8(BAMsector.0)
	stx	__rc2
	ldx	mos8(BAMsector.0+1)
	stx	__rc3
	ldx	#1
	stx	__rc4
	ldx	#40
	lda	__rc20
	jsr	GetOneSector
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc2
	sty	__rc3
	ldx	5632
	ldy	5633
	sty	__rc4
	lda	__rc20
	jsr	GetOneSector
	lda	__rc21
	beq	.LBB0_213
; %bb.211:                              ;   in Loop: Header=BB0_19 Depth=1
	lda	__rc21
.LBB0_212:                              ;   Parent Loop BB0_19 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldx	__rc22
	stx	__rc4
	tax
	sta	__rc21
	lda	__rc20
	jsr	GetOneSector
	ldx	mos8(BAMsector.0)
	ldy	mos8(BAMsector.0+1)
	stx	__rc2
	sty	__rc3
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc4
	sty	__rc5
	stz	__rc6
	ldx	__rc22
	lda	__rc21
	jsr	BAMSectorUpdate
	lda	6144
	ldx	6145
	stx	__rc22
	tax
	bne	.LBB0_212
.LBB0_213:                              ;   in Loop: Header=BB0_19 Depth=1
	ldx	mos8(BAMsector.0)
	ldy	mos8(BAMsector.0+1)
	stx	__rc2
	sty	__rc3
	ldx	#1
	stx	__rc4
	ldx	#40
	lda	__rc20
	jsr	PutOneSector
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc2
	sty	__rc3
	ldx	5632
	ldy	5633
	sty	__rc4
	lda	__rc20
.LBB0_214:                              ;   in Loop: Header=BB0_19 Depth=1
	jsr	PutOneSector
; %bb.263:                              ;   in Loop: Header=BB0_19 Depth=1
	jmp	.LBB0_173
.LBB0_215:
	jsr	clrhome
	ldx	#mos16lo(.L.str.6)
	stx	__rc2
	ldx	#mos16hi(.L.str.6)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	jsr	cputsxy
	jsr	cputln
.LBB0_216:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB0_216
.LBB0_217:                              ; =>This Inner Loop Header: Depth=1
	stz	54800
	ldx	54800
	bne	.LBB0_217
; %bb.218:
	;APP
	plz
	ply
	plx
	pla
	plp
	cli
	;NO_APP
	;APP
	lda	#55
	sta	1
	jmp	(65526)
	;NO_APP
	ldx	#0
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
	adc	#33
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.section	.rodata.main,"a",@progbits
.LJTI0_0:
	.byte	.LBB0_86@mos16lo
	.byte	.LBB0_96@mos16lo
	.byte	.LBB0_86@mos16lo
	.byte	.LBB0_86@mos16lo
	.byte	.LBB0_89@mos16lo
	.byte	.LBB0_86@mos16lo
	.byte	.LBB0_86@mos16lo
	.byte	.LBB0_89@mos16lo
	.byte	.LBB0_86@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_118@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_86@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_95@mos16lo
	.byte	.LBB0_122@mos16lo
	.byte	.LBB0_123@mos16lo
	.byte	.LBB0_86@mos16hi
	.byte	.LBB0_96@mos16hi
	.byte	.LBB0_86@mos16hi
	.byte	.LBB0_86@mos16hi
	.byte	.LBB0_89@mos16hi
	.byte	.LBB0_86@mos16hi
	.byte	.LBB0_86@mos16hi
	.byte	.LBB0_89@mos16hi
	.byte	.LBB0_86@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_118@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_86@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_95@mos16hi
	.byte	.LBB0_122@mos16hi
	.byte	.LBB0_123@mos16hi
                                        ; -- End function
	.section	.text.ReadSector,"ax",@progbits
	.type	ReadSector,@function            ; -- Begin function ReadSector
ReadSector:                             ; @ReadSector
; %bb.0:
	cpx	#0
	beq	.LBB1_5
; %bb.1:
	clc
	adc	#96
	sta	53376
	ldy	#32
	sty	53377
	dex
	stx	53380
	ldy	__rc2
	lda	__rc2
	lsr
	inc
	sta	53381
	stz	53382
	ldx	#65
	stx	53377
.LBB1_2:                                ; =>This Inner Loop Header: Depth=1
	ldx	53378
	bmi	.LBB1_2
; %bb.3:
	lda	53378
	and	#24
	beq	.LBB1_6
; %bb.4:
	lda	#255
	ldx	#64
	stx	53376
	rts
.LBB1_5:
	lda	#252
	rts
.LBB1_6:
	lda	54921
	and	#127
	sta	54921
	tya
	and	#1
	rts
.Lfunc_end1:
	.size	ReadSector, .Lfunc_end1-ReadSector
                                        ; -- End function
	.section	.text.GetOneSector,"ax",@progbits
	.type	GetOneSector,@function          ; -- Begin function GetOneSector
GetOneSector:                           ; @GetOneSector
; %bb.0:
	ldy	__rc4
	pha
	lda	__rc2
	sta	mos8(.LGetOneSector_zp_stk)
	lda	__rc3
	sta	mos8(.LGetOneSector_zp_stk+1)
	pla
	sty	__rc2
	jsr	ReadSector
	cmp	#2
	bcs	.LBB2_5
; %bb.1:
	tax
	beq	.LBB2_3
; %bb.2:
	ldx	#109
	bra	.LBB2_4
.LBB2_3:
	ldx	#108
.LBB2_4:
	ldy	#1
	lda	#253
	sta	__rc2
	lda	#15
	sta	__rc3
	lda	mos8(.LGetOneSector_zp_stk)
	sta	__rc4
	lda	mos8(.LGetOneSector_zp_stk+1)
	sta	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	sty	__rc9
	lda	#0
	jsr	lcopy
.LBB2_5:
	rts
.Lfunc_end2:
	.size	GetOneSector, .Lfunc_end2-GetOneSector
                                        ; -- End function
	.section	.text.PutOneSector,"ax",@progbits
	.type	PutOneSector,@function          ; -- Begin function PutOneSector
PutOneSector:                           ; @PutOneSector
; %bb.0:
	ldy	__rc4
	sty	mos8(.LPutOneSector_zp_stk+4)
	ldy	__rc2
	sty	mos8(.LPutOneSector_zp_stk)
	ldy	__rc3
	sty	mos8(.LPutOneSector_zp_stk+1)
	ldy	__rc4
	sty	__rc2
	stx	mos8(.LPutOneSector_zp_stk+2)
	sta	mos8(.LPutOneSector_zp_stk+3)
	jsr	ReadSector
	ldy	#108
	ldx	mos8(.LPutOneSector_zp_stk+4)
	stx	mos8(.LPutOneSector_zp_stk+5)
	lsr	mos8(.LPutOneSector_zp_stk+4)
	bcc	.LBB3_2
; %bb.1:
	ldy	#109
.LBB3_2:
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
	ldx	mos8(.LPutOneSector_zp_stk+1)
	lda	mos8(.LPutOneSector_zp_stk)
	jsr	lcopy
	ldx	mos8(.LPutOneSector_zp_stk+5)
	lda	mos8(.LPutOneSector_zp_stk+3)
	cpx	#20
	bcc	.LBB3_4
; %bb.3:
	clc
	adc	#104
	bra	.LBB3_5
.LBB3_4:
	clc
	adc	#96
.LBB3_5:
	ldy	mos8(.LPutOneSector_zp_stk+2)
	sta	53376
	ldx	#32
	stx	53377
	dey
	sty	53380
	ldx	mos8(.LPutOneSector_zp_stk+4)
	inx
	stx	53381
	stz	53382
	ldx	#132
	stx	53377
.LBB3_6:                                ; =>This Inner Loop Header: Depth=1
	ldx	53378
	bmi	.LBB3_6
; %bb.7:
	lda	53378
	and	#24
	beq	.LBB3_9
; %bb.8:
	ldx	#64
	stx	53376
	rts
.LBB3_9:
	lda	54921
	and	#127
	sta	54921
	rts
.Lfunc_end3:
	.size	PutOneSector, .Lfunc_end3-PutOneSector
                                        ; -- End function
	.section	.text.BAMSectorUpdate,"ax",@progbits
	.type	BAMSectorUpdate,@function       ; -- Begin function BAMSectorUpdate
BAMSectorUpdate:                        ; @BAMSectorUpdate
; %bb.0:
	tay
	cmp	#41
	bcc	.LBB4_2
; %bb.1:
	ldy	__rc4
	sty	mos8(.LBAMSectorUpdate_zp_stk)
	ldy	__rc5
	sty	mos8(.LBAMSectorUpdate_zp_stk+1)
	clc
	adc	#216
	tay
	bra	.LBB4_3
.LBB4_2:
	lda	__rc2
	sta	mos8(.LBAMSectorUpdate_zp_stk)
	lda	__rc3
	sta	mos8(.LBAMSectorUpdate_zp_stk+1)
.LBB4_3:
	dey
	sty	__rc5
	lda	__rc6
	beq	.LBB4_6
; %bb.4:
	stx	mos8(.LBAMSectorUpdate_zp_stk+4)
	cpx	#8
	bcs	.LBB4_8
; %bb.5:
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Spill
	tya
	sty	mos8(.LBAMSectorUpdate_zp_stk+7) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	mos8(.LBAMSectorUpdate_zp_stk)
	tay
	txa
	adc	mos8(.LBAMSectorUpdate_zp_stk+1)
	sta	__rc2
	clc
	tya
	adc	#17
; %bb.25:
	jmp	.LBB4_21
.LBB4_6:
	stx	mos8(.LBAMSectorUpdate_zp_stk+4)
	cpx	#8
	bcc	.LBB4_7
; %bb.41:
	jmp	.LBB4_10
.LBB4_7:
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Spill
	tya
	sty	mos8(.LBAMSectorUpdate_zp_stk+7) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	mos8(.LBAMSectorUpdate_zp_stk)
	tay
	txa
	adc	mos8(.LBAMSectorUpdate_zp_stk+1)
	sta	__rc2
	clc
	tya
	adc	#17
; %bb.27:
	jmp	.LBB4_23
.LBB4_8:
	cpx	#16
	ldx	#0
	bcc	.LBB4_9
; %bb.43:
	jmp	.LBB4_12
.LBB4_9:
	clc
	lda	mos8(.LBAMSectorUpdate_zp_stk+4)
	adc	#248
	sta	mos8(.LBAMSectorUpdate_zp_stk+4)
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Spill
	ldy	__rc5
	sty	mos8(.LBAMSectorUpdate_zp_stk+7) ; 1-byte Folded Spill
	lda	__rc5
	jsr	__mulhi3
	clc
	adc	mos8(.LBAMSectorUpdate_zp_stk)
	tay
	txa
	adc	mos8(.LBAMSectorUpdate_zp_stk+1)
	sta	__rc2
	clc
	tya
	adc	#18
; %bb.29:
	jmp	.LBB4_21
.LBB4_10:
	cpx	#16
	bcc	.LBB4_11
; %bb.45:
	jmp	.LBB4_14
.LBB4_11:
	clc
	txa
	adc	#248
	sta	mos8(.LBAMSectorUpdate_zp_stk+4)
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Spill
	sty	mos8(.LBAMSectorUpdate_zp_stk+7) ; 1-byte Folded Spill
	tya
	jsr	__mulhi3
	clc
	adc	mos8(.LBAMSectorUpdate_zp_stk)
	tay
	txa
	adc	mos8(.LBAMSectorUpdate_zp_stk+1)
	sta	__rc2
	clc
	tya
	adc	#18
; %bb.31:
	jmp	.LBB4_23
.LBB4_12:
	ldy	mos8(.LBAMSectorUpdate_zp_stk+4)
	cpy	#24
	bcc	.LBB4_13
; %bb.47:
	jmp	.LBB4_16
.LBB4_13:
	clc
	lda	mos8(.LBAMSectorUpdate_zp_stk+4)
	adc	#240
	sta	mos8(.LBAMSectorUpdate_zp_stk+4)
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Spill
	ldy	__rc5
	sty	mos8(.LBAMSectorUpdate_zp_stk+7) ; 1-byte Folded Spill
	lda	__rc5
	jsr	__mulhi3
	clc
	adc	mos8(.LBAMSectorUpdate_zp_stk)
	tay
	txa
	adc	mos8(.LBAMSectorUpdate_zp_stk+1)
	sta	__rc2
	clc
	tya
	adc	#19
; %bb.33:
	jmp	.LBB4_21
.LBB4_14:
	cpx	#24
	bcc	.LBB4_15
; %bb.49:
	jmp	.LBB4_18
.LBB4_15:
	clc
	txa
	adc	#240
	sta	mos8(.LBAMSectorUpdate_zp_stk+4)
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Spill
	tya
	sty	mos8(.LBAMSectorUpdate_zp_stk+7) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	mos8(.LBAMSectorUpdate_zp_stk)
	tay
	txa
	adc	mos8(.LBAMSectorUpdate_zp_stk+1)
	sta	__rc2
	clc
	tya
	adc	#19
; %bb.35:
	jmp	.LBB4_23
.LBB4_16:
	ldy	mos8(.LBAMSectorUpdate_zp_stk+4)
	cpy	#32
	bcc	.LBB4_17
; %bb.51:
	jmp	.LBB4_20
.LBB4_17:
	clc
	lda	mos8(.LBAMSectorUpdate_zp_stk+4)
	adc	#232
	sta	mos8(.LBAMSectorUpdate_zp_stk+4)
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Spill
	lda	__rc5
	ldy	__rc5
	sty	mos8(.LBAMSectorUpdate_zp_stk+7) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	mos8(.LBAMSectorUpdate_zp_stk)
	tay
	txa
	adc	mos8(.LBAMSectorUpdate_zp_stk+1)
	sta	__rc2
	clc
	tya
	adc	#20
; %bb.37:
	jmp	.LBB4_21
.LBB4_18:
	cpx	#32
	bcc	.LBB4_19
; %bb.53:
	jmp	.LBB4_22
.LBB4_19:
	clc
	txa
	adc	#232
	sta	mos8(.LBAMSectorUpdate_zp_stk+4)
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Spill
	tya
	sty	mos8(.LBAMSectorUpdate_zp_stk+7) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	mos8(.LBAMSectorUpdate_zp_stk)
	tay
	txa
	adc	mos8(.LBAMSectorUpdate_zp_stk+1)
	sta	__rc2
	clc
	tya
	adc	#20
; %bb.39:
	jmp	.LBB4_23
.LBB4_20:
	clc
	lda	mos8(.LBAMSectorUpdate_zp_stk+4)
	adc	#224
	sta	mos8(.LBAMSectorUpdate_zp_stk+4)
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Spill
	lda	__rc5
	ldy	__rc5
	sty	mos8(.LBAMSectorUpdate_zp_stk+7) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	mos8(.LBAMSectorUpdate_zp_stk)
	tay
	txa
	adc	mos8(.LBAMSectorUpdate_zp_stk+1)
	sta	__rc2
	clc
	tya
	adc	#21
.LBB4_21:
	sta	mos8(.LBAMSectorUpdate_zp_stk+2)
	lda	__rc2
	adc	#0
	sta	mos8(.LBAMSectorUpdate_zp_stk+3)
	lda	#1
	ldx	#0
	ldy	mos8(.LBAMSectorUpdate_zp_stk+4)
	sty	__rc2
	jsr	__ashlhi3
	eor	#255
	and	(mos8(.LBAMSectorUpdate_zp_stk+2))
	sta	(mos8(.LBAMSectorUpdate_zp_stk+2))
	ldx	#255
	stx	mos8(.LBAMSectorUpdate_zp_stk+5) ; 1-byte Folded Spill
	ldx	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Reload
	stx	mos8(.LBAMSectorUpdate_zp_stk+2)
	bra	.LBB4_24
.LBB4_22:
	clc
	txa
	adc	#224
	sta	mos8(.LBAMSectorUpdate_zp_stk+4)
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Spill
	tya
	sty	mos8(.LBAMSectorUpdate_zp_stk+7) ; 1-byte Folded Spill
	jsr	__mulhi3
	clc
	adc	mos8(.LBAMSectorUpdate_zp_stk)
	tay
	txa
	adc	mos8(.LBAMSectorUpdate_zp_stk+1)
	sta	__rc2
	clc
	tya
	adc	#21
.LBB4_23:
	sta	mos8(.LBAMSectorUpdate_zp_stk+2)
	lda	__rc2
	adc	#0
	sta	mos8(.LBAMSectorUpdate_zp_stk+3)
	ldx	mos8(.LBAMSectorUpdate_zp_stk+4)
	stx	__rc2
	ldx	#0
	lda	#1
	tay
	sty	mos8(.LBAMSectorUpdate_zp_stk+5) ; 1-byte Folded Spill
	jsr	__ashlhi3
	ora	(mos8(.LBAMSectorUpdate_zp_stk+2))
	sta	(mos8(.LBAMSectorUpdate_zp_stk+2))
	ldx	mos8(.LBAMSectorUpdate_zp_stk+6) ; 1-byte Folded Reload
.LBB4_24:
	lda	mos8(.LBAMSectorUpdate_zp_stk+7) ; 1-byte Folded Reload
	ldy	#6
	stz	__rc3
	sty	__rc2
	jsr	__mulhi3
	stx	__rc2
	clc
	adc	mos8(.LBAMSectorUpdate_zp_stk)
	sta	__rc4
	lda	mos8(.LBAMSectorUpdate_zp_stk+1)
	adc	__rc2
	sta	__rc5
	ldy	#16
	clc
	lda	mos8(.LBAMSectorUpdate_zp_stk+5) ; 1-byte Folded Reload
	adc	(__rc4),y
	sta	(__rc4),y
	rts
.Lfunc_end4:
	.size	BAMSectorUpdate, .Lfunc_end4-BAMSectorUpdate
                                        ; -- End function
	.section	.text.readblockchain,"ax",@progbits
	.type	readblockchain,@function        ; -- Begin function readblockchain
readblockchain:                         ; @readblockchain
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#251
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
	sta	__rc24
	stx	__rc25
	lda	__rc6
	stz	mos8(BAMsector.0)
	ldx	#22
	stx	mos8(BAMsector.0+1)
	stz	mos8(BAMsector.1)
	inx
	stx	mos8(BAMsector.1+1)
	stz	mos8(worksector.0)
	inx
	stx	mos8(worksector.0+1)
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	stz	53376
	ldx	__rc4
	bne	.LBB5_1
; %bb.9:
	jmp	.LBB5_4
.LBB5_1:
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	ldx	__rc4
	stx	__rc22
	ldx	__rc5
	stx	__rc23
	ldx	__rc7
	stx	__rc26
	stz	__rc27
.LBB5_2:                                ; =>This Inner Loop Header: Depth=1
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldx	__rc26
	stx	__rc4
	tax
	lda	__rc23
	jsr	GetOneSector
	lda	#0
	clc
	adc	__rc24
	sta	__rc4
	lda	__rc27
	adc	__rc25
	sta	__rc5
	lda	#0
	adc	__rc20
	sta	__rc6
	lda	#0
	adc	__rc21
	ldx	mos8(worksector.0)
	stx	__rc10
	ldx	mos8(worksector.0+1)
	ldy	6144
	sty	__rc28
	ldy	6145
	sty	__rc26
	sta	__rc7
	stz	__rc2
	stz	__rc3
	stz	__rc8
	ldy	#1
	sty	__rc9
	lda	__rc10
	jsr	lcopy
	lda	__rc28
	beq	.LBB5_8
; %bb.3:                                ;   in Loop: Header=BB5_2 Depth=1
	lda	__rc28
	ldx	__rc27
	inx
	stx	__rc27
	cpx	__rc22
	beq	.LBB5_5
; %bb.11:                               ;   in Loop: Header=BB5_2 Depth=1
	jmp	.LBB5_2
.LBB5_4:
	tax
	beq	.LBB5_8
.LBB5_5:
	ldx	#mos16lo(.L.str.11)
	stx	__rc2
	ldx	#mos16hi(.L.str.11)
	stx	__rc3
	ldx	#mos16lo(.L.str.12)
	stx	__rc4
	ldx	#mos16hi(.L.str.12)
	stx	__rc5
	ldx	#mos16lo(.L.str.27)
	stx	__rc6
	ldx	#mos16hi(.L.str.27)
	stx	__rc7
	jsr	messagebox
.LBB5_6:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB5_6
; %bb.7:
	stz	54800
.LBB5_8:
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
	adc	#5
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end5:
	.size	readblockchain, .Lfunc_end5-readblockchain
                                        ; -- End function
	.section	.text.findnextBAMtracksector,"ax",@progbits
	.type	findnextBAMtracksector,@function ; -- Begin function findnextBAMtracksector
findnextBAMtracksector:                 ; @findnextBAMtracksector
; %bb.0:
	sta	mos8(.LfindnextBAMtracksector_zp_stk+4)
	ldx	__rc2
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
	ldx	__rc3
	stx	mos8(.LfindnextBAMtracksector_zp_stk+1)
	ldx	__rc4
	stx	mos8(.LfindnextBAMtracksector_zp_stk+2)
	ldx	__rc5
	stx	mos8(.LfindnextBAMtracksector_zp_stk+3)
	stz	mos8(.LfindnextBAMtracksector_zp_stk+5)
	stz	mos8(BAMsector.0)
	ldx	#22
	stx	mos8(BAMsector.0+1)
	stz	mos8(BAMsector.1)
	inx
	stx	mos8(BAMsector.1+1)
	stz	mos8(worksector.0)
	inx
	stx	mos8(worksector.0+1)
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	stz	53376
	ldx	mos8(BAMsector.0)
	ldy	mos8(BAMsector.0+1)
	stx	__rc2
	sty	__rc3
	ldx	#40
	ldy	#1
	sty	__rc4
	jsr	GetOneSector
	ldx	mos8(BAMsector.0)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+10)
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc2
	sty	__rc3
	ldx	5632
	ldy	5633
	lda	mos8(BAMsector.0+1)
	sta	mos8(.LfindnextBAMtracksector_zp_stk+11)
	sty	__rc4
	lda	mos8(.LfindnextBAMtracksector_zp_stk+4)
	jsr	GetOneSector
	lda	#6
	ldy	#0
	ldx	#0
.LBB6_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_12 Depth 2
	sta	__rc2
	stz	__rc3
	sty	mos8(.LfindnextBAMtracksector_zp_stk+8)
	tya
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	mos8(.LfindnextBAMtracksector_zp_stk+10)
	clc
	adc	__rc2
	sta	mos8(.LfindnextBAMtracksector_zp_stk+6)
	lda	mos8(.LfindnextBAMtracksector_zp_stk+11)
	adc	__rc3
	sta	mos8(.LfindnextBAMtracksector_zp_stk+7)
	ldx	#0
; %bb.18:                               ;   in Loop: Header=BB6_1 Depth=1
	jmp	.LBB6_12
.LBB6_2:                                ;   in Loop: Header=BB6_12 Depth=2
	cpx	#16
	bcs	.LBB6_4
; %bb.3:                                ;   in Loop: Header=BB6_12 Depth=2
	ldy	#18
	lda	(mos8(.LfindnextBAMtracksector_zp_stk+6)),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+9)
	txa
	clc
	adc	#248
	bra	.LBB6_9
.LBB6_4:                                ;   in Loop: Header=BB6_12 Depth=2
	cpx	#24
	bcs	.LBB6_6
; %bb.5:                                ;   in Loop: Header=BB6_12 Depth=2
	ldy	#19
	lda	(mos8(.LfindnextBAMtracksector_zp_stk+6)),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+9)
	txa
	clc
	adc	#240
	bra	.LBB6_9
.LBB6_6:                                ;   in Loop: Header=BB6_12 Depth=2
	cpx	#32
	bcs	.LBB6_8
; %bb.7:                                ;   in Loop: Header=BB6_12 Depth=2
	ldy	#20
	lda	(mos8(.LfindnextBAMtracksector_zp_stk+6)),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+9)
	txa
	clc
	adc	#232
	bra	.LBB6_9
.LBB6_8:                                ;   in Loop: Header=BB6_12 Depth=2
	ldy	#21
	lda	(mos8(.LfindnextBAMtracksector_zp_stk+6)),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+9)
	txa
	clc
	adc	#224
.LBB6_9:                                ;   in Loop: Header=BB6_12 Depth=2
	sta	__rc2
.LBB6_10:                               ;   in Loop: Header=BB6_12 Depth=2
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	and	mos8(.LfindnextBAMtracksector_zp_stk+5)
	bne	.LBB6_16
; %bb.11:                               ;   in Loop: Header=BB6_12 Depth=2
	lda	mos8(.LfindnextBAMtracksector_zp_stk+9)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+9)
	inx
	cmp	#39
	bcs	.LBB6_14
.LBB6_12:                               ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cpx	#8
	bcc	.LBB6_13
; %bb.20:                               ;   in Loop: Header=BB6_12 Depth=2
	jmp	.LBB6_2
.LBB6_13:                               ;   in Loop: Header=BB6_12 Depth=2
	stx	__rc2
	ldy	#17
	lda	(mos8(.LfindnextBAMtracksector_zp_stk+6)),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+9)
	bra	.LBB6_10
.LBB6_14:                               ;   in Loop: Header=BB6_1 Depth=1
	lda	mos8(.LfindnextBAMtracksector_zp_stk+8)
	ldy	mos8(.LfindnextBAMtracksector_zp_stk+8)
	iny
	ldx	#0
	cmp	#79
	stz	mos8(.LfindnextBAMtracksector_zp_stk+5)
	lda	#6
	bcs	.LBB6_15
; %bb.22:                               ;   in Loop: Header=BB6_1 Depth=1
	jmp	.LBB6_1
.LBB6_15:
	stz	mos8(.LfindnextBAMtracksector_zp_stk+6)
	lda	#255
	bra	.LBB6_17
.LBB6_16:
	ldx	mos8(BAMsector.0)
	stx	__rc2
	ldx	mos8(BAMsector.0+1)
	stx	__rc3
	ldx	mos8(BAMsector.1)
	stx	__rc4
	ldx	mos8(BAMsector.1+1)
	stx	__rc5
	ldx	#1
	ldy	mos8(.LfindnextBAMtracksector_zp_stk+8)
	sty	mos8(.LfindnextBAMtracksector_zp_stk+5)
	inc	mos8(.LfindnextBAMtracksector_zp_stk+5)
	stx	__rc6
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+9)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+6)
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
	jsr	BAMSectorUpdate
	ldx	mos8(BAMsector.0)
	ldy	mos8(BAMsector.0+1)
	stx	__rc2
	sty	__rc3
	ldx	#40
	ldy	#1
	sty	__rc4
	lda	mos8(.LfindnextBAMtracksector_zp_stk+4)
	jsr	PutOneSector
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc2
	sty	__rc3
	ldx	5632
	ldy	5633
	sty	__rc4
	lda	mos8(.LfindnextBAMtracksector_zp_stk+4)
	jsr	PutOneSector
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
.LBB6_17:
	sta	(mos8(.LfindnextBAMtracksector_zp_stk))
	lda	mos8(.LfindnextBAMtracksector_zp_stk+6)
	sta	(mos8(.LfindnextBAMtracksector_zp_stk+2))
	rts
.Lfunc_end6:
	.size	findnextBAMtracksector, .Lfunc_end6-findnextBAMtracksector
                                        ; -- End function
	.section	.text.getdirententry,"ax",@progbits
	.type	getdirententry,@function        ; -- Begin function getdirententry
getdirententry:                         ; @getdirententry
; %bb.0:
	stx	mos8(.Lgetdirententry_zp_stk+2)
	stz	mos8(.Lgetdirententry_zp_stk+7)
	stz	mos8(BAMsector.0)
	ldx	#22
	stx	mos8(BAMsector.0+1)
	stz	mos8(BAMsector.1)
	inx
	stx	mos8(BAMsector.1+1)
	stz	mos8(worksector.0)
	inx
	stx	mos8(worksector.0+1)
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	stz	53376
	ldx	mos8(direntryblock.0)
	ldy	mos8(direntryblock.0+1)
	stx	mos8(.Lgetdirententry_zp_stk)
	stx	mos8(.Lgetdirententry_zp_stk+4)
	sty	mos8(.Lgetdirententry_zp_stk+1)
	sty	mos8(.Lgetdirententry_zp_stk+5)
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
	stx	mos8(.Lgetdirententry_zp_stk+6)
	ldx	mos8(.Lgetdirententry_zp_stk+5)
	stx	__rc5
	ldx	mos8(.Lgetdirententry_zp_stk+4)
	stx	__rc4
	lda	__rc3
	ldx	#8
	stx	mos8(.Lgetdirententry_zp_stk+12) ; 1-byte Folded Spill
	ora	#8
	sta	mos8(.Lgetdirententry_zp_stk+11)
	ldx	#32
	ldy	#0
	tya
	stz	mos8(.Lgetdirententry_zp_stk+5)
.LBB7_1:                                ; =>This Inner Loop Header: Depth=1
	lsr
	sty	mos8(.Lgetdirententry_zp_stk+4)
	sta	__rc3
	tya
	ror
	tay
	lda	#0
	ror
	lsr	__rc3
	sty	__rc6
	ror	__rc6
	ror
	lsr	__rc3
	ldy	__rc6
	sty	__rc3
	ror	__rc3
	ror
	clc
	adc	mos8(.Lgetdirententry_zp_stk+3)
	sta	__rc11
	lda	__rc3
	adc	mos8(.Lgetdirententry_zp_stk+6)
	sta	__rc10
	ldy	__rc2
	sty	mos8(.Lgetdirententry_zp_stk+10)
	lda	__rc2
	adc	#0
	sta	__rc2
	lda	mos8(.Lgetdirententry_zp_stk+11)
	adc	#0
	sta	__rc3
	ldy	__rc4
	sty	mos8(.Lgetdirententry_zp_stk+8)
	ldy	__rc5
	sty	mos8(.Lgetdirententry_zp_stk+9)
	stz	__rc6
	stz	__rc7
	stx	__rc8
	stz	__rc9
	ldx	__rc10
	lda	__rc11
	jsr	lcopy
	ldx	6659
	beq	.LBB7_10
; %bb.2:                                ;   in Loop: Header=BB7_1 Depth=1
	ldx	6656
	beq	.LBB7_4
; %bb.3:                                ;   in Loop: Header=BB7_1 Depth=1
	clc
	lda	mos8(.Lgetdirententry_zp_stk+12) ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	mos8(.Lgetdirententry_zp_stk+5)
	adc	#0
	sta	__rc3
	bra	.LBB7_5
.LBB7_4:                                ;   in Loop: Header=BB7_1 Depth=1
	ldx	mos8(.Lgetdirententry_zp_stk+12) ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lgetdirententry_zp_stk+5)
	stx	__rc3
.LBB7_5:                                ;   in Loop: Header=BB7_1 Depth=1
	ldx	mos8(.Lgetdirententry_zp_stk+8)
	stx	__rc4
	ldx	mos8(.Lgetdirententry_zp_stk+9)
	stx	__rc5
	ldx	#32
	ldy	mos8(.Lgetdirententry_zp_stk+4)
	cpy	mos8(.Lgetdirententry_zp_stk+2)
	beq	.LBB7_12
; %bb.6:                                ;   in Loop: Header=BB7_1 Depth=1
	iny
	lda	#0
	cmp	__rc3
	bne	.LBB7_8
; %bb.7:                                ;   in Loop: Header=BB7_1 Depth=1
	cpy	__rc2
	bcc	.LBB7_9
	bra	.LBB7_10
.LBB7_8:                                ;   in Loop: Header=BB7_1 Depth=1
	cmp	__rc3
	bcs	.LBB7_10
.LBB7_9:                                ;   in Loop: Header=BB7_1 Depth=1
	lda	__rc2
	sta	mos8(.Lgetdirententry_zp_stk+12) ; 1-byte Folded Spill
	lda	#0
	phy
	ldy	__rc3
	sty	mos8(.Lgetdirententry_zp_stk+5)
	stz	mos8(.Lgetdirententry_zp_stk+7)
	ldy	mos8(.Lgetdirententry_zp_stk+10)
	sty	__rc2
	ply
; %bb.13:                               ;   in Loop: Header=BB7_1 Depth=1
	jmp	.LBB7_1
.LBB7_10:
	ldx	#0
	stx	__rc2
	ldx	#0
.LBB7_11:
	stx	__rc3
	rts
.LBB7_12:
	ldx	mos8(.Lgetdirententry_zp_stk)
	stx	__rc2
	ldx	mos8(.Lgetdirententry_zp_stk+1)
	bra	.LBB7_11
.Lfunc_end7:
	.size	getdirententry, .Lfunc_end7-getdirententry
                                        ; -- End function
	.section	.text.getdirent,"ax",@progbits
	.type	getdirent,@function             ; -- Begin function getdirent
getdirent:                              ; @getdirent
; %bb.0:
	ldy	__rc20
	phy
	ldy	__rc21
	phy
	ldy	__rc22
	phy
	ldy	__rc23
	phy
	sta	__rc21
	stx	__rc20
	stz	mos8(BAMsector.0)
	ldx	#22
	stx	mos8(BAMsector.0+1)
	stz	mos8(BAMsector.1)
	inx
	stx	mos8(BAMsector.1+1)
	stz	mos8(worksector.0)
	inx
	stx	mos8(worksector.0+1)
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
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
	lda	__rc21
	sta	__rc5
	lda	#40
	sta	__rc6
	lda	#3
	sta	__rc7
	tya
	jsr	readblockchain
	ldx	#0
	stx	__rc22
	ldx	#0
	stx	__rc23
	ldx	#112
.LBB8_1:                                ; =>This Inner Loop Header: Depth=1
	stx	__rc21
	lda	__rc20
	jsr	getdirententry
	ldx	__rc3
	cpx	__rc23
	bne	.LBB8_5
; %bb.2:                                ;   in Loop: Header=BB8_1 Depth=1
	ldx	__rc2
	cpx	__rc22
	bne	.LBB8_5
; %bb.3:                                ;   in Loop: Header=BB8_1 Depth=1
	ldx	__rc21
	dex
	bne	.LBB8_1
; %bb.4:
	lda	#0
	bra	.LBB8_6
.LBB8_5:
	lda	__rc21
.LBB8_6:
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
	.size	getdirent, .Lfunc_end8-getdirent
                                        ; -- End function
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
	bne	.LBB9_2
; %bb.1:
	inc
.LBB9_2:
	cmp	#0
	bne	.LBB9_5
; %bb.3:
	cpy	__rc4
	bcs	.LBB9_6
.LBB9_4:
	inx
; %bb.10:
	jmp	.LBB9_9
.LBB9_5:
	cmp	#0
	bcc	.LBB9_4
.LBB9_6:
	ldx	mos8(g_curScreenW)
	stx	__rc2
	stx	mos8(.Lcputln_zp_stk)           ; 1-byte Folded Spill
	ldx	#0
	stz	__rc3
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
	bcs	.LBB9_8
; %bb.7:
	ldx	#0
.LBB9_8:
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
	stx	mos8(.Lcputln_zp_stk+1)         ; 1-byte Folded Spill
	ldx	mos8(.Lcputln_zp_stk+2)         ; 1-byte Folded Reload
	stx	__rc9
	ldx	#0
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
.LBB9_9:
	stz	mos8(g_curX)
	stx	mos8(g_curY)
	rts
.Lfunc_end9:
	.size	cputln, .Lfunc_end9-cputln
                                        ; -- End function
	.section	.text.csputdec,"ax",@progbits
	.type	csputdec,@function              ; -- Begin function csputdec
csputdec:                               ; @csputdec
; %bb.0:
	tay
	txa
	ldx	__rc4
	stx	mos8(.Lcsputdec_zp_stk)
	ldx	__rc2
	stx	mos8(.Lcsputdec_zp_stk+4)
	ldx	__rc3
	stx	mos8(.Lcsputdec_zp_stk+5)
	stz	mos8(.Lcsputdec_zp_stk+17)
	ldx	#9
.LBB10_1:                               ; =>This Inner Loop Header: Depth=1
	stx	mos8(.Lcsputdec_zp_stk+6)
	sta	mos8(.Lcsputdec_zp_stk+3)
	lda	#mos8(.Lcsputdec_zp_stk+18)
	sta	__rc8
	lda	#mos8(0)
	sta	__rc9
	lda	#10
	sta	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	stx	mos8(.Lcsputdec_zp_stk+1)
	ldx	mos8(.Lcsputdec_zp_stk+3)
	tya
	sty	mos8(.Lcsputdec_zp_stk+2)
	jsr	__udivmodsi4
	sta	__rc4
	lda	#48
	ora	mos8(.Lcsputdec_zp_stk+18)
	ldy	mos8(.Lcsputdec_zp_stk+6)
	sta	mos8(.Lcsputdec_zp_stk+7),y
	dec	mos8(.Lcsputdec_zp_stk+1)
	lda	mos8(.Lcsputdec_zp_stk+5)
	bne	.LBB10_5
; %bb.2:                                ;   in Loop: Header=BB10_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+4)
	bne	.LBB10_6
; %bb.3:                                ;   in Loop: Header=BB10_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+3)
	bne	.LBB10_7
; %bb.4:                                ;   in Loop: Header=BB10_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+2)
	cmp	#10
	bra	.LBB10_8
.LBB10_5:                               ;   in Loop: Header=BB10_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+5)
	bra	.LBB10_7
.LBB10_6:                               ;   in Loop: Header=BB10_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+4)
.LBB10_7:                               ;   in Loop: Header=BB10_1 Depth=1
	cmp	#0
.LBB10_8:                               ;   in Loop: Header=BB10_1 Depth=1
	ldy	__rc4
	txa
	ldx	__rc2
	stx	mos8(.Lcsputdec_zp_stk+4)
	ldx	__rc3
	stx	mos8(.Lcsputdec_zp_stk+5)
	ldx	mos8(.Lcsputdec_zp_stk+1)
	bcs	.LBB10_1
; %bb.9:
	stz	__rc3
	txa
	beq	.LBB10_18
; %bb.10:
	sec
	lda	#10
	sbc	mos8(.Lcsputdec_zp_stk)
	sta	__rc3
	lda	#0
	sbc	#0
.LBB10_11:                              ; =>This Inner Loop Header: Depth=1
	stx	__rc2
	ldy	__rc3
	cpy	__rc2
	tay
	sbc	#0
	bvc	.LBB10_13
; %bb.12:                               ;   in Loop: Header=BB10_11 Depth=1
	eor	#128
.LBB10_13:                              ;   in Loop: Header=BB10_11 Depth=1
	cmp	#0
	bpl	.LBB10_16
; %bb.14:                               ;   in Loop: Header=BB10_11 Depth=1
	lda	#32
	sta	mos8(.Lcsputdec_zp_stk+7),x
	dex
	tya
	cpx	#0
	bne	.LBB10_11
; %bb.15:
	ldx	#0
.LBB10_16:
	stz	__rc3
	inx
	bne	.LBB10_19
; %bb.17:
	inc	__rc3
	bra	.LBB10_19
.LBB10_18:
	ldx	#1
.LBB10_19:
	stx	__rc2
	lda	#mos8(.Lcsputdec_zp_stk+7)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos8(0)
	adc	__rc3
	sta	__rc3
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end10:
	.size	csputdec, .Lfunc_end10-csputdec
                                        ; -- End function
	.section	.text.asciitoscreencode_s,"ax",@progbits
	.type	asciitoscreencode_s,@function   ; -- Begin function asciitoscreencode_s
asciitoscreencode_s:                    ; @asciitoscreencode_s
; %bb.0:
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
	bra	.LBB11_8
.LBB11_1:                               ;   in Loop: Header=BB11_8 Depth=1
	cmp	#96
	bcc	.LBB11_3
; %bb.2:                                ;   in Loop: Header=BB11_8 Depth=1
	clc
	adc	#160
	bra	.LBB11_5
.LBB11_3:                               ;   in Loop: Header=BB11_8 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB11_5
; %bb.4:                                ;   in Loop: Header=BB11_8 Depth=1
	lda	.Lswitch.table.asciitoscreencode_s,x
.LBB11_5:                               ;   in Loop: Header=BB11_8 Depth=1
	sta	(__rc4)
	inc	__rc4
	bne	.LBB11_7
; %bb.6:                                ;   in Loop: Header=BB11_8 Depth=1
	inc	__rc5
.LBB11_7:                               ;   in Loop: Header=BB11_8 Depth=1
	tax
	beq	.LBB11_12
.LBB11_8:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB11_10
; %bb.9:                                ;   in Loop: Header=BB11_8 Depth=1
	inc	__rc3
.LBB11_10:                              ;   in Loop: Header=BB11_8 Depth=1
	cmp	#192
	bcc	.LBB11_1
; %bb.11:                               ;   in Loop: Header=BB11_8 Depth=1
	eor	#128
	bra	.LBB11_5
.LBB11_12:
	ldx	820
	beq	.LBB11_14
; %bb.13:
	rts
.LBB11_14:
	ldx	#32
	stx	820
	stz	821
	rts
.Lfunc_end11:
	.size	asciitoscreencode_s, .Lfunc_end11-asciitoscreencode_s
                                        ; -- End function
	.section	.text.clrhome,"ax",@progbits
	.type	clrhome,@function               ; -- Begin function clrhome
clrhome:                                ; @clrhome
; %bb.0:
	ldx	#mos8(dmalist)
	stx	__rc2
	ldx	#mos8(0)
	stx	__rc3
	ldx	__rc2
	stx	mos8(.Lclrhome_zp_stk)          ; 1-byte Folded Spill
	ldx	mos8(g_curScreenW)
	lda	mos8(g_curScreenH)
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
	sta	mos8(.Lclrhome_zp_stk+1)        ; 1-byte Folded Spill
	stx	__rc6
	stx	mos8(.Lclrhome_zp_stk+2)        ; 1-byte Folded Spill
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
	ldy	mos8(.Lclrhome_zp_stk+1)        ; 1-byte Folded Reload
	sty	mos8(dmalist+9)
	ldy	mos8(.Lclrhome_zp_stk+2)        ; 1-byte Folded Reload
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
	ldx	mos8(.Lclrhome_zp_stk)          ; 1-byte Folded Reload
	stx	55045
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	rts
.Lfunc_end12:
	.size	clrhome, .Lfunc_end12-clrhome
                                        ; -- End function
	.section	.text.mprintf,"ax",@progbits
	.type	mprintf,@function               ; -- Begin function mprintf
mprintf:                                ; @mprintf
; %bb.0:
	sta	mos8(.Lmprintf_zp_stk)          ; 1-byte Folded Spill
	stx	.Lmprintf_sstk                  ; 1-byte Folded Spill
	ldx	__rc2
	stx	.Lmprintf_sstk+1                ; 1-byte Folded Spill
	ldx	__rc3
	stx	.Lmprintf_sstk+2                ; 1-byte Folded Spill
	ldx	#mos16lo(.L.str.25)
	stx	__rc2
	ldx	#mos16hi(.L.str.25)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	jsr	cputsxy
	stz	__rc4
	ldx	.Lmprintf_sstk+1                ; 1-byte Folded Reload
	stx	__rc2
	ldx	.Lmprintf_sstk+2                ; 1-byte Folded Reload
	stx	__rc3
	ldx	.Lmprintf_sstk                  ; 1-byte Folded Reload
	lda	mos8(.Lmprintf_zp_stk)          ; 1-byte Folded Reload
	jmp	csputdec
.Lfunc_end13:
	.size	mprintf, .Lfunc_end13-mprintf
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
	sta	__rc22
	stx	__rc23
	ldx	__rc3
	ldy	__rc4
	sty	__rc20
	sec
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	ldy	__rc2
	sty	__rc25
	lda	__rc2
	sbc	__rc22
	sta	__rc26
	stx	__rc27
	cpx	__rc23
	bcs	.LBB14_1
; %bb.18:
	jmp	.LBB14_3
.LBB14_1:
	ldx	__rc23
	stx	__rc21
.LBB14_2:                               ; =>This Inner Loop Header: Depth=1
	lda	mos8(g_curScreenW)
	ldx	__rc21
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	__rc22
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
	bcc	.LBB14_3
; %bb.20:                               ;   in Loop: Header=BB14_2 Depth=1
	jmp	.LBB14_2
.LBB14_3:
	ldx	#112
	stx	__rc2
	ldx	__rc23
	lda	__rc22
	jsr	cputcxy
	ldx	#109
	stx	__rc2
	ldx	__rc27
	lda	__rc22
	jsr	cputcxy
	ldx	#110
	stx	__rc2
	ldx	__rc23
	ldy	__rc25
	sty	__rc24
	lda	__rc25
	jsr	cputcxy
	ldx	#125
	stx	__rc2
	ldx	__rc27
	lda	__rc25
	jsr	cputcxy
	ldx	__rc26
	cpx	#2
	bcc	.LBB14_6
; %bb.4:
	ldy	__rc22
	iny
.LBB14_5:                               ; =>This Inner Loop Header: Depth=1
	ldx	#64
	stx	__rc2
	ldx	__rc23
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
	cpy	__rc24
	bne	.LBB14_5
.LBB14_6:
	ldx	__rc23
	stx	__rc21
	inc	__rc21
	ldx	__rc21
.LBB14_7:                               ; =>This Inner Loop Header: Depth=1
	ldy	#93
	sty	__rc2
	stx	__rc23
	lda	__rc22
	jsr	cputcxy
	ldx	#93
	stx	__rc2
	ldx	__rc23
	lda	__rc25
	jsr	cputcxy
	ldx	__rc23
	inx
	cpx	__rc27
	bne	.LBB14_7
; %bb.8:
	lda	__rc20
	bne	.LBB14_9
; %bb.22:
	jmp	.LBB14_17
.LBB14_9:
	ldy	__rc27
	cpy	mos8(g_curScreenH)
	bcc	.LBB14_10
; %bb.24:
	jmp	.LBB14_17
.LBB14_10:
	ldx	mos8(g_curScreenW)
	stx	__rc2
	ldx	__rc25
	cpx	__rc2
	bcc	.LBB14_11
; %bb.26:
	jmp	.LBB14_17
.LBB14_11:
	stz	__rc3
	ldx	#0
	iny
	bne	.LBB14_13
; %bb.12:
	inx
.LBB14_13:
	stx	__rc24
	sty	__rc23
	tya
	jsr	__mulhi3
	stx	__rc2
	stz	__rc20
	clc
	adc	__rc22
	tay
	lda	#0
	adc	__rc2
	sta	__rc2
	lda	#0
	adc	#0
	tax
	lda	#0
	adc	#0
	sta	__rc3
	clc
	tya
	adc	#1
	tay
	lda	__rc2
	adc	#0
	sta	__rc7
	txa
	adc	#248
	sta	__rc2
	lda	__rc3
	adc	#15
	ldx	#11
	sta	__rc3
	lda	__rc26
	sta	__rc5
	stx	__rc4
	stz	__rc6
	ldx	__rc7
	tya
	jsr	lfill
	ldx	__rc25
	stx	__rc22
	inc	__rc22
.LBB14_14:                              ; =>This Inner Loop Header: Depth=1
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
	ldx	__rc24
	bne	.LBB14_16
; %bb.15:                               ;   in Loop: Header=BB14_14 Depth=1
	ldx	__rc23
	cpx	__rc21
	bcs	.LBB14_14
	bra	.LBB14_17
.LBB14_16:                              ;   in Loop: Header=BB14_14 Depth=1
	cpx	#0
	bcs	.LBB14_14
.LBB14_17:
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
.Lfunc_end14:
	.size	mcbox, .Lfunc_end14-mcbox
                                        ; -- End function
	.section	.text.messagebox,"ax",@progbits
	.type	messagebox,@function            ; -- Begin function messagebox
messagebox:                             ; @messagebox
; %bb.0:
	clc
	lda	__rc0
	adc	#254
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
	ldy	#1
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc25
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc2
	stx	__rc24
	ldx	__rc3
	stx	__rc25
	ldx	__rc4
	stx	__rc22
	ldx	__rc5
	stx	__rc23
	ldx	__rc6
	stx	__rc20
	ldx	__rc7
	stx	__rc21
	ldx	#70
	lda	#12
	iny
	stx	__rc2
	sty	__rc4
	sta	__rc3
	ldx	#4
	lda	#10
	jsr	mcbox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.34)
	stx	__rc2
	ldx	#mos16hi(.L.str.34)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	#14
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	inx
	jsr	cputsxy
	ldx	#mos16lo(.L.str.1.35)
	stx	__rc2
	ldx	#mos16hi(.L.str.1.35)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	#40
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	inx
	jsr	cputsxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	__rc24
	stx	__rc2
	ldx	__rc25
	stx	__rc3
	jsr	asciitoscreencode_s
	ldx	#6
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	lda	#12
	jsr	cputsxy
	ldx	__rc22
	stx	__rc2
	ldx	__rc23
	stx	__rc3
	jsr	asciitoscreencode_s
	ldx	#7
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	lda	#12
	jsr	cputsxy
	ldx	__rc20
	stx	__rc2
	ldx	__rc21
	stx	__rc3
	jsr	asciitoscreencode_s
	ldx	#8
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	lda	#12
	jsr	cputsxy
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.2.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.2.36)
	stx	__rc3
	jsr	asciitoscreencode_s
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldx	#10
	lda	#12
	jsr	cputsxy
	ldx	#mos16lo(.L.str.3.37)
	stx	__rc2
	ldx	#mos16hi(.L.str.3.37)
	stx	__rc3
	jsr	asciitoscreencode_s
	lda	#60
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldx	#10
	jsr	cputsxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
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
.Lfunc_end15:
	.size	messagebox, .Lfunc_end15-messagebox
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end16:
	.size	escNOP, .Lfunc_end16-escNOP
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
	bne	.LBB17_2
; %bb.1:
	dec	__rc20
.LBB17_2:
	lda	__rc20
	bne	.LBB17_5
; %bb.3:
	ldy	__rc23
	cpx	__rc22
	bne	.LBB17_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB17_7
.LBB17_5:
	ldy	__rc23
.LBB17_6:
	ldx	__rc22
	inx
.LBB17_7:
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
.Lfunc_end17:
	.size	cputcxy, .Lfunc_end17-cputcxy
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
.Lfunc_end18:
	.size	cputsxy, .Lfunc_end18-cputsxy
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
.Lfunc_end19:
	.size	lcopy, .Lfunc_end19-lcopy
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
.Lfunc_end20:
	.size	lfill, .Lfunc_end20-lfill
                                        ; -- End function
	.section	.text.strcpy,"ax",@progbits
	.type	strcpy,@function                ; -- Begin function strcpy
strcpy:                                 ; @strcpy
; %bb.0:
	lda	(__rc4)
	sta	(__rc2)
	lda	(__rc4)
	beq	.LBB21_7
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
.LBB21_2:                               ; =>This Inner Loop Header: Depth=1
	inc	__rc8
	bne	.LBB21_4
; %bb.3:                                ;   in Loop: Header=BB21_2 Depth=1
	inc	__rc9
.LBB21_4:                               ;   in Loop: Header=BB21_2 Depth=1
	lda	(__rc4),y
	sta	(__rc6),y
	lda	(__rc4),y
	inc	__rc6
	bne	.LBB21_6
; %bb.5:                                ;   in Loop: Header=BB21_2 Depth=1
	inc	__rc7
.LBB21_6:                               ;   in Loop: Header=BB21_2 Depth=1
	ldx	__rc8
	stx	__rc4
	ldx	__rc9
	stx	__rc5
	tax
	bne	.LBB21_2
.LBB21_7:
	rts
.Lfunc_end21:
	.size	strcpy, .Lfunc_end21-strcpy
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB22_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB22_4
; %bb.3:                                ;   in Loop: Header=BB22_2 Depth=1
	inx
.LBB22_4:                               ;   in Loop: Header=BB22_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB22_2
	bra	.LBB22_6
.LBB22_5:
	stz	__rc4
	ldx	#0
.LBB22_6:
	lda	__rc4
	rts
.Lfunc_end22:
	.size	strlen, .Lfunc_end22-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB23_2
.LBB23_1:                               ;   in Loop: Header=BB23_2 Depth=1
	dex
	asl
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB23_1
; %bb.3:
	rts
.Lfunc_end23:
	.size	__ashlqi3, .Lfunc_end23-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB24_3
; %bb.1:
	ldx	__rc2
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB24_2
.LBB24_3:
	ldx	__rc3
	rts
.Lfunc_end24:
	.size	__ashlhi3, .Lfunc_end24-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB25_3
; %bb.1:
	ldx	__rc4
.LBB25_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB25_2
.LBB25_3:
	ldx	__rc5
	rts
.Lfunc_end25:
	.size	__ashlsi3, .Lfunc_end25-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB26_3
; %bb.1:
	ldx	__rc8
.LBB26_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB26_2
.LBB26_3:
	ldx	__rc9
	rts
.Lfunc_end26:
	.size	__ashldi3, .Lfunc_end26-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB27_2
.LBB27_1:                               ;   in Loop: Header=BB27_2 Depth=1
	dex
	lsr
.LBB27_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB27_1
; %bb.3:
	rts
.Lfunc_end27:
	.size	__lshrqi3, .Lfunc_end27-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB28_3
; %bb.1:
	ldx	__rc2
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB28_2
.LBB28_3:
	ldx	__rc3
	rts
.Lfunc_end28:
	.size	__lshrhi3, .Lfunc_end28-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB29_3
; %bb.1:
	ldx	__rc4
.LBB29_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB29_2
.LBB29_3:
	ldx	__rc5
	rts
.Lfunc_end29:
	.size	__lshrsi3, .Lfunc_end29-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB30_3
; %bb.1:
	ldx	__rc8
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB30_2
.LBB30_3:
	ldx	__rc9
	rts
.Lfunc_end30:
	.size	__lshrdi3, .Lfunc_end30-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB31_2
.LBB31_1:                               ;   in Loop: Header=BB31_2 Depth=1
	dex
	cmp	#128
	ror
.LBB31_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB31_1
; %bb.3:
	rts
.Lfunc_end31:
	.size	__ashrqi3, .Lfunc_end31-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB32_3
; %bb.1:
	ldx	__rc2
.LBB32_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB32_2
.LBB32_3:
	tax
	lda	__rc3
	rts
.Lfunc_end32:
	.size	__ashrhi3, .Lfunc_end32-__ashrhi3
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
	beq	.LBB33_3
; %bb.1:
	ldx	__rc4
.LBB33_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB33_2
.LBB33_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end33:
	.size	__ashrsi3, .Lfunc_end33-__ashrsi3
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
	beq	.LBB34_3
; %bb.1:
	ldx	__rc8
.LBB34_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB34_2
.LBB34_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end34:
	.size	__ashrdi3, .Lfunc_end34-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB35_2
.LBB35_1:                               ;   in Loop: Header=BB35_2 Depth=1
	dex
	cmp	#128
	rol
.LBB35_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB35_1
; %bb.3:
	rts
.Lfunc_end35:
	.size	__rotlqi3, .Lfunc_end35-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB36_3
; %bb.1:
	ldx	__rc2
.LBB36_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB36_2
.LBB36_3:
	tax
	lda	__rc3
	rts
.Lfunc_end36:
	.size	__rotlhi3, .Lfunc_end36-__rotlhi3
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
	beq	.LBB37_3
; %bb.1:
	ldx	__rc4
.LBB37_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB37_2
.LBB37_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end37:
	.size	__rotlsi3, .Lfunc_end37-__rotlsi3
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
	beq	.LBB38_3
; %bb.1:
	ldx	__rc8
.LBB38_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB38_2
.LBB38_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end38:
	.size	__rotldi3, .Lfunc_end38-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB39_2
.LBB39_1:                               ;   in Loop: Header=BB39_2 Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror
.LBB39_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB39_1
; %bb.3:
	rts
.Lfunc_end39:
	.size	__rotrqi3, .Lfunc_end39-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB40_3
; %bb.1:
	ldx	__rc2
.LBB40_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB40_2
.LBB40_3:
	ldx	__rc3
	rts
.Lfunc_end40:
	.size	__rotrhi3, .Lfunc_end40-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB41_3
; %bb.1:
	ldx	__rc4
.LBB41_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	lsr	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB41_2
.LBB41_3:
	ldx	__rc5
	rts
.Lfunc_end41:
	.size	__rotrsi3, .Lfunc_end41-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB42_3
; %bb.1:
	ldx	__rc8
.LBB42_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB42_2
.LBB42_3:
	ldx	__rc9
	rts
.Lfunc_end42:
	.size	__rotrdi3, .Lfunc_end42-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB43_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB43_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB43_4
; %bb.3:                                ;   in Loop: Header=BB43_2 Depth=1
	clc
	adc	__rc2
.LBB43_4:                               ;   in Loop: Header=BB43_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB43_2
; %bb.5:
	rts
.LBB43_6:
	lda	#0
	rts
.Lfunc_end43:
	.size	__mulqi3, .Lfunc_end43-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB44_2
; %bb.1:
	ldy	__rc2
	beq	.LBB44_7
.LBB44_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB44_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB44_5
; %bb.4:                                ;   in Loop: Header=BB44_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB44_5:                               ;   in Loop: Header=BB44_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB44_3
; %bb.6:                                ;   in Loop: Header=BB44_3 Depth=1
	ldx	__rc2
	bne	.LBB44_3
	bra	.LBB44_8
.LBB44_7:
	ldy	#0
	tya
.LBB44_8:
	tax
	tya
	rts
.Lfunc_end44:
	.size	__mulhi3, .Lfunc_end44-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB45_4
; %bb.1:
	ldy	__rc6
	bne	.LBB45_4
; %bb.2:
	ldy	__rc5
	bne	.LBB45_4
; %bb.3:
	ldy	__rc4
	bne	.LBB45_4
; %bb.13:
	jmp	.LBB45_12
.LBB45_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB45_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB45_7
; %bb.6:                                ;   in Loop: Header=BB45_5 Depth=1
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
.LBB45_7:                               ;   in Loop: Header=BB45_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB45_5
; %bb.8:                                ;   in Loop: Header=BB45_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB45_5
; %bb.9:                                ;   in Loop: Header=BB45_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB45_5
; %bb.10:                               ;   in Loop: Header=BB45_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB45_5
.LBB45_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB45_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB45_11
.Lfunc_end45:
	.size	__mulsi3, .Lfunc_end45-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB46_8
; %bb.1:
	ldy	__rc14
	bne	.LBB46_8
; %bb.2:
	ldy	__rc13
	bne	.LBB46_8
; %bb.3:
	ldy	__rc12
	bne	.LBB46_8
; %bb.4:
	ldy	__rc11
	bne	.LBB46_8
; %bb.5:
	ldy	__rc10
	bne	.LBB46_8
; %bb.6:
	ldy	__rc9
	bne	.LBB46_8
; %bb.7:
	ldy	__rc8
	bne	.LBB46_8
; %bb.21:
	jmp	.LBB46_20
.LBB46_8:
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
.LBB46_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB46_11
; %bb.10:                               ;   in Loop: Header=BB46_9 Depth=1
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
.LBB46_11:                              ;   in Loop: Header=BB46_9 Depth=1
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
	beq	.LBB46_12
; %bb.23:                               ;   in Loop: Header=BB46_9 Depth=1
	jmp	.LBB46_9
.LBB46_12:                              ;   in Loop: Header=BB46_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB46_13
; %bb.25:                               ;   in Loop: Header=BB46_9 Depth=1
	jmp	.LBB46_9
.LBB46_13:                              ;   in Loop: Header=BB46_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB46_14
; %bb.27:                               ;   in Loop: Header=BB46_9 Depth=1
	jmp	.LBB46_9
.LBB46_14:                              ;   in Loop: Header=BB46_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB46_15
; %bb.29:                               ;   in Loop: Header=BB46_9 Depth=1
	jmp	.LBB46_9
.LBB46_15:                              ;   in Loop: Header=BB46_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB46_16
; %bb.31:                               ;   in Loop: Header=BB46_9 Depth=1
	jmp	.LBB46_9
.LBB46_16:                              ;   in Loop: Header=BB46_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB46_17
; %bb.33:                               ;   in Loop: Header=BB46_9 Depth=1
	jmp	.LBB46_9
.LBB46_17:                              ;   in Loop: Header=BB46_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB46_18
; %bb.35:                               ;   in Loop: Header=BB46_9 Depth=1
	jmp	.LBB46_9
.LBB46_18:                              ;   in Loop: Header=BB46_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB46_19
; %bb.37:                               ;   in Loop: Header=BB46_9 Depth=1
	jmp	.LBB46_9
.LBB46_19:
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
.LBB46_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB46_19
.Lfunc_end46:
	.size	__muldi3, .Lfunc_end46-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB47_1
; %bb.15:
	jmp	.LBB47_14
.LBB47_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB47_2
; %bb.17:
	jmp	.LBB47_14
.LBB47_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB47_3
; %bb.19:
	jmp	.LBB47_14
.LBB47_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB47_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB47_6
; %bb.5:                                ;   in Loop: Header=BB47_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB47_8
	bra	.LBB47_7
.LBB47_6:                               ;   in Loop: Header=BB47_4 Depth=1
	cpy	__rc4
	bcc	.LBB47_8
.LBB47_7:                               ;   in Loop: Header=BB47_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB47_4
	bra	.LBB47_9
.LBB47_8:
	ldy	__rc3
	sty	__rc2
.LBB47_9:
	cpx	#0
	beq	.LBB47_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB47_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB47_13
; %bb.12:                               ;   in Loop: Header=BB47_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB47_13:                              ;   in Loop: Header=BB47_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB47_11
.LBB47_14:
	rts
.Lfunc_end47:
	.size	__udivqi3, .Lfunc_end47-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB48_2
; %bb.1:
	ldy	__rc2
	beq	.LBB48_4
.LBB48_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB48_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB48_6
.LBB48_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB48_22
.LBB48_5:
	cmp	__rc3
	bcc	.LBB48_4
.LBB48_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB48_7
; %bb.25:
	jmp	.LBB48_22
.LBB48_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB48_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB48_10
; %bb.9:                                ;   in Loop: Header=BB48_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB48_12
	bra	.LBB48_11
.LBB48_10:                              ;   in Loop: Header=BB48_8 Depth=1
	cmp	__rc6
	bcc	.LBB48_12
.LBB48_11:                              ;   in Loop: Header=BB48_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB48_8
	bra	.LBB48_13
.LBB48_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB48_13:
	cpx	#0
	bne	.LBB48_14
; %bb.27:
	jmp	.LBB48_22
.LBB48_14:
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
.LBB48_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB48_17
; %bb.16:                               ;   in Loop: Header=BB48_15 Depth=1
	ldy	#0
.LBB48_17:                              ;   in Loop: Header=BB48_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB48_21
; %bb.18:                               ;   in Loop: Header=BB48_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB48_20
.LBB48_19:                              ;   in Loop: Header=BB48_15 Depth=1
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
.LBB48_20:                              ;   in Loop: Header=BB48_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB48_15
	bra	.LBB48_22
.LBB48_21:                              ;   in Loop: Header=BB48_15 Depth=1
	cmp	__rc6
	bcs	.LBB48_19
	bra	.LBB48_20
.LBB48_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end48:
	.size	__udivhi3, .Lfunc_end48-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
	ldy	__rc7
	bne	.LBB49_4
; %bb.1:
	ldy	__rc6
	bne	.LBB49_4
; %bb.2:
	ldy	__rc5
	bne	.LBB49_4
; %bb.3:
	ldy	__rc4
	beq	.LBB49_9
.LBB49_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB49_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB49_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB49_7
; %bb.45:
	jmp	.LBB49_38
.LBB49_7:
	cmp	__rc4
	bcc	.LBB49_9
	bra	.LBB49_11
.LBB49_8:
	cpx	__rc7
	bcs	.LBB49_11
.LBB49_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB49_21
.LBB49_10:
	cpx	__rc6
	bcc	.LBB49_9
.LBB49_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB49_12
; %bb.47:
	jmp	.LBB49_21
.LBB49_12:
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
.LBB49_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB49_17
; %bb.14:                               ;   in Loop: Header=BB49_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB49_18
; %bb.15:                               ;   in Loop: Header=BB49_13 Depth=1
	cmp	__rc10
	bne	.LBB49_19
; %bb.16:                               ;   in Loop: Header=BB49_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB49_23
	bra	.LBB49_20
.LBB49_17:                              ;   in Loop: Header=BB49_13 Depth=1
	cpy	__rc12
	bcc	.LBB49_23
	bra	.LBB49_20
.LBB49_18:                              ;   in Loop: Header=BB49_13 Depth=1
	cpy	__rc11
	bcc	.LBB49_23
	bra	.LBB49_20
.LBB49_19:                              ;   in Loop: Header=BB49_13 Depth=1
	cmp	__rc10
	bcc	.LBB49_23
.LBB49_20:                              ;   in Loop: Header=BB49_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB49_13
	bra	.LBB49_24
.LBB49_21:
	stz	__rc2
	stz	__rc3
.LBB49_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB49_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB49_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB49_22
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
.LBB49_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB49_28
; %bb.27:                               ;   in Loop: Header=BB49_26 Depth=1
	ldy	#0
.LBB49_28:                              ;   in Loop: Header=BB49_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB49_32
; %bb.29:                               ;   in Loop: Header=BB49_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB49_34
; %bb.30:                               ;   in Loop: Header=BB49_26 Depth=1
	cmp	__rc10
	bne	.LBB49_37
; %bb.31:                               ;   in Loop: Header=BB49_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB49_33
	bra	.LBB49_35
.LBB49_32:                              ;   in Loop: Header=BB49_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB49_35
.LBB49_33:                              ;   in Loop: Header=BB49_26 Depth=1
	lda	__rc6
	bra	.LBB49_36
.LBB49_34:                              ;   in Loop: Header=BB49_26 Depth=1
	cpy	__rc11
	bcc	.LBB49_33
.LBB49_35:                              ;   in Loop: Header=BB49_26 Depth=1
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
.LBB49_36:                              ;   in Loop: Header=BB49_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB49_41
; %bb.49:                               ;   in Loop: Header=BB49_26 Depth=1
	jmp	.LBB49_26
.LBB49_41:
	jmp	.LBB49_22
.LBB49_37:                              ;   in Loop: Header=BB49_26 Depth=1
	cmp	__rc10
	bcc	.LBB49_33
	bra	.LBB49_35
.LBB49_38:
	cpx	__rc5
	bcs	.LBB49_43
; %bb.51:
	jmp	.LBB49_9
.LBB49_43:
	jmp	.LBB49_11
.Lfunc_end49:
	.size	__udivsi3, .Lfunc_end49-__udivsi3
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
	bne	.LBB50_8
; %bb.1:
	ldx	__rc14
	bne	.LBB50_8
; %bb.2:
	ldx	__rc13
	bne	.LBB50_8
; %bb.3:
	ldx	__rc12
	bne	.LBB50_8
; %bb.4:
	ldx	__rc11
	bne	.LBB50_8
; %bb.5:
	ldx	__rc10
	bne	.LBB50_8
; %bb.6:
	ldx	__rc9
	bne	.LBB50_8
; %bb.7:
	ldx	__rc8
	beq	.LBB50_17
.LBB50_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB50_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB50_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB50_11
; %bb.90:
	jmp	.LBB50_31
.LBB50_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB50_12
; %bb.92:
	jmp	.LBB50_32
.LBB50_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB50_13
; %bb.94:
	jmp	.LBB50_38
.LBB50_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB50_14
; %bb.96:
	jmp	.LBB50_40
.LBB50_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB50_15
; %bb.98:
	jmp	.LBB50_42
.LBB50_15:
	cmp	__rc8
	bcc	.LBB50_17
	bra	.LBB50_19
.LBB50_16:
	cpx	__rc15
	bcs	.LBB50_19
.LBB50_17:
	lda	#0
; %bb.66:
	jmp	.LBB50_29
.LBB50_18:
	cpx	__rc14
	bcc	.LBB50_17
.LBB50_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB50_20
; %bb.100:
	jmp	.LBB50_29
.LBB50_20:
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
.LBB50_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB50_25
; %bb.22:                               ;   in Loop: Header=BB50_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB50_26
; %bb.23:                               ;   in Loop: Header=BB50_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB50_27
; %bb.24:                               ;   in Loop: Header=BB50_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB50_102
; %bb.150:                              ;   in Loop: Header=BB50_21 Depth=1
	jmp	.LBB50_33
.LBB50_102:                             ;   in Loop: Header=BB50_21 Depth=1
	jmp	.LBB50_37
.LBB50_25:                              ;   in Loop: Header=BB50_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB50_28
; %bb.104:
	jmp	.LBB50_44
.LBB50_26:                              ;   in Loop: Header=BB50_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB50_28
; %bb.106:
	jmp	.LBB50_44
.LBB50_27:                              ;   in Loop: Header=BB50_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB50_28
; %bb.108:
	jmp	.LBB50_44
.LBB50_28:                              ;   in Loop: Header=BB50_21 Depth=1
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
	bmi	.LBB50_68
; %bb.110:                              ;   in Loop: Header=BB50_21 Depth=1
	jmp	.LBB50_21
.LBB50_68:
	jmp	.LBB50_45
.LBB50_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB50_30:
	ldx	__rc18
	rts
.LBB50_31:
	cpx	__rc13
	bcs	.LBB50_70
; %bb.112:
	jmp	.LBB50_17
.LBB50_70:
	jmp	.LBB50_19
.LBB50_32:
	cpx	__rc12
	bcs	.LBB50_72
; %bb.114:
	jmp	.LBB50_17
.LBB50_72:
	jmp	.LBB50_19
.LBB50_33:                              ;   in Loop: Header=BB50_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB50_39
; %bb.34:                               ;   in Loop: Header=BB50_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB50_41
; %bb.35:                               ;   in Loop: Header=BB50_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB50_43
; %bb.36:                               ;   in Loop: Header=BB50_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB50_44
; %bb.74:                               ;   in Loop: Header=BB50_21 Depth=1
	jmp	.LBB50_28
.LBB50_37:                              ;   in Loop: Header=BB50_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB50_44
; %bb.76:                               ;   in Loop: Header=BB50_21 Depth=1
	jmp	.LBB50_28
.LBB50_38:
	cpx	__rc11
	bcs	.LBB50_78
; %bb.116:
	jmp	.LBB50_17
.LBB50_78:
	jmp	.LBB50_19
.LBB50_39:                              ;   in Loop: Header=BB50_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB50_44
; %bb.80:                               ;   in Loop: Header=BB50_21 Depth=1
	jmp	.LBB50_28
.LBB50_40:
	cpx	__rc10
	bcs	.LBB50_82
; %bb.118:
	jmp	.LBB50_17
.LBB50_82:
	jmp	.LBB50_19
.LBB50_41:                              ;   in Loop: Header=BB50_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB50_44
; %bb.84:                               ;   in Loop: Header=BB50_21 Depth=1
	jmp	.LBB50_28
.LBB50_42:
	cpx	__rc9
	bcs	.LBB50_86
; %bb.120:
	jmp	.LBB50_17
.LBB50_86:
	jmp	.LBB50_19
.LBB50_43:                              ;   in Loop: Header=BB50_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB50_44
; %bb.122:                              ;   in Loop: Header=BB50_21 Depth=1
	jmp	.LBB50_28
.LBB50_44:
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
.LBB50_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB50_46
; %bb.124:
	jmp	.LBB50_30
.LBB50_46:
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
.LBB50_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB50_49
; %bb.48:                               ;   in Loop: Header=BB50_47 Depth=1
	ldy	#0
.LBB50_49:                              ;   in Loop: Header=BB50_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB50_57
; %bb.50:                               ;   in Loop: Header=BB50_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB50_51
; %bb.126:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_60
.LBB50_51:                              ;   in Loop: Header=BB50_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB50_52
; %bb.128:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_61
.LBB50_52:                              ;   in Loop: Header=BB50_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB50_53
; %bb.130:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_62
.LBB50_53:                              ;   in Loop: Header=BB50_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB50_54
; %bb.132:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_63
.LBB50_54:                              ;   in Loop: Header=BB50_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB50_55
; %bb.134:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_64
.LBB50_55:                              ;   in Loop: Header=BB50_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB50_56
; %bb.136:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_65
.LBB50_56:                              ;   in Loop: Header=BB50_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB50_58
	bra	.LBB50_59
.LBB50_57:                              ;   in Loop: Header=BB50_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB50_59
.LBB50_58:                              ;   in Loop: Header=BB50_47 Depth=1
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
.LBB50_59:                              ;   in Loop: Header=BB50_47 Depth=1
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
	beq	.LBB50_88
; %bb.138:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_47
.LBB50_88:
	jmp	.LBB50_30
.LBB50_60:                              ;   in Loop: Header=BB50_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB50_58
	bra	.LBB50_59
.LBB50_61:                              ;   in Loop: Header=BB50_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB50_59
; %bb.140:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_58
.LBB50_62:                              ;   in Loop: Header=BB50_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB50_59
; %bb.142:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_58
.LBB50_63:                              ;   in Loop: Header=BB50_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB50_59
; %bb.144:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_58
.LBB50_64:                              ;   in Loop: Header=BB50_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB50_59
; %bb.146:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_58
.LBB50_65:                              ;   in Loop: Header=BB50_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB50_59
; %bb.148:                              ;   in Loop: Header=BB50_47 Depth=1
	jmp	.LBB50_58
.Lfunc_end50:
	.size	__udivdi3, .Lfunc_end50-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB51_1
; %bb.15:
	jmp	.LBB51_13
.LBB51_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB51_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB51_14
; %bb.3:
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB51_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB51_6
; %bb.5:                                ;   in Loop: Header=BB51_4 Depth=1
	cmp	__rc2
	bcc	.LBB51_8
	bra	.LBB51_7
.LBB51_6:                               ;   in Loop: Header=BB51_4 Depth=1
	cpy	__rc4
	bcc	.LBB51_8
.LBB51_7:                               ;   in Loop: Header=BB51_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB51_4
	bra	.LBB51_9
.LBB51_8:
	ldy	__rc3
	sty	__rc2
.LBB51_9:
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB51_13
.LBB51_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB51_12
; %bb.11:                               ;   in Loop: Header=BB51_10 Depth=1
	sec
	sbc	__rc2
.LBB51_12:                              ;   in Loop: Header=BB51_10 Depth=1
	dex
	bne	.LBB51_10
.LBB51_13:
	rts
.LBB51_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end51:
	.size	__umodqi3, .Lfunc_end51-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB52_2
; %bb.1:
	ldx	__rc2
	bne	.LBB52_2
; %bb.22:
	jmp	.LBB52_19
.LBB52_2:
	cmp	__rc3
	bne	.LBB52_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB52_5
; %bb.20:
	jmp	.LBB52_19
.LBB52_4:
	cmp	__rc3
	bcs	.LBB52_5
; %bb.24:
	jmp	.LBB52_19
.LBB52_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB52_6
; %bb.26:
	jmp	.LBB52_18
.LBB52_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB52_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB52_9
; %bb.8:                                ;   in Loop: Header=BB52_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB52_11
	bra	.LBB52_10
.LBB52_9:                               ;   in Loop: Header=BB52_7 Depth=1
	cmp	__rc5
	bcc	.LBB52_11
.LBB52_10:                              ;   in Loop: Header=BB52_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB52_7
	bra	.LBB52_12
.LBB52_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB52_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB52_19
.LBB52_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB52_17
; %bb.14:                               ;   in Loop: Header=BB52_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB52_16
.LBB52_15:                              ;   in Loop: Header=BB52_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB52_16:                              ;   in Loop: Header=BB52_13 Depth=1
	dex
	bne	.LBB52_13
	bra	.LBB52_19
.LBB52_17:                              ;   in Loop: Header=BB52_13 Depth=1
	cmp	__rc5
	bcs	.LBB52_15
	bra	.LBB52_16
.LBB52_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB52_19:
	tax
	tya
	rts
.Lfunc_end52:
	.size	__umodhi3, .Lfunc_end52-__umodhi3
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
	bne	.LBB53_4
; %bb.1:
	ldx	__rc6
	bne	.LBB53_4
; %bb.2:
	ldx	__rc5
	bne	.LBB53_4
; %bb.3:
	ldx	__rc4
	bne	.LBB53_4
; %bb.42:
	jmp	.LBB53_35
.LBB53_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB53_8
; %bb.5:
	cmp	__rc6
	bne	.LBB53_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB53_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB53_11
; %bb.36:
	jmp	.LBB53_35
.LBB53_8:
	cpx	__rc7
	bcs	.LBB53_11
; %bb.38:
	jmp	.LBB53_35
.LBB53_9:
	cmp	__rc6
	bcs	.LBB53_11
; %bb.40:
	jmp	.LBB53_35
.LBB53_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB53_11
; %bb.44:
	jmp	.LBB53_35
.LBB53_11:
	ldx	__rc7
	bpl	.LBB53_12
; %bb.46:
	jmp	.LBB53_33
.LBB53_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB53_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB53_17
; %bb.14:                               ;   in Loop: Header=BB53_13 Depth=1
	cmp	__rc8
	bne	.LBB53_18
; %bb.15:                               ;   in Loop: Header=BB53_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB53_19
; %bb.16:                               ;   in Loop: Header=BB53_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB53_21
	bra	.LBB53_20
.LBB53_17:                              ;   in Loop: Header=BB53_13 Depth=1
	cpy	__rc9
	bcc	.LBB53_21
	bra	.LBB53_20
.LBB53_18:                              ;   in Loop: Header=BB53_13 Depth=1
	cmp	__rc8
	bcc	.LBB53_21
	bra	.LBB53_20
.LBB53_19:                              ;   in Loop: Header=BB53_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB53_21
.LBB53_20:                              ;   in Loop: Header=BB53_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB53_13
	bra	.LBB53_22
.LBB53_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB53_22:
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
	bne	.LBB53_23
; %bb.48:
	jmp	.LBB53_34
.LBB53_23:
	tya
.LBB53_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB53_28
; %bb.25:                               ;   in Loop: Header=BB53_24 Depth=1
	cmp	__rc8
	bne	.LBB53_31
; %bb.26:                               ;   in Loop: Header=BB53_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB53_32
; %bb.27:                               ;   in Loop: Header=BB53_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB53_29
	bra	.LBB53_30
.LBB53_28:                              ;   in Loop: Header=BB53_24 Depth=1
	cpy	__rc9
	bcc	.LBB53_30
.LBB53_29:                              ;   in Loop: Header=BB53_24 Depth=1
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
.LBB53_30:                              ;   in Loop: Header=BB53_24 Depth=1
	dex
	bne	.LBB53_24
	bra	.LBB53_35
.LBB53_31:                              ;   in Loop: Header=BB53_24 Depth=1
	cmp	__rc8
	bcs	.LBB53_29
	bra	.LBB53_30
.LBB53_32:                              ;   in Loop: Header=BB53_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB53_29
	bra	.LBB53_30
.LBB53_33:
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
	bra	.LBB53_35
.LBB53_34:
	tya
.LBB53_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end53:
	.size	__umodsi3, .Lfunc_end53-__umodsi3
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
	bne	.LBB54_8
; %bb.1:
	ldx	__rc14
	bne	.LBB54_8
; %bb.2:
	ldx	__rc13
	bne	.LBB54_8
; %bb.3:
	ldx	__rc12
	bne	.LBB54_8
; %bb.4:
	ldx	__rc11
	bne	.LBB54_8
; %bb.5:
	ldx	__rc10
	bne	.LBB54_8
; %bb.6:
	ldx	__rc9
	bne	.LBB54_8
; %bb.7:
	ldx	__rc8
	bne	.LBB54_8
; %bb.90:
	jmp	.LBB54_61
.LBB54_8:
	cmp	__rc15
	bne	.LBB54_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB54_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB54_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB54_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB54_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB54_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB54_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB54_23
; %bb.62:
	jmp	.LBB54_61
.LBB54_16:
	cmp	__rc15
	bcs	.LBB54_23
; %bb.64:
	jmp	.LBB54_61
.LBB54_17:
	cpx	__rc14
	bcs	.LBB54_23
; %bb.66:
	jmp	.LBB54_61
.LBB54_18:
	cpx	__rc13
	bcs	.LBB54_23
; %bb.68:
	jmp	.LBB54_61
.LBB54_19:
	cpx	__rc12
	bcs	.LBB54_23
; %bb.70:
	jmp	.LBB54_61
.LBB54_20:
	cpx	__rc11
	bcs	.LBB54_23
; %bb.72:
	jmp	.LBB54_61
.LBB54_21:
	cpx	__rc10
	bcs	.LBB54_23
; %bb.74:
	jmp	.LBB54_61
.LBB54_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB54_23
; %bb.92:
	jmp	.LBB54_61
.LBB54_23:
	ldx	__rc15
	bpl	.LBB54_24
; %bb.94:
	jmp	.LBB54_33
.LBB54_24:
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
.LBB54_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB54_29
; %bb.26:                               ;   in Loop: Header=BB54_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB54_30
; %bb.27:                               ;   in Loop: Header=BB54_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB54_31
; %bb.28:                               ;   in Loop: Header=BB54_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB54_76
; %bb.96:                               ;   in Loop: Header=BB54_25 Depth=1
	jmp	.LBB54_38
.LBB54_76:                              ;   in Loop: Header=BB54_25 Depth=1
	jmp	.LBB54_34
.LBB54_29:                              ;   in Loop: Header=BB54_25 Depth=1
	cmp	__rc19
	bcs	.LBB54_32
; %bb.98:
	jmp	.LBB54_42
.LBB54_30:                              ;   in Loop: Header=BB54_25 Depth=1
	cpy	__rc18
	bcs	.LBB54_32
; %bb.100:
	jmp	.LBB54_42
.LBB54_31:                              ;   in Loop: Header=BB54_25 Depth=1
	cpy	__rc7
	bcs	.LBB54_32
; %bb.102:
	jmp	.LBB54_42
.LBB54_32:                              ;   in Loop: Header=BB54_25 Depth=1
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
	bmi	.LBB54_78
; %bb.104:                              ;   in Loop: Header=BB54_25 Depth=1
	jmp	.LBB54_25
.LBB54_78:
	jmp	.LBB54_43
.LBB54_33:
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
	jmp	.LBB54_61
.LBB54_34:                              ;   in Loop: Header=BB54_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB54_39
; %bb.35:                               ;   in Loop: Header=BB54_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB54_40
; %bb.36:                               ;   in Loop: Header=BB54_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB54_41
; %bb.37:                               ;   in Loop: Header=BB54_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB54_42
; %bb.82:                               ;   in Loop: Header=BB54_25 Depth=1
	jmp	.LBB54_32
.LBB54_38:                              ;   in Loop: Header=BB54_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB54_42
; %bb.84:                               ;   in Loop: Header=BB54_25 Depth=1
	jmp	.LBB54_32
.LBB54_39:                              ;   in Loop: Header=BB54_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB54_42
; %bb.86:                               ;   in Loop: Header=BB54_25 Depth=1
	jmp	.LBB54_32
.LBB54_40:                              ;   in Loop: Header=BB54_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB54_42
; %bb.88:                               ;   in Loop: Header=BB54_25 Depth=1
	jmp	.LBB54_32
.LBB54_41:                              ;   in Loop: Header=BB54_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB54_42
; %bb.106:                              ;   in Loop: Header=BB54_25 Depth=1
	jmp	.LBB54_32
.LBB54_42:
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
.LBB54_43:
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
	bne	.LBB54_44
; %bb.108:
	jmp	.LBB54_61
.LBB54_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB54_52
; %bb.45:                               ;   in Loop: Header=BB54_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB54_46
; %bb.110:                              ;   in Loop: Header=BB54_44 Depth=1
	jmp	.LBB54_55
.LBB54_46:                              ;   in Loop: Header=BB54_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB54_47
; %bb.112:                              ;   in Loop: Header=BB54_44 Depth=1
	jmp	.LBB54_56
.LBB54_47:                              ;   in Loop: Header=BB54_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB54_48
; %bb.114:                              ;   in Loop: Header=BB54_44 Depth=1
	jmp	.LBB54_57
.LBB54_48:                              ;   in Loop: Header=BB54_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB54_49
; %bb.116:                              ;   in Loop: Header=BB54_44 Depth=1
	jmp	.LBB54_58
.LBB54_49:                              ;   in Loop: Header=BB54_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB54_50
; %bb.118:                              ;   in Loop: Header=BB54_44 Depth=1
	jmp	.LBB54_59
.LBB54_50:                              ;   in Loop: Header=BB54_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB54_51
; %bb.120:                              ;   in Loop: Header=BB54_44 Depth=1
	jmp	.LBB54_60
.LBB54_51:                              ;   in Loop: Header=BB54_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB54_53
	bra	.LBB54_54
.LBB54_52:                              ;   in Loop: Header=BB54_44 Depth=1
	cmp	__rc19
	bcc	.LBB54_54
.LBB54_53:                              ;   in Loop: Header=BB54_44 Depth=1
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
.LBB54_54:                              ;   in Loop: Header=BB54_44 Depth=1
	dex
	beq	.LBB54_61
; %bb.122:                              ;   in Loop: Header=BB54_44 Depth=1
	jmp	.LBB54_44
.LBB54_55:                              ;   in Loop: Header=BB54_44 Depth=1
	cpy	__rc18
	bcs	.LBB54_53
	bra	.LBB54_54
.LBB54_56:                              ;   in Loop: Header=BB54_44 Depth=1
	cpy	__rc7
	bcs	.LBB54_53
	bra	.LBB54_54
.LBB54_57:                              ;   in Loop: Header=BB54_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB54_53
	bra	.LBB54_54
.LBB54_58:                              ;   in Loop: Header=BB54_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB54_53
	bra	.LBB54_54
.LBB54_59:                              ;   in Loop: Header=BB54_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB54_53
	bra	.LBB54_54
.LBB54_60:                              ;   in Loop: Header=BB54_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB54_54
; %bb.124:                              ;   in Loop: Header=BB54_44 Depth=1
	jmp	.LBB54_53
.LBB54_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end54:
	.size	__umoddi3, .Lfunc_end54-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB55_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB55_2
; %bb.18:
	jmp	.LBB55_17
.LBB55_2:
	lda	__rc5
	bpl	.LBB55_3
; %bb.20:
	jmp	.LBB55_15
.LBB55_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB55_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB55_6
; %bb.5:                                ;   in Loop: Header=BB55_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB55_9
	bra	.LBB55_7
.LBB55_6:                               ;   in Loop: Header=BB55_4 Depth=1
	cpy	__rc6
	bcc	.LBB55_9
.LBB55_7:                               ;   in Loop: Header=BB55_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB55_4
	bra	.LBB55_10
.LBB55_8:
	sty	__rc7
	bra	.LBB55_17
.LBB55_9:
	ldy	__rc5
	sty	__rc4
.LBB55_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB55_16
; %bb.11:
	lda	#1
.LBB55_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB55_14
; %bb.13:                               ;   in Loop: Header=BB55_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB55_14:                              ;   in Loop: Header=BB55_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB55_12
	bra	.LBB55_17
.LBB55_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB55_16:
	lda	#1
.LBB55_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end55:
	.size	__udivmodqi4, .Lfunc_end55-__udivmodqi4
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
	bne	.LBB56_2
; %bb.1:
	ldx	__rc2
	beq	.LBB56_4
.LBB56_2:
	cmp	__rc3
	bne	.LBB56_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB56_6
.LBB56_4:
	ldx	#0
; %bb.26:
	jmp	.LBB56_24
.LBB56_5:
	cmp	__rc3
	bcc	.LBB56_4
.LBB56_6:
	tay
	ldx	__rc3
	bpl	.LBB56_7
; %bb.28:
	jmp	.LBB56_22
.LBB56_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB56_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB56_10
; %bb.9:                                ;   in Loop: Header=BB56_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB56_11
	bra	.LBB56_12
.LBB56_10:                              ;   in Loop: Header=BB56_8 Depth=1
	cmp	__rc8
	bcc	.LBB56_12
.LBB56_11:                              ;   in Loop: Header=BB56_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB56_8
	bra	.LBB56_13
.LBB56_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB56_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB56_14
; %bb.30:
	jmp	.LBB56_23
.LBB56_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB56_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB56_17
; %bb.16:                               ;   in Loop: Header=BB56_15 Depth=1
	ldy	#0
.LBB56_17:                              ;   in Loop: Header=BB56_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB56_21
; %bb.18:                               ;   in Loop: Header=BB56_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB56_20
.LBB56_19:                              ;   in Loop: Header=BB56_15 Depth=1
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
.LBB56_20:                              ;   in Loop: Header=BB56_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB56_15
	bra	.LBB56_25
.LBB56_21:                              ;   in Loop: Header=BB56_15 Depth=1
	cmp	__rc8
	bcs	.LBB56_19
	bra	.LBB56_20
.LBB56_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB56_23:
	ldx	#1
.LBB56_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB56_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end56:
	.size	__udivmodhi4, .Lfunc_end56-__udivmodhi4
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
	bpl	.LBB57_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB57_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB57_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB57_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB57_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB57_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB57_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB57_8:
	lda	__rc2
	rts
.Lfunc_end57:
	.size	__divqi3, .Lfunc_end57-__divqi3
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
	bmi	.LBB58_2
; %bb.1:
	bra	.LBB58_6
.LBB58_2:
	cpx	#128
	bne	.LBB58_5
; %bb.3:
	lda	__rc4
	bne	.LBB58_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB58_6
.LBB58_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB58_6:
	tya
	bmi	.LBB58_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB58_12
.LBB58_8:
	cpy	#128
	bne	.LBB58_11
; %bb.9:
	lda	__rc2
	bne	.LBB58_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB58_12
.LBB58_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB58_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB58_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB58_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end58:
	.size	__divhi3, .Lfunc_end58-__divhi3
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
	bmi	.LBB59_2
; %bb.1:
	ldy	__rc3
	bra	.LBB59_8
.LBB59_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB59_7
; %bb.3:
	lda	__rc2
	bne	.LBB59_7
; %bb.4:
	lda	__rc8
	bne	.LBB59_7
; %bb.5:
	lda	__rc9
	bne	.LBB59_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB59_8
.LBB59_7:
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
.LBB59_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB59_10
; %bb.9:
	lda	__rc7
	bra	.LBB59_16
.LBB59_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB59_15
; %bb.11:
	lda	__rc6
	bne	.LBB59_15
; %bb.12:
	lda	__rc5
	bne	.LBB59_15
; %bb.13:
	lda	__rc4
	bne	.LBB59_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB59_16
.LBB59_15:
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
.LBB59_16:
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
	bne	.LBB59_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB59_19
.LBB59_18:
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
.LBB59_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end59:
	.size	__divsi3, .Lfunc_end59-__divsi3
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
	bmi	.LBB60_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB60_12
.LBB60_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB60_11
; %bb.3:
	lda	__rc6
	bne	.LBB60_11
; %bb.4:
	lda	__rc5
	bne	.LBB60_11
; %bb.5:
	lda	__rc4
	bne	.LBB60_11
; %bb.6:
	lda	__rc3
	bne	.LBB60_11
; %bb.7:
	lda	__rc2
	bne	.LBB60_11
; %bb.8:
	lda	__rc18
	bne	.LBB60_11
; %bb.9:
	lda	__rc19
	bne	.LBB60_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB60_12
.LBB60_11:
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
.LBB60_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB60_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB60_24
.LBB60_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB60_23
; %bb.15:
	lda	__rc14
	bne	.LBB60_23
; %bb.16:
	lda	__rc13
	bne	.LBB60_23
; %bb.17:
	lda	__rc12
	bne	.LBB60_23
; %bb.18:
	lda	__rc11
	bne	.LBB60_23
; %bb.19:
	lda	__rc10
	bne	.LBB60_23
; %bb.20:
	lda	__rc9
	bne	.LBB60_23
; %bb.21:
	lda	__rc8
	bne	.LBB60_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB60_24
.LBB60_23:
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
.LBB60_24:
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
	bne	.LBB60_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB60_27
.LBB60_26:
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
.LBB60_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end60:
	.size	__divdi3, .Lfunc_end60-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB61_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB61_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB61_3:
	tay
	lda	__rc2
	bmi	.LBB61_5
; %bb.4:
	lda	__rc2
	bra	.LBB61_7
.LBB61_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB61_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB61_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB61_9
; %bb.8:
	rts
.LBB61_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end61:
	.size	__modqi3, .Lfunc_end61-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB62_2
; %bb.1:
	txa
	bra	.LBB62_6
.LBB62_2:
	cpx	#128
	bne	.LBB62_5
; %bb.3:
	lda	__rc4
	bne	.LBB62_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB62_6
.LBB62_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB62_6:
	ldx	__rc3
	bpl	.LBB62_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB62_10
; %bb.8:
	ldx	__rc2
	bne	.LBB62_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB62_11
.LBB62_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB62_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB62_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB62_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end62:
	.size	__modhi3, .Lfunc_end62-__modhi3
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
	bmi	.LBB63_2
; %bb.1:
	lda	__rc3
	bra	.LBB63_8
.LBB63_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB63_7
; %bb.3:
	lda	__rc2
	bne	.LBB63_7
; %bb.4:
	lda	__rc8
	bne	.LBB63_7
; %bb.5:
	lda	__rc9
	bne	.LBB63_7
; %bb.6:
	stz	__rc9
	lda	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB63_8
.LBB63_7:
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
.LBB63_8:
	ldx	__rc7
	bpl	.LBB63_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB63_14
; %bb.10:
	ldx	__rc6
	bne	.LBB63_14
; %bb.11:
	ldx	__rc5
	bne	.LBB63_14
; %bb.12:
	ldx	__rc4
	bne	.LBB63_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB63_15
.LBB63_14:
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
.LBB63_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB63_17
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
.LBB63_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end63:
	.size	__modsi3, .Lfunc_end63-__modsi3
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
	bmi	.LBB64_2
; %bb.1:
	lda	__rc7
; %bb.26:
	jmp	.LBB64_12
.LBB64_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB64_11
; %bb.3:
	lda	__rc6
	bne	.LBB64_11
; %bb.4:
	lda	__rc5
	bne	.LBB64_11
; %bb.5:
	lda	__rc4
	bne	.LBB64_11
; %bb.6:
	lda	__rc3
	bne	.LBB64_11
; %bb.7:
	lda	__rc2
	bne	.LBB64_11
; %bb.8:
	lda	__rc18
	bne	.LBB64_11
; %bb.9:
	lda	__rc19
	bne	.LBB64_11
; %bb.10:
	stz	__rc19
	lda	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB64_12
.LBB64_11:
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
.LBB64_12:
	ldx	__rc15
	bmi	.LBB64_13
; %bb.28:
	jmp	.LBB64_23
.LBB64_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB64_22
; %bb.14:
	ldx	__rc14
	bne	.LBB64_22
; %bb.15:
	ldx	__rc13
	bne	.LBB64_22
; %bb.16:
	ldx	__rc12
	bne	.LBB64_22
; %bb.17:
	ldx	__rc11
	bne	.LBB64_22
; %bb.18:
	ldx	__rc10
	bne	.LBB64_22
; %bb.19:
	ldx	__rc9
	bne	.LBB64_22
; %bb.20:
	ldx	__rc8
	bne	.LBB64_22
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
	bra	.LBB64_23
.LBB64_22:
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
.LBB64_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB64_25
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
.LBB64_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end64:
	.size	__moddi3, .Lfunc_end64-__moddi3
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
	bpl	.LBB65_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB65_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB65_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB65_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB65_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB65_11
.LBB65_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB65_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB65_8
; %bb.34:
	jmp	.LBB65_24
.LBB65_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB65_24
.LBB65_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB65_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB65_12
.LBB65_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB65_24
.LBB65_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB65_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB65_15
; %bb.14:                               ;   in Loop: Header=BB65_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB65_18
	bra	.LBB65_16
.LBB65_15:                              ;   in Loop: Header=BB65_13 Depth=1
	cmp	__rc7
	bcc	.LBB65_18
.LBB65_16:                              ;   in Loop: Header=BB65_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB65_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB65_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB65_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB65_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB65_22
; %bb.21:                               ;   in Loop: Header=BB65_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB65_22:                              ;   in Loop: Header=BB65_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB65_20
	bra	.LBB65_24
.LBB65_23:
	sta	__rc7
	sty	__rc6
.LBB65_24:
	lda	__rc4
	bmi	.LBB65_26
; %bb.25:
	lda	__rc7
	bra	.LBB65_27
.LBB65_26:
	lda	#0
	sec
	sbc	__rc7
.LBB65_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB65_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB65_29:
	lda	__rc6
	rts
.Lfunc_end65:
	.size	__divmodqi4, .Lfunc_end65-__divmodqi4
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
	bmi	.LBB66_2
.LBB66_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB66_6
.LBB66_2:
	cpx	#128
	bne	.LBB66_5
; %bb.3:
	lda	__rc7
	bne	.LBB66_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB66_1
.LBB66_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB66_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB66_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB66_15
; %bb.8:
	lda	__rc2
	bne	.LBB66_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB66_18
.LBB66_10:
	cpy	#128
	bne	.LBB66_14
; %bb.11:
	ldy	__rc2
	bne	.LBB66_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB66_13
; %bb.48:
	jmp	.LBB66_45
.LBB66_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB66_18
.LBB66_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB66_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB66_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB66_20
.LBB66_17:
	sta	__rc11
.LBB66_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB66_39
.LBB66_19:
	cmp	__rc7
	bcc	.LBB66_17
.LBB66_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB66_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB66_23
; %bb.22:                               ;   in Loop: Header=BB66_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB66_24
	bra	.LBB66_26
.LBB66_23:                              ;   in Loop: Header=BB66_21 Depth=1
	cmp	__rc9
	bcc	.LBB66_26
.LBB66_24:                              ;   in Loop: Header=BB66_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB66_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB66_27
.LBB66_26:
	tay
.LBB66_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB66_28
; %bb.50:
	jmp	.LBB66_37
.LBB66_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB66_32
.LBB66_29:                              ;   in Loop: Header=BB66_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB66_36
.LBB66_30:                              ;   in Loop: Header=BB66_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB66_31:                              ;   in Loop: Header=BB66_32 Depth=1
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
	beq	.LBB66_39
.LBB66_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB66_34
; %bb.33:                               ;   in Loop: Header=BB66_32 Depth=1
	ldy	#0
.LBB66_34:                              ;   in Loop: Header=BB66_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB66_29
; %bb.35:                               ;   in Loop: Header=BB66_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB66_30
.LBB66_36:                              ;   in Loop: Header=BB66_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB66_31
.LBB66_37:
	sta	__rc11
	ldx	#1
.LBB66_38:
	stx	__rc9
.LBB66_39:
	lda	__rc6
	bmi	.LBB66_41
; %bb.40:
	lda	__rc10
	bra	.LBB66_42
.LBB66_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB66_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB66_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB66_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB66_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB66_38
.Lfunc_end66:
	.size	__divmodhi4, .Lfunc_end66-__divmodhi4
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB67_2
; %bb.1:
	tya
	beq	.LBB67_11
.LBB67_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB67_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB67_5
; %bb.4:                                ;   in Loop: Header=BB67_3 Depth=1
	inc	__rc7
.LBB67_5:                               ;   in Loop: Header=BB67_3 Depth=1
	inc	__rc4
	bne	.LBB67_7
; %bb.6:                                ;   in Loop: Header=BB67_3 Depth=1
	inc	__rc5
.LBB67_7:                               ;   in Loop: Header=BB67_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB67_9
; %bb.8:                                ;   in Loop: Header=BB67_3 Depth=1
	dex
.LBB67_9:                               ;   in Loop: Header=BB67_3 Depth=1
	txa
	bne	.LBB67_3
; %bb.10:                               ;   in Loop: Header=BB67_3 Depth=1
	tya
	bne	.LBB67_3
.LBB67_11:
	rts
.Lfunc_end67:
	.size	memcpy, .Lfunc_end67-memcpy
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
.Lfunc_end68:
	.size	memset, .Lfunc_end68-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB69_4
.LBB69_1:                               ;   in Loop: Header=BB69_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB69_3
; %bb.2:                                ;   in Loop: Header=BB69_4 Depth=1
	inc	__rc3
.LBB69_3:                               ;   in Loop: Header=BB69_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB69_7
.LBB69_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB69_1
; %bb.5:                                ;   in Loop: Header=BB69_4 Depth=1
	cpx	#0
	bne	.LBB69_1
; %bb.6:
	rts
.LBB69_7:                               ;   in Loop: Header=BB69_4 Depth=1
	dec	__rc4
	jmp	.LBB69_4
.Lfunc_end69:
	.size	__memset, .Lfunc_end69-__memset
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
	beq	.LBB70_1
; %bb.15:
	jmp	.LBB70_13
.LBB70_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB70_2
; %bb.17:
	jmp	.LBB70_14
.LBB70_2:
	lda	__rc7
	bne	.LBB70_4
; %bb.3:
	lda	__rc6
	beq	.LBB70_12
.LBB70_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB70_6
; %bb.5:                                ;   in Loop: Header=BB70_4 Depth=1
	dec	__rc9
.LBB70_6:                               ;   in Loop: Header=BB70_4 Depth=1
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
	bne	.LBB70_8
; %bb.7:                                ;   in Loop: Header=BB70_4 Depth=1
	dec	__rc11
.LBB70_8:                               ;   in Loop: Header=BB70_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB70_10
; %bb.9:                                ;   in Loop: Header=BB70_4 Depth=1
	dex
.LBB70_10:                              ;   in Loop: Header=BB70_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB70_4
; %bb.11:                               ;   in Loop: Header=BB70_4 Depth=1
	tya
	bne	.LBB70_4
.LBB70_12:
	rts
.LBB70_13:
	cpx	__rc3
	bcs	.LBB70_14
; %bb.19:
	jmp	.LBB70_2
.LBB70_14:
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
.Lfunc_end70:
	.size	memmove, .Lfunc_end70-memmove
                                        ; -- End function
	.type	.L.str,@object                  ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"UPPERCASE lowercase."
	.size	.L.str, 21

	.type	.L.str.1,@object                ; @.str.1
.L.str.1:
	.asciz	"is currently beta and does destroy .d81 and disks!"
	.size	.L.str.1, 51

	.type	.L.str.2,@object                ; @.str.2
.L.str.2:
	.asciz	"Physical disks are still stressed, better use .d81."
	.size	.L.str.2, 52

	.type	.L.str.3,@object                ; @.str.3
.L.str.3:
	.asciz	"Press RETURN to continue, STOP to crash."
	.size	.L.str.3, 41

	.type	.L.str.4,@object                ; @.str.4
.L.str.4:
	.asciz	"v0.1.0-beta-2-g797bf25"
	.size	.L.str.4, 23

	.type	.L.str.5,@object                ; @.str.5
.L.str.5:
	.asciz	"github.com/nobruinfo"
	.size	.L.str.5, 21

	.type	.L.str.6,@object                ; @.str.6
.L.str.6:
	.asciz	"Have fun with your Mega65!"
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

	.type	BAMsector.0,@object             ; @BAMsector.0
	.section	.zp.bss.BAMsector.0,"aw",@nobits
BAMsector.0:
	.short	0
	.size	BAMsector.0, 2

	.type	BAMsector.1,@object             ; @BAMsector.1
	.section	.zp.bss.BAMsector.1,"aw",@nobits
BAMsector.1:
	.short	0
	.size	BAMsector.1, 2

	.type	worksector.0,@object            ; @worksector.0
	.section	.zp.bss.worksector.0,"aw",@nobits
worksector.0:
	.short	0
	.size	worksector.0, 2

	.type	worksectorasBAM.0,@object       ; @worksectorasBAM.0
	.section	.zp.bss.worksectorasBAM.0,"aw",@nobits
worksectorasBAM.0:
	.short	0
	.size	worksectorasBAM.0, 2

	.type	direntryblock.0,@object         ; @direntryblock.0
	.section	.zp.bss.direntryblock.0,"aw",@nobits
direntryblock.0:
	.short	0
	.size	direntryblock.0, 2

	.type	direntryblock.1,@object         ; @direntryblock.1
	.section	.zp.bss.direntryblock.1,"aw",@nobits
direntryblock.1:
	.short	0
	.size	direntryblock.1, 2

	.type	.L.str.11,@object               ; @.str.11
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.11:
	.asciz	"Reading file,"
	.size	.L.str.11, 14

	.type	.L.str.12,@object               ; @.str.12
.L.str.12:
	.asciz	"number of sectors too big."
	.size	.L.str.12, 27

	.type	.L.str.13,@object               ; @.str.13
.L.str.13:
	.asciz	"Writing file,"
	.size	.L.str.13, 14

	.type	.L.str.14,@object               ; @.str.14
.L.str.14:
	.asciz	"number of sectors too big"
	.size	.L.str.14, 26

	.type	.Lswitch.table.gettype,@object  ; @switch.table.gettype
	.section	.rodata..Lswitch.table.gettype,"a",@progbits
.Lswitch.table.gettype:
	.ascii	"SPURC"
	.size	.Lswitch.table.gettype, 5

	.type	.Lswitch.table.gettype.15,@object ; @switch.table.gettype.15
	.section	.rodata..Lswitch.table.gettype.15,"a",@progbits
.Lswitch.table.gettype.15:
	.ascii	"ERSEB"
	.size	.Lswitch.table.gettype.15, 5

	.type	.Lswitch.table.gettype.16,@object ; @switch.table.gettype.16
	.section	.rodata..Lswitch.table.gettype.16,"a",@progbits
.Lswitch.table.gettype.16:
	.ascii	"QGRLM"
	.size	.Lswitch.table.gettype.16, 5

	.type	.L.str.34,@object               ; @.str.34
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.34:
	.asciz	" Midnight Mega "
	.size	.L.str.34, 16

	.type	.L.str.1.35,@object             ; @.str.1.35
.L.str.1.35:
	.asciz	" The Mega65 file commander "
	.size	.L.str.1.35, 28

	.type	.L.str.2.36,@object             ; @.str.2.36
.L.str.2.36:
	.asciz	"   OK   "
	.size	.L.str.2.36, 9

	.type	.L.str.3.37,@object             ; @.str.3.37
.L.str.3.37:
	.asciz	" Cancel "
	.size	.L.str.3.37, 9

	.type	.Lswitch.table.asciitoscreencode_s,@object ; @switch.table.asciitoscreencode_s
	.section	.rodata..Lswitch.table.asciitoscreencode_s,"a",@progbits
.Lswitch.table.asciitoscreencode_s:
	.ascii	"\033i\035dd"
	.size	.Lswitch.table.asciitoscreencode_s, 5

	.type	midnight,@object                ; @midnight
	.section	.rodata.cst4,"aM",@progbits,4
midnight:
	.short	7424
	.short	7680
	.size	midnight, 4

	.type	filelist,@object                ; @filelist
	.section	.bss.filelist,"aw",@nobits
filelist:
	.zero	1170
	.size	filelist, 1170

	.type	s,@object                       ; @s
	.section	.zp.bss.s,"aw",@nobits
s:
	.zero	40
	.size	s, 40

	.type	.L.str.1.39,@object             ; @.str.1.39
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1.39:
	.asciz	"1"
	.size	.L.str.1.39, 2

	.type	.L.str.2.40,@object             ; @.str.2.40
.L.str.2.40:
	.asciz	"Help  "
	.size	.L.str.2.40, 7

	.type	.L.str.3.41,@object             ; @.str.3.41
.L.str.3.41:
	.asciz	" 2"
	.size	.L.str.3.41, 3

	.type	.L.str.4.42,@object             ; @.str.4.42
.L.str.4.42:
	.asciz	"Mount "
	.size	.L.str.4.42, 7

	.type	.L.str.5.43,@object             ; @.str.5.43
.L.str.5.43:
	.asciz	" 3"
	.size	.L.str.5.43, 3

	.type	.L.str.6.44,@object             ; @.str.6.44
.L.str.6.44:
	.asciz	"View  "
	.size	.L.str.6.44, 7

	.type	.L.str.7.45,@object             ; @.str.7.45
.L.str.7.45:
	.asciz	" 4"
	.size	.L.str.7.45, 3

	.type	.L.str.8.46,@object             ; @.str.8.46
.L.str.8.46:
	.asciz	"Edit  "
	.size	.L.str.8.46, 7

	.type	.L.str.9.47,@object             ; @.str.9.47
.L.str.9.47:
	.asciz	" 5"
	.size	.L.str.9.47, 3

	.type	.L.str.10.48,@object            ; @.str.10.48
.L.str.10.48:
	.asciz	"Copy  "
	.size	.L.str.10.48, 7

	.type	.L.str.11.49,@object            ; @.str.11.49
.L.str.11.49:
	.asciz	" 6"
	.size	.L.str.11.49, 3

	.type	.L.str.12.50,@object            ; @.str.12.50
.L.str.12.50:
	.asciz	"RenMov"
	.size	.L.str.12.50, 7

	.type	.L.str.13.51,@object            ; @.str.13.51
.L.str.13.51:
	.asciz	" 7"
	.size	.L.str.13.51, 3

	.type	.L.str.14.52,@object            ; @.str.14.52
.L.str.14.52:
	.asciz	"Mkdir "
	.size	.L.str.14.52, 7

	.type	.L.str.15,@object               ; @.str.15
.L.str.15:
	.asciz	" 8"
	.size	.L.str.15, 3

	.type	.L.str.16,@object               ; @.str.16
.L.str.16:
	.asciz	"Delete"
	.size	.L.str.16, 7

	.type	.L.str.17,@object               ; @.str.17
.L.str.17:
	.asciz	" 9"
	.size	.L.str.17, 3

	.type	.L.str.18,@object               ; @.str.18
.L.str.18:
	.asciz	"Menu  "
	.size	.L.str.18, 7

	.type	.L.str.19,@object               ; @.str.19
.L.str.19:
	.asciz	" 10"
	.size	.L.str.19, 4

	.type	.L.str.20,@object               ; @.str.20
.L.str.20:
	.asciz	"Quit  "
	.size	.L.str.20, 7

	.type	.L.str.21,@object               ; @.str.21
.L.str.21:
	.asciz	" Choose disk image file for drive "
	.size	.L.str.21, 35

	.type	.L.str.22,@object               ; @.str.22
.L.str.22:
	.asciz	": "
	.size	.L.str.22, 3

	.type	.L.str.23,@object               ; @.str.23
.L.str.23:
	.asciz	"Storage card mounting,"
	.size	.L.str.23, 23

	.type	.L.str.24,@object               ; @.str.24
.L.str.24:
	.asciz	"mount failed for"
	.size	.L.str.24, 17

	.type	.L.str.25,@object               ; @.str.25
.L.str.25:
	.asciz	"val="
	.size	.L.str.25, 5

	.type	.L.str.26,@object               ; @.str.26
.L.str.26:
	.asciz	"already mounted"
	.size	.L.str.26, 16

	.type	.L.str.27,@object               ; @.str.27
.L.str.27:
	.asciz	" "
	.size	.L.str.27, 2

	.type	dosfilename,@object             ; @dosfilename
	.section	.bss.dosfilename,"aw",@nobits
dosfilename:
	.zero	17
	.size	dosfilename, 17

	.type	.L.str.28,@object               ; @.str.28
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.28:
	.asciz	" drv:"
	.size	.L.str.28, 6

	.type	.L.str.29,@object               ; @.str.29
.L.str.29:
	.asciz	" blocks free "
	.size	.L.str.29, 14

	.type	.L.str.30,@object               ; @.str.30
.L.str.30:
	.asciz	"Navigation keys,"
	.size	.L.str.30, 17

	.type	.L.str.31,@object               ; @.str.31
.L.str.31:
	.asciz	"not yet implemented"
	.size	.L.str.31, 20

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

	.type	dmalist,@object                 ; @dmalist
	.section	.zp.bss.dmalist,"aw",@nobits
dmalist:
	.zero	20
	.size	dmalist, 20

	.type	.Lzp_stack,@object              ; @zp_stack
	.section	.zp.noinit..Lzp_stack,"aw",@nobits
.Lzp_stack:
	.zero	33
	.size	.Lzp_stack, 33

	.type	.Lstatic_stack,@object          ; @static_stack
	.section	.noinit..Lstatic_stack,"aw",@nobits
.Lstatic_stack:
	.zero	3
	.size	.Lstatic_stack, 3

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
.set .L__udivmodhi4_zp_stk, .Lzp_stack+32
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
.set .Lmemset_zp_stk, .Lzp_stack
	.size	.Lmemset_zp_stk, 2
.set .Lmemmove_zp_stk, .Lzp_stack
	.size	.Lmemmove_zp_stk, 2
.set .Lcputsxy_zp_stk, .Lzp_stack+23
	.size	.Lcputsxy_zp_stk, 9
.set .Lcputln_zp_stk, .Lzp_stack
	.size	.Lcputln_zp_stk, 6
.set .Lclrhome_zp_stk, .Lzp_stack
	.size	.Lclrhome_zp_stk, 3
.set .LGetOneSector_zp_stk, .Lzp_stack+12
	.size	.LGetOneSector_zp_stk, 2
.set .Lgetdirententry_zp_stk, .Lzp_stack
	.size	.Lgetdirententry_zp_stk, 13
.set .Lcsputdec_zp_stk, .Lzp_stack+1
	.size	.Lcsputdec_zp_stk, 22
.set .Lmprintf_zp_stk, .Lzp_stack
	.size	.Lmprintf_zp_stk, 1
.set .LBAMSectorUpdate_zp_stk, .Lzp_stack+12
	.size	.LBAMSectorUpdate_zp_stk, 8
.set .LPutOneSector_zp_stk, .Lzp_stack+12
	.size	.LPutOneSector_zp_stk, 6
.set .LfindnextBAMtracksector_zp_stk, .Lzp_stack
	.size	.LfindnextBAMtracksector_zp_stk, 12
.set .Lmprintf_sstk, .Lstatic_stack
	.size	.Lmprintf_sstk, 3
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
	.addrsig_sym filelist
	.addrsig_sym s
	.addrsig_sym dosfilename
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

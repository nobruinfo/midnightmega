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
	adc	#225
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
; %bb.375:
	jmp	.LBB0_271
.LBB0_14:
	ldx	#40
	txa
	ldy	#23
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
	ldx	#mos16lo(.L.str.33)
	stx	__rc4
	ldx	#mos16hi(.L.str.33)
	stx	__rc5
	ldx	#0
	lda	#16
	jsr	memcpy
	ldy	#1
	lda	#0
	sta	(__rc20),y
	ldx	#mos16lo(.L.str.34)
	stx	__rc2
	ldx	#mos16hi(.L.str.34)
	stx	__rc3
	ldx	#mos16lo(.L.str.35)
	stx	__rc4
	ldx	#mos16hi(.L.str.35)
	stx	__rc5
	ldy	#23
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
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_16:                               ; =>This Inner Loop Header: Depth=1
	ldx	__rc4
	cpx	#2
	beq	.LBB0_17
; %bb.377:                              ;   in Loop: Header=BB0_16 Depth=1
	jmp	.LBB0_15
.LBB0_17:
	stz	__rc2
	lda	#0
.LBB0_18:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_19 Depth 2
                                        ;       Child Loop BB0_62 Depth 3
                                        ;         Child Loop BB0_52 Depth 4
                                        ;           Child Loop BB0_25 Depth 5
                                        ;           Child Loop BB0_29 Depth 5
                                        ;       Child Loop BB0_79 Depth 3
                                        ;         Child Loop BB0_80 Depth 4
                                        ;       Child Loop BB0_71 Depth 3
                                        ;         Child Loop BB0_69 Depth 4
                                        ;       Child Loop BB0_76 Depth 3
                                        ;         Child Loop BB0_74 Depth 4
                                        ;       Child Loop BB0_181 Depth 3
                                        ;       Child Loop BB0_211 Depth 3
                                        ;       Child Loop BB0_240 Depth 3
                                        ;       Child Loop BB0_263 Depth 3
                                        ;       Child Loop BB0_124 Depth 3
                                        ;         Child Loop BB0_114 Depth 4
                                        ;         Child Loop BB0_120 Depth 4
                                        ;       Child Loop BB0_163 Depth 3
                                        ;         Child Loop BB0_169 Depth 4
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_19:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_62 Depth 3
                                        ;         Child Loop BB0_52 Depth 4
                                        ;           Child Loop BB0_25 Depth 5
                                        ;           Child Loop BB0_29 Depth 5
                                        ;       Child Loop BB0_79 Depth 3
                                        ;         Child Loop BB0_80 Depth 4
                                        ;       Child Loop BB0_71 Depth 3
                                        ;         Child Loop BB0_69 Depth 4
                                        ;       Child Loop BB0_76 Depth 3
                                        ;         Child Loop BB0_74 Depth 4
                                        ;       Child Loop BB0_181 Depth 3
                                        ;       Child Loop BB0_211 Depth 3
                                        ;       Child Loop BB0_240 Depth 3
                                        ;       Child Loop BB0_263 Depth 3
                                        ;       Child Loop BB0_124 Depth 3
                                        ;         Child Loop BB0_114 Depth 4
                                        ;         Child Loop BB0_120 Depth 4
                                        ;       Child Loop BB0_163 Depth 3
                                        ;         Child Loop BB0_169 Depth 4
	stz	__rc2
	lda	#0
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc30
	stz	__rc28
; %bb.289:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_62
.LBB0_20:                               ;   in Loop: Header=BB0_52 Depth=4
	sta	__rc4
	lda	#1
.LBB0_21:                               ;   in Loop: Header=BB0_52 Depth=4
	ldy	#32
	and	#1
	bne	.LBB0_23
; %bb.22:                               ;   in Loop: Header=BB0_52 Depth=4
	ldy	#62
.LBB0_23:                               ;   in Loop: Header=BB0_52 Depth=4
	ldx	#0
	sty	mos8(s)
	ldy	#32
	sty	mos8(s+1)
	ldy	#5
	bra	.LBB0_25
.LBB0_24:                               ;   in Loop: Header=BB0_25 Depth=5
	sta	mos8(s+2),x
	inx
.LBB0_25:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ;       Parent Loop BB0_62 Depth=3
                                        ;         Parent Loop BB0_52 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
	txa
	clc
	adc	__rc20
	sta	__rc2
	lda	__rc21
	adc	#0
	sta	__rc3
	lda	(__rc2),y
	cmp	#160
	beq	.LBB0_27
; %bb.26:                               ;   in Loop: Header=BB0_25 Depth=5
	cpx	#16
	bcc	.LBB0_24
.LBB0_27:                               ;   in Loop: Header=BB0_52 Depth=4
	lda	#32
	bra	.LBB0_29
.LBB0_28:                               ;   in Loop: Header=BB0_29 Depth=5
	sta	mos8(s+2),x
	inx
.LBB0_29:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ;       Parent Loop BB0_62 Depth=3
                                        ;         Parent Loop BB0_52 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
	cpx	#16
	bne	.LBB0_28
; %bb.30:                               ;   in Loop: Header=BB0_52 Depth=4
	sta	mos8(s+18)
	ldx	#93
	stx	mos8(s+19)
	sta	mos8(s+20)
	lda	#15
	ldy	#2
	and	(__rc20),y
	tay
	lda	#0
	sty	__rc2
	phy
	plx
	dey
	cpx	#0
	bne	.LBB0_32
; %bb.31:                               ;   in Loop: Header=BB0_52 Depth=4
	dec
.LBB0_32:                               ;   in Loop: Header=BB0_52 Depth=4
	tax
	bne	.LBB0_34
; %bb.33:                               ;   in Loop: Header=BB0_52 Depth=4
	cpy	#5
	bra	.LBB0_35
.LBB0_34:                               ;   in Loop: Header=BB0_52 Depth=4
	cmp	#0
.LBB0_35:                               ;   in Loop: Header=BB0_52 Depth=4
	ldx	#68
	lda	#69
	ldy	#76
	bcs	.LBB0_37
; %bb.36:                               ;   in Loop: Header=BB0_52 Depth=4
	ldx	__rc2
	ldy	.Lswitch.table.gettype-1,x
	sty	__rc2
	lda	.Lswitch.table.gettype.20-1,x
	ldy	.Lswitch.table.gettype.21-1,x
	ldx	__rc2
.LBB0_37:                               ;   in Loop: Header=BB0_52 Depth=4
	stx	mos8(s+21)
	sta	mos8(s+22)
	sty	mos8(s+23)
	ldy	#32
	sty	mos8(s+24)
	ldx	#93
	stx	mos8(s+25)
	sty	mos8(s+26)
	stz	mos8(s+27)
	lda	mos8(g_curTextColor)
	ldy	__rc4
	bne	.LBB0_41
; %bb.38:                               ;   in Loop: Header=BB0_52 Depth=4
	ldx	__rc31
	cpx	__rc23
	bne	.LBB0_41
; %bb.39:                               ;   in Loop: Header=BB0_52 Depth=4
	pha
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	pla
	cpx	__rc30
	bne	.LBB0_41
; %bb.40:                               ;   in Loop: Header=BB0_52 Depth=4
	ora	#32
	bra	.LBB0_42
.LBB0_41:                               ;   in Loop: Header=BB0_52 Depth=4
	and	#223
.LBB0_42:                               ;   in Loop: Header=BB0_52 Depth=4
	cpy	#0
	bne	.LBB0_44
; %bb.43:                               ;   in Loop: Header=BB0_52 Depth=4
	ldx	#1
	ldy	__rc31
	cpy	__rc23
	beq	.LBB0_45
.LBB0_44:                               ;   in Loop: Header=BB0_52 Depth=4
	ldx	#0
.LBB0_45:                               ;   in Loop: Header=BB0_52 Depth=4
	ldy	#1
	stz	__rc2
	cpx	#0
	bne	.LBB0_47
; %bb.46:                               ;   in Loop: Header=BB0_52 Depth=4
	sty	__rc2
.LBB0_47:                               ;   in Loop: Header=BB0_52 Depth=4
	sta	mos8(g_curTextColor)
	lda	__rc2
	and	#1
	sta	__rc31
	ldx	__rc22
	inx
	ldy	#mos8(s)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	lda	__rc29
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
	ldx	__rc31
	bne	.LBB0_49
; %bb.48:                               ;   in Loop: Header=BB0_52 Depth=4
	lda	#60
.LBB0_49:                               ;   in Loop: Header=BB0_52 Depth=4
	jsr	cputc
	inc	__rc22
	bne	.LBB0_51
; %bb.50:                               ;   in Loop: Header=BB0_52 Depth=4
	inc	__rc26
.LBB0_51:                               ;   in Loop: Header=BB0_52 Depth=4
	ldx	__rc22
.LBB0_52:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ;       Parent Loop BB0_62 Depth=3
                                        ; =>      This Loop Header: Depth=4
                                        ;           Child Loop BB0_25 Depth 5
                                        ;           Child Loop BB0_29 Depth 5
	lda	__rc26
	bne	.LBB0_54
; %bb.53:                               ;   in Loop: Header=BB0_52 Depth=4
	cpx	#22
	beq	.LBB0_61
.LBB0_54:                               ;   in Loop: Header=BB0_52 Depth=4
	stx	__rc22
	txa
	clc
	adc	__rc24
	ldx	#1
	bcs	.LBB0_56
; %bb.55:                               ;   in Loop: Header=BB0_52 Depth=4
	ldx	#0
.LBB0_56:                               ;   in Loop: Header=BB0_52 Depth=4
	stx	__rc27
	sta	__rc31
	tax
	lda	__rc30
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
	bne	.LBB0_58
; %bb.57:                               ;   in Loop: Header=BB0_52 Depth=4
	ldx	__rc20
	cpx	__rc2
	beq	.LBB0_61
.LBB0_58:                               ;   in Loop: Header=BB0_52 Depth=4
	lda	__rc26
	ldx	__rc27
	cpx	#1
	adc	__rc25
	beq	.LBB0_59
; %bb.379:                              ;   in Loop: Header=BB0_52 Depth=4
	jmp	.LBB0_20
.LBB0_59:                               ;   in Loop: Header=BB0_52 Depth=4
	ldx	__rc31
	cpx	__rc23
	beq	.LBB0_60
; %bb.381:                              ;   in Loop: Header=BB0_52 Depth=4
	jmp	.LBB0_20
.LBB0_60:                               ;   in Loop: Header=BB0_52 Depth=4
	sta	__rc4
	lda	#0
; %bb.291:                              ;   in Loop: Header=BB0_52 Depth=4
	jmp	.LBB0_21
.LBB0_61:                               ;   in Loop: Header=BB0_62 Depth=3
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	jsr	cputln
	inc	__rc30
	clc
	lda	__rc28
	adc	#2
	sta	__rc28
	clc
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_62:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_52 Depth 4
                                        ;           Child Loop BB0_25 Depth 5
                                        ;           Child Loop BB0_29 Depth 5
	ldx	__rc30
	cpx	#2
	bne	.LBB0_63
; %bb.383:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_78
.LBB0_63:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	__rc28
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
	bcs	.LBB0_65
; %bb.64:                               ;   in Loop: Header=BB0_62 Depth=3
	sta	(__rc20),y
.LBB0_65:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	#40
	lda	__rc30
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
	lda	__rc23
	ora	#2
	sta	__rc25
	ldx	#mos16lo(.L.str.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.36)
	stx	__rc3
                                        ; kill: def $rs1 killed $rs1
	pha
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
	pla
	ldx	#0
	jsr	mcputsxy
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	lda	#mos16lo(diskname)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(diskname)
	adc	#0
	sta	__rc3
	jsr	msprintf
	lda	#32
	jsr	cputc
	lda	mos8(g_curX)
	inc
	pha
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
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
	ldx	#mos16lo(.L.str.37)
	stx	__rc2
	ldx	#mos16hi(.L.str.37)
	stx	__rc3
	ldx	#23
	lda	__rc25
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
	ldx	__rc23
	stx	__rc26
	lda	__rc23
	adc	#12
	pha
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	ldx	#23
	jsr	mcputsxy
	clc
	lda	__rc22
	adc	#68
	sta	__rc2
	lda	__rc24
	adc	#0
	sta	__rc3
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
	ldx	#mos16lo(.L.str.38)
	stx	__rc2
	ldx	#mos16hi(.L.str.38)
	stx	__rc3
	jsr	msprintf
	ldy	#1
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	lda	(__rc20),y
	sta	__rc23
	cmp	#21
	stz	__rc24
	stz	__rc25
	bcc	.LBB0_67
; %bb.66:                               ;   in Loop: Header=BB0_62 Depth=3
	clc
	adc	#235
	sta	__rc24
	lda	#0
	adc	#255
	sta	__rc25
.LBB0_67:                               ;   in Loop: Header=BB0_62 Depth=3
	lda	__rc26
	ora	#1
	sta	__rc29
	stz	__rc26
	ldx	#0
; %bb.293:                              ;   in Loop: Header=BB0_62 Depth=3
	jmp	.LBB0_52
.LBB0_68:                               ;   in Loop: Header=BB0_69 Depth=4
	stx	__rc28
	sta	__rc30
	tya
	sty	__rc26
	jsr	tracksectorstring
	ldx	__rc29
	stx	__rc2
	asl	__rc2
	lda	__rc30
	rol
	asl	__rc2
	rol
	ldx	#mos16lo(.L.str.43)
	stx	__rc2
	ldx	#mos16hi(.L.str.43)
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
	ldx	__rc28
	stx	__rc4
	ldx	__rc26
	lda	__rc27
	jsr	GetOneSector
	clc
	lda	__rc29
	adc	#32
	sta	__rc5
	lda	__rc30
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
	ldx	__rc28
	ldy	__rc26
	inx
.LBB0_69:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ;       Parent Loop BB0_71 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	stx	__rc2
	lda	__rc22
	clc
	adc	__rc2
	sta	__rc29
	lda	__rc23
	adc	#0
	cpx	#40
	beq	.LBB0_70
; %bb.385:                              ;   in Loop: Header=BB0_69 Depth=4
	jmp	.LBB0_68
.LBB0_70:                               ;   in Loop: Header=BB0_71 Depth=3
	ldx	__rc29
	stx	__rc22
	sta	__rc23
	iny
.LBB0_71:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_69 Depth 4
	cpy	#81
	bne	.LBB0_72
; %bb.387:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_235
.LBB0_72:                               ;   in Loop: Header=BB0_71 Depth=3
	ldx	#0
	bra	.LBB0_69
.LBB0_73:                               ;   in Loop: Header=BB0_74 Depth=4
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
	ldx	#mos16lo(.L.str.46)
	stx	__rc2
	ldx	#mos16hi(.L.str.46)
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
	lda	__rc25
	jsr	PutOneSector
	ldx	__rc28
	inx
.LBB0_74:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ;       Parent Loop BB0_76 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	stx	__rc2
	lda	__rc22
	clc
	adc	__rc2
	tay
	lda	__rc23
	adc	#0
	sta	__rc29
	cpx	#40
	beq	.LBB0_75
; %bb.389:                              ;   in Loop: Header=BB0_74 Depth=4
	jmp	.LBB0_73
.LBB0_75:                               ;   in Loop: Header=BB0_76 Depth=3
	sty	__rc22
	sta	__rc23
	ldx	__rc27
	inx
.LBB0_76:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_74 Depth 4
	cpx	#81
	bne	.LBB0_77
; %bb.391:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_236
.LBB0_77:                               ;   in Loop: Header=BB0_76 Depth=3
	stx	__rc27
	ldx	#0
	bra	.LBB0_74
.LBB0_78:                               ;   in Loop: Header=BB0_19 Depth=2
	lda	#0
                                        ; implicit-def: $rc2
.LBB0_79:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_80 Depth 4
	ldx	__rc2
	stx	__rc22
	jsr	shortcuts
.LBB0_80:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ;       Parent Loop BB0_79 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	lda	54800
	bne	.LBB0_82
; %bb.81:                               ;   in Loop: Header=BB0_80 Depth=4
	lda	54801
	sta	__rc2
	cmp	__rc22
	beq	.LBB0_80
	bra	.LBB0_79
.LBB0_82:                               ;   in Loop: Header=BB0_19 Depth=2
	stz	54800
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	stz	53280
	sta	__rc23
	sec
	sbc	#241
	tax
	lda	__rc22
	sbc	#0
	bne	.LBB0_84
; %bb.83:                               ;   in Loop: Header=BB0_19 Depth=2
	cpx	#10
	bra	.LBB0_85
.LBB0_84:                               ;   in Loop: Header=BB0_19 Depth=2
	cmp	#0
.LBB0_85:                               ;   in Loop: Header=BB0_19 Depth=2
	ldy	#0
	bcc	.LBB0_86
; %bb.393:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_91
.LBB0_86:                               ;   in Loop: Header=BB0_19 Depth=2
	ldy	.LJTI0_0,x
	lda	.LJTI0_0+10,x
	tax
	sty	__rc2
	stx	__rc3
	jmp	(__rc2)
.LBB0_87:                               ;   in Loop: Header=BB0_19 Depth=2
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
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
	sta	__rc26
	ldy	#1
	lda	(__rc2),y
	sta	__rc27
	lda	(__rc26),y
	tax
	lda	__rc4
	jsr	getdirententry
	ldy	#2
	lda	(__rc2),y
	tax
	and	#15
	cmp	#5
	bne	.LBB0_88
; %bb.395:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_88:                               ;   in Loop: Header=BB0_19 Depth=2
	txa
	bne	.LBB0_89
; %bb.397:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_89:                               ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	lda	__rc22
	bne	.LBB0_90
; %bb.399:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_198
.LBB0_90:                               ;   in Loop: Header=BB0_19 Depth=2
	lda	__rc20
	clc
	adc	#5
	sta	__rc4
	lda	__rc21
	adc	#0
	sta	__rc5
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	beq	.LBB0_295
; %bb.401:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_206
.LBB0_295:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_230
.LBB0_91:                               ;   in Loop: Header=BB0_19 Depth=2
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	eor	#1
	ldx	__rc22
	bne	.LBB0_93
; %bb.92:                               ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#9
	bne	.LBB0_93
; %bb.403:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_93:                               ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	bne	.LBB0_95
; %bb.94:                               ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#13
	bne	.LBB0_95
; %bb.405:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_104
.LBB0_95:                               ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	bne	.LBB0_98
; %bb.96:                               ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#17
	bne	.LBB0_98
; %bb.97:                               ;   in Loop: Header=BB0_19 Depth=2
	ldy	#21
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
	bra	.LBB0_101
.LBB0_98:                               ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	bne	.LBB0_102
; %bb.99:                               ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#29
	bne	.LBB0_102
; %bb.100:                              ;   in Loop: Header=BB0_19 Depth=2
	ldy	#21
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
	clc
	lda	#10
	adc	(__rc4),y
.LBB0_101:                              ;   in Loop: Header=BB0_19 Depth=2
	sta	(__rc4),y
; %bb.297:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_102:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	bne	.LBB0_105
; %bb.103:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#31
	bne	.LBB0_105
.LBB0_104:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#mos16lo(.L.str.56)
	stx	__rc2
	ldx	#mos16hi(.L.str.56)
	stx	__rc3
	ldx	#mos16lo(.L.str.57)
	stx	__rc4
	ldx	#mos16hi(.L.str.57)
	stx	__rc5
	ldx	#mos16lo(.L.str.36)
	stx	__rc6
	ldx	#mos16hi(.L.str.36)
	stx	__rc7
	lda	#0
	jsr	messagebox
; %bb.299:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_105:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	bne	.LBB0_107
; %bb.106:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#95
	bne	.LBB0_107
; %bb.407:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_130
.LBB0_107:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	beq	.LBB0_108
; %bb.409:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_128
.LBB0_108:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#145
	beq	.LBB0_109
; %bb.411:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_128
.LBB0_109:                              ;   in Loop: Header=BB0_19 Depth=2
	ldy	#21
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
	beq	.LBB0_301
; %bb.413:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_212
.LBB0_301:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_110:                              ;   in Loop: Header=BB0_124 Depth=3
	ldy	#0
	ldx	#0
	bra	.LBB0_114
.LBB0_111:                              ;   in Loop: Header=BB0_114 Depth=4
	cmp	#33
	bcc	.LBB0_113
; %bb.112:                              ;   in Loop: Header=BB0_114 Depth=4
	stx	__rc2
	inc	__rc2
	sta	7233,x
	ldx	__rc2
.LBB0_113:                              ;   in Loop: Header=BB0_114 Depth=4
	iny
.LBB0_114:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ;       Parent Loop BB0_124 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	cpy	#8
	beq	.LBB0_116
; %bb.115:                              ;   in Loop: Header=BB0_114 Depth=4
	lda	6721,y
	cmp	#32
	bne	.LBB0_111
.LBB0_116:                              ;   in Loop: Header=BB0_124 Depth=3
	ldy	#0
	lda	#46
	sta	7233,x
	inx
	bra	.LBB0_120
.LBB0_117:                              ;   in Loop: Header=BB0_120 Depth=4
	cmp	#33
	bcc	.LBB0_119
; %bb.118:                              ;   in Loop: Header=BB0_120 Depth=4
	sta	7233,x
	inx
.LBB0_119:                              ;   in Loop: Header=BB0_120 Depth=4
	iny
.LBB0_120:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ;       Parent Loop BB0_124 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	cpy	#3
	beq	.LBB0_122
; %bb.121:                              ;   in Loop: Header=BB0_120 Depth=4
	lda	6729,y
	cmp	#32
	bne	.LBB0_117
.LBB0_122:                              ;   in Loop: Header=BB0_124 Depth=3
	stz	7233,x
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
	sta	__rc2
	lda	#mos16hi(filelist)
	adc	__rc3
	sta	__rc3
	ldx	#0
	stx	__rc4
	ldx	#26
	stx	__rc5
	jsr	strcpy
	ldy	__rc20
	iny
.LBB0_123:                              ;   in Loop: Header=BB0_124 Depth=3
	inc	__rc22
	lda	__rc21
	ldx	__rc22
.LBB0_124:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_114 Depth 4
                                        ;         Child Loop BB0_120 Depth 4
	cpx	#32
	bne	.LBB0_125
; %bb.415:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_229
.LBB0_125:                              ;   in Loop: Header=BB0_124 Depth=3
	stx	__rc22
	sty	__rc20
	sta	__rc21
	tay
	;APP
	phx
	ldx	#0
	txa
hypreaddirloop0:
	sta	6656,x
	dex
	bne	hypreaddirloop0
	plx
	tya
	tax
	ldy	#mos16hi(6656)
	lda	#20
	sta	54848
	clv
	bcc	errhypreaddir0
	stx	__rc2
	jmp	donehypreaddir0
errhypreaddir0:
	sta	__rc2
donehypreaddir0:
	nop

	;NO_APP
	ldy	__rc2
	ldx	6720
	stz	6656,x
	cpy	#133
	beq	.LBB0_127
; %bb.126:                              ;   in Loop: Header=BB0_124 Depth=3
	cpy	#255
	beq	.LBB0_127
; %bb.417:                              ;   in Loop: Header=BB0_124 Depth=3
	jmp	.LBB0_110
.LBB0_127:                              ;   in Loop: Header=BB0_124 Depth=3
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
	sta	__rc2
	lda	#mos16hi(filelist)
	adc	__rc3
	sta	__rc3
	lda	#32
	sta	(__rc2)
	ldy	#1
	lda	#0
	sta	(__rc2),y
	ldy	__rc20
	bra	.LBB0_123
.LBB0_128:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	bne	.LBB0_134
; %bb.129:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#157
	bne	.LBB0_134
.LBB0_130:                              ;   in Loop: Header=BB0_19 Depth=2
	ldy	#21
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
	cmp	#11
	bcs	.LBB0_131
; %bb.419:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_193
.LBB0_131:                              ;   in Loop: Header=BB0_19 Depth=2
	clc
	adc	#246
	sta	(__rc2),y
; %bb.303:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_132:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	54801
	cpx	#1
	bne	.LBB0_133
; %bb.421:
	jmp	.LBB0_271
.LBB0_133:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	54801
	cpx	#2
	beq	.LBB0_305
; %bb.423:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_305:
	jmp	.LBB0_271
.LBB0_134:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	cpx	#1
	beq	.LBB0_135
; %bb.425:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_179
.LBB0_135:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#242
	beq	.LBB0_136
; %bb.427:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_179
.LBB0_136:                              ;   in Loop: Header=BB0_19 Depth=2
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
	ldy	#0
	cpx	#255
	beq	.LBB0_139
; %bb.137:                              ;   in Loop: Header=BB0_19 Depth=2
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
	beq	.LBB0_139
; %bb.138:                              ;   in Loop: Header=BB0_19 Depth=2
	cmp	#135
	beq	.LBB0_139
; %bb.429:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_195
.LBB0_139:                              ;   in Loop: Header=BB0_19 Depth=2
	dey
	lda	#0
	pha
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	pla
	asl	__rc2
	rol
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc2
	sta	__rc4
	lda	#mos16hi(midnight)
	adc	__rc3
	cpy	#18
	pha
	tya
	phy
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	tya
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	bcc	.LBB0_141
; %bb.140:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#18
	pha
	txa
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
.LBB0_141:                              ;   in Loop: Header=BB0_19 Depth=2
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	lda	__rc4
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc21
; %bb.307:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_163
.LBB0_142:                              ;   in Loop: Header=BB0_169 Depth=4
	ora	#32
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.51)
	stx	__rc2
	ldx	#mos16hi(.L.str.51)
	stx	__rc3
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	tax
	lda	#10
	jsr	cputsxy
	ldx	__rc20
	stx	__rc2
	ldx	__rc21
	stx	__rc3
	jsr	cputs
	ldx	#mos16lo(.L.str.1.52)
	stx	__rc2
	ldx	#mos16hi(.L.str.1.52)
	stx	__rc3
	jsr	cputs
; %bb.309:                              ;   in Loop: Header=BB0_169 Depth=4
	jmp	.LBB0_175
.LBB0_143:                              ;   in Loop: Header=BB0_163 Depth=3
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	jsr	cputln
	jsr	cgetc
	cmp	#145
	beq	.LBB0_154
; %bb.144:                              ;   in Loop: Header=BB0_163 Depth=3
	cmp	#157
	beq	.LBB0_152
; %bb.145:                              ;   in Loop: Header=BB0_163 Depth=3
	cmp	#13
	beq	.LBB0_156
; %bb.146:                              ;   in Loop: Header=BB0_163 Depth=3
	cmp	#17
	bne	.LBB0_147
; %bb.431:                              ;   in Loop: Header=BB0_163 Depth=3
	jmp	.LBB0_158
.LBB0_147:                              ;   in Loop: Header=BB0_163 Depth=3
	cmp	#29
	bne	.LBB0_148
; %bb.433:                              ;   in Loop: Header=BB0_163 Depth=3
	jmp	.LBB0_159
.LBB0_148:                              ;   in Loop: Header=BB0_163 Depth=3
	cmp	#95
	beq	.LBB0_152
; %bb.149:                              ;   in Loop: Header=BB0_163 Depth=3
	cmp	#3
	bne	.LBB0_150
; %bb.435:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_150:                              ;   in Loop: Header=BB0_163 Depth=3
	cmp	#27
	bne	.LBB0_151
; %bb.437:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_151:                              ;   in Loop: Header=BB0_163 Depth=3
	stz	__rc2
	stz	__rc3
	ldx	#0
	jsr	mh4printf
	lda	#32
	jsr	cputc
	ldx	__rc29
	stx	__rc21
; %bb.311:                              ;   in Loop: Header=BB0_163 Depth=3
	jmp	.LBB0_163
.LBB0_152:                              ;   in Loop: Header=BB0_163 Depth=3
	lda	__rc29
	cmp	#11
	stz	__rc21
	bcs	.LBB0_153
; %bb.439:                              ;   in Loop: Header=BB0_163 Depth=3
	jmp	.LBB0_163
.LBB0_153:                              ;   in Loop: Header=BB0_163 Depth=3
	clc
	adc	#246
	sta	__rc21
; %bb.313:                              ;   in Loop: Header=BB0_163 Depth=3
	jmp	.LBB0_163
.LBB0_154:                              ;   in Loop: Header=BB0_163 Depth=3
	stz	__rc21
	lda	__rc29
	bne	.LBB0_155
; %bb.441:                              ;   in Loop: Header=BB0_163 Depth=3
	jmp	.LBB0_163
.LBB0_155:                              ;   in Loop: Header=BB0_163 Depth=3
	ldx	__rc29
	dex
	stx	__rc21
; %bb.315:                              ;   in Loop: Header=BB0_163 Depth=3
	jmp	.LBB0_163
.LBB0_156:                              ;   in Loop: Header=BB0_163 Depth=3
	lda	(__rc24)
	sta	__rc22
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc29
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	#mos16lo(filelist)
	clc
	adc	__rc2
	sta	__rc20
	lda	#mos16hi(filelist)
	adc	__rc3
	sta	__rc21
	ldx	#28
	stx	fnamehi
	ldx	#0
	stx	__rc2
	ldx	#28
	stx	__rc3
	ldx	__rc20
	stx	__rc4
	sta	__rc5
	jsr	strcpy
	ldy	fnamehi
	;APP
	ldx	#0
	lda	#46
	sta	54848
	clv
	bcc	errhypsetnam3
	lda	#0
	sta	__rc2
	jmp	donehypsetnam3
errhypsetnam3:
	lda	#255
	sta	__rc2
donehypsetnam3:
	nop

	;NO_APP
	lda	__rc22
	beq	.LBB0_160
; %bb.157:                              ;   in Loop: Header=BB0_163 Depth=3
	;APP
	ldx	#0
	lda	#70
	sta	54848
	clv
	bcc	errhyp1att4
	lda	#0
	sta	__rc2
	jmp	donehyp1att4
errhyp1att4:
	lda	#255
	sta	__rc2
donehyp1att4:
	nop

	;NO_APP
	bra	.LBB0_161
.LBB0_158:                              ;   in Loop: Header=BB0_163 Depth=3
	ldx	__rc29
	stx	__rc21
	inc	__rc21
	bra	.LBB0_163
.LBB0_159:                              ;   in Loop: Header=BB0_163 Depth=3
	clc
	lda	__rc29
	adc	#10
	sta	__rc21
	bra	.LBB0_163
.LBB0_160:                              ;   in Loop: Header=BB0_163 Depth=3
	;APP
	ldx	#0
	lda	#64
	sta	54848
	clv
	bcc	errhyp0att5
	lda	#0
	sta	__rc2
	jmp	donehyp0att5
errhyp0att5:
	lda	#255
	sta	__rc2
donehyp0att5:
	nop

	;NO_APP
.LBB0_161:                              ;   in Loop: Header=BB0_163 Depth=3
	lda	__rc2
	bne	.LBB0_162
; %bb.443:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_194
.LBB0_162:                              ;   in Loop: Header=BB0_163 Depth=3
	ldx	#mos16lo(.L.str.30)
	stx	__rc2
	ldx	#mos16hi(.L.str.30)
	stx	__rc3
	ldx	#mos16lo(.L.str.31)
	stx	__rc4
	ldx	#mos16hi(.L.str.31)
	stx	__rc5
	ldx	__rc20
	stx	__rc6
	ldx	__rc21
	stx	__rc7
	lda	#0
	jsr	messagebox
	ldx	__rc29
	stx	__rc21
.LBB0_163:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_169 Depth 4
	lda	#255
	jsr	shortcuts
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc21
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
	stz	__rc20
	ldx	#0
	tay
	beq	.LBB0_166
; %bb.164:                              ;   in Loop: Header=BB0_163 Depth=3
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	cmp	__rc21
	ldx	__rc21
	bcs	.LBB0_166
; %bb.165:                              ;   in Loop: Header=BB0_163 Depth=3
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
.LBB0_166:                              ;   in Loop: Header=BB0_163 Depth=3
	stx	__rc21
	ldx	#73
	stx	__rc2
	ldx	#22
	stx	__rc3
	ldx	#1
	stx	__rc4
	inx
	lda	#8
	jsr	mcbox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.28)
	stx	__rc2
	ldx	#mos16hi(.L.str.28)
	stx	__rc3
	ldx	#2
	lda	#12
	jsr	mcputsxy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	lda	(__rc4)
	sta	__rc30
	sta	__rc24
	ldy	#1
	lda	(__rc4),y
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc25
	lda	(__rc24)
	stz	__rc2
	stz	__rc3
	stz	__rc4
	ldx	#0
	jsr	csputdec
	ldx	#mos16lo(.L.str.29)
	stx	__rc2
	ldx	#mos16hi(.L.str.29)
	stx	__rc3
	jsr	msprintf
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	__rc21
	cpx	#17
	stz	__rc4
	stx	__rc29
	bcc	.LBB0_168
; %bb.167:                              ;   in Loop: Header=BB0_163 Depth=3
	clc
	txa
	adc	#239
	sta	__rc20
	lda	#0
	adc	#255
	sta	__rc4
.LBB0_168:                              ;   in Loop: Header=BB0_163 Depth=3
	sec
	txa
	sbc	__rc20
	sta	__rc28
	lda	#0
	sbc	__rc4
	sta	__rc31
	ldx	#4
	txa
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	__rc4
	lda	__rc20
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	#mos16lo(filelist)
	clc
	adc	__rc2
	sta	__rc20
	lda	#mos16hi(filelist)
	adc	__rc3
	sta	__rc21
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc26
	stz	__rc27
.LBB0_169:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ;       Parent Loop BB0_163 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	lda	__rc27
	bne	.LBB0_171
; %bb.170:                              ;   in Loop: Header=BB0_169 Depth=4
	lda	__rc26
	bne	.LBB0_171
; %bb.445:                              ;   in Loop: Header=BB0_163 Depth=3
	jmp	.LBB0_143
.LBB0_171:                              ;   in Loop: Header=BB0_169 Depth=4
	lda	(__rc20)
	bne	.LBB0_172
; %bb.447:                              ;   in Loop: Header=BB0_163 Depth=3
	jmp	.LBB0_143
.LBB0_172:                              ;   in Loop: Header=BB0_169 Depth=4
	lda	mos8(g_curTextColor)
	ldx	__rc28
	ldy	__rc31
	bne	.LBB0_174
; %bb.173:                              ;   in Loop: Header=BB0_169 Depth=4
	cpx	#0
	bne	.LBB0_174
; %bb.449:                              ;   in Loop: Header=BB0_169 Depth=4
	jmp	.LBB0_142
.LBB0_174:                              ;   in Loop: Header=BB0_169 Depth=4
	and	#223
	sta	mos8(g_curTextColor)
	ldx	__rc20
	stx	__rc2
	ldx	__rc21
	stx	__rc3
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	tax
	lda	#12
	jsr	cputsxy
.LBB0_175:                              ;   in Loop: Header=BB0_169 Depth=4
	lda	__rc20
	clc
	adc	#65
	sta	__rc20
	lda	__rc21
	adc	#0
	sta	__rc21
	inc	__rc22
	lda	__rc22
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc28
	dec	__rc28
	cpx	#0
	bne	.LBB0_177
; %bb.176:                              ;   in Loop: Header=BB0_169 Depth=4
	dec	__rc31
.LBB0_177:                              ;   in Loop: Header=BB0_169 Depth=4
	ldx	__rc26
	dec	__rc26
	cpx	#0
	beq	.LBB0_178
; %bb.451:                              ;   in Loop: Header=BB0_169 Depth=4
	jmp	.LBB0_169
.LBB0_178:                              ;   in Loop: Header=BB0_169 Depth=4
	dec	__rc27
; %bb.317:                              ;   in Loop: Header=BB0_169 Depth=4
	jmp	.LBB0_169
.LBB0_179:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	cpx	#1
	bne	.LBB0_180
; %bb.453:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_197
.LBB0_180:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	cpx	#1
	beq	.LBB0_319
; %bb.455:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_214
.LBB0_319:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_213
.LBB0_181:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	__rc2
	stx	__rc25
	ldx	__rc30
	stx	__rc2
	cpy	__rc2
	bne	.LBB0_183
; %bb.182:                              ;   in Loop: Header=BB0_181 Depth=3
	ldx	__rc25
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	cpx	__rc2
	bcc	.LBB0_184
; %bb.321:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_207
.LBB0_183:                              ;   in Loop: Header=BB0_181 Depth=3
	stx	__rc2
	cpy	__rc2
	bcc	.LBB0_184
; %bb.457:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_207
.LBB0_184:                              ;   in Loop: Header=BB0_181 Depth=3
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
	adc	__rc22
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
	ldy	#15
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
	stx	__rc28
	ldx	__rc10
	ldy	__rc11
	sty	__rc29
	lda	__rc11
	jsr	lcopy
	lda	__rc25
	beq	.LBB0_187
; %bb.185:                              ;   in Loop: Header=BB0_181 Depth=3
	lda	__rc25
	and	#7
	bne	.LBB0_187
; %bb.186:                              ;   in Loop: Header=BB0_181 Depth=3
	ldx	__rc24
	txa
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc23
	txa
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_187:                              ;   in Loop: Header=BB0_181 Depth=3
	ldx	6656
	beq	.LBB0_189
; %bb.188:                              ;   in Loop: Header=BB0_181 Depth=3
	clc
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc30
	adc	#0
	sta	__rc30
	stx	__rc24
	ldx	6657
	stx	__rc23
.LBB0_189:                              ;   in Loop: Header=BB0_181 Depth=3
	ldy	#0
	lda	#32
	ldx	__rc25
	inx
	stx	__rc2
	pha
	phy
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	pla
	cpx	__rc25
	beq	.LBB0_323
; %bb.459:                              ;   in Loop: Header=BB0_181 Depth=3
	jmp	.LBB0_181
.LBB0_323:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_283
.LBB0_190:                              ;   in Loop: Header=BB0_19 Depth=2
	stx	__rc7
; %bb.191:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#mos16lo(.L.str.49)
	stx	__rc2
	ldx	#mos16hi(.L.str.49)
	stx	__rc3
	lda	#0
	jsr	messagebox
	tax
	beq	.LBB0_192
; %bb.461:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_209
.LBB0_192:                              ;   in Loop: Header=BB0_19 Depth=2
	lda	(__rc26)
	pha
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	jsr	getdirent
	ldy	#2
	sta	(__rc26),y
; %bb.325:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_193:                              ;   in Loop: Header=BB0_19 Depth=2
	lda	#0
	sta	(__rc2),y
; %bb.327:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_194:                              ;   in Loop: Header=BB0_19 Depth=2
	lda	(__rc24)
	pha
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	pla
	ldx	__rc22
	jsr	UpdateSectors
	clc
	lda	__rc30
	adc	#3
	tax
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#0
	stx	__rc2
	sta	__rc3
	ldx	__rc20
	stx	__rc4
	ldx	__rc21
	stx	__rc5
	jsr	strcpy
	lda	(__rc24)
	ldx	__rc22
	jsr	UpdateSectors
; %bb.329:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_195:                              ;   in Loop: Header=BB0_19 Depth=2
	cmp	#255
	bne	.LBB0_196
; %bb.463:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_139
.LBB0_196:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#0
; %bb.331:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_124
.LBB0_197:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#248
	beq	.LBB0_333
; %bb.465:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_180
.LBB0_333:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_87
.LBB0_198:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#245
	beq	.LBB0_199
; %bb.467:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_90
.LBB0_199:                              ;   in Loop: Header=BB0_19 Depth=2
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
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	pla
	cpx	#0
	beq	.LBB0_201
; %bb.200:                              ;   in Loop: Header=BB0_19 Depth=2
	lda	#0
.LBB0_201:                              ;   in Loop: Header=BB0_19 Depth=2
	asl
	tax
	lda	midnight,x
	sta	__rc22
	clc
	adc	#68
	sta	__rc4
	lda	midnight+1,x
	sta	__rc23
	adc	#0
	sta	__rc5
	lda	(__rc4),y
	cmp	__rc2
	bne	.LBB0_203
; %bb.202:                              ;   in Loop: Header=BB0_19 Depth=2
	ldy	#30
	lda	(__rc20),y
	sta	__rc2
	ldy	#68
	lda	(__rc22),y
.LBB0_203:                              ;   in Loop: Header=BB0_19 Depth=2
	cmp	__rc2
	bcs	.LBB0_204
; %bb.469:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_234
.LBB0_204:                              ;   in Loop: Header=BB0_19 Depth=2
	lda	__rc20
	clc
	adc	#5
	sta	__rc4
	lda	__rc21
	adc	#0
	sta	__rc5
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	bne	.LBB0_205
; %bb.471:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_237
.LBB0_205:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#mos16lo(.L.str.41.75)
	stx	__rc6
	ldx	#mos16hi(.L.str.41.75)
; %bb.335:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_238
.LBB0_206:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#mos16lo(.L.str.50)
	stx	__rc6
	ldx	#mos16hi(.L.str.50)
; %bb.337:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_190
.LBB0_207:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#mos16lo(.L.str.46)
	stx	__rc2
	ldx	#mos16hi(.L.str.46)
	stx	__rc3
	ldx	#mos16lo(.L.str.53)
	stx	__rc4
	ldx	#mos16hi(.L.str.53)
	stx	__rc5
	lda	#80
	jsr	progress
	lda	(__rc26)
	pha
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	pla
	ldx	__rc20
	jsr	PutBAM
	lda	(__rc26)
.LBB0_208:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc20
	jsr	UpdateSectors
; %bb.339:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_192
.LBB0_209:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#3
	txa
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#mos16lo(.L.str.43)
	stx	__rc2
	ldx	#mos16hi(.L.str.43)
	stx	__rc3
	ldx	#mos16lo(.L.str.45)
	stx	__rc4
	ldx	#mos16hi(.L.str.45)
	stx	__rc5
	lda	#20
	jsr	progress
	lda	#0
	ldy	#2
	sta	(__rc20),y
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	jsr	GetBAM
	ldx	#mos16lo(.L.str.46)
	stx	__rc2
	ldx	#mos16hi(.L.str.46)
	stx	__rc3
	ldx	#mos16lo(.L.str.52)
	stx	__rc4
	ldx	#mos16hi(.L.str.52)
	stx	__rc5
	lda	#40
	tax
	pha
	txa
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	jsr	progress
	lda	(__rc26)
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#1
	lda	(__rc26),y
	ldy	#22
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
	sta	__rc22
	ldy	#0
	stx	__rc21
	ldx	__rc2
	stx	__rc20
	lda	__rc3
	ldx	#8
	phy
	pha
	txa
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ora	#8
	sta	__rc31
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	stz	__rc30
	stz	__rc2
	stz	__rc24
	stz	__rc23
; %bb.341:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_181
.LBB0_210:                              ;   in Loop: Header=BB0_211 Depth=3
	lda	#0
	sta	__rc2
	lda	#24
	sta	__rc3
	sty	__rc4
	stx	__rc20
	sty	__rc21
	ldy	#19
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
.LBB0_211:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	txa
	bne	.LBB0_210
; %bb.343:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_284
.LBB0_212:                              ;   in Loop: Header=BB0_19 Depth=2
	dec
	sta	(__rc2),y
; %bb.345:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_213:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#250
	bne	.LBB0_214
; %bb.473:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_132
.LBB0_214:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	cpx	#8
	beq	.LBB0_215
; %bb.475:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_220
.LBB0_215:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#246
	beq	.LBB0_216
; %bb.477:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_220
.LBB0_216:                              ;   in Loop: Header=BB0_19 Depth=2
	sta	__rc24
	ldx	#mos16lo(.L.str.54)
	stx	__rc2
	ldx	#mos16hi(.L.str.54)
	stx	__rc3
	ldx	#mos16lo(.L.str.55)
	stx	__rc4
	ldx	#mos16hi(.L.str.55)
	stx	__rc5
	ldx	#mos16lo(.L.str.36)
	stx	__rc6
	ldx	#mos16hi(.L.str.36)
	stx	__rc7
	lda	#0
	jsr	messagebox
	tax
	bne	.LBB0_217
; %bb.479:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_217:                              ;   in Loop: Header=BB0_19 Depth=2
	ldy	#21
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
	ldy	#1
	sta	__rc5
	lda	(__rc4)
	sta	__rc2
	lda	(__rc4),y
	sta	__rc3
	stz	__rc22
	sty	__rc6
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	beq	.LBB0_219
; %bb.218:                              ;   in Loop: Header=BB0_19 Depth=2
	stz	__rc6
.LBB0_219:                              ;   in Loop: Header=BB0_19 Depth=2
	lda	(__rc2)
	sta	__rc27
	asl	__rc6
	ldx	__rc6
	ldy	midnight,x
	lda	midnight+1,x
	tax
	sty	__rc20
	ldy	#1
	stx	__rc21
	stz	__rc23
	lda	(__rc20)
	sta	__rc25
; %bb.347:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_71
.LBB0_220:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	cpx	#2
	bne	.LBB0_222
; %bb.221:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#242
	bne	.LBB0_222
; %bb.481:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_136
.LBB0_222:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	cpx	#2
	bne	.LBB0_224
; %bb.223:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#248
	bne	.LBB0_224
; %bb.483:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_87
.LBB0_224:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	cpx	#2
	bne	.LBB0_226
; %bb.225:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc23
	cpx	#250
	bne	.LBB0_226
; %bb.485:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_132
.LBB0_226:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	lda	__rc23
	cpx	#4
	bne	.LBB0_231
; %bb.227:                              ;   in Loop: Header=BB0_19 Depth=2
	cmp	#18
	bne	.LBB0_231
; %bb.228:                              ;   in Loop: Header=BB0_19 Depth=2
	ldy	#21
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
; %bb.349:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_229:                              ;   in Loop: Header=BB0_19 Depth=2
	tax
	;APP
	lda	#22
	sta	54848
	clv
	bcc	errhypclosedir6
	stx	__rc2
	jmp	donehypclosedir6
errhypclosedir6:
	sta	__rc2
donehypclosedir6:
	nop

	;NO_APP
; %bb.351:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_139
.LBB0_230:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#mos16lo(.L.str.51.76)
	stx	__rc6
	ldx	#mos16hi(.L.str.51.76)
; %bb.353:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_190
.LBB0_231:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	__rc22
	cpx	#2
	bne	.LBB0_233
; %bb.232:                              ;   in Loop: Header=BB0_19 Depth=2
	cmp	#145
	bne	.LBB0_233
; %bb.487:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_109
.LBB0_233:                              ;   in Loop: Header=BB0_19 Depth=2
	sty	__rc2
	sty	__rc3
	ldx	__rc22
	jsr	mh4printf
	lda	#32
	jsr	cputc
; %bb.355:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_234:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#mos16lo(.L.str.39)
	stx	__rc2
	ldx	#mos16hi(.L.str.39)
	stx	__rc3
	ldx	#mos16lo(.L.str.40)
	stx	__rc4
	ldx	#mos16hi(.L.str.40)
	stx	__rc5
	ldx	#mos16lo(.L.str.36)
	stx	__rc6
	ldx	#mos16hi(.L.str.36)
	stx	__rc7
	lda	#0
	jsr	messagebox
; %bb.357:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_192
.LBB0_235:                              ;   in Loop: Header=BB0_19 Depth=2
	stz	__rc22
	ldx	#1
	stz	__rc23
; %bb.359:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_76
.LBB0_236:                              ;   in Loop: Header=BB0_19 Depth=2
	lda	(__rc20)
	ldx	__rc24
	jsr	UpdateSectors
; %bb.361:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_19
.LBB0_237:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#mos16lo(.L.str.42)
	stx	__rc6
	ldx	#mos16hi(.L.str.42)
.LBB0_238:                              ;   in Loop: Header=BB0_19 Depth=2
	stx	__rc7
	ldx	#mos16lo(.L.str.39)
	stx	__rc2
	ldx	#mos16hi(.L.str.39)
	stx	__rc3
	lda	#0
	jsr	messagebox
	tax
	bne	.LBB0_239
; %bb.489:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_192
.LBB0_239:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#mos16lo(.L.str.43)
	stx	__rc2
	ldx	#mos16hi(.L.str.43)
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
	ldx	#mos16lo(.L.str.44)
	stx	__rc4
	ldx	#mos16hi(.L.str.44)
	stx	__rc5
	lda	#20
	jsr	progress
	lda	(__rc26)
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
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	#mos16lo(.L.str.45)
	stx	__rc4
	ldx	#mos16hi(.L.str.45)
	stx	__rc5
	lda	#30
	jsr	progress
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	eor	#1
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	GetBAM
	ldx	#mos16lo(.L.str.46)
	stx	__rc2
	ldx	#mos16hi(.L.str.46)
	stx	__rc3
	ldx	#mos16lo(.L.str.47)
	stx	__rc4
	ldx	#mos16hi(.L.str.47)
	stx	__rc5
	lda	#40
	jsr	progress
	clc
	lda	__rc0
	adc	#28
	sta	__rc28
	lda	__rc1
	adc	#0
	sta	__rc29
	lda	#0
	sta	(__rc28)
	clc
	lda	__rc0
	adc	#27
	sta	__rc30
	lda	__rc1
	adc	#0
	sta	__rc31
	lda	#255
	tax
	pha
	txa
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	(__rc30)
                                        ; kill: def $rs11 killed $rs11
	lda	__rc22
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc23
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	(__rc22)
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	53376
	clc
	lda	__rc0
	adc	#26
	sta	__rc22
	lda	__rc1
	adc	#0
	sta	__rc23
	ldx	__rc22
	stx	__rc2
	sta	__rc3
	clc
	lda	__rc0
	adc	#25
	sta	__rc24
	lda	__rc1
	adc	#0
	sta	__rc25
	ldx	__rc24
	stx	__rc4
	sta	__rc5
	stz	__rc6
	lda	#0
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#0
	jsr	findnextBAMtracksector
	lda	(__rc24)
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc24
	lda	(__rc22)
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc22
	ldy	#0
	ldx	#0
.LBB0_240:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	cpx	#12
	bne	.LBB0_242
; %bb.241:                              ;   in Loop: Header=BB0_240 Depth=3
	cpy	#128
	bne	.LBB0_242
; %bb.491:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_247
.LBB0_242:                              ;   in Loop: Header=BB0_240 Depth=3
	sty	__rc25
	tya
	clc
	adc	#32
	sta	__rc10
	stx	__rc23
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
	beq	.LBB0_244
; %bb.243:                              ;   in Loop: Header=BB0_240 Depth=3
	ldx	__rc28
	stx	__rc2
	ldx	__rc29
	stx	__rc3
	ldx	__rc30
	stx	__rc4
	ldx	__rc31
	stx	__rc5
	lda	#0
	jsr	findnextBAMtracksector
	lda	(__rc28)
	sta	6144
	lda	(__rc30)
	sta	6145
	lda	(__rc28)
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	(__rc30)
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_244:                              ;   in Loop: Header=BB0_240 Depth=3
	ldx	#0
	stx	__rc2
	ldx	#24
	stx	__rc3
	ldx	__rc24
	stx	__rc4
	ldx	__rc22
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	PutOneSector
	lda	6144
	ldy	__rc25
	ldx	__rc23
	iny
	bne	.LBB0_246
; %bb.245:                              ;   in Loop: Header=BB0_240 Depth=3
	inx
.LBB0_246:                              ;   in Loop: Header=BB0_240 Depth=3
	pha
	phy
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc22
	pla
	beq	.LBB0_249
; %bb.493:                              ;   in Loop: Header=BB0_240 Depth=3
	jmp	.LBB0_240
.LBB0_247:                              ;   in Loop: Header=BB0_19 Depth=2
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	beq	.LBB0_249
; %bb.248:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#mos16lo(.L.str.16)
	stx	__rc2
	ldx	#mos16hi(.L.str.16)
	stx	__rc3
	ldx	#mos16lo(.L.str.17)
	stx	__rc4
	ldx	#mos16hi(.L.str.17)
	stx	__rc5
	ldx	#mos16lo(.L.str.36)
	stx	__rc6
	ldx	#mos16hi(.L.str.36)
	stx	__rc7
	lda	#0
	jsr	messagebox
.LBB0_249:                              ;   in Loop: Header=BB0_19 Depth=2
	ldy	#3
	phy
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc20),y
	ldy	#4
	phy
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc20),y
	ldx	#mos16lo(.L.str.46)
	stx	__rc2
	ldx	#mos16hi(.L.str.46)
	stx	__rc3
	ldx	#mos16lo(.L.str.48)
	stx	__rc4
	ldx	#mos16hi(.L.str.48)
	stx	__rc5
	lda	#60
	jsr	progress
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc8
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc9
	lda	(__rc8)
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	53376
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	beq	.LBB0_251
; %bb.250:                              ;   in Loop: Header=BB0_19 Depth=2
	stz	__rc30
	bra	.LBB0_252
.LBB0_251:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#14
	stx	__rc30
.LBB0_252:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#8
	stx	__rc6
	ldx	#0
	stz	__rc31
	ldy	#3
	tya
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#40
	tya
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#8
	tya
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc28
	stz	__rc25
	ldy	#0
	stz	__rc29
; %bb.363:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_263
.LBB0_253:                              ;   in Loop: Header=BB0_263 Depth=3
	cpx	__rc29
	bcc	.LBB0_254
; %bb.495:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_265
.LBB0_254:                              ;   in Loop: Header=BB0_263 Depth=3
                                        ; kill: def $rs4 killed $rs4
	phy
	lda	__rc8
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc9
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	sty	__rc2
	lsr	__rc2
	sty	__rc24
	lda	#0
	ror
	lsr	__rc2
	ror
	pha
	lda	__rc2
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	lsr	__rc2
	ldx	__rc2
	stx	__rc4
	ror
	sta	__rc2
	stz	__rc3
	lda	#0
	clc
	adc	__rc2
	tay
	lda	__rc4
	adc	__rc30
	sta	__rc10
	lda	#0
	adc	#0
	tax
	lda	__rc6
	sta	__rc22
	lda	__rc6
	adc	#0
	phy
	pha
	txa
	ldy	#14
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stx	__rc2
	ldy	#12
	sta	(__rc0),y                       ; 1-byte Folded Spill
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
	txa
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	tya
	sty	__rc23
	jsr	lcopy
	lda	__rc24
	and	#7
	beq	.LBB0_256
; %bb.255:                              ;   in Loop: Header=BB0_263 Depth=3
	ldy	#1
	ldx	__rc24
	bra	.LBB0_258
.LBB0_256:                              ;   in Loop: Header=BB0_263 Depth=3
	ldy	#1
	ldx	__rc24
	bne	.LBB0_257
; %bb.497:                              ;   in Loop: Header=BB0_263 Depth=3
	jmp	.LBB0_285
.LBB0_257:                              ;   in Loop: Header=BB0_263 Depth=3
	stx	__rc25
	lda	__rc28
	phy
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc31
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
.LBB0_258:                              ;   in Loop: Header=BB0_263 Depth=3
	lda	__rc22
	sta	__rc6
	lda	6912
	pha
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc8
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc9
	pla
	beq	.LBB0_260
; %bb.259:                              ;   in Loop: Header=BB0_263 Depth=3
	stx	__rc2
	clc
	sta	__rc28
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	lda	__rc29
	adc	#0
	sta	__rc29
	ldx	6913
	stx	__rc31
	ldx	__rc28
	stx	__rc3
	bra	.LBB0_261
.LBB0_260:                              ;   in Loop: Header=BB0_263 Depth=3
	sta	__rc3
	stx	__rc2
.LBB0_261:                              ;   in Loop: Header=BB0_263 Depth=3
	lda	#15
	and	6914
	bne	.LBB0_262
; %bb.499:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_286
.LBB0_262:                              ;   in Loop: Header=BB0_263 Depth=3
	ldy	__rc2
	iny
	ldx	#0
.LBB0_263:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_19 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	cpx	__rc29
	beq	.LBB0_264
; %bb.501:                              ;   in Loop: Header=BB0_263 Depth=3
	jmp	.LBB0_253
.LBB0_264:                              ;   in Loop: Header=BB0_263 Depth=3
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	cpy	__rc2
	bcs	.LBB0_265
; %bb.503:                              ;   in Loop: Header=BB0_263 Depth=3
	jmp	.LBB0_254
.LBB0_265:                              ;   in Loop: Header=BB0_19 Depth=2
	lsr	__rc25
	ldx	#1
	bcs	.LBB0_267
; %bb.266:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#0
.LBB0_267:                              ;   in Loop: Header=BB0_19 Depth=2
	stx	__rc4
	ldx	__rc25
	clc
	lda	__rc0
	adc	#30
	sta	__rc22
	lda	__rc1
	adc	#0
	sta	__rc23
	clc
	lda	__rc0
	adc	#29
	sta	__rc24
	lda	__rc1
	adc	#0
	sta	__rc25
	lda	__rc28
	sta	(__rc22)
	lda	__rc31
	sta	(__rc24)
	tya
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#0
	ldy	__rc4
	cpy	#1
	ror
	stx	__rc2
	lsr	__rc2
	pha
	lda	__rc2
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ror
	pha
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	pla
	lsr	__rc2
	ror
	sta	__rc3
	stz	__rc4
	ldx	__rc30
	txa
	ldy	#11
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#0
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	adc	__rc3
	sta	__rc30
	txa
	adc	__rc2
	sta	__rc28
	lda	#0
	adc	#0
	tay
	lda	__rc6
	phy
	ldy	#12
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	adc	#0
	sta	__rc31
	sty	__rc2
	pha
	tya
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	__rc3
	ldx	#27
	stx	__rc5
	ldx	__rc6
	stx	__rc29
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc28
	lda	__rc30
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
	ldy	#14
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	(__rc24)
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc30
	stx	__rc4
	ldx	__rc28
	stx	__rc5
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc6
	stz	__rc2
	stz	__rc3
	ldx	__rc31
	stx	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	#27
	lda	#0
	jsr	lcopy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	lsr
	sta	__rc3
	lda	#0
	stz	__rc2
	clc
	adc	__rc2
	pha
	lda	#1
	bcs	.LBB0_269
; %bb.268:                              ;   in Loop: Header=BB0_19 Depth=2
	lda	#0
.LBB0_269:                              ;   in Loop: Header=BB0_19 Depth=2
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	tay
	sty	__rc17
	ldy	#9
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc3
	pha
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	__rc17
	cmp	#1
	pla
	adc	__rc23
	sta	__rc10
	lda	#0
	adc	__rc2
	sta	__rc2
	lda	#0
	adc	__rc29
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
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	jsr	PutOneSector
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	lsr	__rc2
	lda	#0
	ror
	lsr	__rc2
	ror
	ldx	__rc2
	ldy	__rc2
	sty	__rc31
	stx	__rc3
	lsr	__rc3
	ror
	sta	__rc2
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	clc
	adc	__rc2
	sta	__rc24
	lda	__rc3
	adc	__rc23
	sta	__rc22
	txa
	adc	#0
	sta	__rc25
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#0
	sta	__rc30
	ldx	__rc25
	stx	__rc2
	sta	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#1
	stx	__rc6
	ldx	__rc22
	lda	__rc24
	jsr	lfill
	lda	#0
	sta	(__rc20)
	dec
	ldy	#1
	sta	(__rc20),y
	ldx	__rc24
	stx	__rc4
	ldx	__rc22
	stx	__rc5
	ldx	__rc25
	stx	__rc6
	stz	__rc2
	stz	__rc3
	stz	__rc9
	ldx	__rc30
	stx	__rc7
	ldx	#32
	stx	__rc8
	ldx	__rc21
	lda	__rc20
	jsr	lcopy
	lda	__rc31
	lsr
	pha
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	cmp	#1
	pla
	adc	__rc23
	tax
	lda	#0
	stz	__rc2
	adc	__rc2
	sta	__rc2
	lda	#0
	adc	__rc29
	sta	__rc3
	stz	__rc4
	ldy	#24
	sty	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldy	#1
	sty	__rc9
	ldy	#9
	lda	(__rc0),y                       ; 1-byte Folded Reload
	pha
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	pla
	jsr	lcopy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	lda	__rc28
.LBB0_270:                              ;   in Loop: Header=BB0_19 Depth=2
	jsr	PutOneSector
	ldx	#mos16lo(.L.str.46)
	stx	__rc2
	ldx	#mos16hi(.L.str.46)
	stx	__rc3
	ldx	#mos16lo(.L.str.45)
	stx	__rc4
	ldx	#mos16hi(.L.str.45)
	stx	__rc5
	lda	#80
	jsr	progress
	lda	(__rc22)
	pha
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	pla
	ldx	__rc20
	jsr	PutBAM
	lda	(__rc22)
; %bb.365:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_208
.LBB0_271:
	ldx	#128
	txa
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#30
	txa
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#132
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	clrhome
	ldx	#mos16lo(.L.str.6)
	stx	__rc2
	ldx	#mos16hi(.L.str.6)
	stx	__rc3
	jsr	msprintf
	ldy	#0
	bra	.LBB0_277
.LBB0_272:                              ;   in Loop: Header=BB0_277 Depth=1
	cpx	#0
	bcs	.LBB0_274
; %bb.505:
	jmp	.LBB0_282
.LBB0_273:                              ;   in Loop: Header=BB0_277 Depth=1
	cmp	#0
	bcs	.LBB0_274
; %bb.507:
	jmp	.LBB0_282
.LBB0_274:                              ;   in Loop: Header=BB0_277 Depth=1
	ldx	53266
	stx	__rc2
.LBB0_275:                              ;   Parent Loop BB0_277 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	53266
	cpx	__rc2
	beq	.LBB0_275
; %bb.276:                              ;   in Loop: Header=BB0_277 Depth=1
	clc
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#192
	sta	(__rc0),y                       ; 1-byte Folded Spill
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#255
	sta	(__rc0),y                       ; 1-byte Folded Spill
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#255
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	tya
	adc	#255
	tay
.LBB0_277:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_275 Depth 2
	tya
	bne	.LBB0_281
; %bb.278:                              ;   in Loop: Header=BB0_277 Depth=1
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	cpx	#0
	bne	.LBB0_272
; %bb.279:                              ;   in Loop: Header=BB0_277 Depth=1
	tax
	bne	.LBB0_273
; %bb.280:                              ;   in Loop: Header=BB0_277 Depth=1
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	cmp	#65
	bcc	.LBB0_282
	bra	.LBB0_274
.LBB0_281:                              ;   in Loop: Header=BB0_277 Depth=1
	cpy	#0
	bcc	.LBB0_282
; %bb.509:                              ;   in Loop: Header=BB0_277 Depth=1
	jmp	.LBB0_274
.LBB0_282:
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
	adc	#31
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.LBB0_283:                              ;   in Loop: Header=BB0_19 Depth=2
	stz	6658
	ldx	__rc29
	stx	__rc4
	ldx	__rc28
	stx	__rc5
	pha
	phy
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc6
	sty	__rc2
	sty	__rc3
	phy
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc7
	pla
	sta	__rc8
	sty	__rc9
	ldx	#26
	lda	#0
	jsr	lcopy
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	lsr
	lsr
	lsr
	tax
	clc
	lda	#0
	adc	__rc22
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
	ldy	#16
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
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	jsr	PutOneSector
	ldx	6659
	stx	__rc21
	ldx	6660
	stx	__rc22
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
	ldy	__rc22
	ldx	__rc21
; %bb.367:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_211
.LBB0_284:                              ;   in Loop: Header=BB0_19 Depth=2
	ldx	#0
	stx	__rc2
	ldx	#22
	stx	__rc3
	ldx	#1
	stx	__rc4
	ldx	#40
	ldy	#19
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
; %bb.369:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_207
.LBB0_285:                              ;   in Loop: Header=BB0_263 Depth=3
	stz	__rc25
; %bb.371:                              ;   in Loop: Header=BB0_263 Depth=3
	jmp	.LBB0_258
.LBB0_286:                              ;   in Loop: Header=BB0_19 Depth=2
	lda	__rc3
	sta	(__rc20)
	lda	6913
	sta	(__rc20),y
	ldx	__rc23
	stx	__rc4
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc6
	stz	__rc2
	stz	__rc3
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc21
	lda	__rc20
	jsr	lcopy
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	lsr
	tax
	stz	__rc2
	clc
	lda	#0
	adc	__rc2
	tay
	txa
	adc	__rc30
	sta	__rc10
	lda	#0
	adc	__rc2
	tax
	lda	#0
	adc	__rc22
	pha
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc23
	pla
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
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
; %bb.373:                              ;   in Loop: Header=BB0_19 Depth=2
	jmp	.LBB0_270
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.section	.rodata.main,"a",@progbits
.LJTI0_0:
	.byte	.LBB0_104@mos16lo
	.byte	.LBB0_136@mos16lo
	.byte	.LBB0_104@mos16lo
	.byte	.LBB0_104@mos16lo
	.byte	.LBB0_87@mos16lo
	.byte	.LBB0_104@mos16lo
	.byte	.LBB0_104@mos16lo
	.byte	.LBB0_87@mos16lo
	.byte	.LBB0_104@mos16lo
	.byte	.LBB0_132@mos16lo
	.byte	.LBB0_104@mos16hi
	.byte	.LBB0_136@mos16hi
	.byte	.LBB0_104@mos16hi
	.byte	.LBB0_104@mos16hi
	.byte	.LBB0_87@mos16hi
	.byte	.LBB0_104@mos16hi
	.byte	.LBB0_104@mos16hi
	.byte	.LBB0_87@mos16hi
	.byte	.LBB0_104@mos16hi
	.byte	.LBB0_132@mos16hi
                                        ; -- End function
	.section	.text.ReadSector,"ax",@progbits
	.type	ReadSector,@function            ; -- Begin function ReadSector
ReadSector:                             ; @ReadSector
; %bb.0:
	cpx	#0
	bne	.LBB1_1
; %bb.7:
	jmp	.LBB1_5
.LBB1_1:
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
	stx	mos8(.LReadSector_zp_stk)       ; 1-byte Folded Spill
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
	ldx	#64
	stx	53376
	ldx	#2
	stx	53280
	ldx	#mos16lo(.L.str.4.11)
	stx	__rc2
	ldx	#mos16hi(.L.str.4.11)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	tya
	jsr	mprintf
	ldx	#mos16lo(.L.str.5.12)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.12)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	mos8(.LReadSector_zp_stk)       ; 1-byte Folded Reload
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
.LBB1_5:
	lda	#252
	rts
.LBB1_6:
	lda	54921
	and	#127
	sta	54921
	ldx	mos8(.LReadSector_zp_stk)       ; 1-byte Folded Reload
	txa
	and	#1
	rts
.Lfunc_end1:
	.size	ReadSector, .Lfunc_end1-ReadSector
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
.LBB2_5:
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.Lfunc_end2:
	.size	GetOneSector, .Lfunc_end2-GetOneSector
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
	ldx	__rc23
	lda	__rc22
	jsr	lcopy
	lda	mos8(.LPutOneSector_zp_stk+1)
	and	#254
	cmp	#20
	sta	mos8(.LPutOneSector_zp_stk+1)
	lda	mos8(.LPutOneSector_zp_stk+2)
	bcc	.LBB3_4
; %bb.3:
	clc
	adc	#40
	bra	.LBB3_5
.LBB3_4:
	clc
	adc	#32
.LBB3_5:
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
	ldx	#2
	stx	53280
	ldx	#mos16lo(.L.str.7.14)
	stx	__rc2
	ldx	#mos16hi(.L.str.7.14)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	mos8(.LPutOneSector_zp_stk)
	jsr	mprintf
	ldx	#mos16lo(.L.str.5.12)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.12)
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
	bra	.LBB3_10
.LBB3_9:
	lda	54921
	and	#127
	sta	54921
.LBB3_10:
	plx
	stx	__rc23
	plx
	stx	__rc22
	rts
.Lfunc_end3:
	.size	PutOneSector, .Lfunc_end3-PutOneSector
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
.Lfunc_end4:
	.size	GetBAM, .Lfunc_end4-GetBAM
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
.Lfunc_end5:
	.size	PutBAM, .Lfunc_end5-PutBAM
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
.LBB6_1:                                ; =>This Inner Loop Header: Depth=1
	cpy	__rc23
	bne	.LBB6_3
; %bb.2:                                ;   in Loop: Header=BB6_1 Depth=1
	cpx	__rc22
	bne	.LBB6_3
; %bb.9:
	jmp	.LBB6_6
.LBB6_3:                                ;   in Loop: Header=BB6_1 Depth=1
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
	bne	.LBB6_5
; %bb.4:                                ;   in Loop: Header=BB6_1 Depth=1
	iny
.LBB6_5:                                ;   in Loop: Header=BB6_1 Depth=1
	inc	__rc30
	dec	__rc30
	beq	.LBB6_8
; %bb.11:                               ;   in Loop: Header=BB6_1 Depth=1
	jmp	.LBB6_1
.LBB6_6:
	tax
	beq	.LBB6_8
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
	ldx	#mos16lo(.L.str.36)
	stx	__rc6
	ldx	#mos16hi(.L.str.36)
	stx	__rc7
	jsr	messagebox
.LBB6_8:
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
.Lfunc_end6:
	.size	readblockchain, .Lfunc_end6-readblockchain
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
	bcc	.LBB7_2
; %bb.1:
	ldy	__rc4
	sty	__rc20
	ldy	__rc5
	sty	__rc21
	clc
	adc	#216
	tay
	bra	.LBB7_3
.LBB7_2:
	lda	__rc2
	sta	__rc20
	lda	__rc3
	sta	__rc21
.LBB7_3:
	dey
	sty	__rc5
	lda	__rc6
	beq	.LBB7_6
; %bb.4:
	stx	mos8(.LBAMSectorUpdate_zp_stk)
	cpx	#8
	bcs	.LBB7_8
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
	jmp	.LBB7_21
.LBB7_6:
	stx	mos8(.LBAMSectorUpdate_zp_stk)
	cpx	#8
	bcc	.LBB7_7
; %bb.41:
	jmp	.LBB7_10
.LBB7_7:
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
	jmp	.LBB7_23
.LBB7_8:
	cpx	#16
	ldx	#0
	bcc	.LBB7_9
; %bb.43:
	jmp	.LBB7_12
.LBB7_9:
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
	jmp	.LBB7_21
.LBB7_10:
	cpx	#16
	bcc	.LBB7_11
; %bb.45:
	jmp	.LBB7_14
.LBB7_11:
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
	jmp	.LBB7_23
.LBB7_12:
	ldy	mos8(.LBAMSectorUpdate_zp_stk)
	cpy	#24
	bcc	.LBB7_13
; %bb.47:
	jmp	.LBB7_16
.LBB7_13:
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
	jmp	.LBB7_21
.LBB7_14:
	cpx	#24
	bcc	.LBB7_15
; %bb.49:
	jmp	.LBB7_18
.LBB7_15:
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
	jmp	.LBB7_23
.LBB7_16:
	ldy	mos8(.LBAMSectorUpdate_zp_stk)
	cpy	#32
	bcc	.LBB7_17
; %bb.51:
	jmp	.LBB7_20
.LBB7_17:
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
	jmp	.LBB7_21
.LBB7_18:
	cpx	#32
	bcc	.LBB7_19
; %bb.53:
	jmp	.LBB7_22
.LBB7_19:
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
	jmp	.LBB7_23
.LBB7_20:
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
.LBB7_21:
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
	bra	.LBB7_24
.LBB7_22:
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
.LBB7_23:
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
.LBB7_24:
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
.Lfunc_end7:
	.size	BAMSectorUpdate, .Lfunc_end7-BAMSectorUpdate
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
.LBB8_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_19 Depth 2
	cpx	#80
	bne	.LBB8_2
; %bb.30:
	jmp	.LBB8_25
.LBB8_2:                                ;   in Loop: Header=BB8_1 Depth=1
	stx	mos8(.LfindnextBAMtracksector_zp_stk+4)
	lda	.L__const.findnextBAMtracksector.strategy,x
	tax
	lda	mos8(.LfindnextBAMtracksector_zp_stk+2)
	beq	.LBB8_4
; %bb.3:                                ;   in Loop: Header=BB8_1 Depth=1
	inx
.LBB8_4:                                ;   in Loop: Header=BB8_1 Depth=1
	cpx	#80
	ldy	#mos16lo(BAMsector)
	sty	__rc2
	ldy	#mos16hi(BAMsector)
	sty	__rc3
	stz	mos8(.LfindnextBAMtracksector_zp_stk)
	stz	__rc4
	bcs	.LBB8_8
; %bb.5:                                ;   in Loop: Header=BB8_1 Depth=1
	cpx	#40
	bcs	.LBB8_7
; %bb.6:                                ;   in Loop: Header=BB8_1 Depth=1
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
	stx	__rc4
	bra	.LBB8_8
.LBB8_7:                                ;   in Loop: Header=BB8_1 Depth=1
	ldy	#mos16lo(BAMsector+2)
	sty	__rc2
	ldy	#mos16hi(BAMsector+2)
	sty	__rc3
	clc
	txa
	adc	#216
	sta	__rc4
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
.LBB8_8:                                ;   in Loop: Header=BB8_1 Depth=1
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
; %bb.26:                               ;   in Loop: Header=BB8_1 Depth=1
	jmp	.LBB8_19
.LBB8_9:                                ;   in Loop: Header=BB8_19 Depth=2
	cmp	#16
	bcs	.LBB8_11
; %bb.10:                               ;   in Loop: Header=BB8_19 Depth=2
	ldy	#18
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
	adc	#248
	bra	.LBB8_16
.LBB8_11:                               ;   in Loop: Header=BB8_19 Depth=2
	cmp	#24
	bcs	.LBB8_13
; %bb.12:                               ;   in Loop: Header=BB8_19 Depth=2
	ldy	#19
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
	adc	#240
	bra	.LBB8_16
.LBB8_13:                               ;   in Loop: Header=BB8_19 Depth=2
	cmp	#32
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	bcs	.LBB8_15
; %bb.14:                               ;   in Loop: Header=BB8_19 Depth=2
	ldy	#20
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
	adc	#232
	bra	.LBB8_16
.LBB8_15:                               ;   in Loop: Header=BB8_19 Depth=2
	ldy	#21
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
	adc	#224
.LBB8_16:                               ;   in Loop: Header=BB8_19 Depth=2
	sta	__rc2
.LBB8_17:                               ;   in Loop: Header=BB8_19 Depth=2
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	and	mos8(.LfindnextBAMtracksector_zp_stk+3)
	bne	.LBB8_23
; %bb.18:                               ;   in Loop: Header=BB8_19 Depth=2
	inc	mos8(.LfindnextBAMtracksector_zp_stk+5)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+4)
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
.LBB8_19:                               ;   Parent Loop BB8_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cmp	#40
	beq	.LBB8_22
; %bb.20:                               ;   in Loop: Header=BB8_19 Depth=2
	cmp	#8
	bcc	.LBB8_21
; %bb.32:                               ;   in Loop: Header=BB8_19 Depth=2
	jmp	.LBB8_9
.LBB8_21:                               ;   in Loop: Header=BB8_19 Depth=2
	ldy	#17
	sta	mos8(.LfindnextBAMtracksector_zp_stk+5)
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+5)
	stx	__rc2
	bra	.LBB8_17
.LBB8_22:                               ;   in Loop: Header=BB8_1 Depth=1
	inx
; %bb.28:                               ;   in Loop: Header=BB8_1 Depth=1
	jmp	.LBB8_1
.LBB8_23:
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
.LBB8_24:
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
.LBB8_25:
	ldx	#255
	stx	mos8(.LfindnextBAMtracksector_zp_stk+6) ; 1-byte Folded Spill
	stz	mos8(.LfindnextBAMtracksector_zp_stk+5)
	bra	.LBB8_24
.Lfunc_end8:
	.size	findnextBAMtracksector, .Lfunc_end8-findnextBAMtracksector
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
.Lfunc_end9:
	.size	tracksectorstring, .Lfunc_end9-tracksectorstring
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
.LBB10_1:                               ; =>This Inner Loop Header: Depth=1
	phx
	ply
	sta	__rc2
	ldx	#0
	cpx	__rc2
	bne	.LBB10_3
; %bb.2:                                ;   in Loop: Header=BB10_1 Depth=1
	sty	__rc3
	ldy	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Reload
	sty	__rc2
	ldy	__rc3
	cpy	__rc2
	bcc	.LBB10_4
; %bb.11:
	jmp	.LBB10_10
.LBB10_3:                               ;   in Loop: Header=BB10_1 Depth=1
	sta	__rc2
	cpx	__rc2
	bcc	.LBB10_4
; %bb.13:
	jmp	.LBB10_10
.LBB10_4:                               ;   in Loop: Header=BB10_1 Depth=1
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
	beq	.LBB10_10
; %bb.5:                                ;   in Loop: Header=BB10_1 Depth=1
	ldx	6656
	beq	.LBB10_7
; %bb.6:                                ;   in Loop: Header=BB10_1 Depth=1
	clc
	lda	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Reload
	adc	#8
	sta	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Spill
	lda	mos8(.Lgetdirententry_zp_stk+7)
	adc	#0
	bra	.LBB10_8
.LBB10_7:                               ;   in Loop: Header=BB10_1 Depth=1
	lda	mos8(.Lgetdirententry_zp_stk+7)
.LBB10_8:                               ;   in Loop: Header=BB10_1 Depth=1
	ldy	mos8(.Lgetdirententry_zp_stk+8)
	ldx	mos8(.Lgetdirententry_zp_stk+8)
	inx
	cpy	mos8(.Lgetdirententry_zp_stk+2)
	beq	.LBB10_9
; %bb.15:                               ;   in Loop: Header=BB10_1 Depth=1
	jmp	.LBB10_1
.LBB10_9:
	ldx	#0
	stx	mos8(.Lgetdirententry_zp_stk)
	ldx	#26
	stx	mos8(.Lgetdirententry_zp_stk+1)
.LBB10_10:
	ldx	mos8(.Lgetdirententry_zp_stk)
	stx	__rc2
	ldx	mos8(.Lgetdirententry_zp_stk+1)
	stx	__rc3
	rts
.Lfunc_end10:
	.size	getdirententry, .Lfunc_end10-getdirententry
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
	ldy	__rc24
	sty	.Lgetdirent_sstk                ; 1-byte Folded Spill
	sta	__rc22
	stx	__rc21
	stz	__rc20
	stz	53376
	ldx	#14
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#0
	lda	__rc21
	jsr	__mulsi3
	tay
	lda	__rc3
	ora	#8
	sta	__rc3
	lda	#14
	sta	__rc4
	stz	__rc5
	lda	__rc22
	sta	__rc6
	lda	#40
	sta	__rc7
	lda	#3
	sta	__rc8
	tya
	jsr	readblockchain
	ldx	#0
	stx	__rc22
	ldx	#0
	stx	__rc23
	ldx	#112
.LBB11_1:                               ; =>This Inner Loop Header: Depth=1
	txa
	beq	.LBB11_7
; %bb.2:                                ;   in Loop: Header=BB11_1 Depth=1
	stx	__rc24
	lda	__rc21
	jsr	getdirententry
	ldx	__rc3
	cpx	__rc23
	bne	.LBB11_5
; %bb.3:                                ;   in Loop: Header=BB11_1 Depth=1
	lda	__rc24
	ldx	__rc2
	cpx	__rc22
	bne	.LBB11_6
; %bb.4:                                ;   in Loop: Header=BB11_1 Depth=1
	tax
	dex
	bra	.LBB11_1
.LBB11_5:
	ldx	__rc24
	stx	__rc20
	bra	.LBB11_7
.LBB11_6:
	sta	__rc20
.LBB11_7:
	lda	__rc20
	ldx	.Lgetdirent_sstk                ; 1-byte Folded Reload
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
.Lfunc_end11:
	.size	getdirent, .Lfunc_end11-getdirent
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
	bne	.LBB12_2
; %bb.1:
	inc
.LBB12_2:
	cmp	#0
	bne	.LBB12_5
; %bb.3:
	cpy	__rc4
	bcs	.LBB12_6
.LBB12_4:
	inx
; %bb.10:
	jmp	.LBB12_9
.LBB12_5:
	cmp	#0
	bcc	.LBB12_4
.LBB12_6:
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
	bcs	.LBB12_8
; %bb.7:
	ldx	#0
.LBB12_8:
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
.LBB12_9:
	stz	mos8(g_curX)
	stx	mos8(g_curY)
	rts
.Lfunc_end12:
	.size	cputln, .Lfunc_end12-cputln
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
.LBB13_1:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB13_5
; %bb.2:                                ;   in Loop: Header=BB13_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+4)
	bne	.LBB13_6
; %bb.3:                                ;   in Loop: Header=BB13_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+3)
	bne	.LBB13_7
; %bb.4:                                ;   in Loop: Header=BB13_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+2)
	cmp	#10
	bra	.LBB13_8
.LBB13_5:                               ;   in Loop: Header=BB13_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+5)
	bra	.LBB13_7
.LBB13_6:                               ;   in Loop: Header=BB13_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+4)
.LBB13_7:                               ;   in Loop: Header=BB13_1 Depth=1
	cmp	#0
.LBB13_8:                               ;   in Loop: Header=BB13_1 Depth=1
	ldy	__rc4
	sty	mos8(.Lcsputdec_zp_stk+2)
	ldy	__rc2
	sty	mos8(.Lcsputdec_zp_stk+4)
	ldy	__rc3
	sty	mos8(.Lcsputdec_zp_stk+5)
	ldy	mos8(.Lcsputdec_zp_stk+1)
	bcs	.LBB13_1
; %bb.9:
	sec
	lda	#10
	sbc	mos8(.Lcsputdec_zp_stk)
	sta	__rc3
	lda	#0
	sbc	#0
	sta	__rc4
	bra	.LBB13_11
.LBB13_10:                              ;   in Loop: Header=BB13_11 Depth=1
	lda	#32
	sta	mos8(.Lcsputdec_zp_stk+7),y
	dey
.LBB13_11:                              ; =>This Inner Loop Header: Depth=1
	sty	__rc2
	ldx	__rc3
	cpx	__rc2
	lda	__rc4
	sbc	#0
	bvc	.LBB13_13
; %bb.12:                               ;   in Loop: Header=BB13_11 Depth=1
	eor	#128
.LBB13_13:                              ;   in Loop: Header=BB13_11 Depth=1
	ldx	#1
	cmp	#0
	bmi	.LBB13_15
; %bb.14:                               ;   in Loop: Header=BB13_11 Depth=1
	ldx	#0
.LBB13_15:                              ;   in Loop: Header=BB13_11 Depth=1
	tya
	bne	.LBB13_17
; %bb.16:                               ;   in Loop: Header=BB13_11 Depth=1
	ldx	#0
.LBB13_17:                              ;   in Loop: Header=BB13_11 Depth=1
	txa
	bne	.LBB13_10
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
	bne	.LBB13_20
; %bb.19:
	inc	__rc3
.LBB13_20:
	jmp	cputs
.Lfunc_end13:
	.size	csputdec, .Lfunc_end13-csputdec
                                        ; -- End function
	.section	.text.asciitoscreencode_s,"ax",@progbits
	.type	asciitoscreencode_s,@function   ; -- Begin function asciitoscreencode_s
asciitoscreencode_s:                    ; @asciitoscreencode_s
; %bb.0:
	ldx	#52
	stx	__rc4
	ldx	#3
	stx	__rc5
.LBB14_1:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc2)
	inc	__rc2
	bne	.LBB14_3
; %bb.2:                                ;   in Loop: Header=BB14_1 Depth=1
	inc	__rc3
.LBB14_3:                               ;   in Loop: Header=BB14_1 Depth=1
	ldy	#32
	cmp	#160
	beq	.LBB14_9
; %bb.4:                                ;   in Loop: Header=BB14_1 Depth=1
	tax
	cpx	#192
	bcc	.LBB14_6
; %bb.5:                                ;   in Loop: Header=BB14_1 Depth=1
	eor	#128
	bra	.LBB14_8
.LBB14_6:                               ;   in Loop: Header=BB14_1 Depth=1
	cmp	#96
	bcc	.LBB14_12
; %bb.7:                                ;   in Loop: Header=BB14_1 Depth=1
	clc
	adc	#160
.LBB14_8:                               ;   in Loop: Header=BB14_1 Depth=1
	tay
.LBB14_9:                               ;   in Loop: Header=BB14_1 Depth=1
	tya
	sta	(__rc4)
	inc	__rc4
	bne	.LBB14_11
; %bb.10:                               ;   in Loop: Header=BB14_1 Depth=1
	inc	__rc5
.LBB14_11:                              ;   in Loop: Header=BB14_1 Depth=1
	tya
	bne	.LBB14_1
	bra	.LBB14_14
.LBB14_12:                              ;   in Loop: Header=BB14_1 Depth=1
	clc
	tay
	adc	#165
	cmp	#5
	bcs	.LBB14_9
; %bb.13:                               ;   in Loop: Header=BB14_1 Depth=1
	tax
	ldy	mos8(.Lswitch.table.asciitoscreencode),x
	bra	.LBB14_9
.LBB14_14:
	ldx	820
	beq	.LBB14_16
; %bb.15:
	rts
.LBB14_16:
	ldx	#32
	stx	820
	stz	821
	rts
.Lfunc_end14:
	.size	asciitoscreencode_s, .Lfunc_end14-asciitoscreencode_s
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
.Lfunc_end15:
	.size	clrhome, .Lfunc_end15-clrhome
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
.Lfunc_end16:
	.size	msprintf, .Lfunc_end16-msprintf
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
.Lfunc_end17:
	.size	mprintf, .Lfunc_end17-mprintf
                                        ; -- End function
	.section	.text.mhprintf,"ax",@progbits
	.type	mhprintf,@function              ; -- Begin function mhprintf
mhprintf:                               ; @mhprintf
; %bb.0:
	sta	mos8(.Lmhprintf_zp_stk)         ; 1-byte Folded Spill
	stx	mos8(.Lmhprintf_zp_stk+1)       ; 1-byte Folded Spill
	ldx	__rc2
	stx	mos8(.Lmhprintf_zp_stk+2)       ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.Lmhprintf_zp_stk+3)       ; 1-byte Folded Spill
	ldx	#mos16lo(.L.str.6.13)
	stx	__rc2
	ldx	#mos16hi(.L.str.6.13)
	stx	__rc3
	jsr	asciitoscreencode_s
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	jsr	cputs
	ldx	#2
	ldy	mos8(.Lmhprintf_zp_stk+2)       ; 1-byte Folded Reload
	sty	__rc2
	ldy	mos8(.Lmhprintf_zp_stk+3)       ; 1-byte Folded Reload
	sty	__rc3
	stx	__rc4
	ldx	mos8(.Lmhprintf_zp_stk+1)       ; 1-byte Folded Reload
	lda	mos8(.Lmhprintf_zp_stk)         ; 1-byte Folded Reload
	jmp	cputhex
.Lfunc_end18:
	.size	mhprintf, .Lfunc_end18-mhprintf
                                        ; -- End function
	.section	.text.mh4printf,"ax",@progbits
	.type	mh4printf,@function             ; -- Begin function mh4printf
mh4printf:                              ; @mh4printf
; %bb.0:
	sta	.Lmh4printf_sstk                ; 1-byte Folded Spill
	stx	.Lmh4printf_sstk+1              ; 1-byte Folded Spill
	ldx	__rc2
	stx	.Lmh4printf_sstk+2              ; 1-byte Folded Spill
	ldx	__rc3
	stx	.Lmh4printf_sstk+3              ; 1-byte Folded Spill
	ldx	#mos16lo(.L.str.32)
	stx	__rc2
	ldx	#mos16hi(.L.str.32)
	stx	__rc3
	jsr	asciitoscreencode_s
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	jsr	cputs
	ldx	#4
	ldy	.Lmh4printf_sstk+2              ; 1-byte Folded Reload
	sty	__rc2
	ldy	.Lmh4printf_sstk+3              ; 1-byte Folded Reload
	sty	__rc3
	stx	__rc4
	ldx	.Lmh4printf_sstk+1              ; 1-byte Folded Reload
	lda	.Lmh4printf_sstk                ; 1-byte Folded Reload
	jmp	cputhex
.Lfunc_end19:
	.size	mh4printf, .Lfunc_end19-mh4printf
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
.Lfunc_end20:
	.size	mcputsxy, .Lfunc_end20-mcputsxy
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
	bcs	.LBB21_2
; %bb.1:
	ldx	#1
.LBB21_2:
	lda	mos8(.Lmcbox_zp_stk+1)
	sta	mos8(.Lmcbox_zp_stk+4)
	bra	.LBB21_4
.LBB21_3:                               ;   in Loop: Header=BB21_4 Depth=1
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
.LBB21_4:                               ; =>This Inner Loop Header: Depth=1
	dex
	bne	.LBB21_3
; %bb.5:
	ldx	mos8(.Lmcbox_zp_stk+2)
	inx
	stx	mos8(.Lmcbox_zp_stk+1)
	bra	.LBB21_7
.LBB21_6:                               ;   in Loop: Header=BB21_7 Depth=1
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
.LBB21_7:                               ; =>This Inner Loop Header: Depth=1
	cpx	mos8(.Lmcbox_zp_stk+5)
	bcc	.LBB21_6
; %bb.8:
	ldx	mos8(.Lmcbox_zp_stk)
	bne	.LBB21_9
; %bb.19:
	jmp	.LBB21_18
.LBB21_9:
	ldx	mos8(.Lmcbox_zp_stk+5)
	cpx	g_curScreenH
	bcc	.LBB21_10
; %bb.21:
	jmp	.LBB21_18
.LBB21_10:
	ldx	mos8(g_curScreenW)
	stx	__rc2
	ldx	mos8(.Lmcbox_zp_stk+3)
	cpx	__rc2
	bcc	.LBB21_11
; %bb.23:
	jmp	.LBB21_18
.LBB21_11:
	stz	__rc3
	ldx	mos8(.Lmcbox_zp_stk+5)
	ldy	#0
	inx
	bne	.LBB21_13
; %bb.12:
	iny
.LBB21_13:
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
	bra	.LBB21_16
.LBB21_14:                              ;   in Loop: Header=BB21_16 Depth=1
	cpy	#0
	bcc	.LBB21_18
.LBB21_15:                              ;   in Loop: Header=BB21_16 Depth=1
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
.LBB21_16:                              ; =>This Inner Loop Header: Depth=1
	ldy	mos8(.Lmcbox_zp_stk+4)
	bne	.LBB21_14
; %bb.17:                               ;   in Loop: Header=BB21_16 Depth=1
	ldx	mos8(.Lmcbox_zp_stk+2)
	cpx	mos8(.Lmcbox_zp_stk)
	bcs	.LBB21_15
.LBB21_18:
	rts
.Lfunc_end21:
	.size	mcbox, .Lfunc_end21-mcbox
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
	ldx	#mos16lo(.L.str.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.41)
	stx	__rc3
	ldx	#4
	jsr	mcputsxy
	lda	#40
	ldx	#mos16lo(.L.str.1.42)
	stx	__rc2
	ldx	#mos16hi(.L.str.1.42)
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
	ldx	#mos16lo(.L.str.2.43)
	stx	__rc2
	ldx	#mos16hi(.L.str.2.43)
	stx	__rc3
	ldx	#10
	lda	#12
	jsr	mcputsxy
	lda	#60
	ldx	#mos16lo(.L.str.3.44)
	stx	__rc2
	ldx	#mos16hi(.L.str.3.44)
	stx	__rc3
	ldx	#10
	jsr	mcputsxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	.Lmessagebox_sstk+6             ; 1-byte Folded Reload
	beq	.LBB22_3
; %bb.1:
	lda	#2
	ldx	#mos16lo(.L.str.4.45)
	stx	__rc2
	ldx	#mos16hi(.L.str.4.45)
	stx	__rc3
	ldx	#1
	jsr	mcputsxy
	lda	#58
	ldx	#mos16lo(.L.str.5.46)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.46)
	stx	__rc3
	ldx	#1
	jsr	mcputsxy
	bra	.LBB22_3
.LBB22_2:                               ;   in Loop: Header=BB22_3 Depth=1
	ldx	#mos16lo(.L.str.32)
	stx	__rc2
	ldx	#mos16hi(.L.str.32)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	lda	#32
	jsr	cputc
.LBB22_3:                               ; =>This Inner Loop Header: Depth=1
	jsr	cgetc
	cmp	#3
	beq	.LBB22_6
; %bb.4:                                ;   in Loop: Header=BB22_3 Depth=1
	cmp	#13
	beq	.LBB22_7
; %bb.5:                                ;   in Loop: Header=BB22_3 Depth=1
	cmp	#27
	bne	.LBB22_2
.LBB22_6:
	lda	#0
	rts
.LBB22_7:
	lda	#1
	rts
.Lfunc_end22:
	.size	messagebox, .Lfunc_end22-messagebox
                                        ; -- End function
	.section	.text.progress,"ax",@progbits
	.type	progress,@function              ; -- Begin function progress
progress:                               ; @progress
; %bb.0:
	ldx	__rc20
	phx
	ldx	__rc21
	phx
	sta	mos8(.Lprogress_zp_stk+2)       ; 1-byte Folded Spill
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	ldx	__rc4
	stx	mos8(.Lprogress_zp_stk)
	ldx	__rc5
	stx	mos8(.Lprogress_zp_stk+1)
	ldx	#mos16lo(.L__const.progress.rc)
	stx	__rc2
	ldx	#mos16hi(.L__const.progress.rc)
	stx	__rc3
	jsr	fillrect
	ldx	#6
	ldy	__rc20
	sty	__rc2
	ldy	__rc21
	sty	__rc3
	ldy	mos8(.Lprogress_zp_stk+2)       ; 1-byte Folded Reload
	sty	__rc20
	lda	#12
	jsr	mcputsxy
	ldx	#7
	ldy	mos8(.Lprogress_zp_stk)
	sty	__rc2
	ldy	mos8(.Lprogress_zp_stk+1)
	sty	__rc3
	lda	#12
	jsr	mcputsxy
	ldx	#9
	ldy	#160
	sty	__rc2
	lda	#12
	jsr	cputcxy
	ldx	#0
	lda	__rc20
	lsr
	sta	__rc21
	bra	.LBB23_5
.LBB23_1:                               ;   in Loop: Header=BB23_5 Depth=1
	lda	#1
.LBB23_2:                               ;   in Loop: Header=BB23_5 Depth=1
	ldx	#160
	and	#1
	bne	.LBB23_4
; %bb.3:                                ;   in Loop: Header=BB23_5 Depth=1
	ldx	#123
.LBB23_4:                               ;   in Loop: Header=BB23_5 Depth=1
	txa
	jsr	cputc
	ldx	mos8(.Lprogress_zp_stk)
	inx
.LBB23_5:                               ; =>This Inner Loop Header: Depth=1
	cpx	#50
	beq	.LBB23_8
; %bb.6:                                ;   in Loop: Header=BB23_5 Depth=1
	stx	mos8(.Lprogress_zp_stk)
	cpx	__rc21
	bcc	.LBB23_1
; %bb.7:                                ;   in Loop: Header=BB23_5 Depth=1
	lda	#0
	bra	.LBB23_2
.LBB23_8:
	lda	#101
	jsr	cputc
	ldx	#mos16lo(.L.str.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.36)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc20
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
	jsr	mcputsxy
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.Lfunc_end23:
	.size	progress, .Lfunc_end23-progress
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
	beq	.LBB24_2
; %bb.1:
	ldx	#3
	bra	.LBB24_3
.LBB24_2:
	ldx	#12
.LBB24_3:
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
.Lfunc_end24:
	.size	shortcutprint, .Lfunc_end24-shortcutprint
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
	bne	.LBB25_1
; %bb.16:
	jmp	.LBB25_2
.LBB25_1:
	ldx	#mos16lo(.L.str.3.58)
	stx	__rc2
	ldx	#mos16hi(.L.str.3.58)
	stx	__rc3
	ldx	#mos16lo(.L.str.4.59)
	stx	__rc4
	ldx	#mos16hi(.L.str.4.59)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.5.60)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.60)
	stx	__rc3
	ldx	#mos16lo(.L.str.6.61)
	stx	__rc4
	ldx	#mos16hi(.L.str.6.61)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.7.62)
	stx	__rc2
	ldx	#mos16hi(.L.str.7.62)
	stx	__rc3
	ldx	#mos16lo(.L.str.8.63)
	stx	__rc4
	ldx	#mos16hi(.L.str.8.63)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.9)
	stx	__rc2
	ldx	#mos16hi(.L.str.9)
	stx	__rc3
	ldx	#mos16lo(.L.str.10)
	stx	__rc4
	ldx	#mos16hi(.L.str.10)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.11.64)
	stx	__rc2
	ldx	#mos16hi(.L.str.11.64)
	stx	__rc3
	ldx	#mos16lo(.L.str.12.65)
	stx	__rc4
	ldx	#mos16hi(.L.str.12.65)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.13.66)
	stx	__rc2
	ldx	#mos16hi(.L.str.13.66)
	stx	__rc3
	ldx	#mos16lo(.L.str.14.67)
	stx	__rc4
	ldx	#mos16hi(.L.str.14.67)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.15.68)
	stx	__rc2
	ldx	#mos16hi(.L.str.15.68)
	stx	__rc3
	ldx	#mos16lo(.L.str.16.69)
	stx	__rc4
	ldx	#mos16hi(.L.str.16.69)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.17.70)
	stx	__rc2
	ldx	#mos16hi(.L.str.17.70)
	stx	__rc3
	ldx	#mos16lo(.L.str.18.71)
	stx	__rc4
	ldx	#mos16hi(.L.str.18.71)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.19.72)
	stx	__rc2
	ldx	#mos16hi(.L.str.19.72)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.21)
	stx	__rc2
	ldx	#mos16hi(.L.str.21)
	stx	__rc3
	ldx	#mos16lo(.L.str.22)
	stx	__rc4
	ldx	#mos16hi(.L.str.22)
; %bb.10:
	jmp	.LBB25_7
.LBB25_2:
	txa
	and	#8
	beq	.LBB25_3
; %bb.18:
	jmp	.LBB25_5
.LBB25_3:
	txa
	and	#3
	bne	.LBB25_4
; %bb.20:
	jmp	.LBB25_9
.LBB25_4:
	ldx	#mos16lo(.L.str.3.58)
	stx	__rc2
	ldx	#mos16hi(.L.str.3.58)
	stx	__rc3
	ldx	#mos16lo(.L.str.6.61)
	stx	__rc4
	ldx	#mos16hi(.L.str.6.61)
	stx	__rc5
	lda	#1
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.5.60)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.60)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.7.62)
	stx	__rc2
	ldx	#mos16hi(.L.str.7.62)
	stx	__rc3
	ldx	#mos16lo(.L.str.10)
	stx	__rc4
	ldx	#mos16hi(.L.str.10)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.9)
	stx	__rc2
	ldx	#mos16hi(.L.str.9)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.11.64)
	stx	__rc2
	ldx	#mos16hi(.L.str.11.64)
	stx	__rc3
	ldx	#mos16lo(.L.str.14.67)
	stx	__rc4
	ldx	#mos16hi(.L.str.14.67)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.13.66)
	stx	__rc2
	ldx	#mos16hi(.L.str.13.66)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.15.68)
	stx	__rc2
	ldx	#mos16hi(.L.str.15.68)
	stx	__rc3
	ldx	#mos16lo(.L.str.18.71)
	stx	__rc4
	ldx	#mos16hi(.L.str.18.71)
	stx	__rc5
	lda	#1
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.17.70)
	stx	__rc2
	ldx	#mos16hi(.L.str.17.70)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.19.72)
	stx	__rc2
	ldx	#mos16hi(.L.str.19.72)
	stx	__rc3
	ldx	#mos16lo(.L.str.27)
	stx	__rc4
	ldx	#mos16hi(.L.str.27)
	stx	__rc5
	lda	#1
; %bb.12:
	jmp	.LBB25_6
.LBB25_5:
	ldx	#mos16lo(.L.str.3.58)
	stx	__rc2
	ldx	#mos16hi(.L.str.3.58)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.5.60)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.60)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.7.62)
	stx	__rc2
	ldx	#mos16hi(.L.str.7.62)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.9)
	stx	__rc2
	ldx	#mos16hi(.L.str.9)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	lda	#1
	ldx	#mos16lo(.L.str.11.64)
	stx	__rc2
	ldx	#mos16hi(.L.str.11.64)
	stx	__rc3
	ldx	#mos16lo(.L.str.24)
	stx	__rc4
	ldx	#mos16hi(.L.str.24)
	stx	__rc5
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.13.66)
	stx	__rc2
	ldx	#mos16hi(.L.str.13.66)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.15.68)
	stx	__rc2
	ldx	#mos16hi(.L.str.15.68)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.17.70)
	stx	__rc2
	ldx	#mos16hi(.L.str.17.70)
	stx	__rc3
	ldx	#mos16lo(.L.str.25)
	stx	__rc4
	ldx	#mos16hi(.L.str.25)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.19.72)
	stx	__rc2
	ldx	#mos16hi(.L.str.19.72)
	stx	__rc3
	ldx	#mos16lo(.L.str.23)
	stx	__rc4
	ldx	#mos16hi(.L.str.23)
	stx	__rc5
	lda	#0
.LBB25_6:
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.21)
	stx	__rc2
	ldx	#mos16hi(.L.str.21)
	stx	__rc3
	ldx	#mos16lo(.L.str.26)
	stx	__rc4
	ldx	#mos16hi(.L.str.26)
.LBB25_7:
	stx	__rc5
	lda	#0
.LBB25_8:
	jsr	shortcutprint
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	rts
.LBB25_9:
	ldx	#mos16lo(.L.str.3.58)
	stx	__rc2
	ldx	#mos16hi(.L.str.3.58)
	stx	__rc3
	ldx	#mos16lo(.L.str.4.59)
	stx	__rc4
	ldx	#mos16hi(.L.str.4.59)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.5.60)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.60)
	stx	__rc3
	ldx	#mos16lo(.L.str.6.61)
	stx	__rc4
	ldx	#mos16hi(.L.str.6.61)
	stx	__rc5
	lda	#1
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.7.62)
	stx	__rc2
	ldx	#mos16hi(.L.str.7.62)
	stx	__rc3
	ldx	#mos16lo(.L.str.8.63)
	stx	__rc4
	ldx	#mos16hi(.L.str.8.63)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.9)
	stx	__rc2
	ldx	#mos16hi(.L.str.9)
	stx	__rc3
	ldx	#mos16lo(.L.str.10)
	stx	__rc4
	ldx	#mos16hi(.L.str.10)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.11.64)
	stx	__rc2
	ldx	#mos16hi(.L.str.11.64)
	stx	__rc3
	ldx	#mos16lo(.L.str.12.65)
	stx	__rc4
	ldx	#mos16hi(.L.str.12.65)
	stx	__rc5
	lda	#1
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.13.66)
	stx	__rc2
	ldx	#mos16hi(.L.str.13.66)
	stx	__rc3
	ldx	#mos16lo(.L.str.14.67)
	stx	__rc4
	ldx	#mos16hi(.L.str.14.67)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.15.68)
	stx	__rc2
	ldx	#mos16hi(.L.str.15.68)
	stx	__rc3
	ldx	#mos16lo(.L.str.16.69)
	stx	__rc4
	ldx	#mos16hi(.L.str.16.69)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.17.70)
	stx	__rc2
	ldx	#mos16hi(.L.str.17.70)
	stx	__rc3
	ldx	#mos16lo(.L.str.18.71)
	stx	__rc4
	ldx	#mos16hi(.L.str.18.71)
	stx	__rc5
	lda	#1
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.19.72)
	stx	__rc2
	ldx	#mos16hi(.L.str.19.72)
	stx	__rc3
	ldx	#mos16lo(.L.str.20)
	stx	__rc4
	ldx	#mos16hi(.L.str.20)
	stx	__rc5
	lda	#0
	jsr	shortcutprint
	ldx	#mos16lo(.L.str.21)
	stx	__rc2
	ldx	#mos16hi(.L.str.21)
	stx	__rc3
	ldx	#mos16lo(.L.str.22)
	stx	__rc4
	ldx	#mos16hi(.L.str.22)
	stx	__rc5
	lda	#1
; %bb.14:
	jmp	.LBB25_8
.Lfunc_end25:
	.size	shortcuts, .Lfunc_end25-shortcuts
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
	sta	__rc20
	stx	__rc21
	ldx	#0
	stx	__rc22
	ldx	#22
	stx	__rc23
	lda	__rc21
	asl
	stz	__rc2
	rol	__rc2
	clc
	sta	__rc3
	ldx	__rc2
	stx	__rc4
	lda	#mos16lo(midnight)
	adc	__rc3
	sta	__rc2
	lda	#mos16hi(midnight)
	adc	__rc4
	ldy	#28
	sty	fnamehi
	sta	__rc3
	;APP
	ldx	#0
	lda	#72
	sta	54848
	clv
	bcc	errgetproc7
	sta	__rc4
	jmp	donegetproc7
errgetproc7:
	lda	#255
	sta	__rc4
donegetproc7:
	nop

	;NO_APP
	lda	__rc20
	beq	.LBB26_5
; %bb.1:
	ldy	#0
	bra	.LBB26_3
.LBB26_2:                               ;   in Loop: Header=BB26_3 Depth=1
	clc
	sty	__rc7
	ldy	#1
	lda	(__rc2),y
	tay
	lda	__rc7
	adc	(__rc2)
	sta	__rc4
	tya
	adc	#0
	sta	__rc5
	ldy	#3
	txa
	sta	(__rc4),y
	ldy	__rc7
	iny
.LBB26_3:                               ; =>This Inner Loop Header: Depth=1
	ldx	7221,y
	beq	.LBB26_9
; %bb.4:                                ;   in Loop: Header=BB26_3 Depth=1
	cpy	7188
	bcc	.LBB26_2
	bra	.LBB26_9
.LBB26_5:
	ldy	#0
	bra	.LBB26_7
.LBB26_6:                               ;   in Loop: Header=BB26_7 Depth=1
	clc
	sty	__rc7
	ldy	#1
	lda	(__rc2),y
	tay
	lda	__rc7
	adc	(__rc2)
	sta	__rc4
	tya
	adc	#0
	sta	__rc5
	ldy	#3
	txa
	sta	(__rc4),y
	ldy	__rc7
	iny
.LBB26_7:                               ; =>This Inner Loop Header: Depth=1
	ldx	7189,y
	beq	.LBB26_9
; %bb.8:                                ;   in Loop: Header=BB26_7 Depth=1
	cpy	7187
	bcc	.LBB26_6
.LBB26_9:
	sty	__rc4
	lda	(__rc2)
	tax
	ldy	#1
	lda	(__rc2),y
	sta	__rc5
	txa
	clc
	adc	__rc4
	sta	__rc2
	lda	__rc5
	adc	#0
	sta	__rc3
	ldy	#3
	lda	#0
	sta	(__rc2),y
	stx	__rc28
	stx	__rc24
	ldx	__rc5
	stx	__rc29
	stx	__rc25
	ldx	#17
	stx	__rc2
	stz	__rc3
	tax
	lda	__rc21
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
	lda	__rc20
	jsr	GetOneSector
	ldy	#0
	bra	.LBB26_11
.LBB26_10:                              ;   in Loop: Header=BB26_11 Depth=1
	sta	(__rc26),y
	iny
.LBB26_11:                              ; =>This Inner Loop Header: Depth=1
	lda	5636,y
	cmp	#160
	beq	.LBB26_13
; %bb.12:                               ;   in Loop: Header=BB26_11 Depth=1
	cpy	#16
	bcc	.LBB26_10
.LBB26_13:
	lda	#0
	sta	(__rc26),y
	stz	53376
	lda	__rc21
	beq	.LBB26_15
; %bb.14:
	ldx	#30
	bra	.LBB26_16
.LBB26_15:
	ldx	#28
.LBB26_16:
	stz	__rc5
	lda	#40
	ldy	#8
	sty	__rc3
	ldy	#2
	sty	__rc4
	sta	__rc7
	stz	__rc2
	ldy	__rc20
	sty	__rc6
	ldy	#1
	sty	__rc8
	lda	#0
	jsr	readblockchain
	lda	__rc21
	jsr	GetBAM
	ldx	#0
	stz	__rc27
	stz	__rc26
	bra	.LBB26_20
.LBB26_17:                              ;   in Loop: Header=BB26_20 Depth=1
	clc
	txa
	adc	#216
	ldy	#0
	sty	__rc22
	ldy	#23
	sty	__rc23
.LBB26_18:                              ;   in Loop: Header=BB26_20 Depth=1
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
.LBB26_19:                              ;   in Loop: Header=BB26_20 Depth=1
	inx
.LBB26_20:                              ; =>This Inner Loop Header: Depth=1
	cpx	#80
	beq	.LBB26_23
; %bb.21:                               ;   in Loop: Header=BB26_20 Depth=1
	cpx	#40
	bcs	.LBB26_17
; %bb.22:                               ;   in Loop: Header=BB26_20 Depth=1
	txa
	cpx	#39
	bne	.LBB26_18
	bra	.LBB26_19
.LBB26_23:
	clc
	lda	__rc28
	adc	#68
	sta	__rc2
	lda	__rc29
	adc	#0
	sta	__rc3
	ldy	#68
	lda	__rc27
	sta	(__rc24),y
	ldy	#1
	lda	__rc26
	sta	(__rc2),y
	ldx	__rc21
	lda	__rc20
	jsr	getdirent
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
.Lfunc_end26:
	.size	UpdateSectors, .Lfunc_end26-UpdateSectors
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end27:
	.size	escNOP, .Lfunc_end27-escNOP
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
.Lfunc_end28:
	.size	getscreenaddr, .Lfunc_end28-getscreenaddr
                                        ; -- End function
	.section	.text.cputc,"ax",@progbits
	.type	cputc,@function                 ; -- Begin function cputc
cputc:                                  ; @cputc
; %bb.0:
	sta	__rc2
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputcxy
.Lfunc_end29:
	.size	cputc, .Lfunc_end29-cputc
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
	bne	.LBB30_2
; %bb.1:
	dec	mos8(.Lcputcxy_zp_stk+1)
.LBB30_2:
	lda	mos8(.Lcputcxy_zp_stk+1)
	bne	.LBB30_5
; %bb.3:
	ldy	mos8(.Lcputcxy_zp_stk+3)
	cpx	mos8(.Lcputcxy_zp_stk+4)
	bne	.LBB30_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB30_7
.LBB30_5:
	ldy	mos8(.Lcputcxy_zp_stk+3)
.LBB30_6:
	ldx	mos8(.Lcputcxy_zp_stk+4)
	inx
.LBB30_7:
	stx	mos8(g_curX)
	sty	mos8(g_curY)
	rts
.Lfunc_end30:
	.size	cputcxy, .Lfunc_end30-cputcxy
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
.Lfunc_end31:
	.size	cputhex, .Lfunc_end31-cputhex
                                        ; -- End function
	.section	.text.cputs,"ax",@progbits
	.type	cputs,@function                 ; -- Begin function cputs
cputs:                                  ; @cputs
; %bb.0:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end32:
	.size	cputs, .Lfunc_end32-cputs
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
.Lfunc_end33:
	.size	cputsxy, .Lfunc_end33-cputsxy
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
	jmp	.LBB34_2
.LBB34_1:                               ;   in Loop: Header=BB34_2 Depth=1
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
.LBB34_2:                               ; =>This Inner Loop Header: Depth=1
	ldy	#3
	lda	(mos8(.Lfillrect_zp_stk)),y
	cmp	mos8(.Lfillrect_zp_stk+2)
	bcc	.LBB34_3
; %bb.6:                                ;   in Loop: Header=BB34_2 Depth=1
	jmp	.LBB34_1
.LBB34_3:
	rts
.Lfunc_end34:
	.size	fillrect, .Lfunc_end34-fillrect
                                        ; -- End function
	.section	.text.cgetc,"ax",@progbits
	.type	cgetc,@function                 ; -- Begin function cgetc
cgetc:                                  ; @cgetc
; %bb.0:
.LBB35_1:                               ; =>This Inner Loop Header: Depth=1
	lda	54800
	beq	.LBB35_1
; %bb.2:
	stz	54800
	rts
.Lfunc_end35:
	.size	cgetc, .Lfunc_end35-cgetc
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
.Lfunc_end36:
	.size	do_dma, .Lfunc_end36-do_dma
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
.Lfunc_end37:
	.size	lcopy, .Lfunc_end37-lcopy
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
.Lfunc_end38:
	.size	lfill, .Lfunc_end38-lfill
                                        ; -- End function
	.section	.text.strcpy,"ax",@progbits
	.type	strcpy,@function                ; -- Begin function strcpy
strcpy:                                 ; @strcpy
; %bb.0:
	lda	(__rc4)
	sta	(__rc2)
	lda	(__rc4)
	beq	.LBB39_7
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
.LBB39_2:                               ; =>This Inner Loop Header: Depth=1
	inc	__rc8
	bne	.LBB39_4
; %bb.3:                                ;   in Loop: Header=BB39_2 Depth=1
	inc	__rc9
.LBB39_4:                               ;   in Loop: Header=BB39_2 Depth=1
	lda	(__rc4),y
	sta	(__rc6),y
	lda	(__rc4),y
	inc	__rc6
	bne	.LBB39_6
; %bb.5:                                ;   in Loop: Header=BB39_2 Depth=1
	inc	__rc7
.LBB39_6:                               ;   in Loop: Header=BB39_2 Depth=1
	ldx	__rc8
	stx	__rc4
	ldx	__rc9
	stx	__rc5
	tax
	bne	.LBB39_2
.LBB39_7:
	rts
.Lfunc_end39:
	.size	strcpy, .Lfunc_end39-strcpy
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB40_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB40_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB40_4
; %bb.3:                                ;   in Loop: Header=BB40_2 Depth=1
	inx
.LBB40_4:                               ;   in Loop: Header=BB40_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB40_2
	bra	.LBB40_6
.LBB40_5:
	stz	__rc4
	ldx	#0
.LBB40_6:
	lda	__rc4
	rts
.Lfunc_end40:
	.size	strlen, .Lfunc_end40-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB41_2
.LBB41_1:                               ;   in Loop: Header=BB41_2 Depth=1
	dex
	asl
.LBB41_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB41_1
; %bb.3:
	rts
.Lfunc_end41:
	.size	__ashlqi3, .Lfunc_end41-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB42_3
; %bb.1:
	ldx	__rc2
.LBB42_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB42_2
.LBB42_3:
	ldx	__rc3
	rts
.Lfunc_end42:
	.size	__ashlhi3, .Lfunc_end42-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB43_3
; %bb.1:
	ldx	__rc4
.LBB43_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB43_2
.LBB43_3:
	ldx	__rc5
	rts
.Lfunc_end43:
	.size	__ashlsi3, .Lfunc_end43-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB44_3
; %bb.1:
	ldx	__rc8
.LBB44_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB44_2
.LBB44_3:
	ldx	__rc9
	rts
.Lfunc_end44:
	.size	__ashldi3, .Lfunc_end44-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB45_2
.LBB45_1:                               ;   in Loop: Header=BB45_2 Depth=1
	dex
	lsr
.LBB45_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB45_1
; %bb.3:
	rts
.Lfunc_end45:
	.size	__lshrqi3, .Lfunc_end45-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB46_3
; %bb.1:
	ldx	__rc2
.LBB46_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB46_2
.LBB46_3:
	ldx	__rc3
	rts
.Lfunc_end46:
	.size	__lshrhi3, .Lfunc_end46-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB47_3
; %bb.1:
	ldx	__rc4
.LBB47_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB47_2
.LBB47_3:
	ldx	__rc5
	rts
.Lfunc_end47:
	.size	__lshrsi3, .Lfunc_end47-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB48_3
; %bb.1:
	ldx	__rc8
.LBB48_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB48_2
.LBB48_3:
	ldx	__rc9
	rts
.Lfunc_end48:
	.size	__lshrdi3, .Lfunc_end48-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB49_2
.LBB49_1:                               ;   in Loop: Header=BB49_2 Depth=1
	dex
	cmp	#128
	ror
.LBB49_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB49_1
; %bb.3:
	rts
.Lfunc_end49:
	.size	__ashrqi3, .Lfunc_end49-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB50_3
; %bb.1:
	ldx	__rc2
.LBB50_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB50_2
.LBB50_3:
	tax
	lda	__rc3
	rts
.Lfunc_end50:
	.size	__ashrhi3, .Lfunc_end50-__ashrhi3
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
	beq	.LBB51_3
; %bb.1:
	ldx	__rc4
.LBB51_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB51_2
.LBB51_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end51:
	.size	__ashrsi3, .Lfunc_end51-__ashrsi3
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
	beq	.LBB52_3
; %bb.1:
	ldx	__rc8
.LBB52_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB52_2
.LBB52_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end52:
	.size	__ashrdi3, .Lfunc_end52-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB53_2
.LBB53_1:                               ;   in Loop: Header=BB53_2 Depth=1
	dex
	cmp	#128
	rol
.LBB53_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB53_1
; %bb.3:
	rts
.Lfunc_end53:
	.size	__rotlqi3, .Lfunc_end53-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB54_3
; %bb.1:
	ldx	__rc2
.LBB54_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB54_2
.LBB54_3:
	tax
	lda	__rc3
	rts
.Lfunc_end54:
	.size	__rotlhi3, .Lfunc_end54-__rotlhi3
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
	beq	.LBB55_3
; %bb.1:
	ldx	__rc4
.LBB55_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB55_2
.LBB55_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end55:
	.size	__rotlsi3, .Lfunc_end55-__rotlsi3
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
	beq	.LBB56_3
; %bb.1:
	ldx	__rc8
.LBB56_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB56_2
.LBB56_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end56:
	.size	__rotldi3, .Lfunc_end56-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB57_2
.LBB57_1:                               ;   in Loop: Header=BB57_2 Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror
.LBB57_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB57_1
; %bb.3:
	rts
.Lfunc_end57:
	.size	__rotrqi3, .Lfunc_end57-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB58_3
; %bb.1:
	ldx	__rc2
.LBB58_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB58_2
.LBB58_3:
	ldx	__rc3
	rts
.Lfunc_end58:
	.size	__rotrhi3, .Lfunc_end58-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB59_3
; %bb.1:
	ldx	__rc4
.LBB59_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	lsr	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB59_2
.LBB59_3:
	ldx	__rc5
	rts
.Lfunc_end59:
	.size	__rotrsi3, .Lfunc_end59-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB60_3
; %bb.1:
	ldx	__rc8
.LBB60_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB60_2
.LBB60_3:
	ldx	__rc9
	rts
.Lfunc_end60:
	.size	__rotrdi3, .Lfunc_end60-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB61_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB61_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB61_4
; %bb.3:                                ;   in Loop: Header=BB61_2 Depth=1
	clc
	adc	__rc2
.LBB61_4:                               ;   in Loop: Header=BB61_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB61_2
; %bb.5:
	rts
.LBB61_6:
	lda	#0
	rts
.Lfunc_end61:
	.size	__mulqi3, .Lfunc_end61-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB62_2
; %bb.1:
	ldy	__rc2
	beq	.LBB62_7
.LBB62_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB62_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB62_5
; %bb.4:                                ;   in Loop: Header=BB62_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB62_5:                               ;   in Loop: Header=BB62_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB62_3
; %bb.6:                                ;   in Loop: Header=BB62_3 Depth=1
	ldx	__rc2
	bne	.LBB62_3
	bra	.LBB62_8
.LBB62_7:
	ldy	#0
	tya
.LBB62_8:
	tax
	tya
	rts
.Lfunc_end62:
	.size	__mulhi3, .Lfunc_end62-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB63_4
; %bb.1:
	ldy	__rc6
	bne	.LBB63_4
; %bb.2:
	ldy	__rc5
	bne	.LBB63_4
; %bb.3:
	ldy	__rc4
	bne	.LBB63_4
; %bb.13:
	jmp	.LBB63_12
.LBB63_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB63_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB63_7
; %bb.6:                                ;   in Loop: Header=BB63_5 Depth=1
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
.LBB63_7:                               ;   in Loop: Header=BB63_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB63_5
; %bb.8:                                ;   in Loop: Header=BB63_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB63_5
; %bb.9:                                ;   in Loop: Header=BB63_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB63_5
; %bb.10:                               ;   in Loop: Header=BB63_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB63_5
.LBB63_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB63_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB63_11
.Lfunc_end63:
	.size	__mulsi3, .Lfunc_end63-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB64_8
; %bb.1:
	ldy	__rc14
	bne	.LBB64_8
; %bb.2:
	ldy	__rc13
	bne	.LBB64_8
; %bb.3:
	ldy	__rc12
	bne	.LBB64_8
; %bb.4:
	ldy	__rc11
	bne	.LBB64_8
; %bb.5:
	ldy	__rc10
	bne	.LBB64_8
; %bb.6:
	ldy	__rc9
	bne	.LBB64_8
; %bb.7:
	ldy	__rc8
	bne	.LBB64_8
; %bb.21:
	jmp	.LBB64_20
.LBB64_8:
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
.LBB64_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB64_11
; %bb.10:                               ;   in Loop: Header=BB64_9 Depth=1
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
.LBB64_11:                              ;   in Loop: Header=BB64_9 Depth=1
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
	beq	.LBB64_12
; %bb.23:                               ;   in Loop: Header=BB64_9 Depth=1
	jmp	.LBB64_9
.LBB64_12:                              ;   in Loop: Header=BB64_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB64_13
; %bb.25:                               ;   in Loop: Header=BB64_9 Depth=1
	jmp	.LBB64_9
.LBB64_13:                              ;   in Loop: Header=BB64_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB64_14
; %bb.27:                               ;   in Loop: Header=BB64_9 Depth=1
	jmp	.LBB64_9
.LBB64_14:                              ;   in Loop: Header=BB64_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB64_15
; %bb.29:                               ;   in Loop: Header=BB64_9 Depth=1
	jmp	.LBB64_9
.LBB64_15:                              ;   in Loop: Header=BB64_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB64_16
; %bb.31:                               ;   in Loop: Header=BB64_9 Depth=1
	jmp	.LBB64_9
.LBB64_16:                              ;   in Loop: Header=BB64_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB64_17
; %bb.33:                               ;   in Loop: Header=BB64_9 Depth=1
	jmp	.LBB64_9
.LBB64_17:                              ;   in Loop: Header=BB64_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB64_18
; %bb.35:                               ;   in Loop: Header=BB64_9 Depth=1
	jmp	.LBB64_9
.LBB64_18:                              ;   in Loop: Header=BB64_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB64_19
; %bb.37:                               ;   in Loop: Header=BB64_9 Depth=1
	jmp	.LBB64_9
.LBB64_19:
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
.LBB64_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB64_19
.Lfunc_end64:
	.size	__muldi3, .Lfunc_end64-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB65_1
; %bb.15:
	jmp	.LBB65_14
.LBB65_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB65_2
; %bb.17:
	jmp	.LBB65_14
.LBB65_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB65_3
; %bb.19:
	jmp	.LBB65_14
.LBB65_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB65_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB65_6
; %bb.5:                                ;   in Loop: Header=BB65_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB65_8
	bra	.LBB65_7
.LBB65_6:                               ;   in Loop: Header=BB65_4 Depth=1
	cpy	__rc4
	bcc	.LBB65_8
.LBB65_7:                               ;   in Loop: Header=BB65_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB65_4
	bra	.LBB65_9
.LBB65_8:
	ldy	__rc3
	sty	__rc2
.LBB65_9:
	cpx	#0
	beq	.LBB65_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB65_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB65_13
; %bb.12:                               ;   in Loop: Header=BB65_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB65_13:                              ;   in Loop: Header=BB65_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB65_11
.LBB65_14:
	rts
.Lfunc_end65:
	.size	__udivqi3, .Lfunc_end65-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB66_2
; %bb.1:
	ldy	__rc2
	beq	.LBB66_4
.LBB66_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB66_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB66_6
.LBB66_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB66_22
.LBB66_5:
	cmp	__rc3
	bcc	.LBB66_4
.LBB66_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB66_7
; %bb.25:
	jmp	.LBB66_22
.LBB66_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB66_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB66_10
; %bb.9:                                ;   in Loop: Header=BB66_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB66_12
	bra	.LBB66_11
.LBB66_10:                              ;   in Loop: Header=BB66_8 Depth=1
	cmp	__rc6
	bcc	.LBB66_12
.LBB66_11:                              ;   in Loop: Header=BB66_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB66_8
	bra	.LBB66_13
.LBB66_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB66_13:
	cpx	#0
	bne	.LBB66_14
; %bb.27:
	jmp	.LBB66_22
.LBB66_14:
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
.LBB66_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB66_17
; %bb.16:                               ;   in Loop: Header=BB66_15 Depth=1
	ldy	#0
.LBB66_17:                              ;   in Loop: Header=BB66_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB66_21
; %bb.18:                               ;   in Loop: Header=BB66_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB66_20
.LBB66_19:                              ;   in Loop: Header=BB66_15 Depth=1
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
.LBB66_20:                              ;   in Loop: Header=BB66_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB66_15
	bra	.LBB66_22
.LBB66_21:                              ;   in Loop: Header=BB66_15 Depth=1
	cmp	__rc6
	bcs	.LBB66_19
	bra	.LBB66_20
.LBB66_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end66:
	.size	__udivhi3, .Lfunc_end66-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
	ldy	__rc7
	bne	.LBB67_4
; %bb.1:
	ldy	__rc6
	bne	.LBB67_4
; %bb.2:
	ldy	__rc5
	bne	.LBB67_4
; %bb.3:
	ldy	__rc4
	beq	.LBB67_9
.LBB67_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB67_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB67_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB67_7
; %bb.45:
	jmp	.LBB67_38
.LBB67_7:
	cmp	__rc4
	bcc	.LBB67_9
	bra	.LBB67_11
.LBB67_8:
	cpx	__rc7
	bcs	.LBB67_11
.LBB67_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB67_21
.LBB67_10:
	cpx	__rc6
	bcc	.LBB67_9
.LBB67_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB67_12
; %bb.47:
	jmp	.LBB67_21
.LBB67_12:
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
.LBB67_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB67_17
; %bb.14:                               ;   in Loop: Header=BB67_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB67_18
; %bb.15:                               ;   in Loop: Header=BB67_13 Depth=1
	cmp	__rc10
	bne	.LBB67_19
; %bb.16:                               ;   in Loop: Header=BB67_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB67_23
	bra	.LBB67_20
.LBB67_17:                              ;   in Loop: Header=BB67_13 Depth=1
	cpy	__rc12
	bcc	.LBB67_23
	bra	.LBB67_20
.LBB67_18:                              ;   in Loop: Header=BB67_13 Depth=1
	cpy	__rc11
	bcc	.LBB67_23
	bra	.LBB67_20
.LBB67_19:                              ;   in Loop: Header=BB67_13 Depth=1
	cmp	__rc10
	bcc	.LBB67_23
.LBB67_20:                              ;   in Loop: Header=BB67_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB67_13
	bra	.LBB67_24
.LBB67_21:
	stz	__rc2
	stz	__rc3
.LBB67_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB67_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB67_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB67_22
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
.LBB67_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB67_28
; %bb.27:                               ;   in Loop: Header=BB67_26 Depth=1
	ldy	#0
.LBB67_28:                              ;   in Loop: Header=BB67_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB67_32
; %bb.29:                               ;   in Loop: Header=BB67_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB67_34
; %bb.30:                               ;   in Loop: Header=BB67_26 Depth=1
	cmp	__rc10
	bne	.LBB67_37
; %bb.31:                               ;   in Loop: Header=BB67_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB67_33
	bra	.LBB67_35
.LBB67_32:                              ;   in Loop: Header=BB67_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB67_35
.LBB67_33:                              ;   in Loop: Header=BB67_26 Depth=1
	lda	__rc6
	bra	.LBB67_36
.LBB67_34:                              ;   in Loop: Header=BB67_26 Depth=1
	cpy	__rc11
	bcc	.LBB67_33
.LBB67_35:                              ;   in Loop: Header=BB67_26 Depth=1
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
.LBB67_36:                              ;   in Loop: Header=BB67_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB67_41
; %bb.49:                               ;   in Loop: Header=BB67_26 Depth=1
	jmp	.LBB67_26
.LBB67_41:
	jmp	.LBB67_22
.LBB67_37:                              ;   in Loop: Header=BB67_26 Depth=1
	cmp	__rc10
	bcc	.LBB67_33
	bra	.LBB67_35
.LBB67_38:
	cpx	__rc5
	bcs	.LBB67_43
; %bb.51:
	jmp	.LBB67_9
.LBB67_43:
	jmp	.LBB67_11
.Lfunc_end67:
	.size	__udivsi3, .Lfunc_end67-__udivsi3
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
	bne	.LBB68_8
; %bb.1:
	ldx	__rc14
	bne	.LBB68_8
; %bb.2:
	ldx	__rc13
	bne	.LBB68_8
; %bb.3:
	ldx	__rc12
	bne	.LBB68_8
; %bb.4:
	ldx	__rc11
	bne	.LBB68_8
; %bb.5:
	ldx	__rc10
	bne	.LBB68_8
; %bb.6:
	ldx	__rc9
	bne	.LBB68_8
; %bb.7:
	ldx	__rc8
	beq	.LBB68_17
.LBB68_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB68_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB68_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB68_11
; %bb.90:
	jmp	.LBB68_31
.LBB68_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB68_12
; %bb.92:
	jmp	.LBB68_32
.LBB68_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB68_13
; %bb.94:
	jmp	.LBB68_38
.LBB68_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB68_14
; %bb.96:
	jmp	.LBB68_40
.LBB68_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB68_15
; %bb.98:
	jmp	.LBB68_42
.LBB68_15:
	cmp	__rc8
	bcc	.LBB68_17
	bra	.LBB68_19
.LBB68_16:
	cpx	__rc15
	bcs	.LBB68_19
.LBB68_17:
	lda	#0
; %bb.66:
	jmp	.LBB68_29
.LBB68_18:
	cpx	__rc14
	bcc	.LBB68_17
.LBB68_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB68_20
; %bb.100:
	jmp	.LBB68_29
.LBB68_20:
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
.LBB68_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB68_25
; %bb.22:                               ;   in Loop: Header=BB68_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB68_26
; %bb.23:                               ;   in Loop: Header=BB68_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB68_27
; %bb.24:                               ;   in Loop: Header=BB68_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB68_102
; %bb.150:                              ;   in Loop: Header=BB68_21 Depth=1
	jmp	.LBB68_33
.LBB68_102:                             ;   in Loop: Header=BB68_21 Depth=1
	jmp	.LBB68_37
.LBB68_25:                              ;   in Loop: Header=BB68_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB68_28
; %bb.104:
	jmp	.LBB68_44
.LBB68_26:                              ;   in Loop: Header=BB68_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB68_28
; %bb.106:
	jmp	.LBB68_44
.LBB68_27:                              ;   in Loop: Header=BB68_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB68_28
; %bb.108:
	jmp	.LBB68_44
.LBB68_28:                              ;   in Loop: Header=BB68_21 Depth=1
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
	bmi	.LBB68_68
; %bb.110:                              ;   in Loop: Header=BB68_21 Depth=1
	jmp	.LBB68_21
.LBB68_68:
	jmp	.LBB68_45
.LBB68_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB68_30:
	ldx	__rc18
	rts
.LBB68_31:
	cpx	__rc13
	bcs	.LBB68_70
; %bb.112:
	jmp	.LBB68_17
.LBB68_70:
	jmp	.LBB68_19
.LBB68_32:
	cpx	__rc12
	bcs	.LBB68_72
; %bb.114:
	jmp	.LBB68_17
.LBB68_72:
	jmp	.LBB68_19
.LBB68_33:                              ;   in Loop: Header=BB68_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB68_39
; %bb.34:                               ;   in Loop: Header=BB68_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB68_41
; %bb.35:                               ;   in Loop: Header=BB68_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB68_43
; %bb.36:                               ;   in Loop: Header=BB68_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB68_44
; %bb.74:                               ;   in Loop: Header=BB68_21 Depth=1
	jmp	.LBB68_28
.LBB68_37:                              ;   in Loop: Header=BB68_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB68_44
; %bb.76:                               ;   in Loop: Header=BB68_21 Depth=1
	jmp	.LBB68_28
.LBB68_38:
	cpx	__rc11
	bcs	.LBB68_78
; %bb.116:
	jmp	.LBB68_17
.LBB68_78:
	jmp	.LBB68_19
.LBB68_39:                              ;   in Loop: Header=BB68_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB68_44
; %bb.80:                               ;   in Loop: Header=BB68_21 Depth=1
	jmp	.LBB68_28
.LBB68_40:
	cpx	__rc10
	bcs	.LBB68_82
; %bb.118:
	jmp	.LBB68_17
.LBB68_82:
	jmp	.LBB68_19
.LBB68_41:                              ;   in Loop: Header=BB68_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB68_44
; %bb.84:                               ;   in Loop: Header=BB68_21 Depth=1
	jmp	.LBB68_28
.LBB68_42:
	cpx	__rc9
	bcs	.LBB68_86
; %bb.120:
	jmp	.LBB68_17
.LBB68_86:
	jmp	.LBB68_19
.LBB68_43:                              ;   in Loop: Header=BB68_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB68_44
; %bb.122:                              ;   in Loop: Header=BB68_21 Depth=1
	jmp	.LBB68_28
.LBB68_44:
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
.LBB68_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB68_46
; %bb.124:
	jmp	.LBB68_30
.LBB68_46:
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
.LBB68_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB68_49
; %bb.48:                               ;   in Loop: Header=BB68_47 Depth=1
	ldy	#0
.LBB68_49:                              ;   in Loop: Header=BB68_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB68_57
; %bb.50:                               ;   in Loop: Header=BB68_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB68_51
; %bb.126:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_60
.LBB68_51:                              ;   in Loop: Header=BB68_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB68_52
; %bb.128:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_61
.LBB68_52:                              ;   in Loop: Header=BB68_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB68_53
; %bb.130:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_62
.LBB68_53:                              ;   in Loop: Header=BB68_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB68_54
; %bb.132:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_63
.LBB68_54:                              ;   in Loop: Header=BB68_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB68_55
; %bb.134:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_64
.LBB68_55:                              ;   in Loop: Header=BB68_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB68_56
; %bb.136:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_65
.LBB68_56:                              ;   in Loop: Header=BB68_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB68_58
	bra	.LBB68_59
.LBB68_57:                              ;   in Loop: Header=BB68_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB68_59
.LBB68_58:                              ;   in Loop: Header=BB68_47 Depth=1
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
.LBB68_59:                              ;   in Loop: Header=BB68_47 Depth=1
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
	beq	.LBB68_88
; %bb.138:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_47
.LBB68_88:
	jmp	.LBB68_30
.LBB68_60:                              ;   in Loop: Header=BB68_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB68_58
	bra	.LBB68_59
.LBB68_61:                              ;   in Loop: Header=BB68_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB68_59
; %bb.140:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_58
.LBB68_62:                              ;   in Loop: Header=BB68_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB68_59
; %bb.142:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_58
.LBB68_63:                              ;   in Loop: Header=BB68_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB68_59
; %bb.144:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_58
.LBB68_64:                              ;   in Loop: Header=BB68_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB68_59
; %bb.146:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_58
.LBB68_65:                              ;   in Loop: Header=BB68_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB68_59
; %bb.148:                              ;   in Loop: Header=BB68_47 Depth=1
	jmp	.LBB68_58
.Lfunc_end68:
	.size	__udivdi3, .Lfunc_end68-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB69_1
; %bb.15:
	jmp	.LBB69_13
.LBB69_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB69_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB69_14
; %bb.3:
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB69_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB69_6
; %bb.5:                                ;   in Loop: Header=BB69_4 Depth=1
	cmp	__rc2
	bcc	.LBB69_8
	bra	.LBB69_7
.LBB69_6:                               ;   in Loop: Header=BB69_4 Depth=1
	cpy	__rc4
	bcc	.LBB69_8
.LBB69_7:                               ;   in Loop: Header=BB69_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB69_4
	bra	.LBB69_9
.LBB69_8:
	ldy	__rc3
	sty	__rc2
.LBB69_9:
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB69_13
.LBB69_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB69_12
; %bb.11:                               ;   in Loop: Header=BB69_10 Depth=1
	sec
	sbc	__rc2
.LBB69_12:                              ;   in Loop: Header=BB69_10 Depth=1
	dex
	bne	.LBB69_10
.LBB69_13:
	rts
.LBB69_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end69:
	.size	__umodqi3, .Lfunc_end69-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB70_2
; %bb.1:
	ldx	__rc2
	bne	.LBB70_2
; %bb.22:
	jmp	.LBB70_19
.LBB70_2:
	cmp	__rc3
	bne	.LBB70_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB70_5
; %bb.20:
	jmp	.LBB70_19
.LBB70_4:
	cmp	__rc3
	bcs	.LBB70_5
; %bb.24:
	jmp	.LBB70_19
.LBB70_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB70_6
; %bb.26:
	jmp	.LBB70_18
.LBB70_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB70_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB70_9
; %bb.8:                                ;   in Loop: Header=BB70_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB70_11
	bra	.LBB70_10
.LBB70_9:                               ;   in Loop: Header=BB70_7 Depth=1
	cmp	__rc5
	bcc	.LBB70_11
.LBB70_10:                              ;   in Loop: Header=BB70_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB70_7
	bra	.LBB70_12
.LBB70_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB70_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB70_19
.LBB70_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB70_17
; %bb.14:                               ;   in Loop: Header=BB70_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB70_16
.LBB70_15:                              ;   in Loop: Header=BB70_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB70_16:                              ;   in Loop: Header=BB70_13 Depth=1
	dex
	bne	.LBB70_13
	bra	.LBB70_19
.LBB70_17:                              ;   in Loop: Header=BB70_13 Depth=1
	cmp	__rc5
	bcs	.LBB70_15
	bra	.LBB70_16
.LBB70_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB70_19:
	tax
	tya
	rts
.Lfunc_end70:
	.size	__umodhi3, .Lfunc_end70-__umodhi3
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
	bne	.LBB71_4
; %bb.1:
	ldx	__rc6
	bne	.LBB71_4
; %bb.2:
	ldx	__rc5
	bne	.LBB71_4
; %bb.3:
	ldx	__rc4
	bne	.LBB71_4
; %bb.42:
	jmp	.LBB71_35
.LBB71_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB71_8
; %bb.5:
	cmp	__rc6
	bne	.LBB71_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB71_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB71_11
; %bb.36:
	jmp	.LBB71_35
.LBB71_8:
	cpx	__rc7
	bcs	.LBB71_11
; %bb.38:
	jmp	.LBB71_35
.LBB71_9:
	cmp	__rc6
	bcs	.LBB71_11
; %bb.40:
	jmp	.LBB71_35
.LBB71_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB71_11
; %bb.44:
	jmp	.LBB71_35
.LBB71_11:
	ldx	__rc7
	bpl	.LBB71_12
; %bb.46:
	jmp	.LBB71_33
.LBB71_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB71_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB71_17
; %bb.14:                               ;   in Loop: Header=BB71_13 Depth=1
	cmp	__rc8
	bne	.LBB71_18
; %bb.15:                               ;   in Loop: Header=BB71_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB71_19
; %bb.16:                               ;   in Loop: Header=BB71_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB71_21
	bra	.LBB71_20
.LBB71_17:                              ;   in Loop: Header=BB71_13 Depth=1
	cpy	__rc9
	bcc	.LBB71_21
	bra	.LBB71_20
.LBB71_18:                              ;   in Loop: Header=BB71_13 Depth=1
	cmp	__rc8
	bcc	.LBB71_21
	bra	.LBB71_20
.LBB71_19:                              ;   in Loop: Header=BB71_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB71_21
.LBB71_20:                              ;   in Loop: Header=BB71_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB71_13
	bra	.LBB71_22
.LBB71_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB71_22:
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
	bne	.LBB71_23
; %bb.48:
	jmp	.LBB71_34
.LBB71_23:
	tya
.LBB71_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB71_28
; %bb.25:                               ;   in Loop: Header=BB71_24 Depth=1
	cmp	__rc8
	bne	.LBB71_31
; %bb.26:                               ;   in Loop: Header=BB71_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB71_32
; %bb.27:                               ;   in Loop: Header=BB71_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB71_29
	bra	.LBB71_30
.LBB71_28:                              ;   in Loop: Header=BB71_24 Depth=1
	cpy	__rc9
	bcc	.LBB71_30
.LBB71_29:                              ;   in Loop: Header=BB71_24 Depth=1
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
.LBB71_30:                              ;   in Loop: Header=BB71_24 Depth=1
	dex
	bne	.LBB71_24
	bra	.LBB71_35
.LBB71_31:                              ;   in Loop: Header=BB71_24 Depth=1
	cmp	__rc8
	bcs	.LBB71_29
	bra	.LBB71_30
.LBB71_32:                              ;   in Loop: Header=BB71_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB71_29
	bra	.LBB71_30
.LBB71_33:
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
	bra	.LBB71_35
.LBB71_34:
	tya
.LBB71_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end71:
	.size	__umodsi3, .Lfunc_end71-__umodsi3
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
	bne	.LBB72_8
; %bb.1:
	ldx	__rc14
	bne	.LBB72_8
; %bb.2:
	ldx	__rc13
	bne	.LBB72_8
; %bb.3:
	ldx	__rc12
	bne	.LBB72_8
; %bb.4:
	ldx	__rc11
	bne	.LBB72_8
; %bb.5:
	ldx	__rc10
	bne	.LBB72_8
; %bb.6:
	ldx	__rc9
	bne	.LBB72_8
; %bb.7:
	ldx	__rc8
	bne	.LBB72_8
; %bb.90:
	jmp	.LBB72_61
.LBB72_8:
	cmp	__rc15
	bne	.LBB72_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB72_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB72_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB72_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB72_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB72_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB72_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB72_23
; %bb.62:
	jmp	.LBB72_61
.LBB72_16:
	cmp	__rc15
	bcs	.LBB72_23
; %bb.64:
	jmp	.LBB72_61
.LBB72_17:
	cpx	__rc14
	bcs	.LBB72_23
; %bb.66:
	jmp	.LBB72_61
.LBB72_18:
	cpx	__rc13
	bcs	.LBB72_23
; %bb.68:
	jmp	.LBB72_61
.LBB72_19:
	cpx	__rc12
	bcs	.LBB72_23
; %bb.70:
	jmp	.LBB72_61
.LBB72_20:
	cpx	__rc11
	bcs	.LBB72_23
; %bb.72:
	jmp	.LBB72_61
.LBB72_21:
	cpx	__rc10
	bcs	.LBB72_23
; %bb.74:
	jmp	.LBB72_61
.LBB72_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB72_23
; %bb.92:
	jmp	.LBB72_61
.LBB72_23:
	ldx	__rc15
	bpl	.LBB72_24
; %bb.94:
	jmp	.LBB72_33
.LBB72_24:
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
.LBB72_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB72_29
; %bb.26:                               ;   in Loop: Header=BB72_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB72_30
; %bb.27:                               ;   in Loop: Header=BB72_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB72_31
; %bb.28:                               ;   in Loop: Header=BB72_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB72_76
; %bb.96:                               ;   in Loop: Header=BB72_25 Depth=1
	jmp	.LBB72_38
.LBB72_76:                              ;   in Loop: Header=BB72_25 Depth=1
	jmp	.LBB72_34
.LBB72_29:                              ;   in Loop: Header=BB72_25 Depth=1
	cmp	__rc19
	bcs	.LBB72_32
; %bb.98:
	jmp	.LBB72_42
.LBB72_30:                              ;   in Loop: Header=BB72_25 Depth=1
	cpy	__rc18
	bcs	.LBB72_32
; %bb.100:
	jmp	.LBB72_42
.LBB72_31:                              ;   in Loop: Header=BB72_25 Depth=1
	cpy	__rc7
	bcs	.LBB72_32
; %bb.102:
	jmp	.LBB72_42
.LBB72_32:                              ;   in Loop: Header=BB72_25 Depth=1
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
	bmi	.LBB72_78
; %bb.104:                              ;   in Loop: Header=BB72_25 Depth=1
	jmp	.LBB72_25
.LBB72_78:
	jmp	.LBB72_43
.LBB72_33:
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
	jmp	.LBB72_61
.LBB72_34:                              ;   in Loop: Header=BB72_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB72_39
; %bb.35:                               ;   in Loop: Header=BB72_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB72_40
; %bb.36:                               ;   in Loop: Header=BB72_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB72_41
; %bb.37:                               ;   in Loop: Header=BB72_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB72_42
; %bb.82:                               ;   in Loop: Header=BB72_25 Depth=1
	jmp	.LBB72_32
.LBB72_38:                              ;   in Loop: Header=BB72_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB72_42
; %bb.84:                               ;   in Loop: Header=BB72_25 Depth=1
	jmp	.LBB72_32
.LBB72_39:                              ;   in Loop: Header=BB72_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB72_42
; %bb.86:                               ;   in Loop: Header=BB72_25 Depth=1
	jmp	.LBB72_32
.LBB72_40:                              ;   in Loop: Header=BB72_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB72_42
; %bb.88:                               ;   in Loop: Header=BB72_25 Depth=1
	jmp	.LBB72_32
.LBB72_41:                              ;   in Loop: Header=BB72_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB72_42
; %bb.106:                              ;   in Loop: Header=BB72_25 Depth=1
	jmp	.LBB72_32
.LBB72_42:
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
.LBB72_43:
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
	bne	.LBB72_44
; %bb.108:
	jmp	.LBB72_61
.LBB72_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB72_52
; %bb.45:                               ;   in Loop: Header=BB72_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB72_46
; %bb.110:                              ;   in Loop: Header=BB72_44 Depth=1
	jmp	.LBB72_55
.LBB72_46:                              ;   in Loop: Header=BB72_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB72_47
; %bb.112:                              ;   in Loop: Header=BB72_44 Depth=1
	jmp	.LBB72_56
.LBB72_47:                              ;   in Loop: Header=BB72_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB72_48
; %bb.114:                              ;   in Loop: Header=BB72_44 Depth=1
	jmp	.LBB72_57
.LBB72_48:                              ;   in Loop: Header=BB72_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB72_49
; %bb.116:                              ;   in Loop: Header=BB72_44 Depth=1
	jmp	.LBB72_58
.LBB72_49:                              ;   in Loop: Header=BB72_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB72_50
; %bb.118:                              ;   in Loop: Header=BB72_44 Depth=1
	jmp	.LBB72_59
.LBB72_50:                              ;   in Loop: Header=BB72_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB72_51
; %bb.120:                              ;   in Loop: Header=BB72_44 Depth=1
	jmp	.LBB72_60
.LBB72_51:                              ;   in Loop: Header=BB72_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB72_53
	bra	.LBB72_54
.LBB72_52:                              ;   in Loop: Header=BB72_44 Depth=1
	cmp	__rc19
	bcc	.LBB72_54
.LBB72_53:                              ;   in Loop: Header=BB72_44 Depth=1
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
.LBB72_54:                              ;   in Loop: Header=BB72_44 Depth=1
	dex
	beq	.LBB72_61
; %bb.122:                              ;   in Loop: Header=BB72_44 Depth=1
	jmp	.LBB72_44
.LBB72_55:                              ;   in Loop: Header=BB72_44 Depth=1
	cpy	__rc18
	bcs	.LBB72_53
	bra	.LBB72_54
.LBB72_56:                              ;   in Loop: Header=BB72_44 Depth=1
	cpy	__rc7
	bcs	.LBB72_53
	bra	.LBB72_54
.LBB72_57:                              ;   in Loop: Header=BB72_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB72_53
	bra	.LBB72_54
.LBB72_58:                              ;   in Loop: Header=BB72_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB72_53
	bra	.LBB72_54
.LBB72_59:                              ;   in Loop: Header=BB72_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB72_53
	bra	.LBB72_54
.LBB72_60:                              ;   in Loop: Header=BB72_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB72_54
; %bb.124:                              ;   in Loop: Header=BB72_44 Depth=1
	jmp	.LBB72_53
.LBB72_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end72:
	.size	__umoddi3, .Lfunc_end72-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB73_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB73_2
; %bb.18:
	jmp	.LBB73_17
.LBB73_2:
	lda	__rc5
	bpl	.LBB73_3
; %bb.20:
	jmp	.LBB73_15
.LBB73_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB73_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB73_6
; %bb.5:                                ;   in Loop: Header=BB73_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB73_9
	bra	.LBB73_7
.LBB73_6:                               ;   in Loop: Header=BB73_4 Depth=1
	cpy	__rc6
	bcc	.LBB73_9
.LBB73_7:                               ;   in Loop: Header=BB73_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB73_4
	bra	.LBB73_10
.LBB73_8:
	sty	__rc7
	bra	.LBB73_17
.LBB73_9:
	ldy	__rc5
	sty	__rc4
.LBB73_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB73_16
; %bb.11:
	lda	#1
.LBB73_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB73_14
; %bb.13:                               ;   in Loop: Header=BB73_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB73_14:                              ;   in Loop: Header=BB73_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB73_12
	bra	.LBB73_17
.LBB73_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB73_16:
	lda	#1
.LBB73_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end73:
	.size	__udivmodqi4, .Lfunc_end73-__udivmodqi4
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
	bne	.LBB74_2
; %bb.1:
	ldx	__rc2
	beq	.LBB74_4
.LBB74_2:
	cmp	__rc3
	bne	.LBB74_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB74_6
.LBB74_4:
	ldx	#0
; %bb.26:
	jmp	.LBB74_24
.LBB74_5:
	cmp	__rc3
	bcc	.LBB74_4
.LBB74_6:
	tay
	ldx	__rc3
	bpl	.LBB74_7
; %bb.28:
	jmp	.LBB74_22
.LBB74_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB74_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB74_10
; %bb.9:                                ;   in Loop: Header=BB74_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB74_11
	bra	.LBB74_12
.LBB74_10:                              ;   in Loop: Header=BB74_8 Depth=1
	cmp	__rc8
	bcc	.LBB74_12
.LBB74_11:                              ;   in Loop: Header=BB74_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB74_8
	bra	.LBB74_13
.LBB74_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB74_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB74_14
; %bb.30:
	jmp	.LBB74_23
.LBB74_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB74_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB74_17
; %bb.16:                               ;   in Loop: Header=BB74_15 Depth=1
	ldy	#0
.LBB74_17:                              ;   in Loop: Header=BB74_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB74_21
; %bb.18:                               ;   in Loop: Header=BB74_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB74_20
.LBB74_19:                              ;   in Loop: Header=BB74_15 Depth=1
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
.LBB74_20:                              ;   in Loop: Header=BB74_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB74_15
	bra	.LBB74_25
.LBB74_21:                              ;   in Loop: Header=BB74_15 Depth=1
	cmp	__rc8
	bcs	.LBB74_19
	bra	.LBB74_20
.LBB74_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB74_23:
	ldx	#1
.LBB74_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB74_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end74:
	.size	__udivmodhi4, .Lfunc_end74-__udivmodhi4
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
	bpl	.LBB75_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB75_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB75_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB75_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB75_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB75_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB75_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB75_8:
	lda	__rc2
	rts
.Lfunc_end75:
	.size	__divqi3, .Lfunc_end75-__divqi3
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
	bmi	.LBB76_2
; %bb.1:
	bra	.LBB76_6
.LBB76_2:
	cpx	#128
	bne	.LBB76_5
; %bb.3:
	lda	__rc4
	bne	.LBB76_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB76_6
.LBB76_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB76_6:
	tya
	bmi	.LBB76_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB76_12
.LBB76_8:
	cpy	#128
	bne	.LBB76_11
; %bb.9:
	lda	__rc2
	bne	.LBB76_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB76_12
.LBB76_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB76_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB76_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB76_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end76:
	.size	__divhi3, .Lfunc_end76-__divhi3
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
	bmi	.LBB77_2
; %bb.1:
	ldy	__rc3
	bra	.LBB77_8
.LBB77_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB77_7
; %bb.3:
	lda	__rc2
	bne	.LBB77_7
; %bb.4:
	lda	__rc8
	bne	.LBB77_7
; %bb.5:
	lda	__rc9
	bne	.LBB77_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB77_8
.LBB77_7:
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
.LBB77_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB77_10
; %bb.9:
	lda	__rc7
	bra	.LBB77_16
.LBB77_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB77_15
; %bb.11:
	lda	__rc6
	bne	.LBB77_15
; %bb.12:
	lda	__rc5
	bne	.LBB77_15
; %bb.13:
	lda	__rc4
	bne	.LBB77_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB77_16
.LBB77_15:
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
.LBB77_16:
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
	bne	.LBB77_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB77_19
.LBB77_18:
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
.LBB77_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end77:
	.size	__divsi3, .Lfunc_end77-__divsi3
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
	bmi	.LBB78_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB78_12
.LBB78_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB78_11
; %bb.3:
	lda	__rc6
	bne	.LBB78_11
; %bb.4:
	lda	__rc5
	bne	.LBB78_11
; %bb.5:
	lda	__rc4
	bne	.LBB78_11
; %bb.6:
	lda	__rc3
	bne	.LBB78_11
; %bb.7:
	lda	__rc2
	bne	.LBB78_11
; %bb.8:
	lda	__rc18
	bne	.LBB78_11
; %bb.9:
	lda	__rc19
	bne	.LBB78_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB78_12
.LBB78_11:
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
.LBB78_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB78_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB78_24
.LBB78_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB78_23
; %bb.15:
	lda	__rc14
	bne	.LBB78_23
; %bb.16:
	lda	__rc13
	bne	.LBB78_23
; %bb.17:
	lda	__rc12
	bne	.LBB78_23
; %bb.18:
	lda	__rc11
	bne	.LBB78_23
; %bb.19:
	lda	__rc10
	bne	.LBB78_23
; %bb.20:
	lda	__rc9
	bne	.LBB78_23
; %bb.21:
	lda	__rc8
	bne	.LBB78_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB78_24
.LBB78_23:
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
.LBB78_24:
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
	bne	.LBB78_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB78_27
.LBB78_26:
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
.LBB78_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end78:
	.size	__divdi3, .Lfunc_end78-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB79_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB79_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB79_3:
	tay
	lda	__rc2
	bmi	.LBB79_5
; %bb.4:
	lda	__rc2
	bra	.LBB79_7
.LBB79_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB79_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB79_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB79_9
; %bb.8:
	rts
.LBB79_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end79:
	.size	__modqi3, .Lfunc_end79-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB80_2
; %bb.1:
	txa
	bra	.LBB80_6
.LBB80_2:
	cpx	#128
	bne	.LBB80_5
; %bb.3:
	lda	__rc4
	bne	.LBB80_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB80_6
.LBB80_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB80_6:
	ldx	__rc3
	bpl	.LBB80_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB80_10
; %bb.8:
	ldx	__rc2
	bne	.LBB80_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB80_11
.LBB80_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB80_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB80_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB80_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end80:
	.size	__modhi3, .Lfunc_end80-__modhi3
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
	bmi	.LBB81_2
; %bb.1:
	lda	__rc3
	bra	.LBB81_8
.LBB81_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB81_7
; %bb.3:
	lda	__rc2
	bne	.LBB81_7
; %bb.4:
	lda	__rc8
	bne	.LBB81_7
; %bb.5:
	lda	__rc9
	bne	.LBB81_7
; %bb.6:
	stz	__rc9
	lda	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB81_8
.LBB81_7:
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
.LBB81_8:
	ldx	__rc7
	bpl	.LBB81_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB81_14
; %bb.10:
	ldx	__rc6
	bne	.LBB81_14
; %bb.11:
	ldx	__rc5
	bne	.LBB81_14
; %bb.12:
	ldx	__rc4
	bne	.LBB81_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB81_15
.LBB81_14:
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
.LBB81_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB81_17
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
.LBB81_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end81:
	.size	__modsi3, .Lfunc_end81-__modsi3
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
	bmi	.LBB82_2
; %bb.1:
	lda	__rc7
; %bb.26:
	jmp	.LBB82_12
.LBB82_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB82_11
; %bb.3:
	lda	__rc6
	bne	.LBB82_11
; %bb.4:
	lda	__rc5
	bne	.LBB82_11
; %bb.5:
	lda	__rc4
	bne	.LBB82_11
; %bb.6:
	lda	__rc3
	bne	.LBB82_11
; %bb.7:
	lda	__rc2
	bne	.LBB82_11
; %bb.8:
	lda	__rc18
	bne	.LBB82_11
; %bb.9:
	lda	__rc19
	bne	.LBB82_11
; %bb.10:
	stz	__rc19
	lda	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB82_12
.LBB82_11:
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
.LBB82_12:
	ldx	__rc15
	bmi	.LBB82_13
; %bb.28:
	jmp	.LBB82_23
.LBB82_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB82_22
; %bb.14:
	ldx	__rc14
	bne	.LBB82_22
; %bb.15:
	ldx	__rc13
	bne	.LBB82_22
; %bb.16:
	ldx	__rc12
	bne	.LBB82_22
; %bb.17:
	ldx	__rc11
	bne	.LBB82_22
; %bb.18:
	ldx	__rc10
	bne	.LBB82_22
; %bb.19:
	ldx	__rc9
	bne	.LBB82_22
; %bb.20:
	ldx	__rc8
	bne	.LBB82_22
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
	bra	.LBB82_23
.LBB82_22:
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
.LBB82_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB82_25
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
.LBB82_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end82:
	.size	__moddi3, .Lfunc_end82-__moddi3
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
	bpl	.LBB83_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB83_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB83_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB83_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB83_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB83_11
.LBB83_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB83_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB83_8
; %bb.34:
	jmp	.LBB83_24
.LBB83_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB83_24
.LBB83_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB83_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB83_12
.LBB83_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB83_24
.LBB83_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB83_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB83_15
; %bb.14:                               ;   in Loop: Header=BB83_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB83_18
	bra	.LBB83_16
.LBB83_15:                              ;   in Loop: Header=BB83_13 Depth=1
	cmp	__rc7
	bcc	.LBB83_18
.LBB83_16:                              ;   in Loop: Header=BB83_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB83_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB83_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB83_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB83_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB83_22
; %bb.21:                               ;   in Loop: Header=BB83_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB83_22:                              ;   in Loop: Header=BB83_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB83_20
	bra	.LBB83_24
.LBB83_23:
	sta	__rc7
	sty	__rc6
.LBB83_24:
	lda	__rc4
	bmi	.LBB83_26
; %bb.25:
	lda	__rc7
	bra	.LBB83_27
.LBB83_26:
	lda	#0
	sec
	sbc	__rc7
.LBB83_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB83_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB83_29:
	lda	__rc6
	rts
.Lfunc_end83:
	.size	__divmodqi4, .Lfunc_end83-__divmodqi4
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
	bmi	.LBB84_2
.LBB84_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB84_6
.LBB84_2:
	cpx	#128
	bne	.LBB84_5
; %bb.3:
	lda	__rc7
	bne	.LBB84_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB84_1
.LBB84_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB84_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB84_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB84_15
; %bb.8:
	lda	__rc2
	bne	.LBB84_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB84_18
.LBB84_10:
	cpy	#128
	bne	.LBB84_14
; %bb.11:
	ldy	__rc2
	bne	.LBB84_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB84_13
; %bb.48:
	jmp	.LBB84_45
.LBB84_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB84_18
.LBB84_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB84_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB84_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB84_20
.LBB84_17:
	sta	__rc11
.LBB84_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB84_39
.LBB84_19:
	cmp	__rc7
	bcc	.LBB84_17
.LBB84_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB84_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB84_23
; %bb.22:                               ;   in Loop: Header=BB84_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB84_24
	bra	.LBB84_26
.LBB84_23:                              ;   in Loop: Header=BB84_21 Depth=1
	cmp	__rc9
	bcc	.LBB84_26
.LBB84_24:                              ;   in Loop: Header=BB84_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB84_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB84_27
.LBB84_26:
	tay
.LBB84_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB84_28
; %bb.50:
	jmp	.LBB84_37
.LBB84_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB84_32
.LBB84_29:                              ;   in Loop: Header=BB84_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB84_36
.LBB84_30:                              ;   in Loop: Header=BB84_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB84_31:                              ;   in Loop: Header=BB84_32 Depth=1
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
	beq	.LBB84_39
.LBB84_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB84_34
; %bb.33:                               ;   in Loop: Header=BB84_32 Depth=1
	ldy	#0
.LBB84_34:                              ;   in Loop: Header=BB84_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB84_29
; %bb.35:                               ;   in Loop: Header=BB84_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB84_30
.LBB84_36:                              ;   in Loop: Header=BB84_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB84_31
.LBB84_37:
	sta	__rc11
	ldx	#1
.LBB84_38:
	stx	__rc9
.LBB84_39:
	lda	__rc6
	bmi	.LBB84_41
; %bb.40:
	lda	__rc10
	bra	.LBB84_42
.LBB84_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB84_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB84_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB84_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB84_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB84_38
.Lfunc_end84:
	.size	__divmodhi4, .Lfunc_end84-__divmodhi4
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB85_2
; %bb.1:
	tya
	beq	.LBB85_11
.LBB85_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB85_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB85_5
; %bb.4:                                ;   in Loop: Header=BB85_3 Depth=1
	inc	__rc7
.LBB85_5:                               ;   in Loop: Header=BB85_3 Depth=1
	inc	__rc4
	bne	.LBB85_7
; %bb.6:                                ;   in Loop: Header=BB85_3 Depth=1
	inc	__rc5
.LBB85_7:                               ;   in Loop: Header=BB85_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB85_9
; %bb.8:                                ;   in Loop: Header=BB85_3 Depth=1
	dex
.LBB85_9:                               ;   in Loop: Header=BB85_3 Depth=1
	txa
	bne	.LBB85_3
; %bb.10:                               ;   in Loop: Header=BB85_3 Depth=1
	tya
	bne	.LBB85_3
.LBB85_11:
	rts
.Lfunc_end85:
	.size	memcpy, .Lfunc_end85-memcpy
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
.Lfunc_end86:
	.size	memset, .Lfunc_end86-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB87_4
.LBB87_1:                               ;   in Loop: Header=BB87_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB87_3
; %bb.2:                                ;   in Loop: Header=BB87_4 Depth=1
	inc	__rc3
.LBB87_3:                               ;   in Loop: Header=BB87_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB87_7
.LBB87_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB87_1
; %bb.5:                                ;   in Loop: Header=BB87_4 Depth=1
	cpx	#0
	bne	.LBB87_1
; %bb.6:
	rts
.LBB87_7:                               ;   in Loop: Header=BB87_4 Depth=1
	dec	__rc4
	jmp	.LBB87_4
.Lfunc_end87:
	.size	__memset, .Lfunc_end87-__memset
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
	beq	.LBB88_1
; %bb.15:
	jmp	.LBB88_13
.LBB88_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB88_2
; %bb.17:
	jmp	.LBB88_14
.LBB88_2:
	lda	__rc7
	bne	.LBB88_4
; %bb.3:
	lda	__rc6
	beq	.LBB88_12
.LBB88_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB88_6
; %bb.5:                                ;   in Loop: Header=BB88_4 Depth=1
	dec	__rc9
.LBB88_6:                               ;   in Loop: Header=BB88_4 Depth=1
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
	bne	.LBB88_8
; %bb.7:                                ;   in Loop: Header=BB88_4 Depth=1
	dec	__rc11
.LBB88_8:                               ;   in Loop: Header=BB88_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB88_10
; %bb.9:                                ;   in Loop: Header=BB88_4 Depth=1
	dex
.LBB88_10:                              ;   in Loop: Header=BB88_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB88_4
; %bb.11:                               ;   in Loop: Header=BB88_4 Depth=1
	tya
	bne	.LBB88_4
.LBB88_12:
	rts
.LBB88_13:
	cpx	__rc3
	bcs	.LBB88_14
; %bb.19:
	jmp	.LBB88_2
.LBB88_14:
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
.Lfunc_end88:
	.size	memmove, .Lfunc_end88-memmove
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

	.type	.L.str.4.11,@object             ; @.str.4.11
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4.11:
	.asciz	"ReadSector. Track="
	.size	.L.str.4.11, 19

	.type	.L.str.5.12,@object             ; @.str.5.12
.L.str.5.12:
	.asciz	" Sector="
	.size	.L.str.5.12, 9

	.type	.L.str.6.13,@object             ; @.str.6.13
.L.str.6.13:
	.asciz	" $d082U="
	.size	.L.str.6.13, 9

	.type	.L.str.7.14,@object             ; @.str.7.14
.L.str.7.14:
	.asciz	"WriteSector. Track="
	.size	.L.str.7.14, 20

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

	.type	.Lswitch.table.gettype,@object  ; @switch.table.gettype
	.section	.rodata..Lswitch.table.gettype,"a",@progbits
.Lswitch.table.gettype:
	.ascii	"SPURC"
	.size	.Lswitch.table.gettype, 5

	.type	.Lswitch.table.gettype.20,@object ; @switch.table.gettype.20
	.section	.rodata..Lswitch.table.gettype.20,"a",@progbits
.Lswitch.table.gettype.20:
	.ascii	"ERSEB"
	.size	.Lswitch.table.gettype.20, 5

	.type	.Lswitch.table.gettype.21,@object ; @switch.table.gettype.21
	.section	.rodata..Lswitch.table.gettype.21,"a",@progbits
.Lswitch.table.gettype.21:
	.ascii	"QGRLM"
	.size	.Lswitch.table.gettype.21, 5

	.type	.L.str.41,@object               ; @.str.41
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.41:
	.asciz	" Midnight Mega "
	.size	.L.str.41, 16

	.type	.L.str.1.42,@object             ; @.str.1.42
.L.str.1.42:
	.asciz	" The MEGA65 file commander "
	.size	.L.str.1.42, 28

	.type	.L.str.2.43,@object             ; @.str.2.43
.L.str.2.43:
	.asciz	"   OK   "
	.size	.L.str.2.43, 9

	.type	.L.str.3.44,@object             ; @.str.3.44
.L.str.3.44:
	.asciz	" Cancel "
	.size	.L.str.3.44, 9

	.type	.L.str.4.45,@object             ; @.str.4.45
.L.str.4.45:
	.asciz	"v0.3.2-beta"
	.size	.L.str.4.45, 12

	.type	.L.str.5.46,@object             ; @.str.5.46
.L.str.5.46:
	.asciz	"github.com/nobruinfo"
	.size	.L.str.5.46, 21

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

	.type	filelist,@object                ; @filelist
	.section	.bss.filelist,"aw",@nobits
filelist:
	.zero	2080
	.size	filelist, 2080

	.type	.L.str.51,@object               ; @.str.51
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.51:
	.asciz	"> "
	.size	.L.str.51, 3

	.type	.L.str.1.52,@object             ; @.str.1.52
.L.str.1.52:
	.asciz	" <"
	.size	.L.str.1.52, 3

	.type	s,@object                       ; @s
	.section	.zp.bss.s,"aw",@nobits
s:
	.zero	40
	.size	s, 40

	.type	.L.str.3.58,@object             ; @.str.3.58
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3.58:
	.asciz	" 1"
	.size	.L.str.3.58, 3

	.type	.L.str.4.59,@object             ; @.str.4.59
.L.str.4.59:
	.asciz	"Help  "
	.size	.L.str.4.59, 7

	.type	.L.str.5.60,@object             ; @.str.5.60
.L.str.5.60:
	.asciz	" 2"
	.size	.L.str.5.60, 3

	.type	.L.str.6.61,@object             ; @.str.6.61
.L.str.6.61:
	.asciz	"Mount "
	.size	.L.str.6.61, 7

	.type	.L.str.7.62,@object             ; @.str.7.62
.L.str.7.62:
	.asciz	" 3"
	.size	.L.str.7.62, 3

	.type	.L.str.8.63,@object             ; @.str.8.63
.L.str.8.63:
	.asciz	"View  "
	.size	.L.str.8.63, 7

	.type	.L.str.9,@object                ; @.str.9
.L.str.9:
	.asciz	" 4"
	.size	.L.str.9, 3

	.type	.L.str.10,@object               ; @.str.10
.L.str.10:
	.asciz	"Edit  "
	.size	.L.str.10, 7

	.type	.L.str.11.64,@object            ; @.str.11.64
.L.str.11.64:
	.asciz	" 5"
	.size	.L.str.11.64, 3

	.type	.L.str.12.65,@object            ; @.str.12.65
.L.str.12.65:
	.asciz	"Copy  "
	.size	.L.str.12.65, 7

	.type	.L.str.13.66,@object            ; @.str.13.66
.L.str.13.66:
	.asciz	" 6"
	.size	.L.str.13.66, 3

	.type	.L.str.14.67,@object            ; @.str.14.67
.L.str.14.67:
	.asciz	"RenMov"
	.size	.L.str.14.67, 7

	.type	.L.str.15.68,@object            ; @.str.15.68
.L.str.15.68:
	.asciz	" 7"
	.size	.L.str.15.68, 3

	.type	.L.str.16.69,@object            ; @.str.16.69
.L.str.16.69:
	.asciz	"Mkdir "
	.size	.L.str.16.69, 7

	.type	.L.str.17.70,@object            ; @.str.17.70
.L.str.17.70:
	.asciz	" 8"
	.size	.L.str.17.70, 3

	.type	.L.str.18.71,@object            ; @.str.18.71
.L.str.18.71:
	.asciz	"Delete"
	.size	.L.str.18.71, 7

	.type	.L.str.19.72,@object            ; @.str.19.72
.L.str.19.72:
	.asciz	" 9"
	.size	.L.str.19.72, 3

	.type	.L.str.20,@object               ; @.str.20
.L.str.20:
	.asciz	"Menu  "
	.size	.L.str.20, 7

	.type	.L.str.21,@object               ; @.str.21
.L.str.21:
	.asciz	" 10"
	.size	.L.str.21, 4

	.type	.L.str.22,@object               ; @.str.22
.L.str.22:
	.asciz	"Quit "
	.size	.L.str.22, 6

	.type	.L.str.23,@object               ; @.str.23
.L.str.23:
	.asciz	"      "
	.size	.L.str.23, 7

	.type	.L.str.24,@object               ; @.str.24
.L.str.24:
	.asciz	"DskCpy"
	.size	.L.str.24, 7

	.type	.L.str.25,@object               ; @.str.25
.L.str.25:
	.asciz	"Format"
	.size	.L.str.25, 7

	.type	.L.str.26,@object               ; @.str.26
.L.str.26:
	.asciz	"     "
	.size	.L.str.26, 6

	.type	.L.str.27,@object               ; @.str.27
.L.str.27:
	.asciz	"Quit  "
	.size	.L.str.27, 7

	.type	diskname,@object                ; @diskname
	.section	.bss.diskname,"aw",@nobits
diskname:
	.zero	34
	.size	diskname, 34

	.type	.L.str.28,@object               ; @.str.28
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.28:
	.asciz	" Choose disk image file for drive "
	.size	.L.str.28, 35

	.type	.L.str.29,@object               ; @.str.29
.L.str.29:
	.asciz	": "
	.size	.L.str.29, 3

	.type	.L.str.30,@object               ; @.str.30
.L.str.30:
	.asciz	"Storage card mounting,"
	.size	.L.str.30, 23

	.type	.L.str.31,@object               ; @.str.31
.L.str.31:
	.asciz	"mount failed for"
	.size	.L.str.31, 17

	.type	.L.str.32,@object               ; @.str.32
.L.str.32:
	.asciz	"val="
	.size	.L.str.32, 5

	.type	.L.str.33,@object               ; @.str.33
.L.str.33:
	.asciz	"already mounted"
	.size	.L.str.33, 16

	.type	.L.str.34,@object               ; @.str.34
.L.str.34:
	.asciz	"Initialising..."
	.size	.L.str.34, 16

	.type	.L.str.35,@object               ; @.str.35
.L.str.35:
	.asciz	"reading disk drives"
	.size	.L.str.35, 20

	.type	.L.str.36,@object               ; @.str.36
.L.str.36:
	.asciz	" "
	.size	.L.str.36, 2

	.type	.L.str.37,@object               ; @.str.37
.L.str.37:
	.asciz	" drv:"
	.size	.L.str.37, 6

	.type	.L.str.38,@object               ; @.str.38
.L.str.38:
	.asciz	" blocks free "
	.size	.L.str.38, 14

	.type	.L.str.39,@object               ; @.str.39
.L.str.39:
	.asciz	"File copy,"
	.size	.L.str.39, 11

	.type	.L.str.40,@object               ; @.str.40
.L.str.40:
	.asciz	"destination disk space insufficient"
	.size	.L.str.40, 36

	.type	.L.str.41.75,@object            ; @.str.41.75
.L.str.41.75:
	.asciz	"from right to left"
	.size	.L.str.41.75, 19

	.type	.L.str.42,@object               ; @.str.42
.L.str.42:
	.asciz	"from left to right"
	.size	.L.str.42, 19

	.type	.L.str.43,@object               ; @.str.43
.L.str.43:
	.asciz	"Reading..."
	.size	.L.str.43, 11

	.type	.L.str.44,@object               ; @.str.44
.L.str.44:
	.asciz	"source file"
	.size	.L.str.44, 12

	.type	.L.str.45,@object               ; @.str.45
.L.str.45:
	.asciz	"BAM"
	.size	.L.str.45, 4

	.type	.L.str.46,@object               ; @.str.46
.L.str.46:
	.asciz	"Writing..."
	.size	.L.str.46, 11

	.type	.L.str.47,@object               ; @.str.47
.L.str.47:
	.asciz	"destination file"
	.size	.L.str.47, 17

	.type	.L.str.48,@object               ; @.str.48
.L.str.48:
	.asciz	"directory"
	.size	.L.str.48, 10

	.type	.L.str.49,@object               ; @.str.49
.L.str.49:
	.asciz	"File delete,"
	.size	.L.str.49, 13

	.type	.L.str.50,@object               ; @.str.50
.L.str.50:
	.asciz	"from right side"
	.size	.L.str.50, 16

	.type	.L.str.51.76,@object            ; @.str.51.76
.L.str.51.76:
	.asciz	"from left side"
	.size	.L.str.51.76, 15

	.type	.L.str.52,@object               ; @.str.52
.L.str.52:
	.asciz	"removing BAM entries"
	.size	.L.str.52, 21

	.type	.L.str.53,@object               ; @.str.53
.L.str.53:
	.asciz	"updating BAM"
	.size	.L.str.53, 13

	.type	.L.str.54,@object               ; @.str.54
.L.str.54:
	.asciz	"Disk copy,"
	.size	.L.str.54, 11

	.type	.L.str.55,@object               ; @.str.55
.L.str.55:
	.asciz	"destination disk will be OVERWRITTEN"
	.size	.L.str.55, 37

	.type	.L.str.56,@object               ; @.str.56
.L.str.56:
	.asciz	"Some function keys,"
	.size	.L.str.56, 20

	.type	.L.str.57,@object               ; @.str.57
.L.str.57:
	.asciz	"are not yet implemented."
	.size	.L.str.57, 25

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
	.zero	19
	.size	.Lstatic_stack, 19

.set .Lclrhome_zp_stk, .Lzp_stack
	.size	.Lclrhome_zp_stk, 2
.set .L__udivmodhi4_zp_stk, .Lzp_stack+40
	.size	.L__udivmodhi4_zp_stk, 1
.set .Lcputsxy_zp_stk, .Lzp_stack+31
	.size	.Lcputsxy_zp_stk, 9
.set .Lmcputsxy_zp_stk, .Lzp_stack+3
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
	.size	.Lprogress_zp_stk, 3
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
.set .Lmhprintf_zp_stk, .Lzp_stack+5
	.size	.Lmhprintf_zp_stk, 4
.set .Lcputln_zp_stk, .Lzp_stack+5
	.size	.Lcputln_zp_stk, 10
.set .LReadSector_zp_stk, .Lzp_stack+4
	.size	.LReadSector_zp_stk, 1
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
.set .Lmcbox_sstk, .Lstatic_stack+15
	.size	.Lmcbox_sstk, 4
.set .Lmessagebox_sstk, .Lstatic_stack+8
	.size	.Lmessagebox_sstk, 7
.set .Lcputhex_sstk, .Lstatic_stack+8
	.size	.Lcputhex_sstk, 10
.set .Lreadblockchain_sstk, .Lstatic_stack+1
	.size	.Lreadblockchain_sstk, 7
.set .Lgetdirent_sstk, .Lstatic_stack
	.size	.Lgetdirent_sstk, 1
.set .Lmh4printf_sstk, .Lstatic_stack
	.size	.Lmh4printf_sstk, 4
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
	.addrsig_sym filelist
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

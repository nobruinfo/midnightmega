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
	clc
	lda	__rc0
	adc	#234
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
	stx	mos8(g_curScreenH)
	bra	.LBB0_7
.LBB0_6:                                ;   in Loop: Header=BB0_7 Depth=1
	stz	54800
.LBB0_7:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB0_6
; %bb.8:
	ldx	#0
	stx	__rc24
	ldx	#29
	stx	__rc25
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
	jsr	msprintf
	jsr	cputln
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
	ldx	#mos16lo(.L.str.1)
	stx	__rc2
	ldx	#mos16hi(.L.str.1)
	stx	__rc3
	jsr	messagebox
	ldx	#15
	stx	mos8(g_curX)
	ldx	#7
	stx	mos8(g_curY)
	ldx	#mos16lo(.L.str.2)
	stx	__rc2
	ldx	#mos16hi(.L.str.2)
	stx	__rc3
	jsr	msprintf
.LBB0_16:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB0_16
; %bb.17:
	stz	54800
	ldx	#3
	stx	__rc2
	ldx	#29
	stx	__rc3
	ldx	#mos16lo(.L.str.4.34)
	stx	__rc4
	ldx	#mos16hi(.L.str.4.34)
	stx	__rc5
	ldx	#0
	lda	#16
	jsr	memcpy
	ldx	#3
	stx	__rc2
	ldx	#30
	stx	__rc3
	ldx	#mos16lo(.L.str.4.34)
	stx	__rc4
	ldx	#mos16hi(.L.str.4.34)
	stx	__rc5
	ldx	#0
	lda	#16
	jsr	memcpy
	jsr	getdirent
	tax
	sta	7426
	stz	7425
	stz	__rc2
	stz	__rc6
.LBB0_18:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_28 Depth 2
                                        ;     Child Loop BB0_40 Depth 2
                                        ;     Child Loop BB0_47 Depth 2
                                        ;       Child Loop BB0_58 Depth 3
                                        ;     Child Loop BB0_82 Depth 2
                                        ;     Child Loop BB0_140 Depth 2
                                        ;     Child Loop BB0_149 Depth 2
                                        ;     Child Loop BB0_94 Depth 2
                                        ;     Child Loop BB0_100 Depth 2
                                        ;     Child Loop BB0_103 Depth 2
                                        ;     Child Loop BB0_112 Depth 2
                                        ;     Child Loop BB0_134 Depth 2
                                        ;       Child Loop BB0_123 Depth 3
                                        ;       Child Loop BB0_128 Depth 3
                                        ;     Child Loop BB0_197 Depth 2
                                        ;       Child Loop BB0_169 Depth 3
                                        ;       Child Loop BB0_174 Depth 3
                                        ;       Child Loop BB0_184 Depth 3
                                        ;       Child Loop BB0_194 Depth 3
                                        ;     Child Loop BB0_156 Depth 2
	ldy	__rc6
	sty	__rc3
	asl	__rc3
	stz	__rc4
	rol	__rc4
	lda	#mos8(midnight)
	clc
	adc	__rc3
	sta	__rc5
	lda	#mos8(0)
	adc	__rc4
	sta	__rc3
	cpx	__rc2
	bcs	.LBB0_20
; %bb.19:                               ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	txa
	sta	(__rc24),y
.LBB0_20:                               ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc5
	stx	__rc24
	ldx	__rc3
	stx	__rc25
	ldx	#mos16lo(.L.str.5.35)
	stx	__rc22
	ldx	#mos16hi(.L.str.5.35)
	stx	__rc23
	ldx	#40
	lda	__rc6
	ldy	#12
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	__mulqi3
	tay
	clc
	adc	#39
	sta	__rc2
	ldx	#23
	stx	__rc3
	ldx	#0
	sty	__rc29
	tya
	jsr	mcbox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB0_28
.LBB0_21:                               ;   in Loop: Header=BB0_28 Depth=2
	cmp	#96
	bcc	.LBB0_23
; %bb.22:                               ;   in Loop: Header=BB0_28 Depth=2
	clc
	adc	#160
	bra	.LBB0_25
.LBB0_23:                               ;   in Loop: Header=BB0_28 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB0_25
; %bb.24:                               ;   in Loop: Header=BB0_28 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB0_25:                               ;   in Loop: Header=BB0_28 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB0_27
; %bb.26:                               ;   in Loop: Header=BB0_28 Depth=2
	inc	__rc3
.LBB0_27:                               ;   in Loop: Header=BB0_28 Depth=2
	tax
	beq	.LBB0_32
.LBB0_28:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc22)
	inc	__rc22
	bne	.LBB0_30
; %bb.29:                               ;   in Loop: Header=BB0_28 Depth=2
	inc	__rc23
.LBB0_30:                               ;   in Loop: Header=BB0_28 Depth=2
	cmp	#192
	bcc	.LBB0_21
; %bb.31:                               ;   in Loop: Header=BB0_28 Depth=2
	eor	#128
	bra	.LBB0_25
.LBB0_32:                               ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc29
	ora	#2
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
                                        ; kill: def $rs1 killed $rs1
	pha
	lda	__rc2
	ldy	#16
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
	jsr	cputsxy
	lda	(__rc24)
	sta	__rc2
	clc
	adc	#3
	sta	__rc4
	ldy	#1
	lda	(__rc24),y
	ldx	__rc2
	stx	__rc24
	sta	__rc25
	adc	#0
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	lda	__rc4
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc4
	stx	__rc2
	ldx	__rc5
	stx	__rc3
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	bra	.LBB0_40
.LBB0_33:                               ;   in Loop: Header=BB0_40 Depth=2
	cmp	#96
	bcc	.LBB0_35
; %bb.34:                               ;   in Loop: Header=BB0_40 Depth=2
	clc
	adc	#160
	bra	.LBB0_37
.LBB0_35:                               ;   in Loop: Header=BB0_40 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB0_37
; %bb.36:                               ;   in Loop: Header=BB0_40 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB0_37:                               ;   in Loop: Header=BB0_40 Depth=2
	sta	(__rc4)
	inc	__rc4
	bne	.LBB0_39
; %bb.38:                               ;   in Loop: Header=BB0_40 Depth=2
	inc	__rc5
.LBB0_39:                               ;   in Loop: Header=BB0_40 Depth=2
	tax
	beq	.LBB0_44
.LBB0_40:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2)
	inc	__rc2
	bne	.LBB0_42
; %bb.41:                               ;   in Loop: Header=BB0_40 Depth=2
	inc	__rc3
.LBB0_42:                               ;   in Loop: Header=BB0_40 Depth=2
	cmp	#192
	bcc	.LBB0_33
; %bb.43:                               ;   in Loop: Header=BB0_40 Depth=2
	eor	#128
	bra	.LBB0_37
.LBB0_44:                               ;   in Loop: Header=BB0_18 Depth=1
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
                                        ; kill: def $rs12 killed $rs12
	lda	__rc24
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc25
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#1
	lda	(__rc24),y
	sta	__rc26
	cmp	#21
	stz	__rc27
	stz	__rc28
	bcc	.LBB0_46
; %bb.45:                               ;   in Loop: Header=BB0_18 Depth=1
	clc
	adc	#235
	sta	__rc27
	lda	#0
	adc	#255
	sta	__rc28
.LBB0_46:                               ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc29
	ora	#1
	sta	__rc31
	stz	__rc29
	ldx	#0
.LBB0_47:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_58 Depth 3
	stx	__rc20
	txa
	clc
	adc	__rc27
	ldx	#1
	bcs	.LBB0_49
; %bb.48:                               ;   in Loop: Header=BB0_47 Depth=2
	ldx	#0
.LBB0_49:                               ;   in Loop: Header=BB0_47 Depth=2
	stx	__rc22
	sta	__rc21
	jsr	getdirententry
	ldx	__rc2
	stx	__rc24
	ldx	__rc3
	stx	__rc25
	ldx	__rc25
	ldy	#0
	sty	__rc2
	ldy	#0
	sty	__rc3
	cpx	__rc3
	bne	.LBB0_51
; %bb.50:                               ;   in Loop: Header=BB0_47 Depth=2
	ldx	__rc24
	cpx	__rc2
	bne	.LBB0_51
; %bb.237:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_81
.LBB0_51:                               ;   in Loop: Header=BB0_47 Depth=2
	lda	__rc29
	ldx	__rc22
	cpx	#1
	adc	__rc28
	ldy	#32
	tax
	bne	.LBB0_54
; %bb.52:                               ;   in Loop: Header=BB0_47 Depth=2
	ldx	__rc21
	cpx	__rc26
	bne	.LBB0_54
; %bb.53:                               ;   in Loop: Header=BB0_47 Depth=2
	sta	__rc22
	ldx	#62
	bra	.LBB0_55
.LBB0_54:                               ;   in Loop: Header=BB0_47 Depth=2
	sta	__rc22
	ldx	#32
.LBB0_55:                               ;   in Loop: Header=BB0_47 Depth=2
	stx	s
	sty	s+1
	ldy	#5
	lda	(__rc24),y
	cmp	#160
	bne	.LBB0_57
; %bb.56:                               ;   in Loop: Header=BB0_47 Depth=2
	stz	__rc30
	lda	#2
	bra	.LBB0_63
.LBB0_57:                               ;   in Loop: Header=BB0_47 Depth=2
	stz	__rc30
.LBB0_58:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_47 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldy	__rc30
	ldx	__rc30
	sta	s+2,x
	lda	__rc30
	clc
	adc	__rc24
	sta	__rc2
	lda	__rc25
	adc	#0
	sta	__rc3
	inc	__rc30
	sty	__rc4
	cpy	#15
	ldx	#1
	bcs	.LBB0_60
; %bb.59:                               ;   in Loop: Header=BB0_58 Depth=3
	ldx	#0
.LBB0_60:                               ;   in Loop: Header=BB0_58 Depth=3
	stx	__rc5
	ldy	#6
	lda	(__rc2),y
	cmp	#160
	beq	.LBB0_62
; %bb.61:                               ;   in Loop: Header=BB0_58 Depth=3
	ldx	__rc5
	beq	.LBB0_58
.LBB0_62:                               ;   in Loop: Header=BB0_47 Depth=2
	clc
	lda	__rc4
	adc	#3
	ldx	__rc5
	bne	.LBB0_66
.LBB0_63:                               ;   in Loop: Header=BB0_47 Depth=2
	sta	__rc2
	sta	__rc23
	lda	#mos16lo(s)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(s)
	adc	#0
	sta	__rc3
	lda	#15
	sec
	sbc	__rc30
	stz	__rc4
	inc
	bne	.LBB0_65
; %bb.64:                               ;   in Loop: Header=BB0_47 Depth=2
	inc	__rc4
.LBB0_65:                               ;   in Loop: Header=BB0_47 Depth=2
	tax
	lda	#32
	jsr	__memset
	lda	__rc23
	clc
	adc	#16
	sec
	sbc	__rc30
.LBB0_66:                               ;   in Loop: Header=BB0_47 Depth=2
	tax
	inx
	tay
	sta	__rc2
	lda	#32
	sta	s,y
	lda	__rc2
	clc
	adc	#2
	tay
	lda	#93
	sta	s,x
	ldx	__rc2
	stx	__rc3
	lda	__rc2
	clc
	adc	#3
	sta	__rc2
	lda	#32
	sta	s,y
	lda	#15
	ldy	#2
	and	(__rc24),y
	ldx	#0
	sta	__rc4
	tay
	dec
	cpy	#0
	bne	.LBB0_68
; %bb.67:                               ;   in Loop: Header=BB0_47 Depth=2
	dex
.LBB0_68:                               ;   in Loop: Header=BB0_47 Depth=2
	cpx	#0
	bne	.LBB0_70
; %bb.69:                               ;   in Loop: Header=BB0_47 Depth=2
	cmp	#5
	bra	.LBB0_71
.LBB0_70:                               ;   in Loop: Header=BB0_47 Depth=2
	cpx	#0
.LBB0_71:                               ;   in Loop: Header=BB0_47 Depth=2
	lda	#68
	ldx	#69
	pha
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#76
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	bcs	.LBB0_73
; %bb.72:                               ;   in Loop: Header=BB0_47 Depth=2
	ldx	__rc4
	lda	mos8(.Lswitch.table.gettype-1),x
	ldy	mos8(.Lswitch.table.gettype.38-1),x
	pha
	tya
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	mos8(.Lswitch.table.gettype.39-1),x
	tax
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
.LBB0_73:                               ;   in Loop: Header=BB0_47 Depth=2
	ldx	__rc2
	sta	s,x
	clc
	lda	__rc3
	adc	#4
	tax
	clc
	lda	__rc3
	adc	#5
	tay
	phy
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	s,x
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	s,y
	clc
	lda	__rc3
	adc	#6
	tay
	clc
	lda	__rc3
	adc	#7
	sta	__rc4
	clc
	lda	__rc3
	adc	#8
	sta	__rc5
	clc
	lda	__rc3
	adc	#9
	tax
	lda	#32
	sta	s,y
	lda	#93
	ldy	__rc4
	sta	s,y
	ldy	__rc5
	lda	#32
	sta	s,y
	stz	s,x
	lda	mos8(g_curTextColor)
	ldx	__rc22
	bne	.LBB0_76
; %bb.74:                               ;   in Loop: Header=BB0_47 Depth=2
	ldx	__rc21
	cpx	__rc26
	bne	.LBB0_76
; %bb.75:                               ;   in Loop: Header=BB0_47 Depth=2
	ldx	#60
	pha
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ora	#32
	bra	.LBB0_77
.LBB0_76:                               ;   in Loop: Header=BB0_47 Depth=2
	ldx	#32
	pha
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	and	#223
.LBB0_77:                               ;   in Loop: Header=BB0_47 Depth=2
	sta	mos8(g_curTextColor)
	ldx	__rc20
	inx
	ldy	#mos16lo(s)
	sty	__rc2
	ldy	#mos16hi(s)
	sty	__rc3
	lda	__rc31
	jsr	cputsxy
	lda	__rc24
	clc
	adc	#30
	sta	__rc2
	lda	__rc25
	adc	#0
	sta	__rc3
	ldy	#30
	lda	(__rc24),y
	sta	__rc5
	ldy	#1
	lda	(__rc2),y
	stz	__rc2
	stz	__rc3
	ldx	#5
	stx	__rc4
	tax
	lda	__rc5
	jsr	csputdec
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	pha
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	pla
	jsr	cputcxy
	ldx	__rc20
	inx
	bne	.LBB0_79
; %bb.78:                               ;   in Loop: Header=BB0_47 Depth=2
	inc	__rc29
.LBB0_79:                               ;   in Loop: Header=BB0_47 Depth=2
	lda	__rc29
	beq	.LBB0_80
; %bb.239:                              ;   in Loop: Header=BB0_47 Depth=2
	jmp	.LBB0_47
.LBB0_80:                               ;   in Loop: Header=BB0_47 Depth=2
	cpx	#22
	beq	.LBB0_81
; %bb.241:                              ;   in Loop: Header=BB0_47 Depth=2
	jmp	.LBB0_47
.LBB0_81:                               ;   in Loop: Header=BB0_18 Depth=1
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	jsr	cputln
.LBB0_82:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldy	54800
	beq	.LBB0_82
; %bb.83:                               ;   in Loop: Header=BB0_18 Depth=1
	sec
	tya
	sbc	#242
	stz	54800
	cmp	#9
	pha
	phy
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc25
	pla
	bcs	.LBB0_84
; %bb.243:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_91
.LBB0_84:                               ;   in Loop: Header=BB0_18 Depth=1
	sec
	sty	__rc20
	tya
	sbc	#9
	cmp	#10
	bcc	.LBB0_85
; %bb.245:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_113
.LBB0_85:                               ;   in Loop: Header=BB0_18 Depth=1
	tax
	ldy	.LJTI0_1,x
	lda	.LJTI0_1+10,x
	tax
	sty	__rc2
	stx	__rc3
	jmp	(__rc2)
.LBB0_86:                               ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	phy
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	beq	.LBB0_88
; %bb.87:                               ;   in Loop: Header=BB0_18 Depth=1
	ldy	#0
.LBB0_88:                               ;   in Loop: Header=BB0_18 Depth=1
	sty	__rc20
	jsr	getdirent
	ldx	#1
	ldy	__rc20
	bne	.LBB0_90
; %bb.89:                               ;   in Loop: Header=BB0_18 Depth=1
	ldx	#0
.LBB0_90:                               ;   in Loop: Header=BB0_18 Depth=1
	pha
	txa
	ldy	#12
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stx	__rc2
	asl	__rc2
	ldx	__rc2
	ldy	mos8(midnight),x
	sty	__rc24
	pha
	lda	mos8(midnight+1),x
	tax
	pla
	stx	__rc25
; %bb.209:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_152
.LBB0_91:                               ;   in Loop: Header=BB0_18 Depth=1
	tax
	sty	__rc20
	ldy	.LJTI0_0,x
	lda	.LJTI0_0+9,x
	tax
	sty	__rc2
	stx	__rc3
	jmp	(__rc2)
.LBB0_92:                               ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	lda	(__rc24),y
	jsr	getdirententry
	ldx	__rc2
	stx	__rc4
	ldx	__rc3
	stx	__rc5
	ldx	__rc20
	cpx	#245
	beq	.LBB0_93
; %bb.247:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_139
.LBB0_93:                               ;   in Loop: Header=BB0_18 Depth=1
	ldy	#3
	lda	(__rc4),y
	tax
	iny
                                        ; kill: def $rs2 killed $rs2
	phy
	lda	__rc4
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	lda	(__rc4),y
	stx	__rc5
	stz	__rc2
	ldx	#8
	stx	__rc3
	ldx	#199
	stx	__rc4
	sta	__rc6
	ldx	#16
	lda	#0
	jsr	readblockchain
	clc
	lda	__rc0
	adc	#21
	sta	__rc24
	lda	__rc1
	adc	#0
	sta	__rc25
	lda	#0
	stz	__rc20
	sta	(__rc24)
	clc
	lda	__rc0
	adc	#20
	sta	__rc26
	lda	__rc1
	adc	#0
	sta	__rc27
	lda	#255
	tax
	pha
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	(__rc26)
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
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	stz	53376
	lda	mos8(workside)
	asl
	sta	__rc2
	stz	__rc3
	rol	__rc3
	lda	#mos8(worksector)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos8(0)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	sta	__rc21
	sta	__rc28
	ldy	#1
	lda	(__rc2),y
	sta	__rc22
	sta	__rc29
	clc
	lda	__rc0
	adc	#19
	sta	__rc2
	lda	__rc1
	adc	#0
	sta	__rc3
                                        ; kill: def $rs1 killed $rs1
	lda	__rc2
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc3
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	lda	__rc0
	adc	#18
	sta	__rc30
	lda	__rc1
	adc	#0
	sta	__rc31
	ldx	__rc30
	stx	__rc4
	sta	__rc5
	jsr	findnextBAMtracksector
	lda	(__rc30)
	ldx	#0
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc30
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	lda	(__rc2)
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc31
.LBB0_94:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	clc
	stx	__rc23
	txa
	adc	#16
	sta	__rc10
	lda	#0
	adc	#0
	sta	__rc2
	lda	#0
	adc	#8
	sta	__rc3
	ldx	__rc21
	stx	__rc4
	ldx	__rc22
	stx	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	ldx	__rc10
	lda	#0
	jsr	lcopy
	lda	(__rc28)
	beq	.LBB0_96
; %bb.95:                               ;   in Loop: Header=BB0_94 Depth=2
	ldx	__rc24
	stx	__rc2
	ldx	__rc25
	stx	__rc3
	ldx	__rc26
	stx	__rc4
	ldx	__rc27
	stx	__rc5
	jsr	findnextBAMtracksector
	lda	(__rc24)
	sta	(__rc28)
	lda	(__rc26)
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#1
	sta	(__rc28),y
	lda	(__rc24)
	sta	__rc20
.LBB0_96:                               ;   in Loop: Header=BB0_94 Depth=2
	lda	__rc30
	and	#1
	ldx	__rc28
	stx	__rc2
	ldx	__rc29
	stx	__rc3
	ldx	__rc30
	stx	__rc4
	ldx	__rc31
	jsr	PutWholeSector
	lda	(__rc28)
	beq	.LBB0_102
; %bb.97:                               ;   in Loop: Header=BB0_94 Depth=2
	ldx	__rc23
	inx
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc30
	ldy	__rc20
	sty	__rc31
	cpx	#199
	beq	.LBB0_98
; %bb.249:                              ;   in Loop: Header=BB0_94 Depth=2
	jmp	.LBB0_94
.LBB0_98:                               ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc20
	beq	.LBB0_102
; %bb.99:                               ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.34)
	stx	__rc2
	ldx	#mos16hi(.L.str.34)
	stx	__rc3
	jsr	messagebox
.LBB0_100:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_100
; %bb.101:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	54800
.LBB0_102:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#3
	phy
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc10
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc11
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc10),y
	ldy	#4
	phy
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc10),y
	ldx	#8
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#3
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#40
	txa
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
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
	stx	__rc28
	ldx	mos8(direntryblock.0+1)
	stx	__rc29
	ldx	mos8(direntryblock.1)
	ldy	mos8(direntryblock.1+1)
	stz	__rc2
	stz	__rc3
	stx	__rc26
	stx	__rc4
	sty	__rc27
	sty	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc11
	lda	__rc10
	jsr	lcopy
	ldx	#0
	txa
	stz	__rc21
	pha
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
	pla
.LBB0_103:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lsr
	stx	__rc20
	stx	__rc22
	ror	__rc22
	stz	__rc23
	ror	__rc23
	lsr
	ror	__rc22
	ror	__rc23
	lsr
	ror	__rc22
	ror	__rc23
	stz	__rc2
	ldx	#8
	stx	__rc3
	ldx	__rc28
	stx	__rc4
	ldx	__rc29
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc22
	lda	__rc23
	jsr	lcopy
	ldx	6656
	beq	.LBB0_105
; %bb.104:                              ;   in Loop: Header=BB0_103 Depth=2
	clc
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	__rc21
	adc	#0
	sta	__rc3
	ldy	6657
	tya
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	bra	.LBB0_106
.LBB0_105:                              ;   in Loop: Header=BB0_103 Depth=2
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	ldy	__rc21
	sty	__rc3
.LBB0_106:                              ;   in Loop: Header=BB0_103 Depth=2
	lda	#15
	and	6658
	bne	.LBB0_107
; %bb.251:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_203
.LBB0_107:                              ;   in Loop: Header=BB0_103 Depth=2
	ldx	__rc20
	inx
	lda	#0
	cmp	__rc3
	bne	.LBB0_109
; %bb.108:                              ;   in Loop: Header=BB0_103 Depth=2
	cpx	__rc2
	bra	.LBB0_110
.LBB0_109:                              ;   in Loop: Header=BB0_103 Depth=2
	cmp	__rc3
.LBB0_110:                              ;   in Loop: Header=BB0_103 Depth=2
	pha
	lda	__rc2
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldy	__rc3
	sty	__rc21
	bcs	.LBB0_111
; %bb.253:                              ;   in Loop: Header=BB0_103 Depth=2
	jmp	.LBB0_103
.LBB0_111:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.36)
	stx	__rc3
	jsr	messagebox
.LBB0_112:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_112
; %bb.211:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_150
.LBB0_113:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc20
	cpx	#145
	bne	.LBB0_116
; %bb.114:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	lda	(__rc24),y
	bne	.LBB0_115
; %bb.255:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_154
.LBB0_115:                              ;   in Loop: Header=BB0_18 Depth=1
	dec
; %bb.213:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_159
.LBB0_116:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc20
	jsr	mprintf
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
; %bb.215:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_153
.LBB0_117:                              ;   in Loop: Header=BB0_18 Depth=1
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
	stz	__rc25
	cpx	#255
	bne	.LBB0_118
; %bb.257:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_161
.LBB0_118:                              ;   in Loop: Header=BB0_18 Depth=1
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
	bne	.LBB0_119
; %bb.259:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_161
.LBB0_119:                              ;   in Loop: Header=BB0_18 Depth=1
	cmp	#135
	bne	.LBB0_120
; %bb.261:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_161
.LBB0_120:                              ;   in Loop: Header=BB0_18 Depth=1
	cmp	#255
	bne	.LBB0_121
; %bb.263:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_161
.LBB0_121:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#0
; %bb.217:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_134
.LBB0_122:                              ;   in Loop: Header=BB0_134 Depth=2
	ldy	#0
	ldx	#0
.LBB0_123:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_134 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	6721,y
	cmp	#32
	beq	.LBB0_127
; %bb.124:                              ;   in Loop: Header=BB0_123 Depth=3
	cmp	#33
	bcc	.LBB0_126
; %bb.125:                              ;   in Loop: Header=BB0_123 Depth=3
	sta	7233,x
	inx
.LBB0_126:                              ;   in Loop: Header=BB0_123 Depth=3
	iny
	cpy	#8
	bne	.LBB0_123
.LBB0_127:                              ;   in Loop: Header=BB0_134 Depth=2
	ldy	#0
	lda	#46
	sta	7233,x
	inx
.LBB0_128:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_134 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	6729,y
	cmp	#32
	beq	.LBB0_132
; %bb.129:                              ;   in Loop: Header=BB0_128 Depth=3
	cmp	#33
	bcc	.LBB0_131
; %bb.130:                              ;   in Loop: Header=BB0_128 Depth=3
	sta	7233,x
	inx
.LBB0_131:                              ;   in Loop: Header=BB0_128 Depth=3
	iny
	cpy	#3
	bne	.LBB0_128
.LBB0_132:                              ;   in Loop: Header=BB0_134 Depth=2
	stz	7233,x
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
	ldx	#0
	stx	__rc4
	ldx	#26
	stx	__rc5
	jsr	strcpy
	ldy	__rc21
	inc	__rc25
.LBB0_133:                              ;   in Loop: Header=BB0_134 Depth=2
	lda	__rc20
	ldx	__rc21
	inx
	cpy	#17
	bcc	.LBB0_134
; %bb.265:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_160
.LBB0_134:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_123 Depth 3
                                        ;       Child Loop BB0_128 Depth 3
	stx	__rc21
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
	beq	.LBB0_136
; %bb.135:                              ;   in Loop: Header=BB0_134 Depth=2
	cpy	#255
	beq	.LBB0_136
; %bb.267:                              ;   in Loop: Header=BB0_134 Depth=2
	jmp	.LBB0_122
.LBB0_136:                              ;   in Loop: Header=BB0_134 Depth=2
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
	lda	#32
	sta	(__rc2)
	ldy	#1
	lda	#0
	sta	(__rc2),y
	ldy	__rc21
	bra	.LBB0_133
.LBB0_137:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	54801
	ldy	#1
	cpx	#1
	bne	.LBB0_138
; %bb.269:
	jmp	.LBB0_205
.LBB0_138:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	54801
	cpx	#2
	beq	.LBB0_219
; %bb.271:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_154
.LBB0_219:
	jmp	.LBB0_205
.LBB0_139:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#3
	txa
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#0
	ldy	#2
	sta	(__rc4),y
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
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	ldy	#1
	lda	(__rc24),y
	sta	__rc20
	lda	#0
	stz	53376
	stz	__rc24
	ldx	#40
	pha
	txa
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	mos8(direntryblock.0)
	stx	__rc21
	ldx	mos8(direntryblock.0+1)
	stx	__rc25
	ldx	#8
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stz	__rc26
.LBB0_140:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lsr
	ldx	__rc24
	stx	__rc22
	ror	__rc22
	stz	__rc23
	ror	__rc23
	lsr
	ror	__rc22
	ror	__rc23
	lsr
	ror	__rc22
	ror	__rc23
	stz	__rc2
	ldx	#8
	stx	__rc3
	ldx	__rc21
	stx	__rc4
	ldx	__rc25
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc22
	lda	__rc23
	jsr	lcopy
	ldx	6656
	beq	.LBB0_142
; %bb.141:                              ;   in Loop: Header=BB0_140 Depth=2
	clc
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	__rc26
	adc	#0
	sta	__rc3
	ldy	6657
	tya
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	bra	.LBB0_143
.LBB0_142:                              ;   in Loop: Header=BB0_140 Depth=2
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	ldx	__rc26
	stx	__rc3
.LBB0_143:                              ;   in Loop: Header=BB0_140 Depth=2
	ldx	__rc20
	cpx	__rc24
	bne	.LBB0_144
; %bb.273:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_204
.LBB0_144:                              ;   in Loop: Header=BB0_140 Depth=2
	ldx	__rc24
	inx
	lda	#0
	cmp	__rc3
	bne	.LBB0_146
; %bb.145:                              ;   in Loop: Header=BB0_140 Depth=2
	cpx	__rc2
	bra	.LBB0_147
.LBB0_146:                              ;   in Loop: Header=BB0_140 Depth=2
	cmp	__rc3
.LBB0_147:                              ;   in Loop: Header=BB0_140 Depth=2
	stx	__rc24
	pha
	lda	__rc2
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldx	__rc3
	stx	__rc26
	bcs	.LBB0_148
; %bb.275:                              ;   in Loop: Header=BB0_140 Depth=2
	jmp	.LBB0_140
.LBB0_148:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.37)
	stx	__rc2
	ldx	#mos16hi(.L.str.37)
	stx	__rc3
	jsr	messagebox
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
.LBB0_149:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_149
.LBB0_150:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	54800
.LBB0_151:                              ;   in Loop: Header=BB0_18 Depth=1
	jsr	getdirent
.LBB0_152:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#2
	sta	(__rc24),y
.LBB0_153:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
.LBB0_154:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	(__rc24),y
	sta	__rc2
	ldy	#2
	lda	(__rc24),y
	tax
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc6
; %bb.221:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_155:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.6.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.6.36)
	stx	__rc3
	jsr	messagebox
.LBB0_156:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_156
; %bb.157:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	54800
	bra	.LBB0_153
.LBB0_158:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	lda	(__rc24),y
	inc
.LBB0_159:                              ;   in Loop: Header=BB0_18 Depth=1
	sta	(__rc24),y
	bra	.LBB0_154
.LBB0_160:                              ;   in Loop: Header=BB0_18 Depth=1
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
.LBB0_161:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	#0
; %bb.223:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_197
.LBB0_162:                              ;   in Loop: Header=BB0_169 Depth=3
	cmp	#96
	bcc	.LBB0_164
; %bb.163:                              ;   in Loop: Header=BB0_169 Depth=3
	clc
	adc	#160
	bra	.LBB0_166
.LBB0_164:                              ;   in Loop: Header=BB0_169 Depth=3
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB0_166
; %bb.165:                              ;   in Loop: Header=BB0_169 Depth=3
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB0_166:                              ;   in Loop: Header=BB0_169 Depth=3
	sta	(__rc2)
	inc	__rc2
	bne	.LBB0_168
; %bb.167:                              ;   in Loop: Header=BB0_169 Depth=3
	inc	__rc3
.LBB0_168:                              ;   in Loop: Header=BB0_169 Depth=3
	tax
	beq	.LBB0_173
.LBB0_169:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_197 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc26)
	inc	__rc26
	bne	.LBB0_171
; %bb.170:                              ;   in Loop: Header=BB0_169 Depth=3
	inc	__rc27
.LBB0_171:                              ;   in Loop: Header=BB0_169 Depth=3
	cmp	#192
	bcc	.LBB0_162
; %bb.172:                              ;   in Loop: Header=BB0_169 Depth=3
	eor	#128
	bra	.LBB0_166
.LBB0_173:                              ;   in Loop: Header=BB0_197 Depth=2
	ldx	#5
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#mos16lo(filelist)
	stx	__rc26
	ldx	#mos16hi(filelist)
	stx	__rc27
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
	ldx	__rc24
	stx	__rc28
	stz	__rc29
.LBB0_174:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_197 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc26)
	tax
	lda	mos8(g_curTextColor)
	cpx	#0
	beq	.LBB0_183
; %bb.175:                              ;   in Loop: Header=BB0_174 Depth=3
	ldx	__rc29
	bne	.LBB0_177
; %bb.176:                              ;   in Loop: Header=BB0_174 Depth=3
	ldx	__rc28
	beq	.LBB0_181
.LBB0_177:                              ;   in Loop: Header=BB0_174 Depth=3
	and	#223
.LBB0_178:                              ;   in Loop: Header=BB0_174 Depth=3
	sta	mos8(g_curTextColor)
	ldx	__rc26
	stx	__rc2
	ldx	__rc27
	stx	__rc3
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	tax
	lda	#10
	jsr	cputsxy
	lda	__rc26
	clc
	adc	#65
	sta	__rc26
	lda	__rc27
	adc	#0
	sta	__rc27
	inc	__rc20
	ldx	__rc28
	dec	__rc28
	cpx	#0
	bne	.LBB0_180
; %bb.179:                              ;   in Loop: Header=BB0_174 Depth=3
	dec	__rc29
.LBB0_180:                              ;   in Loop: Header=BB0_174 Depth=3
	lda	__rc20
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc20
	cpx	#23
	bne	.LBB0_174
	bra	.LBB0_182
.LBB0_181:                              ;   in Loop: Header=BB0_174 Depth=3
	ora	#32
	bra	.LBB0_178
.LBB0_182:                              ;   in Loop: Header=BB0_197 Depth=2
	lda	mos8(g_curTextColor)
.LBB0_183:                              ;   in Loop: Header=BB0_197 Depth=2
	and	#223
	sta	mos8(g_curTextColor)
	jsr	cputln
.LBB0_184:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_197 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	54800
	beq	.LBB0_184
; %bb.185:                              ;   in Loop: Header=BB0_197 Depth=2
	stz	54800
	cmp	#145
	beq	.LBB0_190
; %bb.186:                              ;   in Loop: Header=BB0_197 Depth=2
	cmp	#13
	beq	.LBB0_192
; %bb.187:                              ;   in Loop: Header=BB0_197 Depth=2
	cmp	#17
	bne	.LBB0_188
; %bb.277:                              ;   in Loop: Header=BB0_197 Depth=2
	jmp	.LBB0_196
.LBB0_188:                              ;   in Loop: Header=BB0_197 Depth=2
	cmp	#27
	bne	.LBB0_189
; %bb.279:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_201
.LBB0_189:                              ;   in Loop: Header=BB0_197 Depth=2
	stz	__rc2
	stz	__rc3
	ldx	#0
	jsr	mprintf
	lda	__rc24
; %bb.225:                              ;   in Loop: Header=BB0_197 Depth=2
	jmp	.LBB0_197
.LBB0_190:                              ;   in Loop: Header=BB0_197 Depth=2
	lda	#0
	ldx	__rc24
	bne	.LBB0_191
; %bb.281:                              ;   in Loop: Header=BB0_197 Depth=2
	jmp	.LBB0_197
.LBB0_191:                              ;   in Loop: Header=BB0_197 Depth=2
	dec	__rc24
	lda	__rc24
; %bb.283:                              ;   in Loop: Header=BB0_197 Depth=2
	jmp	.LBB0_197
.LBB0_192:                              ;   in Loop: Header=BB0_197 Depth=2
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc24
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	#mos16lo(filelist)
	clc
	adc	__rc2
	sta	__rc26
	lda	#mos16hi(filelist)
	adc	__rc3
	sta	__rc27
	ldx	#28
	stx	mos8(fnamehi)
	ldx	#0
	stx	__rc2
	ldx	#28
	stx	__rc3
	ldx	__rc26
	stx	__rc4
	sta	__rc5
	jsr	strcpy
	ldy	mos8(fnamehi)
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
	lda	__rc2
	bne	.LBB0_193
; %bb.285:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_202
.LBB0_193:                              ;   in Loop: Header=BB0_197 Depth=2
	ldx	#mos16lo(.L.str.2.30)
	stx	__rc2
	ldx	#mos16hi(.L.str.2.30)
	stx	__rc3
	jsr	messagebox
.LBB0_194:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_197 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	54800
	beq	.LBB0_194
; %bb.195:                              ;   in Loop: Header=BB0_197 Depth=2
	stz	54800
	lda	__rc24
	bra	.LBB0_197
.LBB0_196:                              ;   in Loop: Header=BB0_197 Depth=2
	inc	__rc24
	lda	__rc24
.LBB0_197:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_169 Depth 3
                                        ;       Child Loop BB0_174 Depth 3
                                        ;       Child Loop BB0_184 Depth 3
                                        ;       Child Loop BB0_194 Depth 3
	cmp	__rc25
	bcs	.LBB0_199
; %bb.198:                              ;   in Loop: Header=BB0_197 Depth=2
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	sta	__rc24
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
	bne	.LBB0_200
.LBB0_199:                              ;   in Loop: Header=BB0_197 Depth=2
	stz	__rc24
.LBB0_200:                              ;   in Loop: Header=BB0_197 Depth=2
	ldx	#mos16lo(.L.str.1.29)
	stx	__rc26
	ldx	#mos16hi(.L.str.1.29)
	stx	__rc27
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
; %bb.227:                              ;   in Loop: Header=BB0_197 Depth=2
	jmp	.LBB0_169
.LBB0_201:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
; %bb.229:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_153
.LBB0_202:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	__rc26
	stx	__rc4
	ldx	__rc27
	stx	__rc5
	jsr	strcpy
	jsr	getdirent
	pha
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
	pla
; %bb.231:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_152
.LBB0_203:                              ;   in Loop: Header=BB0_18 Depth=1
	stx	6912
	ldx	6657
	stx	6913
	stz	__rc2
	stz	__rc3
	ldx	__rc23
	stx	__rc4
	ldx	__rc22
	stx	__rc5
	stz	__rc6
	ldx	#8
	stx	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc27
	lda	__rc26
	jsr	lcopy
	lda	__rc20
	lsr
	lsr
	lsr
	stz	__rc2
	ldx	#8
	stx	__rc3
	stz	__rc4
	ldx	#24
	stx	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	tax
	lda	#0
	jsr	lcopy
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	and	#1
	pha
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	jsr	PutWholeSector
; %bb.233:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_151
.LBB0_204:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	#240
	and	6658
	sta	6658
	stz	__rc2
	stz	__rc3
	ldx	__rc23
	stx	__rc4
	ldx	__rc22
	stx	__rc5
	stz	__rc6
	ldx	#8
	stx	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc25
	lda	__rc21
	jsr	lcopy
	lda	__rc20
	lsr
	lsr
	lsr
	stz	__rc2
	ldx	#8
	stx	__rc3
	stz	__rc4
	ldx	#24
	stx	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	tax
	lda	#0
	jsr	lcopy
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	and	#1
	pha
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	jsr	PutWholeSector
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
; %bb.235:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_151
.LBB0_205:
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#mos16lo(.L.str.3)
	stx	__rc2
	ldx	#mos16hi(.L.str.3)
	stx	__rc3
	jsr	msprintf
	jsr	cputln
.LBB0_206:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB0_206
.LBB0_207:                              ; =>This Inner Loop Header: Depth=1
	stz	54800
	ldx	54800
	bne	.LBB0_207
; %bb.208:
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
	adc	#22
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
	.byte	.LBB0_117@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_92@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_92@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_137@mos16lo
	.byte	.LBB0_117@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_92@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_92@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_137@mos16hi
.LJTI0_1:
	.byte	.LBB0_86@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_155@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_116@mos16lo
	.byte	.LBB0_158@mos16lo
	.byte	.LBB0_151@mos16lo
	.byte	.LBB0_86@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_155@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_116@mos16hi
	.byte	.LBB0_158@mos16hi
	.byte	.LBB0_151@mos16hi
                                        ; -- End function
	.section	.text.ReadSector,"ax",@progbits
	.type	ReadSector,@function            ; -- Begin function ReadSector
ReadSector:                             ; @ReadSector
; %bb.0:
	tay
	beq	.LBB1_5
; %bb.1:
	txa
	ldx	#97
	stx	53376
	ldx	#32
	stx	53377
	dey
	sty	53380
	tay
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
	.section	.text.GetWholeSector,"ax",@progbits
	.type	GetWholeSector,@function        ; -- Begin function GetWholeSector
GetWholeSector:                         ; @GetWholeSector
; %bb.0:
	ldy	__rc2
	sty	mos8(.LGetWholeSector_zp_stk)
	ldy	__rc3
	sty	mos8(.LGetWholeSector_zp_stk+1)
	jsr	ReadSector
	cmp	#2
	bcs	.LBB2_2
; %bb.1:
	ldy	#253
	ldx	#15
	sty	__rc2
	stx	__rc3
	ldx	mos8(.LGetWholeSector_zp_stk)
	stx	__rc4
	ldx	mos8(.LGetWholeSector_zp_stk+1)
	stx	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	ldx	#1
	stx	__rc9
	ldx	#108
	sta	mos8(.LGetWholeSector_zp_stk+2) ; 1-byte Folded Spill
	lda	#0
	jsr	lcopy
	clc
	lda	mos8(.LGetWholeSector_zp_stk)
	adc	#0
	sta	__rc4
	lda	mos8(.LGetWholeSector_zp_stk+1)
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
	lda	mos8(.LGetWholeSector_zp_stk+2) ; 1-byte Folded Reload
.LBB2_2:
	rts
.Lfunc_end2:
	.size	GetWholeSector, .Lfunc_end2-GetWholeSector
                                        ; -- End function
	.section	.text.PutWholeSector,"ax",@progbits
	.type	PutWholeSector,@function        ; -- Begin function PutWholeSector
PutWholeSector:                         ; @PutWholeSector
; %bb.0:
	sta	mos8(.LPutWholeSector_zp_stk)
	txa
	ldx	mos8(.LPutWholeSector_zp_stk)
	cpx	#2
	bcc	.LBB3_1
; %bb.12:
	jmp	.LBB3_11
.LBB3_1:
	ldx	__rc2
	stx	mos8(.LPutWholeSector_zp_stk+1) ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.LPutWholeSector_zp_stk+2) ; 1-byte Folded Spill
	ldx	__rc4
	stx	mos8(.LPutWholeSector_zp_stk+3) ; 1-byte Folded Spill
	sta	mos8(.LPutWholeSector_zp_stk+4) ; 1-byte Folded Spill
	jsr	ReadSector
	lda	mos8(.LPutWholeSector_zp_stk)
	beq	.LBB3_3
; %bb.2:
	ldx	#109
	bra	.LBB3_4
.LBB3_3:
	ldx	#108
.LBB3_4:
	ldy	#1
	stx	__rc5
	ldx	#253
	stx	__rc6
	stz	__rc2
	stz	__rc3
	stz	__rc4
	ldx	#15
	stx	__rc7
	stz	__rc8
	sty	__rc9
	ldx	mos8(.LPutWholeSector_zp_stk+1) ; 1-byte Folded Reload
	stx	__rc10
	ldx	mos8(.LPutWholeSector_zp_stk+2) ; 1-byte Folded Reload
	lda	__rc10
	jsr	lcopy
	ldx	#97
	sec
	lda	mos8(.LPutWholeSector_zp_stk+3) ; 1-byte Folded Reload
	sbc	mos8(.LPutWholeSector_zp_stk)
	cmp	#20
	bcc	.LBB3_6
; %bb.5:
	ldx	#105
.LBB3_6:
	stx	53376
	ldx	#32
	stx	53377
	ldx	mos8(.LPutWholeSector_zp_stk+4) ; 1-byte Folded Reload
	dex
	stx	53380
	lsr
	inc
	sta	53381
	stz	53382
	ldx	#132
	stx	53377
.LBB3_7:                                ; =>This Inner Loop Header: Depth=1
	ldx	53378
	bmi	.LBB3_7
; %bb.8:
	lda	53378
	and	#24
	beq	.LBB3_10
; %bb.9:
	ldx	#64
	stx	53376
	rts
.LBB3_10:
	lda	54921
	and	#127
	sta	54921
.LBB3_11:
	rts
.Lfunc_end3:
	.size	PutWholeSector, .Lfunc_end3-PutWholeSector
                                        ; -- End function
	.section	.text.readblockchain,"ax",@progbits
	.type	readblockchain,@function        ; -- Begin function readblockchain
readblockchain:                         ; @readblockchain
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#252
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
	pla
	sta	__rc23
	stx	__rc24
	lda	__rc5
	ldx	#22
	stx	mos8(BAMsector+1)
	inx
	stx	mos8(BAMsector+3)
	ldx	#25
	stx	mos8(worksector+3)
	dex
	stx	mos8(worksector+1)
	stx	mos8(worksectorasBAM.0+1)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	inx
	stx	mos8(direntryblock.1+1)
	stz	mos8(BAMsector)
	stz	mos8(BAMsector+2)
	stz	mos8(worksector)
	stz	mos8(worksector+2)
	stz	mos8(worksectorasBAM.0)
	stz	mos8(direntryblock.0)
	stz	mos8(direntryblock.1)
	stz	53376
	ldx	__rc4
	bne	.LBB4_1
; %bb.9:
	jmp	.LBB4_4
.LBB4_1:
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	ldx	__rc4
	stx	__rc22
	ldx	__rc6
	stx	__rc26
	stz	__rc25
.LBB4_2:                                ; =>This Inner Loop Header: Depth=1
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldx	__rc26
	jsr	GetWholeSector
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
	sta	__rc3
	lda	#0
	clc
	adc	__rc23
	sta	__rc4
	lda	__rc25
	adc	__rc24
	sta	__rc5
	lda	#0
	adc	__rc20
	tax
	lda	#0
	adc	__rc21
	sta	__rc7
	lda	(__rc2)
	sta	__rc8
	sta	__rc10
	ldy	#1
	lda	(__rc2),y
	sta	__rc9
	sta	__rc11
	lda	(__rc8)
	sta	__rc27
	lda	(__rc8),y
	sta	__rc26
	stx	__rc6
	stz	__rc2
	stz	__rc3
	stz	__rc8
	sty	__rc9
	ldx	__rc11
	lda	__rc10
	jsr	lcopy
	lda	__rc27
	beq	.LBB4_8
; %bb.3:                                ;   in Loop: Header=BB4_2 Depth=1
	lda	__rc27
	ldx	__rc25
	inx
	stx	__rc25
	cpx	__rc22
	beq	.LBB4_5
; %bb.11:                               ;   in Loop: Header=BB4_2 Depth=1
	jmp	.LBB4_2
.LBB4_4:
	tax
	beq	.LBB4_8
.LBB4_5:
	ldx	#mos16lo(.L.str.34)
	stx	__rc2
	ldx	#mos16hi(.L.str.34)
	stx	__rc3
	jsr	messagebox
.LBB4_6:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_6
; %bb.7:
	stz	54800
.LBB4_8:
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
	adc	#4
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end4:
	.size	readblockchain, .Lfunc_end4-readblockchain
                                        ; -- End function
	.section	.text.findnextBAMtracksector,"ax",@progbits
	.type	findnextBAMtracksector,@function ; -- Begin function findnextBAMtracksector
findnextBAMtracksector:                 ; @findnextBAMtracksector
; %bb.0:
	ldx	__rc2
	stx	mos8(.LfindnextBAMtracksector_zp_stk+11) ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.LfindnextBAMtracksector_zp_stk+12) ; 1-byte Folded Spill
	ldx	__rc4
	stx	mos8(.LfindnextBAMtracksector_zp_stk+13) ; 1-byte Folded Spill
	ldx	__rc5
	stx	mos8(.LfindnextBAMtracksector_zp_stk+14) ; 1-byte Folded Spill
	stz	mos8(.LfindnextBAMtracksector_zp_stk+5)
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
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	stz	53376
	ldx	mos8(BAMsector)
	ldy	mos8(BAMsector+1)
	stx	__rc2
	sty	__rc3
	lda	#40
	ldx	#1
	jsr	GetWholeSector
	sta	mos8(.LfindnextBAMtracksector_zp_stk+25) ; 1-byte Folded Spill
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
	sta	__rc3
	lda	(__rc2)
	sta	mos8(.LfindnextBAMtracksector_zp_stk)
	sta	__rc4
	ldy	#1
	lda	(__rc2),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+1)
	sta	__rc5
	ldx	__rc4
	stx	__rc2
	sta	__rc3
	ldx	__rc2
	stx	mos8(.LfindnextBAMtracksector_zp_stk+19) ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.LfindnextBAMtracksector_zp_stk+20) ; 1-byte Folded Spill
	ldx	#6
	stz	__rc4
	lda	#0
.LBB5_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_10 Depth 2
	stx	__rc2
	stz	__rc3
	ldx	#0
	stx	mos8(.LfindnextBAMtracksector_zp_stk+24) ; 1-byte Folded Spill
	sta	mos8(.LfindnextBAMtracksector_zp_stk+23) ; 1-byte Folded Spill
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	mos8(.LfindnextBAMtracksector_zp_stk)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+21) ; 1-byte Folded Spill
	clc
	adc	__rc2
	sta	__rc4
	lda	mos8(.LfindnextBAMtracksector_zp_stk+1)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+1)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+22) ; 1-byte Folded Spill
	adc	__rc3
	tay
	clc
	lda	__rc4
	adc	#21
	sta	__rc2
	tya
	adc	#0
	ldx	__rc2
	stx	mos8(.LfindnextBAMtracksector_zp_stk+15) ; 1-byte Folded Spill
	sta	mos8(.LfindnextBAMtracksector_zp_stk+16) ; 1-byte Folded Spill
	clc
	lda	__rc4
	adc	#20
	sta	__rc2
	tya
	adc	#0
	ldx	__rc2
	stx	mos8(.LfindnextBAMtracksector_zp_stk+17) ; 1-byte Folded Spill
	sta	mos8(.LfindnextBAMtracksector_zp_stk+18) ; 1-byte Folded Spill
	clc
	lda	__rc4
	adc	#19
	sta	mos8(.LfindnextBAMtracksector_zp_stk+6)
	tya
	adc	#0
	sta	mos8(.LfindnextBAMtracksector_zp_stk+7)
	clc
	lda	__rc4
	adc	#18
	sta	mos8(.LfindnextBAMtracksector_zp_stk+8)
	tya
	adc	#0
	sta	mos8(.LfindnextBAMtracksector_zp_stk+9)
	lda	__rc4
	sta	mos8(.LfindnextBAMtracksector_zp_stk+2)
	clc
	adc	#17
	sta	mos8(.LfindnextBAMtracksector_zp_stk)
	tya
	sty	mos8(.LfindnextBAMtracksector_zp_stk+3)
	adc	#0
	sta	mos8(.LfindnextBAMtracksector_zp_stk+1)
	ldx	#0
; %bb.22:                               ;   in Loop: Header=BB5_1 Depth=1
	jmp	.LBB5_10
.LBB5_2:                                ;   in Loop: Header=BB5_10 Depth=2
	cpx	#16
	bcs	.LBB5_4
; %bb.3:                                ;   in Loop: Header=BB5_10 Depth=2
	ldy	#18
	lda	(mos8(.LfindnextBAMtracksector_zp_stk+2)),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+4)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+10)
	txa
	clc
	adc	#248
	sta	__rc2
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	tax
	and	mos8(.LfindnextBAMtracksector_zp_stk+4)
	bne	.LBB5_24
; %bb.32:                               ;   in Loop: Header=BB5_10 Depth=2
	jmp	.LBB5_9
.LBB5_24:
	jmp	.LBB5_15
.LBB5_4:                                ;   in Loop: Header=BB5_10 Depth=2
	cpx	#24
	bcs	.LBB5_6
; %bb.5:                                ;   in Loop: Header=BB5_10 Depth=2
	ldy	#19
	lda	(mos8(.LfindnextBAMtracksector_zp_stk+2)),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+4)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+10)
	txa
	clc
	adc	#240
	sta	__rc2
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	tax
	and	mos8(.LfindnextBAMtracksector_zp_stk+4)
	beq	.LBB5_9
; %bb.26:
	jmp	.LBB5_16
.LBB5_6:                                ;   in Loop: Header=BB5_10 Depth=2
	cpx	#32
	bcs	.LBB5_8
; %bb.7:                                ;   in Loop: Header=BB5_10 Depth=2
	ldy	#20
	lda	(mos8(.LfindnextBAMtracksector_zp_stk+2)),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+4)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+10)
	txa
	clc
	adc	#232
	sta	__rc2
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	tax
	and	mos8(.LfindnextBAMtracksector_zp_stk+4)
	beq	.LBB5_9
; %bb.28:
	jmp	.LBB5_17
.LBB5_8:                                ;   in Loop: Header=BB5_10 Depth=2
	ldy	#21
	lda	(mos8(.LfindnextBAMtracksector_zp_stk+2)),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+4)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+10)
	txa
	clc
	adc	#224
	sta	__rc2
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	tax
	and	mos8(.LfindnextBAMtracksector_zp_stk+4)
	beq	.LBB5_9
; %bb.34:
	jmp	.LBB5_18
.LBB5_9:                                ;   in Loop: Header=BB5_10 Depth=2
	lda	mos8(.LfindnextBAMtracksector_zp_stk+10)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+10)
	inx
	cmp	#39
	bcs	.LBB5_12
.LBB5_10:                               ;   Parent Loop BB5_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cpx	#8
	bcc	.LBB5_11
; %bb.36:                               ;   in Loop: Header=BB5_10 Depth=2
	jmp	.LBB5_2
.LBB5_11:                               ;   in Loop: Header=BB5_10 Depth=2
	stx	__rc2
	ldy	#17
	lda	(mos8(.LfindnextBAMtracksector_zp_stk+2)),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+4)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+10)
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	tax
	and	mos8(.LfindnextBAMtracksector_zp_stk+4)
	beq	.LBB5_9
	bra	.LBB5_14
.LBB5_12:                               ;   in Loop: Header=BB5_1 Depth=1
	lda	mos8(.LfindnextBAMtracksector_zp_stk+23) ; 1-byte Folded Reload
	tax
	inx
	stz	__rc4
	cmp	#39
	txa
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+21) ; 1-byte Folded Reload
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+22) ; 1-byte Folded Reload
	stx	mos8(.LfindnextBAMtracksector_zp_stk+1)
	ldx	#6
	bcs	.LBB5_13
; %bb.38:                               ;   in Loop: Header=BB5_1 Depth=1
	jmp	.LBB5_1
.LBB5_13:
	stz	mos8(.LfindnextBAMtracksector_zp_stk+10)
	ldx	#255
	stx	mos8(.LfindnextBAMtracksector_zp_stk+15) ; 1-byte Folded Spill
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+11) ; 1-byte Folded Reload
	stx	mos8(.LfindnextBAMtracksector_zp_stk+2)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+12) ; 1-byte Folded Reload
	stx	mos8(.LfindnextBAMtracksector_zp_stk+3)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+13) ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+14) ; 1-byte Folded Reload
	stx	__rc3
	ldy	__rc2
	sty	mos8(.LfindnextBAMtracksector_zp_stk+6)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+7)
; %bb.30:
	jmp	.LBB5_21
.LBB5_14:
	stx	__rc5
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+11) ; 1-byte Folded Reload
	stx	mos8(.LfindnextBAMtracksector_zp_stk+2)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+12) ; 1-byte Folded Reload
	bra	.LBB5_20
.LBB5_15:
	stx	__rc5
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+8)
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+9)
	bra	.LBB5_19
.LBB5_16:
	stx	__rc5
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+6)
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+7)
	bra	.LBB5_19
.LBB5_17:
	stx	__rc5
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+17) ; 1-byte Folded Reload
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+18) ; 1-byte Folded Reload
	bra	.LBB5_19
.LBB5_18:
	stx	__rc5
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+15) ; 1-byte Folded Reload
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+16) ; 1-byte Folded Reload
.LBB5_19:
	stx	mos8(.LfindnextBAMtracksector_zp_stk+1)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+11) ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+12) ; 1-byte Folded Reload
	stx	__rc3
	ldy	__rc2
	sty	mos8(.LfindnextBAMtracksector_zp_stk+2)
.LBB5_20:
	stx	mos8(.LfindnextBAMtracksector_zp_stk+3)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+13) ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+14) ; 1-byte Folded Reload
	stx	__rc3
	ldy	__rc2
	sty	mos8(.LfindnextBAMtracksector_zp_stk+6)
	stx	mos8(.LfindnextBAMtracksector_zp_stk+7)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+25) ; 1-byte Folded Reload
	stx	mos8(.LfindnextBAMtracksector_zp_stk+5)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+19) ; 1-byte Folded Reload
	stx	mos8(.LfindnextBAMtracksector_zp_stk+8)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+20) ; 1-byte Folded Reload
	stx	mos8(.LfindnextBAMtracksector_zp_stk+9)
	ldy	mos8(.LfindnextBAMtracksector_zp_stk+23) ; 1-byte Folded Reload
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+24) ; 1-byte Folded Reload
	stx	__rc4
	lda	__rc5
	eor	#255
	and	mos8(.LfindnextBAMtracksector_zp_stk+4)
	sta	(mos8(.LfindnextBAMtracksector_zp_stk))
	tya
	inc
	sta	mos8(.LfindnextBAMtracksector_zp_stk+15) ; 1-byte Folded Spill
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	__rc4
	tya
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	clc
	lda	mos8(.LfindnextBAMtracksector_zp_stk+21) ; 1-byte Folded Reload
	adc	__rc2
	tay
	lda	mos8(.LfindnextBAMtracksector_zp_stk+22) ; 1-byte Folded Reload
	adc	__rc3
	sty	__rc2
	sta	__rc3
	ldy	#16
	lda	(__rc2),y
	dec
	sta	(__rc2),y
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+8)
	stx	__rc2
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+9)
	stx	__rc3
	ldx	#40
	ldy	#1
	sty	__rc4
	lda	mos8(.LfindnextBAMtracksector_zp_stk+5)
	jsr	PutWholeSector
.LBB5_21:
	lda	mos8(.LfindnextBAMtracksector_zp_stk+15) ; 1-byte Folded Reload
	sta	(mos8(.LfindnextBAMtracksector_zp_stk+2))
	lda	mos8(.LfindnextBAMtracksector_zp_stk+10)
	sta	(mos8(.LfindnextBAMtracksector_zp_stk+6))
	rts
.Lfunc_end5:
	.size	findnextBAMtracksector, .Lfunc_end5-findnextBAMtracksector
                                        ; -- End function
	.section	.text.getdirententry,"ax",@progbits
	.type	getdirententry,@function        ; -- Begin function getdirententry
getdirententry:                         ; @getdirententry
; %bb.0:
	sta	mos8(.Lgetdirententry_zp_stk+2)
	ldx	#0
	stx	mos8(.Lgetdirententry_zp_stk+4)
	ldx	#0
	stx	mos8(.Lgetdirententry_zp_stk+5)
	stz	__rc2
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
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	stz	53376
	ldy	mos8(direntryblock.0)
	ldx	mos8(direntryblock.0+1)
	sty	mos8(.Lgetdirententry_zp_stk)
	sty	__rc4
	stx	mos8(.Lgetdirententry_zp_stk+1)
	lda	#0
	stz	__rc3
	ldy	#8
	sty	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Spill
	stz	mos8(.Lgetdirententry_zp_stk+8)
.LBB6_1:                                ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	sta	mos8(.Lgetdirententry_zp_stk+7)
	sta	__rc10
	ror	__rc10
	lda	#0
	ror
	lsr	__rc3
	ror	__rc10
	ror
	lsr	__rc3
	ror	__rc10
	ror
	ldy	#8
	sty	__rc3
	ldy	__rc4
	sty	mos8(.Lgetdirententry_zp_stk+3)
	stx	mos8(.Lgetdirententry_zp_stk+6)
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc10
	jsr	lcopy
	ldx	6659
	beq	.LBB6_11
; %bb.2:                                ;   in Loop: Header=BB6_1 Depth=1
	ldx	6656
	beq	.LBB6_4
; %bb.3:                                ;   in Loop: Header=BB6_1 Depth=1
	clc
	lda	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	mos8(.Lgetdirententry_zp_stk+8)
	adc	#0
	sta	__rc3
	bra	.LBB6_5
.LBB6_4:                                ;   in Loop: Header=BB6_1 Depth=1
	ldx	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lgetdirententry_zp_stk+8)
	stx	__rc3
.LBB6_5:                                ;   in Loop: Header=BB6_1 Depth=1
	ldx	mos8(.Lgetdirententry_zp_stk+3)
	stx	__rc4
	lda	mos8(.Lgetdirententry_zp_stk+7)
	cmp	mos8(.Lgetdirententry_zp_stk+2)
	beq	.LBB6_10
; %bb.6:                                ;   in Loop: Header=BB6_1 Depth=1
	inc
	ldx	#0
	cpx	__rc3
	bne	.LBB6_8
; %bb.7:                                ;   in Loop: Header=BB6_1 Depth=1
	cmp	__rc2
	bcs	.LBB6_11
	bra	.LBB6_9
.LBB6_8:                                ;   in Loop: Header=BB6_1 Depth=1
	cpx	__rc3
	bcs	.LBB6_11
.LBB6_9:                                ;   in Loop: Header=BB6_1 Depth=1
	ldx	__rc2
	stx	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.Lgetdirententry_zp_stk+8)
	stz	__rc2
	ldx	mos8(.Lgetdirententry_zp_stk+6)
	stz	__rc3
; %bb.12:                               ;   in Loop: Header=BB6_1 Depth=1
	jmp	.LBB6_1
.LBB6_10:
	ldx	mos8(.Lgetdirententry_zp_stk)
	stx	mos8(.Lgetdirententry_zp_stk+4)
	ldx	mos8(.Lgetdirententry_zp_stk+1)
	stx	mos8(.Lgetdirententry_zp_stk+5)
.LBB6_11:
	ldx	mos8(.Lgetdirententry_zp_stk+4)
	stx	__rc2
	ldx	mos8(.Lgetdirententry_zp_stk+5)
	stx	__rc3
	rts
.Lfunc_end6:
	.size	getdirententry, .Lfunc_end6-getdirententry
                                        ; -- End function
	.section	.text.getdirent,"ax",@progbits
	.type	getdirent,@function             ; -- Begin function getdirent
getdirent:                              ; @getdirent
; %bb.0:
	ldx	__rc20
	phx
	ldx	__rc21
	phx
	ldx	__rc22
	phx
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
	stz	mos8(worksectorasBAM.0)
	stx	mos8(worksectorasBAM.0+1)
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	mos8(direntryblock.1)
	inx
	stx	mos8(direntryblock.1+1)
	stz	53376
	lda	#40
	ldx	#3
	ldy	#8
	sty	__rc3
	stz	__rc2
	ldy	#14
	sty	__rc4
	sta	__rc5
	stx	__rc6
	ldx	#0
	txa
	jsr	readblockchain
	lda	#112
	ldx	#0
	stx	__rc20
	ldx	#0
	stx	__rc21
.LBB7_1:                                ; =>This Inner Loop Header: Depth=1
	sta	__rc22
	jsr	getdirententry
	ldx	__rc3
	cpx	__rc21
	bne	.LBB7_5
; %bb.2:                                ;   in Loop: Header=BB7_1 Depth=1
	ldx	__rc2
	cpx	__rc20
	bne	.LBB7_5
; %bb.3:                                ;   in Loop: Header=BB7_1 Depth=1
	lda	__rc22
	dec
	bne	.LBB7_1
; %bb.4:
	lda	#0
	bra	.LBB7_6
.LBB7_5:
	lda	__rc22
.LBB7_6:
	plx
	stx	__rc22
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.Lfunc_end7:
	.size	getdirent, .Lfunc_end7-getdirent
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
	bne	.LBB8_2
; %bb.1:
	inc
.LBB8_2:
	cmp	#0
	bne	.LBB8_5
; %bb.3:
	cpy	__rc4
	bcs	.LBB8_6
.LBB8_4:
	inx
; %bb.10:
	jmp	.LBB8_9
.LBB8_5:
	cmp	#0
	bcc	.LBB8_4
.LBB8_6:
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
	bcs	.LBB8_8
; %bb.7:
	ldx	#0
.LBB8_8:
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
.LBB8_9:
	stz	mos8(g_curX)
	stx	mos8(g_curY)
	rts
.Lfunc_end8:
	.size	cputln, .Lfunc_end8-cputln
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
.LBB9_1:                                ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB9_5
; %bb.2:                                ;   in Loop: Header=BB9_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+4)
	bne	.LBB9_6
; %bb.3:                                ;   in Loop: Header=BB9_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+3)
	bne	.LBB9_7
; %bb.4:                                ;   in Loop: Header=BB9_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+2)
	cmp	#10
	bra	.LBB9_8
.LBB9_5:                                ;   in Loop: Header=BB9_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+5)
	bra	.LBB9_7
.LBB9_6:                                ;   in Loop: Header=BB9_1 Depth=1
	lda	mos8(.Lcsputdec_zp_stk+4)
.LBB9_7:                                ;   in Loop: Header=BB9_1 Depth=1
	cmp	#0
.LBB9_8:                                ;   in Loop: Header=BB9_1 Depth=1
	ldy	__rc4
	txa
	ldx	__rc2
	stx	mos8(.Lcsputdec_zp_stk+4)
	ldx	__rc3
	stx	mos8(.Lcsputdec_zp_stk+5)
	ldx	mos8(.Lcsputdec_zp_stk+1)
	bcs	.LBB9_1
; %bb.9:
	stz	__rc3
	txa
	beq	.LBB9_18
; %bb.10:
	sec
	lda	#10
	sbc	mos8(.Lcsputdec_zp_stk)
	sta	__rc3
	lda	#0
	sbc	#0
.LBB9_11:                               ; =>This Inner Loop Header: Depth=1
	stx	__rc2
	ldy	__rc3
	cpy	__rc2
	tay
	sbc	#0
	bvc	.LBB9_13
; %bb.12:                               ;   in Loop: Header=BB9_11 Depth=1
	eor	#128
.LBB9_13:                               ;   in Loop: Header=BB9_11 Depth=1
	cmp	#0
	bpl	.LBB9_16
; %bb.14:                               ;   in Loop: Header=BB9_11 Depth=1
	lda	#32
	sta	mos8(.Lcsputdec_zp_stk+7),x
	dex
	tya
	cpx	#0
	bne	.LBB9_11
; %bb.15:
	ldx	#0
.LBB9_16:
	stz	__rc3
	inx
	bne	.LBB9_19
; %bb.17:
	inc	__rc3
	bra	.LBB9_19
.LBB9_18:
	ldx	#1
.LBB9_19:
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
.Lfunc_end9:
	.size	csputdec, .Lfunc_end9-csputdec
                                        ; -- End function
	.section	.text.msprintf,"ax",@progbits
	.type	msprintf,@function              ; -- Begin function msprintf
msprintf:                               ; @msprintf
; %bb.0:
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
	bra	.LBB10_8
.LBB10_1:                               ;   in Loop: Header=BB10_8 Depth=1
	cmp	#96
	bcc	.LBB10_3
; %bb.2:                                ;   in Loop: Header=BB10_8 Depth=1
	clc
	adc	#160
	bra	.LBB10_5
.LBB10_3:                               ;   in Loop: Header=BB10_8 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB10_5
; %bb.4:                                ;   in Loop: Header=BB10_8 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB10_5:                               ;   in Loop: Header=BB10_8 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB10_7
; %bb.6:                                ;   in Loop: Header=BB10_8 Depth=1
	inc	__rc7
.LBB10_7:                               ;   in Loop: Header=BB10_8 Depth=1
	tax
	beq	.LBB10_12
.LBB10_8:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB10_10
; %bb.9:                                ;   in Loop: Header=BB10_8 Depth=1
	inc	__rc5
.LBB10_10:                              ;   in Loop: Header=BB10_8 Depth=1
	cmp	#192
	bcc	.LBB10_1
; %bb.11:                               ;   in Loop: Header=BB10_8 Depth=1
	eor	#128
	bra	.LBB10_5
.LBB10_12:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end10:
	.size	msprintf, .Lfunc_end10-msprintf
                                        ; -- End function
	.section	.text.mprintf,"ax",@progbits
	.type	mprintf,@function               ; -- Begin function mprintf
mprintf:                                ; @mprintf
; %bb.0:
	sta	mos8(.Lmprintf_zp_stk)
	stx	mos8(.Lmprintf_zp_stk+1)
	ldx	__rc2
	stx	mos8(.Lmprintf_zp_stk+2)
	ldx	__rc3
	stx	mos8(.Lmprintf_zp_stk+3)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldx	#mos16lo(.L.str.3.31)
	stx	__rc4
	ldx	#mos16hi(.L.str.3.31)
	stx	__rc5
	ldx	#52
	stx	__rc6
	ldx	#3
	stx	__rc7
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
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB11_5:                               ;   in Loop: Header=BB11_8 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB11_7
; %bb.6:                                ;   in Loop: Header=BB11_8 Depth=1
	inc	__rc7
.LBB11_7:                               ;   in Loop: Header=BB11_8 Depth=1
	tax
	beq	.LBB11_12
.LBB11_8:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB11_10
; %bb.9:                                ;   in Loop: Header=BB11_8 Depth=1
	inc	__rc5
.LBB11_10:                              ;   in Loop: Header=BB11_8 Depth=1
	cmp	#192
	bcc	.LBB11_1
; %bb.11:                               ;   in Loop: Header=BB11_8 Depth=1
	eor	#128
	bra	.LBB11_5
.LBB11_12:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jsr	cputsxy
	stz	__rc4
	ldx	mos8(.Lmprintf_zp_stk+2)
	stx	__rc2
	ldx	mos8(.Lmprintf_zp_stk+3)
	stx	__rc3
	ldx	mos8(.Lmprintf_zp_stk+1)
	lda	mos8(.Lmprintf_zp_stk)
	jmp	csputdec
.Lfunc_end11:
	.size	mprintf, .Lfunc_end11-mprintf
                                        ; -- End function
	.section	.text.mcbox,"ax",@progbits
	.type	mcbox,@function                 ; -- Begin function mcbox
mcbox:                                  ; @mcbox
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
	sta	__rc21
	stx	__rc22
	ldx	__rc3
	sec
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	ldy	__rc2
	sty	__rc23
	lda	__rc2
	sbc	__rc21
	sta	__rc26
	stx	__rc25
	cpx	__rc22
	bcs	.LBB12_1
; %bb.17:
	jmp	.LBB12_3
.LBB12_1:
	ldx	__rc22
	stx	__rc20
.LBB12_2:                               ; =>This Inner Loop Header: Depth=1
	lda	mos8(g_curScreenW)
	ldx	__rc20
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	__rc21
	sta	__rc27
	txa
	adc	#0
	sta	__rc28
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
	lda	__rc27
	adc	#0
	tax
	lda	__rc28
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
	ldx	__rc28
	lda	__rc27
	jsr	lfill
	inc	__rc20
	ldx	__rc25
	cpx	__rc20
	bcc	.LBB12_3
; %bb.19:                               ;   in Loop: Header=BB12_2 Depth=1
	jmp	.LBB12_2
.LBB12_3:
	ldx	#112
	stx	__rc2
	ldx	__rc22
	lda	__rc21
	jsr	cputcxy
	ldx	#109
	stx	__rc2
	ldx	__rc25
	lda	__rc21
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
	ldx	__rc25
	lda	__rc23
	jsr	cputcxy
	ldx	__rc26
	stx	__rc24
	cpx	#2
	bcc	.LBB12_6
; %bb.4:
	ldy	__rc21
	iny
.LBB12_5:                               ; =>This Inner Loop Header: Depth=1
	ldx	#64
	stx	__rc2
	ldx	__rc22
	sty	__rc26
	tya
	jsr	cputcxy
	ldx	#64
	stx	__rc2
	ldx	__rc25
	lda	__rc26
	jsr	cputcxy
	ldy	__rc26
	iny
	cpy	__rc20
	bne	.LBB12_5
.LBB12_6:
	inc	__rc22
	ldx	__rc22
.LBB12_7:                               ; =>This Inner Loop Header: Depth=1
	ldy	#93
	sty	__rc2
	stx	__rc26
	lda	__rc21
	jsr	cputcxy
	ldx	#93
	stx	__rc2
	ldx	__rc26
	lda	__rc23
	jsr	cputcxy
	ldx	__rc26
	inx
	cpx	__rc25
	bne	.LBB12_7
; %bb.8:
	ldy	__rc25
	cpy	mos8(g_curScreenH)
	bcc	.LBB12_9
; %bb.21:
	jmp	.LBB12_16
.LBB12_9:
	ldx	mos8(g_curScreenW)
	stx	__rc2
	ldx	__rc23
	cpx	__rc2
	bcc	.LBB12_10
; %bb.23:
	jmp	.LBB12_16
.LBB12_10:
	stz	__rc3
	ldx	#0
	iny
	bne	.LBB12_12
; %bb.11:
	inx
.LBB12_12:
	stx	__rc26
	sty	__rc25
	tya
	jsr	__mulhi3
	stx	__rc2
	stz	__rc20
	clc
	adc	__rc21
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
	lda	__rc24
	sta	__rc5
	stx	__rc4
	stz	__rc6
	ldx	__rc7
	tya
	jsr	lfill
	inc	__rc23
	ldx	__rc22
	stx	__rc21
.LBB12_13:                              ; =>This Inner Loop Header: Depth=1
	lda	mos8(g_curScreenW)
	ldx	__rc21
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	__rc23
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
	ldx	__rc26
	bne	.LBB12_15
; %bb.14:                               ;   in Loop: Header=BB12_13 Depth=1
	ldx	__rc25
	cpx	__rc21
	bcs	.LBB12_13
	bra	.LBB12_16
.LBB12_15:                              ;   in Loop: Header=BB12_13 Depth=1
	cpx	#0
	bcs	.LBB12_13
.LBB12_16:
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
.Lfunc_end12:
	.size	mcbox, .Lfunc_end12-mcbox
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
	lda	#10
	ldy	#70
	ldx	#9
	sty	__rc2
	stx	__rc3
	ldx	#4
	jsr	mcbox
	ldx	#12
	stx	mos8(g_curX)
	ldx	#5
	stx	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB13_8
.LBB13_1:                               ;   in Loop: Header=BB13_8 Depth=1
	cmp	#96
	bcc	.LBB13_3
; %bb.2:                                ;   in Loop: Header=BB13_8 Depth=1
	clc
	adc	#160
	bra	.LBB13_5
.LBB13_3:                               ;   in Loop: Header=BB13_8 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB13_5
; %bb.4:                                ;   in Loop: Header=BB13_8 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB13_5:                               ;   in Loop: Header=BB13_8 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB13_7
; %bb.6:                                ;   in Loop: Header=BB13_8 Depth=1
	inc	__rc3
.LBB13_7:                               ;   in Loop: Header=BB13_8 Depth=1
	tax
	beq	.LBB13_12
.LBB13_8:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB13_10
; %bb.9:                                ;   in Loop: Header=BB13_8 Depth=1
	inc	__rc23
.LBB13_10:                              ;   in Loop: Header=BB13_8 Depth=1
	cmp	#192
	bcc	.LBB13_1
; %bb.11:                               ;   in Loop: Header=BB13_8 Depth=1
	eor	#128
	bra	.LBB13_5
.LBB13_12:
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
.Lfunc_end13:
	.size	messagebox, .Lfunc_end13-messagebox
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end14:
	.size	escNOP, .Lfunc_end14-escNOP
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
.Lfunc_end15:
	.size	clrscr, .Lfunc_end15-clrscr
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
	bne	.LBB16_2
; %bb.1:
	dec	__rc20
.LBB16_2:
	lda	__rc20
	bne	.LBB16_5
; %bb.3:
	ldy	__rc23
	cpx	__rc22
	bne	.LBB16_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB16_7
.LBB16_5:
	ldy	__rc23
.LBB16_6:
	ldx	__rc22
	inx
.LBB16_7:
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
.Lfunc_end16:
	.size	cputcxy, .Lfunc_end16-cputcxy
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
.Lfunc_end17:
	.size	cputsxy, .Lfunc_end17-cputsxy
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
.Lfunc_end18:
	.size	lcopy, .Lfunc_end18-lcopy
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
.Lfunc_end19:
	.size	lfill, .Lfunc_end19-lfill
                                        ; -- End function
	.section	.text.strcpy,"ax",@progbits
	.type	strcpy,@function                ; -- Begin function strcpy
strcpy:                                 ; @strcpy
; %bb.0:
	lda	(__rc4)
	sta	(__rc2)
	lda	(__rc4)
	beq	.LBB20_7
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
.LBB20_2:                               ; =>This Inner Loop Header: Depth=1
	inc	__rc8
	bne	.LBB20_4
; %bb.3:                                ;   in Loop: Header=BB20_2 Depth=1
	inc	__rc9
.LBB20_4:                               ;   in Loop: Header=BB20_2 Depth=1
	lda	(__rc4),y
	sta	(__rc6),y
	lda	(__rc4),y
	inc	__rc6
	bne	.LBB20_6
; %bb.5:                                ;   in Loop: Header=BB20_2 Depth=1
	inc	__rc7
.LBB20_6:                               ;   in Loop: Header=BB20_2 Depth=1
	ldx	__rc8
	stx	__rc4
	ldx	__rc9
	stx	__rc5
	tax
	bne	.LBB20_2
.LBB20_7:
	rts
.Lfunc_end20:
	.size	strcpy, .Lfunc_end20-strcpy
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB21_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB21_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB21_4
; %bb.3:                                ;   in Loop: Header=BB21_2 Depth=1
	inx
.LBB21_4:                               ;   in Loop: Header=BB21_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB21_2
	bra	.LBB21_6
.LBB21_5:
	stz	__rc4
	ldx	#0
.LBB21_6:
	lda	__rc4
	rts
.Lfunc_end21:
	.size	strlen, .Lfunc_end21-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB22_2
.LBB22_1:                               ;   in Loop: Header=BB22_2 Depth=1
	dex
	asl
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB22_1
; %bb.3:
	rts
.Lfunc_end22:
	.size	__ashlqi3, .Lfunc_end22-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB23_3
; %bb.1:
	ldx	__rc2
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB23_2
.LBB23_3:
	ldx	__rc3
	rts
.Lfunc_end23:
	.size	__ashlhi3, .Lfunc_end23-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB24_3
; %bb.1:
	ldx	__rc4
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB24_2
.LBB24_3:
	ldx	__rc5
	rts
.Lfunc_end24:
	.size	__ashlsi3, .Lfunc_end24-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB25_3
; %bb.1:
	ldx	__rc8
.LBB25_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB25_2
.LBB25_3:
	ldx	__rc9
	rts
.Lfunc_end25:
	.size	__ashldi3, .Lfunc_end25-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB26_2
.LBB26_1:                               ;   in Loop: Header=BB26_2 Depth=1
	dex
	lsr
.LBB26_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB26_1
; %bb.3:
	rts
.Lfunc_end26:
	.size	__lshrqi3, .Lfunc_end26-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB27_3
; %bb.1:
	ldx	__rc2
.LBB27_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB27_2
.LBB27_3:
	ldx	__rc3
	rts
.Lfunc_end27:
	.size	__lshrhi3, .Lfunc_end27-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB28_3
; %bb.1:
	ldx	__rc4
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB28_2
.LBB28_3:
	ldx	__rc5
	rts
.Lfunc_end28:
	.size	__lshrsi3, .Lfunc_end28-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB29_3
; %bb.1:
	ldx	__rc8
.LBB29_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB29_2
.LBB29_3:
	ldx	__rc9
	rts
.Lfunc_end29:
	.size	__lshrdi3, .Lfunc_end29-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB30_2
.LBB30_1:                               ;   in Loop: Header=BB30_2 Depth=1
	dex
	cmp	#128
	ror
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB30_1
; %bb.3:
	rts
.Lfunc_end30:
	.size	__ashrqi3, .Lfunc_end30-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
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
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB31_2
.LBB31_3:
	tax
	lda	__rc3
	rts
.Lfunc_end31:
	.size	__ashrhi3, .Lfunc_end31-__ashrhi3
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
	beq	.LBB32_3
; %bb.1:
	ldx	__rc4
.LBB32_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB32_2
.LBB32_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end32:
	.size	__ashrsi3, .Lfunc_end32-__ashrsi3
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
	beq	.LBB33_3
; %bb.1:
	ldx	__rc8
.LBB33_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB33_2
.LBB33_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end33:
	.size	__ashrdi3, .Lfunc_end33-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB34_2
.LBB34_1:                               ;   in Loop: Header=BB34_2 Depth=1
	dex
	cmp	#128
	rol
.LBB34_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB34_1
; %bb.3:
	rts
.Lfunc_end34:
	.size	__rotlqi3, .Lfunc_end34-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB35_3
; %bb.1:
	ldx	__rc2
.LBB35_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB35_2
.LBB35_3:
	tax
	lda	__rc3
	rts
.Lfunc_end35:
	.size	__rotlhi3, .Lfunc_end35-__rotlhi3
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
	beq	.LBB36_3
; %bb.1:
	ldx	__rc4
.LBB36_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB36_2
.LBB36_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end36:
	.size	__rotlsi3, .Lfunc_end36-__rotlsi3
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
	beq	.LBB37_3
; %bb.1:
	ldx	__rc8
.LBB37_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB37_2
.LBB37_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end37:
	.size	__rotldi3, .Lfunc_end37-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB38_2
.LBB38_1:                               ;   in Loop: Header=BB38_2 Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror
.LBB38_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB38_1
; %bb.3:
	rts
.Lfunc_end38:
	.size	__rotrqi3, .Lfunc_end38-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB39_3
; %bb.1:
	ldx	__rc2
.LBB39_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB39_2
.LBB39_3:
	ldx	__rc3
	rts
.Lfunc_end39:
	.size	__rotrhi3, .Lfunc_end39-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB40_3
; %bb.1:
	ldx	__rc4
.LBB40_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	lsr	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB40_2
.LBB40_3:
	ldx	__rc5
	rts
.Lfunc_end40:
	.size	__rotrsi3, .Lfunc_end40-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB41_3
; %bb.1:
	ldx	__rc8
.LBB41_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB41_2
.LBB41_3:
	ldx	__rc9
	rts
.Lfunc_end41:
	.size	__rotrdi3, .Lfunc_end41-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB42_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB42_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB42_4
; %bb.3:                                ;   in Loop: Header=BB42_2 Depth=1
	clc
	adc	__rc2
.LBB42_4:                               ;   in Loop: Header=BB42_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB42_2
; %bb.5:
	rts
.LBB42_6:
	lda	#0
	rts
.Lfunc_end42:
	.size	__mulqi3, .Lfunc_end42-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB43_2
; %bb.1:
	ldy	__rc2
	beq	.LBB43_7
.LBB43_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB43_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB43_5
; %bb.4:                                ;   in Loop: Header=BB43_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB43_5:                               ;   in Loop: Header=BB43_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB43_3
; %bb.6:                                ;   in Loop: Header=BB43_3 Depth=1
	ldx	__rc2
	bne	.LBB43_3
	bra	.LBB43_8
.LBB43_7:
	ldy	#0
	tya
.LBB43_8:
	tax
	tya
	rts
.Lfunc_end43:
	.size	__mulhi3, .Lfunc_end43-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
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
	bne	.LBB44_4
; %bb.13:
	jmp	.LBB44_12
.LBB44_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB44_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB44_7
; %bb.6:                                ;   in Loop: Header=BB44_5 Depth=1
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
.LBB44_7:                               ;   in Loop: Header=BB44_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB44_5
; %bb.8:                                ;   in Loop: Header=BB44_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB44_5
; %bb.9:                                ;   in Loop: Header=BB44_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB44_5
; %bb.10:                               ;   in Loop: Header=BB44_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB44_5
.LBB44_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB44_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB44_11
.Lfunc_end44:
	.size	__mulsi3, .Lfunc_end44-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB45_8
; %bb.1:
	ldy	__rc14
	bne	.LBB45_8
; %bb.2:
	ldy	__rc13
	bne	.LBB45_8
; %bb.3:
	ldy	__rc12
	bne	.LBB45_8
; %bb.4:
	ldy	__rc11
	bne	.LBB45_8
; %bb.5:
	ldy	__rc10
	bne	.LBB45_8
; %bb.6:
	ldy	__rc9
	bne	.LBB45_8
; %bb.7:
	ldy	__rc8
	bne	.LBB45_8
; %bb.21:
	jmp	.LBB45_20
.LBB45_8:
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
.LBB45_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB45_11
; %bb.10:                               ;   in Loop: Header=BB45_9 Depth=1
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
.LBB45_11:                              ;   in Loop: Header=BB45_9 Depth=1
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
	beq	.LBB45_12
; %bb.23:                               ;   in Loop: Header=BB45_9 Depth=1
	jmp	.LBB45_9
.LBB45_12:                              ;   in Loop: Header=BB45_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB45_13
; %bb.25:                               ;   in Loop: Header=BB45_9 Depth=1
	jmp	.LBB45_9
.LBB45_13:                              ;   in Loop: Header=BB45_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB45_14
; %bb.27:                               ;   in Loop: Header=BB45_9 Depth=1
	jmp	.LBB45_9
.LBB45_14:                              ;   in Loop: Header=BB45_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB45_15
; %bb.29:                               ;   in Loop: Header=BB45_9 Depth=1
	jmp	.LBB45_9
.LBB45_15:                              ;   in Loop: Header=BB45_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB45_16
; %bb.31:                               ;   in Loop: Header=BB45_9 Depth=1
	jmp	.LBB45_9
.LBB45_16:                              ;   in Loop: Header=BB45_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB45_17
; %bb.33:                               ;   in Loop: Header=BB45_9 Depth=1
	jmp	.LBB45_9
.LBB45_17:                              ;   in Loop: Header=BB45_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB45_18
; %bb.35:                               ;   in Loop: Header=BB45_9 Depth=1
	jmp	.LBB45_9
.LBB45_18:                              ;   in Loop: Header=BB45_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB45_19
; %bb.37:                               ;   in Loop: Header=BB45_9 Depth=1
	jmp	.LBB45_9
.LBB45_19:
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
.LBB45_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB45_19
.Lfunc_end45:
	.size	__muldi3, .Lfunc_end45-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB46_1
; %bb.15:
	jmp	.LBB46_14
.LBB46_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB46_2
; %bb.17:
	jmp	.LBB46_14
.LBB46_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB46_3
; %bb.19:
	jmp	.LBB46_14
.LBB46_3:
	sty	__rc5
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
	lda	__rc5
	cmp	__rc2
	lda	#1
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
	cpx	#0
	beq	.LBB46_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB46_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB46_13
; %bb.12:                               ;   in Loop: Header=BB46_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB46_13:                              ;   in Loop: Header=BB46_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB46_11
.LBB46_14:
	rts
.Lfunc_end46:
	.size	__udivqi3, .Lfunc_end46-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB47_2
; %bb.1:
	ldy	__rc2
	beq	.LBB47_4
.LBB47_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB47_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB47_6
.LBB47_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB47_22
.LBB47_5:
	cmp	__rc3
	bcc	.LBB47_4
.LBB47_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB47_7
; %bb.25:
	jmp	.LBB47_22
.LBB47_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB47_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB47_10
; %bb.9:                                ;   in Loop: Header=BB47_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB47_12
	bra	.LBB47_11
.LBB47_10:                              ;   in Loop: Header=BB47_8 Depth=1
	cmp	__rc6
	bcc	.LBB47_12
.LBB47_11:                              ;   in Loop: Header=BB47_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB47_8
	bra	.LBB47_13
.LBB47_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB47_13:
	cpx	#0
	bne	.LBB47_14
; %bb.27:
	jmp	.LBB47_22
.LBB47_14:
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
.LBB47_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB47_17
; %bb.16:                               ;   in Loop: Header=BB47_15 Depth=1
	ldy	#0
.LBB47_17:                              ;   in Loop: Header=BB47_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB47_21
; %bb.18:                               ;   in Loop: Header=BB47_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB47_20
.LBB47_19:                              ;   in Loop: Header=BB47_15 Depth=1
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
.LBB47_20:                              ;   in Loop: Header=BB47_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB47_15
	bra	.LBB47_22
.LBB47_21:                              ;   in Loop: Header=BB47_15 Depth=1
	cmp	__rc6
	bcs	.LBB47_19
	bra	.LBB47_20
.LBB47_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end47:
	.size	__udivhi3, .Lfunc_end47-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
	ldy	__rc7
	bne	.LBB48_4
; %bb.1:
	ldy	__rc6
	bne	.LBB48_4
; %bb.2:
	ldy	__rc5
	bne	.LBB48_4
; %bb.3:
	ldy	__rc4
	beq	.LBB48_9
.LBB48_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB48_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB48_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB48_7
; %bb.45:
	jmp	.LBB48_38
.LBB48_7:
	cmp	__rc4
	bcc	.LBB48_9
	bra	.LBB48_11
.LBB48_8:
	cpx	__rc7
	bcs	.LBB48_11
.LBB48_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB48_21
.LBB48_10:
	cpx	__rc6
	bcc	.LBB48_9
.LBB48_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB48_12
; %bb.47:
	jmp	.LBB48_21
.LBB48_12:
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
.LBB48_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB48_17
; %bb.14:                               ;   in Loop: Header=BB48_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB48_18
; %bb.15:                               ;   in Loop: Header=BB48_13 Depth=1
	cmp	__rc10
	bne	.LBB48_19
; %bb.16:                               ;   in Loop: Header=BB48_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB48_23
	bra	.LBB48_20
.LBB48_17:                              ;   in Loop: Header=BB48_13 Depth=1
	cpy	__rc12
	bcc	.LBB48_23
	bra	.LBB48_20
.LBB48_18:                              ;   in Loop: Header=BB48_13 Depth=1
	cpy	__rc11
	bcc	.LBB48_23
	bra	.LBB48_20
.LBB48_19:                              ;   in Loop: Header=BB48_13 Depth=1
	cmp	__rc10
	bcc	.LBB48_23
.LBB48_20:                              ;   in Loop: Header=BB48_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB48_13
	bra	.LBB48_24
.LBB48_21:
	stz	__rc2
	stz	__rc3
.LBB48_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB48_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB48_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB48_22
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
.LBB48_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB48_28
; %bb.27:                               ;   in Loop: Header=BB48_26 Depth=1
	ldy	#0
.LBB48_28:                              ;   in Loop: Header=BB48_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB48_32
; %bb.29:                               ;   in Loop: Header=BB48_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB48_34
; %bb.30:                               ;   in Loop: Header=BB48_26 Depth=1
	cmp	__rc10
	bne	.LBB48_37
; %bb.31:                               ;   in Loop: Header=BB48_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB48_33
	bra	.LBB48_35
.LBB48_32:                              ;   in Loop: Header=BB48_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB48_35
.LBB48_33:                              ;   in Loop: Header=BB48_26 Depth=1
	lda	__rc6
	bra	.LBB48_36
.LBB48_34:                              ;   in Loop: Header=BB48_26 Depth=1
	cpy	__rc11
	bcc	.LBB48_33
.LBB48_35:                              ;   in Loop: Header=BB48_26 Depth=1
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
.LBB48_36:                              ;   in Loop: Header=BB48_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB48_41
; %bb.49:                               ;   in Loop: Header=BB48_26 Depth=1
	jmp	.LBB48_26
.LBB48_41:
	jmp	.LBB48_22
.LBB48_37:                              ;   in Loop: Header=BB48_26 Depth=1
	cmp	__rc10
	bcc	.LBB48_33
	bra	.LBB48_35
.LBB48_38:
	cpx	__rc5
	bcs	.LBB48_43
; %bb.51:
	jmp	.LBB48_9
.LBB48_43:
	jmp	.LBB48_11
.Lfunc_end48:
	.size	__udivsi3, .Lfunc_end48-__udivsi3
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
	beq	.LBB49_17
.LBB49_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB49_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB49_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB49_11
; %bb.90:
	jmp	.LBB49_31
.LBB49_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB49_12
; %bb.92:
	jmp	.LBB49_32
.LBB49_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB49_13
; %bb.94:
	jmp	.LBB49_38
.LBB49_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB49_14
; %bb.96:
	jmp	.LBB49_40
.LBB49_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB49_15
; %bb.98:
	jmp	.LBB49_42
.LBB49_15:
	cmp	__rc8
	bcc	.LBB49_17
	bra	.LBB49_19
.LBB49_16:
	cpx	__rc15
	bcs	.LBB49_19
.LBB49_17:
	lda	#0
; %bb.66:
	jmp	.LBB49_29
.LBB49_18:
	cpx	__rc14
	bcc	.LBB49_17
.LBB49_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB49_20
; %bb.100:
	jmp	.LBB49_29
.LBB49_20:
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
.LBB49_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB49_25
; %bb.22:                               ;   in Loop: Header=BB49_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB49_26
; %bb.23:                               ;   in Loop: Header=BB49_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB49_27
; %bb.24:                               ;   in Loop: Header=BB49_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB49_102
; %bb.150:                              ;   in Loop: Header=BB49_21 Depth=1
	jmp	.LBB49_33
.LBB49_102:                             ;   in Loop: Header=BB49_21 Depth=1
	jmp	.LBB49_37
.LBB49_25:                              ;   in Loop: Header=BB49_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB49_28
; %bb.104:
	jmp	.LBB49_44
.LBB49_26:                              ;   in Loop: Header=BB49_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB49_28
; %bb.106:
	jmp	.LBB49_44
.LBB49_27:                              ;   in Loop: Header=BB49_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB49_28
; %bb.108:
	jmp	.LBB49_44
.LBB49_28:                              ;   in Loop: Header=BB49_21 Depth=1
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
	bmi	.LBB49_68
; %bb.110:                              ;   in Loop: Header=BB49_21 Depth=1
	jmp	.LBB49_21
.LBB49_68:
	jmp	.LBB49_45
.LBB49_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB49_30:
	ldx	__rc18
	rts
.LBB49_31:
	cpx	__rc13
	bcs	.LBB49_70
; %bb.112:
	jmp	.LBB49_17
.LBB49_70:
	jmp	.LBB49_19
.LBB49_32:
	cpx	__rc12
	bcs	.LBB49_72
; %bb.114:
	jmp	.LBB49_17
.LBB49_72:
	jmp	.LBB49_19
.LBB49_33:                              ;   in Loop: Header=BB49_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB49_39
; %bb.34:                               ;   in Loop: Header=BB49_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB49_41
; %bb.35:                               ;   in Loop: Header=BB49_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB49_43
; %bb.36:                               ;   in Loop: Header=BB49_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB49_44
; %bb.74:                               ;   in Loop: Header=BB49_21 Depth=1
	jmp	.LBB49_28
.LBB49_37:                              ;   in Loop: Header=BB49_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB49_44
; %bb.76:                               ;   in Loop: Header=BB49_21 Depth=1
	jmp	.LBB49_28
.LBB49_38:
	cpx	__rc11
	bcs	.LBB49_78
; %bb.116:
	jmp	.LBB49_17
.LBB49_78:
	jmp	.LBB49_19
.LBB49_39:                              ;   in Loop: Header=BB49_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB49_44
; %bb.80:                               ;   in Loop: Header=BB49_21 Depth=1
	jmp	.LBB49_28
.LBB49_40:
	cpx	__rc10
	bcs	.LBB49_82
; %bb.118:
	jmp	.LBB49_17
.LBB49_82:
	jmp	.LBB49_19
.LBB49_41:                              ;   in Loop: Header=BB49_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB49_44
; %bb.84:                               ;   in Loop: Header=BB49_21 Depth=1
	jmp	.LBB49_28
.LBB49_42:
	cpx	__rc9
	bcs	.LBB49_86
; %bb.120:
	jmp	.LBB49_17
.LBB49_86:
	jmp	.LBB49_19
.LBB49_43:                              ;   in Loop: Header=BB49_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB49_44
; %bb.122:                              ;   in Loop: Header=BB49_21 Depth=1
	jmp	.LBB49_28
.LBB49_44:
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
.LBB49_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB49_46
; %bb.124:
	jmp	.LBB49_30
.LBB49_46:
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
.LBB49_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB49_49
; %bb.48:                               ;   in Loop: Header=BB49_47 Depth=1
	ldy	#0
.LBB49_49:                              ;   in Loop: Header=BB49_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB49_57
; %bb.50:                               ;   in Loop: Header=BB49_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB49_51
; %bb.126:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_60
.LBB49_51:                              ;   in Loop: Header=BB49_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB49_52
; %bb.128:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_61
.LBB49_52:                              ;   in Loop: Header=BB49_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB49_53
; %bb.130:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_62
.LBB49_53:                              ;   in Loop: Header=BB49_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB49_54
; %bb.132:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_63
.LBB49_54:                              ;   in Loop: Header=BB49_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB49_55
; %bb.134:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_64
.LBB49_55:                              ;   in Loop: Header=BB49_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB49_56
; %bb.136:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_65
.LBB49_56:                              ;   in Loop: Header=BB49_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB49_58
	bra	.LBB49_59
.LBB49_57:                              ;   in Loop: Header=BB49_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB49_59
.LBB49_58:                              ;   in Loop: Header=BB49_47 Depth=1
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
.LBB49_59:                              ;   in Loop: Header=BB49_47 Depth=1
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
	beq	.LBB49_88
; %bb.138:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_47
.LBB49_88:
	jmp	.LBB49_30
.LBB49_60:                              ;   in Loop: Header=BB49_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB49_58
	bra	.LBB49_59
.LBB49_61:                              ;   in Loop: Header=BB49_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB49_59
; %bb.140:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_58
.LBB49_62:                              ;   in Loop: Header=BB49_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB49_59
; %bb.142:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_58
.LBB49_63:                              ;   in Loop: Header=BB49_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB49_59
; %bb.144:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_58
.LBB49_64:                              ;   in Loop: Header=BB49_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB49_59
; %bb.146:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_58
.LBB49_65:                              ;   in Loop: Header=BB49_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB49_59
; %bb.148:                              ;   in Loop: Header=BB49_47 Depth=1
	jmp	.LBB49_58
.Lfunc_end49:
	.size	__udivdi3, .Lfunc_end49-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB50_1
; %bb.15:
	jmp	.LBB50_13
.LBB50_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB50_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB50_14
; %bb.3:
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB50_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB50_6
; %bb.5:                                ;   in Loop: Header=BB50_4 Depth=1
	cmp	__rc2
	bcc	.LBB50_8
	bra	.LBB50_7
.LBB50_6:                               ;   in Loop: Header=BB50_4 Depth=1
	cpy	__rc4
	bcc	.LBB50_8
.LBB50_7:                               ;   in Loop: Header=BB50_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB50_4
	bra	.LBB50_9
.LBB50_8:
	ldy	__rc3
	sty	__rc2
.LBB50_9:
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB50_13
.LBB50_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB50_12
; %bb.11:                               ;   in Loop: Header=BB50_10 Depth=1
	sec
	sbc	__rc2
.LBB50_12:                              ;   in Loop: Header=BB50_10 Depth=1
	dex
	bne	.LBB50_10
.LBB50_13:
	rts
.LBB50_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end50:
	.size	__umodqi3, .Lfunc_end50-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB51_2
; %bb.1:
	ldx	__rc2
	bne	.LBB51_2
; %bb.22:
	jmp	.LBB51_19
.LBB51_2:
	cmp	__rc3
	bne	.LBB51_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB51_5
; %bb.20:
	jmp	.LBB51_19
.LBB51_4:
	cmp	__rc3
	bcs	.LBB51_5
; %bb.24:
	jmp	.LBB51_19
.LBB51_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB51_6
; %bb.26:
	jmp	.LBB51_18
.LBB51_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB51_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB51_9
; %bb.8:                                ;   in Loop: Header=BB51_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB51_11
	bra	.LBB51_10
.LBB51_9:                               ;   in Loop: Header=BB51_7 Depth=1
	cmp	__rc5
	bcc	.LBB51_11
.LBB51_10:                              ;   in Loop: Header=BB51_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB51_7
	bra	.LBB51_12
.LBB51_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB51_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB51_19
.LBB51_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB51_17
; %bb.14:                               ;   in Loop: Header=BB51_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB51_16
.LBB51_15:                              ;   in Loop: Header=BB51_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB51_16:                              ;   in Loop: Header=BB51_13 Depth=1
	dex
	bne	.LBB51_13
	bra	.LBB51_19
.LBB51_17:                              ;   in Loop: Header=BB51_13 Depth=1
	cmp	__rc5
	bcs	.LBB51_15
	bra	.LBB51_16
.LBB51_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB51_19:
	tax
	tya
	rts
.Lfunc_end51:
	.size	__umodhi3, .Lfunc_end51-__umodhi3
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
	bne	.LBB52_4
; %bb.1:
	ldx	__rc6
	bne	.LBB52_4
; %bb.2:
	ldx	__rc5
	bne	.LBB52_4
; %bb.3:
	ldx	__rc4
	bne	.LBB52_4
; %bb.42:
	jmp	.LBB52_35
.LBB52_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB52_8
; %bb.5:
	cmp	__rc6
	bne	.LBB52_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB52_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB52_11
; %bb.36:
	jmp	.LBB52_35
.LBB52_8:
	cpx	__rc7
	bcs	.LBB52_11
; %bb.38:
	jmp	.LBB52_35
.LBB52_9:
	cmp	__rc6
	bcs	.LBB52_11
; %bb.40:
	jmp	.LBB52_35
.LBB52_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB52_11
; %bb.44:
	jmp	.LBB52_35
.LBB52_11:
	ldx	__rc7
	bpl	.LBB52_12
; %bb.46:
	jmp	.LBB52_33
.LBB52_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB52_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB52_17
; %bb.14:                               ;   in Loop: Header=BB52_13 Depth=1
	cmp	__rc8
	bne	.LBB52_18
; %bb.15:                               ;   in Loop: Header=BB52_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB52_19
; %bb.16:                               ;   in Loop: Header=BB52_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB52_21
	bra	.LBB52_20
.LBB52_17:                              ;   in Loop: Header=BB52_13 Depth=1
	cpy	__rc9
	bcc	.LBB52_21
	bra	.LBB52_20
.LBB52_18:                              ;   in Loop: Header=BB52_13 Depth=1
	cmp	__rc8
	bcc	.LBB52_21
	bra	.LBB52_20
.LBB52_19:                              ;   in Loop: Header=BB52_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB52_21
.LBB52_20:                              ;   in Loop: Header=BB52_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB52_13
	bra	.LBB52_22
.LBB52_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB52_22:
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
	bne	.LBB52_23
; %bb.48:
	jmp	.LBB52_34
.LBB52_23:
	tya
.LBB52_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB52_28
; %bb.25:                               ;   in Loop: Header=BB52_24 Depth=1
	cmp	__rc8
	bne	.LBB52_31
; %bb.26:                               ;   in Loop: Header=BB52_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB52_32
; %bb.27:                               ;   in Loop: Header=BB52_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB52_29
	bra	.LBB52_30
.LBB52_28:                              ;   in Loop: Header=BB52_24 Depth=1
	cpy	__rc9
	bcc	.LBB52_30
.LBB52_29:                              ;   in Loop: Header=BB52_24 Depth=1
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
.LBB52_30:                              ;   in Loop: Header=BB52_24 Depth=1
	dex
	bne	.LBB52_24
	bra	.LBB52_35
.LBB52_31:                              ;   in Loop: Header=BB52_24 Depth=1
	cmp	__rc8
	bcs	.LBB52_29
	bra	.LBB52_30
.LBB52_32:                              ;   in Loop: Header=BB52_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB52_29
	bra	.LBB52_30
.LBB52_33:
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
	bra	.LBB52_35
.LBB52_34:
	tya
.LBB52_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end52:
	.size	__umodsi3, .Lfunc_end52-__umodsi3
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
	bne	.LBB53_8
; %bb.1:
	ldx	__rc14
	bne	.LBB53_8
; %bb.2:
	ldx	__rc13
	bne	.LBB53_8
; %bb.3:
	ldx	__rc12
	bne	.LBB53_8
; %bb.4:
	ldx	__rc11
	bne	.LBB53_8
; %bb.5:
	ldx	__rc10
	bne	.LBB53_8
; %bb.6:
	ldx	__rc9
	bne	.LBB53_8
; %bb.7:
	ldx	__rc8
	bne	.LBB53_8
; %bb.90:
	jmp	.LBB53_61
.LBB53_8:
	cmp	__rc15
	bne	.LBB53_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB53_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB53_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB53_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB53_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB53_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB53_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB53_23
; %bb.62:
	jmp	.LBB53_61
.LBB53_16:
	cmp	__rc15
	bcs	.LBB53_23
; %bb.64:
	jmp	.LBB53_61
.LBB53_17:
	cpx	__rc14
	bcs	.LBB53_23
; %bb.66:
	jmp	.LBB53_61
.LBB53_18:
	cpx	__rc13
	bcs	.LBB53_23
; %bb.68:
	jmp	.LBB53_61
.LBB53_19:
	cpx	__rc12
	bcs	.LBB53_23
; %bb.70:
	jmp	.LBB53_61
.LBB53_20:
	cpx	__rc11
	bcs	.LBB53_23
; %bb.72:
	jmp	.LBB53_61
.LBB53_21:
	cpx	__rc10
	bcs	.LBB53_23
; %bb.74:
	jmp	.LBB53_61
.LBB53_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB53_23
; %bb.92:
	jmp	.LBB53_61
.LBB53_23:
	ldx	__rc15
	bpl	.LBB53_24
; %bb.94:
	jmp	.LBB53_33
.LBB53_24:
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
.LBB53_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB53_29
; %bb.26:                               ;   in Loop: Header=BB53_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB53_30
; %bb.27:                               ;   in Loop: Header=BB53_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB53_31
; %bb.28:                               ;   in Loop: Header=BB53_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB53_76
; %bb.96:                               ;   in Loop: Header=BB53_25 Depth=1
	jmp	.LBB53_38
.LBB53_76:                              ;   in Loop: Header=BB53_25 Depth=1
	jmp	.LBB53_34
.LBB53_29:                              ;   in Loop: Header=BB53_25 Depth=1
	cmp	__rc19
	bcs	.LBB53_32
; %bb.98:
	jmp	.LBB53_42
.LBB53_30:                              ;   in Loop: Header=BB53_25 Depth=1
	cpy	__rc18
	bcs	.LBB53_32
; %bb.100:
	jmp	.LBB53_42
.LBB53_31:                              ;   in Loop: Header=BB53_25 Depth=1
	cpy	__rc7
	bcs	.LBB53_32
; %bb.102:
	jmp	.LBB53_42
.LBB53_32:                              ;   in Loop: Header=BB53_25 Depth=1
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
	bmi	.LBB53_78
; %bb.104:                              ;   in Loop: Header=BB53_25 Depth=1
	jmp	.LBB53_25
.LBB53_78:
	jmp	.LBB53_43
.LBB53_33:
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
	jmp	.LBB53_61
.LBB53_34:                              ;   in Loop: Header=BB53_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB53_39
; %bb.35:                               ;   in Loop: Header=BB53_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB53_40
; %bb.36:                               ;   in Loop: Header=BB53_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB53_41
; %bb.37:                               ;   in Loop: Header=BB53_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB53_42
; %bb.82:                               ;   in Loop: Header=BB53_25 Depth=1
	jmp	.LBB53_32
.LBB53_38:                              ;   in Loop: Header=BB53_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB53_42
; %bb.84:                               ;   in Loop: Header=BB53_25 Depth=1
	jmp	.LBB53_32
.LBB53_39:                              ;   in Loop: Header=BB53_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB53_42
; %bb.86:                               ;   in Loop: Header=BB53_25 Depth=1
	jmp	.LBB53_32
.LBB53_40:                              ;   in Loop: Header=BB53_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB53_42
; %bb.88:                               ;   in Loop: Header=BB53_25 Depth=1
	jmp	.LBB53_32
.LBB53_41:                              ;   in Loop: Header=BB53_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB53_42
; %bb.106:                              ;   in Loop: Header=BB53_25 Depth=1
	jmp	.LBB53_32
.LBB53_42:
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
.LBB53_43:
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
	bne	.LBB53_44
; %bb.108:
	jmp	.LBB53_61
.LBB53_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB53_52
; %bb.45:                               ;   in Loop: Header=BB53_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB53_46
; %bb.110:                              ;   in Loop: Header=BB53_44 Depth=1
	jmp	.LBB53_55
.LBB53_46:                              ;   in Loop: Header=BB53_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB53_47
; %bb.112:                              ;   in Loop: Header=BB53_44 Depth=1
	jmp	.LBB53_56
.LBB53_47:                              ;   in Loop: Header=BB53_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB53_48
; %bb.114:                              ;   in Loop: Header=BB53_44 Depth=1
	jmp	.LBB53_57
.LBB53_48:                              ;   in Loop: Header=BB53_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB53_49
; %bb.116:                              ;   in Loop: Header=BB53_44 Depth=1
	jmp	.LBB53_58
.LBB53_49:                              ;   in Loop: Header=BB53_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB53_50
; %bb.118:                              ;   in Loop: Header=BB53_44 Depth=1
	jmp	.LBB53_59
.LBB53_50:                              ;   in Loop: Header=BB53_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB53_51
; %bb.120:                              ;   in Loop: Header=BB53_44 Depth=1
	jmp	.LBB53_60
.LBB53_51:                              ;   in Loop: Header=BB53_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB53_53
	bra	.LBB53_54
.LBB53_52:                              ;   in Loop: Header=BB53_44 Depth=1
	cmp	__rc19
	bcc	.LBB53_54
.LBB53_53:                              ;   in Loop: Header=BB53_44 Depth=1
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
.LBB53_54:                              ;   in Loop: Header=BB53_44 Depth=1
	dex
	beq	.LBB53_61
; %bb.122:                              ;   in Loop: Header=BB53_44 Depth=1
	jmp	.LBB53_44
.LBB53_55:                              ;   in Loop: Header=BB53_44 Depth=1
	cpy	__rc18
	bcs	.LBB53_53
	bra	.LBB53_54
.LBB53_56:                              ;   in Loop: Header=BB53_44 Depth=1
	cpy	__rc7
	bcs	.LBB53_53
	bra	.LBB53_54
.LBB53_57:                              ;   in Loop: Header=BB53_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB53_53
	bra	.LBB53_54
.LBB53_58:                              ;   in Loop: Header=BB53_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB53_53
	bra	.LBB53_54
.LBB53_59:                              ;   in Loop: Header=BB53_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB53_53
	bra	.LBB53_54
.LBB53_60:                              ;   in Loop: Header=BB53_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB53_54
; %bb.124:                              ;   in Loop: Header=BB53_44 Depth=1
	jmp	.LBB53_53
.LBB53_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end53:
	.size	__umoddi3, .Lfunc_end53-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB54_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB54_2
; %bb.18:
	jmp	.LBB54_17
.LBB54_2:
	lda	__rc5
	bpl	.LBB54_3
; %bb.20:
	jmp	.LBB54_15
.LBB54_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB54_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB54_6
; %bb.5:                                ;   in Loop: Header=BB54_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB54_9
	bra	.LBB54_7
.LBB54_6:                               ;   in Loop: Header=BB54_4 Depth=1
	cpy	__rc6
	bcc	.LBB54_9
.LBB54_7:                               ;   in Loop: Header=BB54_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB54_4
	bra	.LBB54_10
.LBB54_8:
	sty	__rc7
	bra	.LBB54_17
.LBB54_9:
	ldy	__rc5
	sty	__rc4
.LBB54_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB54_16
; %bb.11:
	lda	#1
.LBB54_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB54_14
; %bb.13:                               ;   in Loop: Header=BB54_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB54_14:                              ;   in Loop: Header=BB54_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB54_12
	bra	.LBB54_17
.LBB54_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB54_16:
	lda	#1
.LBB54_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end54:
	.size	__udivmodqi4, .Lfunc_end54-__udivmodqi4
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
	bne	.LBB55_2
; %bb.1:
	ldx	__rc2
	beq	.LBB55_4
.LBB55_2:
	cmp	__rc3
	bne	.LBB55_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB55_6
.LBB55_4:
	ldx	#0
; %bb.26:
	jmp	.LBB55_24
.LBB55_5:
	cmp	__rc3
	bcc	.LBB55_4
.LBB55_6:
	tay
	ldx	__rc3
	bpl	.LBB55_7
; %bb.28:
	jmp	.LBB55_22
.LBB55_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB55_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB55_10
; %bb.9:                                ;   in Loop: Header=BB55_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB55_11
	bra	.LBB55_12
.LBB55_10:                              ;   in Loop: Header=BB55_8 Depth=1
	cmp	__rc8
	bcc	.LBB55_12
.LBB55_11:                              ;   in Loop: Header=BB55_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB55_8
	bra	.LBB55_13
.LBB55_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB55_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB55_14
; %bb.30:
	jmp	.LBB55_23
.LBB55_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB55_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB55_17
; %bb.16:                               ;   in Loop: Header=BB55_15 Depth=1
	ldy	#0
.LBB55_17:                              ;   in Loop: Header=BB55_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB55_21
; %bb.18:                               ;   in Loop: Header=BB55_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB55_20
.LBB55_19:                              ;   in Loop: Header=BB55_15 Depth=1
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
.LBB55_20:                              ;   in Loop: Header=BB55_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB55_15
	bra	.LBB55_25
.LBB55_21:                              ;   in Loop: Header=BB55_15 Depth=1
	cmp	__rc8
	bcs	.LBB55_19
	bra	.LBB55_20
.LBB55_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB55_23:
	ldx	#1
.LBB55_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB55_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end55:
	.size	__udivmodhi4, .Lfunc_end55-__udivmodhi4
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
	bpl	.LBB56_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB56_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB56_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB56_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB56_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB56_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB56_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB56_8:
	lda	__rc2
	rts
.Lfunc_end56:
	.size	__divqi3, .Lfunc_end56-__divqi3
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
	bmi	.LBB57_2
; %bb.1:
	bra	.LBB57_6
.LBB57_2:
	cpx	#128
	bne	.LBB57_5
; %bb.3:
	lda	__rc4
	bne	.LBB57_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB57_6
.LBB57_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB57_6:
	tya
	bmi	.LBB57_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB57_12
.LBB57_8:
	cpy	#128
	bne	.LBB57_11
; %bb.9:
	lda	__rc2
	bne	.LBB57_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB57_12
.LBB57_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB57_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB57_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB57_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end57:
	.size	__divhi3, .Lfunc_end57-__divhi3
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
	bmi	.LBB58_2
; %bb.1:
	ldy	__rc3
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
	ldy	#128
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
	sbc	mos8(.L__divsi3_zp_stk+1)
	tay
.LBB58_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB58_10
; %bb.9:
	lda	__rc7
	bra	.LBB58_16
.LBB58_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB58_15
; %bb.11:
	lda	__rc6
	bne	.LBB58_15
; %bb.12:
	lda	__rc5
	bne	.LBB58_15
; %bb.13:
	lda	__rc4
	bne	.LBB58_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB58_16
.LBB58_15:
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
.LBB58_16:
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
	bne	.LBB58_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB58_19
.LBB58_18:
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
.LBB58_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end58:
	.size	__divsi3, .Lfunc_end58-__divsi3
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
	bmi	.LBB59_2
; %bb.1:
	ldy	__rc7
; %bb.28:
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
	ldy	#128
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
	sbc	mos8(.L__divdi3_zp_stk+1)
	tay
.LBB59_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB59_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB59_24
.LBB59_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB59_23
; %bb.15:
	lda	__rc14
	bne	.LBB59_23
; %bb.16:
	lda	__rc13
	bne	.LBB59_23
; %bb.17:
	lda	__rc12
	bne	.LBB59_23
; %bb.18:
	lda	__rc11
	bne	.LBB59_23
; %bb.19:
	lda	__rc10
	bne	.LBB59_23
; %bb.20:
	lda	__rc9
	bne	.LBB59_23
; %bb.21:
	lda	__rc8
	bne	.LBB59_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB59_24
.LBB59_23:
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
.LBB59_24:
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
	bne	.LBB59_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB59_27
.LBB59_26:
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
.LBB59_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end59:
	.size	__divdi3, .Lfunc_end59-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB60_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB60_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB60_3:
	tay
	lda	__rc2
	bmi	.LBB60_5
; %bb.4:
	lda	__rc2
	bra	.LBB60_7
.LBB60_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB60_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB60_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB60_9
; %bb.8:
	rts
.LBB60_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end60:
	.size	__modqi3, .Lfunc_end60-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB61_2
; %bb.1:
	txa
	bra	.LBB61_6
.LBB61_2:
	cpx	#128
	bne	.LBB61_5
; %bb.3:
	lda	__rc4
	bne	.LBB61_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB61_6
.LBB61_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB61_6:
	ldx	__rc3
	bpl	.LBB61_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB61_10
; %bb.8:
	ldx	__rc2
	bne	.LBB61_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB61_11
.LBB61_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB61_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB61_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB61_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end61:
	.size	__modhi3, .Lfunc_end61-__modhi3
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
	bmi	.LBB62_2
; %bb.1:
	lda	__rc3
	bra	.LBB62_8
.LBB62_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB62_7
; %bb.3:
	lda	__rc2
	bne	.LBB62_7
; %bb.4:
	lda	__rc8
	bne	.LBB62_7
; %bb.5:
	lda	__rc9
	bne	.LBB62_7
; %bb.6:
	stz	__rc9
	lda	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB62_8
.LBB62_7:
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
.LBB62_8:
	ldx	__rc7
	bpl	.LBB62_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB62_14
; %bb.10:
	ldx	__rc6
	bne	.LBB62_14
; %bb.11:
	ldx	__rc5
	bne	.LBB62_14
; %bb.12:
	ldx	__rc4
	bne	.LBB62_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB62_15
.LBB62_14:
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
.LBB62_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB62_17
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
.LBB62_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end62:
	.size	__modsi3, .Lfunc_end62-__modsi3
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
	bmi	.LBB63_2
; %bb.1:
	lda	__rc7
; %bb.26:
	jmp	.LBB63_12
.LBB63_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB63_11
; %bb.3:
	lda	__rc6
	bne	.LBB63_11
; %bb.4:
	lda	__rc5
	bne	.LBB63_11
; %bb.5:
	lda	__rc4
	bne	.LBB63_11
; %bb.6:
	lda	__rc3
	bne	.LBB63_11
; %bb.7:
	lda	__rc2
	bne	.LBB63_11
; %bb.8:
	lda	__rc18
	bne	.LBB63_11
; %bb.9:
	lda	__rc19
	bne	.LBB63_11
; %bb.10:
	stz	__rc19
	lda	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB63_12
.LBB63_11:
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
.LBB63_12:
	ldx	__rc15
	bmi	.LBB63_13
; %bb.28:
	jmp	.LBB63_23
.LBB63_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB63_22
; %bb.14:
	ldx	__rc14
	bne	.LBB63_22
; %bb.15:
	ldx	__rc13
	bne	.LBB63_22
; %bb.16:
	ldx	__rc12
	bne	.LBB63_22
; %bb.17:
	ldx	__rc11
	bne	.LBB63_22
; %bb.18:
	ldx	__rc10
	bne	.LBB63_22
; %bb.19:
	ldx	__rc9
	bne	.LBB63_22
; %bb.20:
	ldx	__rc8
	bne	.LBB63_22
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
	bra	.LBB63_23
.LBB63_22:
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
.LBB63_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB63_25
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
.LBB63_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end63:
	.size	__moddi3, .Lfunc_end63-__moddi3
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
	bpl	.LBB64_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB64_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB64_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB64_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB64_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB64_11
.LBB64_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB64_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB64_8
; %bb.34:
	jmp	.LBB64_24
.LBB64_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB64_24
.LBB64_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB64_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB64_12
.LBB64_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB64_24
.LBB64_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB64_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB64_15
; %bb.14:                               ;   in Loop: Header=BB64_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB64_18
	bra	.LBB64_16
.LBB64_15:                              ;   in Loop: Header=BB64_13 Depth=1
	cmp	__rc7
	bcc	.LBB64_18
.LBB64_16:                              ;   in Loop: Header=BB64_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB64_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB64_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB64_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB64_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB64_22
; %bb.21:                               ;   in Loop: Header=BB64_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB64_22:                              ;   in Loop: Header=BB64_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB64_20
	bra	.LBB64_24
.LBB64_23:
	sta	__rc7
	sty	__rc6
.LBB64_24:
	lda	__rc4
	bmi	.LBB64_26
; %bb.25:
	lda	__rc7
	bra	.LBB64_27
.LBB64_26:
	lda	#0
	sec
	sbc	__rc7
.LBB64_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB64_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB64_29:
	lda	__rc6
	rts
.Lfunc_end64:
	.size	__divmodqi4, .Lfunc_end64-__divmodqi4
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
	bmi	.LBB65_2
.LBB65_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB65_6
.LBB65_2:
	cpx	#128
	bne	.LBB65_5
; %bb.3:
	lda	__rc7
	bne	.LBB65_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB65_1
.LBB65_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB65_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB65_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB65_15
; %bb.8:
	lda	__rc2
	bne	.LBB65_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB65_18
.LBB65_10:
	cpy	#128
	bne	.LBB65_14
; %bb.11:
	ldy	__rc2
	bne	.LBB65_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB65_13
; %bb.48:
	jmp	.LBB65_45
.LBB65_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB65_18
.LBB65_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB65_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB65_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB65_20
.LBB65_17:
	sta	__rc11
.LBB65_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB65_39
.LBB65_19:
	cmp	__rc7
	bcc	.LBB65_17
.LBB65_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB65_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB65_23
; %bb.22:                               ;   in Loop: Header=BB65_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB65_24
	bra	.LBB65_26
.LBB65_23:                              ;   in Loop: Header=BB65_21 Depth=1
	cmp	__rc9
	bcc	.LBB65_26
.LBB65_24:                              ;   in Loop: Header=BB65_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB65_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB65_27
.LBB65_26:
	tay
.LBB65_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB65_28
; %bb.50:
	jmp	.LBB65_37
.LBB65_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB65_32
.LBB65_29:                              ;   in Loop: Header=BB65_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB65_36
.LBB65_30:                              ;   in Loop: Header=BB65_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB65_31:                              ;   in Loop: Header=BB65_32 Depth=1
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
	beq	.LBB65_39
.LBB65_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB65_34
; %bb.33:                               ;   in Loop: Header=BB65_32 Depth=1
	ldy	#0
.LBB65_34:                              ;   in Loop: Header=BB65_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB65_29
; %bb.35:                               ;   in Loop: Header=BB65_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB65_30
.LBB65_36:                              ;   in Loop: Header=BB65_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB65_31
.LBB65_37:
	sta	__rc11
	ldx	#1
.LBB65_38:
	stx	__rc9
.LBB65_39:
	lda	__rc6
	bmi	.LBB65_41
; %bb.40:
	lda	__rc10
	bra	.LBB65_42
.LBB65_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB65_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB65_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB65_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB65_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB65_38
.Lfunc_end65:
	.size	__divmodhi4, .Lfunc_end65-__divmodhi4
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB66_2
; %bb.1:
	tya
	beq	.LBB66_11
.LBB66_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB66_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB66_5
; %bb.4:                                ;   in Loop: Header=BB66_3 Depth=1
	inc	__rc7
.LBB66_5:                               ;   in Loop: Header=BB66_3 Depth=1
	inc	__rc4
	bne	.LBB66_7
; %bb.6:                                ;   in Loop: Header=BB66_3 Depth=1
	inc	__rc5
.LBB66_7:                               ;   in Loop: Header=BB66_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB66_9
; %bb.8:                                ;   in Loop: Header=BB66_3 Depth=1
	dex
.LBB66_9:                               ;   in Loop: Header=BB66_3 Depth=1
	txa
	bne	.LBB66_3
; %bb.10:                               ;   in Loop: Header=BB66_3 Depth=1
	tya
	bne	.LBB66_3
.LBB66_11:
	rts
.Lfunc_end66:
	.size	memcpy, .Lfunc_end66-memcpy
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
.Lfunc_end67:
	.size	memset, .Lfunc_end67-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB68_4
.LBB68_1:                               ;   in Loop: Header=BB68_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB68_3
; %bb.2:                                ;   in Loop: Header=BB68_4 Depth=1
	inc	__rc3
.LBB68_3:                               ;   in Loop: Header=BB68_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB68_7
.LBB68_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB68_1
; %bb.5:                                ;   in Loop: Header=BB68_4 Depth=1
	cpx	#0
	bne	.LBB68_1
; %bb.6:
	rts
.LBB68_7:                               ;   in Loop: Header=BB68_4 Depth=1
	dec	__rc4
	jmp	.LBB68_4
.Lfunc_end68:
	.size	__memset, .Lfunc_end68-__memset
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
	beq	.LBB69_1
; %bb.15:
	jmp	.LBB69_13
.LBB69_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB69_2
; %bb.17:
	jmp	.LBB69_14
.LBB69_2:
	lda	__rc7
	bne	.LBB69_4
; %bb.3:
	lda	__rc6
	beq	.LBB69_12
.LBB69_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB69_6
; %bb.5:                                ;   in Loop: Header=BB69_4 Depth=1
	dec	__rc9
.LBB69_6:                               ;   in Loop: Header=BB69_4 Depth=1
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
	bne	.LBB69_8
; %bb.7:                                ;   in Loop: Header=BB69_4 Depth=1
	dec	__rc11
.LBB69_8:                               ;   in Loop: Header=BB69_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB69_10
; %bb.9:                                ;   in Loop: Header=BB69_4 Depth=1
	dex
.LBB69_10:                              ;   in Loop: Header=BB69_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB69_4
; %bb.11:                               ;   in Loop: Header=BB69_4 Depth=1
	tya
	bne	.LBB69_4
.LBB69_12:
	rts
.LBB69_13:
	cpx	__rc3
	bcs	.LBB69_14
; %bb.19:
	jmp	.LBB69_2
.LBB69_14:
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
.Lfunc_end69:
	.size	memmove, .Lfunc_end69-memmove
                                        ; -- End function
	.type	.L.str,@object                  ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"UPPERCASE lowercase."
	.size	.L.str, 21

	.type	.L.str.1,@object                ; @.str.1
.L.str.1:
	.asciz	"currently beta, does destroy .d81 and disks!"
	.size	.L.str.1, 45

	.type	.L.str.2,@object                ; @.str.2
.L.str.2:
	.asciz	"Press almost any key to continue."
	.size	.L.str.2, 34

	.type	.L.str.3,@object                ; @.str.3
.L.str.3:
	.asciz	"Have fun with your Mega65!"
	.size	.L.str.3, 27

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

	.type	workside,@object                ; @workside
	.section	.zp.bss.workside,"aw",@nobits
workside:
	.byte	0                               ; 0x0
	.size	workside, 1

	.type	.L.str.34,@object               ; @.str.34
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.34:
	.asciz	"number of sectors too big"
	.size	.L.str.34, 26

	.type	.L.str.36,@object               ; @.str.36
.L.str.36:
	.asciz	"directory entries exhausted"
	.size	.L.str.36, 28

	.type	.L.str.37,@object               ; @.str.37
.L.str.37:
	.asciz	"entry not found"
	.size	.L.str.37, 16

	.type	.Lswitch.table.gettype,@object  ; @switch.table.gettype
	.section	.zp.rodata..Lswitch.table.gettype,"a",@progbits
.Lswitch.table.gettype:
	.ascii	"SPURC"
	.size	.Lswitch.table.gettype, 5

	.type	.Lswitch.table.gettype.38,@object ; @switch.table.gettype.38
	.section	.zp.rodata..Lswitch.table.gettype.38,"a",@progbits
.Lswitch.table.gettype.38:
	.ascii	"ERSEB"
	.size	.Lswitch.table.gettype.38, 5

	.type	.Lswitch.table.gettype.39,@object ; @switch.table.gettype.39
	.section	.zp.rodata..Lswitch.table.gettype.39,"a",@progbits
.Lswitch.table.gettype.39:
	.ascii	"QGRLM"
	.size	.Lswitch.table.gettype.39, 5

	.type	filelist,@object                ; @filelist
	.section	.bss.filelist,"aw",@nobits
filelist:
	.zero	1170
	.size	filelist, 1170

	.type	s,@object                       ; @s
	.section	.bss.s,"aw",@nobits
s:
	.zero	40
	.size	s, 40

	.type	midnight,@object                ; @midnight
	.section	.zp.rodata.cst4,"aM",@progbits,4
midnight:
	.short	7424
	.short	7680
	.size	midnight, 4

	.type	.L.str.1.29,@object             ; @.str.1.29
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1.29:
	.asciz	" Choose disk image file: "
	.size	.L.str.1.29, 26

	.type	.L.str.2.30,@object             ; @.str.2.30
.L.str.2.30:
	.asciz	"mount failed"
	.size	.L.str.2.30, 13

	.type	.L.str.3.31,@object             ; @.str.3.31
.L.str.3.31:
	.asciz	"val="
	.size	.L.str.3.31, 5

	.type	.L.str.4.34,@object             ; @.str.4.34
.L.str.4.34:
	.asciz	"already mounted"
	.size	.L.str.4.34, 16

	.type	.L.str.5.35,@object             ; @.str.5.35
.L.str.5.35:
	.asciz	" "
	.size	.L.str.5.35, 2

	.type	.L.str.6.36,@object             ; @.str.6.36
.L.str.6.36:
	.asciz	"not yet implemented"
	.size	.L.str.6.36, 20

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

	.type	dmalist,@object                 ; @dmalist
	.section	.zp.bss.dmalist,"aw",@nobits
dmalist:
	.zero	20
	.size	dmalist, 20

	.type	.Lzp_stack,@object              ; @zp_stack
	.section	.zp.noinit..Lzp_stack,"aw",@nobits
.Lzp_stack:
	.zero	37
	.size	.Lzp_stack, 37

.set .L__udivmodhi4_zp_stk, .Lzp_stack+35
	.size	.L__udivmodhi4_zp_stk, 1
.set .Lcputsxy_zp_stk, .Lzp_stack+26
	.size	.Lcputsxy_zp_stk, 9
.set .Lcputln_zp_stk, .Lzp_stack
	.size	.Lcputln_zp_stk, 6
.set .Lclrscr_zp_stk, .Lzp_stack
	.size	.Lclrscr_zp_stk, 3
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
.set .LGetWholeSector_zp_stk, .Lzp_stack+26
	.size	.LGetWholeSector_zp_stk, 3
.set .Lgetdirententry_zp_stk, .Lzp_stack
	.size	.Lgetdirententry_zp_stk, 10
.set .Lcsputdec_zp_stk, .Lzp_stack+4
	.size	.Lcsputdec_zp_stk, 22
.set .Lmprintf_zp_stk, .Lzp_stack
	.size	.Lmprintf_zp_stk, 4
.set .LPutWholeSector_zp_stk, .Lzp_stack+26
	.size	.LPutWholeSector_zp_stk, 5
.set .LfindnextBAMtracksector_zp_stk, .Lzp_stack
	.size	.LfindnextBAMtracksector_zp_stk, 26
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

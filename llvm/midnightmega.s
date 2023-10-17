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
	adc	#220
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
	ldx	#mos16lo(escapeCode)
	stx	__rc20
	ldx	#mos16hi(escapeCode)
	stx	__rc21
	jsr	flushkeybuf
	ldx	#255
	ldy	#1
	bra	.LBB0_9
.LBB0_6:                                ;   in Loop: Header=BB0_9 Depth=1
	lda	__rc20
	sta	__rc2
	lda	__rc21
	sta	__rc3
	lda	#mos16lo(escNOP)
	sta	(__rc20),y
	lda	#0
	sta	(__rc20)
	lda	__rc20
	clc
	adc	#3
	sta	__rc20
	lda	__rc21
	adc	#0
	sta	__rc21
	inc	__rc2
	bne	.LBB0_8
; %bb.7:                                ;   in Loop: Header=BB0_9 Depth=1
	inc	__rc3
.LBB0_8:                                ;   in Loop: Header=BB0_9 Depth=1
	lda	#mos16hi(escNOP)
	sta	(__rc2),y
	dex
.LBB0_9:                                ; =>This Inner Loop Header: Depth=1
	txa
	bne	.LBB0_6
; %bb.10:
	lda	#191
	and	53297
	sta	53297
	lda	#191
	and	53332
	sta	53332
	lda	53341
	and	#127
	sta	53341
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
	lda	#1
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
	tax
	bne	.LBB0_11
; %bb.303:
	jmp	.LBB0_213
.LBB0_11:
	ldx	#40
	txa
	ldy	#28
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc22
	stz	__rc4
; %bb.217:
	jmp	.LBB0_13
.LBB0_12:                               ;   in Loop: Header=BB0_13 Depth=1
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
	ldy	#28
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
	ldy	#28
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_13:                               ; =>This Inner Loop Header: Depth=1
	ldx	__rc4
	cpx	#2
	beq	.LBB0_14
; %bb.305:                              ;   in Loop: Header=BB0_13 Depth=1
	jmp	.LBB0_12
.LBB0_14:
	stz	__rc2
	lda	#0
	ldy	#26
.LBB0_15:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_16 Depth 2
                                        ;       Child Loop BB0_49 Depth 3
                                        ;         Child Loop BB0_55 Depth 4
                                        ;           Child Loop BB0_22 Depth 5
                                        ;           Child Loop BB0_26 Depth 5
                                        ;       Child Loop BB0_154 Depth 3
                                        ;       Child Loop BB0_167 Depth 3
                                        ;       Child Loop BB0_142 Depth 3
                                        ;       Child Loop BB0_178 Depth 3
                                        ;       Child Loop BB0_98 Depth 3
                                        ;         Child Loop BB0_88 Depth 4
                                        ;         Child Loop BB0_94 Depth 4
                                        ;       Child Loop BB0_125 Depth 3
                                        ;         Child Loop BB0_129 Depth 4
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_16:                               ;   Parent Loop BB0_15 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_49 Depth 3
                                        ;         Child Loop BB0_55 Depth 4
                                        ;           Child Loop BB0_22 Depth 5
                                        ;           Child Loop BB0_26 Depth 5
                                        ;       Child Loop BB0_154 Depth 3
                                        ;       Child Loop BB0_167 Depth 3
                                        ;       Child Loop BB0_142 Depth 3
                                        ;       Child Loop BB0_178 Depth 3
                                        ;       Child Loop BB0_98 Depth 3
                                        ;         Child Loop BB0_88 Depth 4
                                        ;         Child Loop BB0_94 Depth 4
                                        ;       Child Loop BB0_125 Depth 3
                                        ;         Child Loop BB0_129 Depth 4
	stz	__rc2
	lda	#0
	ldy	#27
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc26
	stz	__rc30
; %bb.219:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_49
.LBB0_17:                               ;   in Loop: Header=BB0_55 Depth=4
	lda	#1
.LBB0_18:                               ;   in Loop: Header=BB0_55 Depth=4
	ldy	#32
	and	#1
	bne	.LBB0_20
; %bb.19:                               ;   in Loop: Header=BB0_55 Depth=4
	ldy	#62
.LBB0_20:                               ;   in Loop: Header=BB0_55 Depth=4
	ldx	#0
	sty	mos8(s)
	ldy	#32
	sty	mos8(s+1)
	ldy	#5
	bra	.LBB0_22
.LBB0_21:                               ;   in Loop: Header=BB0_22 Depth=5
	sta	mos8(s+2),x
	inx
.LBB0_22:                               ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ;       Parent Loop BB0_49 Depth=3
                                        ;         Parent Loop BB0_55 Depth=4
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
	beq	.LBB0_24
; %bb.23:                               ;   in Loop: Header=BB0_22 Depth=5
	cpx	#16
	bcc	.LBB0_21
.LBB0_24:                               ;   in Loop: Header=BB0_55 Depth=4
	lda	#32
	bra	.LBB0_26
.LBB0_25:                               ;   in Loop: Header=BB0_26 Depth=5
	sta	mos8(s+2),x
	inx
.LBB0_26:                               ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ;       Parent Loop BB0_49 Depth=3
                                        ;         Parent Loop BB0_55 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
	cpx	#16
	bne	.LBB0_25
; %bb.27:                               ;   in Loop: Header=BB0_55 Depth=4
	sta	mos8(s+18)
	ldx	#93
	stx	mos8(s+19)
	sta	mos8(s+20)
	lda	#15
	ldy	#2
	and	(__rc20),y
	sta	__rc3
	stz	__rc2
	tay
	dec
	cpy	#0
	bne	.LBB0_29
; %bb.28:                               ;   in Loop: Header=BB0_55 Depth=4
	dec	__rc2
.LBB0_29:                               ;   in Loop: Header=BB0_55 Depth=4
	ldx	__rc2
	bne	.LBB0_31
; %bb.30:                               ;   in Loop: Header=BB0_55 Depth=4
	cmp	#5
	bra	.LBB0_32
.LBB0_31:                               ;   in Loop: Header=BB0_55 Depth=4
	lda	__rc2
	cmp	#0
.LBB0_32:                               ;   in Loop: Header=BB0_55 Depth=4
	lda	#68
	ldy	#69
	ldx	#76
	bcs	.LBB0_34
; %bb.33:                               ;   in Loop: Header=BB0_55 Depth=4
	ldx	__rc3
	lda	.Lswitch.table.gettype-1,x
	ldy	.Lswitch.table.gettype.15-1,x
	pha
	lda	.Lswitch.table.gettype.16-1,x
	tax
	pla
.LBB0_34:                               ;   in Loop: Header=BB0_55 Depth=4
	sta	mos8(s+21)
	sty	mos8(s+22)
	stx	mos8(s+23)
	ldy	#32
	sty	mos8(s+24)
	ldx	#93
	stx	mos8(s+25)
	sty	mos8(s+26)
	stz	mos8(s+27)
	lda	mos8(g_curTextColor)
	ldx	__rc4
	bne	.LBB0_38
; %bb.35:                               ;   in Loop: Header=BB0_55 Depth=4
	ldx	__rc27
	cpx	__rc23
	bne	.LBB0_38
; %bb.36:                               ;   in Loop: Header=BB0_55 Depth=4
	pha
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	cpx	__rc26
	bne	.LBB0_38
; %bb.37:                               ;   in Loop: Header=BB0_55 Depth=4
	ora	#32
	bra	.LBB0_39
.LBB0_38:                               ;   in Loop: Header=BB0_55 Depth=4
	and	#223
.LBB0_39:                               ;   in Loop: Header=BB0_55 Depth=4
	ldx	__rc4
	bne	.LBB0_41
; %bb.40:                               ;   in Loop: Header=BB0_55 Depth=4
	ldx	#1
	ldy	__rc27
	cpy	__rc23
	beq	.LBB0_42
.LBB0_41:                               ;   in Loop: Header=BB0_55 Depth=4
	ldx	#0
.LBB0_42:                               ;   in Loop: Header=BB0_55 Depth=4
	ldy	#1
	stz	__rc2
	cpx	#0
	bne	.LBB0_44
; %bb.43:                               ;   in Loop: Header=BB0_55 Depth=4
	sty	__rc2
.LBB0_44:                               ;   in Loop: Header=BB0_55 Depth=4
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
	lda	__rc31
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
	bne	.LBB0_46
; %bb.45:                               ;   in Loop: Header=BB0_55 Depth=4
	lda	#60
.LBB0_46:                               ;   in Loop: Header=BB0_55 Depth=4
	jsr	cputc
	inc	__rc22
	beq	.LBB0_47
; %bb.307:                              ;   in Loop: Header=BB0_55 Depth=4
	jmp	.LBB0_55
.LBB0_47:                               ;   in Loop: Header=BB0_55 Depth=4
	inc	__rc28
; %bb.221:                              ;   in Loop: Header=BB0_55 Depth=4
	jmp	.LBB0_55
.LBB0_48:                               ;   in Loop: Header=BB0_49 Depth=3
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	jsr	cputln
	inc	__rc26
	clc
	lda	__rc30
	adc	#2
	sta	__rc30
	clc
	ldy	#27
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_49:                               ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_55 Depth 4
                                        ;           Child Loop BB0_22 Depth 5
                                        ;           Child Loop BB0_26 Depth 5
	ldx	__rc26
	cpx	#2
	bne	.LBB0_50
; %bb.309:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_64
.LBB0_50:                               ;   in Loop: Header=BB0_49 Depth=3
	ldx	__rc30
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
	bcs	.LBB0_52
; %bb.51:                               ;   in Loop: Header=BB0_49 Depth=3
	sta	(__rc20),y
.LBB0_52:                               ;   in Loop: Header=BB0_49 Depth=3
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
	lda	__rc23
	ora	#2
	sta	__rc25
	ldx	#mos16lo(.L.str.29)
	stx	__rc2
	ldx	#mos16hi(.L.str.29)
	stx	__rc3
                                        ; kill: def $rs1 killed $rs1
	pha
	lda	__rc2
	ldy	#28
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
	ldy	#27
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
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	ldx	#0
	jsr	mcputsxy
	clc
	lda	__rc22
	adc	#3
	sta	__rc2
	lda	__rc24
	adc	#0
	sta	__rc3
	jsr	msprintf
	lda	#32
	jsr	cputc
	ldx	#mos16lo(.L.str.30.54)
	stx	__rc2
	ldx	#mos16hi(.L.str.30.54)
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
	stx	__rc28
	lda	__rc23
	adc	#12
	pha
	ldy	#28
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
	stz	__rc22
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
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	lda	(__rc20),y
	sta	__rc23
	cmp	#21
	stz	__rc24
	stz	__rc25
	bcc	.LBB0_54
; %bb.53:                               ;   in Loop: Header=BB0_49 Depth=3
	clc
	adc	#235
	sta	__rc24
	lda	#0
	adc	#255
	sta	__rc25
.LBB0_54:                               ;   in Loop: Header=BB0_49 Depth=3
	lda	__rc28
	ora	#1
	sta	__rc31
	stz	__rc28
.LBB0_55:                               ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ;       Parent Loop BB0_49 Depth=3
                                        ; =>      This Loop Header: Depth=4
                                        ;           Child Loop BB0_22 Depth 5
                                        ;           Child Loop BB0_26 Depth 5
	lda	__rc28
	bne	.LBB0_57
; %bb.56:                               ;   in Loop: Header=BB0_55 Depth=4
	ldx	__rc22
	cpx	#22
	bne	.LBB0_57
; %bb.311:                              ;   in Loop: Header=BB0_49 Depth=3
	jmp	.LBB0_48
.LBB0_57:                               ;   in Loop: Header=BB0_55 Depth=4
	lda	__rc22
	clc
	adc	__rc24
	ldx	#1
	bcs	.LBB0_59
; %bb.58:                               ;   in Loop: Header=BB0_55 Depth=4
	ldx	#0
.LBB0_59:                               ;   in Loop: Header=BB0_55 Depth=4
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
	bne	.LBB0_61
; %bb.60:                               ;   in Loop: Header=BB0_55 Depth=4
	ldx	__rc20
	cpx	__rc2
	bne	.LBB0_61
; %bb.313:                              ;   in Loop: Header=BB0_49 Depth=3
	jmp	.LBB0_48
.LBB0_61:                               ;   in Loop: Header=BB0_55 Depth=4
	lda	__rc28
	ldx	__rc29
	cpx	#1
	adc	__rc25
	sta	__rc4
	beq	.LBB0_62
; %bb.315:                              ;   in Loop: Header=BB0_55 Depth=4
	jmp	.LBB0_17
.LBB0_62:                               ;   in Loop: Header=BB0_55 Depth=4
	ldx	__rc27
	cpx	__rc23
	beq	.LBB0_63
; %bb.317:                              ;   in Loop: Header=BB0_55 Depth=4
	jmp	.LBB0_17
.LBB0_63:                               ;   in Loop: Header=BB0_55 Depth=4
	lda	#0
; %bb.223:                              ;   in Loop: Header=BB0_55 Depth=4
	jmp	.LBB0_18
.LBB0_64:                               ;   in Loop: Header=BB0_16 Depth=2
	lda	#240
	and	mos8(g_curTextColor)
	ora	#1
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.1.38)
	stx	__rc2
	ldx	#mos16hi(.L.str.1.38)
	stx	__rc3
	ldx	#24
	lda	#0
	jsr	mcputsxy
	lda	#208
	and	mos8(g_curTextColor)
	sta	__rc20
	ora	#44
	sta	mos8(g_curTextColor)
	sta	__rc21
	ldx	#mos16lo(.L.str.2.39)
	stx	__rc2
	ldx	#mos16hi(.L.str.2.39)
	stx	__rc3
	jsr	msprintf
	lda	__rc20
	ora	#1
	sta	mos8(g_curTextColor)
	sta	__rc22
	ldx	#mos16lo(.L.str.3.40)
	stx	__rc2
	ldx	#mos16hi(.L.str.3.40)
	stx	__rc3
	jsr	msprintf
	lda	__rc20
	ora	#35
	sta	mos8(g_curTextColor)
	sta	__rc23
	ldx	#mos16lo(.L.str.4.41)
	stx	__rc2
	ldx	#mos16hi(.L.str.4.41)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.5.42)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.42)
	stx	__rc3
	jsr	msprintf
	ldx	__rc21
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.6.43)
	stx	__rc2
	ldx	#mos16hi(.L.str.6.43)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.7.44)
	stx	__rc2
	ldx	#mos16hi(.L.str.7.44)
	stx	__rc3
	jsr	msprintf
	ldx	__rc21
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.8.45)
	stx	__rc2
	ldx	#mos16hi(.L.str.8.45)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.9.46)
	stx	__rc2
	ldx	#mos16hi(.L.str.9.46)
	stx	__rc3
	jsr	msprintf
	ldx	__rc23
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.10.47)
	stx	__rc2
	ldx	#mos16hi(.L.str.10.47)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.11.48)
	stx	__rc2
	ldx	#mos16hi(.L.str.11.48)
	stx	__rc3
	jsr	msprintf
	ldx	__rc21
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.12.49)
	stx	__rc2
	ldx	#mos16hi(.L.str.12.49)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.13.50)
	stx	__rc2
	ldx	#mos16hi(.L.str.13.50)
	stx	__rc3
	jsr	msprintf
	ldx	__rc21
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.14.51)
	stx	__rc2
	ldx	#mos16hi(.L.str.14.51)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.15)
	stx	__rc2
	ldx	#mos16hi(.L.str.15)
	stx	__rc3
	jsr	msprintf
	ldx	__rc23
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.16)
	stx	__rc2
	ldx	#mos16hi(.L.str.16)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.17)
	stx	__rc2
	ldx	#mos16hi(.L.str.17)
	stx	__rc3
	jsr	msprintf
	ldx	__rc21
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.18)
	stx	__rc2
	ldx	#mos16hi(.L.str.18)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.19)
	stx	__rc2
	ldx	#mos16hi(.L.str.19)
	stx	__rc3
	jsr	msprintf
	ldx	__rc23
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.20)
	stx	__rc2
	ldx	#mos16hi(.L.str.20)
	stx	__rc3
	jsr	msprintf
	lda	__rc20
	ora	#3
	sta	mos8(g_curTextColor)
	stz	mos8(g_curX)
	stz	mos8(g_curY)
	jsr	cgetc
	sta	__rc24
	sec
	sbc	#241
	cmp	#34
	bcs	.LBB0_67
; %bb.65:                               ;   in Loop: Header=BB0_16 Depth=2
	tax
	ldy	.LJTI0_0,x
	lda	.LJTI0_0+34,x
	tax
	sty	__rc2
	stx	__rc3
	jmp	(__rc2)
.LBB0_66:                               ;   in Loop: Header=BB0_16 Depth=2
	ldx	#mos16lo(.L.str.47)
	stx	__rc2
	ldx	#mos16hi(.L.str.47)
	stx	__rc3
	ldx	#mos16lo(.L.str.48)
	stx	__rc4
	ldx	#mos16hi(.L.str.48)
	stx	__rc5
	ldx	#mos16lo(.L.str.29)
	stx	__rc6
	ldx	#mos16hi(.L.str.29)
	stx	__rc7
	lda	#0
	jsr	messagebox
; %bb.225:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_67:                               ;   in Loop: Header=BB0_16 Depth=2
	ldx	__rc24
	cpx	#95
	bne	.LBB0_68
; %bb.319:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_82
.LBB0_68:                               ;   in Loop: Header=BB0_16 Depth=2
	cpx	#157
	bne	.LBB0_69
; %bb.321:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_82
.LBB0_69:                               ;   in Loop: Header=BB0_16 Depth=2
	cpx	#29
	bne	.LBB0_70
; %bb.323:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_140
.LBB0_70:                               ;   in Loop: Header=BB0_16 Depth=2
	cpx	#31
	beq	.LBB0_66
; %bb.71:                               ;   in Loop: Header=BB0_16 Depth=2
	ldx	__rc24
	cpx	#145
	beq	.LBB0_72
; %bb.325:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_102
.LBB0_72:                               ;   in Loop: Header=BB0_16 Depth=2
	ldy	#26
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
	bne	.LBB0_73
; %bb.327:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_73:                               ;   in Loop: Header=BB0_16 Depth=2
	dec
	sta	(__rc2),y
; %bb.227:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_74:                               ;   in Loop: Header=BB0_16 Depth=2
	ldy	#26
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
	sta	__rc22
	ldy	#1
	lda	(__rc2),y
	sta	__rc23
	lda	(__rc22),y
	tax
	lda	__rc4
	jsr	getdirententry
	ldy	#2
	lda	(__rc2),y
	tax
	and	#15
	cmp	#5
	bne	.LBB0_75
; %bb.329:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_75:                               ;   in Loop: Header=BB0_16 Depth=2
	txa
	bne	.LBB0_76
; %bb.331:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_76:                               ;   in Loop: Header=BB0_16 Depth=2
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	ldx	__rc24
	cpx	#245
	beq	.LBB0_77
; %bb.333:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_150
.LBB0_77:                               ;   in Loop: Header=BB0_16 Depth=2
	lda	__rc20
	clc
	adc	#30
	sta	__rc2
	lda	__rc21
	adc	#0
	sta	__rc3
	ldy	#1
	lda	(__rc2),y
	bit	__set_v
	pha
	phy
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	pla
	cpx	#0
	beq	.LBB0_78
; %bb.335:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_188
.LBB0_78:                               ;   in Loop: Header=BB0_16 Depth=2
	sta	__rc2
	tya
	pha
	lda	#1
	bvs	.LBB0_79
; %bb.337:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_189
.LBB0_79:                               ;   in Loop: Header=BB0_16 Depth=2
	phy
	ldy	#25
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	pla
	bvs	.LBB0_80
; %bb.339:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_190
.LBB0_80:                               ;   in Loop: Header=BB0_16 Depth=2
	asl
	tax
	lda	midnight,x
	sta	__rc28
	clc
	adc	#68
	sta	__rc4
	lda	midnight+1,x
	sta	__rc29
	adc	#0
	sta	__rc5
	lda	(__rc4),y
	cmp	__rc2
	bne	.LBB0_81
; %bb.341:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_191
.LBB0_81:                               ;   in Loop: Header=BB0_16 Depth=2
	cmp	__rc2
	bcs	.LBB0_229
; %bb.343:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_194
.LBB0_229:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_192
.LBB0_82:                               ;   in Loop: Header=BB0_16 Depth=2
	ldy	#26
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
	bcs	.LBB0_83
; %bb.345:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_141
.LBB0_83:                               ;   in Loop: Header=BB0_16 Depth=2
	clc
	adc	#246
	sta	(__rc2),y
; %bb.231:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_84:                               ;   in Loop: Header=BB0_98 Depth=3
	ldy	#0
	ldx	#0
	bra	.LBB0_88
.LBB0_85:                               ;   in Loop: Header=BB0_88 Depth=4
	cmp	#33
	bcc	.LBB0_87
; %bb.86:                               ;   in Loop: Header=BB0_88 Depth=4
	stx	__rc2
	inc	__rc2
	sta	7233,x
	ldx	__rc2
.LBB0_87:                               ;   in Loop: Header=BB0_88 Depth=4
	iny
.LBB0_88:                               ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ;       Parent Loop BB0_98 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	cpy	#8
	beq	.LBB0_90
; %bb.89:                               ;   in Loop: Header=BB0_88 Depth=4
	lda	6721,y
	cmp	#32
	bne	.LBB0_85
.LBB0_90:                               ;   in Loop: Header=BB0_98 Depth=3
	ldy	#0
	lda	#46
	sta	7233,x
	inx
	bra	.LBB0_94
.LBB0_91:                               ;   in Loop: Header=BB0_94 Depth=4
	cmp	#33
	bcc	.LBB0_93
; %bb.92:                               ;   in Loop: Header=BB0_94 Depth=4
	sta	7233,x
	inx
.LBB0_93:                               ;   in Loop: Header=BB0_94 Depth=4
	iny
.LBB0_94:                               ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ;       Parent Loop BB0_98 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	cpy	#3
	beq	.LBB0_96
; %bb.95:                               ;   in Loop: Header=BB0_94 Depth=4
	lda	6729,y
	cmp	#32
	bne	.LBB0_91
.LBB0_96:                               ;   in Loop: Header=BB0_98 Depth=3
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
	ldx	__rc22
	inc	__rc21
	ldy	#1
.LBB0_97:                               ;   in Loop: Header=BB0_98 Depth=3
	lda	__rc20
	inx
.LBB0_98:                               ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_88 Depth 4
                                        ;         Child Loop BB0_94 Depth 4
	cpx	#18
	bne	.LBB0_99
; %bb.347:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_195
.LBB0_99:                               ;   in Loop: Header=BB0_98 Depth=3
	stx	__rc22
	sta	__rc20
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
	beq	.LBB0_101
; %bb.100:                              ;   in Loop: Header=BB0_98 Depth=3
	cpy	#255
	beq	.LBB0_101
; %bb.349:                              ;   in Loop: Header=BB0_98 Depth=3
	jmp	.LBB0_84
.LBB0_101:                              ;   in Loop: Header=BB0_98 Depth=3
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc22
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldx	__rc22
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
	bra	.LBB0_97
.LBB0_102:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#mos16lo(.L.str.25)
	stx	__rc2
	ldx	#mos16hi(.L.str.25)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc24
	jsr	mprintf
	lda	#32
	jsr	cputc
; %bb.233:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_103:                              ;   in Loop: Header=BB0_16 Depth=2
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
	stz	__rc4
	ldy	#1
	cpx	#255
	beq	.LBB0_107
; %bb.104:                              ;   in Loop: Header=BB0_16 Depth=2
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
	beq	.LBB0_107
; %bb.105:                              ;   in Loop: Header=BB0_16 Depth=2
	cmp	#135
	beq	.LBB0_107
; %bb.106:                              ;   in Loop: Header=BB0_16 Depth=2
	cmp	#255
	beq	.LBB0_107
; %bb.351:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_196
.LBB0_107:                              ;   in Loop: Header=BB0_16 Depth=2
	phy
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
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
	ldx	#0
; %bb.235:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_125
.LBB0_108:                              ;   in Loop: Header=BB0_129 Depth=4
	ora	#32
; %bb.237:                              ;   in Loop: Header=BB0_129 Depth=4
	jmp	.LBB0_134
.LBB0_109:                              ;   in Loop: Header=BB0_125 Depth=3
	lda	mos8(g_curTextColor)
.LBB0_110:                              ;   in Loop: Header=BB0_125 Depth=3
	and	#223
	sta	mos8(g_curTextColor)
	jsr	cputln
	jsr	cgetc
	cmp	#145
	beq	.LBB0_116
; %bb.111:                              ;   in Loop: Header=BB0_125 Depth=3
	cmp	#13
	beq	.LBB0_118
; %bb.112:                              ;   in Loop: Header=BB0_125 Depth=3
	ldy	#1
	cmp	#17
	bne	.LBB0_113
; %bb.353:                              ;   in Loop: Header=BB0_125 Depth=3
	jmp	.LBB0_120
.LBB0_113:                              ;   in Loop: Header=BB0_125 Depth=3
	cmp	#3
	bne	.LBB0_114
; %bb.355:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_114:                              ;   in Loop: Header=BB0_125 Depth=3
	cmp	#27
	bne	.LBB0_115
; %bb.357:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_115:                              ;   in Loop: Header=BB0_125 Depth=3
	ldx	#mos16lo(.L.str.25)
	stx	__rc2
	ldx	#mos16hi(.L.str.25)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	ldy	#1
; %bb.239:                              ;   in Loop: Header=BB0_125 Depth=3
	jmp	.LBB0_121
.LBB0_116:                              ;   in Loop: Header=BB0_125 Depth=3
	ldx	#0
	ldy	#1
	lda	__rc21
	sta	__rc4
	lda	__rc27
	bne	.LBB0_117
; %bb.359:                              ;   in Loop: Header=BB0_125 Depth=3
	jmp	.LBB0_125
.LBB0_117:                              ;   in Loop: Header=BB0_125 Depth=3
	dec	__rc27
	ldx	__rc27
; %bb.241:                              ;   in Loop: Header=BB0_125 Depth=3
	jmp	.LBB0_125
.LBB0_118:                              ;   in Loop: Header=BB0_125 Depth=3
	lda	(__rc28)
	sta	__rc20
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc27
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
	lda	__rc20
	beq	.LBB0_122
; %bb.119:                              ;   in Loop: Header=BB0_125 Depth=3
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
	bra	.LBB0_123
.LBB0_120:                              ;   in Loop: Header=BB0_125 Depth=3
	inc	__rc27
.LBB0_121:                              ;   in Loop: Header=BB0_125 Depth=3
	ldx	__rc27
	lda	__rc21
	sta	__rc4
	bra	.LBB0_125
.LBB0_122:                              ;   in Loop: Header=BB0_125 Depth=3
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
.LBB0_123:                              ;   in Loop: Header=BB0_125 Depth=3
	lda	__rc2
	bne	.LBB0_124
; %bb.361:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_149
.LBB0_124:                              ;   in Loop: Header=BB0_125 Depth=3
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
	lda	#0
	jsr	messagebox
	ldx	__rc27
	ldy	#1
	lda	__rc21
	sta	__rc4
.LBB0_125:                              ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_129 Depth 4
	lda	__rc4
	sta	__rc21
	cpx	__rc4
	bcs	.LBB0_127
; %bb.126:                              ;   in Loop: Header=BB0_125 Depth=3
	stx	__rc27
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc27
	jsr	__mulhi3
	ldy	#1
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
	bne	.LBB0_128
.LBB0_127:                              ;   in Loop: Header=BB0_125 Depth=3
	stz	__rc27
.LBB0_128:                              ;   in Loop: Header=BB0_125 Depth=3
	ldx	#mos16lo(filelist)
	stx	__rc22
	ldx	#mos16hi(filelist)
	stx	__rc23
	ldx	#73
	stx	__rc2
	ldx	#23
	stx	__rc3
	sty	__rc4
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
	ldx	#3
	lda	#12
	jsr	mcputsxy
	lda	(__rc24)
	sta	__rc26
	sta	__rc28
	ldy	#1
	lda	(__rc24),y
	ldy	#28
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc29
	lda	(__rc28)
	stz	__rc2
	stz	__rc3
	stz	__rc4
	ldx	#0
	jsr	csputdec
	ldx	#mos16lo(.L.str.22)
	stx	__rc2
	ldx	#mos16hi(.L.str.22)
	stx	__rc3
	jsr	msprintf
	ldy	#5
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	__rc27
	stx	__rc30
	stz	__rc31
.LBB0_129:                              ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ;       Parent Loop BB0_125 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	cpy	#23
	bne	.LBB0_130
; %bb.363:                              ;   in Loop: Header=BB0_125 Depth=3
	jmp	.LBB0_109
.LBB0_130:                              ;   in Loop: Header=BB0_129 Depth=4
	lda	(__rc22)
	tax
	lda	mos8(g_curTextColor)
	cpx	#0
	bne	.LBB0_131
; %bb.365:                              ;   in Loop: Header=BB0_125 Depth=3
	jmp	.LBB0_110
.LBB0_131:                              ;   in Loop: Header=BB0_129 Depth=4
	ldx	__rc31
	bne	.LBB0_133
; %bb.132:                              ;   in Loop: Header=BB0_129 Depth=4
	ldx	__rc30
	bne	.LBB0_133
; %bb.367:                              ;   in Loop: Header=BB0_129 Depth=4
	jmp	.LBB0_108
.LBB0_133:                              ;   in Loop: Header=BB0_129 Depth=4
	and	#223
.LBB0_134:                              ;   in Loop: Header=BB0_129 Depth=4
	sta	mos8(g_curTextColor)
	ldx	__rc22
	stx	__rc2
	ldx	__rc23
	stx	__rc3
	phy
	plx
	lda	#10
	sty	__rc20
	jsr	cputsxy
	ldy	__rc20
	lda	__rc22
	clc
	adc	#65
	sta	__rc22
	lda	__rc23
	adc	#0
	sta	__rc23
	iny
	ldx	__rc30
	dec	__rc30
	cpx	#0
	bne	.LBB0_129
; %bb.135:                              ;   in Loop: Header=BB0_129 Depth=4
	dec	__rc31
	bra	.LBB0_129
.LBB0_136:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	54801
	cpx	#1
	bne	.LBB0_137
; %bb.369:
	jmp	.LBB0_213
.LBB0_137:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	54801
	cpx	#2
	beq	.LBB0_243
; %bb.371:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_243:
	jmp	.LBB0_213
.LBB0_138:                              ;   in Loop: Header=BB0_16 Depth=2
	ldy	#26
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
; %bb.245:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_139:                              ;   in Loop: Header=BB0_16 Depth=2
	ldy	#26
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
; %bb.247:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_140:                              ;   in Loop: Header=BB0_16 Depth=2
	ldy	#26
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
	sta	(__rc4),y
; %bb.249:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_141:                              ;   in Loop: Header=BB0_16 Depth=2
	lda	#0
	sta	(__rc2),y
; %bb.251:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_142:                              ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	cpx	#12
	bne	.LBB0_144
; %bb.143:                              ;   in Loop: Header=BB0_142 Depth=3
	cpy	#88
	bne	.LBB0_144
; %bb.373:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_198
.LBB0_144:                              ;   in Loop: Header=BB0_142 Depth=3
	sty	__rc30
	tya
	clc
	adc	#32
	sta	__rc10
	stx	__rc31
	txa
	adc	#0
	sta	__rc2
	lda	#0
	adc	#8
	sta	__rc3
	ldy	#21
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
	beq	.LBB0_146
; %bb.145:                              ;   in Loop: Header=BB0_142 Depth=3
	ldx	__rc26
	stx	__rc2
	ldx	__rc27
	stx	__rc3
	ldx	__rc24
	stx	__rc4
	ldx	__rc25
	stx	__rc5
	lda	#0
	jsr	findnextBAMtracksector
	lda	(__rc26)
	sta	6144
	lda	(__rc24)
	sta	6145
	lda	(__rc26)
	ldy	#28
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	(__rc24)
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_146:                              ;   in Loop: Header=BB0_142 Depth=3
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	__rc28
	stx	__rc4
	ldx	__rc29
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	PutOneSector
	lda	6144
	ldy	__rc30
	ldx	__rc31
	iny
	bne	.LBB0_148
; %bb.147:                              ;   in Loop: Header=BB0_142 Depth=3
	inx
.LBB0_148:                              ;   in Loop: Header=BB0_142 Depth=3
	pha
	phy
	ldy	#27
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc29
	pla
	beq	.LBB0_253
; %bb.375:                              ;   in Loop: Header=BB0_142 Depth=3
	jmp	.LBB0_142
.LBB0_253:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_200
.LBB0_149:                              ;   in Loop: Header=BB0_16 Depth=2
	lda	(__rc28)
	pha
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	pla
	ldx	__rc20
	jsr	UpdateSectors
	clc
	lda	__rc26
	adc	#3
	tax
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#0
	stx	__rc2
	sta	__rc3
	ldx	__rc22
	stx	__rc4
	ldx	__rc23
	stx	__rc5
	jsr	strcpy
	lda	(__rc28)
	ldx	__rc20
	jsr	UpdateSectors
; %bb.255:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_150:                              ;   in Loop: Header=BB0_16 Depth=2
	lda	__rc20
	clc
	adc	#5
	sta	__rc4
	lda	__rc21
	adc	#0
	sta	__rc5
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	bne	.LBB0_151
; %bb.377:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_197
.LBB0_151:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#mos16lo(.L.str.43)
	stx	__rc6
	ldx	#mos16hi(.L.str.43)
.LBB0_152:                              ;   in Loop: Header=BB0_16 Depth=2
	stx	__rc7
	ldx	#mos16lo(.L.str.42)
	stx	__rc2
	ldx	#mos16hi(.L.str.42)
	stx	__rc3
	lda	#0
	jsr	messagebox
	tax
	bne	.LBB0_153
; %bb.379:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_165
.LBB0_153:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#3
	txa
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#mos16lo(.L.str.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.36)
	stx	__rc3
	ldx	#mos16lo(.L.str.38)
	stx	__rc4
	ldx	#mos16hi(.L.str.38)
	stx	__rc5
	lda	#20
	jsr	progress
	lda	#0
	ldy	#2
	sta	(__rc20),y
	tax
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	jsr	GetBAM
	ldx	#mos16lo(.L.str.39)
	stx	__rc2
	ldx	#mos16hi(.L.str.39)
	stx	__rc3
	ldx	#mos16lo(.L.str.45)
	stx	__rc4
	ldx	#mos16hi(.L.str.45)
	stx	__rc5
	lda	#40
	tax
	pha
	txa
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	jsr	progress
	lda	(__rc22)
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#1
	lda	(__rc22),y
	ldy	#27
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	_miniInit
	ldx	mos8(direntryblock.0)
	txa
	ldy	#25
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	mos8(direntryblock.0+1)
	txa
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
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
	sta	__rc8
	ldy	#0
	stx	__rc6
	ldx	__rc2
	stx	__rc7
	lda	__rc3
	ldx	#8
	phy
	pha
	txa
	ldy	#28
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ora	#8
	sta	__rc26
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	stz	__rc30
	stz	__rc2
	stz	__rc28
	stz	__rc27
.LBB0_154:                              ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	__rc2
	stx	__rc29
	ldx	__rc30
	stx	__rc2
	cpy	__rc2
	bne	.LBB0_156
; %bb.155:                              ;   in Loop: Header=BB0_154 Depth=3
	ldx	__rc29
	phy
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	cpx	__rc2
	bcc	.LBB0_157
; %bb.257:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_163
.LBB0_156:                              ;   in Loop: Header=BB0_154 Depth=3
	stx	__rc2
	cpy	__rc2
	bcc	.LBB0_157
; %bb.381:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_163
.LBB0_157:                              ;   in Loop: Header=BB0_154 Depth=3
	lda	__rc29
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
	ldx	__rc8
	stx	__rc31
	adc	__rc8
	sta	__rc11
	ldx	__rc6
	stx	__rc20
	lda	__rc2
	adc	__rc6
	sta	__rc10
	ldx	__rc7
	stx	__rc24
	lda	__rc7
	adc	#0
	sta	__rc2
	lda	__rc26
	adc	#0
	tax
	lda	__rc2
	phy
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stx	__rc3
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc5
	sty	__rc6
	sty	__rc7
	ldx	#32
	stx	__rc8
	sty	__rc9
	ldx	__rc10
	stx	__rc25
	ldx	__rc10
	ldy	__rc11
	sty	__rc21
	lda	__rc11
	jsr	lcopy
	lda	__rc29
	beq	.LBB0_160
; %bb.158:                              ;   in Loop: Header=BB0_154 Depth=3
	lda	__rc29
	and	#7
	bne	.LBB0_160
; %bb.159:                              ;   in Loop: Header=BB0_154 Depth=3
	ldx	__rc28
	txa
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc27
	txa
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_160:                              ;   in Loop: Header=BB0_154 Depth=3
	ldx	6656
	ldy	__rc20
	sty	__rc6
	ldy	__rc24
	sty	__rc7
	ldy	__rc31
	sty	__rc8
	txa
	beq	.LBB0_162
; %bb.161:                              ;   in Loop: Header=BB0_154 Depth=3
	clc
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc30
	adc	#0
	sta	__rc30
	stx	__rc28
	ldx	6657
	stx	__rc27
.LBB0_162:                              ;   in Loop: Header=BB0_154 Depth=3
	ldy	#0
	lda	#32
	ldx	__rc29
	inx
	stx	__rc2
	pha
	phy
	ldy	#27
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	pla
	cpx	__rc29
	beq	.LBB0_259
; %bb.383:                              ;   in Loop: Header=BB0_154 Depth=3
	jmp	.LBB0_154
.LBB0_259:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_214
.LBB0_163:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#mos16lo(.L.str.39)
	stx	__rc2
	ldx	#mos16hi(.L.str.39)
	stx	__rc3
	ldx	#mos16lo(.L.str.46)
	stx	__rc4
	ldx	#mos16hi(.L.str.46)
	stx	__rc5
	lda	#80
	jsr	progress
	lda	(__rc22)
	pha
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	pla
	ldx	__rc20
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	PutBAM
	lda	(__rc22)
	ldx	__rc20
.LBB0_164:                              ;   in Loop: Header=BB0_16 Depth=2
	jsr	UpdateSectors
.LBB0_165:                              ;   in Loop: Header=BB0_16 Depth=2
	lda	(__rc22)
	pha
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	jsr	getdirent
	ldy	#2
	sta	(__rc22),y
; %bb.261:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_16
.LBB0_166:                              ;   in Loop: Header=BB0_167 Depth=3
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldx	__rc25
	stx	__rc4
	tax
	sta	__rc24
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	GetOneSector
	ldx	mos8(BAMsector)
	ldy	mos8(BAMsector+1)
	stx	__rc2
	sty	__rc3
	ldx	mos8(BAMsector+2)
	ldy	mos8(BAMsector+3)
	stx	__rc4
	sty	__rc5
	stz	__rc6
	ldx	__rc25
	lda	__rc24
	jsr	BAMSectorUpdate
	lda	6144
	ldx	6145
	stx	__rc25
.LBB0_167:                              ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	tax
	bne	.LBB0_166
; %bb.263:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_215
.LBB0_168:                              ;   in Loop: Header=BB0_178 Depth=3
	sta	__rc2
	cpx	__rc2
	bcc	.LBB0_169
; %bb.385:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_180
.LBB0_169:                              ;   in Loop: Header=BB0_178 Depth=3
                                        ; kill: def $rs14 killed $rs14
	pha
	phy
	lda	__rc28
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc29
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	pla
	sta	__rc28
	sty	__rc2
	lsr	__rc2
	sty	__rc24
	lda	#0
	ror
	lsr	__rc2
	ror
	pha
	lda	__rc2
	ldy	#16
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
	adc	__rc31
	sta	__rc10
	lda	#0
	adc	#0
	tax
	lda	__rc25
	adc	#0
	phy
	pha
	txa
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stx	__rc2
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc3
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	ldy	#27
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc10
	txa
	ldy	#14
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	tya
	sty	__rc29
	jsr	lcopy
	lda	__rc24
	and	#7
	beq	.LBB0_171
; %bb.170:                              ;   in Loop: Header=BB0_178 Depth=3
	ldy	#1
	ldx	__rc24
	bra	.LBB0_173
.LBB0_171:                              ;   in Loop: Header=BB0_178 Depth=3
	ldy	#1
	ldx	__rc24
	bne	.LBB0_172
; %bb.387:                              ;   in Loop: Header=BB0_178 Depth=3
	jmp	.LBB0_212
.LBB0_172:                              ;   in Loop: Header=BB0_178 Depth=3
	stx	__rc30
	lda	__rc27
	phy
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc26
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
.LBB0_173:                              ;   in Loop: Header=BB0_178 Depth=3
	lda	6912
	beq	.LBB0_175
; %bb.174:                              ;   in Loop: Header=BB0_178 Depth=3
	stx	__rc2
	clc
	sta	__rc27
	phy
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	lda	__rc28
	adc	#0
	sta	__rc28
	ldx	6913
	stx	__rc26
	ldx	__rc27
	stx	__rc3
	bra	.LBB0_176
.LBB0_175:                              ;   in Loop: Header=BB0_178 Depth=3
	sta	__rc3
	stx	__rc2
.LBB0_176:                              ;   in Loop: Header=BB0_178 Depth=3
	lda	#15
	and	6914
	bne	.LBB0_177
; %bb.389:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_216
.LBB0_177:                              ;   in Loop: Header=BB0_178 Depth=3
	ldy	__rc2
	iny
	ldx	#0
	lda	__rc28
	pha
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc29
	pla
.LBB0_178:                              ;   Parent Loop BB0_15 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	sta	__rc2
	cpx	__rc2
	beq	.LBB0_179
; %bb.391:                              ;   in Loop: Header=BB0_178 Depth=3
	jmp	.LBB0_168
.LBB0_179:                              ;   in Loop: Header=BB0_178 Depth=3
	pha
	phy
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	pla
	cpy	__rc2
	bcs	.LBB0_180
; %bb.393:                              ;   in Loop: Header=BB0_178 Depth=3
	jmp	.LBB0_169
.LBB0_180:                              ;   in Loop: Header=BB0_16 Depth=2
	lsr	__rc30
	ldx	#1
	bcs	.LBB0_182
; %bb.181:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#0
.LBB0_182:                              ;   in Loop: Header=BB0_16 Depth=2
	stx	__rc4
	clc
	phy
	lda	__rc0
	adc	#35
	sta	__rc28
	lda	__rc1
	adc	#0
	sta	__rc29
	clc
	lda	__rc0
	adc	#34
	sta	__rc24
	ldx	__rc25
	txa
	ldy	#11
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc1
	adc	#0
	sta	__rc25
	lda	__rc27
	sta	(__rc28)
	lda	__rc26
	sta	(__rc24)
	lda	__rc31
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	tya
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#0
	ldy	__rc4
	cpy	#1
	ror
	lsr	__rc30
	pha
	lda	__rc30
	ldy	#28
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
	lda	#0
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	adc	__rc3
	tay
	phy
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc31
	adc	__rc2
	sta	__rc30
	lda	#0
	adc	#0
	sta	__rc31
	txa
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	adc	#0
	ldy	#9
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc31
	stx	__rc2
	sta	__rc3
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc27
	sta	__rc4
	ldy	#27
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc26
	sta	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc30
	tya
	jsr	lcopy
	ldx	__rc28
	stx	__rc2
	ldx	__rc29
	stx	__rc3
	ldx	__rc24
	stx	__rc4
	ldx	__rc25
	stx	__rc5
	lda	#1
	jsr	findnextBAMtracksector
	lda	(__rc28)
	sta	6912
	lda	(__rc24)
	sta	6913
	lda	(__rc28)
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	(__rc24)
	ldy	#14
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	ldx	__rc30
	stx	__rc5
	ldx	__rc31
	stx	__rc6
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc7
	stz	__rc2
	stz	__rc3
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc26
	lda	__rc27
	jsr	lcopy
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	lsr
	sta	__rc3
	lda	#0
	stz	__rc2
	clc
	adc	__rc2
	pha
	lda	#1
	bcs	.LBB0_184
; %bb.183:                              ;   in Loop: Header=BB0_16 Depth=2
	lda	#0
.LBB0_184:                              ;   in Loop: Header=BB0_16 Depth=2
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	tay
	sty	__rc17
	ldy	#27
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc27
	lda	__rc3
	pha
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	cmp	#1
	pla
	adc	__rc27
	sta	__rc10
	lda	#0
	adc	__rc2
	tax
	lda	#0
	pha
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	__rc17
	sta	__rc29
	pla
	adc	__rc29
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
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
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
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	clc
	adc	__rc2
	sta	__rc26
	lda	__rc3
	adc	__rc27
	sta	__rc24
	ldy	__rc27
	sty	__rc30
	txa
	adc	#0
	sta	__rc27
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#0
	sta	__rc25
	ldx	__rc27
	stx	__rc2
	sta	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#1
	stx	__rc6
	ldx	__rc24
	lda	__rc26
	jsr	lfill
	lda	#0
	sta	(__rc20)
	dec
	ldy	#1
	sta	(__rc20),y
	ldx	__rc26
	stx	__rc4
	ldx	__rc24
	stx	__rc5
	ldx	__rc27
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
	pha
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc21
	pla
	jsr	lcopy
	lda	__rc31
	lsr
	pha
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	cmp	#1
	pla
	adc	__rc30
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
	ldy	#27
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	lcopy
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	lda	__rc28
	jsr	PutOneSector
.LBB0_185:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#mos16lo(.L.str.39)
	stx	__rc2
	ldx	#mos16hi(.L.str.39)
	stx	__rc3
	ldx	#mos16lo(.L.str.38)
	stx	__rc4
	ldx	#mos16hi(.L.str.38)
	stx	__rc5
	lda	#80
	jsr	progress
	lda	(__rc20)
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	pla
	ldx	__rc2
	bne	.LBB0_186
; %bb.395:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_206
.LBB0_186:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#1
; %bb.265:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_207
.LBB0_187:                              ;   in Loop: Header=BB0_15 Depth=1
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	eor	#1
; %bb.267:                              ;   in Loop: Header=BB0_15 Depth=1
	jmp	.LBB0_15
.LBB0_188:                              ;   in Loop: Header=BB0_16 Depth=2
	clv
; %bb.269:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_78
.LBB0_189:                              ;   in Loop: Header=BB0_16 Depth=2
	lda	#0
; %bb.271:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_79
.LBB0_190:                              ;   in Loop: Header=BB0_16 Depth=2
	lda	#0
; %bb.273:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_80
.LBB0_191:                              ;   in Loop: Header=BB0_16 Depth=2
	ldy	#30
	lda	(__rc20),y
	sta	__rc2
	ldy	#68
	lda	(__rc28),y
; %bb.275:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_81
.LBB0_192:                              ;   in Loop: Header=BB0_16 Depth=2
	lda	__rc20
	clc
	adc	#5
	sta	__rc4
	lda	__rc21
	adc	#0
	sta	__rc5
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	bne	.LBB0_193
; %bb.397:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_202
.LBB0_193:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#mos16lo(.L.str.34)
	stx	__rc6
	ldx	#mos16hi(.L.str.34)
; %bb.277:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_203
.LBB0_194:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#mos16lo(.L.str.32)
	stx	__rc2
	ldx	#mos16hi(.L.str.32)
	stx	__rc3
	ldx	#mos16lo(.L.str.33)
	stx	__rc4
	ldx	#mos16hi(.L.str.33)
	stx	__rc5
	ldx	#mos16lo(.L.str.29)
	stx	__rc6
	ldx	#mos16hi(.L.str.29)
	stx	__rc7
	lda	#0
	jsr	messagebox
; %bb.279:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_165
.LBB0_195:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	__rc21
	stx	__rc4
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
; %bb.281:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_107
.LBB0_196:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#0
	stz	__rc21
; %bb.283:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_98
.LBB0_197:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#mos16lo(.L.str.44)
	stx	__rc6
	ldx	#mos16hi(.L.str.44)
; %bb.285:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_152
.LBB0_198:                              ;   in Loop: Header=BB0_16 Depth=2
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	beq	.LBB0_200
; %bb.199:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#mos16lo(.L.str.13)
	stx	__rc2
	ldx	#mos16hi(.L.str.13)
	stx	__rc3
	ldx	#mos16lo(.L.str.14)
	stx	__rc4
	ldx	#mos16hi(.L.str.14)
	stx	__rc5
	ldx	#mos16lo(.L.str.29)
	stx	__rc6
	ldx	#mos16hi(.L.str.29)
	stx	__rc7
	lda	#0
	jsr	messagebox
.LBB0_200:                              ;   in Loop: Header=BB0_16 Depth=2
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
	ldx	#mos16lo(.L.str.39)
	stx	__rc2
	ldx	#mos16hi(.L.str.39)
	stx	__rc3
	ldx	#mos16lo(.L.str.41)
	stx	__rc4
	ldx	#mos16hi(.L.str.41)
	stx	__rc5
	lda	#60
	jsr	progress
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
	lda	(__rc28)
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	_miniInit
	ldx	mos8(direntryblock.1)
	txa
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	mos8(direntryblock.1+1)
	txa
	ldy	#27
	sta	(__rc0),y                       ; 1-byte Folded Spill
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	bne	.LBB0_201
; %bb.399:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_210
.LBB0_201:                              ;   in Loop: Header=BB0_16 Depth=2
	stz	__rc31
; %bb.287:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_211
.LBB0_202:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#mos16lo(.L.str.35)
	stx	__rc6
	ldx	#mos16hi(.L.str.35)
.LBB0_203:                              ;   in Loop: Header=BB0_16 Depth=2
	stx	__rc7
	ldx	#mos16lo(.L.str.32)
	stx	__rc2
	ldx	#mos16hi(.L.str.32)
	stx	__rc3
	lda	#0
	jsr	messagebox
	tax
	bne	.LBB0_204
; %bb.401:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_165
.LBB0_204:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#mos16lo(.L.str.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.36)
	stx	__rc3
                                        ; kill: def $rs1 killed $rs1
	lda	__rc2
	ldy	#28
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
	ldx	#mos16lo(.L.str.37.55)
	stx	__rc4
	ldx	#mos16hi(.L.str.37.55)
	stx	__rc5
	lda	#20
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
	ldx	#88
	stx	__rc4
	ldx	#12
	stx	__rc5
	sta	__rc8
	ldx	#32
	lda	#0
	jsr	readblockchain
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	#mos16lo(.L.str.38)
	stx	__rc4
	ldx	#mos16hi(.L.str.38)
	stx	__rc5
	lda	#30
	jsr	progress
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	lda	__rc2
	beq	.LBB0_208
; %bb.205:                              ;   in Loop: Header=BB0_16 Depth=2
	lda	#1
	bra	.LBB0_209
.LBB0_206:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#0
.LBB0_207:                              ;   in Loop: Header=BB0_16 Depth=2
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	PutBAM
	lda	(__rc20)
	pha
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
; %bb.289:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_164
.LBB0_208:                              ;   in Loop: Header=BB0_16 Depth=2
	lda	#0
.LBB0_209:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#0
	jsr	GetBAM
	ldx	#mos16lo(.L.str.39)
	stx	__rc2
	ldx	#mos16hi(.L.str.39)
	stx	__rc3
	ldx	#mos16lo(.L.str.40)
	stx	__rc4
	ldx	#mos16hi(.L.str.40)
	stx	__rc5
	lda	#40
	jsr	progress
	clc
	lda	__rc0
	adc	#33
	sta	__rc26
	lda	__rc1
	adc	#0
	sta	__rc27
	lda	#0
	sta	(__rc26)
	clc
	lda	__rc0
	adc	#32
	sta	__rc24
	lda	__rc1
	adc	#0
	sta	__rc25
	lda	#255
	tax
	pha
	txa
	ldy	#27
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	(__rc24)
                                        ; kill: def $rs14 killed $rs14
	lda	__rc28
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc29
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	(__rc28)
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	_miniInit
	ldx	mos8(worksector.0)
	ldy	mos8(worksector.0+1)
	txa
	phy
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	stx	__rc4
	tya
	phy
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	sty	__rc5
                                        ; kill: def $rs2 killed $rs2
	lda	__rc4
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	lda	__rc0
	adc	#31
	sta	__rc30
	lda	__rc1
	adc	#0
	sta	__rc31
	ldx	__rc30
	stx	__rc2
	sta	__rc3
	clc
	lda	__rc0
	adc	#30
	sta	__rc28
	lda	__rc1
	adc	#0
	sta	__rc29
	ldx	__rc28
	stx	__rc4
	sta	__rc5
	stz	__rc6
	lda	#0
	ldy	#28
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#0
	jsr	findnextBAMtracksector
	lda	(__rc28)
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc28
	lda	(__rc30)
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc29
	ldy	#0
	ldx	#0
; %bb.291:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_142
.LBB0_210:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#14
	stx	__rc31
.LBB0_211:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	#8
	stx	__rc25
	ldx	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	eor	#1
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#3
	tya
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#40
	tya
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc26
	ldy	#8
	tya
	ldy	#28
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc27
	stz	__rc30
	ldy	#0
	tya
; %bb.293:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_178
.LBB0_212:                              ;   in Loop: Header=BB0_178 Depth=3
	stz	__rc30
; %bb.295:                              ;   in Loop: Header=BB0_178 Depth=3
	jmp	.LBB0_173
.LBB0_213:
	jsr	clrhome
	ldx	#mos16lo(.L.str.4)
	stx	__rc2
	ldx	#mos16hi(.L.str.4)
	stx	__rc3
	jsr	msprintf
	jsr	cputln
	jsr	cgetc
	jsr	flushkeybuf
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
	adc	#36
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.LBB0_214:                              ;   in Loop: Header=BB0_16 Depth=2
	stz	6658
	ldx	__rc21
	stx	__rc4
	ldx	__rc25
	stx	__rc5
	pha
	phy
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc6
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc7
	pla
	sty	__rc2
	sty	__rc3
	ldx	__rc31
	stx	__rc25
	sta	__rc8
	sty	__rc9
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	lcopy
	ldy	#27
	lda	(__rc0),y                       ; 1-byte Folded Reload
	lsr
	lsr
	lsr
	tax
	clc
	lda	#0
	adc	__rc25
	tay
	txa
	adc	__rc20
	sta	__rc10
	lda	#0
	adc	__rc24
	tax
	lda	#0
	pha
	phy
	ldy	#18
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
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	jsr	PutOneSector
	ldx	6659
	stx	__rc26
	ldx	6660
	stx	__rc25
	jsr	_miniInit
	ldx	mos8(BAMsector)
	ldy	mos8(BAMsector+1)
	stx	__rc2
	sty	__rc3
	ldx	#1
	stx	__rc4
	ldx	#40
	lda	__rc24
	jsr	GetOneSector
	ldx	mos8(BAMsector)
	ldy	mos8(BAMsector+1)
	stx	__rc20
	sty	__rc21
	ldx	mos8(BAMsector+2)
	ldy	mos8(BAMsector+3)
	stx	__rc2
	sty	__rc3
	lda	(__rc20)
	tax
	ldy	#1
	lda	(__rc20),y
	sta	__rc4
	lda	__rc24
	jsr	GetOneSector
	lda	__rc26
; %bb.297:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_167
.LBB0_215:                              ;   in Loop: Header=BB0_16 Depth=2
	ldx	mos8(BAMsector)
	ldy	mos8(BAMsector+1)
	stx	__rc2
	sty	__rc3
	ldx	#1
	stx	__rc4
	ldx	#40
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	jsr	PutOneSector
	ldx	mos8(BAMsector+2)
	ldy	mos8(BAMsector+3)
	stx	__rc2
	sty	__rc3
	lda	(__rc20)
	tax
	ldy	#1
	lda	(__rc20),y
	sta	__rc4
	lda	__rc24
	jsr	PutOneSector
; %bb.299:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_163
.LBB0_216:                              ;   in Loop: Header=BB0_16 Depth=2
	lda	__rc3
	sta	(__rc20)
	lda	6913
	sta	(__rc20),y
	ldx	__rc29
	stx	__rc4
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc6
	stz	__rc2
	stz	__rc3
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc21
	lda	__rc20
	jsr	lcopy
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	lsr
	tax
	stz	__rc2
	clc
	lda	#0
	adc	__rc2
	tay
	txa
	adc	__rc31
	sta	__rc10
	lda	#0
	adc	__rc2
	sta	__rc2
	lda	#0
	adc	__rc25
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
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	PutOneSector
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc21
; %bb.301:                              ;   in Loop: Header=BB0_16 Depth=2
	jmp	.LBB0_185
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.section	.rodata.main,"a",@progbits
.LJTI0_0:
	.byte	.LBB0_66@mos16lo
	.byte	.LBB0_103@mos16lo
	.byte	.LBB0_66@mos16lo
	.byte	.LBB0_66@mos16lo
	.byte	.LBB0_74@mos16lo
	.byte	.LBB0_66@mos16lo
	.byte	.LBB0_66@mos16lo
	.byte	.LBB0_74@mos16lo
	.byte	.LBB0_66@mos16lo
	.byte	.LBB0_136@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_187@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_66@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_102@mos16lo
	.byte	.LBB0_138@mos16lo
	.byte	.LBB0_139@mos16lo
	.byte	.LBB0_66@mos16hi
	.byte	.LBB0_103@mos16hi
	.byte	.LBB0_66@mos16hi
	.byte	.LBB0_66@mos16hi
	.byte	.LBB0_74@mos16hi
	.byte	.LBB0_66@mos16hi
	.byte	.LBB0_66@mos16hi
	.byte	.LBB0_74@mos16hi
	.byte	.LBB0_66@mos16hi
	.byte	.LBB0_136@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_187@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_66@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_102@mos16hi
	.byte	.LBB0_138@mos16hi
	.byte	.LBB0_139@mos16hi
                                        ; -- End function
	.section	.text._miniInit,"ax",@progbits
	.type	_miniInit,@function             ; -- Begin function _miniInit
_miniInit:                              ; @_miniInit
; %bb.0:
	stz	mos8(BAMsector)
	ldx	#22
	stx	mos8(BAMsector+1)
	stz	mos8(BAMsector+2)
	inx
	stx	mos8(BAMsector+3)
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
	rts
.Lfunc_end1:
	.size	_miniInit, .Lfunc_end1-_miniInit
                                        ; -- End function
	.section	.text.ReadSector,"ax",@progbits
	.type	ReadSector,@function            ; -- Begin function ReadSector
ReadSector:                             ; @ReadSector
; %bb.0:
	cpx	#0
	beq	.LBB2_5
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
.LBB2_2:                                ; =>This Inner Loop Header: Depth=1
	ldx	53378
	bmi	.LBB2_2
; %bb.3:
	lda	53378
	and	#24
	beq	.LBB2_6
; %bb.4:
	lda	#255
	ldx	#64
	stx	53376
	rts
.LBB2_5:
	lda	#252
	rts
.LBB2_6:
	lda	54921
	and	#127
	sta	54921
	tya
	and	#1
	rts
.Lfunc_end2:
	.size	ReadSector, .Lfunc_end2-ReadSector
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
	bcs	.LBB3_5
; %bb.1:
	tax
	beq	.LBB3_3
; %bb.2:
	ldx	#109
	bra	.LBB3_4
.LBB3_3:
	ldx	#108
.LBB3_4:
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
.LBB3_5:
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.Lfunc_end3:
	.size	GetOneSector, .Lfunc_end3-GetOneSector
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
	bcc	.LBB4_2
; %bb.1:
	ldy	#109
.LBB4_2:
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
	bcc	.LBB4_4
; %bb.3:
	clc
	adc	#104
	bra	.LBB4_5
.LBB4_4:
	clc
	adc	#96
.LBB4_5:
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
.LBB4_6:                                ; =>This Inner Loop Header: Depth=1
	ldx	53378
	bmi	.LBB4_6
; %bb.7:
	lda	53378
	and	#24
	beq	.LBB4_9
; %bb.8:
	ldx	#64
	stx	53376
	rts
.LBB4_9:
	lda	54921
	and	#127
	sta	54921
	rts
.Lfunc_end4:
	.size	PutOneSector, .Lfunc_end4-PutOneSector
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
	sta	__rc3
	ldx	mos8(BAMsector)
	ldy	mos8(BAMsector+1)
	lda	#2
	phy
	ldy	__rc4
	sty	__rc2
	ply
	stx	__rc4
	sty	__rc5
	stz	__rc6
	stz	__rc7
	stz	__rc8
	sta	__rc9
	ldx	__rc10
	lda	#0
	jmp	lcopy
.Lfunc_end5:
	.size	GetBAM, .Lfunc_end5-GetBAM
                                        ; -- End function
	.section	.text.PutBAM,"ax",@progbits
	.type	PutBAM,@function                ; -- Begin function PutBAM
PutBAM:                                 ; @PutBAM
; %bb.0:
	sta	mos8(.LPutBAM_zp_stk+3)         ; 1-byte Folded Spill
	stx	mos8(.LPutBAM_zp_stk)           ; 1-byte Folded Spill
	ldx	mos8(BAMsector)
	ldy	mos8(BAMsector+1)
	stx	__rc2
	sty	__rc3
	ldx	#40
	ldy	#1
	sty	__rc4
	jsr	PutOneSector
	ldy	mos8(BAMsector)
	sty	mos8(.LPutBAM_zp_stk+1)         ; 1-byte Folded Spill
	ldx	mos8(BAMsector+2)
	stx	__rc2
	ldx	mos8(BAMsector+3)
	stx	__rc3
	ldx	mos8(BAMsector+1)
	stx	mos8(.LPutBAM_zp_stk+2)         ; 1-byte Folded Spill
	sty	__rc4
	stx	__rc5
	lda	(__rc4)
	tax
	ldy	#1
	lda	(__rc4),y
	sta	__rc4
	lda	mos8(.LPutBAM_zp_stk+3)         ; 1-byte Folded Reload
	jsr	PutOneSector
	ldx	mos8(.LPutBAM_zp_stk)           ; 1-byte Folded Reload
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
	stx	__rc9
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc8
	ldx	mos8(.LPutBAM_zp_stk+2)         ; 1-byte Folded Reload
	lda	mos8(.LPutBAM_zp_stk+1)         ; 1-byte Folded Reload
	jmp	lcopy
.Lfunc_end6:
	.size	PutBAM, .Lfunc_end6-PutBAM
                                        ; -- End function
	.section	.text.readblockchain,"ax",@progbits
	.type	readblockchain,@function        ; -- Begin function readblockchain
readblockchain:                         ; @readblockchain
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
	ldx	__rc7
	stx	__rc27
	ldx	__rc8
	stx	__rc29
	jsr	_miniInit
	lda	__rc27
	ldx	#0
	ldy	#0
.LBB7_1:                                ; =>This Inner Loop Header: Depth=1
	cpy	__rc23
	bne	.LBB7_3
; %bb.2:                                ;   in Loop: Header=BB7_1 Depth=1
	cpx	__rc22
	bne	.LBB7_3
; %bb.9:
	jmp	.LBB7_6
.LBB7_3:                                ;   in Loop: Header=BB7_1 Depth=1
	sty	__rc28
	stx	__rc27
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
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
	ldx	mos8(worksector.0)
	stx	__rc10
	ldx	mos8(worksector.0+1)
	ldy	6144
	sty	__rc30
	ldy	6145
	sty	__rc29
	sta	__rc7
	stz	__rc2
	stz	__rc3
	stz	__rc8
	lda	#1
	sta	__rc9
	lda	__rc10
	jsr	lcopy
	lda	__rc30
	ldy	__rc28
	ldx	__rc27
	inx
	bne	.LBB7_5
; %bb.4:                                ;   in Loop: Header=BB7_1 Depth=1
	iny
.LBB7_5:                                ;   in Loop: Header=BB7_1 Depth=1
	inc	__rc30
	dec	__rc30
	beq	.LBB7_8
; %bb.11:                               ;   in Loop: Header=BB7_1 Depth=1
	jmp	.LBB7_1
.LBB7_6:
	tax
	beq	.LBB7_8
; %bb.7:
	lda	#0
	ldx	#mos16lo(.L.str.11)
	stx	__rc2
	ldx	#mos16hi(.L.str.11)
	stx	__rc3
	ldx	#mos16lo(.L.str.12)
	stx	__rc4
	ldx	#mos16hi(.L.str.12)
	stx	__rc5
	ldx	#mos16lo(.L.str.29)
	stx	__rc6
	ldx	#mos16hi(.L.str.29)
	stx	__rc7
	jsr	messagebox
.LBB7_8:
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
.Lfunc_end7:
	.size	readblockchain, .Lfunc_end7-readblockchain
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
	bcc	.LBB8_2
; %bb.1:
	ldy	__rc4
	sty	__rc20
	ldy	__rc5
	sty	__rc21
	clc
	adc	#216
	tay
	bra	.LBB8_3
.LBB8_2:
	lda	__rc2
	sta	__rc20
	lda	__rc3
	sta	__rc21
.LBB8_3:
	dey
	sty	__rc5
	lda	__rc6
	beq	.LBB8_6
; %bb.4:
	stx	mos8(.LBAMSectorUpdate_zp_stk)
	cpx	#8
	bcs	.LBB8_8
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
	jmp	.LBB8_21
.LBB8_6:
	stx	mos8(.LBAMSectorUpdate_zp_stk)
	cpx	#8
	bcc	.LBB8_7
; %bb.41:
	jmp	.LBB8_10
.LBB8_7:
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
	jmp	.LBB8_23
.LBB8_8:
	cpx	#16
	ldx	#0
	bcc	.LBB8_9
; %bb.43:
	jmp	.LBB8_12
.LBB8_9:
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
	jmp	.LBB8_21
.LBB8_10:
	cpx	#16
	bcc	.LBB8_11
; %bb.45:
	jmp	.LBB8_14
.LBB8_11:
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
	jmp	.LBB8_23
.LBB8_12:
	ldy	mos8(.LBAMSectorUpdate_zp_stk)
	cpy	#24
	bcc	.LBB8_13
; %bb.47:
	jmp	.LBB8_16
.LBB8_13:
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
	jmp	.LBB8_21
.LBB8_14:
	cpx	#24
	bcc	.LBB8_15
; %bb.49:
	jmp	.LBB8_18
.LBB8_15:
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
	jmp	.LBB8_23
.LBB8_16:
	ldy	mos8(.LBAMSectorUpdate_zp_stk)
	cpy	#32
	bcc	.LBB8_17
; %bb.51:
	jmp	.LBB8_20
.LBB8_17:
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
	jmp	.LBB8_21
.LBB8_18:
	cpx	#32
	bcc	.LBB8_19
; %bb.53:
	jmp	.LBB8_22
.LBB8_19:
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
	jmp	.LBB8_23
.LBB8_20:
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
.LBB8_21:
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
	bra	.LBB8_24
.LBB8_22:
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
.LBB8_23:
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
.LBB8_24:
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
.Lfunc_end8:
	.size	BAMSectorUpdate, .Lfunc_end8-BAMSectorUpdate
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
.LBB9_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_19 Depth 2
	cpx	#80
	bne	.LBB9_2
; %bb.30:
	jmp	.LBB9_25
.LBB9_2:                                ;   in Loop: Header=BB9_1 Depth=1
	stx	mos8(.LfindnextBAMtracksector_zp_stk+5)
	lda	.L__const.findnextBAMtracksector.strategy,x
	tax
	lda	mos8(.LfindnextBAMtracksector_zp_stk+2)
	beq	.LBB9_4
; %bb.3:                                ;   in Loop: Header=BB9_1 Depth=1
	inx
.LBB9_4:                                ;   in Loop: Header=BB9_1 Depth=1
	cpx	#80
	ldy	#mos8(BAMsector)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	stz	mos8(.LfindnextBAMtracksector_zp_stk)
	stz	__rc4
	bcs	.LBB9_8
; %bb.5:                                ;   in Loop: Header=BB9_1 Depth=1
	cpx	#40
	bcs	.LBB9_7
; %bb.6:                                ;   in Loop: Header=BB9_1 Depth=1
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
	stx	__rc4
	bra	.LBB9_8
.LBB9_7:                                ;   in Loop: Header=BB9_1 Depth=1
	ldy	#mos8(BAMsector+2)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	clc
	txa
	adc	#216
	sta	__rc4
	stx	mos8(.LfindnextBAMtracksector_zp_stk)
.LBB9_8:                                ;   in Loop: Header=BB9_1 Depth=1
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
	ldx	#0
; %bb.26:                               ;   in Loop: Header=BB9_1 Depth=1
	jmp	.LBB9_19
.LBB9_9:                                ;   in Loop: Header=BB9_19 Depth=2
	cpx	#16
	bcs	.LBB9_11
; %bb.10:                               ;   in Loop: Header=BB9_19 Depth=2
	stx	mos8(.LfindnextBAMtracksector_zp_stk+4)
	ldy	#18
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	txa
	adc	#248
	bra	.LBB9_16
.LBB9_11:                               ;   in Loop: Header=BB9_19 Depth=2
	cpx	#24
	bcs	.LBB9_13
; %bb.12:                               ;   in Loop: Header=BB9_19 Depth=2
	stx	mos8(.LfindnextBAMtracksector_zp_stk+4)
	ldy	#19
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	txa
	adc	#240
	bra	.LBB9_16
.LBB9_13:                               ;   in Loop: Header=BB9_19 Depth=2
	cpx	#32
	stx	mos8(.LfindnextBAMtracksector_zp_stk+4)
	bcs	.LBB9_15
; %bb.14:                               ;   in Loop: Header=BB9_19 Depth=2
	ldy	#20
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	txa
	adc	#232
	bra	.LBB9_16
.LBB9_15:                               ;   in Loop: Header=BB9_19 Depth=2
	ldy	#21
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	clc
	txa
	adc	#224
.LBB9_16:                               ;   in Loop: Header=BB9_19 Depth=2
	sta	__rc2
.LBB9_17:                               ;   in Loop: Header=BB9_19 Depth=2
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	and	mos8(.LfindnextBAMtracksector_zp_stk+3)
	bne	.LBB9_23
; %bb.18:                               ;   in Loop: Header=BB9_19 Depth=2
	inc	mos8(.LfindnextBAMtracksector_zp_stk+4)
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+4)
.LBB9_19:                               ;   Parent Loop BB9_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cpx	#40
	beq	.LBB9_22
; %bb.20:                               ;   in Loop: Header=BB9_19 Depth=2
	cpx	#8
	bcc	.LBB9_21
; %bb.32:                               ;   in Loop: Header=BB9_19 Depth=2
	jmp	.LBB9_9
.LBB9_21:                               ;   in Loop: Header=BB9_19 Depth=2
	stx	mos8(.LfindnextBAMtracksector_zp_stk+4)
	ldy	#17
	lda	(__rc28),y
	sta	mos8(.LfindnextBAMtracksector_zp_stk+3)
	stx	__rc2
	bra	.LBB9_17
.LBB9_22:                               ;   in Loop: Header=BB9_1 Depth=1
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+5)
	inx
; %bb.28:                               ;   in Loop: Header=BB9_1 Depth=1
	jmp	.LBB9_1
.LBB9_23:
	ldx	mos8(BAMsector)
	stx	__rc2
	ldx	mos8(BAMsector+1)
	stx	__rc3
	ldx	mos8(BAMsector+2)
	stx	__rc4
	ldx	mos8(BAMsector+3)
	stx	__rc5
	ldx	#1
	inc	mos8(.LfindnextBAMtracksector_zp_stk)
	stx	__rc6
	ldx	mos8(.LfindnextBAMtracksector_zp_stk+4)
	ldy	mos8(.LfindnextBAMtracksector_zp_stk)
	sty	mos8(.LfindnextBAMtracksector_zp_stk+6) ; 1-byte Folded Spill
	lda	mos8(.LfindnextBAMtracksector_zp_stk)
	jsr	BAMSectorUpdate
.LBB9_24:
	lda	mos8(.LfindnextBAMtracksector_zp_stk+6) ; 1-byte Folded Reload
	sta	(__rc26)
	lda	mos8(.LfindnextBAMtracksector_zp_stk+4)
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
.LBB9_25:
	ldx	#255
	stx	mos8(.LfindnextBAMtracksector_zp_stk+6) ; 1-byte Folded Spill
	stz	mos8(.LfindnextBAMtracksector_zp_stk+4)
	bra	.LBB9_24
.Lfunc_end9:
	.size	findnextBAMtracksector, .Lfunc_end9-findnextBAMtracksector
                                        ; -- End function
	.section	.text.getdirententry,"ax",@progbits
	.type	getdirententry,@function        ; -- Begin function getdirententry
getdirententry:                         ; @getdirententry
; %bb.0:
	sta	mos8(.Lgetdirententry_zp_stk)
	stx	mos8(.Lgetdirententry_zp_stk+1)
	ldx	#0
	stx	mos8(.Lgetdirententry_zp_stk+4)
	ldx	#0
	stx	mos8(.Lgetdirententry_zp_stk+5)
	jsr	_miniInit
	ldx	mos8(direntryblock.0)
	ldy	mos8(direntryblock.0+1)
	stx	mos8(.Lgetdirententry_zp_stk+7)
	stx	mos8(.Lgetdirententry_zp_stk+2)
	sty	mos8(.Lgetdirententry_zp_stk+8)
	sty	mos8(.Lgetdirententry_zp_stk+3)
	ldx	#14
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#0
	lda	mos8(.Lgetdirententry_zp_stk)
	jsr	__mulsi3
	sta	mos8(.Lgetdirententry_zp_stk)
	stx	mos8(.Lgetdirententry_zp_stk+6)
	ldx	__rc2
	stx	mos8(.Lgetdirententry_zp_stk+9)
	lda	__rc3
	ldx	#8
	stx	mos8(.Lgetdirententry_zp_stk+12) ; 1-byte Folded Spill
	ora	#8
	sta	mos8(.Lgetdirententry_zp_stk+10)
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
	ldy	mos8(.Lgetdirententry_zp_stk+12) ; 1-byte Folded Reload
	sty	__rc2
	ldy	__rc3
	cpy	__rc2
	bcc	.LBB10_4
; %bb.13:
	jmp	.LBB10_12
.LBB10_3:                               ;   in Loop: Header=BB10_1 Depth=1
	sta	__rc2
	cpx	__rc2
	bcc	.LBB10_4
; %bb.15:
	jmp	.LBB10_12
.LBB10_4:                               ;   in Loop: Header=BB10_1 Depth=1
	sta	mos8(.Lgetdirententry_zp_stk+11)
	sty	mos8(.Lgetdirententry_zp_stk+4)
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
	adc	mos8(.Lgetdirententry_zp_stk)
	sta	__rc11
	lda	__rc2
	adc	mos8(.Lgetdirententry_zp_stk+6)
	sta	__rc10
	lda	mos8(.Lgetdirententry_zp_stk+9)
	adc	#0
	sta	__rc2
	lda	mos8(.Lgetdirententry_zp_stk+10)
	adc	#0
	sta	__rc3
	ldx	mos8(.Lgetdirententry_zp_stk+7)
	stx	__rc4
	ldx	mos8(.Lgetdirententry_zp_stk+8)
	stx	__rc5
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
	lda	mos8(.Lgetdirententry_zp_stk+12) ; 1-byte Folded Reload
	adc	#8
	sta	mos8(.Lgetdirententry_zp_stk+12) ; 1-byte Folded Spill
	lda	mos8(.Lgetdirententry_zp_stk+11)
	adc	#0
	bra	.LBB10_8
.LBB10_7:                               ;   in Loop: Header=BB10_1 Depth=1
	lda	mos8(.Lgetdirententry_zp_stk+11)
.LBB10_8:                               ;   in Loop: Header=BB10_1 Depth=1
	ldy	mos8(.Lgetdirententry_zp_stk+4)
	ldx	mos8(.Lgetdirententry_zp_stk+4)
	inx
	pha
	lda	#0
	sta	mos8(.Lgetdirententry_zp_stk+4)
	lda	#0
	sta	mos8(.Lgetdirententry_zp_stk+5)
	pla
	cpy	mos8(.Lgetdirententry_zp_stk+1)
	beq	.LBB10_9
; %bb.17:                               ;   in Loop: Header=BB10_1 Depth=1
	jmp	.LBB10_1
.LBB10_9:
	ldx	mos8(.Lgetdirententry_zp_stk+2)
	stx	mos8(.Lgetdirententry_zp_stk+4)
	ldx	mos8(.Lgetdirententry_zp_stk+3)
	bra	.LBB10_11
.LBB10_10:
	ldx	#0
	stx	mos8(.Lgetdirententry_zp_stk+4)
	ldx	#0
.LBB10_11:
	stx	mos8(.Lgetdirententry_zp_stk+5)
.LBB10_12:
	ldx	mos8(.Lgetdirententry_zp_stk+4)
	stx	__rc2
	ldx	mos8(.Lgetdirententry_zp_stk+5)
	stx	__rc3
	rts
.Lfunc_end10:
	.size	getdirententry, .Lfunc_end10-getdirententry
                                        ; -- End function
	.section	.text.getdirent,"ax",@progbits
	.type	getdirent,@function             ; -- Begin function getdirent
getdirent:                              ; @getdirent
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#255
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
	ldy	#0
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	__rc22
	stx	__rc21
	jsr	_miniInit
	stz	__rc20
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
	sta	__rc16
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
	lda	__rc16
	rts
.Lfunc_end11:
	.size	getdirent, .Lfunc_end11-getdirent
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
	ldy	.Lswitch.table.asciitoscreencode,x
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
	stx	.Lmprintf_sstk                  ; 1-byte Folded Spill
	ldx	__rc4
	stx	.Lmprintf_sstk+1                ; 1-byte Folded Spill
	ldx	__rc5
	stx	.Lmprintf_sstk+2                ; 1-byte Folded Spill
	jsr	asciitoscreencode_s
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	jsr	cputs
	stz	__rc4
	ldx	.Lmprintf_sstk+1                ; 1-byte Folded Reload
	stx	__rc2
	ldx	.Lmprintf_sstk+2                ; 1-byte Folded Reload
	stx	__rc3
	ldx	.Lmprintf_sstk                  ; 1-byte Folded Reload
	lda	mos8(.Lmprintf_zp_stk)          ; 1-byte Folded Reload
	jmp	csputdec
.Lfunc_end17:
	.size	mprintf, .Lfunc_end17-mprintf
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
.Lfunc_end18:
	.size	mcputsxy, .Lfunc_end18-mcputsxy
                                        ; -- End function
	.section	.text.mcbox,"ax",@progbits
	.type	mcbox,@function                 ; -- Begin function mcbox
mcbox:                                  ; @mcbox
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
	sta	__rc5
	stx	__rc23
	ldx	__rc4
	stx	__rc20
	ldx	__rc2
	ldy	__rc3
	sty	__rc22
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	clc
	lda	__rc0
	adc	#5
	sta	__rc2
	lda	__rc1
	adc	#0
	sta	__rc3
	ldy	#1
	lda	__rc23
	sta	(__rc2),y
	iny
	txa
	sta	(__rc2),y
	stx	__rc25
	iny
	lda	__rc22
	sta	(__rc2),y
	sec
	ldy	__rc5
	sty	__rc4
	txa
	sbc	__rc4
	sta	__rc26
	lda	__rc5
	sta	(__rc2)
	sta	__rc24
	jsr	fillrect
	ldx	#112
	stx	__rc2
	ldx	__rc23
	lda	__rc24
	jsr	cputcxy
	ldx	#109
	stx	__rc2
	ldx	__rc22
	ldy	__rc24
	sty	__rc21
	lda	__rc24
	jsr	cputcxy
	ldx	#110
	stx	__rc2
	ldx	__rc23
	lda	__rc25
	jsr	cputcxy
	ldx	#125
	stx	__rc2
	ldx	__rc22
	ldy	__rc25
	sty	__rc24
	lda	__rc25
	jsr	cputcxy
	ldx	__rc26
	cpx	#2
	bcs	.LBB19_2
; %bb.1:
	ldx	#1
.LBB19_2:
	ldy	__rc21
	sty	__rc25
	bra	.LBB19_4
.LBB19_3:                               ;   in Loop: Header=BB19_4 Depth=1
	inc	__rc21
	ldy	#64
	sty	__rc2
	stx	__rc27
	ldx	__rc23
	lda	__rc21
	jsr	cputcxy
	ldx	#64
	stx	__rc2
	ldx	__rc22
	lda	__rc21
	jsr	cputcxy
	ldx	__rc27
	ldy	__rc25
.LBB19_4:                               ; =>This Inner Loop Header: Depth=1
	dex
	bne	.LBB19_3
; %bb.5:
	ldx	__rc23
	inx
	stx	__rc23
	bra	.LBB19_7
.LBB19_6:                               ;   in Loop: Header=BB19_7 Depth=1
	ldy	#93
	sty	__rc2
	stx	__rc21
	lda	__rc25
	jsr	cputcxy
	ldx	#93
	stx	__rc2
	ldx	__rc21
	lda	__rc24
	jsr	cputcxy
	ldx	__rc21
	ldy	__rc25
	inx
.LBB19_7:                               ; =>This Inner Loop Header: Depth=1
	cpx	__rc22
	bcc	.LBB19_6
; %bb.8:
	lda	__rc20
	bne	.LBB19_9
; %bb.19:
	jmp	.LBB19_18
.LBB19_9:
	ldx	__rc22
	cpx	mos8(g_curScreenH)
	bcc	.LBB19_10
; %bb.21:
	jmp	.LBB19_18
.LBB19_10:
	ldx	mos8(g_curScreenW)
	stx	__rc2
	ldx	__rc24
	cpx	__rc2
	bcc	.LBB19_11
; %bb.23:
	jmp	.LBB19_18
.LBB19_11:
	stz	__rc3
	ldx	#0
	sty	__rc20
	lda	__rc22
	inc
	bne	.LBB19_13
; %bb.12:
	inx
.LBB19_13:
	stx	__rc22
	ldy	#4
	sta	(__rc0),y                       ; 1-byte Folded Spill
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	stz	__rc6
	clc
	lda	__rc20
	adc	__rc2
	sta	__rc2
	lda	#0
	adc	__rc3
	sta	__rc4
	lda	#0
	adc	#0
	tax
	lda	#0
	adc	#0
	sta	__rc3
	clc
	lda	__rc2
	adc	#1
	tay
	lda	__rc4
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
	ldx	__rc7
	tya
	jsr	lfill
	ldx	__rc24
	stx	__rc21
	inc	__rc21
	ldx	__rc23
	stx	__rc20
	stz	__rc23
	bra	.LBB19_16
.LBB19_14:                              ;   in Loop: Header=BB19_16 Depth=1
	cpy	#0
	bcc	.LBB19_18
.LBB19_15:                              ;   in Loop: Header=BB19_16 Depth=1
	sty	__rc22
	lda	mos8(g_curScreenW)
	ldx	__rc20
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	__rc21
	tay
	txa
	adc	__rc23
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
	inc	__rc20
.LBB19_16:                              ; =>This Inner Loop Header: Depth=1
	ldy	__rc22
	bne	.LBB19_14
; %bb.17:                               ;   in Loop: Header=BB19_16 Depth=1
	phy
	ldy	#4
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	cmp	__rc20
	bcs	.LBB19_15
.LBB19_18:
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
	adc	#9
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end19:
	.size	mcbox, .Lfunc_end19-mcbox
                                        ; -- End function
	.section	.text.messagebox,"ax",@progbits
	.type	messagebox,@function            ; -- Begin function messagebox
messagebox:                             ; @messagebox
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#253
	sta	__rc0
	lda	__rc1
	adc	#255
	sta	__rc1
	pla
	ldx	__rc20
	phx
	ldx	__rc22
	phx
	ldx	__rc23
	phx
	ldx	__rc24
	phx
	pha
	lda	__rc25
	ldy	#2
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc26
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc27
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	__rc20
	ldx	__rc2
	stx	__rc26
	ldx	__rc3
	stx	__rc27
	ldx	__rc4
	stx	__rc24
	ldx	__rc5
	stx	__rc25
	ldx	__rc6
	stx	__rc22
	ldx	__rc7
	stx	__rc23
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
	lda	#14
	ldx	#mos16lo(.L.str.30)
	stx	__rc2
	ldx	#mos16hi(.L.str.30)
	stx	__rc3
	ldx	#4
	jsr	mcputsxy
	lda	#40
	ldx	#mos16lo(.L.str.1.31)
	stx	__rc2
	ldx	#mos16hi(.L.str.1.31)
	stx	__rc3
	ldx	#4
	jsr	mcputsxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#6
	ldy	__rc26
	sty	__rc2
	ldy	__rc27
	sty	__rc3
	lda	#12
	jsr	mcputsxy
	ldx	#7
	ldy	__rc24
	sty	__rc2
	ldy	__rc25
	sty	__rc3
	lda	#12
	jsr	mcputsxy
	ldx	#8
	ldy	__rc22
	sty	__rc2
	ldy	__rc23
	sty	__rc3
	lda	#12
	jsr	mcputsxy
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.2.32)
	stx	__rc2
	ldx	#mos16hi(.L.str.2.32)
	stx	__rc3
	ldx	#10
	lda	#12
	jsr	mcputsxy
	lda	#60
	ldx	#mos16lo(.L.str.3.33)
	stx	__rc2
	ldx	#mos16hi(.L.str.3.33)
	stx	__rc3
	ldx	#10
	jsr	mcputsxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	lda	__rc20
	beq	.LBB20_3
; %bb.1:
	lda	#2
	ldx	#mos16lo(.L.str.4.34)
	stx	__rc2
	ldx	#mos16hi(.L.str.4.34)
	stx	__rc3
	ldx	#23
	jsr	mcputsxy
	lda	#58
	ldx	#mos16lo(.L.str.5.35)
	stx	__rc2
	ldx	#mos16hi(.L.str.5.35)
	stx	__rc3
	ldx	#23
	jsr	mcputsxy
	bra	.LBB20_3
.LBB20_2:                               ;   in Loop: Header=BB20_3 Depth=1
	ldx	#mos16lo(.L.str.25)
	stx	__rc2
	ldx	#mos16hi(.L.str.25)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	lda	#32
	jsr	cputc
.LBB20_3:                               ; =>This Inner Loop Header: Depth=1
	jsr	cgetc
	cmp	#3
	beq	.LBB20_6
; %bb.4:                                ;   in Loop: Header=BB20_3 Depth=1
	cmp	#13
	beq	.LBB20_7
; %bb.5:                                ;   in Loop: Header=BB20_3 Depth=1
	cmp	#27
	bne	.LBB20_2
.LBB20_6:
	lda	#0
	bra	.LBB20_8
.LBB20_7:
	lda	#1
.LBB20_8:
	sta	__rc16
	ldy	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc27
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc26
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
	plx
	stx	__rc24
	plx
	stx	__rc23
	plx
	stx	__rc22
	plx
	stx	__rc20
	clc
	lda	__rc0
	adc	#3
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.Lfunc_end20:
	.size	messagebox, .Lfunc_end20-messagebox
                                        ; -- End function
	.section	.text.progress,"ax",@progbits
	.type	progress,@function              ; -- Begin function progress
progress:                               ; @progress
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
	ldy	#1
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc25
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	__rc20
	ldx	__rc2
	stx	__rc22
	ldx	__rc3
	stx	__rc23
	ldx	__rc4
	stx	__rc24
	ldx	__rc5
	stx	__rc25
	ldx	#mos16lo(.L__const.progress.rc)
	stx	__rc2
	ldx	#mos16hi(.L__const.progress.rc)
	stx	__rc3
	jsr	fillrect
	ldx	#6
	ldy	__rc22
	sty	__rc2
	ldy	__rc23
	sty	__rc3
	lda	#12
	jsr	mcputsxy
	ldx	#7
	ldy	__rc24
	sty	__rc2
	ldy	__rc25
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
	bra	.LBB21_5
.LBB21_1:                               ;   in Loop: Header=BB21_5 Depth=1
	lda	#1
.LBB21_2:                               ;   in Loop: Header=BB21_5 Depth=1
	ldx	#160
	and	#1
	bne	.LBB21_4
; %bb.3:                                ;   in Loop: Header=BB21_5 Depth=1
	ldx	#123
.LBB21_4:                               ;   in Loop: Header=BB21_5 Depth=1
	txa
	jsr	cputc
	ldx	__rc22
	inx
.LBB21_5:                               ; =>This Inner Loop Header: Depth=1
	cpx	#50
	beq	.LBB21_8
; %bb.6:                                ;   in Loop: Header=BB21_5 Depth=1
	stx	__rc22
	cpx	__rc21
	bcc	.LBB21_1
; %bb.7:                                ;   in Loop: Header=BB21_5 Depth=1
	lda	#0
	bra	.LBB21_2
.LBB21_8:
	lda	#101
	jsr	cputc
	ldx	#mos16lo(.L.str.29)
	stx	__rc2
	ldx	#mos16hi(.L.str.29)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc20
	jsr	mprintf
	lda	#37
	jsr	cputc
	lda	#12
	ldx	#mos16lo(.L.str.8.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.8.36)
	stx	__rc3
	ldx	#10
	jsr	mcputsxy
	lda	#60
	ldx	#mos16lo(.L.str.8.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.8.36)
	stx	__rc3
	ldx	#10
	jsr	mcputsxy
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
.Lfunc_end21:
	.size	progress, .Lfunc_end21-progress
                                        ; -- End function
	.section	.text.UpdateSectors,"ax",@progbits
	.type	UpdateSectors,@function         ; -- Begin function UpdateSectors
UpdateSectors:                          ; @UpdateSectors
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
	sta	__rc29
	stx	__rc21
	txa
	asl
	stz	__rc2
	rol	__rc2
	sta	__rc3
	lda	#mos16lo(midnight)
	clc
	adc	__rc3
	tax
	lda	#mos16hi(midnight)
	adc	__rc2
	stx	__rc2
	sta	__rc3
	lda	(__rc2)
	iny
	sta	__rc28
	sta	__rc22
	lda	(__rc2),y
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc23
	lda	(__rc22)
	sta	__rc20
	ldx	#17
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc21
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	#mos16lo(diskname)
	clc
	adc	__rc2
	sta	__rc24
	lda	#mos16hi(diskname)
	adc	__rc3
	sta	__rc25
	jsr	_miniInit
	ldx	mos8(BAMsector)
	ldy	mos8(BAMsector+1)
	stx	__rc2
	sty	__rc3
	ldx	#40
	stz	__rc4
	lda	__rc20
	jsr	GetOneSector
	ldx	mos8(BAMsector)
	ldy	#0
	lda	mos8(BAMsector+1)
	sta	__rc5
	bra	.LBB22_2
.LBB22_1:                               ;   in Loop: Header=BB22_2 Depth=1
	sta	(__rc24),y
	iny
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	sty	__rc2
	txa
	clc
	adc	__rc2
	sta	__rc2
	lda	__rc5
	adc	#0
	sta	__rc3
	sty	__rc4
	ldy	#4
	lda	(__rc2),y
	ldy	__rc4
	cmp	#160
	beq	.LBB22_4
; %bb.3:                                ;   in Loop: Header=BB22_2 Depth=1
	cpy	#16
	bcc	.LBB22_1
.LBB22_4:
	lda	#0
	sta	(__rc24),y
	jsr	_miniInit
	lda	__rc21
	beq	.LBB22_6
; %bb.5:
	ldx	#30
	bra	.LBB22_7
.LBB22_6:
	ldx	#28
.LBB22_7:
	stz	__rc5
	lda	#40
	ldy	#8
	sty	__rc3
	ldy	#2
	sty	__rc4
	sta	__rc7
	stz	__rc2
	ldy	__rc29
	sty	__rc6
	ldy	#1
	sty	__rc8
	lda	#0
	jsr	readblockchain
	lda	__rc21
	jsr	GetBAM
	ldx	mos8(BAMsector)
	ldy	mos8(BAMsector+1)
	stx	__rc26
	sty	__rc27
	ldx	mos8(BAMsector+2)
	ldy	mos8(BAMsector+3)
	stx	__rc24
	sty	__rc25
	ldx	#0
	stz	__rc31
	stz	__rc30
	bra	.LBB22_11
.LBB22_8:                               ;   in Loop: Header=BB22_11 Depth=1
	clc
	adc	#216
	ldy	__rc24
	sty	__rc26
	ldy	__rc25
	sty	__rc27
.LBB22_9:                               ;   in Loop: Header=BB22_11 Depth=1
	stx	__rc20
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	stx	__rc2
	ldx	__rc20
	clc
	adc	__rc26
	tay
	lda	__rc2
	adc	__rc27
	sty	__rc2
	sta	__rc3
	clc
	lda	__rc31
	ldy	#16
	adc	(__rc2),y
	sta	__rc31
	lda	__rc30
	adc	#0
	sta	__rc30
.LBB22_10:                              ;   in Loop: Header=BB22_11 Depth=1
	inx
.LBB22_11:                              ; =>This Inner Loop Header: Depth=1
	cpx	#80
	beq	.LBB22_14
; %bb.12:                               ;   in Loop: Header=BB22_11 Depth=1
	txa
	cpx	#40
	bcs	.LBB22_8
; %bb.13:                               ;   in Loop: Header=BB22_11 Depth=1
	cpx	#39
	bne	.LBB22_9
	bra	.LBB22_10
.LBB22_14:
	clc
	lda	__rc28
	adc	#68
	tax
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#0
	stx	__rc2
	sta	__rc3
	ldy	#68
	lda	__rc31
	sta	(__rc22),y
	ldy	#1
	lda	__rc30
	sta	(__rc2),y
	ldx	__rc21
	lda	__rc29
	jsr	getdirent
	ldy	#2
	sta	(__rc22),y
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
.Lfunc_end22:
	.size	UpdateSectors, .Lfunc_end22-UpdateSectors
                                        ; -- End function
	.section	.text.flushkeybuf,"ax",@progbits
	.type	flushkeybuf,@function           ; -- Begin function flushkeybuf
flushkeybuf:                            ; @flushkeybuf
; %bb.0:
	bra	.LBB23_2
.LBB23_1:                               ;   in Loop: Header=BB23_2 Depth=1
	stz	54800
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	bne	.LBB23_1
; %bb.3:
	rts
.Lfunc_end23:
	.size	flushkeybuf, .Lfunc_end23-flushkeybuf
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end24:
	.size	escNOP, .Lfunc_end24-escNOP
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
.Lfunc_end25:
	.size	getscreenaddr, .Lfunc_end25-getscreenaddr
                                        ; -- End function
	.section	.text.cputc,"ax",@progbits
	.type	cputc,@function                 ; -- Begin function cputc
cputc:                                  ; @cputc
; %bb.0:
	sta	__rc2
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputcxy
.Lfunc_end26:
	.size	cputc, .Lfunc_end26-cputc
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
	bne	.LBB27_2
; %bb.1:
	dec	__rc20
.LBB27_2:
	lda	__rc20
	bne	.LBB27_5
; %bb.3:
	ldy	__rc23
	cpx	__rc22
	bne	.LBB27_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB27_7
.LBB27_5:
	ldy	__rc23
.LBB27_6:
	ldx	__rc22
	inx
.LBB27_7:
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
.Lfunc_end27:
	.size	cputcxy, .Lfunc_end27-cputcxy
                                        ; -- End function
	.section	.text.cputs,"ax",@progbits
	.type	cputs,@function                 ; -- Begin function cputs
cputs:                                  ; @cputs
; %bb.0:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end28:
	.size	cputs, .Lfunc_end28-cputs
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
.Lfunc_end29:
	.size	cputsxy, .Lfunc_end29-cputsxy
                                        ; -- End function
	.section	.text.fillrect,"ax",@progbits
	.type	fillrect,@function              ; -- Begin function fillrect
fillrect:                               ; @fillrect
; %bb.0:
	ldx	__rc20
	phx
	ldx	__rc21
	phx
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	ldy	#1
	lda	(__rc2),y
	iny
	sta	mos8(.Lfillrect_zp_stk)
	lda	(__rc2),y
	sec
	sbc	(__rc2)
	sta	mos8(.Lfillrect_zp_stk+2)
; %bb.4:
	jmp	.LBB30_2
.LBB30_1:                               ;   in Loop: Header=BB30_2 Depth=1
	lda	mos8(g_curScreenW)
	ldx	mos8(.Lfillrect_zp_stk)
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	(__rc20)
	sta	mos8(.Lfillrect_zp_stk+3)
	txa
	adc	#0
	sta	mos8(.Lfillrect_zp_stk+4)
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
	lda	mos8(.Lfillrect_zp_stk+3)
	adc	#0
	tax
	lda	mos8(.Lfillrect_zp_stk+4)
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
	ldx	mos8(.Lfillrect_zp_stk+2)
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
	ldx	mos8(.Lfillrect_zp_stk+2)
	stx	__rc5
	stz	__rc6
	ldx	mos8(.Lfillrect_zp_stk+4)
	lda	mos8(.Lfillrect_zp_stk+3)
	jsr	lfill
	inc	mos8(.Lfillrect_zp_stk)
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	ldy	#3
	lda	(__rc20),y
	cmp	mos8(.Lfillrect_zp_stk)
	bcc	.LBB30_3
; %bb.6:                                ;   in Loop: Header=BB30_2 Depth=1
	jmp	.LBB30_1
.LBB30_3:
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.Lfunc_end30:
	.size	fillrect, .Lfunc_end30-fillrect
                                        ; -- End function
	.section	.text.cgetc,"ax",@progbits
	.type	cgetc,@function                 ; -- Begin function cgetc
cgetc:                                  ; @cgetc
; %bb.0:
.LBB31_1:                               ; =>This Inner Loop Header: Depth=1
	lda	54800
	beq	.LBB31_1
; %bb.2:
	stz	54800
	rts
.Lfunc_end31:
	.size	cgetc, .Lfunc_end31-cgetc
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
.Lfunc_end32:
	.size	do_dma, .Lfunc_end32-do_dma
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
.Lfunc_end33:
	.size	lcopy, .Lfunc_end33-lcopy
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
.Lfunc_end34:
	.size	lfill, .Lfunc_end34-lfill
                                        ; -- End function
	.section	.text.strcpy,"ax",@progbits
	.type	strcpy,@function                ; -- Begin function strcpy
strcpy:                                 ; @strcpy
; %bb.0:
	lda	(__rc4)
	sta	(__rc2)
	lda	(__rc4)
	beq	.LBB35_7
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
.LBB35_2:                               ; =>This Inner Loop Header: Depth=1
	inc	__rc8
	bne	.LBB35_4
; %bb.3:                                ;   in Loop: Header=BB35_2 Depth=1
	inc	__rc9
.LBB35_4:                               ;   in Loop: Header=BB35_2 Depth=1
	lda	(__rc4),y
	sta	(__rc6),y
	lda	(__rc4),y
	inc	__rc6
	bne	.LBB35_6
; %bb.5:                                ;   in Loop: Header=BB35_2 Depth=1
	inc	__rc7
.LBB35_6:                               ;   in Loop: Header=BB35_2 Depth=1
	ldx	__rc8
	stx	__rc4
	ldx	__rc9
	stx	__rc5
	tax
	bne	.LBB35_2
.LBB35_7:
	rts
.Lfunc_end35:
	.size	strcpy, .Lfunc_end35-strcpy
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB36_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB36_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB36_4
; %bb.3:                                ;   in Loop: Header=BB36_2 Depth=1
	inx
.LBB36_4:                               ;   in Loop: Header=BB36_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB36_2
	bra	.LBB36_6
.LBB36_5:
	stz	__rc4
	ldx	#0
.LBB36_6:
	lda	__rc4
	rts
.Lfunc_end36:
	.size	strlen, .Lfunc_end36-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB37_2
.LBB37_1:                               ;   in Loop: Header=BB37_2 Depth=1
	dex
	asl
.LBB37_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB37_1
; %bb.3:
	rts
.Lfunc_end37:
	.size	__ashlqi3, .Lfunc_end37-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB38_3
; %bb.1:
	ldx	__rc2
.LBB38_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB38_2
.LBB38_3:
	ldx	__rc3
	rts
.Lfunc_end38:
	.size	__ashlhi3, .Lfunc_end38-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB39_3
; %bb.1:
	ldx	__rc4
.LBB39_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB39_2
.LBB39_3:
	ldx	__rc5
	rts
.Lfunc_end39:
	.size	__ashlsi3, .Lfunc_end39-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB40_3
; %bb.1:
	ldx	__rc8
.LBB40_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB40_2
.LBB40_3:
	ldx	__rc9
	rts
.Lfunc_end40:
	.size	__ashldi3, .Lfunc_end40-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB41_2
.LBB41_1:                               ;   in Loop: Header=BB41_2 Depth=1
	dex
	lsr
.LBB41_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB41_1
; %bb.3:
	rts
.Lfunc_end41:
	.size	__lshrqi3, .Lfunc_end41-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB42_3
; %bb.1:
	ldx	__rc2
.LBB42_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB42_2
.LBB42_3:
	ldx	__rc3
	rts
.Lfunc_end42:
	.size	__lshrhi3, .Lfunc_end42-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB43_3
; %bb.1:
	ldx	__rc4
.LBB43_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB43_2
.LBB43_3:
	ldx	__rc5
	rts
.Lfunc_end43:
	.size	__lshrsi3, .Lfunc_end43-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB44_3
; %bb.1:
	ldx	__rc8
.LBB44_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB44_2
.LBB44_3:
	ldx	__rc9
	rts
.Lfunc_end44:
	.size	__lshrdi3, .Lfunc_end44-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB45_2
.LBB45_1:                               ;   in Loop: Header=BB45_2 Depth=1
	dex
	cmp	#128
	ror
.LBB45_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB45_1
; %bb.3:
	rts
.Lfunc_end45:
	.size	__ashrqi3, .Lfunc_end45-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB46_3
; %bb.1:
	ldx	__rc2
.LBB46_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB46_2
.LBB46_3:
	tax
	lda	__rc3
	rts
.Lfunc_end46:
	.size	__ashrhi3, .Lfunc_end46-__ashrhi3
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
	beq	.LBB47_3
; %bb.1:
	ldx	__rc4
.LBB47_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB47_2
.LBB47_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end47:
	.size	__ashrsi3, .Lfunc_end47-__ashrsi3
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
	beq	.LBB48_3
; %bb.1:
	ldx	__rc8
.LBB48_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB48_2
.LBB48_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end48:
	.size	__ashrdi3, .Lfunc_end48-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB49_2
.LBB49_1:                               ;   in Loop: Header=BB49_2 Depth=1
	dex
	cmp	#128
	rol
.LBB49_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB49_1
; %bb.3:
	rts
.Lfunc_end49:
	.size	__rotlqi3, .Lfunc_end49-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
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
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB50_2
.LBB50_3:
	tax
	lda	__rc3
	rts
.Lfunc_end50:
	.size	__rotlhi3, .Lfunc_end50-__rotlhi3
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
	beq	.LBB51_3
; %bb.1:
	ldx	__rc4
.LBB51_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB51_2
.LBB51_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end51:
	.size	__rotlsi3, .Lfunc_end51-__rotlsi3
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
	beq	.LBB52_3
; %bb.1:
	ldx	__rc8
.LBB52_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB52_2
.LBB52_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end52:
	.size	__rotldi3, .Lfunc_end52-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB53_2
.LBB53_1:                               ;   in Loop: Header=BB53_2 Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror
.LBB53_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB53_1
; %bb.3:
	rts
.Lfunc_end53:
	.size	__rotrqi3, .Lfunc_end53-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB54_3
; %bb.1:
	ldx	__rc2
.LBB54_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB54_2
.LBB54_3:
	ldx	__rc3
	rts
.Lfunc_end54:
	.size	__rotrhi3, .Lfunc_end54-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB55_3
; %bb.1:
	ldx	__rc4
.LBB55_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	lsr	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB55_2
.LBB55_3:
	ldx	__rc5
	rts
.Lfunc_end55:
	.size	__rotrsi3, .Lfunc_end55-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB56_3
; %bb.1:
	ldx	__rc8
.LBB56_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB56_2
.LBB56_3:
	ldx	__rc9
	rts
.Lfunc_end56:
	.size	__rotrdi3, .Lfunc_end56-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB57_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB57_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB57_4
; %bb.3:                                ;   in Loop: Header=BB57_2 Depth=1
	clc
	adc	__rc2
.LBB57_4:                               ;   in Loop: Header=BB57_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB57_2
; %bb.5:
	rts
.LBB57_6:
	lda	#0
	rts
.Lfunc_end57:
	.size	__mulqi3, .Lfunc_end57-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB58_2
; %bb.1:
	ldy	__rc2
	beq	.LBB58_7
.LBB58_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB58_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB58_5
; %bb.4:                                ;   in Loop: Header=BB58_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB58_5:                               ;   in Loop: Header=BB58_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB58_3
; %bb.6:                                ;   in Loop: Header=BB58_3 Depth=1
	ldx	__rc2
	bne	.LBB58_3
	bra	.LBB58_8
.LBB58_7:
	ldy	#0
	tya
.LBB58_8:
	tax
	tya
	rts
.Lfunc_end58:
	.size	__mulhi3, .Lfunc_end58-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB59_4
; %bb.1:
	ldy	__rc6
	bne	.LBB59_4
; %bb.2:
	ldy	__rc5
	bne	.LBB59_4
; %bb.3:
	ldy	__rc4
	bne	.LBB59_4
; %bb.13:
	jmp	.LBB59_12
.LBB59_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB59_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB59_7
; %bb.6:                                ;   in Loop: Header=BB59_5 Depth=1
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
.LBB59_7:                               ;   in Loop: Header=BB59_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB59_5
; %bb.8:                                ;   in Loop: Header=BB59_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB59_5
; %bb.9:                                ;   in Loop: Header=BB59_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB59_5
; %bb.10:                               ;   in Loop: Header=BB59_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB59_5
.LBB59_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB59_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB59_11
.Lfunc_end59:
	.size	__mulsi3, .Lfunc_end59-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB60_8
; %bb.1:
	ldy	__rc14
	bne	.LBB60_8
; %bb.2:
	ldy	__rc13
	bne	.LBB60_8
; %bb.3:
	ldy	__rc12
	bne	.LBB60_8
; %bb.4:
	ldy	__rc11
	bne	.LBB60_8
; %bb.5:
	ldy	__rc10
	bne	.LBB60_8
; %bb.6:
	ldy	__rc9
	bne	.LBB60_8
; %bb.7:
	ldy	__rc8
	bne	.LBB60_8
; %bb.21:
	jmp	.LBB60_20
.LBB60_8:
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
.LBB60_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB60_11
; %bb.10:                               ;   in Loop: Header=BB60_9 Depth=1
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
.LBB60_11:                              ;   in Loop: Header=BB60_9 Depth=1
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
	beq	.LBB60_12
; %bb.23:                               ;   in Loop: Header=BB60_9 Depth=1
	jmp	.LBB60_9
.LBB60_12:                              ;   in Loop: Header=BB60_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB60_13
; %bb.25:                               ;   in Loop: Header=BB60_9 Depth=1
	jmp	.LBB60_9
.LBB60_13:                              ;   in Loop: Header=BB60_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB60_14
; %bb.27:                               ;   in Loop: Header=BB60_9 Depth=1
	jmp	.LBB60_9
.LBB60_14:                              ;   in Loop: Header=BB60_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB60_15
; %bb.29:                               ;   in Loop: Header=BB60_9 Depth=1
	jmp	.LBB60_9
.LBB60_15:                              ;   in Loop: Header=BB60_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB60_16
; %bb.31:                               ;   in Loop: Header=BB60_9 Depth=1
	jmp	.LBB60_9
.LBB60_16:                              ;   in Loop: Header=BB60_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB60_17
; %bb.33:                               ;   in Loop: Header=BB60_9 Depth=1
	jmp	.LBB60_9
.LBB60_17:                              ;   in Loop: Header=BB60_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB60_18
; %bb.35:                               ;   in Loop: Header=BB60_9 Depth=1
	jmp	.LBB60_9
.LBB60_18:                              ;   in Loop: Header=BB60_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB60_19
; %bb.37:                               ;   in Loop: Header=BB60_9 Depth=1
	jmp	.LBB60_9
.LBB60_19:
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
.LBB60_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB60_19
.Lfunc_end60:
	.size	__muldi3, .Lfunc_end60-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB61_1
; %bb.15:
	jmp	.LBB61_14
.LBB61_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB61_2
; %bb.17:
	jmp	.LBB61_14
.LBB61_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB61_3
; %bb.19:
	jmp	.LBB61_14
.LBB61_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB61_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB61_6
; %bb.5:                                ;   in Loop: Header=BB61_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB61_8
	bra	.LBB61_7
.LBB61_6:                               ;   in Loop: Header=BB61_4 Depth=1
	cpy	__rc4
	bcc	.LBB61_8
.LBB61_7:                               ;   in Loop: Header=BB61_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB61_4
	bra	.LBB61_9
.LBB61_8:
	ldy	__rc3
	sty	__rc2
.LBB61_9:
	cpx	#0
	beq	.LBB61_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB61_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB61_13
; %bb.12:                               ;   in Loop: Header=BB61_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB61_13:                              ;   in Loop: Header=BB61_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB61_11
.LBB61_14:
	rts
.Lfunc_end61:
	.size	__udivqi3, .Lfunc_end61-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB62_2
; %bb.1:
	ldy	__rc2
	beq	.LBB62_4
.LBB62_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB62_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB62_6
.LBB62_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB62_22
.LBB62_5:
	cmp	__rc3
	bcc	.LBB62_4
.LBB62_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB62_7
; %bb.25:
	jmp	.LBB62_22
.LBB62_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB62_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB62_10
; %bb.9:                                ;   in Loop: Header=BB62_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB62_12
	bra	.LBB62_11
.LBB62_10:                              ;   in Loop: Header=BB62_8 Depth=1
	cmp	__rc6
	bcc	.LBB62_12
.LBB62_11:                              ;   in Loop: Header=BB62_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB62_8
	bra	.LBB62_13
.LBB62_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB62_13:
	cpx	#0
	bne	.LBB62_14
; %bb.27:
	jmp	.LBB62_22
.LBB62_14:
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
.LBB62_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB62_17
; %bb.16:                               ;   in Loop: Header=BB62_15 Depth=1
	ldy	#0
.LBB62_17:                              ;   in Loop: Header=BB62_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB62_21
; %bb.18:                               ;   in Loop: Header=BB62_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB62_20
.LBB62_19:                              ;   in Loop: Header=BB62_15 Depth=1
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
.LBB62_20:                              ;   in Loop: Header=BB62_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB62_15
	bra	.LBB62_22
.LBB62_21:                              ;   in Loop: Header=BB62_15 Depth=1
	cmp	__rc6
	bcs	.LBB62_19
	bra	.LBB62_20
.LBB62_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end62:
	.size	__udivhi3, .Lfunc_end62-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
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
	beq	.LBB63_9
.LBB63_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB63_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB63_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB63_7
; %bb.45:
	jmp	.LBB63_38
.LBB63_7:
	cmp	__rc4
	bcc	.LBB63_9
	bra	.LBB63_11
.LBB63_8:
	cpx	__rc7
	bcs	.LBB63_11
.LBB63_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB63_21
.LBB63_10:
	cpx	__rc6
	bcc	.LBB63_9
.LBB63_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB63_12
; %bb.47:
	jmp	.LBB63_21
.LBB63_12:
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
.LBB63_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB63_17
; %bb.14:                               ;   in Loop: Header=BB63_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB63_18
; %bb.15:                               ;   in Loop: Header=BB63_13 Depth=1
	cmp	__rc10
	bne	.LBB63_19
; %bb.16:                               ;   in Loop: Header=BB63_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB63_23
	bra	.LBB63_20
.LBB63_17:                              ;   in Loop: Header=BB63_13 Depth=1
	cpy	__rc12
	bcc	.LBB63_23
	bra	.LBB63_20
.LBB63_18:                              ;   in Loop: Header=BB63_13 Depth=1
	cpy	__rc11
	bcc	.LBB63_23
	bra	.LBB63_20
.LBB63_19:                              ;   in Loop: Header=BB63_13 Depth=1
	cmp	__rc10
	bcc	.LBB63_23
.LBB63_20:                              ;   in Loop: Header=BB63_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB63_13
	bra	.LBB63_24
.LBB63_21:
	stz	__rc2
	stz	__rc3
.LBB63_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB63_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB63_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB63_22
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
.LBB63_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB63_28
; %bb.27:                               ;   in Loop: Header=BB63_26 Depth=1
	ldy	#0
.LBB63_28:                              ;   in Loop: Header=BB63_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB63_32
; %bb.29:                               ;   in Loop: Header=BB63_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB63_34
; %bb.30:                               ;   in Loop: Header=BB63_26 Depth=1
	cmp	__rc10
	bne	.LBB63_37
; %bb.31:                               ;   in Loop: Header=BB63_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB63_33
	bra	.LBB63_35
.LBB63_32:                              ;   in Loop: Header=BB63_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB63_35
.LBB63_33:                              ;   in Loop: Header=BB63_26 Depth=1
	lda	__rc6
	bra	.LBB63_36
.LBB63_34:                              ;   in Loop: Header=BB63_26 Depth=1
	cpy	__rc11
	bcc	.LBB63_33
.LBB63_35:                              ;   in Loop: Header=BB63_26 Depth=1
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
.LBB63_36:                              ;   in Loop: Header=BB63_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB63_41
; %bb.49:                               ;   in Loop: Header=BB63_26 Depth=1
	jmp	.LBB63_26
.LBB63_41:
	jmp	.LBB63_22
.LBB63_37:                              ;   in Loop: Header=BB63_26 Depth=1
	cmp	__rc10
	bcc	.LBB63_33
	bra	.LBB63_35
.LBB63_38:
	cpx	__rc5
	bcs	.LBB63_43
; %bb.51:
	jmp	.LBB63_9
.LBB63_43:
	jmp	.LBB63_11
.Lfunc_end63:
	.size	__udivsi3, .Lfunc_end63-__udivsi3
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
	bne	.LBB64_8
; %bb.1:
	ldx	__rc14
	bne	.LBB64_8
; %bb.2:
	ldx	__rc13
	bne	.LBB64_8
; %bb.3:
	ldx	__rc12
	bne	.LBB64_8
; %bb.4:
	ldx	__rc11
	bne	.LBB64_8
; %bb.5:
	ldx	__rc10
	bne	.LBB64_8
; %bb.6:
	ldx	__rc9
	bne	.LBB64_8
; %bb.7:
	ldx	__rc8
	beq	.LBB64_17
.LBB64_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB64_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB64_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB64_11
; %bb.90:
	jmp	.LBB64_31
.LBB64_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB64_12
; %bb.92:
	jmp	.LBB64_32
.LBB64_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB64_13
; %bb.94:
	jmp	.LBB64_38
.LBB64_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB64_14
; %bb.96:
	jmp	.LBB64_40
.LBB64_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB64_15
; %bb.98:
	jmp	.LBB64_42
.LBB64_15:
	cmp	__rc8
	bcc	.LBB64_17
	bra	.LBB64_19
.LBB64_16:
	cpx	__rc15
	bcs	.LBB64_19
.LBB64_17:
	lda	#0
; %bb.66:
	jmp	.LBB64_29
.LBB64_18:
	cpx	__rc14
	bcc	.LBB64_17
.LBB64_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB64_20
; %bb.100:
	jmp	.LBB64_29
.LBB64_20:
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
.LBB64_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB64_25
; %bb.22:                               ;   in Loop: Header=BB64_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB64_26
; %bb.23:                               ;   in Loop: Header=BB64_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB64_27
; %bb.24:                               ;   in Loop: Header=BB64_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB64_102
; %bb.150:                              ;   in Loop: Header=BB64_21 Depth=1
	jmp	.LBB64_33
.LBB64_102:                             ;   in Loop: Header=BB64_21 Depth=1
	jmp	.LBB64_37
.LBB64_25:                              ;   in Loop: Header=BB64_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB64_28
; %bb.104:
	jmp	.LBB64_44
.LBB64_26:                              ;   in Loop: Header=BB64_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB64_28
; %bb.106:
	jmp	.LBB64_44
.LBB64_27:                              ;   in Loop: Header=BB64_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB64_28
; %bb.108:
	jmp	.LBB64_44
.LBB64_28:                              ;   in Loop: Header=BB64_21 Depth=1
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
	bmi	.LBB64_68
; %bb.110:                              ;   in Loop: Header=BB64_21 Depth=1
	jmp	.LBB64_21
.LBB64_68:
	jmp	.LBB64_45
.LBB64_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB64_30:
	ldx	__rc18
	rts
.LBB64_31:
	cpx	__rc13
	bcs	.LBB64_70
; %bb.112:
	jmp	.LBB64_17
.LBB64_70:
	jmp	.LBB64_19
.LBB64_32:
	cpx	__rc12
	bcs	.LBB64_72
; %bb.114:
	jmp	.LBB64_17
.LBB64_72:
	jmp	.LBB64_19
.LBB64_33:                              ;   in Loop: Header=BB64_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB64_39
; %bb.34:                               ;   in Loop: Header=BB64_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB64_41
; %bb.35:                               ;   in Loop: Header=BB64_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB64_43
; %bb.36:                               ;   in Loop: Header=BB64_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB64_44
; %bb.74:                               ;   in Loop: Header=BB64_21 Depth=1
	jmp	.LBB64_28
.LBB64_37:                              ;   in Loop: Header=BB64_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB64_44
; %bb.76:                               ;   in Loop: Header=BB64_21 Depth=1
	jmp	.LBB64_28
.LBB64_38:
	cpx	__rc11
	bcs	.LBB64_78
; %bb.116:
	jmp	.LBB64_17
.LBB64_78:
	jmp	.LBB64_19
.LBB64_39:                              ;   in Loop: Header=BB64_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB64_44
; %bb.80:                               ;   in Loop: Header=BB64_21 Depth=1
	jmp	.LBB64_28
.LBB64_40:
	cpx	__rc10
	bcs	.LBB64_82
; %bb.118:
	jmp	.LBB64_17
.LBB64_82:
	jmp	.LBB64_19
.LBB64_41:                              ;   in Loop: Header=BB64_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB64_44
; %bb.84:                               ;   in Loop: Header=BB64_21 Depth=1
	jmp	.LBB64_28
.LBB64_42:
	cpx	__rc9
	bcs	.LBB64_86
; %bb.120:
	jmp	.LBB64_17
.LBB64_86:
	jmp	.LBB64_19
.LBB64_43:                              ;   in Loop: Header=BB64_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB64_44
; %bb.122:                              ;   in Loop: Header=BB64_21 Depth=1
	jmp	.LBB64_28
.LBB64_44:
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
.LBB64_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB64_46
; %bb.124:
	jmp	.LBB64_30
.LBB64_46:
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
.LBB64_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB64_49
; %bb.48:                               ;   in Loop: Header=BB64_47 Depth=1
	ldy	#0
.LBB64_49:                              ;   in Loop: Header=BB64_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB64_57
; %bb.50:                               ;   in Loop: Header=BB64_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB64_51
; %bb.126:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_60
.LBB64_51:                              ;   in Loop: Header=BB64_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB64_52
; %bb.128:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_61
.LBB64_52:                              ;   in Loop: Header=BB64_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB64_53
; %bb.130:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_62
.LBB64_53:                              ;   in Loop: Header=BB64_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB64_54
; %bb.132:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_63
.LBB64_54:                              ;   in Loop: Header=BB64_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB64_55
; %bb.134:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_64
.LBB64_55:                              ;   in Loop: Header=BB64_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB64_56
; %bb.136:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_65
.LBB64_56:                              ;   in Loop: Header=BB64_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB64_58
	bra	.LBB64_59
.LBB64_57:                              ;   in Loop: Header=BB64_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB64_59
.LBB64_58:                              ;   in Loop: Header=BB64_47 Depth=1
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
.LBB64_59:                              ;   in Loop: Header=BB64_47 Depth=1
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
	beq	.LBB64_88
; %bb.138:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_47
.LBB64_88:
	jmp	.LBB64_30
.LBB64_60:                              ;   in Loop: Header=BB64_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB64_58
	bra	.LBB64_59
.LBB64_61:                              ;   in Loop: Header=BB64_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB64_59
; %bb.140:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_58
.LBB64_62:                              ;   in Loop: Header=BB64_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB64_59
; %bb.142:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_58
.LBB64_63:                              ;   in Loop: Header=BB64_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB64_59
; %bb.144:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_58
.LBB64_64:                              ;   in Loop: Header=BB64_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB64_59
; %bb.146:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_58
.LBB64_65:                              ;   in Loop: Header=BB64_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB64_59
; %bb.148:                              ;   in Loop: Header=BB64_47 Depth=1
	jmp	.LBB64_58
.Lfunc_end64:
	.size	__udivdi3, .Lfunc_end64-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB65_1
; %bb.15:
	jmp	.LBB65_13
.LBB65_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB65_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB65_14
; %bb.3:
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
	cmp	__rc2
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
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB65_13
.LBB65_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB65_12
; %bb.11:                               ;   in Loop: Header=BB65_10 Depth=1
	sec
	sbc	__rc2
.LBB65_12:                              ;   in Loop: Header=BB65_10 Depth=1
	dex
	bne	.LBB65_10
.LBB65_13:
	rts
.LBB65_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end65:
	.size	__umodqi3, .Lfunc_end65-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB66_2
; %bb.1:
	ldx	__rc2
	bne	.LBB66_2
; %bb.22:
	jmp	.LBB66_19
.LBB66_2:
	cmp	__rc3
	bne	.LBB66_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB66_5
; %bb.20:
	jmp	.LBB66_19
.LBB66_4:
	cmp	__rc3
	bcs	.LBB66_5
; %bb.24:
	jmp	.LBB66_19
.LBB66_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB66_6
; %bb.26:
	jmp	.LBB66_18
.LBB66_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB66_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB66_9
; %bb.8:                                ;   in Loop: Header=BB66_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB66_11
	bra	.LBB66_10
.LBB66_9:                               ;   in Loop: Header=BB66_7 Depth=1
	cmp	__rc5
	bcc	.LBB66_11
.LBB66_10:                              ;   in Loop: Header=BB66_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB66_7
	bra	.LBB66_12
.LBB66_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB66_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB66_19
.LBB66_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB66_17
; %bb.14:                               ;   in Loop: Header=BB66_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB66_16
.LBB66_15:                              ;   in Loop: Header=BB66_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB66_16:                              ;   in Loop: Header=BB66_13 Depth=1
	dex
	bne	.LBB66_13
	bra	.LBB66_19
.LBB66_17:                              ;   in Loop: Header=BB66_13 Depth=1
	cmp	__rc5
	bcs	.LBB66_15
	bra	.LBB66_16
.LBB66_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB66_19:
	tax
	tya
	rts
.Lfunc_end66:
	.size	__umodhi3, .Lfunc_end66-__umodhi3
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
	bne	.LBB67_4
; %bb.1:
	ldx	__rc6
	bne	.LBB67_4
; %bb.2:
	ldx	__rc5
	bne	.LBB67_4
; %bb.3:
	ldx	__rc4
	bne	.LBB67_4
; %bb.42:
	jmp	.LBB67_35
.LBB67_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB67_8
; %bb.5:
	cmp	__rc6
	bne	.LBB67_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB67_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB67_11
; %bb.36:
	jmp	.LBB67_35
.LBB67_8:
	cpx	__rc7
	bcs	.LBB67_11
; %bb.38:
	jmp	.LBB67_35
.LBB67_9:
	cmp	__rc6
	bcs	.LBB67_11
; %bb.40:
	jmp	.LBB67_35
.LBB67_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB67_11
; %bb.44:
	jmp	.LBB67_35
.LBB67_11:
	ldx	__rc7
	bpl	.LBB67_12
; %bb.46:
	jmp	.LBB67_33
.LBB67_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB67_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB67_17
; %bb.14:                               ;   in Loop: Header=BB67_13 Depth=1
	cmp	__rc8
	bne	.LBB67_18
; %bb.15:                               ;   in Loop: Header=BB67_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB67_19
; %bb.16:                               ;   in Loop: Header=BB67_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB67_21
	bra	.LBB67_20
.LBB67_17:                              ;   in Loop: Header=BB67_13 Depth=1
	cpy	__rc9
	bcc	.LBB67_21
	bra	.LBB67_20
.LBB67_18:                              ;   in Loop: Header=BB67_13 Depth=1
	cmp	__rc8
	bcc	.LBB67_21
	bra	.LBB67_20
.LBB67_19:                              ;   in Loop: Header=BB67_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB67_21
.LBB67_20:                              ;   in Loop: Header=BB67_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB67_13
	bra	.LBB67_22
.LBB67_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB67_22:
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
	bne	.LBB67_23
; %bb.48:
	jmp	.LBB67_34
.LBB67_23:
	tya
.LBB67_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB67_28
; %bb.25:                               ;   in Loop: Header=BB67_24 Depth=1
	cmp	__rc8
	bne	.LBB67_31
; %bb.26:                               ;   in Loop: Header=BB67_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB67_32
; %bb.27:                               ;   in Loop: Header=BB67_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB67_29
	bra	.LBB67_30
.LBB67_28:                              ;   in Loop: Header=BB67_24 Depth=1
	cpy	__rc9
	bcc	.LBB67_30
.LBB67_29:                              ;   in Loop: Header=BB67_24 Depth=1
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
.LBB67_30:                              ;   in Loop: Header=BB67_24 Depth=1
	dex
	bne	.LBB67_24
	bra	.LBB67_35
.LBB67_31:                              ;   in Loop: Header=BB67_24 Depth=1
	cmp	__rc8
	bcs	.LBB67_29
	bra	.LBB67_30
.LBB67_32:                              ;   in Loop: Header=BB67_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB67_29
	bra	.LBB67_30
.LBB67_33:
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
	bra	.LBB67_35
.LBB67_34:
	tya
.LBB67_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end67:
	.size	__umodsi3, .Lfunc_end67-__umodsi3
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
	bne	.LBB68_8
; %bb.90:
	jmp	.LBB68_61
.LBB68_8:
	cmp	__rc15
	bne	.LBB68_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB68_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB68_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB68_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB68_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB68_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB68_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB68_23
; %bb.62:
	jmp	.LBB68_61
.LBB68_16:
	cmp	__rc15
	bcs	.LBB68_23
; %bb.64:
	jmp	.LBB68_61
.LBB68_17:
	cpx	__rc14
	bcs	.LBB68_23
; %bb.66:
	jmp	.LBB68_61
.LBB68_18:
	cpx	__rc13
	bcs	.LBB68_23
; %bb.68:
	jmp	.LBB68_61
.LBB68_19:
	cpx	__rc12
	bcs	.LBB68_23
; %bb.70:
	jmp	.LBB68_61
.LBB68_20:
	cpx	__rc11
	bcs	.LBB68_23
; %bb.72:
	jmp	.LBB68_61
.LBB68_21:
	cpx	__rc10
	bcs	.LBB68_23
; %bb.74:
	jmp	.LBB68_61
.LBB68_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB68_23
; %bb.92:
	jmp	.LBB68_61
.LBB68_23:
	ldx	__rc15
	bpl	.LBB68_24
; %bb.94:
	jmp	.LBB68_33
.LBB68_24:
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
.LBB68_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB68_29
; %bb.26:                               ;   in Loop: Header=BB68_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB68_30
; %bb.27:                               ;   in Loop: Header=BB68_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB68_31
; %bb.28:                               ;   in Loop: Header=BB68_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB68_76
; %bb.96:                               ;   in Loop: Header=BB68_25 Depth=1
	jmp	.LBB68_38
.LBB68_76:                              ;   in Loop: Header=BB68_25 Depth=1
	jmp	.LBB68_34
.LBB68_29:                              ;   in Loop: Header=BB68_25 Depth=1
	cmp	__rc19
	bcs	.LBB68_32
; %bb.98:
	jmp	.LBB68_42
.LBB68_30:                              ;   in Loop: Header=BB68_25 Depth=1
	cpy	__rc18
	bcs	.LBB68_32
; %bb.100:
	jmp	.LBB68_42
.LBB68_31:                              ;   in Loop: Header=BB68_25 Depth=1
	cpy	__rc7
	bcs	.LBB68_32
; %bb.102:
	jmp	.LBB68_42
.LBB68_32:                              ;   in Loop: Header=BB68_25 Depth=1
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
	bmi	.LBB68_78
; %bb.104:                              ;   in Loop: Header=BB68_25 Depth=1
	jmp	.LBB68_25
.LBB68_78:
	jmp	.LBB68_43
.LBB68_33:
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
	jmp	.LBB68_61
.LBB68_34:                              ;   in Loop: Header=BB68_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB68_39
; %bb.35:                               ;   in Loop: Header=BB68_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB68_40
; %bb.36:                               ;   in Loop: Header=BB68_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB68_41
; %bb.37:                               ;   in Loop: Header=BB68_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB68_42
; %bb.82:                               ;   in Loop: Header=BB68_25 Depth=1
	jmp	.LBB68_32
.LBB68_38:                              ;   in Loop: Header=BB68_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB68_42
; %bb.84:                               ;   in Loop: Header=BB68_25 Depth=1
	jmp	.LBB68_32
.LBB68_39:                              ;   in Loop: Header=BB68_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB68_42
; %bb.86:                               ;   in Loop: Header=BB68_25 Depth=1
	jmp	.LBB68_32
.LBB68_40:                              ;   in Loop: Header=BB68_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB68_42
; %bb.88:                               ;   in Loop: Header=BB68_25 Depth=1
	jmp	.LBB68_32
.LBB68_41:                              ;   in Loop: Header=BB68_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB68_42
; %bb.106:                              ;   in Loop: Header=BB68_25 Depth=1
	jmp	.LBB68_32
.LBB68_42:
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
.LBB68_43:
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
	bne	.LBB68_44
; %bb.108:
	jmp	.LBB68_61
.LBB68_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB68_52
; %bb.45:                               ;   in Loop: Header=BB68_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB68_46
; %bb.110:                              ;   in Loop: Header=BB68_44 Depth=1
	jmp	.LBB68_55
.LBB68_46:                              ;   in Loop: Header=BB68_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB68_47
; %bb.112:                              ;   in Loop: Header=BB68_44 Depth=1
	jmp	.LBB68_56
.LBB68_47:                              ;   in Loop: Header=BB68_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB68_48
; %bb.114:                              ;   in Loop: Header=BB68_44 Depth=1
	jmp	.LBB68_57
.LBB68_48:                              ;   in Loop: Header=BB68_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB68_49
; %bb.116:                              ;   in Loop: Header=BB68_44 Depth=1
	jmp	.LBB68_58
.LBB68_49:                              ;   in Loop: Header=BB68_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB68_50
; %bb.118:                              ;   in Loop: Header=BB68_44 Depth=1
	jmp	.LBB68_59
.LBB68_50:                              ;   in Loop: Header=BB68_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB68_51
; %bb.120:                              ;   in Loop: Header=BB68_44 Depth=1
	jmp	.LBB68_60
.LBB68_51:                              ;   in Loop: Header=BB68_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB68_53
	bra	.LBB68_54
.LBB68_52:                              ;   in Loop: Header=BB68_44 Depth=1
	cmp	__rc19
	bcc	.LBB68_54
.LBB68_53:                              ;   in Loop: Header=BB68_44 Depth=1
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
.LBB68_54:                              ;   in Loop: Header=BB68_44 Depth=1
	dex
	beq	.LBB68_61
; %bb.122:                              ;   in Loop: Header=BB68_44 Depth=1
	jmp	.LBB68_44
.LBB68_55:                              ;   in Loop: Header=BB68_44 Depth=1
	cpy	__rc18
	bcs	.LBB68_53
	bra	.LBB68_54
.LBB68_56:                              ;   in Loop: Header=BB68_44 Depth=1
	cpy	__rc7
	bcs	.LBB68_53
	bra	.LBB68_54
.LBB68_57:                              ;   in Loop: Header=BB68_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB68_53
	bra	.LBB68_54
.LBB68_58:                              ;   in Loop: Header=BB68_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB68_53
	bra	.LBB68_54
.LBB68_59:                              ;   in Loop: Header=BB68_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB68_53
	bra	.LBB68_54
.LBB68_60:                              ;   in Loop: Header=BB68_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB68_54
; %bb.124:                              ;   in Loop: Header=BB68_44 Depth=1
	jmp	.LBB68_53
.LBB68_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end68:
	.size	__umoddi3, .Lfunc_end68-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB69_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB69_2
; %bb.18:
	jmp	.LBB69_17
.LBB69_2:
	lda	__rc5
	bpl	.LBB69_3
; %bb.20:
	jmp	.LBB69_15
.LBB69_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB69_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB69_6
; %bb.5:                                ;   in Loop: Header=BB69_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB69_9
	bra	.LBB69_7
.LBB69_6:                               ;   in Loop: Header=BB69_4 Depth=1
	cpy	__rc6
	bcc	.LBB69_9
.LBB69_7:                               ;   in Loop: Header=BB69_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB69_4
	bra	.LBB69_10
.LBB69_8:
	sty	__rc7
	bra	.LBB69_17
.LBB69_9:
	ldy	__rc5
	sty	__rc4
.LBB69_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB69_16
; %bb.11:
	lda	#1
.LBB69_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB69_14
; %bb.13:                               ;   in Loop: Header=BB69_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB69_14:                              ;   in Loop: Header=BB69_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB69_12
	bra	.LBB69_17
.LBB69_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB69_16:
	lda	#1
.LBB69_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end69:
	.size	__udivmodqi4, .Lfunc_end69-__udivmodqi4
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
	bne	.LBB70_2
; %bb.1:
	ldx	__rc2
	beq	.LBB70_4
.LBB70_2:
	cmp	__rc3
	bne	.LBB70_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB70_6
.LBB70_4:
	ldx	#0
; %bb.26:
	jmp	.LBB70_24
.LBB70_5:
	cmp	__rc3
	bcc	.LBB70_4
.LBB70_6:
	tay
	ldx	__rc3
	bpl	.LBB70_7
; %bb.28:
	jmp	.LBB70_22
.LBB70_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB70_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB70_10
; %bb.9:                                ;   in Loop: Header=BB70_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB70_11
	bra	.LBB70_12
.LBB70_10:                              ;   in Loop: Header=BB70_8 Depth=1
	cmp	__rc8
	bcc	.LBB70_12
.LBB70_11:                              ;   in Loop: Header=BB70_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB70_8
	bra	.LBB70_13
.LBB70_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB70_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB70_14
; %bb.30:
	jmp	.LBB70_23
.LBB70_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB70_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB70_17
; %bb.16:                               ;   in Loop: Header=BB70_15 Depth=1
	ldy	#0
.LBB70_17:                              ;   in Loop: Header=BB70_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB70_21
; %bb.18:                               ;   in Loop: Header=BB70_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB70_20
.LBB70_19:                              ;   in Loop: Header=BB70_15 Depth=1
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
.LBB70_20:                              ;   in Loop: Header=BB70_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB70_15
	bra	.LBB70_25
.LBB70_21:                              ;   in Loop: Header=BB70_15 Depth=1
	cmp	__rc8
	bcs	.LBB70_19
	bra	.LBB70_20
.LBB70_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB70_23:
	ldx	#1
.LBB70_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB70_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end70:
	.size	__udivmodhi4, .Lfunc_end70-__udivmodhi4
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
	bpl	.LBB71_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB71_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB71_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB71_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB71_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB71_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB71_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB71_8:
	lda	__rc2
	rts
.Lfunc_end71:
	.size	__divqi3, .Lfunc_end71-__divqi3
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
	bmi	.LBB72_2
; %bb.1:
	bra	.LBB72_6
.LBB72_2:
	cpx	#128
	bne	.LBB72_5
; %bb.3:
	lda	__rc4
	bne	.LBB72_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB72_6
.LBB72_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB72_6:
	tya
	bmi	.LBB72_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB72_12
.LBB72_8:
	cpy	#128
	bne	.LBB72_11
; %bb.9:
	lda	__rc2
	bne	.LBB72_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB72_12
.LBB72_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB72_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB72_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB72_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end72:
	.size	__divhi3, .Lfunc_end72-__divhi3
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
	bmi	.LBB73_2
; %bb.1:
	ldy	__rc3
	bra	.LBB73_8
.LBB73_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB73_7
; %bb.3:
	lda	__rc2
	bne	.LBB73_7
; %bb.4:
	lda	__rc8
	bne	.LBB73_7
; %bb.5:
	lda	__rc9
	bne	.LBB73_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB73_8
.LBB73_7:
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
.LBB73_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB73_10
; %bb.9:
	lda	__rc7
	bra	.LBB73_16
.LBB73_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB73_15
; %bb.11:
	lda	__rc6
	bne	.LBB73_15
; %bb.12:
	lda	__rc5
	bne	.LBB73_15
; %bb.13:
	lda	__rc4
	bne	.LBB73_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB73_16
.LBB73_15:
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
.LBB73_16:
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
	bne	.LBB73_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB73_19
.LBB73_18:
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
.LBB73_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end73:
	.size	__divsi3, .Lfunc_end73-__divsi3
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
	bmi	.LBB74_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB74_12
.LBB74_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB74_11
; %bb.3:
	lda	__rc6
	bne	.LBB74_11
; %bb.4:
	lda	__rc5
	bne	.LBB74_11
; %bb.5:
	lda	__rc4
	bne	.LBB74_11
; %bb.6:
	lda	__rc3
	bne	.LBB74_11
; %bb.7:
	lda	__rc2
	bne	.LBB74_11
; %bb.8:
	lda	__rc18
	bne	.LBB74_11
; %bb.9:
	lda	__rc19
	bne	.LBB74_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB74_12
.LBB74_11:
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
.LBB74_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB74_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB74_24
.LBB74_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB74_23
; %bb.15:
	lda	__rc14
	bne	.LBB74_23
; %bb.16:
	lda	__rc13
	bne	.LBB74_23
; %bb.17:
	lda	__rc12
	bne	.LBB74_23
; %bb.18:
	lda	__rc11
	bne	.LBB74_23
; %bb.19:
	lda	__rc10
	bne	.LBB74_23
; %bb.20:
	lda	__rc9
	bne	.LBB74_23
; %bb.21:
	lda	__rc8
	bne	.LBB74_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB74_24
.LBB74_23:
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
.LBB74_24:
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
	bne	.LBB74_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB74_27
.LBB74_26:
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
.LBB74_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end74:
	.size	__divdi3, .Lfunc_end74-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB75_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB75_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB75_3:
	tay
	lda	__rc2
	bmi	.LBB75_5
; %bb.4:
	lda	__rc2
	bra	.LBB75_7
.LBB75_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB75_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB75_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB75_9
; %bb.8:
	rts
.LBB75_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end75:
	.size	__modqi3, .Lfunc_end75-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB76_2
; %bb.1:
	txa
	bra	.LBB76_6
.LBB76_2:
	cpx	#128
	bne	.LBB76_5
; %bb.3:
	lda	__rc4
	bne	.LBB76_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB76_6
.LBB76_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB76_6:
	ldx	__rc3
	bpl	.LBB76_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB76_10
; %bb.8:
	ldx	__rc2
	bne	.LBB76_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB76_11
.LBB76_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB76_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB76_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB76_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end76:
	.size	__modhi3, .Lfunc_end76-__modhi3
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
	bmi	.LBB77_2
; %bb.1:
	lda	__rc3
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
	lda	#128
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
	sbc	mos8(.L__modsi3_zp_stk)
.LBB77_8:
	ldx	__rc7
	bpl	.LBB77_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB77_14
; %bb.10:
	ldx	__rc6
	bne	.LBB77_14
; %bb.11:
	ldx	__rc5
	bne	.LBB77_14
; %bb.12:
	ldx	__rc4
	bne	.LBB77_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB77_15
.LBB77_14:
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
.LBB77_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB77_17
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
.LBB77_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end77:
	.size	__modsi3, .Lfunc_end77-__modsi3
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
	bmi	.LBB78_2
; %bb.1:
	lda	__rc7
; %bb.26:
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
	lda	#128
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
	sbc	mos8(.L__moddi3_zp_stk)
.LBB78_12:
	ldx	__rc15
	bmi	.LBB78_13
; %bb.28:
	jmp	.LBB78_23
.LBB78_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB78_22
; %bb.14:
	ldx	__rc14
	bne	.LBB78_22
; %bb.15:
	ldx	__rc13
	bne	.LBB78_22
; %bb.16:
	ldx	__rc12
	bne	.LBB78_22
; %bb.17:
	ldx	__rc11
	bne	.LBB78_22
; %bb.18:
	ldx	__rc10
	bne	.LBB78_22
; %bb.19:
	ldx	__rc9
	bne	.LBB78_22
; %bb.20:
	ldx	__rc8
	bne	.LBB78_22
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
	bra	.LBB78_23
.LBB78_22:
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
.LBB78_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB78_25
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
.LBB78_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end78:
	.size	__moddi3, .Lfunc_end78-__moddi3
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
	bpl	.LBB79_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB79_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB79_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB79_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB79_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB79_11
.LBB79_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB79_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB79_8
; %bb.34:
	jmp	.LBB79_24
.LBB79_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB79_24
.LBB79_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB79_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB79_12
.LBB79_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB79_24
.LBB79_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB79_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB79_15
; %bb.14:                               ;   in Loop: Header=BB79_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB79_18
	bra	.LBB79_16
.LBB79_15:                              ;   in Loop: Header=BB79_13 Depth=1
	cmp	__rc7
	bcc	.LBB79_18
.LBB79_16:                              ;   in Loop: Header=BB79_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB79_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB79_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB79_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB79_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB79_22
; %bb.21:                               ;   in Loop: Header=BB79_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB79_22:                              ;   in Loop: Header=BB79_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB79_20
	bra	.LBB79_24
.LBB79_23:
	sta	__rc7
	sty	__rc6
.LBB79_24:
	lda	__rc4
	bmi	.LBB79_26
; %bb.25:
	lda	__rc7
	bra	.LBB79_27
.LBB79_26:
	lda	#0
	sec
	sbc	__rc7
.LBB79_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB79_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB79_29:
	lda	__rc6
	rts
.Lfunc_end79:
	.size	__divmodqi4, .Lfunc_end79-__divmodqi4
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
	bmi	.LBB80_2
.LBB80_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB80_6
.LBB80_2:
	cpx	#128
	bne	.LBB80_5
; %bb.3:
	lda	__rc7
	bne	.LBB80_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB80_1
.LBB80_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB80_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB80_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB80_15
; %bb.8:
	lda	__rc2
	bne	.LBB80_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB80_18
.LBB80_10:
	cpy	#128
	bne	.LBB80_14
; %bb.11:
	ldy	__rc2
	bne	.LBB80_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB80_13
; %bb.48:
	jmp	.LBB80_45
.LBB80_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB80_18
.LBB80_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB80_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB80_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB80_20
.LBB80_17:
	sta	__rc11
.LBB80_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB80_39
.LBB80_19:
	cmp	__rc7
	bcc	.LBB80_17
.LBB80_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB80_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB80_23
; %bb.22:                               ;   in Loop: Header=BB80_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB80_24
	bra	.LBB80_26
.LBB80_23:                              ;   in Loop: Header=BB80_21 Depth=1
	cmp	__rc9
	bcc	.LBB80_26
.LBB80_24:                              ;   in Loop: Header=BB80_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB80_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB80_27
.LBB80_26:
	tay
.LBB80_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB80_28
; %bb.50:
	jmp	.LBB80_37
.LBB80_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB80_32
.LBB80_29:                              ;   in Loop: Header=BB80_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB80_36
.LBB80_30:                              ;   in Loop: Header=BB80_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB80_31:                              ;   in Loop: Header=BB80_32 Depth=1
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
	beq	.LBB80_39
.LBB80_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB80_34
; %bb.33:                               ;   in Loop: Header=BB80_32 Depth=1
	ldy	#0
.LBB80_34:                              ;   in Loop: Header=BB80_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB80_29
; %bb.35:                               ;   in Loop: Header=BB80_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB80_30
.LBB80_36:                              ;   in Loop: Header=BB80_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB80_31
.LBB80_37:
	sta	__rc11
	ldx	#1
.LBB80_38:
	stx	__rc9
.LBB80_39:
	lda	__rc6
	bmi	.LBB80_41
; %bb.40:
	lda	__rc10
	bra	.LBB80_42
.LBB80_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB80_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB80_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB80_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB80_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB80_38
.Lfunc_end80:
	.size	__divmodhi4, .Lfunc_end80-__divmodhi4
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB81_2
; %bb.1:
	tya
	beq	.LBB81_11
.LBB81_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB81_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB81_5
; %bb.4:                                ;   in Loop: Header=BB81_3 Depth=1
	inc	__rc7
.LBB81_5:                               ;   in Loop: Header=BB81_3 Depth=1
	inc	__rc4
	bne	.LBB81_7
; %bb.6:                                ;   in Loop: Header=BB81_3 Depth=1
	inc	__rc5
.LBB81_7:                               ;   in Loop: Header=BB81_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB81_9
; %bb.8:                                ;   in Loop: Header=BB81_3 Depth=1
	dex
.LBB81_9:                               ;   in Loop: Header=BB81_3 Depth=1
	txa
	bne	.LBB81_3
; %bb.10:                               ;   in Loop: Header=BB81_3 Depth=1
	tya
	bne	.LBB81_3
.LBB81_11:
	rts
.Lfunc_end81:
	.size	memcpy, .Lfunc_end81-memcpy
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
.Lfunc_end82:
	.size	memset, .Lfunc_end82-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB83_4
.LBB83_1:                               ;   in Loop: Header=BB83_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB83_3
; %bb.2:                                ;   in Loop: Header=BB83_4 Depth=1
	inc	__rc3
.LBB83_3:                               ;   in Loop: Header=BB83_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB83_7
.LBB83_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB83_1
; %bb.5:                                ;   in Loop: Header=BB83_4 Depth=1
	cpx	#0
	bne	.LBB83_1
; %bb.6:
	rts
.LBB83_7:                               ;   in Loop: Header=BB83_4 Depth=1
	dec	__rc4
	jmp	.LBB83_4
.Lfunc_end83:
	.size	__memset, .Lfunc_end83-__memset
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
	beq	.LBB84_1
; %bb.15:
	jmp	.LBB84_13
.LBB84_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB84_2
; %bb.17:
	jmp	.LBB84_14
.LBB84_2:
	lda	__rc7
	bne	.LBB84_4
; %bb.3:
	lda	__rc6
	beq	.LBB84_12
.LBB84_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB84_6
; %bb.5:                                ;   in Loop: Header=BB84_4 Depth=1
	dec	__rc9
.LBB84_6:                               ;   in Loop: Header=BB84_4 Depth=1
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
	bne	.LBB84_8
; %bb.7:                                ;   in Loop: Header=BB84_4 Depth=1
	dec	__rc11
.LBB84_8:                               ;   in Loop: Header=BB84_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB84_10
; %bb.9:                                ;   in Loop: Header=BB84_4 Depth=1
	dex
.LBB84_10:                              ;   in Loop: Header=BB84_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB84_4
; %bb.11:                               ;   in Loop: Header=BB84_4 Depth=1
	tya
	bne	.LBB84_4
.LBB84_12:
	rts
.LBB84_13:
	cpx	__rc3
	bcs	.LBB84_14
; %bb.19:
	jmp	.LBB84_2
.LBB84_14:
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
.Lfunc_end84:
	.size	memmove, .Lfunc_end84-memmove
                                        ; -- End function
	.type	.L.str,@object                  ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"UPPERCASE lowercase."
	.size	.L.str, 21

	.type	.L.str.1,@object                ; @.str.1
.L.str.1:
	.asciz	"is currently beta and may destroy data structures on"
	.size	.L.str.1, 53

	.type	.L.str.2,@object                ; @.str.2
.L.str.2:
	.asciz	".d81 and real disks! Please work on backed up media."
	.size	.L.str.2, 53

	.type	.L.str.3,@object                ; @.str.3
.L.str.3:
	.asciz	"Press RETURN to continue, STOP to halt."
	.size	.L.str.3, 40

	.type	.L.str.4,@object                ; @.str.4
.L.str.4:
	.asciz	"Have fun with your Mega65!"
	.size	.L.str.4, 27

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
	.section	.zp.bss.BAMsector,"aw",@nobits
BAMsector:
	.zero	4
	.size	BAMsector, 4

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

	.type	.L__const.findnextBAMtracksector.strategy,@object ; @__const.findnextBAMtracksector.strategy
	.section	.rodata..L__const.findnextBAMtracksector.strategy,"a",@progbits
.L__const.findnextBAMtracksector.strategy:
	.ascii	"&)(*%+$,#-\".!/ 0\0371\0362\0353\0344\0335\0326\0317\0308\0279\026:\025;\024<\023=\022>\021?\020@\017A\016B\rC\fD\013E\nF\tG\bH\007I\006J\005K\004L\003M\002N\001O\000'"
	.size	.L__const.findnextBAMtracksector.strategy, 80

	.type	.L.str.13,@object               ; @.str.13
	.section	.rodata.str1.1,"aMS",@progbits,1
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

	.type	.L.str.30,@object               ; @.str.30
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.30:
	.asciz	" Midnight Mega "
	.size	.L.str.30, 16

	.type	.L.str.1.31,@object             ; @.str.1.31
.L.str.1.31:
	.asciz	" The Mega65 file commander "
	.size	.L.str.1.31, 28

	.type	.L.str.2.32,@object             ; @.str.2.32
.L.str.2.32:
	.asciz	"   OK   "
	.size	.L.str.2.32, 9

	.type	.L.str.3.33,@object             ; @.str.3.33
.L.str.3.33:
	.asciz	" Cancel "
	.size	.L.str.3.33, 9

	.type	.L.str.4.34,@object             ; @.str.4.34
.L.str.4.34:
	.asciz	"v0.2.1-beta"
	.size	.L.str.4.34, 12

	.type	.L.str.5.35,@object             ; @.str.5.35
.L.str.5.35:
	.asciz	"github.com/nobruinfo"
	.size	.L.str.5.35, 21

	.type	.L__const.progress.rc,@object   ; @__const.progress.rc
	.section	.rodata.cst4,"aM",@progbits,4
.L__const.progress.rc:
	.byte	12                              ; 0xc
	.byte	6                               ; 0x6
	.byte	68                              ; 0x44
	.byte	8                               ; 0x8
	.size	.L__const.progress.rc, 4

	.type	.L.str.8.36,@object             ; @.str.8.36
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.8.36:
	.asciz	"        "
	.size	.L.str.8.36, 9

	.type	.Lswitch.table.asciitoscreencode,@object ; @switch.table.asciitoscreencode
	.section	.rodata..Lswitch.table.asciitoscreencode,"a",@progbits
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
	.zero	1170
	.size	filelist, 1170

	.type	s,@object                       ; @s
	.section	.zp.bss.s,"aw",@nobits
s:
	.zero	40
	.size	s, 40

	.type	.L.str.1.38,@object             ; @.str.1.38
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1.38:
	.asciz	"1"
	.size	.L.str.1.38, 2

	.type	.L.str.2.39,@object             ; @.str.2.39
.L.str.2.39:
	.asciz	"Help  "
	.size	.L.str.2.39, 7

	.type	.L.str.3.40,@object             ; @.str.3.40
.L.str.3.40:
	.asciz	" 2"
	.size	.L.str.3.40, 3

	.type	.L.str.4.41,@object             ; @.str.4.41
.L.str.4.41:
	.asciz	"Mount "
	.size	.L.str.4.41, 7

	.type	.L.str.5.42,@object             ; @.str.5.42
.L.str.5.42:
	.asciz	" 3"
	.size	.L.str.5.42, 3

	.type	.L.str.6.43,@object             ; @.str.6.43
.L.str.6.43:
	.asciz	"View  "
	.size	.L.str.6.43, 7

	.type	.L.str.7.44,@object             ; @.str.7.44
.L.str.7.44:
	.asciz	" 4"
	.size	.L.str.7.44, 3

	.type	.L.str.8.45,@object             ; @.str.8.45
.L.str.8.45:
	.asciz	"Edit  "
	.size	.L.str.8.45, 7

	.type	.L.str.9.46,@object             ; @.str.9.46
.L.str.9.46:
	.asciz	" 5"
	.size	.L.str.9.46, 3

	.type	.L.str.10.47,@object            ; @.str.10.47
.L.str.10.47:
	.asciz	"Copy  "
	.size	.L.str.10.47, 7

	.type	.L.str.11.48,@object            ; @.str.11.48
.L.str.11.48:
	.asciz	" 6"
	.size	.L.str.11.48, 3

	.type	.L.str.12.49,@object            ; @.str.12.49
.L.str.12.49:
	.asciz	"RenMov"
	.size	.L.str.12.49, 7

	.type	.L.str.13.50,@object            ; @.str.13.50
.L.str.13.50:
	.asciz	" 7"
	.size	.L.str.13.50, 3

	.type	.L.str.14.51,@object            ; @.str.14.51
.L.str.14.51:
	.asciz	"Mkdir "
	.size	.L.str.14.51, 7

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

	.type	diskname,@object                ; @diskname
	.section	.bss.diskname,"aw",@nobits
diskname:
	.zero	34
	.size	diskname, 34

	.type	.L.str.21,@object               ; @.str.21
	.section	.rodata.str1.1,"aMS",@progbits,1
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

	.type	.L.str.30.54,@object            ; @.str.30.54
.L.str.30.54:
	.asciz	" drv:"
	.size	.L.str.30.54, 6

	.type	.L.str.31,@object               ; @.str.31
.L.str.31:
	.asciz	" blocks free "
	.size	.L.str.31, 14

	.type	.L.str.32,@object               ; @.str.32
.L.str.32:
	.asciz	"File copy,"
	.size	.L.str.32, 11

	.type	.L.str.33,@object               ; @.str.33
.L.str.33:
	.asciz	"destination disk space insufficient"
	.size	.L.str.33, 36

	.type	.L.str.34,@object               ; @.str.34
.L.str.34:
	.asciz	"from right to left"
	.size	.L.str.34, 19

	.type	.L.str.35,@object               ; @.str.35
.L.str.35:
	.asciz	"from left to right"
	.size	.L.str.35, 19

	.type	.L.str.36,@object               ; @.str.36
.L.str.36:
	.asciz	"Reading..."
	.size	.L.str.36, 11

	.type	.L.str.37.55,@object            ; @.str.37.55
.L.str.37.55:
	.asciz	"source file"
	.size	.L.str.37.55, 12

	.type	.L.str.38,@object               ; @.str.38
.L.str.38:
	.asciz	"BAM"
	.size	.L.str.38, 4

	.type	.L.str.39,@object               ; @.str.39
.L.str.39:
	.asciz	"Writing..."
	.size	.L.str.39, 11

	.type	.L.str.40,@object               ; @.str.40
.L.str.40:
	.asciz	"destination file"
	.size	.L.str.40, 17

	.type	.L.str.41,@object               ; @.str.41
.L.str.41:
	.asciz	"directory"
	.size	.L.str.41, 10

	.type	.L.str.42,@object               ; @.str.42
.L.str.42:
	.asciz	"File delete,"
	.size	.L.str.42, 13

	.type	.L.str.43,@object               ; @.str.43
.L.str.43:
	.asciz	"from right side"
	.size	.L.str.43, 16

	.type	.L.str.44,@object               ; @.str.44
.L.str.44:
	.asciz	"from left side"
	.size	.L.str.44, 15

	.type	.L.str.45,@object               ; @.str.45
.L.str.45:
	.asciz	"removing BAM entries"
	.size	.L.str.45, 21

	.type	.L.str.46,@object               ; @.str.46
.L.str.46:
	.asciz	"updating BAM"
	.size	.L.str.46, 13

	.type	.L.str.47,@object               ; @.str.47
.L.str.47:
	.asciz	"Navigation keys,"
	.size	.L.str.47, 17

	.type	.L.str.48,@object               ; @.str.48
.L.str.48:
	.asciz	"not yet implemented"
	.size	.L.str.48, 20

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

.set .LPutOneSector_zp_stk, .Lzp_stack+4
	.size	.LPutOneSector_zp_stk, 6
.set .LPutBAM_zp_stk, .Lzp_stack
	.size	.LPutBAM_zp_stk, 4
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
	.size	.Lcputln_zp_stk, 10
.set .Lclrhome_zp_stk, .Lzp_stack
	.size	.Lclrhome_zp_stk, 2
.set .Lfillrect_zp_stk, .Lzp_stack
	.size	.Lfillrect_zp_stk, 5
.set .Lmcputsxy_zp_stk, .Lzp_stack
	.size	.Lmcputsxy_zp_stk, 2
.set .Lcsputdec_zp_stk, .Lzp_stack+1
	.size	.Lcsputdec_zp_stk, 22
.set .Lmprintf_zp_stk, .Lzp_stack
	.size	.Lmprintf_zp_stk, 1
.set .Lgetdirententry_zp_stk, .Lzp_stack
	.size	.Lgetdirententry_zp_stk, 13
.set .LBAMSectorUpdate_zp_stk, .Lzp_stack+7
	.size	.LBAMSectorUpdate_zp_stk, 4
.set .LfindnextBAMtracksector_zp_stk, .Lzp_stack
	.size	.LfindnextBAMtracksector_zp_stk, 7
.set .Lmprintf_sstk, .Lstatic_stack
	.size	.Lmprintf_sstk, 3
.set .LfindnextBAMtracksector_sstk, .Lstatic_stack
	.size	.LfindnextBAMtracksector_sstk, 2
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

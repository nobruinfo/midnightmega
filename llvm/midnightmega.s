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
	adc	#231
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
	jsr	clrhome
	ldx	#mos16lo(.L.str.1)
	stx	__rc2
	ldx	#mos16hi(.L.str.1)
	stx	__rc3
	jsr	messagebox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	lda	#14
	ldx	#mos16lo(.L.str.2)
	stx	__rc2
	ldx	#mos16hi(.L.str.2)
	stx	__rc3
	ldx	#4
	jsr	mcputsxy
	lda	#40
	ldx	#mos16lo(.L.str.3)
	stx	__rc2
	ldx	#mos16hi(.L.str.3)
	stx	__rc3
	ldx	#4
	jsr	mcputsxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#22
	stx	mos8(g_curX)
	ldx	#7
	stx	mos8(g_curY)
	ldx	#mos16lo(.L.str.4)
	stx	__rc2
	ldx	#mos16hi(.L.str.4)
	stx	__rc3
	jsr	msprintf
.LBB0_16:                               ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB0_16
; %bb.17:
	stz	54800
	stz	7424
	ldx	#1
	stx	7680
	ldx	#3
	stx	__rc2
	ldx	#29
	stx	__rc3
	ldx	#mos16lo(.L.str.25)
	stx	__rc4
	ldx	#mos16hi(.L.str.25)
	stx	__rc5
	ldx	#0
	lda	#16
	jsr	memcpy
	ldx	#3
	stx	__rc2
	ldx	#30
	stx	__rc3
	ldx	#mos16lo(.L.str.25)
	stx	__rc4
	ldx	#mos16hi(.L.str.25)
	stx	__rc5
	ldx	#0
	lda	#16
	jsr	memcpy
	stz	7425
	stz	7681
	stz	__rc2
	lda	#0
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_18:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_57 Depth 2
                                        ;       Child Loop BB0_62 Depth 3
                                        ;         Child Loop BB0_25 Depth 4
                                        ;     Child Loop BB0_70 Depth 2
                                        ;     Child Loop BB0_129 Depth 2
                                        ;     Child Loop BB0_138 Depth 2
                                        ;     Child Loop BB0_179 Depth 2
                                        ;       Child Loop BB0_180 Depth 3
                                        ;     Child Loop BB0_78 Depth 2
                                        ;     Child Loop BB0_84 Depth 2
                                        ;     Child Loop BB0_87 Depth 2
                                        ;     Child Loop BB0_96 Depth 2
                                        ;     Child Loop BB0_118 Depth 2
                                        ;       Child Loop BB0_107 Depth 3
                                        ;       Child Loop BB0_112 Depth 3
                                        ;     Child Loop BB0_163 Depth 2
                                        ;       Child Loop BB0_164 Depth 3
                                        ;         Child Loop BB0_168 Depth 4
                                        ;         Child Loop BB0_147 Depth 4
                                        ;       Child Loop BB0_161 Depth 3
                                        ;     Child Loop BB0_74 Depth 2
	ldx	#1
	lda	#0
	stz	__rc23
; %bb.188:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_57
.LBB0_19:                               ;   in Loop: Header=BB0_62 Depth=3
	lda	#1
.LBB0_20:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	#32
	and	#1
	bne	.LBB0_22
; %bb.21:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	#62
.LBB0_22:                               ;   in Loop: Header=BB0_62 Depth=3
	stx	mos8(s)
	ldx	#32
	stx	mos8(s+1)
	ldy	#5
	lda	(__rc20),y
	cmp	#160
	bne	.LBB0_24
; %bb.23:                               ;   in Loop: Header=BB0_62 Depth=3
	stz	__rc28
	lda	#2
	bra	.LBB0_30
.LBB0_24:                               ;   in Loop: Header=BB0_62 Depth=3
	stz	__rc28
.LBB0_25:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_57 Depth=2
                                        ;       Parent Loop BB0_62 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldy	__rc28
	ldx	__rc28
	sta	mos8(s+2),x
	lda	__rc28
	clc
	adc	__rc20
	sta	__rc2
	lda	__rc21
	adc	#0
	sta	__rc3
	inc	__rc28
	sty	__rc4
	cpy	#15
	ldx	#1
	bcs	.LBB0_27
; %bb.26:                               ;   in Loop: Header=BB0_25 Depth=4
	ldx	#0
.LBB0_27:                               ;   in Loop: Header=BB0_25 Depth=4
	stx	__rc5
	ldy	#6
	lda	(__rc2),y
	cmp	#160
	beq	.LBB0_29
; %bb.28:                               ;   in Loop: Header=BB0_25 Depth=4
	ldx	__rc5
	beq	.LBB0_25
.LBB0_29:                               ;   in Loop: Header=BB0_62 Depth=3
	clc
	lda	__rc4
	adc	#3
	ldx	__rc5
	bne	.LBB0_33
.LBB0_30:                               ;   in Loop: Header=BB0_62 Depth=3
	sta	__rc2
	sta	__rc30
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
	bne	.LBB0_32
; %bb.31:                               ;   in Loop: Header=BB0_62 Depth=3
	inc	__rc4
.LBB0_32:                               ;   in Loop: Header=BB0_62 Depth=3
	tax
	lda	#32
	jsr	__memset
	lda	__rc30
	clc
	adc	#16
	sec
	sbc	__rc28
.LBB0_33:                               ;   in Loop: Header=BB0_62 Depth=3
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
	and	(__rc20),y
	ldx	#0
	sta	__rc4
	tay
	dec
	cpy	#0
	bne	.LBB0_35
; %bb.34:                               ;   in Loop: Header=BB0_62 Depth=3
	dex
.LBB0_35:                               ;   in Loop: Header=BB0_62 Depth=3
	cpx	#0
	bne	.LBB0_37
; %bb.36:                               ;   in Loop: Header=BB0_62 Depth=3
	cmp	#5
	bra	.LBB0_38
.LBB0_37:                               ;   in Loop: Header=BB0_62 Depth=3
	cpx	#0
.LBB0_38:                               ;   in Loop: Header=BB0_62 Depth=3
	lda	#68
	ldx	#69
	pha
	txa
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#76
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	bcs	.LBB0_40
; %bb.39:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	__rc4
	lda	.Lswitch.table.gettype-1,x
	ldy	.Lswitch.table.gettype.20-1,x
	pha
	tya
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	.Lswitch.table.gettype.21-1,x
	tax
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
.LBB0_40:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	__rc2
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
	ldy	#17
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
	ldx	__rc29
	bne	.LBB0_44
; %bb.41:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	__rc22
	cpx	__rc24
	bne	.LBB0_44
; %bb.42:                               ;   in Loop: Header=BB0_62 Depth=3
	pha
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	cpx	__rc23
	bne	.LBB0_44
; %bb.43:                               ;   in Loop: Header=BB0_62 Depth=3
	ora	#32
	bra	.LBB0_45
.LBB0_44:                               ;   in Loop: Header=BB0_62 Depth=3
	and	#223
.LBB0_45:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	__rc29
	bne	.LBB0_47
; %bb.46:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	#1
	ldy	__rc22
	cpy	__rc24
	beq	.LBB0_48
.LBB0_47:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	#0
.LBB0_48:                               ;   in Loop: Header=BB0_62 Depth=3
	ldy	#1
	stz	__rc2
	cpx	#0
	bne	.LBB0_50
; %bb.49:                               ;   in Loop: Header=BB0_62 Depth=3
	sty	__rc2
.LBB0_50:                               ;   in Loop: Header=BB0_62 Depth=3
	sta	mos8(g_curTextColor)
	lda	__rc2
	and	#1
	sta	__rc22
	ldx	__rc31
	inx
	ldy	#mos8(s)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	ldy	#15
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
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	ldy	#32
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	inc	__rc22
	dec	__rc22
	bne	.LBB0_52
; %bb.51:                               ;   in Loop: Header=BB0_62 Depth=3
	ldy	#60
.LBB0_52:                               ;   in Loop: Header=BB0_62 Depth=3
	sty	__rc2
	jsr	cputcxy
	ldx	__rc31
	inx
	bne	.LBB0_54
; %bb.53:                               ;   in Loop: Header=BB0_62 Depth=3
	inc	__rc27
.LBB0_54:                               ;   in Loop: Header=BB0_62 Depth=3
	lda	__rc27
	beq	.LBB0_55
; %bb.230:                              ;   in Loop: Header=BB0_62 Depth=3
	jmp	.LBB0_62
.LBB0_55:                               ;   in Loop: Header=BB0_62 Depth=3
	cpx	#22
	beq	.LBB0_56
; %bb.232:                              ;   in Loop: Header=BB0_62 Depth=3
	jmp	.LBB0_62
.LBB0_56:                               ;   in Loop: Header=BB0_57 Depth=2
	lda	#223
	and	mos8(g_curTextColor)
	ldx	mos8(g_curTextColor)
	stx	__rc20
	sta	mos8(g_curTextColor)
	jsr	cputln
	ldx	#0
	clc
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#2
	ldy	#1
	sty	__rc23
	pha
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	pla
	ldy	__rc2
	bne	.LBB0_57
; %bb.234:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_69
.LBB0_57:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_62 Depth 3
                                        ;         Child Loop BB0_25 Depth 4
	pha
	txa
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldy	#11
	sta	(__rc0),y                       ; 1-byte Folded Spill
	tax
	ldy	midnight,x
	sty	__rc22
	sty	__rc20
	lda	midnight+1,x
	tax
	stx	__rc25
	stx	__rc21
	lda	(__rc20)
	jsr	getdirent
	ldy	#2
	sta	(__rc20),y
	dey
	cmp	(__rc20),y
	bcs	.LBB0_59
; %bb.58:                               ;   in Loop: Header=BB0_57 Depth=2
	sta	(__rc20),y
.LBB0_59:                               ;   in Loop: Header=BB0_57 Depth=2
	ldx	#40
	lda	__rc23
	jsr	__mulqi3
	sta	__rc24
	clc
	adc	#39
	sta	__rc2
	ldx	#23
	stx	__rc3
	stz	__rc4
	ldx	#0
	lda	__rc24
	jsr	mcbox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	lda	__rc24
	ora	#2
	ldx	#mos16lo(.L.str.26)
	stx	__rc2
	ldx	#mos16hi(.L.str.26)
	stx	__rc3
                                        ; kill: def $rs1 killed $rs1
	pha
	lda	__rc2
	ldy	#17
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
	ldx	#mos16lo(.L.str.27)
	stx	__rc2
	ldx	#mos16hi(.L.str.27)
	stx	__rc3
	jsr	msprintf
	lda	(__rc20)
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
	ldx	__rc24
	stx	__rc27
	lda	__rc24
	clc
	adc	#10
	pha
	ldy	#17
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
	lda	__rc25
	adc	#0
	sta	__rc3
	jsr	msprintf
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldy	#1
	lda	(__rc20),y
	sta	__rc24
	cmp	#21
	stz	__rc25
	stz	__rc26
	bcc	.LBB0_61
; %bb.60:                               ;   in Loop: Header=BB0_57 Depth=2
	clc
	adc	#235
	sta	__rc25
	lda	#0
	adc	#255
	sta	__rc26
.LBB0_61:                               ;   in Loop: Header=BB0_57 Depth=2
	lda	__rc27
	ora	#1
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc27
	ldx	#0
.LBB0_62:                               ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_57 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_25 Depth 4
	stx	__rc31
	txa
	clc
	adc	__rc25
	ldx	#1
	bcs	.LBB0_64
; %bb.63:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	#0
.LBB0_64:                               ;   in Loop: Header=BB0_62 Depth=3
	stx	__rc28
	sta	__rc22
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
	bne	.LBB0_66
; %bb.65:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	__rc20
	cpx	__rc2
	bne	.LBB0_66
; %bb.236:                              ;   in Loop: Header=BB0_57 Depth=2
	jmp	.LBB0_56
.LBB0_66:                               ;   in Loop: Header=BB0_62 Depth=3
	lda	__rc27
	ldx	__rc28
	cpx	#1
	adc	__rc26
	sta	__rc29
	beq	.LBB0_67
; %bb.238:                              ;   in Loop: Header=BB0_62 Depth=3
	jmp	.LBB0_19
.LBB0_67:                               ;   in Loop: Header=BB0_62 Depth=3
	ldx	__rc22
	cpx	__rc24
	beq	.LBB0_68
; %bb.240:                              ;   in Loop: Header=BB0_62 Depth=3
	jmp	.LBB0_19
.LBB0_68:                               ;   in Loop: Header=BB0_62 Depth=3
	lda	#0
; %bb.190:                              ;   in Loop: Header=BB0_62 Depth=3
	jmp	.LBB0_20
.LBB0_69:                               ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc20
	and	#208
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
	ldx	#mos16lo(.L.str.7)
	stx	__rc2
	ldx	#mos16hi(.L.str.7)
	stx	__rc3
	jsr	msprintf
	ldx	__rc21
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.8.44)
	stx	__rc2
	ldx	#mos16hi(.L.str.8.44)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.9.45)
	stx	__rc2
	ldx	#mos16hi(.L.str.9.45)
	stx	__rc3
	jsr	msprintf
	ldx	__rc23
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.10.46)
	stx	__rc2
	ldx	#mos16hi(.L.str.10.46)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.11.47)
	stx	__rc2
	ldx	#mos16hi(.L.str.11.47)
	stx	__rc3
	jsr	msprintf
	ldx	__rc21
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.12.48)
	stx	__rc2
	ldx	#mos16hi(.L.str.12.48)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.13.49)
	stx	__rc2
	ldx	#mos16hi(.L.str.13.49)
	stx	__rc3
	jsr	msprintf
	ldx	__rc21
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.14.50)
	stx	__rc2
	ldx	#mos16hi(.L.str.14.50)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.15.51)
	stx	__rc2
	ldx	#mos16hi(.L.str.15.51)
	stx	__rc3
	jsr	msprintf
	ldx	__rc23
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.16.52)
	stx	__rc2
	ldx	#mos16hi(.L.str.16.52)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.17.53)
	stx	__rc2
	ldx	#mos16hi(.L.str.17.53)
	stx	__rc3
	jsr	msprintf
	ldx	__rc21
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.18.54)
	stx	__rc2
	ldx	#mos16hi(.L.str.18.54)
	stx	__rc3
	jsr	msprintf
	ldx	__rc22
	stx	mos8(g_curTextColor)
	ldx	#mos16lo(.L.str.19.55)
	stx	__rc2
	ldx	#mos16hi(.L.str.19.55)
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
	ldy	#10
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
	sta	__rc28
	sta	__rc26
	ldy	#1
	lda	(__rc2),y
	sta	__rc29
	sta	__rc27
	lda	(__rc26)
	jsr	getdirent
	ldy	#2
	sta	(__rc26),y
.LBB0_70:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	54800
	beq	.LBB0_70
; %bb.71:                               ;   in Loop: Header=BB0_18 Depth=1
	sec
	sta	__rc20
	sbc	#241
	stz	54800
	cmp	#34
	bcc	.LBB0_72
; %bb.242:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_97
.LBB0_72:                               ;   in Loop: Header=BB0_18 Depth=1
	tax
	ldy	.LJTI0_0,x
	lda	.LJTI0_0+34,x
	tax
	sty	__rc2
	stx	__rc3
	jmp	(__rc2)
.LBB0_73:                               ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.28)
	stx	__rc2
	ldx	#mos16hi(.L.str.28)
	stx	__rc3
	jsr	messagebox
.LBB0_74:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_74
; %bb.75:                               ;   in Loop: Header=BB0_18 Depth=1
	stz	54800
; %bb.192:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_76:                               ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	lda	(__rc26),y
	jsr	getdirententry
	ldx	__rc20
	cpx	#245
	beq	.LBB0_77
; %bb.244:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_128
.LBB0_77:                               ;   in Loop: Header=BB0_18 Depth=1
	lda	(__rc26)
	tax
	ldy	#3
	lda	(__rc2),y
	sta	__rc6
	iny
                                        ; kill: def $rs1 killed $rs1
	phy
	lda	__rc2
	ldy	#11
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc3
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	lda	(__rc2),y
	stx	__rc5
	stz	__rc2
	ldx	#8
	stx	__rc3
	ldx	#199
	stx	__rc4
	sta	__rc7
	ldx	#16
	lda	#0
	jsr	readblockchain
	clc
	lda	__rc0
	adc	#22
	sta	__rc22
	lda	__rc1
	adc	#0
	sta	__rc23
	lda	#0
	stz	__rc30
	sta	(__rc22)
	clc
	lda	__rc0
	adc	#21
	sta	__rc24
	lda	__rc1
	adc	#0
	sta	__rc25
	lda	#255
	tax
	pha
	txa
	ldy	#17
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
                                        ; kill: def $rs13 killed $rs13
	lda	__rc26
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc27
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	(__rc26)
	stz	53376
	ldx	mos8(worksector.0)
	pha
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stx	__rc26
	ldx	mos8(worksector.0+1)
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stx	__rc27
	clc
	lda	__rc0
	adc	#20
	sta	__rc28
	lda	__rc1
	adc	#0
	sta	__rc29
	ldx	__rc28
	stx	__rc2
	sta	__rc3
	clc
	lda	__rc0
	adc	#19
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
	ldy	#9
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc28
	lda	(__rc20)
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc29
.LBB0_78:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stx	__rc21
	txa
	clc
	adc	#16
	sta	__rc10
	lda	#0
	adc	#0
	sta	__rc2
	lda	#0
	adc	#8
	sta	__rc3
	ldy	#16
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
	beq	.LBB0_80
; %bb.79:                               ;   in Loop: Header=BB0_78 Depth=2
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
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_80:                               ;   in Loop: Header=BB0_78 Depth=2
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
	beq	.LBB0_86
; %bb.81:                               ;   in Loop: Header=BB0_78 Depth=2
	ldx	__rc21
	inx
	ldy	__rc30
	sty	__rc28
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
	cpx	#199
	beq	.LBB0_82
; %bb.246:                              ;   in Loop: Header=BB0_78 Depth=2
	jmp	.LBB0_78
.LBB0_82:                               ;   in Loop: Header=BB0_18 Depth=1
	lda	__rc30
	beq	.LBB0_86
; %bb.83:                               ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.12)
	stx	__rc2
	ldx	#mos16hi(.L.str.12)
	stx	__rc3
	jsr	messagebox
.LBB0_84:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_84
; %bb.85:                               ;   in Loop: Header=BB0_18 Depth=1
	stz	54800
.LBB0_86:                               ;   in Loop: Header=BB0_18 Depth=1
	ldy	#3
	phy
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc10
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc11
	ldy	#9
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc10),y
	ldx	#3
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#40
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#4
	phy
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc10),y
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc26
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc27
	lda	(__rc26)
	sta	__rc22
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
	stx	__rc28
	ldx	mos8(direntryblock.0+1)
	stx	__rc29
	ldx	mos8(direntryblock.1)
	ldy	mos8(direntryblock.1+1)
	lda	#8
	phy
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	stz	__rc2
	stz	__rc3
	stx	__rc24
	stx	__rc4
	sty	__rc25
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
	stz	__rc30
.LBB0_87:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lsr
	stx	__rc23
	stx	__rc20
	ror	__rc20
	stz	__rc21
	ror	__rc21
	lsr
	ror	__rc20
	ror	__rc21
	lsr
	ror	__rc20
	ror	__rc21
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
	ldx	__rc20
	lda	__rc21
	jsr	lcopy
	ldx	6656
	beq	.LBB0_89
; %bb.88:                               ;   in Loop: Header=BB0_87 Depth=2
	clc
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	__rc30
	adc	#0
	sta	__rc3
	ldy	6657
	tya
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	bra	.LBB0_90
.LBB0_89:                               ;   in Loop: Header=BB0_87 Depth=2
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	ldy	__rc30
	sty	__rc3
.LBB0_90:                               ;   in Loop: Header=BB0_87 Depth=2
	lda	#15
	and	6658
	bne	.LBB0_91
; %bb.248:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_177
.LBB0_91:                               ;   in Loop: Header=BB0_87 Depth=2
	ldx	__rc23
	inx
	lda	#0
	cmp	__rc3
	bne	.LBB0_93
; %bb.92:                               ;   in Loop: Header=BB0_87 Depth=2
	cpx	__rc2
	bra	.LBB0_94
.LBB0_93:                               ;   in Loop: Header=BB0_87 Depth=2
	cmp	__rc3
.LBB0_94:                               ;   in Loop: Header=BB0_87 Depth=2
	pha
	lda	__rc2
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldy	__rc3
	sty	__rc30
	bcs	.LBB0_95
; %bb.250:                              ;   in Loop: Header=BB0_87 Depth=2
	jmp	.LBB0_87
.LBB0_95:                               ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.18)
	stx	__rc2
	ldx	#mos16hi(.L.str.18)
	stx	__rc3
	jsr	messagebox
.LBB0_96:                               ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_96
; %bb.194:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_139
.LBB0_97:                               ;   in Loop: Header=BB0_18 Depth=1
	ldx	__rc20
	cpx	#145
	bne	.LBB0_100
; %bb.98:                               ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	lda	(__rc26),y
	bne	.LBB0_99
; %bb.252:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_99:                               ;   in Loop: Header=BB0_18 Depth=1
	dec
	sta	(__rc26),y
; %bb.196:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_100:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.24)
	stx	__rc2
	ldx	#mos16hi(.L.str.24)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc20
	jsr	mprintf
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	ldy	#32
	sty	__rc2
	jsr	cputcxy
; %bb.198:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_101:                              ;   in Loop: Header=BB0_18 Depth=1
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
	stz	__rc21
	cpx	#255
	bne	.LBB0_102
; %bb.254:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_143
.LBB0_102:                              ;   in Loop: Header=BB0_18 Depth=1
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
	bne	.LBB0_103
; %bb.256:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_143
.LBB0_103:                              ;   in Loop: Header=BB0_18 Depth=1
	cmp	#135
	bne	.LBB0_104
; %bb.258:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_143
.LBB0_104:                              ;   in Loop: Header=BB0_18 Depth=1
	cmp	#255
	bne	.LBB0_105
; %bb.260:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_143
.LBB0_105:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#0
; %bb.200:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_118
.LBB0_106:                              ;   in Loop: Header=BB0_118 Depth=2
	ldy	#0
	ldx	#0
.LBB0_107:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_118 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	6721,y
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
	cpy	#8
	bne	.LBB0_107
.LBB0_111:                              ;   in Loop: Header=BB0_118 Depth=2
	ldy	#0
	lda	#46
	sta	7233,x
	inx
.LBB0_112:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_118 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	6729,y
	cmp	#32
	beq	.LBB0_116
; %bb.113:                              ;   in Loop: Header=BB0_112 Depth=3
	cmp	#33
	bcc	.LBB0_115
; %bb.114:                              ;   in Loop: Header=BB0_112 Depth=3
	sta	7233,x
	inx
.LBB0_115:                              ;   in Loop: Header=BB0_112 Depth=3
	iny
	cpy	#3
	bne	.LBB0_112
.LBB0_116:                              ;   in Loop: Header=BB0_118 Depth=2
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
	ldy	__rc22
	inc	__rc21
.LBB0_117:                              ;   in Loop: Header=BB0_118 Depth=2
	lda	__rc20
	ldx	__rc22
	inx
	cpy	#17
	bcc	.LBB0_118
; %bb.262:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_142
.LBB0_118:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_107 Depth 3
                                        ;       Child Loop BB0_112 Depth 3
	stx	__rc22
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
	beq	.LBB0_120
; %bb.119:                              ;   in Loop: Header=BB0_118 Depth=2
	cpy	#255
	beq	.LBB0_120
; %bb.264:                              ;   in Loop: Header=BB0_118 Depth=2
	jmp	.LBB0_106
.LBB0_120:                              ;   in Loop: Header=BB0_118 Depth=2
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
	ldy	__rc22
	bra	.LBB0_117
.LBB0_121:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	54801
	cpx	#1
	bne	.LBB0_122
; %bb.266:
	jmp	.LBB0_184
.LBB0_122:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	54801
	cpx	#2
	beq	.LBB0_202
; %bb.268:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_202:
	jmp	.LBB0_184
.LBB0_123:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#1
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	beq	.LBB0_125
; %bb.124:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#0
.LBB0_125:                              ;   in Loop: Header=BB0_18 Depth=1
	txa
	bne	.LBB0_126
; %bb.270:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_140
.LBB0_126:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#1
; %bb.204:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_141
.LBB0_127:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#1
	lda	(__rc26),y
	inc
	sta	(__rc26),y
; %bb.206:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_128:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	#0
	ldy	#2
	sta	(__rc2),y
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
	lda	(__rc26)
	sta	__rc23
	dey
	lda	(__rc26),y
	sta	__rc24
	lda	#0
	stz	53376
	stz	__rc22
	ldx	#3
	pha
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#40
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	mos8(direntryblock.0)
	stx	__rc25
	ldx	mos8(direntryblock.0+1)
	stx	__rc28
	ldx	#8
	txa
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stz	__rc29
.LBB0_129:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lsr
	ldx	__rc22
	stx	__rc20
	ror	__rc20
	stz	__rc21
	ror	__rc21
	lsr
	ror	__rc20
	ror	__rc21
	lsr
	ror	__rc20
	ror	__rc21
	stz	__rc2
	ldx	#8
	stx	__rc3
	ldx	__rc25
	stx	__rc4
	ldx	__rc28
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc20
	lda	__rc21
	jsr	lcopy
	ldx	6656
	beq	.LBB0_131
; %bb.130:                              ;   in Loop: Header=BB0_129 Depth=2
	clc
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	__rc29
	adc	#0
	sta	__rc3
	ldy	6657
	tya
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	bra	.LBB0_132
.LBB0_131:                              ;   in Loop: Header=BB0_129 Depth=2
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	ldx	__rc29
	stx	__rc3
.LBB0_132:                              ;   in Loop: Header=BB0_129 Depth=2
	ldx	__rc24
	cpx	__rc22
	bne	.LBB0_133
; %bb.272:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_178
.LBB0_133:                              ;   in Loop: Header=BB0_129 Depth=2
	ldx	__rc22
	inx
	lda	#0
	cmp	__rc3
	bne	.LBB0_135
; %bb.134:                              ;   in Loop: Header=BB0_129 Depth=2
	cpx	__rc2
	bra	.LBB0_136
.LBB0_135:                              ;   in Loop: Header=BB0_129 Depth=2
	cmp	__rc3
.LBB0_136:                              ;   in Loop: Header=BB0_129 Depth=2
	stx	__rc22
	pha
	lda	__rc2
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldx	__rc3
	stx	__rc29
	bcs	.LBB0_137
; %bb.274:                              ;   in Loop: Header=BB0_129 Depth=2
	jmp	.LBB0_129
.LBB0_137:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#mos16lo(.L.str.19)
	stx	__rc2
	ldx	#mos16hi(.L.str.19)
	stx	__rc3
	jsr	messagebox
.LBB0_138:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_138
.LBB0_139:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	54800
; %bb.208:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_176
.LBB0_140:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#0
.LBB0_141:                              ;   in Loop: Header=BB0_18 Depth=1
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	eor	#1
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	asl
	tax
	ldy	midnight,x
	lda	midnight+1,x
	tax
	sty	__rc20
	stx	__rc21
	lda	(__rc20)
	jsr	getdirent
	ldy	#2
	sta	(__rc20),y
; %bb.210:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_142:                              ;   in Loop: Header=BB0_18 Depth=1
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
.LBB0_143:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	#0
; %bb.212:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_163
.LBB0_144:                              ;   in Loop: Header=BB0_168 Depth=4
	ora	#32
; %bb.214:                              ;   in Loop: Header=BB0_168 Depth=4
	jmp	.LBB0_172
.LBB0_145:                              ;   in Loop: Header=BB0_164 Depth=3
	lda	mos8(g_curTextColor)
.LBB0_146:                              ;   in Loop: Header=BB0_164 Depth=3
	and	#223
	sta	mos8(g_curTextColor)
	jsr	cputln
.LBB0_147:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_163 Depth=2
                                        ;       Parent Loop BB0_164 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	lda	54800
	beq	.LBB0_147
; %bb.148:                              ;   in Loop: Header=BB0_164 Depth=3
	stz	54800
	ldy	#1
	cmp	#145
	beq	.LBB0_153
; %bb.149:                              ;   in Loop: Header=BB0_164 Depth=3
	cmp	#13
	beq	.LBB0_156
; %bb.150:                              ;   in Loop: Header=BB0_164 Depth=3
	cmp	#17
	beq	.LBB0_155
; %bb.151:                              ;   in Loop: Header=BB0_164 Depth=3
	cmp	#27
	bne	.LBB0_152
; %bb.276:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_152:                              ;   in Loop: Header=BB0_164 Depth=3
	ldx	#mos16lo(.L.str.24)
	stx	__rc2
	ldx	#mos16hi(.L.str.24)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	jsr	mprintf
	ldy	#1
	ldx	__rc20
; %bb.216:                              ;   in Loop: Header=BB0_164 Depth=3
	jmp	.LBB0_164
.LBB0_153:                              ;   in Loop: Header=BB0_164 Depth=3
	ldx	#0
	lda	__rc20
	bne	.LBB0_154
; %bb.278:                              ;   in Loop: Header=BB0_164 Depth=3
	jmp	.LBB0_164
.LBB0_154:                              ;   in Loop: Header=BB0_164 Depth=3
	dec	__rc20
	ldx	__rc20
; %bb.218:                              ;   in Loop: Header=BB0_164 Depth=3
	jmp	.LBB0_164
.LBB0_155:                              ;   in Loop: Header=BB0_164 Depth=3
	inc	__rc20
	ldx	__rc20
; %bb.220:                              ;   in Loop: Header=BB0_164 Depth=3
	jmp	.LBB0_164
.LBB0_156:                              ;   in Loop: Header=BB0_163 Depth=2
	lda	(__rc26)
	sta	__rc24
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc20
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
	lda	__rc24
	beq	.LBB0_158
; %bb.157:                              ;   in Loop: Header=BB0_163 Depth=2
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
	bra	.LBB0_159
.LBB0_158:                              ;   in Loop: Header=BB0_163 Depth=2
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
.LBB0_159:                              ;   in Loop: Header=BB0_163 Depth=2
	lda	__rc2
	bne	.LBB0_160
; %bb.280:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_175
.LBB0_160:                              ;   in Loop: Header=BB0_163 Depth=2
	ldx	#mos16lo(.L.str.23)
	stx	__rc2
	ldx	#mos16hi(.L.str.23)
	stx	__rc3
	jsr	messagebox
.LBB0_161:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_163 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	54800
	beq	.LBB0_161
; %bb.162:                              ;   in Loop: Header=BB0_163 Depth=2
	stz	54800
	ldx	__rc20
.LBB0_163:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_164 Depth 3
                                        ;         Child Loop BB0_168 Depth 4
                                        ;         Child Loop BB0_147 Depth 4
                                        ;       Child Loop BB0_161 Depth 3
	ldy	#1
.LBB0_164:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_163 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_168 Depth 4
                                        ;         Child Loop BB0_147 Depth 4
	cpx	__rc21
	bcs	.LBB0_166
; %bb.165:                              ;   in Loop: Header=BB0_164 Depth=3
	stx	__rc20
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc20
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
	bne	.LBB0_167
.LBB0_166:                              ;   in Loop: Header=BB0_164 Depth=3
	stz	__rc20
.LBB0_167:                              ;   in Loop: Header=BB0_164 Depth=3
	ldx	#5
	txa
	phy
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
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
	jsr	msprintf
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	__rc20
	stx	__rc24
	stz	__rc25
.LBB0_168:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_163 Depth=2
                                        ;       Parent Loop BB0_164 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	lda	(__rc22)
	tax
	lda	mos8(g_curTextColor)
	cpx	#0
	bne	.LBB0_169
; %bb.282:                              ;   in Loop: Header=BB0_164 Depth=3
	jmp	.LBB0_146
.LBB0_169:                              ;   in Loop: Header=BB0_168 Depth=4
	ldx	__rc25
	bne	.LBB0_171
; %bb.170:                              ;   in Loop: Header=BB0_168 Depth=4
	ldx	__rc24
	bne	.LBB0_171
; %bb.284:                              ;   in Loop: Header=BB0_168 Depth=4
	jmp	.LBB0_144
.LBB0_171:                              ;   in Loop: Header=BB0_168 Depth=4
	and	#223
.LBB0_172:                              ;   in Loop: Header=BB0_168 Depth=4
	sta	mos8(g_curTextColor)
	ldx	__rc22
	stx	__rc2
	ldx	__rc23
	stx	__rc3
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc30
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
	inc	__rc30
	ldx	__rc24
	dec	__rc24
	cpx	#0
	bne	.LBB0_174
; %bb.173:                              ;   in Loop: Header=BB0_168 Depth=4
	dec	__rc25
.LBB0_174:                              ;   in Loop: Header=BB0_168 Depth=4
	lda	__rc30
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc30
	cpx	#23
	bne	.LBB0_168
; %bb.222:                              ;   in Loop: Header=BB0_164 Depth=3
	jmp	.LBB0_145
.LBB0_175:                              ;   in Loop: Header=BB0_18 Depth=1
	clc
	lda	__rc28
	adc	#3
	sta	__rc2
	lda	__rc29
	adc	#0
	sta	__rc3
	ldx	__rc22
	stx	__rc4
	ldx	__rc23
	stx	__rc5
	jsr	strcpy
.LBB0_176:                              ;   in Loop: Header=BB0_18 Depth=1
	lda	(__rc26)
	jsr	getdirent
	ldy	#2
	sta	(__rc26),y
; %bb.224:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_18
.LBB0_177:                              ;   in Loop: Header=BB0_18 Depth=1
	stx	6912
	ldx	6657
	stx	6913
	stz	__rc2
	stz	__rc3
	ldx	__rc21
	stx	__rc4
	ldx	__rc20
	stx	__rc5
	stz	__rc6
	ldx	#8
	stx	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc25
	lda	__rc24
	jsr	lcopy
	lda	__rc23
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
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	lda	__rc22
; %bb.226:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_183
.LBB0_178:                              ;   in Loop: Header=BB0_18 Depth=1
	stz	6658
	stz	__rc2
	stz	__rc3
	ldx	__rc21
	stx	__rc4
	ldx	__rc20
	stx	__rc5
	stz	__rc6
	ldx	#8
	stx	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc28
	lda	__rc25
	jsr	lcopy
	lda	__rc24
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
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	lda	__rc23
	jsr	PutOneSector
	ldx	6659
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
	ldx	6660
	stx	__rc24
	stz	53376
	ldx	mos8(BAMsector.0)
	stx	__rc2
	ldx	mos8(BAMsector.0+1)
	stx	__rc3
	ldx	#1
	stx	__rc4
	ldx	#40
	lda	__rc23
	jsr	GetOneSector
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc2
	sty	__rc3
	ldx	5632
	ldy	5633
	sty	__rc4
	lda	__rc23
	jsr	GetOneSector
	lda	__rc22
	bne	.LBB0_179
; %bb.286:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_182
.LBB0_179:                              ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_180 Depth 3
	clc
	lda	__rc0
	adc	#23
	sta	__rc20
	lda	__rc1
	adc	#0
	sta	__rc21
	ldx	mos8(worksectorasBAM.0)
	ldy	mos8(worksectorasBAM.0+1)
	stx	__rc2
	sty	__rc3
	ldx	__rc24
	stx	__rc4
	ldx	__rc22
	lda	__rc23
	jsr	GetOneSector
	lda	mos8(worksector.0)
	sta	(__rc20)
	lda	mos8(worksector.0+1)
	ldy	#1
	sta	(__rc20),y
	ldx	mos8(BAMsector.0)
	ldy	mos8(BAMsector.0+1)
	stx	__rc2
	sty	__rc3
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc4
	sty	__rc5
	stz	__rc6
	ldx	__rc24
	lda	__rc22
	jsr	BAMSectorUpdate
	ldx	#42
	stx	mos8(g_curX)
	stz	mos8(g_curY)
	ldx	#mos16lo(.L.str.13)
	stx	__rc2
	ldx	#mos16hi(.L.str.13)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc22
	jsr	mprintf
	ldx	#mos16lo(.L.str.14)
	stx	__rc2
	ldx	#mos16hi(.L.str.14)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	#0
	lda	__rc24
	jsr	mprintf
	jsr	cputln
	ldx	#42
	stx	mos8(g_curX)
	ldx	#1
	stx	mos8(g_curY)
	ldx	#mos16lo(.L.str.15)
	stx	__rc2
	ldx	#mos16hi(.L.str.15)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	__rc21
	lda	__rc20
	jsr	mh4printf
	jsr	cputln
	ldx	#42
	stx	mos8(g_curX)
	ldx	#2
	stx	mos8(g_curY)
	lda	mos8(worksector.0)
	ldx	mos8(worksector.0+1)
	ldy	#mos16lo(.L.str.16)
	sty	__rc2
	ldy	#mos16hi(.L.str.16)
	sty	__rc3
	stz	__rc4
	stz	__rc5
	jsr	mh4printf
	jsr	cputln
.LBB0_180:                              ;   Parent Loop BB0_18 Depth=1
                                        ;     Parent Loop BB0_179 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	54800
	beq	.LBB0_180
; %bb.181:                              ;   in Loop: Header=BB0_179 Depth=2
	stz	54800
	lda	(__rc20)
	sta	__rc2
	ldy	#1
	lda	(__rc20),y
	sta	__rc3
	lda	(__rc2)
	sta	__rc22
	lda	(__rc2),y
	sta	__rc24
	lda	__rc22
	beq	.LBB0_182
; %bb.288:                              ;   in Loop: Header=BB0_179 Depth=2
	jmp	.LBB0_179
.LBB0_182:                              ;   in Loop: Header=BB0_18 Depth=1
	ldx	mos8(BAMsector.0)
	ldy	mos8(BAMsector.0+1)
	stx	__rc2
	sty	__rc3
	ldx	#1
	stx	__rc4
	ldx	#40
	lda	__rc23
	jsr	PutOneSector
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc2
	sty	__rc3
	ldx	5632
	ldy	5633
	sty	__rc4
	lda	__rc23
.LBB0_183:                              ;   in Loop: Header=BB0_18 Depth=1
	jsr	PutOneSector
; %bb.228:                              ;   in Loop: Header=BB0_18 Depth=1
	jmp	.LBB0_176
.LBB0_184:
	jsr	clrhome
	ldx	#mos16lo(.L.str.5)
	stx	__rc2
	ldx	#mos16hi(.L.str.5)
	stx	__rc3
	jsr	msprintf
	jsr	cputln
.LBB0_185:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB0_185
.LBB0_186:                              ; =>This Inner Loop Header: Depth=1
	stz	54800
	ldx	54800
	bne	.LBB0_186
; %bb.187:
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
	adc	#25
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
	.byte	.LBB0_73@mos16lo
	.byte	.LBB0_101@mos16lo
	.byte	.LBB0_73@mos16lo
	.byte	.LBB0_73@mos16lo
	.byte	.LBB0_76@mos16lo
	.byte	.LBB0_73@mos16lo
	.byte	.LBB0_73@mos16lo
	.byte	.LBB0_76@mos16lo
	.byte	.LBB0_73@mos16lo
	.byte	.LBB0_121@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_123@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_73@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_100@mos16lo
	.byte	.LBB0_127@mos16lo
	.byte	.LBB0_176@mos16lo
	.byte	.LBB0_73@mos16hi
	.byte	.LBB0_101@mos16hi
	.byte	.LBB0_73@mos16hi
	.byte	.LBB0_73@mos16hi
	.byte	.LBB0_76@mos16hi
	.byte	.LBB0_73@mos16hi
	.byte	.LBB0_73@mos16hi
	.byte	.LBB0_76@mos16hi
	.byte	.LBB0_73@mos16hi
	.byte	.LBB0_121@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_123@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_73@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_100@mos16hi
	.byte	.LBB0_127@mos16hi
	.byte	.LBB0_176@mos16hi
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
	ldy	__rc20
	phy
	ldy	__rc21
	phy
	ldy	__rc4
	sty	mos8(.LPutOneSector_zp_stk+2)
	ldy	__rc2
	sty	__rc20
	ldy	__rc3
	sty	__rc21
	ldy	__rc4
	sty	__rc2
	stx	mos8(.LPutOneSector_zp_stk)
	sta	mos8(.LPutOneSector_zp_stk+1)
	jsr	ReadSector
	ldy	#108
	ldx	mos8(.LPutOneSector_zp_stk+2)
	stx	mos8(.LPutOneSector_zp_stk+3)
	lsr	mos8(.LPutOneSector_zp_stk+2)
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
	ldx	__rc21
	lda	__rc20
	jsr	lcopy
	ldx	mos8(.LPutOneSector_zp_stk+3)
	lda	mos8(.LPutOneSector_zp_stk+1)
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
	ldy	mos8(.LPutOneSector_zp_stk)
	sta	53376
	ldx	#32
	stx	53377
	dey
	sty	53380
	ldx	mos8(.LPutOneSector_zp_stk+2)
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
	bra	.LBB3_10
.LBB3_9:
	lda	54921
	and	#127
	sta	54921
.LBB3_10:
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.Lfunc_end3:
	.size	PutOneSector, .Lfunc_end3-PutOneSector
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
	ldy	__rc24
	sty	.LBAMSectorUpdate_sstk+3        ; 1-byte Folded Spill
	stx	__rc24
	ldx	__rc6
	stx	__rc22
	cmp	#41
	bcc	.LBB4_2
; %bb.1:
	ldx	__rc4
	stx	__rc20
	ldx	__rc5
	stx	__rc21
	clc
	adc	#216
	sta	__rc23
	bra	.LBB4_3
.LBB4_2:
	sta	__rc23
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
.LBB4_3:
	ldx	#42
	stx	mos8(g_curX)
	ldx	#20
	stx	mos8(g_curY)
	ldx	#mos16lo(.L.str.11)
	stx	__rc2
	ldx	#mos16hi(.L.str.11)
	stx	__rc3
	stz	__rc4
	stz	__rc5
	ldx	__rc21
	lda	__rc20
	jsr	mh4printf
	jsr	cputln
.LBB4_4:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB4_4
; %bb.5:
	stz	54800
	dec	__rc23
	lda	__rc22
	beq	.LBB4_8
; %bb.6:
	ldx	__rc24
	cpx	#8
	bcs	.LBB4_10
; %bb.7:
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	stx	.LBAMSectorUpdate_sstk+1        ; 1-byte Folded Spill
	ldy	__rc23
	sty	.LBAMSectorUpdate_sstk+2        ; 1-byte Folded Spill
	lda	__rc23
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
	jmp	.LBB4_23
.LBB4_8:
	lda	__rc24
	cmp	#8
	bcc	.LBB4_9
; %bb.43:
	jmp	.LBB4_12
.LBB4_9:
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	stx	.LBAMSectorUpdate_sstk+1        ; 1-byte Folded Spill
	ldy	__rc23
	sty	.LBAMSectorUpdate_sstk+2        ; 1-byte Folded Spill
	lda	__rc23
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
; %bb.29:
	jmp	.LBB4_25
.LBB4_10:
	ldx	__rc24
	cpx	#16
	ldx	#0
	bcc	.LBB4_11
; %bb.45:
	jmp	.LBB4_14
.LBB4_11:
	clc
	lda	__rc24
	adc	#248
	sta	__rc24
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	.LBAMSectorUpdate_sstk+1        ; 1-byte Folded Spill
	ldy	__rc23
	sty	.LBAMSectorUpdate_sstk+2        ; 1-byte Folded Spill
	lda	__rc23
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
	jmp	.LBB4_23
.LBB4_12:
	cmp	#16
	bcc	.LBB4_13
; %bb.47:
	jmp	.LBB4_16
.LBB4_13:
	clc
	adc	#248
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	.LBAMSectorUpdate_sstk+1        ; 1-byte Folded Spill
	ldy	__rc23
	sty	.LBAMSectorUpdate_sstk+2        ; 1-byte Folded Spill
	sta	__rc24
	lda	__rc23
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
; %bb.33:
	jmp	.LBB4_25
.LBB4_14:
	ldy	__rc24
	cpy	#24
	bcc	.LBB4_15
; %bb.49:
	jmp	.LBB4_18
.LBB4_15:
	clc
	lda	__rc24
	adc	#240
	sta	__rc24
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	.LBAMSectorUpdate_sstk+1        ; 1-byte Folded Spill
	ldy	__rc23
	sty	.LBAMSectorUpdate_sstk+2        ; 1-byte Folded Spill
	lda	__rc23
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
	jmp	.LBB4_23
.LBB4_16:
	cmp	#24
	bcc	.LBB4_17
; %bb.51:
	jmp	.LBB4_20
.LBB4_17:
	clc
	adc	#240
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	.LBAMSectorUpdate_sstk+1        ; 1-byte Folded Spill
	ldy	__rc23
	sty	.LBAMSectorUpdate_sstk+2        ; 1-byte Folded Spill
	sta	__rc24
	lda	__rc23
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
; %bb.37:
	jmp	.LBB4_25
.LBB4_18:
	ldy	__rc24
	cpy	#32
	bcc	.LBB4_19
; %bb.53:
	jmp	.LBB4_22
.LBB4_19:
	clc
	lda	__rc24
	adc	#232
	sta	__rc24
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	.LBAMSectorUpdate_sstk+1        ; 1-byte Folded Spill
	ldy	__rc23
	sty	.LBAMSectorUpdate_sstk+2        ; 1-byte Folded Spill
	lda	__rc23
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
	jmp	.LBB4_23
.LBB4_20:
	cmp	#32
	bcc	.LBB4_21
; %bb.55:
	jmp	.LBB4_24
.LBB4_21:
	clc
	adc	#232
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	.LBAMSectorUpdate_sstk+1        ; 1-byte Folded Spill
	ldy	__rc23
	sty	.LBAMSectorUpdate_sstk+2        ; 1-byte Folded Spill
	sta	__rc24
	lda	__rc23
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
; %bb.41:
	jmp	.LBB4_25
.LBB4_22:
	clc
	lda	__rc24
	adc	#224
	sta	__rc24
	ldy	#6
	stz	__rc3
	sty	__rc2
	ldy	#0
	sty	.LBAMSectorUpdate_sstk+1        ; 1-byte Folded Spill
	ldy	__rc23
	sty	.LBAMSectorUpdate_sstk+2        ; 1-byte Folded Spill
	lda	__rc23
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
.LBB4_23:
	sta	__rc22
	lda	__rc2
	adc	#0
	sta	__rc23
	lda	#1
	ldx	#0
	ldy	__rc24
	sty	__rc2
	jsr	__ashlhi3
	eor	#255
	and	(__rc22)
	sta	(__rc22)
	ldx	#255
	stx	.LBAMSectorUpdate_sstk          ; 1-byte Folded Spill
	bra	.LBB4_26
.LBB4_24:
	clc
	adc	#224
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	stx	.LBAMSectorUpdate_sstk+1        ; 1-byte Folded Spill
	ldy	__rc23
	sty	.LBAMSectorUpdate_sstk+2        ; 1-byte Folded Spill
	sta	__rc24
	lda	__rc23
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
.LBB4_25:
	sta	__rc22
	lda	__rc2
	adc	#0
	sta	__rc23
	ldx	__rc24
	stx	__rc2
	ldx	#0
	lda	#1
	tay
	sty	.LBAMSectorUpdate_sstk          ; 1-byte Folded Spill
	jsr	__ashlhi3
	ora	(__rc22)
	sta	(__rc22)
.LBB4_26:
	ldx	.LBAMSectorUpdate_sstk+1        ; 1-byte Folded Reload
	lda	.LBAMSectorUpdate_sstk+2        ; 1-byte Folded Reload
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
	lda	.LBAMSectorUpdate_sstk          ; 1-byte Folded Reload
	adc	(__rc4),y
	sta	(__rc4),y
	ldx	.LBAMSectorUpdate_sstk+3        ; 1-byte Folded Reload
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
	ldx	#mos16lo(.L.str.12)
	stx	__rc2
	ldx	#mos16hi(.L.str.12)
	stx	__rc3
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
	ldx	__rc20
	phx
	ldx	__rc21
	phx
	ldx	__rc22
	phx
	ldx	__rc23
	phx
	ldx	__rc24
	stx	.LfindnextBAMtracksector_sstk   ; 1-byte Folded Spill
	ldx	__rc25
	stx	.LfindnextBAMtracksector_sstk+1 ; 1-byte Folded Spill
	ldx	__rc26
	stx	.LfindnextBAMtracksector_sstk+2 ; 1-byte Folded Spill
	ldx	__rc27
	stx	.LfindnextBAMtracksector_sstk+3 ; 1-byte Folded Spill
	ldx	__rc28
	stx	.LfindnextBAMtracksector_sstk+4 ; 1-byte Folded Spill
	ldx	__rc29
	stx	.LfindnextBAMtracksector_sstk+5 ; 1-byte Folded Spill
	ldx	__rc30
	stx	.LfindnextBAMtracksector_sstk+6 ; 1-byte Folded Spill
	ldx	__rc31
	stx	.LfindnextBAMtracksector_sstk+7 ; 1-byte Folded Spill
	sta	__rc24
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	ldx	__rc4
	stx	__rc22
	ldx	__rc5
	stx	__rc23
	stz	__rc25
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
	stx	__rc30
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc2
	sty	__rc3
	ldx	5632
	ldy	5633
	lda	mos8(BAMsector.0+1)
	sta	__rc31
	sty	__rc4
	lda	__rc24
	jsr	GetOneSector
	lda	#6
	ldy	#0
	ldx	#0
.LBB6_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_12 Depth 2
	sta	__rc2
	stz	__rc3
	sty	__rc28
	tya
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	lda	__rc30
	clc
	adc	__rc2
	sta	__rc26
	lda	__rc31
	adc	__rc3
	sta	__rc27
	ldx	#0
; %bb.18:                               ;   in Loop: Header=BB6_1 Depth=1
	jmp	.LBB6_12
.LBB6_2:                                ;   in Loop: Header=BB6_12 Depth=2
	cpx	#16
	bcs	.LBB6_4
; %bb.3:                                ;   in Loop: Header=BB6_12 Depth=2
	ldy	#18
	lda	(__rc26),y
	sta	__rc25
	stx	__rc29
	txa
	clc
	adc	#248
	bra	.LBB6_9
.LBB6_4:                                ;   in Loop: Header=BB6_12 Depth=2
	cpx	#24
	bcs	.LBB6_6
; %bb.5:                                ;   in Loop: Header=BB6_12 Depth=2
	ldy	#19
	lda	(__rc26),y
	sta	__rc25
	stx	__rc29
	txa
	clc
	adc	#240
	bra	.LBB6_9
.LBB6_6:                                ;   in Loop: Header=BB6_12 Depth=2
	cpx	#32
	bcs	.LBB6_8
; %bb.7:                                ;   in Loop: Header=BB6_12 Depth=2
	ldy	#20
	lda	(__rc26),y
	sta	__rc25
	stx	__rc29
	txa
	clc
	adc	#232
	bra	.LBB6_9
.LBB6_8:                                ;   in Loop: Header=BB6_12 Depth=2
	ldy	#21
	lda	(__rc26),y
	sta	__rc25
	stx	__rc29
	txa
	clc
	adc	#224
.LBB6_9:                                ;   in Loop: Header=BB6_12 Depth=2
	sta	__rc2
.LBB6_10:                               ;   in Loop: Header=BB6_12 Depth=2
	ldx	#0
	lda	#1
	jsr	__ashlhi3
	and	__rc25
	bne	.LBB6_16
; %bb.11:                               ;   in Loop: Header=BB6_12 Depth=2
	lda	__rc29
	ldx	__rc29
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
	lda	(__rc26),y
	sta	__rc25
	stx	__rc29
	bra	.LBB6_10
.LBB6_14:                               ;   in Loop: Header=BB6_1 Depth=1
	lda	__rc28
	ldy	__rc28
	iny
	ldx	#0
	cmp	#79
	stz	__rc25
	lda	#6
	bcs	.LBB6_15
; %bb.22:                               ;   in Loop: Header=BB6_1 Depth=1
	jmp	.LBB6_1
.LBB6_15:
	stz	__rc26
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
	ldy	__rc28
	sty	__rc25
	inc	__rc25
	stx	__rc6
	ldx	__rc29
	stx	__rc26
	lda	__rc25
	jsr	BAMSectorUpdate
	ldx	mos8(BAMsector.0)
	ldy	mos8(BAMsector.0+1)
	stx	__rc2
	sty	__rc3
	ldx	#40
	ldy	#1
	sty	__rc4
	lda	__rc24
	jsr	PutOneSector
	ldx	mos8(BAMsector.1)
	ldy	mos8(BAMsector.1+1)
	stx	__rc2
	sty	__rc3
	ldx	5632
	ldy	5633
	sty	__rc4
	lda	__rc24
	jsr	PutOneSector
	lda	__rc25
.LBB6_17:
	sta	(__rc20)
	lda	__rc26
	sta	(__rc22)
	ldx	.LfindnextBAMtracksector_sstk+7 ; 1-byte Folded Reload
	stx	__rc31
	ldx	.LfindnextBAMtracksector_sstk+6 ; 1-byte Folded Reload
	stx	__rc30
	ldx	.LfindnextBAMtracksector_sstk+5 ; 1-byte Folded Reload
	stx	__rc29
	ldx	.LfindnextBAMtracksector_sstk+4 ; 1-byte Folded Reload
	stx	__rc28
	ldx	.LfindnextBAMtracksector_sstk+3 ; 1-byte Folded Reload
	stx	__rc27
	ldx	.LfindnextBAMtracksector_sstk+2 ; 1-byte Folded Reload
	stx	__rc26
	ldx	.LfindnextBAMtracksector_sstk+1 ; 1-byte Folded Reload
	stx	__rc25
	ldx	.LfindnextBAMtracksector_sstk   ; 1-byte Folded Reload
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
	.size	findnextBAMtracksector, .Lfunc_end6-findnextBAMtracksector
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
	ldy	mos8(direntryblock.0)
	ldx	mos8(direntryblock.0+1)
	sty	mos8(.Lgetdirententry_zp_stk)
	stx	mos8(.Lgetdirententry_zp_stk+6)
	stx	mos8(.Lgetdirententry_zp_stk+1)
	lda	#0
	stz	__rc3
	ldx	#8
	stx	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Spill
	stz	mos8(.Lgetdirententry_zp_stk+8)
.LBB7_1:                                ; =>This Inner Loop Header: Depth=1
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
	ldx	#8
	stx	__rc3
	sty	mos8(.Lgetdirententry_zp_stk+3)
	sty	__rc4
	ldx	mos8(.Lgetdirententry_zp_stk+6)
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc10
	jsr	lcopy
	ldx	6659
	beq	.LBB7_11
; %bb.2:                                ;   in Loop: Header=BB7_1 Depth=1
	ldx	6656
	beq	.LBB7_4
; %bb.3:                                ;   in Loop: Header=BB7_1 Depth=1
	clc
	lda	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	mos8(.Lgetdirententry_zp_stk+8)
	adc	#0
	sta	__rc3
	bra	.LBB7_5
.LBB7_4:                                ;   in Loop: Header=BB7_1 Depth=1
	ldx	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lgetdirententry_zp_stk+8)
	stx	__rc3
.LBB7_5:                                ;   in Loop: Header=BB7_1 Depth=1
	lda	mos8(.Lgetdirententry_zp_stk+7)
	cmp	mos8(.Lgetdirententry_zp_stk+2)
	beq	.LBB7_10
; %bb.6:                                ;   in Loop: Header=BB7_1 Depth=1
	inc
	ldx	#0
	cpx	__rc3
	bne	.LBB7_8
; %bb.7:                                ;   in Loop: Header=BB7_1 Depth=1
	cmp	__rc2
	bcs	.LBB7_11
	bra	.LBB7_9
.LBB7_8:                                ;   in Loop: Header=BB7_1 Depth=1
	cpx	__rc3
	bcs	.LBB7_11
.LBB7_9:                                ;   in Loop: Header=BB7_1 Depth=1
	ldx	__rc2
	stx	mos8(.Lgetdirententry_zp_stk+9) ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.Lgetdirententry_zp_stk+8)
	stz	__rc2
	ldy	mos8(.Lgetdirententry_zp_stk+3)
	stz	__rc3
; %bb.12:                               ;   in Loop: Header=BB7_1 Depth=1
	jmp	.LBB7_1
.LBB7_10:
	ldx	mos8(.Lgetdirententry_zp_stk)
	stx	mos8(.Lgetdirententry_zp_stk+4)
	ldx	mos8(.Lgetdirententry_zp_stk+1)
	stx	mos8(.Lgetdirententry_zp_stk+5)
.LBB7_11:
	ldx	mos8(.Lgetdirententry_zp_stk+4)
	stx	__rc2
	ldx	mos8(.Lgetdirententry_zp_stk+5)
	stx	__rc3
	rts
.Lfunc_end7:
	.size	getdirententry, .Lfunc_end7-getdirententry
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
	sta	__rc5
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
	lda	#40
	ldx	#3
	ldy	#8
	sty	__rc3
	stz	__rc2
	ldy	#14
	sty	__rc4
	sta	__rc6
	stx	__rc7
	ldx	#0
	txa
	jsr	readblockchain
	lda	#112
	ldx	#0
	stx	__rc20
	ldx	#0
	stx	__rc21
.LBB8_1:                                ; =>This Inner Loop Header: Depth=1
	sta	__rc22
	jsr	getdirententry
	ldx	__rc3
	cpx	__rc21
	bne	.LBB8_5
; %bb.2:                                ;   in Loop: Header=BB8_1 Depth=1
	ldx	__rc2
	cpx	__rc20
	bne	.LBB8_5
; %bb.3:                                ;   in Loop: Header=BB8_1 Depth=1
	lda	__rc22
	dec
	bne	.LBB8_1
; %bb.4:
	lda	#0
	bra	.LBB8_6
.LBB8_5:
	lda	__rc22
.LBB8_6:
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
.Lfunc_end11:
	.size	clrhome, .Lfunc_end11-clrhome
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
	bra	.LBB12_8
.LBB12_1:                               ;   in Loop: Header=BB12_8 Depth=1
	cmp	#96
	bcc	.LBB12_3
; %bb.2:                                ;   in Loop: Header=BB12_8 Depth=1
	clc
	adc	#160
	bra	.LBB12_5
.LBB12_3:                               ;   in Loop: Header=BB12_8 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB12_5
; %bb.4:                                ;   in Loop: Header=BB12_8 Depth=1
	lda	.Lswitch.table.asciitoscreencode_s,x
.LBB12_5:                               ;   in Loop: Header=BB12_8 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB12_7
; %bb.6:                                ;   in Loop: Header=BB12_8 Depth=1
	inc	__rc7
.LBB12_7:                               ;   in Loop: Header=BB12_8 Depth=1
	tax
	beq	.LBB12_12
.LBB12_8:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB12_10
; %bb.9:                                ;   in Loop: Header=BB12_8 Depth=1
	inc	__rc5
.LBB12_10:                              ;   in Loop: Header=BB12_8 Depth=1
	cmp	#192
	bcc	.LBB12_1
; %bb.11:                               ;   in Loop: Header=BB12_8 Depth=1
	eor	#128
	bra	.LBB12_5
.LBB12_12:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end12:
	.size	msprintf, .Lfunc_end12-msprintf
                                        ; -- End function
	.section	.text.mprintf,"ax",@progbits
	.type	mprintf,@function               ; -- Begin function mprintf
mprintf:                                ; @mprintf
; %bb.0:
	ldy	__rc21
	phy
	ldy	__rc22
	phy
	ldy	__rc23
	phy
	sta	mos8(.Lmprintf_zp_stk)
	stx	__rc21
	ldx	__rc4
	stx	__rc22
	ldx	__rc5
	stx	__rc23
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
	lda	.Lswitch.table.asciitoscreencode_s,x
.LBB13_5:                               ;   in Loop: Header=BB13_8 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB13_7
; %bb.6:                                ;   in Loop: Header=BB13_8 Depth=1
	inc	__rc7
.LBB13_7:                               ;   in Loop: Header=BB13_8 Depth=1
	tax
	beq	.LBB13_12
.LBB13_8:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB13_10
; %bb.9:                                ;   in Loop: Header=BB13_8 Depth=1
	inc	__rc5
.LBB13_10:                              ;   in Loop: Header=BB13_8 Depth=1
	cmp	#192
	bcc	.LBB13_1
; %bb.11:                               ;   in Loop: Header=BB13_8 Depth=1
	eor	#128
	bra	.LBB13_5
.LBB13_12:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jsr	cputsxy
	stz	__rc4
	ldx	__rc22
	stx	__rc2
	ldx	__rc23
	stx	__rc3
	ldx	__rc21
	lda	mos8(.Lmprintf_zp_stk)
	jsr	csputdec
	plx
	stx	__rc23
	plx
	stx	__rc22
	plx
	stx	__rc21
	rts
.Lfunc_end13:
	.size	mprintf, .Lfunc_end13-mprintf
                                        ; -- End function
	.section	.text.mh4printf,"ax",@progbits
	.type	mh4printf,@function             ; -- Begin function mh4printf
mh4printf:                              ; @mh4printf
; %bb.0:
	sta	mos8(.Lmh4printf_zp_stk)
	stx	mos8(.Lmh4printf_zp_stk+1)
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
	bra	.LBB14_8
.LBB14_1:                               ;   in Loop: Header=BB14_8 Depth=1
	cmp	#96
	bcc	.LBB14_3
; %bb.2:                                ;   in Loop: Header=BB14_8 Depth=1
	clc
	adc	#160
	bra	.LBB14_5
.LBB14_3:                               ;   in Loop: Header=BB14_8 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB14_5
; %bb.4:                                ;   in Loop: Header=BB14_8 Depth=1
	lda	.Lswitch.table.asciitoscreencode_s,x
.LBB14_5:                               ;   in Loop: Header=BB14_8 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB14_7
; %bb.6:                                ;   in Loop: Header=BB14_8 Depth=1
	inc	__rc7
.LBB14_7:                               ;   in Loop: Header=BB14_8 Depth=1
	tax
	beq	.LBB14_12
.LBB14_8:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB14_10
; %bb.9:                                ;   in Loop: Header=BB14_8 Depth=1
	inc	__rc5
.LBB14_10:                              ;   in Loop: Header=BB14_8 Depth=1
	cmp	#192
	bcc	.LBB14_1
; %bb.11:                               ;   in Loop: Header=BB14_8 Depth=1
	eor	#128
	bra	.LBB14_5
.LBB14_12:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jsr	cputsxy
	clc
	lda	#mos16lo(.Lmh4printf_sstk)
	adc	#4
	sta	__rc2
	lda	#mos16hi(.Lmh4printf_sstk)
	adc	#0
	sta	__rc3
	lda	mos8(.Lmh4printf_zp_stk+1)
	sta	__rc4
	and	#15
	sta	__rc5
	lda	mos8(.Lmh4printf_zp_stk)
	lsr
	lsr
	lsr
	lsr
	and	#15
	sta	__rc6
	lsr	__rc4
	lsr	__rc4
	lsr	__rc4
	lsr	__rc4
	ldx	__rc4
	lda	hexDigits,x
	tax
	lda	#48
	sta	.Lmh4printf_sstk+1
	sta	.Lmh4printf_sstk+2
	sta	.Lmh4printf_sstk+3
	stx	.Lmh4printf_sstk+5
	ldx	__rc5
	ldy	hexDigits,x
	lda	mos8(.Lmh4printf_zp_stk)
	and	#15
	tax
	sty	.Lmh4printf_sstk+6
	ldy	__rc6
	lda	hexDigits,y
	tay
	sty	.Lmh4printf_sstk+7
	ldy	#36
	sty	.Lmh4printf_sstk
	lda	hexDigits,x
	tax
	stx	.Lmh4printf_sstk+8
	stz	.Lmh4printf_sstk+9
	sty	.Lmh4printf_sstk+4
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end14:
	.size	mh4printf, .Lfunc_end14-mh4printf
                                        ; -- End function
	.section	.text.mcputsxy,"ax",@progbits
	.type	mcputsxy,@function              ; -- Begin function mcputsxy
mcputsxy:                               ; @mcputsxy
; %bb.0:
	sta	__rc8
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ldy	#52
	sty	__rc2
	ldy	#3
	sty	__rc3
	ldy	#52
	sty	__rc6
	ldy	#3
	sty	__rc7
	bra	.LBB15_8
.LBB15_1:                               ;   in Loop: Header=BB15_8 Depth=1
	cmp	#96
	bcc	.LBB15_3
; %bb.2:                                ;   in Loop: Header=BB15_8 Depth=1
	clc
	adc	#160
	bra	.LBB15_5
.LBB15_3:                               ;   in Loop: Header=BB15_8 Depth=1
	clc
	sta	__rc9
	adc	#165
	tay
	lda	__rc9
	cpy	#5
	bcs	.LBB15_5
; %bb.4:                                ;   in Loop: Header=BB15_8 Depth=1
	lda	.Lswitch.table.asciitoscreencode_s,y
.LBB15_5:                               ;   in Loop: Header=BB15_8 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB15_7
; %bb.6:                                ;   in Loop: Header=BB15_8 Depth=1
	inc	__rc7
.LBB15_7:                               ;   in Loop: Header=BB15_8 Depth=1
	tay
	beq	.LBB15_12
.LBB15_8:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB15_10
; %bb.9:                                ;   in Loop: Header=BB15_8 Depth=1
	inc	__rc5
.LBB15_10:                              ;   in Loop: Header=BB15_8 Depth=1
	cmp	#192
	bcc	.LBB15_1
; %bb.11:                               ;   in Loop: Header=BB15_8 Depth=1
	eor	#128
	bra	.LBB15_5
.LBB15_12:
	lda	__rc8
	jmp	cputsxy
.Lfunc_end15:
	.size	mcputsxy, .Lfunc_end15-mcputsxy
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
	bcs	.LBB16_1
; %bb.18:
	jmp	.LBB16_3
.LBB16_1:
	ldx	__rc23
	stx	__rc21
.LBB16_2:                               ; =>This Inner Loop Header: Depth=1
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
	bcc	.LBB16_3
; %bb.20:                               ;   in Loop: Header=BB16_2 Depth=1
	jmp	.LBB16_2
.LBB16_3:
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
	bcc	.LBB16_6
; %bb.4:
	ldy	__rc22
	iny
.LBB16_5:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB16_5
.LBB16_6:
	ldx	__rc23
	stx	__rc21
	inc	__rc21
	ldx	__rc21
.LBB16_7:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB16_7
; %bb.8:
	lda	__rc20
	bne	.LBB16_9
; %bb.22:
	jmp	.LBB16_17
.LBB16_9:
	ldy	__rc27
	cpy	mos8(g_curScreenH)
	bcc	.LBB16_10
; %bb.24:
	jmp	.LBB16_17
.LBB16_10:
	ldx	mos8(g_curScreenW)
	stx	__rc2
	ldx	__rc25
	cpx	__rc2
	bcc	.LBB16_11
; %bb.26:
	jmp	.LBB16_17
.LBB16_11:
	stz	__rc3
	ldx	#0
	iny
	bne	.LBB16_13
; %bb.12:
	inx
.LBB16_13:
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
.LBB16_14:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB16_16
; %bb.15:                               ;   in Loop: Header=BB16_14 Depth=1
	ldx	__rc23
	cpx	__rc21
	bcs	.LBB16_14
	bra	.LBB16_17
.LBB16_16:                              ;   in Loop: Header=BB16_14 Depth=1
	cpx	#0
	bcs	.LBB16_14
.LBB16_17:
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
.Lfunc_end16:
	.size	mcbox, .Lfunc_end16-mcbox
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
	lda	#70
	ldy	#9
	ldx	#1
	sta	__rc2
	sty	__rc3
	stx	__rc4
	ldx	#4
	lda	#10
	jsr	mcbox
	ldx	#12
	stx	mos8(g_curX)
	ldx	#6
	stx	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB17_8
.LBB17_1:                               ;   in Loop: Header=BB17_8 Depth=1
	cmp	#96
	bcc	.LBB17_3
; %bb.2:                                ;   in Loop: Header=BB17_8 Depth=1
	clc
	adc	#160
	bra	.LBB17_5
.LBB17_3:                               ;   in Loop: Header=BB17_8 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB17_5
; %bb.4:                                ;   in Loop: Header=BB17_8 Depth=1
	lda	.Lswitch.table.asciitoscreencode_s,x
.LBB17_5:                               ;   in Loop: Header=BB17_8 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB17_7
; %bb.6:                                ;   in Loop: Header=BB17_8 Depth=1
	inc	__rc3
.LBB17_7:                               ;   in Loop: Header=BB17_8 Depth=1
	tax
	beq	.LBB17_12
.LBB17_8:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB17_10
; %bb.9:                                ;   in Loop: Header=BB17_8 Depth=1
	inc	__rc23
.LBB17_10:                              ;   in Loop: Header=BB17_8 Depth=1
	cmp	#192
	bcc	.LBB17_1
; %bb.11:                               ;   in Loop: Header=BB17_8 Depth=1
	eor	#128
	bra	.LBB17_5
.LBB17_12:
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
.Lfunc_end17:
	.size	messagebox, .Lfunc_end17-messagebox
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end18:
	.size	escNOP, .Lfunc_end18-escNOP
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
	bne	.LBB19_2
; %bb.1:
	dec	__rc20
.LBB19_2:
	lda	__rc20
	bne	.LBB19_5
; %bb.3:
	ldy	__rc23
	cpx	__rc22
	bne	.LBB19_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB19_7
.LBB19_5:
	ldy	__rc23
.LBB19_6:
	ldx	__rc22
	inx
.LBB19_7:
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
.Lfunc_end19:
	.size	cputcxy, .Lfunc_end19-cputcxy
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
.Lfunc_end20:
	.size	cputsxy, .Lfunc_end20-cputsxy
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
.Lfunc_end21:
	.size	lcopy, .Lfunc_end21-lcopy
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
.Lfunc_end22:
	.size	lfill, .Lfunc_end22-lfill
                                        ; -- End function
	.section	.text.strcpy,"ax",@progbits
	.type	strcpy,@function                ; -- Begin function strcpy
strcpy:                                 ; @strcpy
; %bb.0:
	lda	(__rc4)
	sta	(__rc2)
	lda	(__rc4)
	beq	.LBB23_7
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
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
	inc	__rc8
	bne	.LBB23_4
; %bb.3:                                ;   in Loop: Header=BB23_2 Depth=1
	inc	__rc9
.LBB23_4:                               ;   in Loop: Header=BB23_2 Depth=1
	lda	(__rc4),y
	sta	(__rc6),y
	lda	(__rc4),y
	inc	__rc6
	bne	.LBB23_6
; %bb.5:                                ;   in Loop: Header=BB23_2 Depth=1
	inc	__rc7
.LBB23_6:                               ;   in Loop: Header=BB23_2 Depth=1
	ldx	__rc8
	stx	__rc4
	ldx	__rc9
	stx	__rc5
	tax
	bne	.LBB23_2
.LBB23_7:
	rts
.Lfunc_end23:
	.size	strcpy, .Lfunc_end23-strcpy
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB24_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB24_4
; %bb.3:                                ;   in Loop: Header=BB24_2 Depth=1
	inx
.LBB24_4:                               ;   in Loop: Header=BB24_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB24_2
	bra	.LBB24_6
.LBB24_5:
	stz	__rc4
	ldx	#0
.LBB24_6:
	lda	__rc4
	rts
.Lfunc_end24:
	.size	strlen, .Lfunc_end24-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB25_2
.LBB25_1:                               ;   in Loop: Header=BB25_2 Depth=1
	dex
	asl
.LBB25_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB25_1
; %bb.3:
	rts
.Lfunc_end25:
	.size	__ashlqi3, .Lfunc_end25-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB26_3
; %bb.1:
	ldx	__rc2
.LBB26_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB26_2
.LBB26_3:
	ldx	__rc3
	rts
.Lfunc_end26:
	.size	__ashlhi3, .Lfunc_end26-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB27_3
; %bb.1:
	ldx	__rc4
.LBB27_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB27_2
.LBB27_3:
	ldx	__rc5
	rts
.Lfunc_end27:
	.size	__ashlsi3, .Lfunc_end27-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB28_3
; %bb.1:
	ldx	__rc8
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB28_2
.LBB28_3:
	ldx	__rc9
	rts
.Lfunc_end28:
	.size	__ashldi3, .Lfunc_end28-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB29_2
.LBB29_1:                               ;   in Loop: Header=BB29_2 Depth=1
	dex
	lsr
.LBB29_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB29_1
; %bb.3:
	rts
.Lfunc_end29:
	.size	__lshrqi3, .Lfunc_end29-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB30_3
; %bb.1:
	ldx	__rc2
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB30_2
.LBB30_3:
	ldx	__rc3
	rts
.Lfunc_end30:
	.size	__lshrhi3, .Lfunc_end30-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB31_3
; %bb.1:
	ldx	__rc4
.LBB31_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB31_2
.LBB31_3:
	ldx	__rc5
	rts
.Lfunc_end31:
	.size	__lshrsi3, .Lfunc_end31-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB32_3
; %bb.1:
	ldx	__rc8
.LBB32_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB32_2
.LBB32_3:
	ldx	__rc9
	rts
.Lfunc_end32:
	.size	__lshrdi3, .Lfunc_end32-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB33_2
.LBB33_1:                               ;   in Loop: Header=BB33_2 Depth=1
	dex
	cmp	#128
	ror
.LBB33_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB33_1
; %bb.3:
	rts
.Lfunc_end33:
	.size	__ashrqi3, .Lfunc_end33-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB34_3
; %bb.1:
	ldx	__rc2
.LBB34_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB34_2
.LBB34_3:
	tax
	lda	__rc3
	rts
.Lfunc_end34:
	.size	__ashrhi3, .Lfunc_end34-__ashrhi3
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
	beq	.LBB35_3
; %bb.1:
	ldx	__rc4
.LBB35_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB35_2
.LBB35_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end35:
	.size	__ashrsi3, .Lfunc_end35-__ashrsi3
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
	beq	.LBB36_3
; %bb.1:
	ldx	__rc8
.LBB36_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB36_2
.LBB36_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end36:
	.size	__ashrdi3, .Lfunc_end36-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB37_2
.LBB37_1:                               ;   in Loop: Header=BB37_2 Depth=1
	dex
	cmp	#128
	rol
.LBB37_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB37_1
; %bb.3:
	rts
.Lfunc_end37:
	.size	__rotlqi3, .Lfunc_end37-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB38_3
; %bb.1:
	ldx	__rc2
.LBB38_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB38_2
.LBB38_3:
	tax
	lda	__rc3
	rts
.Lfunc_end38:
	.size	__rotlhi3, .Lfunc_end38-__rotlhi3
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
	beq	.LBB39_3
; %bb.1:
	ldx	__rc4
.LBB39_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB39_2
.LBB39_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end39:
	.size	__rotlsi3, .Lfunc_end39-__rotlsi3
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
	beq	.LBB40_3
; %bb.1:
	ldx	__rc8
.LBB40_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB40_2
.LBB40_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end40:
	.size	__rotldi3, .Lfunc_end40-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB41_2
.LBB41_1:                               ;   in Loop: Header=BB41_2 Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror
.LBB41_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB41_1
; %bb.3:
	rts
.Lfunc_end41:
	.size	__rotrqi3, .Lfunc_end41-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB42_3
; %bb.1:
	ldx	__rc2
.LBB42_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	lsr	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB42_2
.LBB42_3:
	ldx	__rc3
	rts
.Lfunc_end42:
	.size	__rotrhi3, .Lfunc_end42-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB43_3
; %bb.1:
	ldx	__rc4
.LBB43_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	lsr	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB43_2
.LBB43_3:
	ldx	__rc5
	rts
.Lfunc_end43:
	.size	__rotrsi3, .Lfunc_end43-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB44_3
; %bb.1:
	ldx	__rc8
.LBB44_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB44_2
.LBB44_3:
	ldx	__rc9
	rts
.Lfunc_end44:
	.size	__rotrdi3, .Lfunc_end44-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB45_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB45_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB45_4
; %bb.3:                                ;   in Loop: Header=BB45_2 Depth=1
	clc
	adc	__rc2
.LBB45_4:                               ;   in Loop: Header=BB45_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB45_2
; %bb.5:
	rts
.LBB45_6:
	lda	#0
	rts
.Lfunc_end45:
	.size	__mulqi3, .Lfunc_end45-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB46_2
; %bb.1:
	ldy	__rc2
	beq	.LBB46_7
.LBB46_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB46_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB46_5
; %bb.4:                                ;   in Loop: Header=BB46_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB46_5:                               ;   in Loop: Header=BB46_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB46_3
; %bb.6:                                ;   in Loop: Header=BB46_3 Depth=1
	ldx	__rc2
	bne	.LBB46_3
	bra	.LBB46_8
.LBB46_7:
	ldy	#0
	tya
.LBB46_8:
	tax
	tya
	rts
.Lfunc_end46:
	.size	__mulhi3, .Lfunc_end46-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB47_4
; %bb.1:
	ldy	__rc6
	bne	.LBB47_4
; %bb.2:
	ldy	__rc5
	bne	.LBB47_4
; %bb.3:
	ldy	__rc4
	bne	.LBB47_4
; %bb.13:
	jmp	.LBB47_12
.LBB47_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB47_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB47_7
; %bb.6:                                ;   in Loop: Header=BB47_5 Depth=1
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
.LBB47_7:                               ;   in Loop: Header=BB47_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB47_5
; %bb.8:                                ;   in Loop: Header=BB47_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB47_5
; %bb.9:                                ;   in Loop: Header=BB47_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB47_5
; %bb.10:                               ;   in Loop: Header=BB47_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB47_5
.LBB47_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB47_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB47_11
.Lfunc_end47:
	.size	__mulsi3, .Lfunc_end47-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB48_8
; %bb.1:
	ldy	__rc14
	bne	.LBB48_8
; %bb.2:
	ldy	__rc13
	bne	.LBB48_8
; %bb.3:
	ldy	__rc12
	bne	.LBB48_8
; %bb.4:
	ldy	__rc11
	bne	.LBB48_8
; %bb.5:
	ldy	__rc10
	bne	.LBB48_8
; %bb.6:
	ldy	__rc9
	bne	.LBB48_8
; %bb.7:
	ldy	__rc8
	bne	.LBB48_8
; %bb.21:
	jmp	.LBB48_20
.LBB48_8:
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
.LBB48_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB48_11
; %bb.10:                               ;   in Loop: Header=BB48_9 Depth=1
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
.LBB48_11:                              ;   in Loop: Header=BB48_9 Depth=1
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
	beq	.LBB48_12
; %bb.23:                               ;   in Loop: Header=BB48_9 Depth=1
	jmp	.LBB48_9
.LBB48_12:                              ;   in Loop: Header=BB48_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB48_13
; %bb.25:                               ;   in Loop: Header=BB48_9 Depth=1
	jmp	.LBB48_9
.LBB48_13:                              ;   in Loop: Header=BB48_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB48_14
; %bb.27:                               ;   in Loop: Header=BB48_9 Depth=1
	jmp	.LBB48_9
.LBB48_14:                              ;   in Loop: Header=BB48_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB48_15
; %bb.29:                               ;   in Loop: Header=BB48_9 Depth=1
	jmp	.LBB48_9
.LBB48_15:                              ;   in Loop: Header=BB48_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB48_16
; %bb.31:                               ;   in Loop: Header=BB48_9 Depth=1
	jmp	.LBB48_9
.LBB48_16:                              ;   in Loop: Header=BB48_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB48_17
; %bb.33:                               ;   in Loop: Header=BB48_9 Depth=1
	jmp	.LBB48_9
.LBB48_17:                              ;   in Loop: Header=BB48_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB48_18
; %bb.35:                               ;   in Loop: Header=BB48_9 Depth=1
	jmp	.LBB48_9
.LBB48_18:                              ;   in Loop: Header=BB48_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB48_19
; %bb.37:                               ;   in Loop: Header=BB48_9 Depth=1
	jmp	.LBB48_9
.LBB48_19:
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
.LBB48_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB48_19
.Lfunc_end48:
	.size	__muldi3, .Lfunc_end48-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB49_1
; %bb.15:
	jmp	.LBB49_14
.LBB49_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB49_2
; %bb.17:
	jmp	.LBB49_14
.LBB49_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB49_3
; %bb.19:
	jmp	.LBB49_14
.LBB49_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB49_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB49_6
; %bb.5:                                ;   in Loop: Header=BB49_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB49_8
	bra	.LBB49_7
.LBB49_6:                               ;   in Loop: Header=BB49_4 Depth=1
	cpy	__rc4
	bcc	.LBB49_8
.LBB49_7:                               ;   in Loop: Header=BB49_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB49_4
	bra	.LBB49_9
.LBB49_8:
	ldy	__rc3
	sty	__rc2
.LBB49_9:
	cpx	#0
	beq	.LBB49_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB49_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB49_13
; %bb.12:                               ;   in Loop: Header=BB49_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB49_13:                              ;   in Loop: Header=BB49_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB49_11
.LBB49_14:
	rts
.Lfunc_end49:
	.size	__udivqi3, .Lfunc_end49-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB50_2
; %bb.1:
	ldy	__rc2
	beq	.LBB50_4
.LBB50_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB50_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB50_6
.LBB50_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB50_22
.LBB50_5:
	cmp	__rc3
	bcc	.LBB50_4
.LBB50_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB50_7
; %bb.25:
	jmp	.LBB50_22
.LBB50_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB50_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB50_10
; %bb.9:                                ;   in Loop: Header=BB50_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB50_12
	bra	.LBB50_11
.LBB50_10:                              ;   in Loop: Header=BB50_8 Depth=1
	cmp	__rc6
	bcc	.LBB50_12
.LBB50_11:                              ;   in Loop: Header=BB50_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB50_8
	bra	.LBB50_13
.LBB50_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB50_13:
	cpx	#0
	bne	.LBB50_14
; %bb.27:
	jmp	.LBB50_22
.LBB50_14:
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
.LBB50_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB50_17
; %bb.16:                               ;   in Loop: Header=BB50_15 Depth=1
	ldy	#0
.LBB50_17:                              ;   in Loop: Header=BB50_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB50_21
; %bb.18:                               ;   in Loop: Header=BB50_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB50_20
.LBB50_19:                              ;   in Loop: Header=BB50_15 Depth=1
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
.LBB50_20:                              ;   in Loop: Header=BB50_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB50_15
	bra	.LBB50_22
.LBB50_21:                              ;   in Loop: Header=BB50_15 Depth=1
	cmp	__rc6
	bcs	.LBB50_19
	bra	.LBB50_20
.LBB50_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end50:
	.size	__udivhi3, .Lfunc_end50-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
	ldy	__rc7
	bne	.LBB51_4
; %bb.1:
	ldy	__rc6
	bne	.LBB51_4
; %bb.2:
	ldy	__rc5
	bne	.LBB51_4
; %bb.3:
	ldy	__rc4
	beq	.LBB51_9
.LBB51_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB51_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB51_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB51_7
; %bb.45:
	jmp	.LBB51_38
.LBB51_7:
	cmp	__rc4
	bcc	.LBB51_9
	bra	.LBB51_11
.LBB51_8:
	cpx	__rc7
	bcs	.LBB51_11
.LBB51_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB51_21
.LBB51_10:
	cpx	__rc6
	bcc	.LBB51_9
.LBB51_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB51_12
; %bb.47:
	jmp	.LBB51_21
.LBB51_12:
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
.LBB51_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB51_17
; %bb.14:                               ;   in Loop: Header=BB51_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB51_18
; %bb.15:                               ;   in Loop: Header=BB51_13 Depth=1
	cmp	__rc10
	bne	.LBB51_19
; %bb.16:                               ;   in Loop: Header=BB51_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB51_23
	bra	.LBB51_20
.LBB51_17:                              ;   in Loop: Header=BB51_13 Depth=1
	cpy	__rc12
	bcc	.LBB51_23
	bra	.LBB51_20
.LBB51_18:                              ;   in Loop: Header=BB51_13 Depth=1
	cpy	__rc11
	bcc	.LBB51_23
	bra	.LBB51_20
.LBB51_19:                              ;   in Loop: Header=BB51_13 Depth=1
	cmp	__rc10
	bcc	.LBB51_23
.LBB51_20:                              ;   in Loop: Header=BB51_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB51_13
	bra	.LBB51_24
.LBB51_21:
	stz	__rc2
	stz	__rc3
.LBB51_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB51_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB51_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB51_22
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
.LBB51_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB51_28
; %bb.27:                               ;   in Loop: Header=BB51_26 Depth=1
	ldy	#0
.LBB51_28:                              ;   in Loop: Header=BB51_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB51_32
; %bb.29:                               ;   in Loop: Header=BB51_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB51_34
; %bb.30:                               ;   in Loop: Header=BB51_26 Depth=1
	cmp	__rc10
	bne	.LBB51_37
; %bb.31:                               ;   in Loop: Header=BB51_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB51_33
	bra	.LBB51_35
.LBB51_32:                              ;   in Loop: Header=BB51_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB51_35
.LBB51_33:                              ;   in Loop: Header=BB51_26 Depth=1
	lda	__rc6
	bra	.LBB51_36
.LBB51_34:                              ;   in Loop: Header=BB51_26 Depth=1
	cpy	__rc11
	bcc	.LBB51_33
.LBB51_35:                              ;   in Loop: Header=BB51_26 Depth=1
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
.LBB51_36:                              ;   in Loop: Header=BB51_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB51_41
; %bb.49:                               ;   in Loop: Header=BB51_26 Depth=1
	jmp	.LBB51_26
.LBB51_41:
	jmp	.LBB51_22
.LBB51_37:                              ;   in Loop: Header=BB51_26 Depth=1
	cmp	__rc10
	bcc	.LBB51_33
	bra	.LBB51_35
.LBB51_38:
	cpx	__rc5
	bcs	.LBB51_43
; %bb.51:
	jmp	.LBB51_9
.LBB51_43:
	jmp	.LBB51_11
.Lfunc_end51:
	.size	__udivsi3, .Lfunc_end51-__udivsi3
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
	bne	.LBB52_8
; %bb.1:
	ldx	__rc14
	bne	.LBB52_8
; %bb.2:
	ldx	__rc13
	bne	.LBB52_8
; %bb.3:
	ldx	__rc12
	bne	.LBB52_8
; %bb.4:
	ldx	__rc11
	bne	.LBB52_8
; %bb.5:
	ldx	__rc10
	bne	.LBB52_8
; %bb.6:
	ldx	__rc9
	bne	.LBB52_8
; %bb.7:
	ldx	__rc8
	beq	.LBB52_17
.LBB52_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB52_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB52_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB52_11
; %bb.90:
	jmp	.LBB52_31
.LBB52_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB52_12
; %bb.92:
	jmp	.LBB52_32
.LBB52_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB52_13
; %bb.94:
	jmp	.LBB52_38
.LBB52_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB52_14
; %bb.96:
	jmp	.LBB52_40
.LBB52_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB52_15
; %bb.98:
	jmp	.LBB52_42
.LBB52_15:
	cmp	__rc8
	bcc	.LBB52_17
	bra	.LBB52_19
.LBB52_16:
	cpx	__rc15
	bcs	.LBB52_19
.LBB52_17:
	lda	#0
; %bb.66:
	jmp	.LBB52_29
.LBB52_18:
	cpx	__rc14
	bcc	.LBB52_17
.LBB52_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB52_20
; %bb.100:
	jmp	.LBB52_29
.LBB52_20:
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
.LBB52_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB52_25
; %bb.22:                               ;   in Loop: Header=BB52_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB52_26
; %bb.23:                               ;   in Loop: Header=BB52_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB52_27
; %bb.24:                               ;   in Loop: Header=BB52_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB52_102
; %bb.150:                              ;   in Loop: Header=BB52_21 Depth=1
	jmp	.LBB52_33
.LBB52_102:                             ;   in Loop: Header=BB52_21 Depth=1
	jmp	.LBB52_37
.LBB52_25:                              ;   in Loop: Header=BB52_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB52_28
; %bb.104:
	jmp	.LBB52_44
.LBB52_26:                              ;   in Loop: Header=BB52_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB52_28
; %bb.106:
	jmp	.LBB52_44
.LBB52_27:                              ;   in Loop: Header=BB52_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB52_28
; %bb.108:
	jmp	.LBB52_44
.LBB52_28:                              ;   in Loop: Header=BB52_21 Depth=1
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
	bmi	.LBB52_68
; %bb.110:                              ;   in Loop: Header=BB52_21 Depth=1
	jmp	.LBB52_21
.LBB52_68:
	jmp	.LBB52_45
.LBB52_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB52_30:
	ldx	__rc18
	rts
.LBB52_31:
	cpx	__rc13
	bcs	.LBB52_70
; %bb.112:
	jmp	.LBB52_17
.LBB52_70:
	jmp	.LBB52_19
.LBB52_32:
	cpx	__rc12
	bcs	.LBB52_72
; %bb.114:
	jmp	.LBB52_17
.LBB52_72:
	jmp	.LBB52_19
.LBB52_33:                              ;   in Loop: Header=BB52_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB52_39
; %bb.34:                               ;   in Loop: Header=BB52_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB52_41
; %bb.35:                               ;   in Loop: Header=BB52_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB52_43
; %bb.36:                               ;   in Loop: Header=BB52_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB52_44
; %bb.74:                               ;   in Loop: Header=BB52_21 Depth=1
	jmp	.LBB52_28
.LBB52_37:                              ;   in Loop: Header=BB52_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB52_44
; %bb.76:                               ;   in Loop: Header=BB52_21 Depth=1
	jmp	.LBB52_28
.LBB52_38:
	cpx	__rc11
	bcs	.LBB52_78
; %bb.116:
	jmp	.LBB52_17
.LBB52_78:
	jmp	.LBB52_19
.LBB52_39:                              ;   in Loop: Header=BB52_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB52_44
; %bb.80:                               ;   in Loop: Header=BB52_21 Depth=1
	jmp	.LBB52_28
.LBB52_40:
	cpx	__rc10
	bcs	.LBB52_82
; %bb.118:
	jmp	.LBB52_17
.LBB52_82:
	jmp	.LBB52_19
.LBB52_41:                              ;   in Loop: Header=BB52_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB52_44
; %bb.84:                               ;   in Loop: Header=BB52_21 Depth=1
	jmp	.LBB52_28
.LBB52_42:
	cpx	__rc9
	bcs	.LBB52_86
; %bb.120:
	jmp	.LBB52_17
.LBB52_86:
	jmp	.LBB52_19
.LBB52_43:                              ;   in Loop: Header=BB52_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB52_44
; %bb.122:                              ;   in Loop: Header=BB52_21 Depth=1
	jmp	.LBB52_28
.LBB52_44:
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
.LBB52_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB52_46
; %bb.124:
	jmp	.LBB52_30
.LBB52_46:
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
.LBB52_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB52_49
; %bb.48:                               ;   in Loop: Header=BB52_47 Depth=1
	ldy	#0
.LBB52_49:                              ;   in Loop: Header=BB52_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB52_57
; %bb.50:                               ;   in Loop: Header=BB52_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB52_51
; %bb.126:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_60
.LBB52_51:                              ;   in Loop: Header=BB52_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB52_52
; %bb.128:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_61
.LBB52_52:                              ;   in Loop: Header=BB52_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB52_53
; %bb.130:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_62
.LBB52_53:                              ;   in Loop: Header=BB52_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB52_54
; %bb.132:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_63
.LBB52_54:                              ;   in Loop: Header=BB52_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB52_55
; %bb.134:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_64
.LBB52_55:                              ;   in Loop: Header=BB52_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB52_56
; %bb.136:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_65
.LBB52_56:                              ;   in Loop: Header=BB52_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB52_58
	bra	.LBB52_59
.LBB52_57:                              ;   in Loop: Header=BB52_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB52_59
.LBB52_58:                              ;   in Loop: Header=BB52_47 Depth=1
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
.LBB52_59:                              ;   in Loop: Header=BB52_47 Depth=1
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
	beq	.LBB52_88
; %bb.138:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_47
.LBB52_88:
	jmp	.LBB52_30
.LBB52_60:                              ;   in Loop: Header=BB52_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB52_58
	bra	.LBB52_59
.LBB52_61:                              ;   in Loop: Header=BB52_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB52_59
; %bb.140:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_58
.LBB52_62:                              ;   in Loop: Header=BB52_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB52_59
; %bb.142:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_58
.LBB52_63:                              ;   in Loop: Header=BB52_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB52_59
; %bb.144:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_58
.LBB52_64:                              ;   in Loop: Header=BB52_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB52_59
; %bb.146:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_58
.LBB52_65:                              ;   in Loop: Header=BB52_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB52_59
; %bb.148:                              ;   in Loop: Header=BB52_47 Depth=1
	jmp	.LBB52_58
.Lfunc_end52:
	.size	__udivdi3, .Lfunc_end52-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB53_1
; %bb.15:
	jmp	.LBB53_13
.LBB53_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB53_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB53_14
; %bb.3:
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB53_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB53_6
; %bb.5:                                ;   in Loop: Header=BB53_4 Depth=1
	cmp	__rc2
	bcc	.LBB53_8
	bra	.LBB53_7
.LBB53_6:                               ;   in Loop: Header=BB53_4 Depth=1
	cpy	__rc4
	bcc	.LBB53_8
.LBB53_7:                               ;   in Loop: Header=BB53_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB53_4
	bra	.LBB53_9
.LBB53_8:
	ldy	__rc3
	sty	__rc2
.LBB53_9:
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB53_13
.LBB53_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB53_12
; %bb.11:                               ;   in Loop: Header=BB53_10 Depth=1
	sec
	sbc	__rc2
.LBB53_12:                              ;   in Loop: Header=BB53_10 Depth=1
	dex
	bne	.LBB53_10
.LBB53_13:
	rts
.LBB53_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end53:
	.size	__umodqi3, .Lfunc_end53-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB54_2
; %bb.1:
	ldx	__rc2
	bne	.LBB54_2
; %bb.22:
	jmp	.LBB54_19
.LBB54_2:
	cmp	__rc3
	bne	.LBB54_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB54_5
; %bb.20:
	jmp	.LBB54_19
.LBB54_4:
	cmp	__rc3
	bcs	.LBB54_5
; %bb.24:
	jmp	.LBB54_19
.LBB54_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB54_6
; %bb.26:
	jmp	.LBB54_18
.LBB54_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB54_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB54_9
; %bb.8:                                ;   in Loop: Header=BB54_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB54_11
	bra	.LBB54_10
.LBB54_9:                               ;   in Loop: Header=BB54_7 Depth=1
	cmp	__rc5
	bcc	.LBB54_11
.LBB54_10:                              ;   in Loop: Header=BB54_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB54_7
	bra	.LBB54_12
.LBB54_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB54_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB54_19
.LBB54_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB54_17
; %bb.14:                               ;   in Loop: Header=BB54_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB54_16
.LBB54_15:                              ;   in Loop: Header=BB54_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB54_16:                              ;   in Loop: Header=BB54_13 Depth=1
	dex
	bne	.LBB54_13
	bra	.LBB54_19
.LBB54_17:                              ;   in Loop: Header=BB54_13 Depth=1
	cmp	__rc5
	bcs	.LBB54_15
	bra	.LBB54_16
.LBB54_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB54_19:
	tax
	tya
	rts
.Lfunc_end54:
	.size	__umodhi3, .Lfunc_end54-__umodhi3
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
	bne	.LBB55_4
; %bb.1:
	ldx	__rc6
	bne	.LBB55_4
; %bb.2:
	ldx	__rc5
	bne	.LBB55_4
; %bb.3:
	ldx	__rc4
	bne	.LBB55_4
; %bb.42:
	jmp	.LBB55_35
.LBB55_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB55_8
; %bb.5:
	cmp	__rc6
	bne	.LBB55_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB55_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB55_11
; %bb.36:
	jmp	.LBB55_35
.LBB55_8:
	cpx	__rc7
	bcs	.LBB55_11
; %bb.38:
	jmp	.LBB55_35
.LBB55_9:
	cmp	__rc6
	bcs	.LBB55_11
; %bb.40:
	jmp	.LBB55_35
.LBB55_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB55_11
; %bb.44:
	jmp	.LBB55_35
.LBB55_11:
	ldx	__rc7
	bpl	.LBB55_12
; %bb.46:
	jmp	.LBB55_33
.LBB55_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB55_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB55_17
; %bb.14:                               ;   in Loop: Header=BB55_13 Depth=1
	cmp	__rc8
	bne	.LBB55_18
; %bb.15:                               ;   in Loop: Header=BB55_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB55_19
; %bb.16:                               ;   in Loop: Header=BB55_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB55_21
	bra	.LBB55_20
.LBB55_17:                              ;   in Loop: Header=BB55_13 Depth=1
	cpy	__rc9
	bcc	.LBB55_21
	bra	.LBB55_20
.LBB55_18:                              ;   in Loop: Header=BB55_13 Depth=1
	cmp	__rc8
	bcc	.LBB55_21
	bra	.LBB55_20
.LBB55_19:                              ;   in Loop: Header=BB55_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB55_21
.LBB55_20:                              ;   in Loop: Header=BB55_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB55_13
	bra	.LBB55_22
.LBB55_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB55_22:
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
	bne	.LBB55_23
; %bb.48:
	jmp	.LBB55_34
.LBB55_23:
	tya
.LBB55_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB55_28
; %bb.25:                               ;   in Loop: Header=BB55_24 Depth=1
	cmp	__rc8
	bne	.LBB55_31
; %bb.26:                               ;   in Loop: Header=BB55_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB55_32
; %bb.27:                               ;   in Loop: Header=BB55_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB55_29
	bra	.LBB55_30
.LBB55_28:                              ;   in Loop: Header=BB55_24 Depth=1
	cpy	__rc9
	bcc	.LBB55_30
.LBB55_29:                              ;   in Loop: Header=BB55_24 Depth=1
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
.LBB55_30:                              ;   in Loop: Header=BB55_24 Depth=1
	dex
	bne	.LBB55_24
	bra	.LBB55_35
.LBB55_31:                              ;   in Loop: Header=BB55_24 Depth=1
	cmp	__rc8
	bcs	.LBB55_29
	bra	.LBB55_30
.LBB55_32:                              ;   in Loop: Header=BB55_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB55_29
	bra	.LBB55_30
.LBB55_33:
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
	bra	.LBB55_35
.LBB55_34:
	tya
.LBB55_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end55:
	.size	__umodsi3, .Lfunc_end55-__umodsi3
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
	bne	.LBB56_8
; %bb.1:
	ldx	__rc14
	bne	.LBB56_8
; %bb.2:
	ldx	__rc13
	bne	.LBB56_8
; %bb.3:
	ldx	__rc12
	bne	.LBB56_8
; %bb.4:
	ldx	__rc11
	bne	.LBB56_8
; %bb.5:
	ldx	__rc10
	bne	.LBB56_8
; %bb.6:
	ldx	__rc9
	bne	.LBB56_8
; %bb.7:
	ldx	__rc8
	bne	.LBB56_8
; %bb.90:
	jmp	.LBB56_61
.LBB56_8:
	cmp	__rc15
	bne	.LBB56_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB56_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB56_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB56_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB56_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB56_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB56_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB56_23
; %bb.62:
	jmp	.LBB56_61
.LBB56_16:
	cmp	__rc15
	bcs	.LBB56_23
; %bb.64:
	jmp	.LBB56_61
.LBB56_17:
	cpx	__rc14
	bcs	.LBB56_23
; %bb.66:
	jmp	.LBB56_61
.LBB56_18:
	cpx	__rc13
	bcs	.LBB56_23
; %bb.68:
	jmp	.LBB56_61
.LBB56_19:
	cpx	__rc12
	bcs	.LBB56_23
; %bb.70:
	jmp	.LBB56_61
.LBB56_20:
	cpx	__rc11
	bcs	.LBB56_23
; %bb.72:
	jmp	.LBB56_61
.LBB56_21:
	cpx	__rc10
	bcs	.LBB56_23
; %bb.74:
	jmp	.LBB56_61
.LBB56_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB56_23
; %bb.92:
	jmp	.LBB56_61
.LBB56_23:
	ldx	__rc15
	bpl	.LBB56_24
; %bb.94:
	jmp	.LBB56_33
.LBB56_24:
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
.LBB56_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB56_29
; %bb.26:                               ;   in Loop: Header=BB56_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB56_30
; %bb.27:                               ;   in Loop: Header=BB56_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB56_31
; %bb.28:                               ;   in Loop: Header=BB56_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB56_76
; %bb.96:                               ;   in Loop: Header=BB56_25 Depth=1
	jmp	.LBB56_38
.LBB56_76:                              ;   in Loop: Header=BB56_25 Depth=1
	jmp	.LBB56_34
.LBB56_29:                              ;   in Loop: Header=BB56_25 Depth=1
	cmp	__rc19
	bcs	.LBB56_32
; %bb.98:
	jmp	.LBB56_42
.LBB56_30:                              ;   in Loop: Header=BB56_25 Depth=1
	cpy	__rc18
	bcs	.LBB56_32
; %bb.100:
	jmp	.LBB56_42
.LBB56_31:                              ;   in Loop: Header=BB56_25 Depth=1
	cpy	__rc7
	bcs	.LBB56_32
; %bb.102:
	jmp	.LBB56_42
.LBB56_32:                              ;   in Loop: Header=BB56_25 Depth=1
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
	bmi	.LBB56_78
; %bb.104:                              ;   in Loop: Header=BB56_25 Depth=1
	jmp	.LBB56_25
.LBB56_78:
	jmp	.LBB56_43
.LBB56_33:
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
	jmp	.LBB56_61
.LBB56_34:                              ;   in Loop: Header=BB56_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB56_39
; %bb.35:                               ;   in Loop: Header=BB56_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB56_40
; %bb.36:                               ;   in Loop: Header=BB56_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB56_41
; %bb.37:                               ;   in Loop: Header=BB56_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB56_42
; %bb.82:                               ;   in Loop: Header=BB56_25 Depth=1
	jmp	.LBB56_32
.LBB56_38:                              ;   in Loop: Header=BB56_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB56_42
; %bb.84:                               ;   in Loop: Header=BB56_25 Depth=1
	jmp	.LBB56_32
.LBB56_39:                              ;   in Loop: Header=BB56_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB56_42
; %bb.86:                               ;   in Loop: Header=BB56_25 Depth=1
	jmp	.LBB56_32
.LBB56_40:                              ;   in Loop: Header=BB56_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB56_42
; %bb.88:                               ;   in Loop: Header=BB56_25 Depth=1
	jmp	.LBB56_32
.LBB56_41:                              ;   in Loop: Header=BB56_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB56_42
; %bb.106:                              ;   in Loop: Header=BB56_25 Depth=1
	jmp	.LBB56_32
.LBB56_42:
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
.LBB56_43:
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
	bne	.LBB56_44
; %bb.108:
	jmp	.LBB56_61
.LBB56_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB56_52
; %bb.45:                               ;   in Loop: Header=BB56_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB56_46
; %bb.110:                              ;   in Loop: Header=BB56_44 Depth=1
	jmp	.LBB56_55
.LBB56_46:                              ;   in Loop: Header=BB56_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB56_47
; %bb.112:                              ;   in Loop: Header=BB56_44 Depth=1
	jmp	.LBB56_56
.LBB56_47:                              ;   in Loop: Header=BB56_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB56_48
; %bb.114:                              ;   in Loop: Header=BB56_44 Depth=1
	jmp	.LBB56_57
.LBB56_48:                              ;   in Loop: Header=BB56_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB56_49
; %bb.116:                              ;   in Loop: Header=BB56_44 Depth=1
	jmp	.LBB56_58
.LBB56_49:                              ;   in Loop: Header=BB56_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB56_50
; %bb.118:                              ;   in Loop: Header=BB56_44 Depth=1
	jmp	.LBB56_59
.LBB56_50:                              ;   in Loop: Header=BB56_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB56_51
; %bb.120:                              ;   in Loop: Header=BB56_44 Depth=1
	jmp	.LBB56_60
.LBB56_51:                              ;   in Loop: Header=BB56_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB56_53
	bra	.LBB56_54
.LBB56_52:                              ;   in Loop: Header=BB56_44 Depth=1
	cmp	__rc19
	bcc	.LBB56_54
.LBB56_53:                              ;   in Loop: Header=BB56_44 Depth=1
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
.LBB56_54:                              ;   in Loop: Header=BB56_44 Depth=1
	dex
	beq	.LBB56_61
; %bb.122:                              ;   in Loop: Header=BB56_44 Depth=1
	jmp	.LBB56_44
.LBB56_55:                              ;   in Loop: Header=BB56_44 Depth=1
	cpy	__rc18
	bcs	.LBB56_53
	bra	.LBB56_54
.LBB56_56:                              ;   in Loop: Header=BB56_44 Depth=1
	cpy	__rc7
	bcs	.LBB56_53
	bra	.LBB56_54
.LBB56_57:                              ;   in Loop: Header=BB56_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB56_53
	bra	.LBB56_54
.LBB56_58:                              ;   in Loop: Header=BB56_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB56_53
	bra	.LBB56_54
.LBB56_59:                              ;   in Loop: Header=BB56_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB56_53
	bra	.LBB56_54
.LBB56_60:                              ;   in Loop: Header=BB56_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB56_54
; %bb.124:                              ;   in Loop: Header=BB56_44 Depth=1
	jmp	.LBB56_53
.LBB56_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end56:
	.size	__umoddi3, .Lfunc_end56-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB57_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB57_2
; %bb.18:
	jmp	.LBB57_17
.LBB57_2:
	lda	__rc5
	bpl	.LBB57_3
; %bb.20:
	jmp	.LBB57_15
.LBB57_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB57_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB57_6
; %bb.5:                                ;   in Loop: Header=BB57_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB57_9
	bra	.LBB57_7
.LBB57_6:                               ;   in Loop: Header=BB57_4 Depth=1
	cpy	__rc6
	bcc	.LBB57_9
.LBB57_7:                               ;   in Loop: Header=BB57_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB57_4
	bra	.LBB57_10
.LBB57_8:
	sty	__rc7
	bra	.LBB57_17
.LBB57_9:
	ldy	__rc5
	sty	__rc4
.LBB57_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB57_16
; %bb.11:
	lda	#1
.LBB57_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB57_14
; %bb.13:                               ;   in Loop: Header=BB57_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB57_14:                              ;   in Loop: Header=BB57_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB57_12
	bra	.LBB57_17
.LBB57_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB57_16:
	lda	#1
.LBB57_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end57:
	.size	__udivmodqi4, .Lfunc_end57-__udivmodqi4
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
	bne	.LBB58_2
; %bb.1:
	ldx	__rc2
	beq	.LBB58_4
.LBB58_2:
	cmp	__rc3
	bne	.LBB58_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB58_6
.LBB58_4:
	ldx	#0
; %bb.26:
	jmp	.LBB58_24
.LBB58_5:
	cmp	__rc3
	bcc	.LBB58_4
.LBB58_6:
	tay
	ldx	__rc3
	bpl	.LBB58_7
; %bb.28:
	jmp	.LBB58_22
.LBB58_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB58_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB58_10
; %bb.9:                                ;   in Loop: Header=BB58_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB58_11
	bra	.LBB58_12
.LBB58_10:                              ;   in Loop: Header=BB58_8 Depth=1
	cmp	__rc8
	bcc	.LBB58_12
.LBB58_11:                              ;   in Loop: Header=BB58_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB58_8
	bra	.LBB58_13
.LBB58_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB58_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB58_14
; %bb.30:
	jmp	.LBB58_23
.LBB58_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB58_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB58_17
; %bb.16:                               ;   in Loop: Header=BB58_15 Depth=1
	ldy	#0
.LBB58_17:                              ;   in Loop: Header=BB58_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB58_21
; %bb.18:                               ;   in Loop: Header=BB58_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB58_20
.LBB58_19:                              ;   in Loop: Header=BB58_15 Depth=1
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
.LBB58_20:                              ;   in Loop: Header=BB58_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB58_15
	bra	.LBB58_25
.LBB58_21:                              ;   in Loop: Header=BB58_15 Depth=1
	cmp	__rc8
	bcs	.LBB58_19
	bra	.LBB58_20
.LBB58_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB58_23:
	ldx	#1
.LBB58_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB58_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end58:
	.size	__udivmodhi4, .Lfunc_end58-__udivmodhi4
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
	bpl	.LBB59_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB59_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB59_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB59_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB59_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB59_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB59_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB59_8:
	lda	__rc2
	rts
.Lfunc_end59:
	.size	__divqi3, .Lfunc_end59-__divqi3
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
	bmi	.LBB60_2
; %bb.1:
	bra	.LBB60_6
.LBB60_2:
	cpx	#128
	bne	.LBB60_5
; %bb.3:
	lda	__rc4
	bne	.LBB60_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB60_6
.LBB60_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB60_6:
	tya
	bmi	.LBB60_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB60_12
.LBB60_8:
	cpy	#128
	bne	.LBB60_11
; %bb.9:
	lda	__rc2
	bne	.LBB60_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB60_12
.LBB60_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB60_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB60_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB60_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end60:
	.size	__divhi3, .Lfunc_end60-__divhi3
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
	bmi	.LBB61_2
; %bb.1:
	ldy	__rc3
	bra	.LBB61_8
.LBB61_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB61_7
; %bb.3:
	lda	__rc2
	bne	.LBB61_7
; %bb.4:
	lda	__rc8
	bne	.LBB61_7
; %bb.5:
	lda	__rc9
	bne	.LBB61_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB61_8
.LBB61_7:
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
.LBB61_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB61_10
; %bb.9:
	lda	__rc7
	bra	.LBB61_16
.LBB61_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB61_15
; %bb.11:
	lda	__rc6
	bne	.LBB61_15
; %bb.12:
	lda	__rc5
	bne	.LBB61_15
; %bb.13:
	lda	__rc4
	bne	.LBB61_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB61_16
.LBB61_15:
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
.LBB61_16:
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
	bne	.LBB61_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB61_19
.LBB61_18:
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
.LBB61_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end61:
	.size	__divsi3, .Lfunc_end61-__divsi3
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
	bmi	.LBB62_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB62_12
.LBB62_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB62_11
; %bb.3:
	lda	__rc6
	bne	.LBB62_11
; %bb.4:
	lda	__rc5
	bne	.LBB62_11
; %bb.5:
	lda	__rc4
	bne	.LBB62_11
; %bb.6:
	lda	__rc3
	bne	.LBB62_11
; %bb.7:
	lda	__rc2
	bne	.LBB62_11
; %bb.8:
	lda	__rc18
	bne	.LBB62_11
; %bb.9:
	lda	__rc19
	bne	.LBB62_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB62_12
.LBB62_11:
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
.LBB62_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB62_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB62_24
.LBB62_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB62_23
; %bb.15:
	lda	__rc14
	bne	.LBB62_23
; %bb.16:
	lda	__rc13
	bne	.LBB62_23
; %bb.17:
	lda	__rc12
	bne	.LBB62_23
; %bb.18:
	lda	__rc11
	bne	.LBB62_23
; %bb.19:
	lda	__rc10
	bne	.LBB62_23
; %bb.20:
	lda	__rc9
	bne	.LBB62_23
; %bb.21:
	lda	__rc8
	bne	.LBB62_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB62_24
.LBB62_23:
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
.LBB62_24:
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
	bne	.LBB62_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB62_27
.LBB62_26:
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
.LBB62_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end62:
	.size	__divdi3, .Lfunc_end62-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB63_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB63_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB63_3:
	tay
	lda	__rc2
	bmi	.LBB63_5
; %bb.4:
	lda	__rc2
	bra	.LBB63_7
.LBB63_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB63_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB63_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB63_9
; %bb.8:
	rts
.LBB63_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end63:
	.size	__modqi3, .Lfunc_end63-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB64_2
; %bb.1:
	txa
	bra	.LBB64_6
.LBB64_2:
	cpx	#128
	bne	.LBB64_5
; %bb.3:
	lda	__rc4
	bne	.LBB64_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB64_6
.LBB64_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB64_6:
	ldx	__rc3
	bpl	.LBB64_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB64_10
; %bb.8:
	ldx	__rc2
	bne	.LBB64_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB64_11
.LBB64_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB64_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB64_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB64_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end64:
	.size	__modhi3, .Lfunc_end64-__modhi3
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
	bmi	.LBB65_2
; %bb.1:
	lda	__rc3
	bra	.LBB65_8
.LBB65_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB65_7
; %bb.3:
	lda	__rc2
	bne	.LBB65_7
; %bb.4:
	lda	__rc8
	bne	.LBB65_7
; %bb.5:
	lda	__rc9
	bne	.LBB65_7
; %bb.6:
	stz	__rc9
	lda	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB65_8
.LBB65_7:
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
.LBB65_8:
	ldx	__rc7
	bpl	.LBB65_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB65_14
; %bb.10:
	ldx	__rc6
	bne	.LBB65_14
; %bb.11:
	ldx	__rc5
	bne	.LBB65_14
; %bb.12:
	ldx	__rc4
	bne	.LBB65_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB65_15
.LBB65_14:
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
.LBB65_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB65_17
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
.LBB65_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end65:
	.size	__modsi3, .Lfunc_end65-__modsi3
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
	bmi	.LBB66_2
; %bb.1:
	lda	__rc7
; %bb.26:
	jmp	.LBB66_12
.LBB66_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB66_11
; %bb.3:
	lda	__rc6
	bne	.LBB66_11
; %bb.4:
	lda	__rc5
	bne	.LBB66_11
; %bb.5:
	lda	__rc4
	bne	.LBB66_11
; %bb.6:
	lda	__rc3
	bne	.LBB66_11
; %bb.7:
	lda	__rc2
	bne	.LBB66_11
; %bb.8:
	lda	__rc18
	bne	.LBB66_11
; %bb.9:
	lda	__rc19
	bne	.LBB66_11
; %bb.10:
	stz	__rc19
	lda	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB66_12
.LBB66_11:
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
.LBB66_12:
	ldx	__rc15
	bmi	.LBB66_13
; %bb.28:
	jmp	.LBB66_23
.LBB66_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB66_22
; %bb.14:
	ldx	__rc14
	bne	.LBB66_22
; %bb.15:
	ldx	__rc13
	bne	.LBB66_22
; %bb.16:
	ldx	__rc12
	bne	.LBB66_22
; %bb.17:
	ldx	__rc11
	bne	.LBB66_22
; %bb.18:
	ldx	__rc10
	bne	.LBB66_22
; %bb.19:
	ldx	__rc9
	bne	.LBB66_22
; %bb.20:
	ldx	__rc8
	bne	.LBB66_22
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
	bra	.LBB66_23
.LBB66_22:
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
.LBB66_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB66_25
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
.LBB66_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end66:
	.size	__moddi3, .Lfunc_end66-__moddi3
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
	bpl	.LBB67_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB67_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB67_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB67_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB67_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB67_11
.LBB67_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB67_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB67_8
; %bb.34:
	jmp	.LBB67_24
.LBB67_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB67_24
.LBB67_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB67_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB67_12
.LBB67_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB67_24
.LBB67_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB67_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB67_15
; %bb.14:                               ;   in Loop: Header=BB67_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB67_18
	bra	.LBB67_16
.LBB67_15:                              ;   in Loop: Header=BB67_13 Depth=1
	cmp	__rc7
	bcc	.LBB67_18
.LBB67_16:                              ;   in Loop: Header=BB67_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB67_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB67_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB67_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB67_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB67_22
; %bb.21:                               ;   in Loop: Header=BB67_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB67_22:                              ;   in Loop: Header=BB67_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB67_20
	bra	.LBB67_24
.LBB67_23:
	sta	__rc7
	sty	__rc6
.LBB67_24:
	lda	__rc4
	bmi	.LBB67_26
; %bb.25:
	lda	__rc7
	bra	.LBB67_27
.LBB67_26:
	lda	#0
	sec
	sbc	__rc7
.LBB67_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB67_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB67_29:
	lda	__rc6
	rts
.Lfunc_end67:
	.size	__divmodqi4, .Lfunc_end67-__divmodqi4
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
	bmi	.LBB68_2
.LBB68_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB68_6
.LBB68_2:
	cpx	#128
	bne	.LBB68_5
; %bb.3:
	lda	__rc7
	bne	.LBB68_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB68_1
.LBB68_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB68_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB68_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB68_15
; %bb.8:
	lda	__rc2
	bne	.LBB68_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB68_18
.LBB68_10:
	cpy	#128
	bne	.LBB68_14
; %bb.11:
	ldy	__rc2
	bne	.LBB68_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB68_13
; %bb.48:
	jmp	.LBB68_45
.LBB68_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB68_18
.LBB68_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB68_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB68_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB68_20
.LBB68_17:
	sta	__rc11
.LBB68_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB68_39
.LBB68_19:
	cmp	__rc7
	bcc	.LBB68_17
.LBB68_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB68_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB68_23
; %bb.22:                               ;   in Loop: Header=BB68_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB68_24
	bra	.LBB68_26
.LBB68_23:                              ;   in Loop: Header=BB68_21 Depth=1
	cmp	__rc9
	bcc	.LBB68_26
.LBB68_24:                              ;   in Loop: Header=BB68_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB68_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB68_27
.LBB68_26:
	tay
.LBB68_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB68_28
; %bb.50:
	jmp	.LBB68_37
.LBB68_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB68_32
.LBB68_29:                              ;   in Loop: Header=BB68_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB68_36
.LBB68_30:                              ;   in Loop: Header=BB68_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB68_31:                              ;   in Loop: Header=BB68_32 Depth=1
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
	beq	.LBB68_39
.LBB68_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB68_34
; %bb.33:                               ;   in Loop: Header=BB68_32 Depth=1
	ldy	#0
.LBB68_34:                              ;   in Loop: Header=BB68_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB68_29
; %bb.35:                               ;   in Loop: Header=BB68_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB68_30
.LBB68_36:                              ;   in Loop: Header=BB68_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB68_31
.LBB68_37:
	sta	__rc11
	ldx	#1
.LBB68_38:
	stx	__rc9
.LBB68_39:
	lda	__rc6
	bmi	.LBB68_41
; %bb.40:
	lda	__rc10
	bra	.LBB68_42
.LBB68_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB68_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB68_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB68_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB68_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB68_38
.Lfunc_end68:
	.size	__divmodhi4, .Lfunc_end68-__divmodhi4
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB69_2
; %bb.1:
	tya
	beq	.LBB69_11
.LBB69_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB69_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB69_5
; %bb.4:                                ;   in Loop: Header=BB69_3 Depth=1
	inc	__rc7
.LBB69_5:                               ;   in Loop: Header=BB69_3 Depth=1
	inc	__rc4
	bne	.LBB69_7
; %bb.6:                                ;   in Loop: Header=BB69_3 Depth=1
	inc	__rc5
.LBB69_7:                               ;   in Loop: Header=BB69_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB69_9
; %bb.8:                                ;   in Loop: Header=BB69_3 Depth=1
	dex
.LBB69_9:                               ;   in Loop: Header=BB69_3 Depth=1
	txa
	bne	.LBB69_3
; %bb.10:                               ;   in Loop: Header=BB69_3 Depth=1
	tya
	bne	.LBB69_3
.LBB69_11:
	rts
.Lfunc_end69:
	.size	memcpy, .Lfunc_end69-memcpy
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
.Lfunc_end70:
	.size	memset, .Lfunc_end70-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB71_4
.LBB71_1:                               ;   in Loop: Header=BB71_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB71_3
; %bb.2:                                ;   in Loop: Header=BB71_4 Depth=1
	inc	__rc3
.LBB71_3:                               ;   in Loop: Header=BB71_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB71_7
.LBB71_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB71_1
; %bb.5:                                ;   in Loop: Header=BB71_4 Depth=1
	cpx	#0
	bne	.LBB71_1
; %bb.6:
	rts
.LBB71_7:                               ;   in Loop: Header=BB71_4 Depth=1
	dec	__rc4
	jmp	.LBB71_4
.Lfunc_end71:
	.size	__memset, .Lfunc_end71-__memset
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
	beq	.LBB72_1
; %bb.15:
	jmp	.LBB72_13
.LBB72_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB72_2
; %bb.17:
	jmp	.LBB72_14
.LBB72_2:
	lda	__rc7
	bne	.LBB72_4
; %bb.3:
	lda	__rc6
	beq	.LBB72_12
.LBB72_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB72_6
; %bb.5:                                ;   in Loop: Header=BB72_4 Depth=1
	dec	__rc9
.LBB72_6:                               ;   in Loop: Header=BB72_4 Depth=1
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
	bne	.LBB72_8
; %bb.7:                                ;   in Loop: Header=BB72_4 Depth=1
	dec	__rc11
.LBB72_8:                               ;   in Loop: Header=BB72_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB72_10
; %bb.9:                                ;   in Loop: Header=BB72_4 Depth=1
	dex
.LBB72_10:                              ;   in Loop: Header=BB72_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB72_4
; %bb.11:                               ;   in Loop: Header=BB72_4 Depth=1
	tya
	bne	.LBB72_4
.LBB72_12:
	rts
.LBB72_13:
	cpx	__rc3
	bcs	.LBB72_14
; %bb.19:
	jmp	.LBB72_2
.LBB72_14:
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
.Lfunc_end72:
	.size	memmove, .Lfunc_end72-memmove
                                        ; -- End function
	.type	.L.str,@object                  ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"UPPERCASE lowercase."
	.size	.L.str, 21

	.type	.L.str.1,@object                ; @.str.1
.L.str.1:
	.asciz	"    is currently beta and does destroy .d81 and disks!"
	.size	.L.str.1, 55

	.type	.L.str.2,@object                ; @.str.2
.L.str.2:
	.asciz	" Midnight Mega "
	.size	.L.str.2, 16

	.type	.L.str.3,@object                ; @.str.3
.L.str.3:
	.asciz	" The Mega65 file commander "
	.size	.L.str.3, 28

	.type	.L.str.4,@object                ; @.str.4
.L.str.4:
	.asciz	"Press almost any key to continue."
	.size	.L.str.4, 34

	.type	.L.str.5,@object                ; @.str.5
.L.str.5:
	.asciz	"Have fun with your Mega65!"
	.size	.L.str.5, 27

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
	.asciz	"BAMsector "
	.size	.L.str.11, 11

	.type	.L.str.12,@object               ; @.str.12
.L.str.12:
	.asciz	"number of sectors too big"
	.size	.L.str.12, 26

	.type	.L.str.13,@object               ; @.str.13
.L.str.13:
	.asciz	"nexttrack "
	.size	.L.str.13, 11

	.type	.L.str.14,@object               ; @.str.14
.L.str.14:
	.asciz	" nextsector "
	.size	.L.str.14, 13

	.type	.L.str.15,@object               ; @.str.15
.L.str.15:
	.asciz	" block is: "
	.size	.L.str.15, 12

	.type	.L.str.16,@object               ; @.str.16
.L.str.16:
	.asciz	" worksector[0]: "
	.size	.L.str.16, 17

	.type	.L.str.18,@object               ; @.str.18
.L.str.18:
	.asciz	"directory entries exhausted"
	.size	.L.str.18, 28

	.type	.L.str.19,@object               ; @.str.19
.L.str.19:
	.asciz	"entry not found"
	.size	.L.str.19, 16

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

	.type	.L.str.7,@object                ; @.str.7
.L.str.7:
	.asciz	" 4"
	.size	.L.str.7, 3

	.type	.L.str.8.44,@object             ; @.str.8.44
.L.str.8.44:
	.asciz	"Edit  "
	.size	.L.str.8.44, 7

	.type	.L.str.9.45,@object             ; @.str.9.45
.L.str.9.45:
	.asciz	" 5"
	.size	.L.str.9.45, 3

	.type	.L.str.10.46,@object            ; @.str.10.46
.L.str.10.46:
	.asciz	"Copy  "
	.size	.L.str.10.46, 7

	.type	.L.str.11.47,@object            ; @.str.11.47
.L.str.11.47:
	.asciz	" 6"
	.size	.L.str.11.47, 3

	.type	.L.str.12.48,@object            ; @.str.12.48
.L.str.12.48:
	.asciz	"RenMov"
	.size	.L.str.12.48, 7

	.type	.L.str.13.49,@object            ; @.str.13.49
.L.str.13.49:
	.asciz	" 7"
	.size	.L.str.13.49, 3

	.type	.L.str.14.50,@object            ; @.str.14.50
.L.str.14.50:
	.asciz	"Mkdir "
	.size	.L.str.14.50, 7

	.type	.L.str.15.51,@object            ; @.str.15.51
.L.str.15.51:
	.asciz	" 8"
	.size	.L.str.15.51, 3

	.type	.L.str.16.52,@object            ; @.str.16.52
.L.str.16.52:
	.asciz	"Delete"
	.size	.L.str.16.52, 7

	.type	.L.str.17.53,@object            ; @.str.17.53
.L.str.17.53:
	.asciz	" 9"
	.size	.L.str.17.53, 3

	.type	.L.str.18.54,@object            ; @.str.18.54
.L.str.18.54:
	.asciz	"Menu  "
	.size	.L.str.18.54, 7

	.type	.L.str.19.55,@object            ; @.str.19.55
.L.str.19.55:
	.asciz	" 10"
	.size	.L.str.19.55, 4

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
	.asciz	"mount failed"
	.size	.L.str.23, 13

	.type	.L.str.24,@object               ; @.str.24
.L.str.24:
	.asciz	"val="
	.size	.L.str.24, 5

	.type	.L.str.25,@object               ; @.str.25
.L.str.25:
	.asciz	"already mounted"
	.size	.L.str.25, 16

	.type	.L.str.26,@object               ; @.str.26
.L.str.26:
	.asciz	" "
	.size	.L.str.26, 2

	.type	.L.str.27,@object               ; @.str.27
.L.str.27:
	.asciz	"drv:"
	.size	.L.str.27, 5

	.type	.L.str.28,@object               ; @.str.28
.L.str.28:
	.asciz	"not yet implemented"
	.size	.L.str.28, 20

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
	.zero	33
	.size	.Lzp_stack, 33

	.type	.Lstatic_stack,@object          ; @static_stack
	.section	.noinit..Lstatic_stack,"aw",@nobits
.Lstatic_stack:
	.zero	22
	.size	.Lstatic_stack, 22

.set .L__udivmodhi4_zp_stk, .Lzp_stack+32
	.size	.L__udivmodhi4_zp_stk, 1
.set .Lcputsxy_zp_stk, .Lzp_stack+23
	.size	.Lcputsxy_zp_stk, 9
.set .Lcputln_zp_stk, .Lzp_stack
	.size	.Lcputln_zp_stk, 6
.set .Lclrhome_zp_stk, .Lzp_stack
	.size	.Lclrhome_zp_stk, 3
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
.set .Lgetdirententry_zp_stk, .Lzp_stack
	.size	.Lgetdirententry_zp_stk, 10
.set .Lcsputdec_zp_stk, .Lzp_stack+1
	.size	.Lcsputdec_zp_stk, 22
.set .Lmprintf_zp_stk, .Lzp_stack
	.size	.Lmprintf_zp_stk, 1
.set .Lmh4printf_zp_stk, .Lzp_stack
	.size	.Lmh4printf_zp_stk, 2
.set .LPutOneSector_zp_stk, .Lzp_stack
	.size	.LPutOneSector_zp_stk, 4
.set .Lmh4printf_sstk, .Lstatic_stack+12
	.size	.Lmh4printf_sstk, 10
.set .LBAMSectorUpdate_sstk, .Lstatic_stack+8
	.size	.LBAMSectorUpdate_sstk, 4
.set .LfindnextBAMtracksector_sstk, .Lstatic_stack
	.size	.LfindnextBAMtracksector_sstk, 8
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

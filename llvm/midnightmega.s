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
	adc	#229
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
	ldy	#9
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
	stz	__rc22
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
	stz	__rc6
	stz	54800
	ldx	#mos16lo(curfile)
	stx	__rc2
	ldx	#mos16hi(curfile)
	stx	__rc3
	ldx	#mos16lo(.L.str.5.35)
	stx	__rc4
	ldx	#mos16hi(.L.str.5.35)
	stx	__rc5
	lda	#16
	ldx	#0
	jsr	memcpy
	jsr	getdirent
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#0
	stx	__rc28
	ldx	#0
	stx	__rc29
; %bb.225:
	jmp	.LBB0_105
.LBB0_18:                               ;   in Loop: Header=BB0_105 Depth=1
	ldx	#3
	txa
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#40
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#0
	ldy	#2
	sta	(__rc2),y
	stz	BAMsector
	ldx	#22
	stx	BAMsector+1
	stz	BAMsector+2
	inx
	stx	BAMsector+3
	stz	worksector
	inx
	stx	worksector+1
	stz	worksector+2
	ldy	#25
	sty	worksector+3
	stz	worksectorasBAM.0
	stx	worksectorasBAM.0+1
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	direntryblock.1
	inx
	stx	direntryblock.1+1
	stz	mos8(offsCurrIdx)
	stz	flagCurrSec
	;APP
	lda	#0
	sta	53376

	;NO_APP
	stz	__rc23
	ldx	mos8(direntryblock.0)
	stx	__rc4
	ldx	mos8(direntryblock.0+1)
	stx	__rc21
	ldx	#8
	pha
	txa
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stz	__rc25
	bra	.LBB0_21
.LBB0_19:                               ;   in Loop: Header=BB0_21 Depth=2
	cmp	__rc3
	bcc	.LBB0_20
; %bb.255:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_27
.LBB0_20:                               ;   in Loop: Header=BB0_21 Depth=2
	stx	__rc23
	pha
	lda	__rc2
	phy
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	pla
	ldx	__rc3
	stx	__rc25
	sty	__rc4
.LBB0_21:                               ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lsr
	ldx	__rc23
	stx	__rc10
	ror	__rc10
	stz	__rc22
	ror	__rc22
	lsr
	ror	__rc10
	ror	__rc22
	lsr
	ror	__rc10
	ror	__rc22
	ldx	#0
	stz	__rc2
	ldy	#8
	sty	__rc3
	ldy	__rc4
	sty	__rc20
	ldy	__rc21
	sty	__rc5
	stz	__rc6
	stz	__rc7
	ldy	#32
	sty	__rc8
	stz	__rc9
	ldx	__rc10
	stx	__rc24
	ldx	__rc10
	lda	__rc22
	jsr	lcopy
	ldx	6656
	beq	.LBB0_23
; %bb.22:                               ;   in Loop: Header=BB0_21 Depth=2
	clc
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	__rc25
	adc	#0
	sta	__rc3
	ldy	6657
	tya
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	bra	.LBB0_24
.LBB0_23:                               ;   in Loop: Header=BB0_21 Depth=2
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	ldx	__rc25
	stx	__rc3
.LBB0_24:                               ;   in Loop: Header=BB0_21 Depth=2
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	__rc20
	cmp	__rc23
	bne	.LBB0_25
; %bb.257:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_100
.LBB0_25:                               ;   in Loop: Header=BB0_21 Depth=2
	ldx	__rc23
	inx
	lda	#0
	cmp	__rc3
	beq	.LBB0_26
; %bb.259:                              ;   in Loop: Header=BB0_21 Depth=2
	jmp	.LBB0_19
.LBB0_26:                               ;   in Loop: Header=BB0_21 Depth=2
	cpx	__rc2
	bcs	.LBB0_27
; %bb.261:                              ;   in Loop: Header=BB0_21 Depth=2
	jmp	.LBB0_20
.LBB0_27:                               ;   in Loop: Header=BB0_105 Depth=1
	ldx	#mos16lo(.L.str.37)
	stx	__rc2
	ldx	#mos16hi(.L.str.37)
	stx	__rc3
	jsr	messagebox
.LBB0_28:                               ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_28
; %bb.227:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_58
.LBB0_29:                               ;   in Loop: Header=BB0_105 Depth=1
	stz	__rc22
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	bne	.LBB0_30
; %bb.263:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_105
.LBB0_30:                               ;   in Loop: Header=BB0_105 Depth=1
	dex
	stx	__rc22
; %bb.229:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_105
.LBB0_31:                               ;   in Loop: Header=BB0_105 Depth=1
	ldx	#mos16lo(.L.str.7.37)
	stx	__rc2
	ldx	#mos16hi(.L.str.7.37)
	stx	__rc3
	jsr	messagebox
.LBB0_32:                               ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_32
; %bb.33:                               ;   in Loop: Header=BB0_105 Depth=1
	stz	54800
; %bb.231:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_104
.LBB0_34:                               ;   in Loop: Header=BB0_105 Depth=1
	inc	__rc22
; %bb.233:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_105
.LBB0_35:                               ;   in Loop: Header=BB0_105 Depth=1
	jsr	getdirent
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
; %bb.235:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_105
.LBB0_36:                               ;   in Loop: Header=BB0_105 Depth=1
	ldx	#1
	lda	__rc22
	beq	.LBB0_38
; %bb.37:                               ;   in Loop: Header=BB0_105 Depth=1
	ldx	#0
.LBB0_38:                               ;   in Loop: Header=BB0_105 Depth=1
	ldy	#1
	tya
	phy
	dey
	sty	__rc28
	ldy	#0
	sty	__rc29
	ply
	pha
	phy
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	pla
	inc	__rc2
	dec	__rc2
	bne	.LBB0_40
; %bb.39:                               ;   in Loop: Header=BB0_105 Depth=1
	lda	#0
.LBB0_40:                               ;   in Loop: Header=BB0_105 Depth=1
	sty	__rc2
	cpx	#0
	bne	.LBB0_42
; %bb.41:                               ;   in Loop: Header=BB0_105 Depth=1
	stz	__rc2
.LBB0_42:                               ;   in Loop: Header=BB0_105 Depth=1
	ora	__rc2
	and	#1
	beq	.LBB0_44
	bra	.LBB0_47
.LBB0_43:                               ;   in Loop: Header=BB0_105 Depth=1
	ldx	#0
	stx	__rc28
	ldx	#0
	stx	__rc29
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
	lda	__rc22
	beq	.LBB0_47
.LBB0_44:                               ;   in Loop: Header=BB0_105 Depth=1
	ldx	#mos16lo(.L.str.34)
	stx	__rc2
	ldx	#mos16hi(.L.str.34)
	stx	__rc3
	jsr	messagebox
.LBB0_45:                               ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_45
; %bb.46:                               ;   in Loop: Header=BB0_105 Depth=1
	stz	54800
.LBB0_47:                               ;   in Loop: Header=BB0_105 Depth=1
	ldy	#3
	phy
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc24),y
	ldy	#4
	phy
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc24),y
	ldx	#8
	txa
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#3
	txa
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#40
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	BAMsector
	ldx	#22
	stx	BAMsector+1
	stz	BAMsector+2
	inx
	stx	BAMsector+3
	stz	worksector
	inx
	stx	worksector+1
	stz	worksector+2
	ldy	#25
	sty	worksector+3
	stz	worksectorasBAM.0
	stx	worksectorasBAM.0+1
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	direntryblock.1
	inx
	stx	direntryblock.1+1
	stz	mos8(offsCurrIdx)
	stz	flagCurrSec
	;APP
	lda	#0
	sta	53376

	;NO_APP
	ldx	mos8(direntryblock.0)
	stx	__rc22
	ldx	mos8(direntryblock.0+1)
	stx	__rc26
	ldx	direntryblock.1
	ldy	direntryblock.1+1
	stz	__rc23
	stz	__rc2
	stz	__rc3
	stx	__rc20
	stx	__rc4
	sty	__rc21
	sty	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc25
	lda	__rc24
	jsr	lcopy
	ldy	#32
	ldx	__rc26
	stx	__rc5
	ldx	__rc22
	stx	__rc4
	ldx	#0
	txa
	stz	__rc30
	bra	.LBB0_50
.LBB0_48:                               ;   in Loop: Header=BB0_50 Depth=2
	cmp	__rc3
	bcc	.LBB0_49
; %bb.265:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_56
.LBB0_49:                               ;   in Loop: Header=BB0_50 Depth=2
	pha
	lda	__rc2
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldy	__rc3
	sty	__rc30
	stz	__rc23
	ldy	#32
.LBB0_50:                               ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lsr
	stx	__rc24
	stx	__rc10
	ror	__rc10
	stz	__rc22
	ror	__rc22
	lsr
	ror	__rc10
	ror	__rc22
	lsr
	ror	__rc10
	ror	__rc22
	stz	__rc2
	ldx	#8
	stx	__rc3
	ldx	__rc4
	stx	__rc25
	stz	__rc6
	stz	__rc7
	sty	__rc8
	stz	__rc9
	ldx	__rc10
	stx	__rc27
	ldx	__rc10
	lda	__rc22
	jsr	lcopy
	ldx	6656
	beq	.LBB0_52
; %bb.51:                               ;   in Loop: Header=BB0_50 Depth=2
	clc
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	__rc30
	adc	#0
	sta	__rc3
	ldy	6657
	tya
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	bra	.LBB0_53
.LBB0_52:                               ;   in Loop: Header=BB0_50 Depth=2
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	ldy	__rc30
	sty	__rc3
.LBB0_53:                               ;   in Loop: Header=BB0_50 Depth=2
	lda	#15
	and	6658
	bne	.LBB0_54
; %bb.267:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_101
.LBB0_54:                               ;   in Loop: Header=BB0_50 Depth=2
	ldx	__rc25
	stx	__rc4
	ldx	__rc26
	stx	__rc5
	ldx	__rc24
	inx
	lda	#0
	cmp	__rc3
	beq	.LBB0_55
; %bb.269:                              ;   in Loop: Header=BB0_50 Depth=2
	jmp	.LBB0_48
.LBB0_55:                               ;   in Loop: Header=BB0_50 Depth=2
	cpx	__rc2
	bcs	.LBB0_56
; %bb.271:                              ;   in Loop: Header=BB0_50 Depth=2
	jmp	.LBB0_49
.LBB0_56:                               ;   in Loop: Header=BB0_105 Depth=1
	ldx	#mos16lo(.L.str.36)
	stx	__rc2
	ldx	#mos16hi(.L.str.36)
	stx	__rc3
	jsr	messagebox
.LBB0_57:                               ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_57
.LBB0_58:                               ;   in Loop: Header=BB0_105 Depth=1
	stz	54800
; %bb.237:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_103
.LBB0_59:                               ;   in Loop: Header=BB0_105 Depth=1
	tax
	;APP
	lda	#22
	sta	54848
	clv
	bcc	errhypclosedir0
	stx	__rc2
	jmp	donehypclosedir0
errhypclosedir0:
	sta	__rc2
donehypclosedir0:
	nop

	;NO_APP
.LBB0_60:                               ;   in Loop: Header=BB0_105 Depth=1
	lda	#0
; %bb.239:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_95
.LBB0_61:                               ;   in Loop: Header=BB0_68 Depth=3
	cmp	#96
	bcc	.LBB0_63
; %bb.62:                               ;   in Loop: Header=BB0_68 Depth=3
	clc
	adc	#160
	bra	.LBB0_65
.LBB0_63:                               ;   in Loop: Header=BB0_68 Depth=3
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB0_65
; %bb.64:                               ;   in Loop: Header=BB0_68 Depth=3
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB0_65:                               ;   in Loop: Header=BB0_68 Depth=3
	sta	(__rc2)
	inc	__rc2
	bne	.LBB0_67
; %bb.66:                               ;   in Loop: Header=BB0_68 Depth=3
	inc	__rc3
.LBB0_67:                               ;   in Loop: Header=BB0_68 Depth=3
	tax
	beq	.LBB0_72
.LBB0_68:                               ;   Parent Loop BB0_105 Depth=1
                                        ;     Parent Loop BB0_95 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc24)
	inc	__rc24
	bne	.LBB0_70
; %bb.69:                               ;   in Loop: Header=BB0_68 Depth=3
	inc	__rc25
.LBB0_70:                               ;   in Loop: Header=BB0_68 Depth=3
	cmp	#192
	bcc	.LBB0_61
; %bb.71:                               ;   in Loop: Header=BB0_68 Depth=3
	eor	#128
	bra	.LBB0_65
.LBB0_72:                               ;   in Loop: Header=BB0_95 Depth=2
	ldx	#5
	txa
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#mos16lo(filelist)
	stx	__rc24
	ldx	#mos16hi(filelist)
	stx	__rc25
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
	stz	__rc26
	ldx	__rc22
	stx	__rc27
.LBB0_73:                               ;   Parent Loop BB0_105 Depth=1
                                        ;     Parent Loop BB0_95 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	(__rc24)
	beq	.LBB0_81
; %bb.74:                               ;   in Loop: Header=BB0_73 Depth=3
	lda	mos8(g_curTextColor)
	ldx	__rc26
	bne	.LBB0_76
; %bb.75:                               ;   in Loop: Header=BB0_73 Depth=3
	ldx	__rc27
	beq	.LBB0_80
.LBB0_76:                               ;   in Loop: Header=BB0_73 Depth=3
	and	#223
.LBB0_77:                               ;   in Loop: Header=BB0_73 Depth=3
	sta	mos8(g_curTextColor)
	ldx	__rc24
	stx	__rc2
	ldx	__rc25
	stx	__rc3
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc20
	tax
	lda	#10
	jsr	cputsxy
	lda	__rc24
	clc
	adc	#65
	sta	__rc24
	lda	__rc25
	adc	#0
	sta	__rc25
	inc	__rc20
	ldx	__rc27
	dec	__rc27
	cpx	#0
	bne	.LBB0_79
; %bb.78:                               ;   in Loop: Header=BB0_73 Depth=3
	dec	__rc26
.LBB0_79:                               ;   in Loop: Header=BB0_73 Depth=3
	lda	__rc20
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc20
	cpx	#23
	bne	.LBB0_73
	bra	.LBB0_81
.LBB0_80:                               ;   in Loop: Header=BB0_73 Depth=3
	ora	#32
	bra	.LBB0_77
.LBB0_81:                               ;   in Loop: Header=BB0_95 Depth=2
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	jsr	cputln
.LBB0_82:                               ;   Parent Loop BB0_105 Depth=1
                                        ;     Parent Loop BB0_95 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	54800
	beq	.LBB0_82
; %bb.83:                               ;   in Loop: Header=BB0_95 Depth=2
	stz	54800
	cmp	#145
	beq	.LBB0_88
; %bb.84:                               ;   in Loop: Header=BB0_95 Depth=2
	cmp	#13
	beq	.LBB0_90
; %bb.85:                               ;   in Loop: Header=BB0_95 Depth=2
	cmp	#17
	bne	.LBB0_86
; %bb.273:                              ;   in Loop: Header=BB0_95 Depth=2
	jmp	.LBB0_94
.LBB0_86:                               ;   in Loop: Header=BB0_95 Depth=2
	cmp	#27
	bne	.LBB0_87
; %bb.275:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_104
.LBB0_87:                               ;   in Loop: Header=BB0_95 Depth=2
	ldx	#0
	stz	__rc2
	stz	__rc3
	jsr	mprintf
	lda	__rc22
; %bb.241:                              ;   in Loop: Header=BB0_95 Depth=2
	jmp	.LBB0_95
.LBB0_88:                               ;   in Loop: Header=BB0_95 Depth=2
	lda	#0
	ldx	__rc22
	bne	.LBB0_89
; %bb.277:                              ;   in Loop: Header=BB0_95 Depth=2
	jmp	.LBB0_95
.LBB0_89:                               ;   in Loop: Header=BB0_95 Depth=2
	dec	__rc22
	lda	__rc22
; %bb.279:                              ;   in Loop: Header=BB0_95 Depth=2
	jmp	.LBB0_95
.LBB0_90:                               ;   in Loop: Header=BB0_95 Depth=2
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
	sta	__rc24
	lda	#mos16hi(filelist)
	adc	__rc3
	sta	__rc25
	ldx	#28
	stx	mos8(fnamehi)
	ldx	#0
	stx	__rc2
	ldx	#28
	stx	__rc3
	ldx	__rc24
	stx	__rc4
	sta	__rc5
	jsr	strcpy
	ldy	mos8(fnamehi)
	;APP
	ldx	#0
	lda	#46
	sta	54848
	clv
	bcc	errhypsetnam1
	lda	#0
	sta	__rc2
	jmp	donehypsetnam1
errhypsetnam1:
	lda	#255
	sta	__rc2
donehypsetnam1:
	nop

	;NO_APP
	;APP
	ldx	#0
	lda	#70
	sta	54848
	clv
	bcc	errhyp1att2
	lda	#0
	sta	__rc2
	jmp	donehyp1att2
errhyp1att2:
	lda	#255
	sta	__rc2
donehyp1att2:
	nop

	;NO_APP
	lda	__rc2
	bne	.LBB0_91
; %bb.281:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_99
.LBB0_91:                               ;   in Loop: Header=BB0_95 Depth=2
	ldx	#mos16lo(.L.str.3.31)
	stx	__rc2
	ldx	#mos16hi(.L.str.3.31)
	stx	__rc3
	jsr	messagebox
.LBB0_92:                               ;   Parent Loop BB0_105 Depth=1
                                        ;     Parent Loop BB0_95 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	54800
	beq	.LBB0_92
; %bb.93:                               ;   in Loop: Header=BB0_95 Depth=2
	stz	54800
	lda	__rc22
	bra	.LBB0_95
.LBB0_94:                               ;   in Loop: Header=BB0_95 Depth=2
	inc	__rc22
	lda	__rc22
.LBB0_95:                               ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_68 Depth 3
                                        ;       Child Loop BB0_73 Depth 3
                                        ;       Child Loop BB0_82 Depth 3
                                        ;       Child Loop BB0_92 Depth 3
	cmp	__rc23
	bcs	.LBB0_97
; %bb.96:                               ;   in Loop: Header=BB0_95 Depth=2
	ldx	#65
	stx	__rc2
	stz	__rc3
	ldx	#0
	sta	__rc22
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
	bne	.LBB0_98
.LBB0_97:                               ;   in Loop: Header=BB0_95 Depth=2
	stz	__rc22
.LBB0_98:                               ;   in Loop: Header=BB0_95 Depth=2
	ldx	#mos16lo(.L.str.2.30)
	stx	__rc24
	ldx	#mos16hi(.L.str.2.30)
	stx	__rc25
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
; %bb.243:                              ;   in Loop: Header=BB0_95 Depth=2
	jmp	.LBB0_68
.LBB0_99:                               ;   in Loop: Header=BB0_105 Depth=1
	ldx	#mos16lo(curfile)
	stx	__rc2
	ldx	#mos16hi(curfile)
	stx	__rc3
	ldx	__rc24
	stx	__rc4
	ldx	__rc25
	stx	__rc5
	jsr	strcpy
; %bb.245:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_103
.LBB0_100:                              ;   in Loop: Header=BB0_105 Depth=1
	lda	#240
	and	6658
	sta	6658
	stz	__rc23
	stz	__rc2
	stz	__rc3
	ldx	__rc22
	stx	__rc4
	ldx	__rc24
	stx	__rc5
	stx	__rc20
	stz	__rc6
	ldx	#8
	stx	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc21
	tya
	jsr	lcopy
	lda	__rc20
	bra	.LBB0_102
.LBB0_101:                              ;   in Loop: Header=BB0_105 Depth=1
	stx	6912
	ldx	6657
	stx	6913
	stz	__rc23
	stz	__rc2
	stz	__rc3
	ldx	__rc22
	stx	__rc4
	ldx	__rc27
	stx	__rc5
	stx	__rc22
	stz	__rc6
	ldx	#8
	stx	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc21
	lda	__rc20
	jsr	lcopy
	lda	__rc22
.LBB0_102:                              ;   in Loop: Header=BB0_105 Depth=1
	and	#31
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
	ldx	worksectorasBAM.0
	ldy	worksectorasBAM.0+1
	stx	__rc2
	sty	__rc3
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	and	#1
	pha
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	pla
	jsr	PutWholeSector
.LBB0_103:                              ;   in Loop: Header=BB0_105 Depth=1
	jsr	getdirent
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB0_104:                              ;   in Loop: Header=BB0_105 Depth=1
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
.LBB0_105:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_115 Depth 2
                                        ;     Child Loop BB0_127 Depth 2
                                        ;     Child Loop BB0_134 Depth 2
                                        ;       Child Loop BB0_148 Depth 3
                                        ;     Child Loop BB0_178 Depth 2
                                        ;     Child Loop BB0_21 Depth 2
                                        ;     Child Loop BB0_28 Depth 2
                                        ;     Child Loop BB0_190 Depth 2
                                        ;     Child Loop BB0_45 Depth 2
                                        ;     Child Loop BB0_50 Depth 2
                                        ;     Child Loop BB0_57 Depth 2
                                        ;     Child Loop BB0_215 Depth 2
                                        ;       Child Loop BB0_204 Depth 3
                                        ;       Child Loop BB0_209 Depth 3
                                        ;     Child Loop BB0_95 Depth 2
                                        ;       Child Loop BB0_68 Depth 3
                                        ;       Child Loop BB0_73 Depth 3
                                        ;       Child Loop BB0_82 Depth 3
                                        ;       Child Loop BB0_92 Depth 3
                                        ;     Child Loop BB0_32 Depth 2
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	cmp	__rc22
	bcs	.LBB0_107
; %bb.106:                              ;   in Loop: Header=BB0_105 Depth=1
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
.LBB0_107:                              ;   in Loop: Header=BB0_105 Depth=1
	lda	__rc22
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#mos16lo(.L.str.6.36)
	stx	__rc22
	ldx	#mos16hi(.L.str.6.36)
	stx	__rc23
	ldx	#39
	stx	__rc2
	ldx	#23
	stx	__rc3
	ldx	#0
	txa
	jsr	mcbox
	lda	#32
	ora	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	bra	.LBB0_115
.LBB0_108:                              ;   in Loop: Header=BB0_115 Depth=2
	cmp	#96
	bcc	.LBB0_110
; %bb.109:                              ;   in Loop: Header=BB0_115 Depth=2
	clc
	adc	#160
	bra	.LBB0_112
.LBB0_110:                              ;   in Loop: Header=BB0_115 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB0_112
; %bb.111:                              ;   in Loop: Header=BB0_115 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB0_112:                              ;   in Loop: Header=BB0_115 Depth=2
	sta	(__rc2)
	inc	__rc2
	bne	.LBB0_114
; %bb.113:                              ;   in Loop: Header=BB0_115 Depth=2
	inc	__rc3
.LBB0_114:                              ;   in Loop: Header=BB0_115 Depth=2
	tax
	beq	.LBB0_119
.LBB0_115:                              ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc22)
	inc	__rc22
	bne	.LBB0_117
; %bb.116:                              ;   in Loop: Header=BB0_115 Depth=2
	inc	__rc23
.LBB0_117:                              ;   in Loop: Header=BB0_115 Depth=2
	cmp	#192
	bcc	.LBB0_108
; %bb.118:                              ;   in Loop: Header=BB0_115 Depth=2
	eor	#128
	bra	.LBB0_112
.LBB0_119:                              ;   in Loop: Header=BB0_105 Depth=1
	ldx	#mos16lo(curfile)
	stx	__rc22
	ldx	#mos16hi(curfile)
	stx	__rc23
	ldx	#52
	stx	__rc20
	ldx	#3
	stx	__rc21
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldx	#0
	lda	#2
	jsr	cputsxy
	bra	.LBB0_127
.LBB0_120:                              ;   in Loop: Header=BB0_127 Depth=2
	cmp	#96
	bcc	.LBB0_122
; %bb.121:                              ;   in Loop: Header=BB0_127 Depth=2
	clc
	adc	#160
	bra	.LBB0_124
.LBB0_122:                              ;   in Loop: Header=BB0_127 Depth=2
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB0_124
; %bb.123:                              ;   in Loop: Header=BB0_127 Depth=2
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB0_124:                              ;   in Loop: Header=BB0_127 Depth=2
	sta	(__rc20)
	inc	__rc20
	bne	.LBB0_126
; %bb.125:                              ;   in Loop: Header=BB0_127 Depth=2
	inc	__rc21
.LBB0_126:                              ;   in Loop: Header=BB0_127 Depth=2
	tax
	beq	.LBB0_131
.LBB0_127:                              ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc22)
	inc	__rc22
	bne	.LBB0_129
; %bb.128:                              ;   in Loop: Header=BB0_127 Depth=2
	inc	__rc23
.LBB0_129:                              ;   in Loop: Header=BB0_127 Depth=2
	cmp	#192
	bcc	.LBB0_120
; %bb.130:                              ;   in Loop: Header=BB0_127 Depth=2
	eor	#128
	bra	.LBB0_124
.LBB0_131:                              ;   in Loop: Header=BB0_105 Depth=1
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
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	cmp	#21
	stz	__rc24
	stz	__rc25
	bcc	.LBB0_133
; %bb.132:                              ;   in Loop: Header=BB0_105 Depth=1
	clc
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#235
	sta	__rc24
	lda	#0
	adc	#255
	sta	__rc25
.LBB0_133:                              ;   in Loop: Header=BB0_105 Depth=1
	stz	__rc26
	ldx	#0
.LBB0_134:                              ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_148 Depth 3
	stx	__rc31
	txa
	clc
	adc	__rc24
	ldx	#1
	bcs	.LBB0_136
; %bb.135:                              ;   in Loop: Header=BB0_134 Depth=2
	ldx	#0
.LBB0_136:                              ;   in Loop: Header=BB0_134 Depth=2
	stx	__rc20
	sta	__rc30
	jsr	getdirententry
	ldx	__rc2
	stx	__rc22
	ldx	__rc3
	stx	__rc23
	ldx	__rc23
	cpx	__rc29
	bne	.LBB0_138
; %bb.137:                              ;   in Loop: Header=BB0_134 Depth=2
	ldx	__rc22
	ldy	#32
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	cpx	__rc28
	bne	.LBB0_139
; %bb.283:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_177
.LBB0_138:                              ;   in Loop: Header=BB0_134 Depth=2
	ldy	#32
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
.LBB0_139:                              ;   in Loop: Header=BB0_134 Depth=2
	lda	__rc26
	ldx	__rc20
	cpx	#1
	adc	__rc25
	bne	.LBB0_142
; %bb.140:                              ;   in Loop: Header=BB0_134 Depth=2
	ldx	__rc30
	cpx	__rc2
	bne	.LBB0_142
; %bb.141:                              ;   in Loop: Header=BB0_134 Depth=2
	ldx	#62
	bra	.LBB0_143
.LBB0_142:                              ;   in Loop: Header=BB0_134 Depth=2
	ldx	#32
.LBB0_143:                              ;   in Loop: Header=BB0_134 Depth=2
	sta	__rc28
	stx	mos8(s)
	sty	mos8(s+1)
	ldy	#5
	lda	(__rc22),y
	cmp	#160
	bne	.LBB0_145
; %bb.144:                              ;   in Loop: Header=BB0_134 Depth=2
	stz	__rc27
	lda	#2
	bra	.LBB0_155
.LBB0_145:                              ;   in Loop: Header=BB0_134 Depth=2
	sta	__rc2
	stz	__rc27
	bra	.LBB0_148
.LBB0_146:                              ;   in Loop: Header=BB0_148 Depth=3
	lda	#0
.LBB0_147:                              ;   in Loop: Header=BB0_148 Depth=3
	tax
	beq	.LBB0_154
.LBB0_148:                              ;   Parent Loop BB0_105 Depth=1
                                        ;     Parent Loop BB0_134 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldx	__rc27
	ldy	__rc27
	lda	__rc2
	sta	mos8(s+2),y
	lda	__rc27
	clc
	adc	__rc22
	sta	__rc2
	lda	__rc23
	adc	#0
	sta	__rc3
	inc	__rc27
	stx	__rc4
	cpx	#15
	ldx	#0
	ldy	#1
	bcs	.LBB0_150
; %bb.149:                              ;   in Loop: Header=BB0_148 Depth=3
	ldy	#0
.LBB0_150:                              ;   in Loop: Header=BB0_148 Depth=3
	sty	__rc5
	bcs	.LBB0_152
; %bb.151:                              ;   in Loop: Header=BB0_148 Depth=3
	ldx	#1
.LBB0_152:                              ;   in Loop: Header=BB0_148 Depth=3
	ldy	#6
	lda	(__rc2),y
	sta	__rc2
	cmp	#160
	beq	.LBB0_146
; %bb.153:                              ;   in Loop: Header=BB0_148 Depth=3
	txa
	and	#1
	bra	.LBB0_147
.LBB0_154:                              ;   in Loop: Header=BB0_134 Depth=2
	clc
	lda	__rc4
	adc	#3
	ldx	__rc5
	bne	.LBB0_158
.LBB0_155:                              ;   in Loop: Header=BB0_134 Depth=2
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
	sbc	__rc27
	stz	__rc4
	inc
	bne	.LBB0_157
; %bb.156:                              ;   in Loop: Header=BB0_134 Depth=2
	inc	__rc4
.LBB0_157:                              ;   in Loop: Header=BB0_134 Depth=2
	tax
	lda	#32
	jsr	__memset
	lda	__rc29
	clc
	adc	#16
	sec
	sbc	__rc27
.LBB0_158:                              ;   in Loop: Header=BB0_134 Depth=2
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
	bne	.LBB0_160
; %bb.159:                              ;   in Loop: Header=BB0_134 Depth=2
	dex
.LBB0_160:                              ;   in Loop: Header=BB0_134 Depth=2
	cpx	#0
	bne	.LBB0_162
; %bb.161:                              ;   in Loop: Header=BB0_134 Depth=2
	cmp	#5
	bra	.LBB0_163
.LBB0_162:                              ;   in Loop: Header=BB0_134 Depth=2
	cpx	#0
.LBB0_163:                              ;   in Loop: Header=BB0_134 Depth=2
	lda	#68
	ldx	#69
	pha
	txa
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#76
	txa
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	bcs	.LBB0_165
; %bb.164:                              ;   in Loop: Header=BB0_134 Depth=2
	ldx	__rc4
	lda	.Lswitch.table.gettype-1,x
	ldy	.Lswitch.table.gettype.38-1,x
	pha
	tya
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	mos8(.Lswitch.table.gettype.39-1),x
	tax
	txa
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
.LBB0_165:                              ;   in Loop: Header=BB0_134 Depth=2
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
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	mos8(s),x
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	mos8(s),y
	lda	__rc3
	clc
	adc	#6
	tay
	lda	__rc3
	clc
	adc	#7
	tax
	lda	#32
	sta	mos8(s),y
	lda	__rc3
	clc
	adc	#8
	tay
	clc
	lda	__rc3
	adc	#9
	sta	__rc2
	sta	__rc20
	lda	#mos8(s)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos8(0)
	adc	#0
	sta	__rc3
	lda	__rc22
	clc
	adc	#30
	sta	__rc4
	lda	__rc23
	adc	#0
	sta	__rc5
	lda	#93
	sta	mos8(s),x
	lda	#32
	sta	mos8(s),y
	ldy	#30
	lda	(__rc22),y
	sta	__rc6
	ldy	#1
	lda	(__rc4),y
	sta	__rc4
	lda	__rc6
	sta	(__rc0)
	lda	__rc4
	sta	(__rc0),y
	jsr	sprintf
	sta	__rc2
	clc
	lda	__rc20
	adc	__rc2
	tax
	tay
	lda	#32
	sta	mos8(s),x
	tya
	clc
	adc	#2
	tax
	iny
	lda	__rc28
	bne	.LBB0_168
; %bb.166:                              ;   in Loop: Header=BB0_134 Depth=2
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	lda	__rc30
	cmp	__rc2
	bne	.LBB0_168
; %bb.167:                              ;   in Loop: Header=BB0_134 Depth=2
	lda	#60
	bra	.LBB0_169
.LBB0_168:                              ;   in Loop: Header=BB0_134 Depth=2
	lda	#32
.LBB0_169:                              ;   in Loop: Header=BB0_134 Depth=2
	sta	mos8(s),y
	stz	mos8(s),x
	lda	mos8(g_curTextColor)
	ldx	__rc28
	bne	.LBB0_172
; %bb.170:                              ;   in Loop: Header=BB0_134 Depth=2
	pha
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	pla
	ldx	__rc30
	cpx	__rc2
	bne	.LBB0_172
; %bb.171:                              ;   in Loop: Header=BB0_134 Depth=2
	ora	#32
	bra	.LBB0_173
.LBB0_172:                              ;   in Loop: Header=BB0_134 Depth=2
	and	#223
.LBB0_173:                              ;   in Loop: Header=BB0_134 Depth=2
	tax
	lda	#1
	ldy	#0
	sty	__rc28
	ldy	#0
	sty	__rc29
	stx	mos8(g_curTextColor)
	ldx	__rc31
	inx
	ldy	#mos8(s)
	sty	__rc2
	ldy	#mos8(0)
	sty	__rc3
	jsr	cputsxy
	ldx	__rc31
	inx
	bne	.LBB0_175
; %bb.174:                              ;   in Loop: Header=BB0_134 Depth=2
	inc	__rc26
.LBB0_175:                              ;   in Loop: Header=BB0_134 Depth=2
	lda	__rc26
	beq	.LBB0_176
; %bb.285:                              ;   in Loop: Header=BB0_134 Depth=2
	jmp	.LBB0_134
.LBB0_176:                              ;   in Loop: Header=BB0_134 Depth=2
	cpx	#22
	beq	.LBB0_177
; %bb.287:                              ;   in Loop: Header=BB0_134 Depth=2
	jmp	.LBB0_134
.LBB0_177:                              ;   in Loop: Header=BB0_105 Depth=1
	lda	#223
	and	mos8(g_curTextColor)
	sta	mos8(g_curTextColor)
	jsr	cputln
.LBB0_178:                              ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	54800
	beq	.LBB0_178
; %bb.179:                              ;   in Loop: Header=BB0_105 Depth=1
	stx	__rc20
	txa
	sec
	sbc	#242
	stz	54800
	cmp	#9
	bcc	.LBB0_185
; %bb.180:                              ;   in Loop: Header=BB0_105 Depth=1
	cpx	#145
	bne	.LBB0_181
; %bb.289:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_29
.LBB0_181:                              ;   in Loop: Header=BB0_105 Depth=1
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	cpx	#13
	bne	.LBB0_182
; %bb.291:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_31
.LBB0_182:                              ;   in Loop: Header=BB0_105 Depth=1
	cpx	#17
	bne	.LBB0_183
; %bb.293:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_34
.LBB0_183:                              ;   in Loop: Header=BB0_105 Depth=1
	cpx	#18
	bne	.LBB0_184
; %bb.295:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_35
.LBB0_184:                              ;   in Loop: Header=BB0_105 Depth=1
	stx	__rc20
	cpx	#27
	beq	.LBB0_247
; %bb.297:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_197
.LBB0_247:
	jmp	.LBB0_221
.LBB0_185:                              ;   in Loop: Header=BB0_105 Depth=1
	tax
	ldy	.LJTI0_0,x
	lda	.LJTI0_0+9,x
	tax
	sty	__rc2
	stx	__rc3
	jmp	(__rc2)
.LBB0_186:                              ;   in Loop: Header=BB0_105 Depth=1
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	getdirententry
	ldx	__rc20
	cpx	#245
	beq	.LBB0_187
; %bb.299:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_18
.LBB0_187:                              ;   in Loop: Header=BB0_105 Depth=1
	ldx	#1
	txa
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#3
	lda	(__rc2),y
	tax
	iny
                                        ; kill: def $rs1 killed $rs1
	phy
	lda	__rc2
	ldy	#10
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
	sta	__rc6
	ldx	#16
	lda	#0
	jsr	readblockchain
	clc
	lda	__rc0
	adc	#26
	sta	__rc4
	lda	__rc1
	adc	#0
	sta	__rc5
	lda	#0
	stz	__rc21
                                        ; kill: def $rs2 killed $rs2
	pha
	lda	__rc4
	ldy	#14
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	(__rc4)
	clc
	lda	__rc0
	adc	#25
	sta	__rc4
	lda	__rc1
	adc	#0
	sta	__rc5
	lda	#255
	tax
	pha
	txa
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
                                        ; kill: def $rs2 killed $rs2
	lda	__rc4
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	sta	(__rc4)
	stz	BAMsector
	ldx	#22
	stx	BAMsector+1
	stz	BAMsector+2
	inx
	stx	BAMsector+3
	stz	worksector
	inx
	stx	worksector+1
	stz	worksector+2
	ldy	#25
	sty	worksector+3
	stz	worksectorasBAM.0
	stx	worksectorasBAM.0+1
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	direntryblock.1
	inx
	stx	direntryblock.1+1
	stz	mos8(offsCurrIdx)
	stz	flagCurrSec
	;APP
	lda	#0
	sta	53376

	;NO_APP
	lda	workside
	asl
	sta	__rc2
	stz	__rc3
	rol	__rc3
	lda	#mos16lo(worksector)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(worksector)
	adc	__rc3
	sta	__rc3
	lda	(__rc2)
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc28
	ldy	#1
	lda	(__rc2),y
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc29
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
	sta	__rc30
	lda	__rc1
	adc	#0
	sta	__rc31
	ldx	__rc30
	stx	__rc4
	sta	__rc5
	jsr	findnextBAMtracksector
	ldy	#1
	lda	(__rc30)
	stz	__rc20
	phy
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sta	__rc30
	lda	(__rc22)
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	sta	__rc31
	lda	#0
	stz	__rc22
	bra	.LBB0_190
.LBB0_188:                              ;   in Loop: Header=BB0_190 Depth=2
	lda	#1
.LBB0_189:                              ;   in Loop: Header=BB0_190 Depth=2
	ldy	#1
	and	#1
	sty	__rc17
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc27
	ldy	__rc26
	cpy	#1
	adc	#1
	stx	__rc20
	pha
	ldy	#22
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	__rc17
	sta	__rc30
	pla
	phy
	ldy	__rc22
	sty	__rc31
	ply
	cpx	#199
	bne	.LBB0_190
; %bb.301:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_43
.LBB0_190:                              ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	clc
	tax
	lda	__rc21
	adc	#0
	sta	__rc10
	stx	__rc27
	txa
	ldx	#1
	bcs	.LBB0_192
; %bb.191:                              ;   in Loop: Header=BB0_190 Depth=2
	ldx	#0
.LBB0_192:                              ;   in Loop: Header=BB0_190 Depth=2
	stx	__rc26
	adc	#16
	sta	__rc11
	lda	#0
	adc	#0
	sta	__rc2
	lda	#0
	adc	#8
	sta	__rc3
	phy
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc5
	ldx	#0
	stz	__rc6
	stz	__rc7
	stz	__rc8
	sty	__rc9
	ldx	__rc11
	lda	__rc10
	sta	__rc21
	jsr	lcopy
	lda	(__rc28)
	beq	.LBB0_194
; %bb.193:                              ;   in Loop: Header=BB0_190 Depth=2
	ldy	#14
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	ldx	__rc22
	stx	__rc2
	sta	__rc3
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
	ldx	__rc24
	stx	__rc4
	sta	__rc5
	jsr	findnextBAMtracksector
	lda	(__rc22)
	sta	(__rc28)
	lda	(__rc24)
	ldy	#22
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#1
	sta	(__rc28),y
	lda	(__rc22)
	sta	__rc22
.LBB0_194:                              ;   in Loop: Header=BB0_190 Depth=2
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
	bne	.LBB0_195
; %bb.303:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_36
.LBB0_195:                              ;   in Loop: Header=BB0_190 Depth=2
	lda	__rc20
	ldx	__rc20
	inx
	cmp	#198
	bcs	.LBB0_196
; %bb.305:                              ;   in Loop: Header=BB0_190 Depth=2
	jmp	.LBB0_188
.LBB0_196:                              ;   in Loop: Header=BB0_190 Depth=2
	lda	#0
; %bb.249:                              ;   in Loop: Header=BB0_190 Depth=2
	jmp	.LBB0_189
.LBB0_197:                              ;   in Loop: Header=BB0_105 Depth=1
	ldx	#0
	stz	__rc2
	stz	__rc3
	lda	__rc20
	jsr	mprintf
; %bb.251:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_104
.LBB0_198:                              ;   in Loop: Header=BB0_105 Depth=1
	;APP
	ldx	#0
	lda	#4
	sta	54848
	clv
	bcc	errgetcurdrv3
	sta	__rc2
	jmp	donegetcurdrv3
errgetcurdrv3:
	lda	#255
	sta	__rc2
donegetcurdrv3:
	nop
	;NO_APP
	ldx	__rc2
	stz	__rc23
	cpx	#255
	bne	.LBB0_199
; %bb.307:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_60
.LBB0_199:                              ;   in Loop: Header=BB0_105 Depth=1
	;APP
	ldx	#0
	lda	#18
	sta	54848
	clv
	bcc	errhypopendir4
	sta	__rc2
	jmp	donehypopendir4
errhypopendir4:
	lda	#255
	sta	__rc2
donehypopendir4:
	nop

	;NO_APP
	lda	__rc2
	cmp	#132
	bne	.LBB0_200
; %bb.309:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_60
.LBB0_200:                              ;   in Loop: Header=BB0_105 Depth=1
	cmp	#135
	bne	.LBB0_201
; %bb.311:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_60
.LBB0_201:                              ;   in Loop: Header=BB0_105 Depth=1
	cmp	#255
	bne	.LBB0_202
; %bb.313:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_60
.LBB0_202:                              ;   in Loop: Header=BB0_105 Depth=1
	stz	__rc22
	ldx	#0
; %bb.253:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_215
.LBB0_203:                              ;   in Loop: Header=BB0_215 Depth=2
	ldy	#0
	ldx	#0
.LBB0_204:                              ;   Parent Loop BB0_105 Depth=1
                                        ;     Parent Loop BB0_215 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	6721,y
	cmp	#32
	beq	.LBB0_208
; %bb.205:                              ;   in Loop: Header=BB0_204 Depth=3
	cmp	#33
	bcc	.LBB0_207
; %bb.206:                              ;   in Loop: Header=BB0_204 Depth=3
	sta	7233,x
	inx
.LBB0_207:                              ;   in Loop: Header=BB0_204 Depth=3
	iny
	cpy	#8
	bne	.LBB0_204
.LBB0_208:                              ;   in Loop: Header=BB0_215 Depth=2
	ldy	#0
	lda	#46
	sta	7233,x
	inx
.LBB0_209:                              ;   Parent Loop BB0_105 Depth=1
                                        ;     Parent Loop BB0_215 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	6729,y
	cmp	#32
	beq	.LBB0_213
; %bb.210:                              ;   in Loop: Header=BB0_209 Depth=3
	cmp	#33
	bcc	.LBB0_212
; %bb.211:                              ;   in Loop: Header=BB0_209 Depth=3
	sta	7233,x
	inx
.LBB0_212:                              ;   in Loop: Header=BB0_209 Depth=3
	iny
	cpy	#3
	bne	.LBB0_209
.LBB0_213:                              ;   in Loop: Header=BB0_215 Depth=2
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
	inc	__rc23
.LBB0_214:                              ;   in Loop: Header=BB0_215 Depth=2
	lda	__rc20
	ldx	__rc21
	inx
	cpy	#17
	bcc	.LBB0_215
; %bb.315:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_59
.LBB0_215:                              ;   Parent Loop BB0_105 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_204 Depth 3
                                        ;       Child Loop BB0_209 Depth 3
	stx	__rc21
	sta	__rc20
	tay
	;APP
	phx
	ldx	#0
	txa
hypreaddirloop5:
	sta	6656,x
	dex
	bne	hypreaddirloop5
	plx
	tya
	tax
	ldy	#mos16hi(6656)
	lda	#20
	sta	54848
	clv
	bcc	errhypreaddir5
	stx	__rc2
	jmp	donehypreaddir5
errhypreaddir5:
	sta	__rc2
donehypreaddir5:
	nop

	;NO_APP
	ldy	__rc2
	ldx	6720
	stz	6656,x
	cpy	#133
	beq	.LBB0_217
; %bb.216:                              ;   in Loop: Header=BB0_215 Depth=2
	cpy	#255
	beq	.LBB0_217
; %bb.317:                              ;   in Loop: Header=BB0_215 Depth=2
	jmp	.LBB0_203
.LBB0_217:                              ;   in Loop: Header=BB0_215 Depth=2
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
	bra	.LBB0_214
.LBB0_218:                              ;   in Loop: Header=BB0_105 Depth=1
	ldx	54801
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	cpx	#1
	beq	.LBB0_220
; %bb.219:                              ;   in Loop: Header=BB0_105 Depth=1
	ldx	54801
	cpx	#2
	beq	.LBB0_220
; %bb.319:                              ;   in Loop: Header=BB0_105 Depth=1
	jmp	.LBB0_105
.LBB0_220:
	jsr	clrscr
	stz	mos8(g_curX)
	stz	mos8(g_curY)
.LBB0_221:
	ldx	#mos16lo(.L.str.3)
	stx	__rc2
	ldx	#mos16hi(.L.str.3)
	stx	__rc3
	jsr	msprintf
	jsr	cputln
.LBB0_222:                              ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB0_222
.LBB0_223:                              ; =>This Inner Loop Header: Depth=1
	stz	54800
	ldx	54800
	bne	.LBB0_223
; %bb.224:
	;APP
	lda	#55
	sta	1
	jmp	(65526)
	;NO_APP
	ldx	#0
	txa
	sta	__rc16
	ldy	#2
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
	adc	#27
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
	.byte	.LBB0_198@mos16lo
	.byte	.LBB0_197@mos16lo
	.byte	.LBB0_197@mos16lo
	.byte	.LBB0_186@mos16lo
	.byte	.LBB0_197@mos16lo
	.byte	.LBB0_197@mos16lo
	.byte	.LBB0_186@mos16lo
	.byte	.LBB0_197@mos16lo
	.byte	.LBB0_218@mos16lo
	.byte	.LBB0_198@mos16hi
	.byte	.LBB0_197@mos16hi
	.byte	.LBB0_197@mos16hi
	.byte	.LBB0_186@mos16hi
	.byte	.LBB0_197@mos16hi
	.byte	.LBB0_197@mos16hi
	.byte	.LBB0_186@mos16hi
	.byte	.LBB0_197@mos16hi
	.byte	.LBB0_218@mos16hi
                                        ; -- End function
	.section	.text.GetWholeSector,"ax",@progbits
	.type	GetWholeSector,@function        ; -- Begin function GetWholeSector
GetWholeSector:                         ; @GetWholeSector
; %bb.0:
	tay
	bne	.LBB1_1
; %bb.5:
	jmp	.LBB1_4
.LBB1_1:
	txa
	phy
	plx
	tay
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
wait026:
	lda	53378
	bmi	wait026
	lda	53378
	and	#24
	beq	succeed026
	lda	#64
	sta	53376
	sec
	jmp	endsub026
succeed026:
	lda	#128
	trb	54921
	clc
	lda	#0
	sta	offsCurrIdx
	lda	flagCurrSec
	beq	upper026
	jmp	endsub026
upper026:
	jmp	endsub026
endsub026:
	bcs	err026
	lda	flagCurrSec
	jmp	end026
err026:
	lda	#255
end026:
	sta	__rc4

	;NO_APP
	lda	__rc4
	cmp	#2
	bcc	.LBB1_2
; %bb.7:
	jmp	.LBB1_3
.LBB1_2:
	pha
	clc
	lda	__rc0
	adc	#253
	sta	__rc0
	lda	__rc1
	adc	#255
	sta	__rc1
	lda	__rc2
	ldy	#2
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc3
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	dey
	ldx	#253
	stx	__rc2
	ldx	#15
	stx	__rc3
	phy
	ldy	#2
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc5
	pla
	sty	__rc6
	sty	__rc7
	sty	__rc8
	ldx	#1
	stx	__rc9
	ldx	#108
	phy
	ldy	#0
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	tya
	jsr	lcopy
	clc
	ldy	#2
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#0
	sta	__rc4
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
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
	ldy	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	pha
	clc
	lda	__rc0
	adc	#3
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	pla
.LBB1_3:
	rts
.LBB1_4:
	lda	#252
	rts
.Lfunc_end1:
	.size	GetWholeSector, .Lfunc_end1-GetWholeSector
                                        ; -- End function
	.section	.text.PutWholeSector,"ax",@progbits
	.type	PutWholeSector,@function        ; -- Begin function PutWholeSector
PutWholeSector:                         ; @PutWholeSector
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
	stx	__rc20
	cmp	#2
	bcc	.LBB2_1
; %bb.10:
	jmp	.LBB2_9
.LBB2_1:
	sta	__rc21
	ldx	__rc2
	stx	__rc10
	ldx	__rc3
	stx	__rc11
	ldx	__rc4
	stx	__rc22
	lda	__rc20
	beq	.LBB2_3
; %bb.2:
	lda	#97
	ldx	__rc20
	ldy	__rc4
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
wait027:
	lda	53378
	bmi	wait027
	lda	53378
	and	#24
	beq	succeed027
	lda	#64
	sta	53376
	sec
	jmp	endsub027
succeed027:
	lda	#128
	trb	54921
	clc
	lda	#0
	sta	offsCurrIdx
	lda	flagCurrSec
	beq	upper027
	jmp	endsub027
upper027:
	jmp	endsub027
endsub027:
	bcs	err027
	lda	flagCurrSec
	jmp	end027
err027:
	lda	#255
end027:
	sta	__rc2

	;NO_APP
.LBB2_3:
	stz	__rc4
	lda	__rc21
	beq	.LBB2_5
; %bb.4:
	ldy	#109
	bra	.LBB2_6
.LBB2_5:
	ldy	#108
.LBB2_6:
	ldx	#97
	txa
	phy
	ldy	#0
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	ldx	#0
	lda	#1
	sty	__rc5
	ldy	#253
	sty	__rc6
	stz	__rc2
	stz	__rc3
	ldy	#15
	sty	__rc7
	stz	__rc8
	sta	__rc9
	ldx	__rc11
	lda	__rc10
	jsr	lcopy
	sec
	lda	__rc22
	sbc	__rc21
	cmp	#20
	bcc	.LBB2_8
; %bb.7:
	ldx	#105
	pha
	txa
	ldy	#0
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
.LBB2_8:
	tay
	ldx	__rc20
	phy
	ldy	#0
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
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
wait038:
	lda	53378
	bmi	wait038
	lda	53378
	and	#24
	beq	succeed038
	lda	#64
	sta	53376
	sec
	jmp	endsub038
succeed038:
	lda	#128
	trb	54921
	clc
endsub038:
	bcs	err038
	lda	#0
	jmp	end038
err038:
	lda	#255
end038:
	sta	__rc2

	;NO_APP
.LBB2_9:
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
.Lfunc_end2:
	.size	PutWholeSector, .Lfunc_end2-PutWholeSector
                                        ; -- End function
	.section	.text.readblockchain,"ax",@progbits
	.type	readblockchain,@function        ; -- Begin function readblockchain
readblockchain:                         ; @readblockchain
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
	stx	__rc25
	ldx	#22
	stx	BAMsector+1
	inx
	stx	BAMsector+3
	ldx	#25
	stx	worksector+3
	dex
	stx	worksector+1
	stx	worksectorasBAM.0+1
	ldx	#26
	stx	mos8(direntryblock.0+1)
	inx
	stx	direntryblock.1+1
	stz	BAMsector
	stz	BAMsector+2
	stz	worksector
	stz	worksector+2
	stz	worksectorasBAM.0
	stz	mos8(direntryblock.0)
	stz	direntryblock.1
	stz	mos8(offsCurrIdx)
	stz	flagCurrSec
	;APP
	lda	#0
	sta	53376

	;NO_APP
	ldx	__rc4
	bne	.LBB3_1
; %bb.9:
	jmp	.LBB3_4
.LBB3_1:
	sta	__rc24
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	ldx	__rc4
	stx	__rc22
	ldy	__rc6
	sty	__rc28
	stz	__rc23
	stz	__rc26
	stz	__rc27
.LBB3_2:                                ; =>This Inner Loop Header: Depth=1
	ldx	worksectorasBAM.0
	ldy	worksectorasBAM.0+1
	stx	__rc2
	sty	__rc3
	ldx	__rc28
	lda	__rc5
	jsr	GetWholeSector
	sta	workside
	asl
	sta	__rc2
	lda	#0
	rol
	sta	__rc3
	lda	#mos16lo(worksector)
	clc
	adc	__rc2
	sta	__rc2
	lda	#mos16hi(worksector)
	adc	__rc3
	sta	__rc3
	lda	__rc26
	clc
	adc	__rc24
	sta	__rc4
	lda	__rc27
	adc	__rc25
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
	sta	__rc29
	lda	(__rc8),y
	sta	__rc28
	stx	__rc6
	stz	__rc2
	stz	__rc3
	stz	__rc8
	sty	__rc9
	ldx	__rc11
	lda	__rc10
	jsr	lcopy
	lda	__rc29
	beq	.LBB3_8
; %bb.3:                                ;   in Loop: Header=BB3_2 Depth=1
	ldx	__rc29
	stx	__rc5
	clc
	lda	__rc26
	adc	#0
	sta	__rc26
	lda	__rc27
	adc	#1
	sta	__rc27
	dec	__rc22
	beq	.LBB3_5
; %bb.11:                               ;   in Loop: Header=BB3_2 Depth=1
	jmp	.LBB3_2
.LBB3_4:
	lda	__rc5
	beq	.LBB3_8
.LBB3_5:
	ldx	#mos16lo(.L.str.34)
	stx	__rc2
	ldx	#mos16hi(.L.str.34)
	stx	__rc3
	jsr	messagebox
.LBB3_6:                                ; =>This Inner Loop Header: Depth=1
	ldx	54800
	beq	.LBB3_6
; %bb.7:
	stz	54800
.LBB3_8:
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
.Lfunc_end3:
	.size	readblockchain, .Lfunc_end3-readblockchain
                                        ; -- End function
	.section	.text.findnextBAMtracksector,"ax",@progbits
	.type	findnextBAMtracksector,@function ; -- Begin function findnextBAMtracksector
findnextBAMtracksector:                 ; @findnextBAMtracksector
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
                                        ; kill: def $rs1 killed $rs1
	lda	__rc2
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc3
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
                                        ; kill: def $rs2 killed $rs2
	lda	__rc4
	ldy	#11
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#255
	txa
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	BAMsector
	ldx	#22
	stx	BAMsector+1
	stz	BAMsector+2
	inx
	stx	BAMsector+3
	stz	worksector
	ldx	#25
	stx	worksector+3
	dex
	stx	worksector+1
	stz	worksector+2
	stz	worksectorasBAM.0
	stx	worksectorasBAM.0+1
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	direntryblock.1
	inx
	stx	direntryblock.1+1
	stz	mos8(offsCurrIdx)
	stz	flagCurrSec
	;APP
	lda	#0
	sta	53376

	;NO_APP
	ldx	BAMsector
	stx	__rc2
	ldx	BAMsector+1
	stx	__rc3
	lda	#40
	ldx	#1
	jsr	GetWholeSector
	tax
	asl
	stz	__rc2
	rol	__rc2
	clc
	sta	__rc3
	lda	#mos16lo(BAMsector)
	adc	__rc3
	tay
	lda	#mos16hi(BAMsector)
	adc	__rc2
	sty	__rc2
	pha
	txa
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stx	BAMside
	sta	__rc3
	lda	(__rc2)
	sta	__rc6
	sta	__rc4
	ldy	#1
	lda	(__rc2),y
	tay
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	sty	__rc17
	lda	__rc4
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc2
	lda	#0
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	#0
	clc
	pha
	lda	#0
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	__rc17
	pla
.LBB4_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_14 Depth 2
	phy
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	sta	__rc2
	ldx	__rc6
	lda	__rc6
	clc
	adc	__rc2
	sta	__rc6
	tya
	adc	#0
	sta	__rc7
                                        ; kill: def $rs3 killed $rs3
	phy
	lda	__rc6
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc7
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	txa
	clc
	adc	__rc2
	sta	__rc6
	tya
	adc	#0
	sta	__rc7
                                        ; kill: def $rs3 killed $rs3
	phy
	lda	__rc6
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc7
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	txa
	clc
	adc	__rc2
	sta	__rc30
	tya
	adc	#0
	sta	__rc31
	txa
	clc
	adc	__rc2
	sta	__rc20
	tya
	adc	#0
	sta	__rc21
	txa
	phy
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	clc
	adc	__rc2
	sta	__rc22
	tya
	phy
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	tya
	adc	#0
	sta	__rc23
	ldx	#0
; %bb.37:                               ;   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_14
.LBB4_2:                                ;   in Loop: Header=BB4_14 Depth=2
	cpx	#16
	ldy	#1
	bcs	.LBB4_4
; %bb.3:                                ;   in Loop: Header=BB4_14 Depth=2
	ldy	#0
.LBB4_4:                                ;   in Loop: Header=BB4_14 Depth=2
	sty	__rc27
	bcs	.LBB4_6
; %bb.5:                                ;   in Loop: Header=BB4_14 Depth=2
	ldy	#18
	lda	(__rc20),y
	sta	__rc24
	clc
	txa
	adc	#248
	sta	__rc2
	stx	__rc28
	ldx	#0
	stz	__rc25
	lda	#1
; %bb.39:                               ;   in Loop: Header=BB4_14 Depth=2
	jmp	.LBB4_12
.LBB4_6:                                ;   in Loop: Header=BB4_14 Depth=2
	cpx	#24
	bcs	.LBB4_8
; %bb.7:                                ;   in Loop: Header=BB4_14 Depth=2
	ldy	#19
	lda	(__rc30),y
	sta	__rc24
	clc
	txa
	adc	#240
	bra	.LBB4_11
.LBB4_8:                                ;   in Loop: Header=BB4_14 Depth=2
	cpx	#32
	bcs	.LBB4_10
; %bb.9:                                ;   in Loop: Header=BB4_14 Depth=2
	ldy	#20
	phy
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc3
	lda	(__rc2),y
	sta	__rc24
	clc
	txa
	adc	#232
	bra	.LBB4_11
.LBB4_10:                               ;   in Loop: Header=BB4_14 Depth=2
	ldy	#21
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc3
	lda	(__rc2),y
	sta	__rc24
	clc
	txa
	adc	#224
.LBB4_11:                               ;   in Loop: Header=BB4_14 Depth=2
	sta	__rc2
	stx	__rc3
	ldx	#0
	stz	__rc25
	lda	#1
	ldy	__rc3
	sty	__rc28
.LBB4_12:                               ;   in Loop: Header=BB4_14 Depth=2
	jsr	__ashlhi3
	ldy	__rc28
	and	__rc24
	beq	.LBB4_13
; %bb.51:
	jmp	.LBB4_24
.LBB4_13:                               ;   in Loop: Header=BB4_14 Depth=2
	phy
	plx
	inx
	cpy	#39
	bcs	.LBB4_18
.LBB4_14:                               ;   Parent Loop BB4_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cpx	#8
	ldy	#1
	bcs	.LBB4_16
; %bb.15:                               ;   in Loop: Header=BB4_14 Depth=2
	ldy	#0
.LBB4_16:                               ;   in Loop: Header=BB4_14 Depth=2
	sty	__rc26
	bcc	.LBB4_17
; %bb.53:                               ;   in Loop: Header=BB4_14 Depth=2
	jmp	.LBB4_2
.LBB4_17:                               ;   in Loop: Header=BB4_14 Depth=2
	ldy	#17
	lda	(__rc22),y
	sta	__rc24
	stx	__rc2
	stx	__rc3
	ldx	#0
	stz	__rc25
	lda	#1
	ldy	__rc3
	sty	__rc26
	jsr	__ashlhi3
	ldy	__rc26
	and	__rc24
	beq	.LBB4_13
; %bb.41:
	jmp	.LBB4_22
.LBB4_18:                               ;   in Loop: Header=BB4_1 Depth=1
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tay
	tax
	inx
	clc
	phy
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	adc	#6
	cpy	#39
	pha
	lda	#1
	bcs	.LBB4_20
; %bb.19:                               ;   in Loop: Header=BB4_1 Depth=1
	lda	#0
.LBB4_20:                               ;   in Loop: Header=BB4_1 Depth=1
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc6
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tay
	pla
	cpx	#40
	beq	.LBB4_21
; %bb.55:                               ;   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_1
.LBB4_21:
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc30
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc31
; %bb.43:
	jmp	.LBB4_36
.LBB4_22:
	phy
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc30
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc31
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	lda	__rc2
	beq	.LBB4_23
; %bb.57:
	jmp	.LBB4_36
.LBB4_23:
	sty	__rc22
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	tax
	inx
	txa
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	bra	.LBB4_26
.LBB4_24:
	phy
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc30
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc31
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	lda	__rc2
	beq	.LBB4_25
; %bb.59:
	jmp	.LBB4_36
.LBB4_25:
	sty	__rc22
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	tax
	inx
	txa
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc26
	bne	.LBB4_27
.LBB4_26:
	stz	__rc26
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc24
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	clc
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	sta	__rc27
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	tay
	txa
	adc	__rc2
	sta	__rc2
	tya
	adc	__rc3
	tax
	clc
	lda	__rc2
	adc	#17
	sta	__rc20
	txa
	adc	#0
	sta	__rc21
	ldx	__rc22
	stx	__rc25
; %bb.45:
	jmp	.LBB4_35
.LBB4_27:
	lda	__rc27
	bne	.LBB4_29
; %bb.28:
	stz	__rc26
	ldx	__rc22
	stx	__rc25
	lda	__rc22
	clc
	adc	#248
	sta	__rc22
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc24
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	sta	__rc27
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	tay
	clc
	txa
	adc	__rc2
	sta	__rc2
	tya
	adc	__rc3
	tax
	clc
	lda	__rc2
	adc	#18
; %bb.47:
	jmp	.LBB4_34
.LBB4_29:
	ldy	__rc22
	stz	__rc26
	cpy	#24
	bcs	.LBB4_31
; %bb.30:
	clc
	tya
	adc	#240
	sta	__rc22
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc24
	sty	__rc25
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	sta	__rc27
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	tay
	clc
	txa
	adc	__rc2
	sta	__rc2
	tya
	adc	__rc3
	tax
	clc
	lda	__rc2
	adc	#19
; %bb.49:
	jmp	.LBB4_34
.LBB4_31:
	cpy	#32
	bcs	.LBB4_33
; %bb.32:
	tya
	clc
	adc	#232
	sta	__rc22
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc24
	sty	__rc25
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	sta	__rc27
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	tay
	clc
	txa
	adc	__rc2
	sta	__rc2
	tya
	adc	__rc3
	tax
	clc
	lda	__rc2
	adc	#20
	bra	.LBB4_34
.LBB4_33:
	clc
	tya
	adc	#224
	sta	__rc22
	ldx	#6
	stx	__rc2
	stz	__rc3
	ldx	#0
	lda	__rc24
	sty	__rc25
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	sta	__rc27
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	tay
	clc
	txa
	adc	__rc2
	sta	__rc2
	tya
	adc	__rc3
	tax
	clc
	lda	__rc2
	adc	#21
.LBB4_34:
	sta	__rc20
	txa
	adc	#0
	sta	__rc21
.LBB4_35:
	ldy	__rc22
	lda	#1
	ldx	#0
	sty	__rc2
	jsr	__ashlhi3
	eor	#255
	and	(__rc20)
	sta	(__rc20)
	ldx	#6
	stz	__rc3
	stx	__rc2
	ldx	#0
	lda	__rc24
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	clc
	lda	__rc27
	adc	__rc2
	sta	__rc2
	lda	__rc23
	adc	__rc3
	sta	__rc3
	ldy	#16
	lda	(__rc2),y
	dec
	sta	(__rc2),y
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	#40
	ldy	#1
	sty	__rc4
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	jsr	PutWholeSector
.LBB4_36:
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	(__rc28)
	lda	__rc25
	sta	(__rc30)
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
	adc	#25
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end4:
	.size	findnextBAMtracksector, .Lfunc_end4-findnextBAMtracksector
                                        ; -- End function
	.section	.text.getdirententry,"ax",@progbits
	.type	getdirententry,@function        ; -- Begin function getdirententry
getdirententry:                         ; @getdirententry
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
	sta	__rc23
	ldx	#0
	stx	__rc20
	ldx	#0
	stx	__rc21
	stz	__rc22
	stz	BAMsector
	ldx	#22
	stx	BAMsector+1
	stz	BAMsector+2
	inx
	stx	BAMsector+3
	stz	worksector
	inx
	stx	worksector+1
	stz	worksector+2
	ldy	#25
	sty	worksector+3
	stz	worksectorasBAM.0
	stx	worksectorasBAM.0+1
	stz	mos8(direntryblock.0)
	ldx	#26
	stx	mos8(direntryblock.0+1)
	stz	direntryblock.1
	inx
	stx	direntryblock.1+1
	stz	mos8(offsCurrIdx)
	stz	flagCurrSec
	;APP
	lda	#0
	sta	53376

	;NO_APP
	ldy	mos8(direntryblock.0)
	ldx	mos8(direntryblock.0+1)
	sty	__rc24
	sty	__rc6
	stx	__rc25
	lda	#0
	stz	__rc4
	ldy	#8
	pha
	tya
	ldy	#6
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stz	__rc29
.LBB5_1:                                ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	sta	__rc28
	sta	__rc10
	ror	__rc10
	lda	#0
	ror
	lsr	__rc4
	ror	__rc10
	ror
	lsr	__rc4
	ror	__rc10
	ror
	stz	__rc2
	ldy	#8
	sty	__rc3
	ldy	__rc6
	sty	__rc26
	ldy	__rc6
	sty	__rc4
	stx	__rc27
	stx	__rc5
	stz	__rc6
	stz	__rc7
	ldx	#32
	stx	__rc8
	stz	__rc9
	ldx	__rc10
	jsr	lcopy
	ldx	6659
	bne	.LBB5_2
; %bb.14:
	jmp	.LBB5_11
.LBB5_2:                                ;   in Loop: Header=BB5_1 Depth=1
	ldx	6656
	beq	.LBB5_4
; %bb.3:                                ;   in Loop: Header=BB5_1 Depth=1
	clc
	ldy	#6
	lda	(__rc0),y                       ; 1-byte Folded Reload
	adc	#8
	sta	__rc2
	lda	__rc29
	adc	#0
	sta	__rc3
	bra	.LBB5_5
.LBB5_4:                                ;   in Loop: Header=BB5_1 Depth=1
	ldy	#6
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	ldx	__rc29
	stx	__rc3
.LBB5_5:                                ;   in Loop: Header=BB5_1 Depth=1
	ldx	__rc26
	stx	__rc6
	lda	__rc28
	cmp	__rc23
	beq	.LBB5_10
; %bb.6:                                ;   in Loop: Header=BB5_1 Depth=1
	inc
	ldx	#0
	cpx	__rc3
	bne	.LBB5_8
; %bb.7:                                ;   in Loop: Header=BB5_1 Depth=1
	cmp	__rc2
	bcs	.LBB5_11
	bra	.LBB5_9
.LBB5_8:                                ;   in Loop: Header=BB5_1 Depth=1
	cpx	__rc3
	bcs	.LBB5_11
.LBB5_9:                                ;   in Loop: Header=BB5_1 Depth=1
	pha
	lda	__rc2
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldx	__rc3
	stx	__rc29
	ldx	__rc27
	stz	__rc4
; %bb.12:                               ;   in Loop: Header=BB5_1 Depth=1
	jmp	.LBB5_1
.LBB5_10:
	ldx	__rc24
	stx	__rc20
	ldx	__rc25
	stx	__rc21
.LBB5_11:
	ldx	__rc20
	stx	__rc2
	ldx	__rc21
	stx	__rc3
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
	adc	#7
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	rts
.Lfunc_end5:
	.size	getdirententry, .Lfunc_end5-getdirententry
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
	stz	__rc2
	stz	BAMsector
	ldy	#22
	sty	BAMsector+1
	stz	BAMsector+2
	iny
	sty	BAMsector+3
	stz	worksector
	iny
	sty	worksector+1
	stz	worksector+2
	lda	#25
	sta	worksector+3
	stz	worksectorasBAM.0
	sty	worksectorasBAM.0+1
	stz	mos8(direntryblock.0)
	ldy	#26
	sty	mos8(direntryblock.0+1)
	stz	direntryblock.1
	iny
	sty	direntryblock.1+1
	stz	mos8(offsCurrIdx)
	stz	flagCurrSec
	;APP
	lda	#0
	sta	53376

	;NO_APP
	ldy	#40
	ldx	#3
	lda	#8
	sta	__rc3
	lda	#14
	sta	__rc4
	sty	__rc5
	stx	__rc6
	ldx	#0
	txa
	jsr	readblockchain
	lda	#112
	ldx	#0
	stx	__rc20
	ldx	#0
	stx	__rc21
.LBB6_1:                                ; =>This Inner Loop Header: Depth=1
	sta	__rc22
	jsr	getdirententry
	ldx	__rc3
	cpx	__rc21
	bne	.LBB6_5
; %bb.2:                                ;   in Loop: Header=BB6_1 Depth=1
	ldx	__rc2
	cpx	__rc20
	bne	.LBB6_5
; %bb.3:                                ;   in Loop: Header=BB6_1 Depth=1
	lda	__rc22
	dec
	bne	.LBB6_1
; %bb.4:
	lda	#0
	bra	.LBB6_6
.LBB6_5:
	lda	__rc22
.LBB6_6:
	plx
	stx	__rc22
	plx
	stx	__rc21
	plx
	stx	__rc20
	rts
.Lfunc_end6:
	.size	getdirent, .Lfunc_end6-getdirent
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
	bne	.LBB7_2
; %bb.1:
	inc
.LBB7_2:
	cmp	#0
	bne	.LBB7_5
; %bb.3:
	cpy	__rc4
	bcs	.LBB7_6
.LBB7_4:
	inx
; %bb.10:
	jmp	.LBB7_9
.LBB7_5:
	cmp	#0
	bcc	.LBB7_4
.LBB7_6:
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
	bcs	.LBB7_8
; %bb.7:
	ldx	#0
.LBB7_8:
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
.LBB7_9:
	stz	mos8(g_curX)
	stx	mos8(g_curY)
	rts
.Lfunc_end7:
	.size	cputln, .Lfunc_end7-cputln
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
	bra	.LBB8_8
.LBB8_1:                                ;   in Loop: Header=BB8_8 Depth=1
	cmp	#96
	bcc	.LBB8_3
; %bb.2:                                ;   in Loop: Header=BB8_8 Depth=1
	clc
	adc	#160
	bra	.LBB8_5
.LBB8_3:                                ;   in Loop: Header=BB8_8 Depth=1
	clc
	tay
	adc	#165
	tax
	tya
	cpx	#5
	bcs	.LBB8_5
; %bb.4:                                ;   in Loop: Header=BB8_8 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB8_5:                                ;   in Loop: Header=BB8_8 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB8_7
; %bb.6:                                ;   in Loop: Header=BB8_8 Depth=1
	inc	__rc7
.LBB8_7:                                ;   in Loop: Header=BB8_8 Depth=1
	tax
	beq	.LBB8_12
.LBB8_8:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB8_10
; %bb.9:                                ;   in Loop: Header=BB8_8 Depth=1
	inc	__rc5
.LBB8_10:                               ;   in Loop: Header=BB8_8 Depth=1
	cmp	#192
	bcc	.LBB8_1
; %bb.11:                               ;   in Loop: Header=BB8_8 Depth=1
	eor	#128
	bra	.LBB8_5
.LBB8_12:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end8:
	.size	msprintf, .Lfunc_end8-msprintf
                                        ; -- End function
	.section	.text.mprintf,"ax",@progbits
	.type	mprintf,@function               ; -- Begin function mprintf
mprintf:                                ; @mprintf
; %bb.0:
	sta	mos8(.Lmprintf_zp_stk+1)
	stx	__rc8
	ldy	__rc2
	ldx	__rc3
	stx	mos8(.Lmprintf_zp_stk+3)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
	ldx	#mos16lo(.L.str.4.32)
	stx	__rc4
	ldx	#mos16hi(.L.str.4.32)
	stx	__rc5
	ldx	#52
	stx	__rc6
	ldx	#3
	stx	__rc7
	bra	.LBB9_8
.LBB9_1:                                ;   in Loop: Header=BB9_8 Depth=1
	cmp	#96
	bcc	.LBB9_3
; %bb.2:                                ;   in Loop: Header=BB9_8 Depth=1
	clc
	adc	#160
	bra	.LBB9_5
.LBB9_3:                                ;   in Loop: Header=BB9_8 Depth=1
	clc
	sta	__rc9
	adc	#165
	tax
	lda	__rc9
	cpx	#5
	bcs	.LBB9_5
; %bb.4:                                ;   in Loop: Header=BB9_8 Depth=1
	lda	mos8(.Lswitch.table.asciitoscreencode_s),x
.LBB9_5:                                ;   in Loop: Header=BB9_8 Depth=1
	sta	(__rc6)
	inc	__rc6
	bne	.LBB9_7
; %bb.6:                                ;   in Loop: Header=BB9_8 Depth=1
	inc	__rc7
.LBB9_7:                                ;   in Loop: Header=BB9_8 Depth=1
	tax
	beq	.LBB9_12
.LBB9_8:                                ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	inc	__rc4
	bne	.LBB9_10
; %bb.9:                                ;   in Loop: Header=BB9_8 Depth=1
	inc	__rc5
.LBB9_10:                               ;   in Loop: Header=BB9_8 Depth=1
	cmp	#192
	bcc	.LBB9_1
; %bb.11:                               ;   in Loop: Header=BB9_8 Depth=1
	eor	#128
	bra	.LBB9_5
.LBB9_12:
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
.LBB9_13:                               ; =>This Inner Loop Header: Depth=1
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
	lda	hexDigits,y
	ldy	mos8(.Lmprintf_zp_stk+20)       ; 1-byte Folded Reload
	sty	__rc4
	dec	__rc4
	sta	mos8(.Lmprintf_zp_stk+5),y
	lda	mos8(.Lmprintf_zp_stk+3)
	bne	.LBB9_17
; %bb.14:                               ;   in Loop: Header=BB9_13 Depth=1
	lda	mos8(.Lmprintf_zp_stk+4)
	bne	.LBB9_18
; %bb.15:                               ;   in Loop: Header=BB9_13 Depth=1
	ldy	mos8(.Lmprintf_zp_stk+2)
	bne	.LBB9_21
; %bb.16:                               ;   in Loop: Header=BB9_13 Depth=1
	ldy	mos8(.Lmprintf_zp_stk+1)
	cpy	#10
	bra	.LBB9_20
.LBB9_17:                               ;   in Loop: Header=BB9_13 Depth=1
	ldx	mos8(.Lmprintf_zp_stk+3)
	bra	.LBB9_19
.LBB9_18:                               ;   in Loop: Header=BB9_13 Depth=1
	ldx	mos8(.Lmprintf_zp_stk+4)
.LBB9_19:                               ;   in Loop: Header=BB9_13 Depth=1
	cpx	#0
.LBB9_20:                               ;   in Loop: Header=BB9_13 Depth=1
	ldx	__rc7
	stx	mos8(.Lmprintf_zp_stk+1)
	ldx	__rc5
	ldy	__rc4
	sty	mos8(.Lmprintf_zp_stk+20)       ; 1-byte Folded Spill
	bcc	.LBB9_22
; %bb.25:                               ;   in Loop: Header=BB9_13 Depth=1
	jmp	.LBB9_13
.LBB9_21:                               ;   in Loop: Header=BB9_13 Depth=1
	cpy	#0
	bra	.LBB9_20
.LBB9_22:
	lda	#mos8(.Lmprintf_zp_stk+5)
	clc
	adc	__rc4
	sta	__rc2
	lda	#mos8(0)
	adc	#0
	sta	__rc3
	inc	__rc2
	bne	.LBB9_24
; %bb.23:
	inc	__rc3
.LBB9_24:
	lda	mos8(g_curX)
	ldx	mos8(g_curY)
	jmp	cputsxy
.Lfunc_end9:
	.size	mprintf, .Lfunc_end9-mprintf
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
	sta	__rc24
	stx	__rc22
	ldx	__rc2
	ldy	__rc3
	lda	#240
	and	mos8(g_curTextColor)
	ora	#3
	sta	mos8(g_curTextColor)
	sec
	stx	__rc23
	txa
	sbc	__rc24
	sta	__rc26
	sty	__rc27
	cpy	__rc22
	bcs	.LBB10_1
; %bb.16:
	jmp	.LBB10_3
.LBB10_1:
	stz	__rc20
	ldx	__rc22
	stx	__rc21
.LBB10_2:                               ; =>This Inner Loop Header: Depth=1
	lda	mos8(g_curScreenW)
	ldx	__rc21
	stx	__rc2
	stz	__rc3
	ldx	#0
	jsr	__mulhi3
	clc
	adc	__rc24
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
	bcc	.LBB10_3
; %bb.18:                               ;   in Loop: Header=BB10_2 Depth=1
	jmp	.LBB10_2
.LBB10_3:
	ldx	#112
	stx	__rc2
	ldx	__rc22
	lda	__rc24
	jsr	cputcxy
	ldx	#109
	stx	__rc2
	ldx	__rc27
	lda	__rc24
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
	ldx	__rc27
	lda	__rc23
	jsr	cputcxy
	ldx	__rc24
	stx	__rc25
	ldy	__rc24
	iny
.LBB10_4:                               ; =>This Inner Loop Header: Depth=1
	ldx	#64
	stx	__rc2
	ldx	__rc22
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
	cpy	__rc20
	bne	.LBB10_4
; %bb.5:
	ldx	__rc22
	stx	__rc21
	inc	__rc21
	ldx	__rc21
	ldy	__rc24
	sty	__rc22
.LBB10_6:                               ; =>This Inner Loop Header: Depth=1
	ldy	#93
	sty	__rc2
	stx	__rc24
	lda	__rc22
	jsr	cputcxy
	ldx	#93
	stx	__rc2
	ldx	__rc24
	lda	__rc23
	jsr	cputcxy
	ldx	__rc24
	inx
	cpx	__rc27
	bne	.LBB10_6
; %bb.7:
	lda	__rc27
	cmp	mos8(g_curScreenH)
	bcc	.LBB10_8
; %bb.20:
	jmp	.LBB10_15
.LBB10_8:
	ldx	mos8(g_curScreenW)
	stx	__rc2
	ldx	__rc23
	cpx	__rc2
	bcc	.LBB10_9
; %bb.22:
	jmp	.LBB10_15
.LBB10_9:
	stz	__rc3
	stz	__rc20
	tax
	ldy	#0
	inx
	bne	.LBB10_11
; %bb.10:
	iny
.LBB10_11:
	txa
	sty	__rc27
	ldx	__rc27
	sta	__rc24
	jsr	__mulhi3
	sta	__rc2
	stx	__rc3
	clc
	lda	__rc25
	adc	#1
	tax
	lda	#0
	adc	#0
	sta	__rc4
	lda	#0
	adc	#248
	sta	__rc5
	lda	#0
	adc	#15
	sta	__rc6
	clc
	txa
	adc	__rc2
	tay
	lda	__rc4
	adc	__rc3
	sta	__rc7
	lda	__rc5
	adc	#0
	sta	__rc2
	lda	__rc6
	adc	#0
	ldx	#11
	sta	__rc3
	lda	__rc26
	sta	__rc5
	stx	__rc4
	stz	__rc6
	ldx	__rc7
	tya
	jsr	lfill
	ldx	__rc23
	stx	__rc22
	inc	__rc22
.LBB10_12:                              ; =>This Inner Loop Header: Depth=1
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
	ldy	__rc27
	bne	.LBB10_14
; %bb.13:                               ;   in Loop: Header=BB10_12 Depth=1
	ldx	__rc24
	cpx	__rc21
	bcs	.LBB10_12
	bra	.LBB10_15
.LBB10_14:                              ;   in Loop: Header=BB10_12 Depth=1
	cpy	#0
	bcs	.LBB10_12
.LBB10_15:
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
.Lfunc_end10:
	.size	mcbox, .Lfunc_end10-mcbox
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
	lda	#4
	ldy	#70
	ldx	#9
	sty	__rc2
	stx	__rc3
	tax
	lda	#10
	jsr	mcbox
	ldx	#12
	stx	mos8(g_curX)
	ldx	#5
	stx	mos8(g_curY)
	ldx	#52
	stx	__rc2
	ldx	#3
	stx	__rc3
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
	sta	(__rc2)
	inc	__rc2
	bne	.LBB11_7
; %bb.6:                                ;   in Loop: Header=BB11_8 Depth=1
	inc	__rc3
.LBB11_7:                               ;   in Loop: Header=BB11_8 Depth=1
	tax
	beq	.LBB11_12
.LBB11_8:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc22)
	inc	__rc22
	bne	.LBB11_10
; %bb.9:                                ;   in Loop: Header=BB11_8 Depth=1
	inc	__rc23
.LBB11_10:                              ;   in Loop: Header=BB11_8 Depth=1
	cmp	#192
	bcc	.LBB11_1
; %bb.11:                               ;   in Loop: Header=BB11_8 Depth=1
	eor	#128
	bra	.LBB11_5
.LBB11_12:
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
.Lfunc_end11:
	.size	messagebox, .Lfunc_end11-messagebox
                                        ; -- End function
	.section	.text.escNOP,"ax",@progbits
	.type	escNOP,@function                ; -- Begin function escNOP
escNOP:                                 ; @escNOP
; %bb.0:
	rts
.Lfunc_end12:
	.size	escNOP, .Lfunc_end12-escNOP
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
.Lfunc_end13:
	.size	clrscr, .Lfunc_end13-clrscr
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
	bne	.LBB14_2
; %bb.1:
	dec	__rc20
.LBB14_2:
	lda	__rc20
	bne	.LBB14_5
; %bb.3:
	ldy	__rc23
	cpx	__rc22
	bne	.LBB14_6
; %bb.4:
	ldx	#0
	iny
	bra	.LBB14_7
.LBB14_5:
	ldy	__rc23
.LBB14_6:
	ldx	__rc22
	inx
.LBB14_7:
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
.Lfunc_end14:
	.size	cputcxy, .Lfunc_end14-cputcxy
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
.Lfunc_end15:
	.size	cputsxy, .Lfunc_end15-cputsxy
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
	bcs	.LBB16_2
; %bb.1:
	clv
.LBB16_2:
	ror	__rc3
	ldy	__rc2
	sty	__rc12
	ror	__rc12
	lsr	__rc8
	ror
	ldy	#1
	bcs	.LBB16_4
; %bb.3:
	ldy	#0
.LBB16_4:
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	phy
	ldy	#1
	bcs	.LBB16_6
; %bb.5:
	ldy	#0
.LBB16_6:
	sty	__rc13
	ply
	ror	__rc3
	ror	__rc12
	lsr	__rc8
	ror
	lda	#1
	bcs	.LBB16_8
; %bb.7:
	lda	#0
.LBB16_8:
	sta	__rc8
	ror	__rc3
	lda	__rc12
	ror
	sta	__rc3
	sec
	bvs	.LBB16_10
; %bb.9:
	clc
.LBB16_10:
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
.Lfunc_end16:
	.size	lcopy, .Lfunc_end16-lcopy
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
.Lfunc_end17:
	.size	lfill, .Lfunc_end17-lfill
                                        ; -- End function
	.section	.text.sprintf,"ax",@progbits
	.type	sprintf,@function               ; -- Begin function sprintf
sprintf:                                ; @sprintf
; %bb.0:
	clc
	lda	__rc0
	adc	#216
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
	ldy	#15
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
	ldx	#mos16lo(_out_buffer)
	stx	__rc24
	ldx	#mos16hi(_out_buffer)
	stx	__rc25
	clc
	lda	__rc0
	adc	#30
	sta	__rc4
	lda	__rc1
	adc	#0
	sta	__rc5
	clc
	lda	__rc0
	adc	#40
	sta	(__rc4)
	lda	__rc1
	adc	#0
	ldy	#1
	sta	(__rc4),y
	lda	(__rc4)
	sta	__rc9
	ldx	#0
	stx	__rc6
	ldx	#0
	stx	__rc7
	ldx	__rc3
	lda	(__rc4),y
	cpx	__rc7
	bne	.LBB18_3
; %bb.1:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB18_3
; %bb.2:
	ldx	#mos16lo(_out_null)
	stx	__rc24
	ldx	#mos16hi(_out_null)
	stx	__rc25
.LBB18_3:
                                        ; kill: def $rs1 killed $rs1
	phy
	pha
	lda	__rc2
	ldy	#28
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc3
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldx	__rc9
	stx	__rc4
	stz	__rc27
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	lda	__rc4
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	ldx	#mos16lo(.L.str.1.29)
	stx	__rc30
	ldx	#mos16hi(.L.str.1.29)
	stx	__rc31
	lda	#0
	stz	__rc20
.LBB18_4:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB18_8 Depth 2
                                        ;     Child Loop BB18_21 Depth 2
                                        ;     Child Loop BB18_51 Depth 2
                                        ;     Child Loop BB18_27 Depth 2
                                        ;     Child Loop BB18_32 Depth 2
                                        ;     Child Loop BB18_192 Depth 2
                                        ;     Child Loop BB18_64 Depth 2
                                        ;     Child Loop BB18_232 Depth 2
                                        ;     Child Loop BB18_42 Depth 2
                                        ;     Child Loop BB18_249 Depth 2
	ldx	__rc30
	stx	__rc28
	ldx	__rc31
	stx	__rc29
	bra	.LBB18_8
.LBB18_5:                               ;   in Loop: Header=BB18_8 Depth=2
	ldx	__rc24
	stx	__rc18
	ldx	__rc25
	stx	__rc19
	pha
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	ldx	__rc26
	stx	__rc4
	ldx	#255
	stx	__rc5
	stx	__rc6
	ldx	__rc22
	jsr	__call_indir
	ldy	#1
	inc	__rc30
	bne	.LBB18_7
; %bb.6:                                ;   in Loop: Header=BB18_8 Depth=2
	inc	__rc31
.LBB18_7:                               ;   in Loop: Header=BB18_8 Depth=2
	lda	__rc21
.LBB18_8:                               ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sta	__rc22
	ldx	__rc20
	stx	__rc26
	inc
	bne	.LBB18_10
; %bb.9:                                ;   in Loop: Header=BB18_8 Depth=2
	inc	__rc20
.LBB18_10:                              ;   in Loop: Header=BB18_8 Depth=2
	sta	__rc21
	inc	__rc28
	bne	.LBB18_12
; %bb.11:                               ;   in Loop: Header=BB18_8 Depth=2
	inc	__rc29
.LBB18_12:                              ;   in Loop: Header=BB18_8 Depth=2
	lda	(__rc30)
	bne	.LBB18_13
; %bb.373:
	jmp	.LBB18_121
.LBB18_13:                              ;   in Loop: Header=BB18_8 Depth=2
	cmp	#37
	bne	.LBB18_5
; %bb.14:                               ;   in Loop: Header=BB18_4 Depth=1
	stz	__rc2
	lda	#0
	phy
	ldy	#26
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	stz	__rc4
	bra	.LBB18_21
.LBB18_15:                              ;   in Loop: Header=BB18_21 Depth=2
	ldx	#8
	bra	.LBB18_18
.LBB18_16:                              ;   in Loop: Header=BB18_21 Depth=2
	ldx	#16
	bra	.LBB18_18
.LBB18_17:                              ;   in Loop: Header=BB18_21 Depth=2
	ldx	#4
.LBB18_18:                              ;   in Loop: Header=BB18_21 Depth=2
	stx	__rc2
.LBB18_19:                              ;   in Loop: Header=BB18_21 Depth=2
	lda	__rc4
	ora	__rc2
	sta	__rc4
	inc	__rc28
	bne	.LBB18_21
; %bb.20:                               ;   in Loop: Header=BB18_21 Depth=2
	inc	__rc29
.LBB18_21:                              ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc28)
	cmp	#32
	beq	.LBB18_15
; %bb.22:                               ;   in Loop: Header=BB18_21 Depth=2
	cmp	#35
	beq	.LBB18_16
; %bb.23:                               ;   in Loop: Header=BB18_21 Depth=2
	cmp	#43
	beq	.LBB18_17
; %bb.24:                               ;   in Loop: Header=BB18_21 Depth=2
	ldx	#1
	stx	__rc2
	ldx	#10
	cmp	#48
	beq	.LBB18_19
; %bb.25:                               ;   in Loop: Header=BB18_21 Depth=2
	cmp	#45
	beq	.LBB18_26
; %bb.375:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_48
.LBB18_26:                              ;   in Loop: Header=BB18_21 Depth=2
	ldx	#2
	bra	.LBB18_18
.LBB18_27:                              ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	#10
	stx	__rc2
	stz	__rc3
	ldx	__rc15
	lda	__rc14
	jsr	__mulhi3
	ldy	#1
	clc
	adc	#208
	sta	__rc2
	txa
	adc	#255
	tax
	clc
	lda	__rc2
	adc	__rc28
	sta	__rc14
	txa
	adc	__rc27
	sta	__rc15
	lda	(__rc30),y
	tax
	clc
	adc	#208
	cmp	#10
	ldy	#1
	bcs	.LBB18_29
; %bb.28:                               ;   in Loop: Header=BB18_27 Depth=2
	ldy	#0
.LBB18_29:                              ;   in Loop: Header=BB18_27 Depth=2
	sty	__rc2
	inc	__rc30
	bne	.LBB18_31
; %bb.30:                               ;   in Loop: Header=BB18_27 Depth=2
	inc	__rc31
.LBB18_31:                              ;   in Loop: Header=BB18_27 Depth=2
	stx	__rc28
	stz	__rc27
	lda	__rc2
	beq	.LBB18_27
; %bb.257:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_150
.LBB18_32:                              ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	__rc6
	dec	__rc6
	cpx	#0
	bne	.LBB18_34
; %bb.33:                               ;   in Loop: Header=BB18_32 Depth=2
	dec	__rc7
.LBB18_34:                              ;   in Loop: Header=BB18_32 Depth=2
	inc	__rc2
	bne	.LBB18_36
; %bb.35:                               ;   in Loop: Header=BB18_32 Depth=2
	inc	__rc3
.LBB18_36:                              ;   in Loop: Header=BB18_32 Depth=2
	ldx	#0
	lda	__rc7
	bne	.LBB18_39
; %bb.37:                               ;   in Loop: Header=BB18_32 Depth=2
	ldx	#1
	lda	__rc6
	beq	.LBB18_39
; %bb.38:                               ;   in Loop: Header=BB18_32 Depth=2
	ldx	#0
.LBB18_39:                              ;   in Loop: Header=BB18_32 Depth=2
	ldy	#1
	lda	(__rc4),y
	bne	.LBB18_41
; %bb.40:                               ;   in Loop: Header=BB18_32 Depth=2
	ldx	#1
.LBB18_41:                              ;   in Loop: Header=BB18_32 Depth=2
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc13
	txa
	beq	.LBB18_32
; %bb.259:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_164
.LBB18_42:                              ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	__rc20
	stx	__rc4
	ldx	__rc24
	stx	__rc7
	inc	__rc24
	bne	.LBB18_44
; %bb.43:                               ;   in Loop: Header=BB18_42 Depth=2
	inc	__rc20
.LBB18_44:                              ;   in Loop: Header=BB18_42 Depth=2
	ldx	__rc22
	stx	__rc18
	ldx	__rc23
	stx	__rc19
	ldx	__rc28
	stx	__rc2
	ldx	__rc29
	stx	__rc3
	ldx	#255
	stx	__rc5
	stx	__rc6
	ldx	__rc7
	sty	__rc25
	sta	__rc26
	lda	#32
	jsr	__call_indir
	lda	__rc26
	ldy	__rc25
	phy
	plx
	dey
	cpx	#0
	bne	.LBB18_46
; %bb.45:                               ;   in Loop: Header=BB18_42 Depth=2
	dec
.LBB18_46:                              ;   in Loop: Header=BB18_42 Depth=2
	tax
	bne	.LBB18_42
; %bb.47:                               ;   in Loop: Header=BB18_42 Depth=2
	cpy	#0
	bne	.LBB18_42
; %bb.261:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_240
.LBB18_48:                              ;   in Loop: Header=BB18_4 Depth=1
                                        ; kill: def $rs12 killed $rs12
	pha
	phy
	lda	__rc24
	ldy	#21
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc25
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	pla
	phy
	ldy	__rc4
	sty	__rc24
	ply
	cmp	#48
	bcs	.LBB18_49
; %bb.377:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_68
.LBB18_49:                              ;   in Loop: Header=BB18_4 Depth=1
	cmp	#58
	bcc	.LBB18_50
; %bb.379:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_72
.LBB18_50:                              ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc27
	stz	__rc6
	stz	__rc30
	stz	__rc2
	lda	#0
	ldy	#26
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc4
	stz	__rc31
.LBB18_51:                              ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stx	__rc2
	stz	__rc3
	ldx	__rc4
	lda	__rc6
	jsr	__mulhi3
	ldy	#1
	stx	__rc3
	ldx	#10
	clc
	adc	#208
	sta	__rc2
	lda	__rc3
	adc	#255
	sta	__rc3
	clc
	lda	__rc2
	adc	__rc27
	sta	__rc6
	lda	__rc3
	adc	__rc30
	sta	__rc4
	lda	(__rc28),y
	sta	__rc2
	clc
	adc	#208
	cmp	#10
	tya
	bcs	.LBB18_53
; %bb.52:                               ;   in Loop: Header=BB18_51 Depth=2
	lda	#0
.LBB18_53:                              ;   in Loop: Header=BB18_51 Depth=2
	sta	__rc3
	lda	__rc2
	inc	__rc28
	bne	.LBB18_55
; %bb.54:                               ;   in Loop: Header=BB18_51 Depth=2
	inc	__rc29
.LBB18_55:                              ;   in Loop: Header=BB18_51 Depth=2
	sta	__rc27
	stz	__rc30
	inc	__rc3
	dec	__rc3
	beq	.LBB18_51
; %bb.56:                               ;   in Loop: Header=BB18_4 Depth=1
	pha
	lda	__rc4
	phy
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	pla
	stz	__rc27
; %bb.263:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_75
.LBB18_57:                              ;   in Loop: Header=BB18_64 Depth=2
	ldx	__rc14
	stx	__rc27
	ldx	__rc15
	stx	__rc24
	ldx	__rc27
	dec	__rc27
	cpx	#0
	bne	.LBB18_59
; %bb.58:                               ;   in Loop: Header=BB18_64 Depth=2
	dec	__rc24
.LBB18_59:                              ;   in Loop: Header=BB18_64 Depth=2
	lda	__rc15
	bne	.LBB18_61
; %bb.60:                               ;   in Loop: Header=BB18_64 Depth=2
	lda	__rc14
	bne	.LBB18_61
; %bb.381:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_222
.LBB18_61:                              ;   in Loop: Header=BB18_64 Depth=2
	ldx	__rc22
	stx	__rc25
	ldx	__rc26
	stx	__rc20
	inc	__rc25
	bne	.LBB18_63
; %bb.62:                               ;   in Loop: Header=BB18_64 Depth=2
	inc	__rc20
.LBB18_63:                              ;   in Loop: Header=BB18_64 Depth=2
	ldy	__rc22
	ldx	__rc18
	stx	__rc22
	ldx	__rc19
	stx	__rc23
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc18
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc19
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc3
	ldx	__rc26
	stx	__rc4
	ldx	#255
	stx	__rc5
	stx	__rc6
	phy
	plx
	lda	__rc12
	jsr	__call_indir
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc13
	ldy	#1
	lda	(__rc22),y
	ldx	__rc28
	stx	__rc18
	ldx	__rc29
	stx	__rc19
	ldx	__rc27
	stx	__rc14
	ldx	__rc24
	stx	__rc15
	ldx	__rc25
	stx	__rc22
	ldx	__rc20
	stx	__rc26
	sta	__rc12
	tax
	bne	.LBB18_64
; %bb.383:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_223
.LBB18_64:                              ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	inc	__rc28
	bne	.LBB18_66
; %bb.65:                               ;   in Loop: Header=BB18_64 Depth=2
	inc	__rc29
.LBB18_66:                              ;   in Loop: Header=BB18_64 Depth=2
	phy
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	lda	__rc2
	beq	.LBB18_67
; %bb.385:                              ;   in Loop: Header=BB18_64 Depth=2
	jmp	.LBB18_57
.LBB18_67:                              ;   in Loop: Header=BB18_64 Depth=2
	ldx	__rc14
	stx	__rc27
	ldx	__rc15
	stx	__rc24
; %bb.265:                              ;   in Loop: Header=BB18_64 Depth=2
	jmp	.LBB18_61
.LBB18_68:                              ;   in Loop: Header=BB18_4 Depth=1
	stz	__rc6
	cmp	#42
	beq	.LBB18_69
; %bb.387:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_73
.LBB18_69:                              ;   in Loop: Header=BB18_4 Depth=1
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc5
	lda	(__rc4)
	sta	__rc3
	lda	(__rc4),y
	sta	__rc2
	lda	__rc4
	clc
	adc	#2
	tax
	lda	__rc5
	adc	#0
	sta	__rc7
	lda	__rc2
	bpl	.LBB18_70
; %bb.389:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_151
.LBB18_70:                              ;   in Loop: Header=BB18_4 Depth=1
	stx	__rc6
                                        ; kill: def $rs3 killed $rs3
	phy
	lda	__rc6
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc7
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	lda	(__rc28),y
	inc	__rc28
	bne	.LBB18_71
; %bb.391:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_135
.LBB18_71:                              ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc3
	stx	__rc6
	bra	.LBB18_74
.LBB18_72:                              ;   in Loop: Header=BB18_4 Depth=1
	stz	__rc2
	pha
	lda	#0
	ldy	#25
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#20
	bra	.LBB18_81
.LBB18_73:                              ;   in Loop: Header=BB18_4 Depth=1
	stz	__rc2
.LBB18_74:                              ;   in Loop: Header=BB18_4 Depth=1
	pha
	lda	__rc2
	phy
	ldy	#20
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	pla
.LBB18_75:                              ;   in Loop: Header=BB18_4 Depth=1
	cmp	#46
	bne	.LBB18_80
; %bb.76:                               ;   in Loop: Header=BB18_4 Depth=1
	lda	#0
	ora	#4
	phy
	ldy	#26
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	ldx	__rc28
	stx	__rc30
	ldx	__rc29
	stx	__rc31
	inc	__rc30
	bne	.LBB18_78
; %bb.77:                               ;   in Loop: Header=BB18_4 Depth=1
	inc	__rc31
.LBB18_78:                              ;   in Loop: Header=BB18_4 Depth=1
	lda	(__rc28),y
	cmp	#48
	bcs	.LBB18_79
; %bb.393:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_88
.LBB18_79:                              ;   in Loop: Header=BB18_4 Depth=1
	cmp	#58
	bcc	.LBB18_267
; %bb.395:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_89
.LBB18_267:                             ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_152
.LBB18_80:                              ;   in Loop: Header=BB18_4 Depth=1
	pha
	lda	__rc6
	ldy	#25
.LBB18_81:                              ;   in Loop: Header=BB18_4 Depth=1
	sta	(__rc0),y                       ; 2-byte Folded Spill
	pla
	ldx	__rc28
	stx	__rc30
	ldx	__rc29
	stx	__rc31
; %bb.269:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_90
.LBB18_82:                              ;   in Loop: Header=BB18_4 Depth=1
	stx	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	ldx	__rc26
	lda	__rc22
	jsr	_ntoa
	ldy	#1
	stx	__rc20
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
.LBB18_83:                              ;   in Loop: Header=BB18_4 Depth=1
	pla
; %bb.271:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_119
.LBB18_84:                              ;   in Loop: Header=BB18_4 Depth=1
	clc
	lda	__rc0
	adc	#32
	sta	__rc6
	lda	__rc1
	adc	#0
	sta	__rc7
	lda	__rc3
	sta	(__rc6)
	ldy	#1
	lda	__rc4
	sta	(__rc6),y
	iny
	lda	__rc5
	sta	(__rc6),y
	iny
	txa
	sta	(__rc6),y
	iny
	lda	__rc12
	sta	(__rc6),y
	iny
	lda	__rc8
	sta	(__rc6),y
	iny
	lda	__rc9
	sta	(__rc6),y
	iny
	lda	__rc19
	sta	(__rc6),y
	ldy	#1
	lda	__rc10
	clc
	adc	#8
	sta	__rc4
	lda	__rc11
	adc	#0
	stz	__rc12
	ldx	#1
	inc	__rc2
	dec	__rc2
	bmi	.LBB18_85
; %bb.397:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_138
.LBB18_85:                              ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	phy
	lda	__rc4
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	(__rc0)
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc0),y
	lda	__rc13
	ldy	#2
	sta	(__rc0),y
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	#3
	sta	(__rc0),y
	ldy	__rc24
	sty	__rc2
	ldy	__rc25
	sty	__rc3
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	ldy	#8
.LBB18_86:                              ;   in Loop: Header=BB18_4 Depth=1
	sty	__rc8
	stx	__rc9
	ldx	__rc18
	stx	__rc10
	stz	__rc11
	stz	__rc13
	ldx	__rc26
	lda	__rc22
	jsr	_ntoa
	stx	__rc20
.LBB18_87:                              ;   in Loop: Header=BB18_4 Depth=1
	ldy	#1
; %bb.273:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_119
.LBB18_88:                              ;   in Loop: Header=BB18_4 Depth=1
	cmp	#42
	bne	.LBB18_89
; %bb.399:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_153
.LBB18_89:                              ;   in Loop: Header=BB18_4 Depth=1
	pha
	lda	__rc6
	ldy	#25
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
.LBB18_90:                              ;   in Loop: Header=BB18_4 Depth=1
	stz	__rc14
	stz	__rc15
.LBB18_91:                              ;   in Loop: Header=BB18_4 Depth=1
	clc
	tay
	adc	#152
	tax
	sty	__rc8
	tya
	lsr
	lda	#0
	ror
	sta	__rc2
	txa
	lsr
	ora	__rc2
	cmp	#10
	bcc	.LBB18_92
; %bb.401:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_166
.LBB18_92:                              ;   in Loop: Header=BB18_4 Depth=1
	tax
	ldy	.LJTI18_0,x
	sty	__rc4
	lda	.LJTI18_0+10,x
	tax
	stx	__rc5
	ldx	#2
	stx	__rc2
	ldy	#1
	stz	__rc3
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc10
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc11
	ldx	__rc24
	stx	__rc12
	lda	__rc8
	jmp	(__rc4)
.LBB18_93:                              ;   in Loop: Header=BB18_4 Depth=1
	tya
	clc
	adc	__rc30
	sta	__rc4
	lda	__rc31
	adc	__rc27
	sta	__rc5
	lda	__rc24
	ora	__rc3
	sta	__rc12
	phy
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ora	__rc2
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	lda	(__rc30),y
.LBB18_94:                              ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc4
	stx	__rc30
	ldx	__rc5
.LBB18_95:                              ;   in Loop: Header=BB18_4 Depth=1
	stx	__rc31
.LBB18_96:                              ;   in Loop: Header=BB18_4 Depth=1
	tay
	sec
	sbc	#98
	tax
	cmp	#20
	sty	__rc7
	bcs	.LBB18_103
; %bb.97:                               ;   in Loop: Header=BB18_4 Depth=1
	lda	#8
	ldy	.LJTI18_1,x
	pha
	lda	.LJTI18_1+20,x
	tax
	pla
	sty	__rc2
	stx	__rc3
	ldy	#1
	pha
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc25
	pla
	jmp	(__rc2)
.LBB18_98:                              ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc12
	and	#239
	sta	__rc12
	lda	#10
.LBB18_99:                              ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc7
	cpx	#105
	beq	.LBB18_105
; %bb.100:                              ;   in Loop: Header=BB18_4 Depth=1
	cpx	#100
	beq	.LBB18_105
; %bb.101:                              ;   in Loop: Header=BB18_4 Depth=1
	cpx	#88
	bne	.LBB18_102
; %bb.403:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_137
.LBB18_102:                             ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc18
	lda	__rc12
	and	#243
	tax
	bra	.LBB18_106
.LBB18_103:                             ;   in Loop: Header=BB18_4 Depth=1
	tya
	pha
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
	pla
	cmp	#37
	bne	.LBB18_104
; %bb.405:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_172
.LBB18_104:                             ;   in Loop: Header=BB18_4 Depth=1
	cmp	#88
	beq	.LBB18_275
; %bb.407:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_133
.LBB18_275:                             ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_173
.LBB18_105:                             ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc18
	ldx	__rc12
.LBB18_106:                             ;   in Loop: Header=BB18_4 Depth=1
	phy
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	and	#4
	bne	.LBB18_108
; %bb.107:                              ;   in Loop: Header=BB18_4 Depth=1
	txa
	bra	.LBB18_109
.LBB18_108:                             ;   in Loop: Header=BB18_4 Depth=1
	txa
	and	#254
.LBB18_109:                             ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc13
	ldx	__rc7
	cpx	#105
	beq	.LBB18_111
; %bb.110:                              ;   in Loop: Header=BB18_4 Depth=1
	cpx	#100
	bne	.LBB18_113
.LBB18_111:                             ;   in Loop: Header=BB18_4 Depth=1
	phy
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	and	#2
	bne	.LBB18_114
; %bb.112:                              ;   in Loop: Header=BB18_4 Depth=1
	txa
	and	#1
	beq	.LBB18_277
; %bb.409:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_141
.LBB18_277:                             ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_139
.LBB18_113:                             ;   in Loop: Header=BB18_4 Depth=1
	phy
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	and	#2
	bne	.LBB18_279
; %bb.411:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_145
.LBB18_279:                             ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_148
.LBB18_114:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	(__rc10)
	sta	__rc3
	cmp	#1
	lda	(__rc10),y
	sta	__rc4
	sbc	#0
	ldy	#2
	lda	(__rc10),y
	sta	__rc5
	sbc	#0
	iny
	lda	(__rc10),y
	sta	__rc6
	sbc	#0
	iny
	lda	(__rc10),y
	sta	__rc7
	sbc	#0
	iny
	lda	(__rc10),y
	sta	__rc8
	sbc	#0
	iny
	lda	(__rc10),y
	sta	__rc9
	sbc	#0
	iny
	lda	(__rc10),y
	sta	__rc2
	sbc	#0
	bvc	.LBB18_115
; %bb.413:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_149
.LBB18_115:                             ;   in Loop: Header=BB18_4 Depth=1
	tax
	bmi	.LBB18_281
; %bb.415:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_136
.LBB18_281:                             ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_174
.LBB18_116:                             ;   in Loop: Header=BB18_4 Depth=1
	jsr	__call_indir
.LBB18_117:                             ;   in Loop: Header=BB18_4 Depth=1
	ldy	#1
.LBB18_118:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc21
.LBB18_119:                             ;   in Loop: Header=BB18_4 Depth=1
	inc	__rc30
	beq	.LBB18_120
; %bb.417:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_4
.LBB18_120:                             ;   in Loop: Header=BB18_4 Depth=1
	inc	__rc31
; %bb.283:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_4
.LBB18_121:
	ldx	__rc22
	ldy	__rc26
	lda	__rc20
	bne	.LBB18_124
; %bb.122:
	lda	__rc21
	bne	.LBB18_124
; %bb.123:
	ldy	#255
	ldx	#254
.LBB18_124:
	lda	__rc24
	sta	__rc18
	lda	__rc25
	sta	__rc19
	lda	#255
	stz	__rc7
	pha
	phy
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc3
	pla
	sty	__rc4
	sta	__rc5
	sta	__rc6
	lda	#0
	jsr	__call_indir
	ldx	__rc26
	lda	__rc22
	sta	__rc16
	ldy	#8
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
	adc	#40
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	lda	__rc16
	rts
.LBB18_125:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc30
	stx	__rc2
	ldx	__rc31
	stx	__rc3
	inc	__rc2
	bne	.LBB18_127
; %bb.126:                              ;   in Loop: Header=BB18_4 Depth=1
	inc	__rc3
.LBB18_127:                             ;   in Loop: Header=BB18_4 Depth=1
	ldy	#1
	lda	(__rc30),y
	cmp	#104
	beq	.LBB18_128
; %bb.419:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_171
.LBB18_128:                             ;   in Loop: Header=BB18_4 Depth=1
	stz	__rc2
	ldx	#192
	stx	__rc3
	ldy	#2
; %bb.285:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_93
.LBB18_129:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	#3
	ldy	__rc30
	sty	__rc4
	ldy	__rc31
	sty	__rc5
	inc	__rc4
	bne	.LBB18_131
; %bb.130:                              ;   in Loop: Header=BB18_4 Depth=1
	inc	__rc5
.LBB18_131:                             ;   in Loop: Header=BB18_4 Depth=1
	ldy	#1
	lda	(__rc30),y
	stx	__rc2
	iny
	cmp	#108
	bne	.LBB18_132
; %bb.421:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_93
.LBB18_132:                             ;   in Loop: Header=BB18_4 Depth=1
	tax
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ora	#1
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
; %bb.287:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_94
.LBB18_133:                             ;   in Loop: Header=BB18_4 Depth=1
	tax
	lda	#16
	ldy	#1
	cpx	#120
	bne	.LBB18_134
; %bb.423:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_99
.LBB18_134:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc24
	stx	__rc18
	ldx	__rc25
	stx	__rc19
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	__rc26
	stx	__rc4
	ldx	#255
	stx	__rc5
	stx	__rc6
	ldx	__rc22
	lda	__rc7
; %bb.289:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_116
.LBB18_135:                             ;   in Loop: Header=BB18_4 Depth=1
	inc	__rc29
; %bb.291:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_71
.LBB18_136:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc6
	ldy	__rc7
	sty	__rc12
	ldy	__rc2
	sty	__rc19
; %bb.293:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_84
.LBB18_137:                             ;   in Loop: Header=BB18_4 Depth=1
	tax
	lda	__rc12
	ora	#32
	sta	__rc12
	txa
; %bb.295:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_102
.LBB18_138:                             ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc2
	ldx	#0
; %bb.297:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_85
.LBB18_139:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc13
	and	#64
	sta	__rc4
	lda	(__rc10)
	bmi	.LBB18_140
; %bb.425:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_175
.LBB18_140:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	#255
	stx	__rc2
; %bb.299:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_176
.LBB18_141:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	(__rc10)
	sta	__rc3
	cmp	#1
	lda	(__rc10),y
	sta	__rc4
	sbc	#0
	ldy	#2
	lda	(__rc10),y
	sta	__rc5
	sbc	#0
	iny
	lda	(__rc10),y
	sta	__rc2
	sbc	#0
	bvc	.LBB18_143
; %bb.142:                              ;   in Loop: Header=BB18_4 Depth=1
	eor	#128
.LBB18_143:                             ;   in Loop: Header=BB18_4 Depth=1
	tax
	bpl	.LBB18_144
; %bb.427:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_205
.LBB18_144:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc2
; %bb.301:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_206
.LBB18_145:                             ;   in Loop: Header=BB18_4 Depth=1
	txa
	and	#1
	beq	.LBB18_146
; %bb.429:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_178
.LBB18_146:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc13
	and	#64
	beq	.LBB18_147
; %bb.431:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_213
.LBB18_147:                             ;   in Loop: Header=BB18_4 Depth=1
	ldy	#1
	lda	(__rc10),y
	sta	__rc8
; %bb.303:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_214
.LBB18_148:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc10
	clc
	adc	#8
	sta	__rc28
	lda	__rc11
	adc	#0
	sta	__rc29
	lda	(__rc10)
	sta	__rc2
	clc
	lda	__rc0
	adc	#32
	sta	__rc6
	lda	__rc1
	adc	#0
	sta	__rc7
	lda	(__rc10),y
	sta	__rc3
	ldy	#2
	lda	(__rc10),y
	sta	__rc9
	iny
	lda	(__rc10),y
	sta	__rc12
	iny
	lda	(__rc10),y
	sta	__rc19
	iny
	lda	(__rc10),y
	sta	__rc8
	iny
	lda	(__rc10),y
	sta	__rc5
	iny
	lda	(__rc10),y
	sta	__rc4
	lda	__rc2
	sta	(__rc6)
	ldy	#1
	lda	__rc3
	sta	(__rc6),y
	iny
	lda	__rc9
	sta	(__rc6),y
	iny
	lda	__rc12
	sta	(__rc6),y
	iny
	lda	__rc19
	sta	(__rc6),y
	iny
	lda	__rc8
	sta	(__rc6),y
	iny
	lda	__rc5
	sta	(__rc6),y
	iny
	lda	__rc4
	sta	(__rc6),y
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	(__rc0)
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	#1
	sta	(__rc0),y
	lda	__rc13
	iny
	sta	(__rc0),y
	txa
	iny
	sta	(__rc0),y
	ldx	__rc24
	stx	__rc2
	ldx	__rc25
	stx	__rc3
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	ldx	#8
; %bb.305:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_179
.LBB18_149:                             ;   in Loop: Header=BB18_4 Depth=1
	eor	#128
; %bb.307:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_115
.LBB18_150:                             ;   in Loop: Header=BB18_4 Depth=1
	txa
; %bb.309:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_91
.LBB18_151:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	#0
	sec
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	__rc24
	ora	#2
	sta	__rc24
; %bb.311:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_70
.LBB18_152:                             ;   in Loop: Header=BB18_4 Depth=1
	pha
	lda	__rc6
	ldy	#25
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	stz	__rc27
	sta	__rc28
	stz	__rc14
	stz	__rc15
	stz	__rc29
; %bb.313:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_27
.LBB18_153:                             ;   in Loop: Header=BB18_4 Depth=1
	phy
	lda	__rc6
	ldy	#25
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc5
	lda	(__rc4)
	sta	__rc14
	cmp	#1
	lda	(__rc4),y
	sta	__rc15
	sbc	#0
	bvc	.LBB18_155
; %bb.154:                              ;   in Loop: Header=BB18_4 Depth=1
	eor	#128
.LBB18_155:                             ;   in Loop: Header=BB18_4 Depth=1
	tax
	clc
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	lda	__rc4
	adc	#2
	sta	__rc4
	lda	__rc5
	adc	#0
	ldy	#2
	cpx	#0
	bpl	.LBB18_157
; %bb.156:                              ;   in Loop: Header=BB18_4 Depth=1
	stz	__rc14
	stz	__rc15
.LBB18_157:                             ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	phy
	lda	__rc4
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	clc
	lda	__rc28
	adc	#2
	sta	__rc30
	lda	__rc29
	adc	#0
	sta	__rc31
	lda	(__rc28),y
; %bb.315:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_91
.LBB18_158:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	#2
; %bb.317:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_102
.LBB18_159:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc12
	stx	__rc20
	lda	(__rc10)
	sta	__rc18
	lda	(__rc10),y
	sta	__rc19
	lda	__rc15
	bne	.LBB18_161
; %bb.160:                              ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc14
	bne	.LBB18_161
; %bb.433:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_256
.LBB18_161:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc14
	stx	__rc6
	ldx	__rc15
	stx	__rc7
.LBB18_162:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	(__rc18)
	ldx	__rc18
	stx	__rc2
	ldx	__rc19
	stx	__rc3
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc13
	pla
	sta	__rc12
	beq	.LBB18_164
; %bb.163:                              ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc18
	stx	__rc4
	ldx	__rc19
	stx	__rc5
	ldx	__rc18
	stx	__rc2
	ldx	__rc19
	stx	__rc3
; %bb.319:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_32
.LBB18_164:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc2
	sec
	sbc	__rc18
	sta	__rc21
	lda	__rc3
	sbc	__rc19
	sta	__rc4
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	and	#4
	sta	(__rc0),y                       ; 1-byte Folded Spill
	beq	.LBB18_165
; %bb.435:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_185
.LBB18_165:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc4
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#1
; %bb.321:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_188
.LBB18_166:                             ;   in Loop: Header=BB18_4 Depth=1
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc10
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc11
	ldx	__rc24
	stx	__rc12
	lda	__rc8
; %bb.323:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_96
.LBB18_167:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc12
	and	#2
	beq	.LBB18_168
; %bb.437:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_202
.LBB18_168:                             ;   in Loop: Header=BB18_4 Depth=1
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	beq	.LBB18_169
; %bb.439:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_241
.LBB18_169:                             ;   in Loop: Header=BB18_4 Depth=1
	cpx	#2
; %bb.325:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_242
.LBB18_170:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc10
	clc
	adc	#2
	sta	__rc28
	lda	__rc11
	adc	#0
	sta	__rc29
	lda	(__rc10)
	sta	__rc2
	clc
	lda	__rc0
	adc	#32
	sta	__rc6
	lda	__rc1
	adc	#0
	sta	__rc7
	ldy	#1
	lda	(__rc10),y
	sta	__rc3
	lda	__rc2
	sta	(__rc6)
	lda	__rc3
	sta	(__rc6),y
	lda	__rc12
	ora	#33
	iny
	sta	(__rc0),y
	ldx	#2
	lda	#4
	sta	(__rc0)
	lda	#0
	dey
	sta	(__rc0),y
	ldy	#3
	phy
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc0),y
	ldy	__rc24
	sty	__rc2
	ldy	__rc25
	sty	__rc3
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	stx	__rc8
	ldy	#0
	stz	__rc9
	ldx	#16
; %bb.327:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_82
.LBB18_171:                             ;   in Loop: Header=BB18_4 Depth=1
	tax
	lda	__rc24
	ora	#128
	sta	__rc12
	txa
	ldx	__rc2
	stx	__rc30
	ldx	__rc3
; %bb.329:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_95
.LBB18_172:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc24
	stx	__rc18
	ldx	__rc25
	stx	__rc19
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	ldx	__rc26
	stx	__rc4
	ldx	#255
	stx	__rc5
	stx	__rc6
	ldx	__rc22
	lda	#37
; %bb.331:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_116
.LBB18_173:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	#16
	ldy	#1
; %bb.333:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_99
.LBB18_174:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	#0
	sec
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
	tax
	lda	#0
	sbc	__rc7
	sta	__rc12
	lda	#0
	sbc	__rc8
	sta	__rc8
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc2
	sta	__rc19
; %bb.335:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_84
.LBB18_175:                             ;   in Loop: Header=BB18_4 Depth=1
	stz	__rc2
.LBB18_176:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc4
	beq	.LBB18_177
; %bb.441:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_180
.LBB18_177:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	(__rc10)
	sta	__rc3
	lda	(__rc10),y
	sta	__rc2
; %bb.337:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_181
.LBB18_178:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc10
	clc
	adc	#4
	sta	__rc28
	lda	__rc11
	adc	#0
	sta	__rc29
	lda	(__rc10)
	sta	__rc2
	clc
	lda	__rc0
	adc	#32
	sta	__rc6
	lda	__rc1
	adc	#0
	sta	__rc7
	ldy	#1
	lda	(__rc10),y
	sta	__rc3
	iny
	lda	(__rc10),y
	sta	__rc5
	iny
	lda	(__rc10),y
	sta	__rc4
	lda	__rc2
	sta	(__rc6)
	ldy	#1
	lda	__rc3
	sta	(__rc6),y
	iny
	lda	__rc5
	sta	(__rc6),y
	iny
	lda	__rc4
	sta	(__rc6),y
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	(__rc0)
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	#1
	sta	(__rc0),y
	lda	__rc13
	iny
	sta	(__rc0),y
	txa
	iny
	sta	(__rc0),y
	ldx	__rc24
	stx	__rc2
	ldx	__rc25
	stx	__rc3
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	ldx	#4
.LBB18_179:                             ;   in Loop: Header=BB18_4 Depth=1
	stx	__rc8
	ldx	#0
	stz	__rc9
	ldx	__rc18
; %bb.339:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_82
.LBB18_180:                             ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc3
.LBB18_181:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc3
	cpx	#1
	lda	__rc2
	sbc	#0
	bvc	.LBB18_183
; %bb.182:                              ;   in Loop: Header=BB18_4 Depth=1
	eor	#128
.LBB18_183:                             ;   in Loop: Header=BB18_4 Depth=1
	tax
	bpl	.LBB18_184
; %bb.443:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_209
.LBB18_184:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc2
; %bb.341:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_210
.LBB18_185:                             ;   in Loop: Header=BB18_4 Depth=1
	ldy	#1
	ldx	__rc4
	cpx	__rc15
	beq	.LBB18_186
; %bb.445:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_215
.LBB18_186:                             ;   in Loop: Header=BB18_4 Depth=1
	txa
	phy
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	ldx	__rc21
	cpx	__rc14
	bcc	.LBB18_188
.LBB18_187:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc15
	phy
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	ldx	__rc14
	stx	__rc21
.LBB18_188:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc20
	and	#2
	phy
	ldy	#18
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	tax
	beq	.LBB18_189
; %bb.447:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_220
.LBB18_189:                             ;   in Loop: Header=BB18_4 Depth=1
	phy
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	sta	__rc2
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	cmp	__rc2
	beq	.LBB18_190
; %bb.449:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_216
.LBB18_190:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc21
	cpx	__rc13
	bcc	.LBB18_191
; %bb.451:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_217
.LBB18_191:                             ;   in Loop: Header=BB18_4 Depth=1
                                        ; kill: def $rs9 killed $rs9
	lda	__rc18
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc19
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc15
	stx	__rc29
	ldx	__rc14
	stx	__rc28
.LBB18_192:                             ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	__rc26
	lda	__rc22
	inc	__rc22
	bne	.LBB18_194
; %bb.193:                              ;   in Loop: Header=BB18_192 Depth=2
	inc	__rc26
.LBB18_194:                             ;   in Loop: Header=BB18_192 Depth=2
	ldy	__rc24
	sty	__rc18
	ldy	__rc25
	sty	__rc19
	pha
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	stx	__rc4
	ldx	#255
	stx	__rc5
	stx	__rc6
	tax
	lda	#32
	jsr	__call_indir
	ldy	__rc21
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	iny
	bne	.LBB18_196
; %bb.195:                              ;   in Loop: Header=BB18_192 Depth=2
	inc
.LBB18_196:                             ;   in Loop: Header=BB18_192 Depth=2
	pha
	phy
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	pla
	stx	__rc2
	cmp	__rc2
	bne	.LBB18_198
; %bb.197:                              ;   in Loop: Header=BB18_192 Depth=2
	phy
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc13
	sty	__rc21
	cpy	__rc13
	bcs	.LBB18_199
; %bb.453:                              ;   in Loop: Header=BB18_192 Depth=2
	jmp	.LBB18_192
.LBB18_198:                             ;   in Loop: Header=BB18_192 Depth=2
	sty	__rc21
	stx	__rc2
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	cmp	__rc2
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc13
	bcs	.LBB18_199
; %bb.455:                              ;   in Loop: Header=BB18_192 Depth=2
	jmp	.LBB18_192
.LBB18_199:                             ;   in Loop: Header=BB18_4 Depth=1
	ldy	#1
	ldx	__rc28
	stx	__rc14
	ldx	__rc29
	stx	__rc15
	sta	__rc21
	phy
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	inc	__rc21
	bne	.LBB18_201
; %bb.200:                              ;   in Loop: Header=BB18_4 Depth=1
	inc	__rc4
.LBB18_201:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc4
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc18
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc19
	lda	(__rc18)
	sta	__rc12
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc10
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc11
; %bb.343:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_220
.LBB18_202:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc10
	clc
	adc	#2
	sta	__rc28
	lda	__rc11
	adc	#0
	sta	__rc29
	lda	(__rc10)
	ldx	__rc24
	stx	__rc18
	ldx	__rc25
	stx	__rc19
	pha
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	ldx	__rc26
	stx	__rc4
	ldx	#255
	stx	__rc5
	stx	__rc6
	ldx	__rc22
	jsr	__call_indir
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	beq	.LBB18_203
; %bb.457:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_244
.LBB18_203:                             ;   in Loop: Header=BB18_4 Depth=1
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tay
	pla
	cpy	#2
	bcc	.LBB18_204
; %bb.459:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_245
.LBB18_204:                             ;   in Loop: Header=BB18_4 Depth=1
                                        ; kill: def $rs14 killed $rs14
	lda	__rc28
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc29
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
; %bb.345:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_117
.LBB18_205:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	#0
	sec
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	__rc5
	sta	__rc5
	lda	#0
	sbc	__rc2
	tax
.LBB18_206:                             ;   in Loop: Header=BB18_4 Depth=1
	clc
	lda	__rc0
	adc	#32
	sta	__rc6
	lda	__rc1
	adc	#0
	sta	__rc7
	lda	__rc3
	sta	(__rc6)
	ldy	#1
	lda	__rc4
	sta	(__rc6),y
	iny
	lda	__rc5
	sta	(__rc6),y
	iny
	txa
	sta	(__rc6),y
	ldy	#1
	lda	__rc10
	clc
	adc	#4
	sta	__rc4
	lda	__rc11
	adc	#0
	stz	__rc12
	ldx	#1
	inc	__rc2
	dec	__rc2
	bmi	.LBB18_208
; %bb.207:                              ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc2
	ldx	#0
.LBB18_208:                             ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	phy
	lda	__rc4
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	(__rc0)
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc0),y
	lda	__rc13
	ldy	#2
	sta	(__rc0),y
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	#3
	sta	(__rc0),y
	ldy	__rc24
	sty	__rc2
	ldy	__rc25
	sty	__rc3
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	ldy	#4
; %bb.347:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_86
.LBB18_209:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	#0
	sec
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	tax
.LBB18_210:                             ;   in Loop: Header=BB18_4 Depth=1
	clc
	lda	__rc0
	adc	#32
	sta	__rc6
	lda	__rc1
	adc	#0
	sta	__rc7
	lda	__rc3
	sta	(__rc6)
	ldy	#1
	txa
	sta	(__rc6),y
	lda	__rc10
	clc
	adc	#2
	sta	__rc4
	lda	__rc11
	adc	#0
	stz	__rc12
	ldx	#1
	inc	__rc2
	dec	__rc2
	bmi	.LBB18_212
; %bb.211:                              ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc2
	ldx	#0
.LBB18_212:                             ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	phy
	lda	__rc4
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	(__rc0)
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc0),y
	ldy	#2
	lda	__rc13
	sta	(__rc0),y
	iny
	phy
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc0),y
	ldy	__rc24
	sty	__rc2
	ldy	__rc25
	sty	__rc3
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	ldy	#2
; %bb.349:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_86
.LBB18_213:                             ;   in Loop: Header=BB18_4 Depth=1
	stz	__rc8
.LBB18_214:                             ;   in Loop: Header=BB18_4 Depth=1
	clc
	lda	__rc10
	adc	#2
	sta	__rc4
	lda	(__rc10)
	sta	__rc9
	lda	__rc11
	adc	#0
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	lda	__rc4
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	lda	__rc0
	adc	#32
	sta	__rc6
	lda	__rc1
	adc	#0
	sta	__rc7
	lda	__rc9
	sta	(__rc6)
	lda	__rc8
	ldy	#1
	sta	(__rc6),y
	phy
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	(__rc0)
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc0),y
	ldy	#2
	lda	__rc13
	sta	(__rc0),y
	ldx	#2
	iny
	phy
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	(__rc0),y
	ldy	__rc24
	sty	__rc2
	ldy	__rc25
	sty	__rc3
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	stx	__rc8
	ldx	#0
	stz	__rc9
	ldx	__rc18
	stx	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	ldx	__rc26
	lda	__rc22
	jsr	_ntoa
	ldy	#1
	stx	__rc20
; %bb.351:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_119
.LBB18_215:                             ;   in Loop: Header=BB18_4 Depth=1
	txa
	phy
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	cpx	__rc15
	bcc	.LBB18_353
; %bb.461:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_187
.LBB18_353:                             ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_188
.LBB18_216:                             ;   in Loop: Header=BB18_4 Depth=1
	stx	__rc2
	cmp	__rc2
	bcs	.LBB18_217
; %bb.463:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_191
.LBB18_217:                             ;   in Loop: Header=BB18_4 Depth=1
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	inc	__rc21
	bne	.LBB18_219
; %bb.218:                              ;   in Loop: Header=BB18_4 Depth=1
	inx
.LBB18_219:                             ;   in Loop: Header=BB18_4 Depth=1
	txa
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
.LBB18_220:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc10
	clc
	adc	#2
	phy
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc11
	adc	#0
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	lda	__rc12
	beq	.LBB18_222
; %bb.221:                              ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc18
	stx	__rc28
	ldx	__rc19
	stx	__rc29
; %bb.355:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_64
.LBB18_222:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc22
	stx	__rc25
	ldx	__rc26
	stx	__rc20
.LBB18_223:                             ;   in Loop: Header=BB18_4 Depth=1
	phy
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	ldy	#18
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	lda	__rc2
	bne	.LBB18_225
; %bb.224:                              ;   in Loop: Header=BB18_4 Depth=1
                                        ; kill: def $rs2 killed $rs2
	sty	__rc17
	lda	__rc4
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	stz	__rc27
	lda	__rc25
	pha
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	__rc17
; %bb.357:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_230
.LBB18_225:                             ;   in Loop: Header=BB18_4 Depth=1
	phy
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc6
	stz	__rc27
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	cmp	__rc6
	bne	.LBB18_227
; %bb.226:                              ;   in Loop: Header=BB18_4 Depth=1
                                        ; kill: def $rs2 killed $rs2
	phy
	lda	__rc4
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	ldx	__rc21
	cpx	__rc13
	bra	.LBB18_228
.LBB18_227:                             ;   in Loop: Header=BB18_4 Depth=1
                                        ; kill: def $rs2 killed $rs2
	phy
	lda	__rc4
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	cpx	__rc6
.LBB18_228:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc25
	bcc	.LBB18_231
; %bb.229:                              ;   in Loop: Header=BB18_4 Depth=1
	pha
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
.LBB18_230:                             ;   in Loop: Header=BB18_4 Depth=1
	sta	__rc25
; %bb.359:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_83
.LBB18_231:                             ;   in Loop: Header=BB18_4 Depth=1
	pha
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc24
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc25
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	pla
	ldy	#255
.LBB18_232:                             ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	phy
	ldx	__rc20
	stx	__rc4
	tax
	ldy	__rc21
	sty	__rc5
	ply
	pha
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc21
	pla
	inc	__rc5
	bne	.LBB18_234
; %bb.233:                              ;   in Loop: Header=BB18_232 Depth=2
	inc	__rc21
.LBB18_234:                             ;   in Loop: Header=BB18_232 Depth=2
	phy
	ldy	__rc5
	sty	__rc28
	ply
	inc
	bne	.LBB18_236
; %bb.235:                              ;   in Loop: Header=BB18_232 Depth=2
	inc	__rc20
.LBB18_236:                             ;   in Loop: Header=BB18_232 Depth=2
	sta	__rc26
	lda	__rc24
	sta	__rc18
	lda	__rc25
	sta	__rc19
	lda	__rc22
	sta	__rc2
	lda	__rc23
	sta	__rc3
	sty	__rc5
	sty	__rc6
	lda	#32
	jsr	__call_indir
	ldy	__rc21
	phy
	ldy	#20
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	cpy	__rc2
	bne	.LBB18_238
; %bb.237:                              ;   in Loop: Header=BB18_232 Depth=2
	tya
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	ldx	__rc28
	stx	__rc21
	cpx	__rc2
	bra	.LBB18_239
.LBB18_238:                             ;   in Loop: Header=BB18_232 Depth=2
	ldx	__rc28
	stx	__rc21
	sta	__rc2
	tya
	phy
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	cpy	__rc2
.LBB18_239:                             ;   in Loop: Header=BB18_232 Depth=2
	ldy	#255
	lda	__rc26
	bcs	.LBB18_361
; %bb.465:                              ;   in Loop: Header=BB18_232 Depth=2
	jmp	.LBB18_232
.LBB18_361:                             ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_87
.LBB18_240:                             ;   in Loop: Header=BB18_4 Depth=1
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	lda	__rc4
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	#1
	lda	__rc24
	ldx	__rc22
	stx	__rc24
	ldx	__rc23
	stx	__rc25
; %bb.363:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_119
.LBB18_241:                             ;   in Loop: Header=BB18_4 Depth=1
	cmp	#0
.LBB18_242:                             ;   in Loop: Header=BB18_4 Depth=1
	ldy	#255
	bcc	.LBB18_243
; %bb.467:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_248
.LBB18_243:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	__rc10
	clc
	adc	#2
	sta	__rc28
	lda	__rc11
	adc	#0
	sta	__rc29
	lda	(__rc10)
	ldx	__rc24
	stx	__rc18
	ldx	__rc25
	stx	__rc19
	pha
	phy
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc3
	pla
	ldx	__rc26
	stx	__rc4
	sty	__rc5
	sty	__rc6
	ldx	__rc22
	jsr	__call_indir
	ldy	#1
                                        ; kill: def $rs14 killed $rs14
	phy
	lda	__rc28
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc29
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
; %bb.365:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_118
.LBB18_244:                             ;   in Loop: Header=BB18_4 Depth=1
	cmp	#0
	pha
	ldy	#25
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tay
	pla
	bcs	.LBB18_245
; %bb.469:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_204
.LBB18_245:                             ;   in Loop: Header=BB18_4 Depth=1
                                        ; kill: def $rs14 killed $rs14
	pha
	phy
	lda	__rc28
	ldy	#26
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc29
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	pla
	phy
	plx
	dey
	cpx	#0
	bne	.LBB18_247
; %bb.246:                              ;   in Loop: Header=BB18_4 Depth=1
	dec
.LBB18_247:                             ;   in Loop: Header=BB18_4 Depth=1
	ldx	__rc21
	stx	__rc24
	pha
	phy
	ldy	#21
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc22
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc23
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc28
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc29
	pla
; %bb.367:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_42
.LBB18_248:                             ;   in Loop: Header=BB18_4 Depth=1
	stx	__rc2
	sta	__rc3
	lda	#0
	stz	__rc28
	stz	__rc29
	inc
	sec
	sbc	__rc2
	phy
	ldy	#26
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	lda	#0
	sbc	__rc3
.LBB18_249:                             ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	__rc26
	sta	__rc23
	lda	__rc22
	inc	__rc22
	bne	.LBB18_251
; %bb.250:                              ;   in Loop: Header=BB18_249 Depth=2
	inc	__rc26
.LBB18_251:                             ;   in Loop: Header=BB18_249 Depth=2
	phy
	ldy	__rc24
	sty	__rc18
	ldy	__rc25
	sty	__rc19
	ply
	pha
	phy
	ldy	#28
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc3
	pla
	stx	__rc4
	sty	__rc5
	sty	__rc6
	tax
	lda	#32
	jsr	__call_indir
	lda	__rc23
	ldy	#255
	ldx	__rc28
	dec	__rc28
	cpx	#0
	bne	.LBB18_253
; %bb.252:                              ;   in Loop: Header=BB18_249 Depth=2
	dec	__rc29
.LBB18_253:                             ;   in Loop: Header=BB18_249 Depth=2
	cmp	__rc29
	bne	.LBB18_249
; %bb.254:                              ;   in Loop: Header=BB18_249 Depth=2
	pha
	phy
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	pla
	cpx	__rc28
	beq	.LBB18_255
; %bb.471:                              ;   in Loop: Header=BB18_249 Depth=2
	jmp	.LBB18_249
.LBB18_255:                             ;   in Loop: Header=BB18_4 Depth=1
	sty	__rc17
	ldy	#23
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
	lda	__rc4
	clc
	adc	#2
	sta	__rc2
	lda	__rc5
	adc	#0
	sta	__rc3
                                        ; kill: def $rs1 killed $rs1
	lda	__rc2
	ldy	#26
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc3
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	sec
	lda	__rc21
	sbc	__rc28
	sta	__rc21
	lda	__rc20
	sbc	__rc29
	sta	__rc20
	lda	(__rc4)
	ldx	__rc24
	stx	__rc18
	ldx	__rc25
	stx	__rc19
	pha
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ldy	__rc17
	sta	__rc3
	pla
	ldx	__rc26
	stx	__rc4
	sty	__rc5
	sty	__rc6
	ldx	__rc22
	jsr	__call_indir
	lda	__rc21
	pha
	ldy	#26
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc5
                                        ; kill: def $rs2 killed $rs2
	lda	__rc4
	ldy	#23
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc5
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
; %bb.369:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_87
.LBB18_256:                             ;   in Loop: Header=BB18_4 Depth=1
	lda	#255
	sta	__rc6
	sta	__rc7
; %bb.371:                              ;   in Loop: Header=BB18_4 Depth=1
	jmp	.LBB18_162
.Lfunc_end18:
	.size	sprintf, .Lfunc_end18-sprintf
	.section	.rodata.sprintf,"a",@progbits
.LJTI18_0:
	.byte	.LBB18_125@mos16lo
	.byte	.LBB18_93@mos16lo
	.byte	.LBB18_129@mos16lo
	.byte	.LBB18_96@mos16lo
	.byte	.LBB18_96@mos16lo
	.byte	.LBB18_96@mos16lo
	.byte	.LBB18_93@mos16lo
	.byte	.LBB18_96@mos16lo
	.byte	.LBB18_96@mos16lo
	.byte	.LBB18_93@mos16lo
	.byte	.LBB18_125@mos16hi
	.byte	.LBB18_93@mos16hi
	.byte	.LBB18_129@mos16hi
	.byte	.LBB18_96@mos16hi
	.byte	.LBB18_96@mos16hi
	.byte	.LBB18_96@mos16hi
	.byte	.LBB18_93@mos16hi
	.byte	.LBB18_96@mos16hi
	.byte	.LBB18_96@mos16hi
	.byte	.LBB18_93@mos16hi
.LJTI18_1:
	.byte	.LBB18_158@mos16lo
	.byte	.LBB18_167@mos16lo
	.byte	.LBB18_98@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_98@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_102@mos16lo
	.byte	.LBB18_170@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_159@mos16lo
	.byte	.LBB18_134@mos16lo
	.byte	.LBB18_98@mos16lo
	.byte	.LBB18_158@mos16hi
	.byte	.LBB18_167@mos16hi
	.byte	.LBB18_98@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_98@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_102@mos16hi
	.byte	.LBB18_170@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_159@mos16hi
	.byte	.LBB18_134@mos16hi
	.byte	.LBB18_98@mos16hi
                                        ; -- End function
	.section	.text._out_buffer,"ax",@progbits
	.type	_out_buffer,@function           ; -- Begin function _out_buffer
_out_buffer:                            ; @_out_buffer
; %bb.0:
	tay
	txa
	ldx	__rc4
	cpx	__rc6
	bne	.LBB19_4
; %bb.1:
	cmp	__rc5
	bcs	.LBB19_3
.LBB19_2:
	clc
	adc	__rc2
	sta	__rc2
	lda	__rc3
	adc	__rc4
	sta	__rc3
	tya
	sta	(__rc2)
.LBB19_3:
	rts
.LBB19_4:
	ldx	__rc4
	cpx	__rc6
	bcc	.LBB19_2
	bra	.LBB19_3
.Lfunc_end19:
	.size	_out_buffer, .Lfunc_end19-_out_buffer
                                        ; -- End function
	.section	.text._out_null,"ax",@progbits
	.type	_out_null,@function             ; -- Begin function _out_null
_out_null:                              ; @_out_null
; %bb.0:
	rts
.Lfunc_end20:
	.size	_out_null, .Lfunc_end20-_out_null
                                        ; -- End function
	.section	.text._ntoa,"ax",@progbits
	.type	_ntoa,@function                 ; -- Begin function _ntoa
_ntoa:                                  ; @_ntoa
; %bb.0:
	pha
	clc
	lda	__rc0
	adc	#230
	sta	__rc0
	lda	__rc1
	adc	#253
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
	ldy	#15
	sta	(__rc0),y                       ; 1-byte Folded Spill
	txa
	dey
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc8
	stx	__rc27
	lda	__rc9
	ldx	__rc10
	stx	__rc26
	pha
	lda	__rc11
	ldy	#9
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc14
	ldy	#11
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc15
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldx	__rc2
	stx	__rc20
	ldx	__rc3
	stx	__rc21
	ldx	__rc4
	stx	__rc22
	ldx	__rc5
	stx	__rc23
	ldx	__rc6
	stx	__rc4
	ldx	__rc7
	stx	__rc5
	and	#1
	ldy	#10
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	lda	__rc0
	adc	#26
	sta	__rc6
	lda	__rc1
	adc	#2
	sta	__rc7
                                        ; kill: def $rs3 killed $rs3
	lda	__rc6
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc7
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	lda	__rc0
	adc	#27
	sta	__rc30
	lda	__rc1
	adc	#2
	sta	__rc31
	clc
	lda	__rc0
	adc	#28
	sta	__rc2
	lda	__rc1
	adc	#2
	sta	__rc3
	clc
	lda	__rc0
	adc	#29
	sta	__rc6
	lda	__rc1
	adc	#2
	sta	__rc7
	lda	(__rc2)
	iny
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	(__rc6)
	sta	__rc24
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
	ldx	#0
	stz	__rc6
	txa
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc8
	jsr	memcpy
	lda	(__rc28)
	bne	.LBB21_1
; %bb.236:
	jmp	.LBB21_38
.LBB21_1:
	lda	__rc24
	and	#4
	ldx	#1
	tay
	beq	.LBB21_3
; %bb.2:
	ldx	#0
.LBB21_3:
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc18
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc19
.LBB21_4:
	stx	__rc12
	clc
	lda	__rc0
	adc	#20
	pha
	lda	__rc1
	adc	#0
	tax
	pla
	clc
	sta	__rc13
	adc	__rc27
	sta	__rc4
	stx	__rc14
	txa
	adc	#0
	sta	__rc5
	clc
	lda	__rc0
	adc	#28
	sta	__rc2
	lda	__rc1
	adc	#0
	sta	__rc3
	lda	#0
	sta	(__rc2)
	lda	__rc27
	asl
	stz	__rc7
	rol	__rc7
	asl
	rol	__rc7
	asl
	sta	__rc6
	rol	__rc7
	ldx	__rc4
	dec	__rc4
	cpx	#0
	bne	.LBB21_6
; %bb.5:
	dec	__rc5
.LBB21_6:
	ldx	#0
	ldy	#1
.LBB21_7:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB21_10 Depth 2
                                        ;     Child Loop BB21_21 Depth 2
                                        ;     Child Loop BB21_25 Depth 2
	tya
	beq	.LBB21_17
; %bb.8:                                ;   in Loop: Header=BB21_7 Depth=1
	stx	__rc11
	sty	__rc10
	ldy	#0
	ldx	#0
	bra	.LBB21_10
.LBB21_9:                               ;   in Loop: Header=BB21_10 Depth=2
	sta	(__rc2),y
	iny
	cpy	__rc10
	beq	.LBB21_18
.LBB21_10:                              ;   Parent Loop BB21_7 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2),y
	asl
	cpx	#0
	beq	.LBB21_12
; %bb.11:                               ;   in Loop: Header=BB21_10 Depth=2
	ora	#1
.LBB21_12:                              ;   in Loop: Header=BB21_10 Depth=2
	cmp	__rc26
	ldx	#1
	bcs	.LBB21_14
; %bb.13:                               ;   in Loop: Header=BB21_10 Depth=2
	ldx	#0
.LBB21_14:                              ;   in Loop: Header=BB21_10 Depth=2
	bcc	.LBB21_9
; %bb.15:                               ;   in Loop: Header=BB21_10 Depth=2
	phy
	ldy	__rc26
	sty	__rc9
	ply
	sec
	sbc	__rc9
	sta	(__rc2),y
	iny
	cpy	__rc10
	bne	.LBB21_10
; %bb.16:                               ;   in Loop: Header=BB21_7 Depth=1
	ldy	__rc10
	ldx	__rc10
	inx
	lda	#1
	sta	(__rc2),y
	phx
	ply
	bra	.LBB21_19
.LBB21_17:                              ;   in Loop: Header=BB21_7 Depth=1
	lda	(__rc4)
	stz	__rc25
	ldy	#0
	cmp	#0
	bpl	.LBB21_24
	bra	.LBB21_23
.LBB21_18:                              ;   in Loop: Header=BB21_7 Depth=1
	ldy	__rc10
.LBB21_19:                              ;   in Loop: Header=BB21_7 Depth=1
	ldx	__rc11
	lda	(__rc4)
	sty	__rc25
	bpl	.LBB21_24
; %bb.20:                               ;   in Loop: Header=BB21_7 Depth=1
	tya
	ldy	#0
	cmp	#0
	beq	.LBB21_23
.LBB21_21:                              ;   Parent Loop BB21_7 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2),y
	inc
	cmp	__rc26
	beq	.LBB21_22
; %bb.238:                              ;   in Loop: Header=BB21_7 Depth=1
	jmp	.LBB21_62
.LBB21_22:                              ;   in Loop: Header=BB21_21 Depth=2
	tya
	inc
	sta	__rc8
	lda	#0
	sta	(__rc2),y
	ldy	__rc8
	lda	__rc25
	cmp	__rc8
	bne	.LBB21_21
; %bb.204:                              ;   in Loop: Header=BB21_7 Depth=1
	jmp	.LBB21_63
.LBB21_23:                              ;   in Loop: Header=BB21_7 Depth=1
	lda	#1
	sta	(__rc2),y
	sty	__rc25
	inc	__rc25
.LBB21_24:                              ;   in Loop: Header=BB21_7 Depth=1
	stz	__rc8
	ldy	#0
.LBB21_25:                              ;   Parent Loop BB21_7 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	__rc13
	sta	__rc10
	lda	__rc14
	sta	__rc11
	lda	(__rc10),y
	asl
	ora	__rc8
	sta	(__rc10),y
	stz	__rc8
	rol	__rc8
	iny
	cpy	__rc27
	bne	.LBB21_25
; %bb.26:                               ;   in Loop: Header=BB21_7 Depth=1
	inx
	ldy	#0
	cpy	__rc7
	bne	.LBB21_28
; %bb.27:                               ;   in Loop: Header=BB21_7 Depth=1
	cpx	__rc6
	bra	.LBB21_29
.LBB21_28:                              ;   in Loop: Header=BB21_7 Depth=1
	cpy	__rc7
.LBB21_29:                              ;   in Loop: Header=BB21_7 Depth=1
	ldy	__rc25
	bcs	.LBB21_30
; %bb.240:                              ;   in Loop: Header=BB21_7 Depth=1
	jmp	.LBB21_7
.LBB21_30:
	tya
	bne	.LBB21_31
; %bb.242:
	jmp	.LBB21_43
.LBB21_31:
	ldy	#0
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	and	#32
	eor	#97
	clc
	adc	#246
	sta	__rc5
	ldx	__rc12
	bra	.LBB21_34
.LBB21_32:                              ;   in Loop: Header=BB21_34 Depth=1
	sta	__rc4
	lda	__rc5
	clc
	adc	__rc4
.LBB21_33:                              ;   in Loop: Header=BB21_34 Depth=1
	sta	(__rc2),y
	iny
	sty	__rc4
	lda	__rc25
	cmp	__rc4
	beq	.LBB21_36
.LBB21_34:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc2),y
	cmp	#10
	bcs	.LBB21_32
; %bb.35:                               ;   in Loop: Header=BB21_34 Depth=1
	clc
	adc	#48
	bra	.LBB21_33
.LBB21_36:
	ldx	__rc12
	bne	.LBB21_37
; %bb.244:
	jmp	.LBB21_45
.LBB21_37:
	bit	__set_v
; %bb.206:
	jmp	.LBB21_48
.LBB21_38:
	stz	__rc2
	ldx	__rc27
	dex
	ldy	#1
.LBB21_39:                              ; =>This Inner Loop Header: Depth=1
	cpx	__rc2
	beq	.LBB21_42
; %bb.40:                               ;   in Loop: Header=BB21_39 Depth=1
	clc
	lda	__rc0
	adc	#20
	pha
	lda	__rc1
	adc	#0
	sta	__rc3
	pla
	clc
	adc	__rc2
	sta	__rc4
	lda	__rc3
	adc	#0
	sta	__rc5
	lda	(__rc4),y
	sta	__rc3
	lda	__rc2
	inc
	sta	__rc2
	inc	__rc3
	dec	__rc3
	beq	.LBB21_39
; %bb.41:
	cmp	__rc27
	bcs	.LBB21_42
; %bb.246:
	jmp	.LBB21_1
.LBB21_42:
	ldx	#1
	clv
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	and	#239
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc24
	and	#4
	stz	__rc25
	pha
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc18
	iny
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc19
	pla
	bne	.LBB21_48
; %bb.248:
	jmp	.LBB21_4
.LBB21_43:
	ldx	__rc12
	beq	.LBB21_46
; %bb.44:
	bit	__set_v
	bra	.LBB21_47
.LBB21_45:
	clv
	bra	.LBB21_48
.LBB21_46:
	clv
.LBB21_47:
	stz	__rc25
	stz	__rc2
	lda	#0
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
.LBB21_48:
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	and	#2
	tay
	txa
	and	#1
	phy
	ldy	#12
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	lda	(__rc18)
	sta	__rc5
	lda	(__rc30)
	pha
	tya
	phy
	ldy	#17
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	pla
	cpy	#0
	bne	.LBB21_53
; %bb.49:
	sta	__rc4
	stz	__rc29
	stz	__rc30
	pha
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc27
	pla
	tax
	lda	__rc5
	ldy	__rc4
	bne	.LBB21_51
; %bb.50:
	tay
	bne	.LBB21_51
; %bb.250:
	jmp	.LBB21_65
.LBB21_51:
	ldy	__rc5
	phy
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	lda	__rc2
	bne	.LBB21_54
.LBB21_52:
	sty	__rc30
	stx	__rc29
; %bb.208:
	jmp	.LBB21_65
.LBB21_53:
	stz	__rc24
	ldx	__rc5
	stx	__rc30
	sta	__rc29
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc8
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc9
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc27
; %bb.210:
	jmp	.LBB21_87
.LBB21_54:
	phy
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	lda	__rc2
	bne	.LBB21_56
; %bb.55:
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	and	#12
	beq	.LBB21_52
.LBB21_56:
	lda	#1
	bvs	.LBB21_58
; %bb.57:
	lda	#0
.LBB21_58:
	stx	__rc29
	sty	__rc30
	dec	__rc30
	cpy	#0
	bne	.LBB21_60
; %bb.59:
	dec	__rc29
.LBB21_60:
	pha
	pla
	beq	.LBB21_64
; %bb.61:
	bit	__set_v
	bra	.LBB21_65
.LBB21_62:                              ;   in Loop: Header=BB21_7 Depth=1
	sta	(__rc2),y
; %bb.212:                              ;   in Loop: Header=BB21_7 Depth=1
	jmp	.LBB21_24
.LBB21_63:                              ;   in Loop: Header=BB21_7 Depth=1
	ldy	__rc25
; %bb.214:                              ;   in Loop: Header=BB21_7 Depth=1
	jmp	.LBB21_23
.LBB21_64:
	clv
.LBB21_65:
	ldy	__rc27
	cpy	#1
	bne	.LBB21_67
; %bb.66:
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tax
	cpx	#254
	ldy	__rc27
	bra	.LBB21_68
.LBB21_67:
	ldy	__rc27
	cpy	#1
	phy
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
.LBB21_68:
	lda	#0
	bcc	.LBB21_70
; %bb.69:
	ldy	#1
	ldx	#254
.LBB21_70:
	sty	__rc2
	cmp	__rc2
	bne	.LBB21_72
; %bb.71:
	tya
	ldy	__rc25
	stx	__rc2
	cpy	__rc2
	tay
	stz	__rc24
	bcc	.LBB21_74
	bra	.LBB21_80
.LBB21_72:
	sty	__rc2
	cmp	__rc2
	bcc	.LBB21_74
; %bb.73:
	stz	__rc24
	bra	.LBB21_80
.LBB21_74:
	lda	#1
	bvs	.LBB21_76
; %bb.75:
	lda	#0
.LBB21_76:
	sta	__rc31
	clc
	lda	__rc0
	adc	#28
	pha
	lda	__rc1
	adc	#0
	sta	__rc3
	pla
	clc
	adc	__rc25
	sta	__rc2
	lda	__rc3
	adc	#0
	sta	__rc3
	sec
	stx	__rc28
	txa
	sbc	__rc25
	tax
	tya
	sbc	#0
	sty	__rc24
	ldy	#48
	sta	__rc4
	tya
	jsr	__memset
	ldx	__rc28
	stx	__rc25
	ldx	__rc31
	beq	.LBB21_78
; %bb.77:
	bit	__set_v
	bra	.LBB21_79
.LBB21_78:
	clv
.LBB21_79:
.LBB21_80:
	ldx	__rc24
	cpx	#1
	bne	.LBB21_82
; %bb.81:
	ldx	__rc25
	cpx	#254
	bcc	.LBB21_83
	bra	.LBB21_86
.LBB21_82:
	ldx	__rc24
	cpx	#1
	bcs	.LBB21_86
.LBB21_83:
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	and	#1
	beq	.LBB21_86
; %bb.84:
	ldx	__rc24
	cpx	__rc29
	beq	.LBB21_85
; %bb.252:
	jmp	.LBB21_105
.LBB21_85:
	ldx	__rc25
	cpx	__rc30
	bcs	.LBB21_86
; %bb.254:
	jmp	.LBB21_106
.LBB21_86:
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc8
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc9
.LBB21_87:
	ldy	#1
	phy
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	and	#16
	bne	.LBB21_89
; %bb.88:
	ldx	#254
	txa
	phy
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	ldx	__rc25
	stx	__rc3
	ldx	__rc24
	stx	__rc2
; %bb.216:
	jmp	.LBB21_155
.LBB21_89:
	bvs	.LBB21_90
; %bb.256:
	jmp	.LBB21_104
.LBB21_90:
	ldy	#9
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	lda	__rc24
	ldx	__rc25
	tay
	bne	.LBB21_92
; %bb.91:
	cpx	#0
	bne	.LBB21_92
; %bb.258:
	jmp	.LBB21_120
.LBB21_92:
	cmp	__rc27
	bne	.LBB21_94
; %bb.93:
	pha
	ldy	#11
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
	ldx	__rc25
	cpx	__rc3
	beq	.LBB21_96
.LBB21_94:
	cmp	__rc29
	beq	.LBB21_95
; %bb.260:
	jmp	.LBB21_117
.LBB21_95:
	ldy	__rc25
	cpy	__rc30
	beq	.LBB21_96
; %bb.262:
	jmp	.LBB21_121
.LBB21_96:
	ldx	#254
	pha
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	ldy	__rc25
	phy
	plx
	dey
	cpx	#0
	bne	.LBB21_98
; %bb.97:
	dec
.LBB21_98:
	ldx	#0
	cmp	#0
	bne	.LBB21_100
; %bb.99:
	cpy	#0
	bne	.LBB21_100
; %bb.264:
	jmp	.LBB21_123
.LBB21_100:
	ldx	__rc2
	beq	.LBB21_101
; %bb.266:
	jmp	.LBB21_132
.LBB21_101:
	pha
	tya
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	tax
	ldy	__rc26
	cpy	#16
	beq	.LBB21_102
; %bb.268:
	jmp	.LBB21_134
.LBB21_102:
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	and	#32
	ldy	#1
	tax
	bne	.LBB21_103
; %bb.270:
	jmp	.LBB21_142
.LBB21_103:
	ldx	#88
; %bb.218:
	jmp	.LBB21_143
.LBB21_104:
	ldx	#254
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc25
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc24
	ldy	#9
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
; %bb.220:
	jmp	.LBB21_123
.LBB21_105:
	ldx	__rc24
	cpx	__rc29
	bcc	.LBB21_106
; %bb.272:
	jmp	.LBB21_86
.LBB21_106:
	lda	#1
	bvs	.LBB21_108
; %bb.107:
	lda	#0
.LBB21_108:
	ldy	#8
	sta	(__rc0),y                       ; 1-byte Folded Spill
	clc
	lda	__rc0
	adc	#28
	pha
	lda	__rc1
	adc	#0
	sta	__rc3
	pla
	clc
	adc	__rc25
	sta	__rc2
	lda	__rc3
	adc	__rc24
	sta	__rc3
	lda	__rc25
	eor	#255
	sta	__rc4
	lda	__rc24
	eor	#255
	tay
	clc
	lda	__rc4
	adc	__rc30
	sta	__rc31
	tya
	adc	__rc29
	tay
	sec
	lda	#253
	sbc	__rc25
	sta	__rc4
	lda	#1
	sbc	__rc24
	sta	__rc5
	cpy	__rc5
	beq	.LBB21_109
; %bb.274:
	jmp	.LBB21_118
.LBB21_109:
	lda	__rc31
	cmp	__rc4
	bcc	.LBB21_111
.LBB21_110:
	ldy	__rc5
	ldx	__rc4
	stx	__rc31
.LBB21_111:
	ldx	__rc31
	sty	__rc4
	inx
	bne	.LBB21_113
; %bb.112:
	inc	__rc4
.LBB21_113:
	sty	__rc28
	lda	#48
	jsr	__memset
	clc
	lda	__rc31
	adc	__rc25
	sta	__rc25
	lda	__rc28
	adc	__rc24
	inc	__rc25
	bne	.LBB21_115
; %bb.114:
	inc
.LBB21_115:
	sta	__rc24
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc8
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc9
	ldy	#8
	lda	(__rc0),y                       ; 1-byte Folded Reload
	pha
	pla
	beq	.LBB21_119
; %bb.116:
	bit	__set_v
; %bb.222:
	jmp	.LBB21_87
.LBB21_117:
	ldx	#254
	pha
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	lda	__rc25
	bra	.LBB21_122
.LBB21_118:
	cpy	__rc5
	bcs	.LBB21_110
	bra	.LBB21_111
.LBB21_119:
	clv
; %bb.224:
	jmp	.LBB21_87
.LBB21_120:
	ldx	#254
	txa
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	#0
	bra	.LBB21_123
.LBB21_121:
	ldx	#254
	pha
	txa
	phy
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	tya
.LBB21_122:
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	tax
.LBB21_123:
	lda	__rc2
	bne	.LBB21_133
; %bb.124:
	ldy	__rc26
	cpy	#16
	bne	.LBB21_134
; %bb.125:
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	and	#32
	beq	.LBB21_127
; %bb.126:
	lda	#88
	bra	.LBB21_128
.LBB21_127:
	lda	#120
.LBB21_128:
	cpx	#1
	bne	.LBB21_130
; %bb.129:
	pha
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	tay
	pla
	cpy	#254
	sty	__rc3
	bra	.LBB21_131
.LBB21_130:
	cpx	#1
	pha
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	pla
.LBB21_131:
	stx	__rc4
	ldy	#1
	bcs	.LBB21_226
; %bb.276:
	jmp	.LBB21_144
.LBB21_226:
	jmp	.LBB21_165
.LBB21_132:
	pha
	tya
	ldy	#13
	sta	(__rc0),y                       ; 1-byte Folded Spill
	pla
	tax
.LBB21_133:
	ldy	__rc26
.LBB21_134:
	lda	__rc2
	bne	.LBB21_138
; %bb.135:
	cpy	#2
	bne	.LBB21_138
; %bb.136:
	cpx	#1
	bne	.LBB21_139
; %bb.137:
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	cmp	#254
	bra	.LBB21_140
.LBB21_138:
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc3
	stx	__rc4
	ldy	#1
; %bb.278:
	jmp	.LBB21_147
.LBB21_139:
	cpx	#1
.LBB21_140:
	ldy	#1
	bcc	.LBB21_141
; %bb.280:
	jmp	.LBB21_165
.LBB21_141:
	lda	#98
	pha
	phy
	ldy	#13
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc3
	pla
	stx	__rc4
	bra	.LBB21_144
.LBB21_142:
	ldx	#120
.LBB21_143:
	lda	__rc25
	clc
	adc	#254
	sta	__rc3
	lda	__rc24
	adc	#255
	sta	__rc4
	txa
.LBB21_144:
	tax
	clc
	lda	__rc0
	adc	#28
	pha
	lda	__rc1
	adc	#0
	sta	__rc2
	pla
	clc
	adc	__rc3
	sta	__rc6
	lda	__rc2
	adc	__rc4
	sta	__rc7
	inc	__rc3
	bne	.LBB21_146
; %bb.145:
	inc	__rc4
.LBB21_146:
	txa
	sta	(__rc6)
.LBB21_147:
	ldx	__rc4
	cpx	#1
	bne	.LBB21_149
; %bb.148:
	ldx	__rc3
	cpx	#254
	bcc	.LBB21_150
; %bb.228:
	jmp	.LBB21_165
.LBB21_149:
	ldx	__rc4
	cpx	#1
	bcc	.LBB21_150
; %bb.282:
	jmp	.LBB21_165
.LBB21_150:
	clc
	lda	__rc0
	adc	#28
	pha
	lda	__rc1
	adc	#0
	tax
	pla
	clc
	adc	__rc3
	phy
	ldy	#1
	bcs	.LBB21_152
; %bb.151:
	ldy	#0
.LBB21_152:
	sty	__rc5
	ply
	sta	__rc6
	lda	__rc4
	sta	__rc2
	inc	__rc3
	bne	.LBB21_154
; %bb.153:
	inc	__rc2
.LBB21_154:
	txa
	ldx	__rc5
	cpx	#1
	adc	__rc4
	sta	__rc7
	lda	#48
	sta	(__rc6)
.LBB21_155:
	ldx	__rc2
	cpx	#1
	bne	.LBB21_157
; %bb.156:
	ldx	__rc3
	cpx	#254
	bcc	.LBB21_158
; %bb.230:
	jmp	.LBB21_165
.LBB21_157:
	ldx	__rc2
	cpx	#1
	bcs	.LBB21_165
.LBB21_158:
	ldx	#45
	ldy	#10
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc4
	lda	__rc4
	bne	.LBB21_161
; %bb.159:
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	and	#4
	ldx	#43
	cmp	#0
	bne	.LBB21_161
; %bb.160:
	lda	(__rc0),y                       ; 1-byte Folded Reload
	and	#8
	ldx	#32
	tay
	beq	.LBB21_164
.LBB21_161:
	clc
	lda	__rc0
	adc	#28
	pha
	lda	__rc1
	adc	#0
	tay
	pla
	clc
	adc	__rc3
	sta	__rc4
	tya
	adc	__rc2
	sta	__rc5
	inc	__rc3
	bne	.LBB21_163
; %bb.162:
	inc	__rc2
.LBB21_163:
	txa
	sta	(__rc4)
.LBB21_164:
	lda	__rc3
	ldy	#16
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldy	__rc2
.LBB21_165:
	ldx	__rc8
	stx	__rc26
	ldx	__rc9
	stx	__rc27
	phy
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	sta	__rc2
	lda	__rc2
	beq	.LBB21_166
; %bb.284:
	jmp	.LBB21_180
.LBB21_166:
	phy
	ldy	#12
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	and	#1
	ldx	__rc8
	stx	__rc26
	ldx	__rc9
	stx	__rc27
	tax
	beq	.LBB21_167
; %bb.286:
	jmp	.LBB21_180
.LBB21_167:
	cpy	__rc29
	bne	.LBB21_169
; %bb.168:
	phy
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	cmp	__rc30
	bra	.LBB21_170
.LBB21_169:
	cpy	__rc29
.LBB21_170:
	ldx	__rc8
	stx	__rc26
	ldx	__rc9
	stx	__rc27
	bcc	.LBB21_171
; %bb.288:
	jmp	.LBB21_180
.LBB21_171:
	phy
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	lda	__rc8
	sta	__rc26
	lda	__rc9
	sta	__rc27
	sty	__rc24
.LBB21_172:                             ; =>This Inner Loop Header: Depth=1
	stx	__rc25
	ldx	__rc27
	lda	__rc26
	inc	__rc26
	bne	.LBB21_174
; %bb.173:                              ;   in Loop: Header=BB21_172 Depth=1
	inc	__rc27
.LBB21_174:                             ;   in Loop: Header=BB21_172 Depth=1
	phy
	ldy	__rc20
	sty	__rc18
	ldy	__rc21
	sty	__rc19
	ldy	__rc22
	sty	__rc2
	ldy	__rc23
	sty	__rc3
	ply
	stx	__rc4
	ldx	#255
	stx	__rc5
	stx	__rc6
	tax
	lda	#32
	sty	__rc28
	jsr	__call_indir
	ldx	__rc25
	ldy	__rc28
	inx
	bne	.LBB21_176
; %bb.175:                              ;   in Loop: Header=BB21_172 Depth=1
	iny
.LBB21_176:                             ;   in Loop: Header=BB21_172 Depth=1
	cpy	__rc29
	bne	.LBB21_178
; %bb.177:                              ;   in Loop: Header=BB21_172 Depth=1
	cpx	__rc30
	bcc	.LBB21_172
	bra	.LBB21_179
.LBB21_178:                             ;   in Loop: Header=BB21_172 Depth=1
	cpy	__rc29
	bcc	.LBB21_172
.LBB21_179:
	ldy	__rc24
.LBB21_180:
	phy
	ldy	#16
	lda	(__rc0),y                       ; 1-byte Folded Reload
	ply
	tax
	tya
	bne	.LBB21_182
; %bb.181:
	txa
	bne	.LBB21_182
; %bb.290:
	jmp	.LBB21_203
.LBB21_182:
	lda	__rc30
	phy
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ply
	stx	__rc2
	sty	__rc3
	ldx	__rc26
	stx	__rc24
	ldx	__rc27
	stx	__rc25
.LBB21_183:                             ; =>This Inner Loop Header: Depth=1
	clc
	lda	__rc0
	adc	#28
	pha
	lda	__rc1
	adc	#0
	tay
	pla
	clc
	adc	__rc2
	ldx	#1
	bcs	.LBB21_185
; %bb.184:                              ;   in Loop: Header=BB21_183 Depth=1
	ldx	#0
.LBB21_185:                             ;   in Loop: Header=BB21_183 Depth=1
	stx	__rc5
	sta	__rc4
	ldx	__rc2
	stx	__rc28
	ldx	__rc3
	stx	__rc31
	ldx	__rc28
	dec	__rc28
	cpx	#0
	bne	.LBB21_187
; %bb.186:                              ;   in Loop: Header=BB21_183 Depth=1
	dec	__rc31
.LBB21_187:                             ;   in Loop: Header=BB21_183 Depth=1
	tya
	ldx	__rc5
	cpx	#1
	adc	__rc3
	sta	__rc5
	ldx	__rc4
	dec	__rc4
	cpx	#0
	bne	.LBB21_189
; %bb.188:                              ;   in Loop: Header=BB21_183 Depth=1
	dec	__rc5
.LBB21_189:                             ;   in Loop: Header=BB21_183 Depth=1
	lda	(__rc4)
	inc	__rc24
	bne	.LBB21_191
; %bb.190:                              ;   in Loop: Header=BB21_183 Depth=1
	inc	__rc25
.LBB21_191:                             ;   in Loop: Header=BB21_183 Depth=1
	ldx	__rc20
	stx	__rc18
	ldx	__rc21
	stx	__rc19
	ldx	__rc22
	stx	__rc2
	ldx	__rc23
	stx	__rc3
	ldx	__rc27
	stx	__rc4
	ldx	#255
	stx	__rc5
	stx	__rc6
	ldx	__rc26
	jsr	__call_indir
	ldx	__rc24
	stx	__rc26
	ldx	__rc25
	stx	__rc27
	ldx	__rc28
	stx	__rc2
	ldx	__rc31
	stx	__rc3
	beq	.LBB21_192
; %bb.292:                              ;   in Loop: Header=BB21_183 Depth=1
	jmp	.LBB21_183
.LBB21_192:                             ;   in Loop: Header=BB21_183 Depth=1
	lda	__rc28
	beq	.LBB21_193
; %bb.294:                              ;   in Loop: Header=BB21_183 Depth=1
	jmp	.LBB21_183
.LBB21_193:
	ldy	#17
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc2
	lda	__rc2
	bne	.LBB21_194
; %bb.296:
	jmp	.LBB21_201
.LBB21_194:
	sec
	lda	__rc24
	pha
	ldy	#15
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc26
	pla
	sbc	__rc26
	tax
	lda	__rc25
	pha
	dey
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc27
	pla
	sbc	__rc27
	ldy	__rc29
	sty	__rc28
	cmp	__rc29
	beq	.LBB21_195
; %bb.298:
	jmp	.LBB21_202
.LBB21_195:
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
.LBB21_196:
	cpx	__rc29
	bcs	.LBB21_201
.LBB21_197:                             ; =>This Inner Loop Header: Depth=1
	ldx	__rc25
	lda	__rc24
	inc	__rc24
	bne	.LBB21_199
; %bb.198:                              ;   in Loop: Header=BB21_197 Depth=1
	inc	__rc25
.LBB21_199:                             ;   in Loop: Header=BB21_197 Depth=1
	ldy	__rc20
	sty	__rc18
	ldy	__rc21
	sty	__rc19
	ldy	__rc22
	sty	__rc2
	ldy	__rc23
	sty	__rc3
	stx	__rc4
	ldx	#255
	stx	__rc5
	stx	__rc6
	tax
	lda	#32
	jsr	__call_indir
	sec
	lda	__rc24
	sbc	__rc26
	tax
	lda	__rc25
	sbc	__rc27
	cmp	__rc28
	beq	.LBB21_196
; %bb.200:                              ;   in Loop: Header=BB21_197 Depth=1
	cmp	__rc28
	bcc	.LBB21_197
.LBB21_201:
	ldx	__rc25
	lda	__rc24
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
	adc	#26
	sta	__rc0
	lda	__rc1
	adc	#2
	sta	__rc1
	lda	__rc16
	rts
.LBB21_202:
	cmp	__rc28
	ldy	#19
	lda	(__rc0),y                       ; 1-byte Folded Reload
	sta	__rc29
	bcs	.LBB21_232
; %bb.300:
	jmp	.LBB21_197
.LBB21_232:
	jmp	.LBB21_201
.LBB21_203:
	lda	__rc30
	ldy	#19
	sta	(__rc0),y                       ; 1-byte Folded Spill
	ldx	__rc26
	stx	__rc24
	ldx	__rc27
	stx	__rc25
; %bb.234:
	jmp	.LBB21_193
.Lfunc_end21:
	.size	_ntoa, .Lfunc_end21-_ntoa
                                        ; -- End function
	.section	.text.strcpy,"ax",@progbits
	.type	strcpy,@function                ; -- Begin function strcpy
strcpy:                                 ; @strcpy
; %bb.0:
	lda	(__rc4)
	sta	(__rc2)
	lda	(__rc4)
	beq	.LBB22_7
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
.LBB22_2:                               ; =>This Inner Loop Header: Depth=1
	inc	__rc8
	bne	.LBB22_4
; %bb.3:                                ;   in Loop: Header=BB22_2 Depth=1
	inc	__rc9
.LBB22_4:                               ;   in Loop: Header=BB22_2 Depth=1
	lda	(__rc4),y
	sta	(__rc6),y
	lda	(__rc4),y
	inc	__rc6
	bne	.LBB22_6
; %bb.5:                                ;   in Loop: Header=BB22_2 Depth=1
	inc	__rc7
.LBB22_6:                               ;   in Loop: Header=BB22_2 Depth=1
	ldx	__rc8
	stx	__rc4
	ldx	__rc9
	stx	__rc5
	tax
	bne	.LBB22_2
.LBB22_7:
	rts
.Lfunc_end22:
	.size	strcpy, .Lfunc_end22-strcpy
                                        ; -- End function
	.section	.text.strlen,"ax",@progbits
	.type	strlen,@function                ; -- Begin function strlen
strlen:                                 ; @strlen
; %bb.0:
	lda	(__rc2)
	beq	.LBB23_5
; %bb.1:
	lda	#0
	ldy	#1
	stz	__rc4
	tax
	stz	__rc5
.LBB23_2:                               ; =>This Inner Loop Header: Depth=1
	clc
	adc	__rc2
	sta	__rc6
	lda	__rc5
	adc	__rc3
	inc	__rc4
	bne	.LBB23_4
; %bb.3:                                ;   in Loop: Header=BB23_2 Depth=1
	inx
.LBB23_4:                               ;   in Loop: Header=BB23_2 Depth=1
	sta	__rc7
	lda	(__rc6),y
	sta	__rc6
	lda	__rc4
	stx	__rc5
	inc	__rc6
	dec	__rc6
	bne	.LBB23_2
	bra	.LBB23_6
.LBB23_5:
	stz	__rc4
	ldx	#0
.LBB23_6:
	lda	__rc4
	rts
.Lfunc_end23:
	.size	strlen, .Lfunc_end23-strlen
                                        ; -- End function
	.section	.text.__ashlqi3,"ax",@progbits
	.globl	__ashlqi3                       ; -- Begin function __ashlqi3
	.type	__ashlqi3,@function
__ashlqi3:                              ; @__ashlqi3
; %bb.0:
	bra	.LBB24_2
.LBB24_1:                               ;   in Loop: Header=BB24_2 Depth=1
	dex
	asl
.LBB24_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB24_1
; %bb.3:
	rts
.Lfunc_end24:
	.size	__ashlqi3, .Lfunc_end24-__ashlqi3
                                        ; -- End function
	.section	.text.__ashlhi3,"ax",@progbits
	.globl	__ashlhi3                       ; -- Begin function __ashlhi3
	.type	__ashlhi3,@function
__ashlhi3:                              ; @__ashlhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB25_3
; %bb.1:
	ldx	__rc2
.LBB25_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc3
	cpx	#0
	bne	.LBB25_2
.LBB25_3:
	ldx	__rc3
	rts
.Lfunc_end25:
	.size	__ashlhi3, .Lfunc_end25-__ashlhi3
                                        ; -- End function
	.section	.text.__ashlsi3,"ax",@progbits
	.globl	__ashlsi3                       ; -- Begin function __ashlsi3
	.type	__ashlsi3,@function
__ashlsi3:                              ; @__ashlsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB26_3
; %bb.1:
	ldx	__rc4
.LBB26_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	asl
	rol	__rc5
	rol	__rc2
	rol	__rc3
	cpx	#0
	bne	.LBB26_2
.LBB26_3:
	ldx	__rc5
	rts
.Lfunc_end26:
	.size	__ashlsi3, .Lfunc_end26-__ashlsi3
                                        ; -- End function
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       ; -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              ; @__ashldi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB27_3
; %bb.1:
	ldx	__rc8
.LBB27_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB27_2
.LBB27_3:
	ldx	__rc9
	rts
.Lfunc_end27:
	.size	__ashldi3, .Lfunc_end27-__ashldi3
                                        ; -- End function
	.section	.text.__lshrqi3,"ax",@progbits
	.globl	__lshrqi3                       ; -- Begin function __lshrqi3
	.type	__lshrqi3,@function
__lshrqi3:                              ; @__lshrqi3
; %bb.0:
	bra	.LBB28_2
.LBB28_1:                               ;   in Loop: Header=BB28_2 Depth=1
	dex
	lsr
.LBB28_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB28_1
; %bb.3:
	rts
.Lfunc_end28:
	.size	__lshrqi3, .Lfunc_end28-__lshrqi3
                                        ; -- End function
	.section	.text.__lshrhi3,"ax",@progbits
	.globl	__lshrhi3                       ; -- Begin function __lshrhi3
	.type	__lshrhi3,@function
__lshrhi3:                              ; @__lshrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB29_3
; %bb.1:
	ldx	__rc2
.LBB29_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror
	cpx	#0
	bne	.LBB29_2
.LBB29_3:
	ldx	__rc3
	rts
.Lfunc_end29:
	.size	__lshrhi3, .Lfunc_end29-__lshrhi3
                                        ; -- End function
	.section	.text.__lshrsi3,"ax",@progbits
	.globl	__lshrsi3                       ; -- Begin function __lshrsi3
	.type	__lshrsi3,@function
__lshrsi3:                              ; @__lshrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB30_3
; %bb.1:
	ldx	__rc4
.LBB30_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	lsr	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB30_2
.LBB30_3:
	ldx	__rc5
	rts
.Lfunc_end30:
	.size	__lshrsi3, .Lfunc_end30-__lshrsi3
                                        ; -- End function
	.section	.text.__lshrdi3,"ax",@progbits
	.globl	__lshrdi3                       ; -- Begin function __lshrdi3
	.type	__lshrdi3,@function
__lshrdi3:                              ; @__lshrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB31_3
; %bb.1:
	ldx	__rc8
.LBB31_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB31_2
.LBB31_3:
	ldx	__rc9
	rts
.Lfunc_end31:
	.size	__lshrdi3, .Lfunc_end31-__lshrdi3
                                        ; -- End function
	.section	.text.__ashrqi3,"ax",@progbits
	.globl	__ashrqi3                       ; -- Begin function __ashrqi3
	.type	__ashrqi3,@function
__ashrqi3:                              ; @__ashrqi3
; %bb.0:
	bra	.LBB32_2
.LBB32_1:                               ;   in Loop: Header=BB32_2 Depth=1
	dex
	cmp	#128
	ror
.LBB32_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB32_1
; %bb.3:
	rts
.Lfunc_end32:
	.size	__ashrqi3, .Lfunc_end32-__ashrqi3
                                        ; -- End function
	.section	.text.__ashrhi3,"ax",@progbits
	.globl	__ashrhi3                       ; -- Begin function __ashrhi3
	.type	__ashrhi3,@function
__ashrhi3:                              ; @__ashrhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB33_3
; %bb.1:
	ldx	__rc2
.LBB33_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc3
	cpx	#0
	bne	.LBB33_2
.LBB33_3:
	tax
	lda	__rc3
	rts
.Lfunc_end33:
	.size	__ashrhi3, .Lfunc_end33-__ashrhi3
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
	beq	.LBB34_3
; %bb.1:
	ldx	__rc4
.LBB34_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	ror
	ror	__rc2
	ror	__rc5
	ror	__rc6
	cpx	#0
	bne	.LBB34_2
.LBB34_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end34:
	.size	__ashrsi3, .Lfunc_end34-__ashrsi3
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
	beq	.LBB35_3
; %bb.1:
	ldx	__rc8
.LBB35_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB35_2
.LBB35_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end35:
	.size	__ashrdi3, .Lfunc_end35-__ashrdi3
                                        ; -- End function
	.section	.text.__rotlqi3,"ax",@progbits
	.globl	__rotlqi3                       ; -- Begin function __rotlqi3
	.type	__rotlqi3,@function
__rotlqi3:                              ; @__rotlqi3
; %bb.0:
	bra	.LBB36_2
.LBB36_1:                               ;   in Loop: Header=BB36_2 Depth=1
	dex
	cmp	#128
	rol
.LBB36_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB36_1
; %bb.3:
	rts
.Lfunc_end36:
	.size	__rotlqi3, .Lfunc_end36-__rotlqi3
                                        ; -- End function
	.section	.text.__rotlhi3,"ax",@progbits
	.globl	__rotlhi3                       ; -- Begin function __rotlhi3
	.type	__rotlhi3,@function
__rotlhi3:                              ; @__rotlhi3
; %bb.0:
	sta	__rc3
	txa
	ldx	__rc2
	beq	.LBB37_3
; %bb.1:
	ldx	__rc2
.LBB37_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc3
	rol
	cpx	#0
	bne	.LBB37_2
.LBB37_3:
	tax
	lda	__rc3
	rts
.Lfunc_end37:
	.size	__rotlhi3, .Lfunc_end37-__rotlhi3
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
	beq	.LBB38_3
; %bb.1:
	ldx	__rc4
.LBB38_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	cmp	#128
	rol	__rc6
	rol	__rc5
	rol	__rc2
	rol
	cpx	#0
	bne	.LBB38_2
.LBB38_3:
	sta	__rc3
	ldx	__rc5
	lda	__rc6
	rts
.Lfunc_end38:
	.size	__rotlsi3, .Lfunc_end38-__rotlsi3
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
	beq	.LBB39_3
; %bb.1:
	ldx	__rc8
.LBB39_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB39_2
.LBB39_3:
	sta	__rc7
	ldx	__rc9
	lda	__rc10
	rts
.Lfunc_end39:
	.size	__rotldi3, .Lfunc_end39-__rotldi3
                                        ; -- End function
	.section	.text.__rotrqi3,"ax",@progbits
	.globl	__rotrqi3                       ; -- Begin function __rotrqi3
	.type	__rotrqi3,@function
__rotrqi3:                              ; @__rotrqi3
; %bb.0:
	bra	.LBB40_2
.LBB40_1:                               ;   in Loop: Header=BB40_2 Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror
.LBB40_2:                               ; =>This Inner Loop Header: Depth=1
	cpx	#0
	bne	.LBB40_1
; %bb.3:
	rts
.Lfunc_end40:
	.size	__rotrqi3, .Lfunc_end40-__rotrqi3
                                        ; -- End function
	.section	.text.__rotrhi3,"ax",@progbits
	.globl	__rotrhi3                       ; -- Begin function __rotrhi3
	.type	__rotrhi3,@function
__rotrhi3:                              ; @__rotrhi3
; %bb.0:
	stx	__rc3
	ldx	__rc2
	beq	.LBB41_3
; %bb.1:
	ldx	__rc2
.LBB41_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc2
	ror	__rc2
	ror	__rc3
	ror
	cpx	#0
	bne	.LBB41_2
.LBB41_3:
	ldx	__rc3
	rts
.Lfunc_end41:
	.size	__rotrhi3, .Lfunc_end41-__rotrhi3
                                        ; -- End function
	.section	.text.__rotrsi3,"ax",@progbits
	.globl	__rotrsi3                       ; -- Begin function __rotrsi3
	.type	__rotrsi3,@function
__rotrsi3:                              ; @__rotrsi3
; %bb.0:
	stx	__rc5
	ldx	__rc4
	beq	.LBB42_3
; %bb.1:
	ldx	__rc4
.LBB42_2:                               ; =>This Inner Loop Header: Depth=1
	dex
	sta	__rc4
	ror	__rc4
	ror	__rc3
	ror	__rc2
	ror	__rc5
	ror
	cpx	#0
	bne	.LBB42_2
.LBB42_3:
	ldx	__rc5
	rts
.Lfunc_end42:
	.size	__rotrsi3, .Lfunc_end42-__rotrsi3
                                        ; -- End function
	.section	.text.__rotrdi3,"ax",@progbits
	.globl	__rotrdi3                       ; -- Begin function __rotrdi3
	.type	__rotrdi3,@function
__rotrdi3:                              ; @__rotrdi3
; %bb.0:
	stx	__rc9
	ldx	__rc8
	beq	.LBB43_3
; %bb.1:
	ldx	__rc8
.LBB43_2:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB43_2
.LBB43_3:
	ldx	__rc9
	rts
.Lfunc_end43:
	.size	__rotrdi3, .Lfunc_end43-__rotrdi3
                                        ; -- End function
	.section	.text.__mulqi3,"ax",@progbits
	.globl	__mulqi3                        ; -- Begin function __mulqi3
	.type	__mulqi3,@function
__mulqi3:                               ; @__mulqi3
; %bb.0:
	cpx	#0
	beq	.LBB44_6
; %bb.1:
	sta	__rc2
	stx	__rc3
	lda	#0
.LBB44_2:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	bcc	.LBB44_4
; %bb.3:                                ;   in Loop: Header=BB44_2 Depth=1
	clc
	adc	__rc2
.LBB44_4:                               ;   in Loop: Header=BB44_2 Depth=1
	asl	__rc2
	ldx	__rc3
	bne	.LBB44_2
; %bb.5:
	rts
.LBB44_6:
	lda	#0
	rts
.Lfunc_end44:
	.size	__mulqi3, .Lfunc_end44-__mulqi3
                                        ; -- End function
	.section	.text.__mulhi3,"ax",@progbits
	.globl	__mulhi3                        ; -- Begin function __mulhi3
	.type	__mulhi3,@function
__mulhi3:                               ; @__mulhi3
; %bb.0:
	ldy	__rc3
	bne	.LBB45_2
; %bb.1:
	ldy	__rc2
	beq	.LBB45_7
.LBB45_2:
	sta	__rc4
	stx	__rc5
	ldy	#0
	tya
.LBB45_3:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc3
	ror	__rc2
	bcc	.LBB45_5
; %bb.4:                                ;   in Loop: Header=BB45_3 Depth=1
	tax
	tya
	clc
	adc	__rc4
	tay
	txa
	adc	__rc5
.LBB45_5:                               ;   in Loop: Header=BB45_3 Depth=1
	asl	__rc4
	rol	__rc5
	ldx	__rc3
	bne	.LBB45_3
; %bb.6:                                ;   in Loop: Header=BB45_3 Depth=1
	ldx	__rc2
	bne	.LBB45_3
	bra	.LBB45_8
.LBB45_7:
	ldy	#0
	tya
.LBB45_8:
	tax
	tya
	rts
.Lfunc_end45:
	.size	__mulhi3, .Lfunc_end45-__mulhi3
                                        ; -- End function
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        ; -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               ; @__mulsi3
; %bb.0:
	ldy	__rc7
	bne	.LBB46_4
; %bb.1:
	ldy	__rc6
	bne	.LBB46_4
; %bb.2:
	ldy	__rc5
	bne	.LBB46_4
; %bb.3:
	ldy	__rc4
	bne	.LBB46_4
; %bb.13:
	jmp	.LBB46_12
.LBB46_4:
	sta	__rc8
	stx	__rc9
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
.LBB46_5:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc6
	ror	__rc5
	ror	__rc4
	bcc	.LBB46_7
; %bb.6:                                ;   in Loop: Header=BB46_5 Depth=1
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
.LBB46_7:                               ;   in Loop: Header=BB46_5 Depth=1
	asl	__rc8
	rol	__rc9
	rol	__rc2
	rol	__rc3
	inc	__rc7
	dec	__rc7
	bne	.LBB46_5
; %bb.8:                                ;   in Loop: Header=BB46_5 Depth=1
	inc	__rc6
	dec	__rc6
	bne	.LBB46_5
; %bb.9:                                ;   in Loop: Header=BB46_5 Depth=1
	inc	__rc5
	dec	__rc5
	bne	.LBB46_5
; %bb.10:                               ;   in Loop: Header=BB46_5 Depth=1
	inc	__rc4
	dec	__rc4
	bne	.LBB46_5
.LBB46_11:
	phy
	ldy	__rc10
	sty	__rc2
	ply
	sta	__rc3
	tya
	rts
.LBB46_12:
	ldy	#0
	ldx	#0
	stz	__rc10
	tya
	bra	.LBB46_11
.Lfunc_end46:
	.size	__mulsi3, .Lfunc_end46-__mulsi3
                                        ; -- End function
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        ; -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               ; @__muldi3
; %bb.0:
	ldy	__rc15
	bne	.LBB47_8
; %bb.1:
	ldy	__rc14
	bne	.LBB47_8
; %bb.2:
	ldy	__rc13
	bne	.LBB47_8
; %bb.3:
	ldy	__rc12
	bne	.LBB47_8
; %bb.4:
	ldy	__rc11
	bne	.LBB47_8
; %bb.5:
	ldy	__rc10
	bne	.LBB47_8
; %bb.6:
	ldy	__rc9
	bne	.LBB47_8
; %bb.7:
	ldy	__rc8
	bne	.LBB47_8
; %bb.21:
	jmp	.LBB47_20
.LBB47_8:
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
.LBB47_9:                               ; =>This Inner Loop Header: Depth=1
	lsr	__rc15
	ror	__rc14
	ror	__rc13
	ror	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ror	__rc8
	bcc	.LBB47_11
; %bb.10:                               ;   in Loop: Header=BB47_9 Depth=1
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
.LBB47_11:                              ;   in Loop: Header=BB47_9 Depth=1
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
	beq	.LBB47_12
; %bb.23:                               ;   in Loop: Header=BB47_9 Depth=1
	jmp	.LBB47_9
.LBB47_12:                              ;   in Loop: Header=BB47_9 Depth=1
	inc	__rc14
	dec	__rc14
	beq	.LBB47_13
; %bb.25:                               ;   in Loop: Header=BB47_9 Depth=1
	jmp	.LBB47_9
.LBB47_13:                              ;   in Loop: Header=BB47_9 Depth=1
	inc	__rc13
	dec	__rc13
	beq	.LBB47_14
; %bb.27:                               ;   in Loop: Header=BB47_9 Depth=1
	jmp	.LBB47_9
.LBB47_14:                              ;   in Loop: Header=BB47_9 Depth=1
	inc	__rc12
	dec	__rc12
	beq	.LBB47_15
; %bb.29:                               ;   in Loop: Header=BB47_9 Depth=1
	jmp	.LBB47_9
.LBB47_15:                              ;   in Loop: Header=BB47_9 Depth=1
	inc	__rc11
	dec	__rc11
	beq	.LBB47_16
; %bb.31:                               ;   in Loop: Header=BB47_9 Depth=1
	jmp	.LBB47_9
.LBB47_16:                              ;   in Loop: Header=BB47_9 Depth=1
	inc	__rc10
	dec	__rc10
	beq	.LBB47_17
; %bb.33:                               ;   in Loop: Header=BB47_9 Depth=1
	jmp	.LBB47_9
.LBB47_17:                              ;   in Loop: Header=BB47_9 Depth=1
	inc	__rc9
	dec	__rc9
	beq	.LBB47_18
; %bb.35:                               ;   in Loop: Header=BB47_9 Depth=1
	jmp	.LBB47_9
.LBB47_18:                              ;   in Loop: Header=BB47_9 Depth=1
	inc	__rc8
	dec	__rc8
	beq	.LBB47_19
; %bb.37:                               ;   in Loop: Header=BB47_9 Depth=1
	jmp	.LBB47_9
.LBB47_19:
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
.LBB47_20:
	ldy	#0
	ldx	#0
	stz	mos8(.L__muldi3_zp_stk)
	stz	mos8(.L__muldi3_zp_stk+1)
	stz	mos8(.L__muldi3_zp_stk+2)
	stz	mos8(.L__muldi3_zp_stk+3)
	stz	mos8(.L__muldi3_zp_stk+4)
	tya
	bra	.LBB47_19
.Lfunc_end47:
	.size	__muldi3, .Lfunc_end47-__muldi3
                                        ; -- End function
	.section	.text.__udivqi3,"ax",@progbits
	.globl	__udivqi3                       ; -- Begin function __udivqi3
	.type	__udivqi3,@function
__udivqi3:                              ; @__udivqi3
; %bb.0:
	tay
	lda	#0
	cpx	#0
	bne	.LBB48_1
; %bb.15:
	jmp	.LBB48_14
.LBB48_1:
	stx	__rc3
	cpy	__rc3
	bcs	.LBB48_2
; %bb.17:
	jmp	.LBB48_14
.LBB48_2:
	lda	#1
	ldx	__rc3
	bpl	.LBB48_3
; %bb.19:
	jmp	.LBB48_14
.LBB48_3:
	sty	__rc5
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB48_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB48_6
; %bb.5:                                ;   in Loop: Header=BB48_4 Depth=1
	lda	__rc5
	cmp	__rc2
	lda	#1
	bcc	.LBB48_8
	bra	.LBB48_7
.LBB48_6:                               ;   in Loop: Header=BB48_4 Depth=1
	cpy	__rc4
	bcc	.LBB48_8
.LBB48_7:                               ;   in Loop: Header=BB48_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB48_4
	bra	.LBB48_9
.LBB48_8:
	ldy	__rc3
	sty	__rc2
.LBB48_9:
	cpx	#0
	beq	.LBB48_14
; %bb.10:
	sec
	lda	__rc5
	sbc	__rc2
	sta	__rc3
	lda	#1
.LBB48_11:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	asl
	tay
	lda	__rc3
	cmp	__rc2
	bcc	.LBB48_13
; %bb.12:                               ;   in Loop: Header=BB48_11 Depth=1
	tya
	ora	#1
	tay
	sec
	lda	__rc3
	sbc	__rc2
	sta	__rc3
.LBB48_13:                              ;   in Loop: Header=BB48_11 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB48_11
.LBB48_14:
	rts
.Lfunc_end48:
	.size	__udivqi3, .Lfunc_end48-__udivqi3
                                        ; -- End function
	.section	.text.__udivhi3,"ax",@progbits
	.globl	__udivhi3                       ; -- Begin function __udivhi3
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; %bb.0:
	stz	__rc4
	ldy	__rc3
	bne	.LBB49_2
; %bb.1:
	ldy	__rc2
	beq	.LBB49_4
.LBB49_2:
	sta	__rc7
	txa
	cpx	__rc3
	bne	.LBB49_5
; %bb.3:
	lda	__rc7
	cmp	__rc2
	txa
	bcs	.LBB49_6
.LBB49_4:
	ldx	#0
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
; %bb.23:
	jmp	.LBB49_22
.LBB49_5:
	cmp	__rc3
	bcc	.LBB49_4
.LBB49_6:
	ldx	#1
	stx	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc3
	bpl	.LBB49_7
; %bb.25:
	jmp	.LBB49_22
.LBB49_7:
	ldx	#0
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB49_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc5
	rol	__rc6
	cmp	__rc6
	bne	.LBB49_10
; %bb.9:                                ;   in Loop: Header=BB49_8 Depth=1
	ldy	__rc7
	cpy	__rc5
	bcc	.LBB49_12
	bra	.LBB49_11
.LBB49_10:                              ;   in Loop: Header=BB49_8 Depth=1
	cmp	__rc6
	bcc	.LBB49_12
.LBB49_11:                              ;   in Loop: Header=BB49_8 Depth=1
	inx
	ldy	__rc5
	sty	__rc2
	ldy	__rc6
	sty	__rc3
	bpl	.LBB49_8
	bra	.LBB49_13
.LBB49_12:
	ldy	__rc2
	sty	__rc5
	ldy	__rc3
	sty	__rc6
.LBB49_13:
	cpx	#0
	bne	.LBB49_14
; %bb.27:
	jmp	.LBB49_22
.LBB49_14:
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
.LBB49_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc6
	ror	__rc5
	ldy	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB49_17
; %bb.16:                               ;   in Loop: Header=BB49_15 Depth=1
	ldy	#0
.LBB49_17:                              ;   in Loop: Header=BB49_15 Depth=1
	sty	__rc7
	ldy	__rc3
	sty	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc6
	bne	.LBB49_21
; %bb.18:                               ;   in Loop: Header=BB49_15 Depth=1
	ldy	__rc2
	cpy	__rc5
	bcc	.LBB49_20
.LBB49_19:                              ;   in Loop: Header=BB49_15 Depth=1
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
.LBB49_20:                              ;   in Loop: Header=BB49_15 Depth=1
	ldy	__rc7
	cpy	#1
	rol	__rc4
	dex
	bne	.LBB49_15
	bra	.LBB49_22
.LBB49_21:                              ;   in Loop: Header=BB49_15 Depth=1
	cmp	__rc6
	bcs	.LBB49_19
	bra	.LBB49_20
.LBB49_22:
	ldx	__rc4
	lda	mos8(.L__udivhi3_zp_stk)        ; 1-byte Folded Reload
	rts
.Lfunc_end49:
	.size	__udivhi3, .Lfunc_end49-__udivhi3
                                        ; -- End function
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       ; -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              ; @__udivsi3
; %bb.0:
	stz	__rc8
	ldy	__rc7
	bne	.LBB50_4
; %bb.1:
	ldy	__rc6
	bne	.LBB50_4
; %bb.2:
	ldy	__rc5
	bne	.LBB50_4
; %bb.3:
	ldy	__rc4
	beq	.LBB50_9
.LBB50_4:
	stx	__rc14
	ldx	__rc2
	stx	__rc15
	ldx	__rc3
	stx	__rc18
	cpx	__rc7
	bne	.LBB50_8
; %bb.5:
	ldx	__rc2
	cpx	__rc6
	bne	.LBB50_10
; %bb.6:
	ldx	__rc14
	cpx	__rc5
	beq	.LBB50_7
; %bb.45:
	jmp	.LBB50_38
.LBB50_7:
	cmp	__rc4
	bcc	.LBB50_9
	bra	.LBB50_11
.LBB50_8:
	cpx	__rc7
	bcs	.LBB50_11
.LBB50_9:
	ldx	#0
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
; %bb.39:
	jmp	.LBB50_21
.LBB50_10:
	cpx	__rc6
	bcc	.LBB50_9
.LBB50_11:
	ldx	#1
	stx	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	ldx	__rc7
	bpl	.LBB50_12
; %bb.47:
	jmp	.LBB50_21
.LBB50_12:
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
.LBB50_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc9
	rol	__rc10
	rol	__rc11
	rol	__rc12
	ldy	__rc18
	cpy	__rc12
	bne	.LBB50_17
; %bb.14:                               ;   in Loop: Header=BB50_13 Depth=1
	ldy	__rc2
	cpy	__rc11
	bne	.LBB50_18
; %bb.15:                               ;   in Loop: Header=BB50_13 Depth=1
	cmp	__rc10
	bne	.LBB50_19
; %bb.16:                               ;   in Loop: Header=BB50_13 Depth=1
	ldy	__rc13
	cpy	__rc9
	bcc	.LBB50_23
	bra	.LBB50_20
.LBB50_17:                              ;   in Loop: Header=BB50_13 Depth=1
	cpy	__rc12
	bcc	.LBB50_23
	bra	.LBB50_20
.LBB50_18:                              ;   in Loop: Header=BB50_13 Depth=1
	cpy	__rc11
	bcc	.LBB50_23
	bra	.LBB50_20
.LBB50_19:                              ;   in Loop: Header=BB50_13 Depth=1
	cmp	__rc10
	bcc	.LBB50_23
.LBB50_20:                              ;   in Loop: Header=BB50_13 Depth=1
	inx
	ldy	__rc9
	sty	__rc4
	ldy	__rc10
	sty	__rc5
	ldy	__rc11
	sty	__rc6
	ldy	__rc12
	sty	__rc7
	bpl	.LBB50_13
	bra	.LBB50_24
.LBB50_21:
	stz	__rc2
	stz	__rc3
.LBB50_22:
	ldx	__rc8
	lda	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	rts
.LBB50_23:
	ldy	__rc4
	sty	__rc9
	ldy	__rc5
	sty	__rc10
	ldy	__rc6
	sty	__rc11
	ldy	__rc7
	sty	__rc12
.LBB50_24:
	stz	__rc2
	stz	__rc3
	txa
	beq	.LBB50_22
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
.LBB50_26:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc12
	ror	__rc11
	ror	__rc10
	ror	__rc9
	ldy	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	ldy	#1
	bcs	.LBB50_28
; %bb.27:                               ;   in Loop: Header=BB50_26 Depth=1
	ldy	#0
.LBB50_28:                              ;   in Loop: Header=BB50_26 Depth=1
	sty	__rc13
	ldy	__rc6
	sty	mos8(.L__udivsi3_zp_stk)        ; 1-byte Folded Spill
	cmp	__rc12
	bne	.LBB50_32
; %bb.29:                               ;   in Loop: Header=BB50_26 Depth=1
	sta	__rc6
	ldy	__rc5
	lda	__rc7
	cpy	__rc11
	bne	.LBB50_34
; %bb.30:                               ;   in Loop: Header=BB50_26 Depth=1
	cmp	__rc10
	bne	.LBB50_37
; %bb.31:                               ;   in Loop: Header=BB50_26 Depth=1
	ldy	__rc4
	cpy	__rc9
	bcc	.LBB50_33
	bra	.LBB50_35
.LBB50_32:                              ;   in Loop: Header=BB50_26 Depth=1
	sta	__rc6
	cmp	__rc12
	lda	__rc7
	bcs	.LBB50_35
.LBB50_33:                              ;   in Loop: Header=BB50_26 Depth=1
	lda	__rc6
	bra	.LBB50_36
.LBB50_34:                              ;   in Loop: Header=BB50_26 Depth=1
	cpy	__rc11
	bcc	.LBB50_33
.LBB50_35:                              ;   in Loop: Header=BB50_26 Depth=1
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
.LBB50_36:                              ;   in Loop: Header=BB50_26 Depth=1
	ldy	__rc13
	cpy	#1
	rol	__rc8
	rol	__rc2
	rol	__rc3
	dex
	beq	.LBB50_41
; %bb.49:                               ;   in Loop: Header=BB50_26 Depth=1
	jmp	.LBB50_26
.LBB50_41:
	jmp	.LBB50_22
.LBB50_37:                              ;   in Loop: Header=BB50_26 Depth=1
	cmp	__rc10
	bcc	.LBB50_33
	bra	.LBB50_35
.LBB50_38:
	cpx	__rc5
	bcs	.LBB50_43
; %bb.51:
	jmp	.LBB50_9
.LBB50_43:
	jmp	.LBB50_11
.Lfunc_end50:
	.size	__udivsi3, .Lfunc_end50-__udivsi3
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
	bne	.LBB51_8
; %bb.1:
	ldx	__rc14
	bne	.LBB51_8
; %bb.2:
	ldx	__rc13
	bne	.LBB51_8
; %bb.3:
	ldx	__rc12
	bne	.LBB51_8
; %bb.4:
	ldx	__rc11
	bne	.LBB51_8
; %bb.5:
	ldx	__rc10
	bne	.LBB51_8
; %bb.6:
	ldx	__rc9
	bne	.LBB51_8
; %bb.7:
	ldx	__rc8
	beq	.LBB51_17
.LBB51_8:
	ldx	__rc6
	stx	mos8(.L__udivdi3_zp_stk+7)
	ldx	__rc7
	stx	mos8(.L__udivdi3_zp_stk+13)     ; 1-byte Folded Spill
	cpx	__rc15
	bne	.LBB51_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB51_18
; %bb.10:
	ldx	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpx	__rc13
	beq	.LBB51_11
; %bb.90:
	jmp	.LBB51_31
.LBB51_11:
	ldx	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpx	__rc12
	beq	.LBB51_12
; %bb.92:
	jmp	.LBB51_32
.LBB51_12:
	ldx	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpx	__rc11
	beq	.LBB51_13
; %bb.94:
	jmp	.LBB51_38
.LBB51_13:
	ldx	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpx	__rc10
	beq	.LBB51_14
; %bb.96:
	jmp	.LBB51_40
.LBB51_14:
	ldx	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpx	__rc9
	beq	.LBB51_15
; %bb.98:
	jmp	.LBB51_42
.LBB51_15:
	cmp	__rc8
	bcc	.LBB51_17
	bra	.LBB51_19
.LBB51_16:
	cpx	__rc15
	bcs	.LBB51_19
.LBB51_17:
	lda	#0
; %bb.66:
	jmp	.LBB51_29
.LBB51_18:
	cpx	__rc14
	bcc	.LBB51_17
.LBB51_19:
	sta	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Spill
	lda	#1
	ldx	__rc15
	bpl	.LBB51_20
; %bb.100:
	jmp	.LBB51_29
.LBB51_20:
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
.LBB51_21:                              ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB51_25
; %bb.22:                               ;   in Loop: Header=BB51_21 Depth=1
	ldy	__rc6
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bne	.LBB51_26
; %bb.23:                               ;   in Loop: Header=BB51_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+8)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bne	.LBB51_27
; %bb.24:                               ;   in Loop: Header=BB51_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+9)      ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bne	.LBB51_102
; %bb.150:                              ;   in Loop: Header=BB51_21 Depth=1
	jmp	.LBB51_33
.LBB51_102:                             ;   in Loop: Header=BB51_21 Depth=1
	jmp	.LBB51_37
.LBB51_25:                              ;   in Loop: Header=BB51_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcs	.LBB51_28
; %bb.104:
	jmp	.LBB51_44
.LBB51_26:                              ;   in Loop: Header=BB51_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB51_28
; %bb.106:
	jmp	.LBB51_44
.LBB51_27:                              ;   in Loop: Header=BB51_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcs	.LBB51_28
; %bb.108:
	jmp	.LBB51_44
.LBB51_28:                              ;   in Loop: Header=BB51_21 Depth=1
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
	bmi	.LBB51_68
; %bb.110:                              ;   in Loop: Header=BB51_21 Depth=1
	jmp	.LBB51_21
.LBB51_68:
	jmp	.LBB51_45
.LBB51_29:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
.LBB51_30:
	ldx	__rc18
	rts
.LBB51_31:
	cpx	__rc13
	bcs	.LBB51_70
; %bb.112:
	jmp	.LBB51_17
.LBB51_70:
	jmp	.LBB51_19
.LBB51_32:
	cpx	__rc12
	bcs	.LBB51_72
; %bb.114:
	jmp	.LBB51_17
.LBB51_72:
	jmp	.LBB51_19
.LBB51_33:                              ;   in Loop: Header=BB51_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+10)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bne	.LBB51_39
; %bb.34:                               ;   in Loop: Header=BB51_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+11)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bne	.LBB51_41
; %bb.35:                               ;   in Loop: Header=BB51_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+12)     ; 1-byte Folded Reload
	cpy	mos8(.L__udivdi3_zp_stk)
	bne	.LBB51_43
; %bb.36:                               ;   in Loop: Header=BB51_21 Depth=1
	ldy	mos8(.L__udivdi3_zp_stk+14)     ; 1-byte Folded Reload
	cpy	__rc19
	bcc	.LBB51_44
; %bb.74:                               ;   in Loop: Header=BB51_21 Depth=1
	jmp	.LBB51_28
.LBB51_37:                              ;   in Loop: Header=BB51_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB51_44
; %bb.76:                               ;   in Loop: Header=BB51_21 Depth=1
	jmp	.LBB51_28
.LBB51_38:
	cpx	__rc11
	bcs	.LBB51_78
; %bb.116:
	jmp	.LBB51_17
.LBB51_78:
	jmp	.LBB51_19
.LBB51_39:                              ;   in Loop: Header=BB51_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB51_44
; %bb.80:                               ;   in Loop: Header=BB51_21 Depth=1
	jmp	.LBB51_28
.LBB51_40:
	cpx	__rc10
	bcs	.LBB51_82
; %bb.118:
	jmp	.LBB51_17
.LBB51_82:
	jmp	.LBB51_19
.LBB51_41:                              ;   in Loop: Header=BB51_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB51_44
; %bb.84:                               ;   in Loop: Header=BB51_21 Depth=1
	jmp	.LBB51_28
.LBB51_42:
	cpx	__rc9
	bcs	.LBB51_86
; %bb.120:
	jmp	.LBB51_17
.LBB51_86:
	jmp	.LBB51_19
.LBB51_43:                              ;   in Loop: Header=BB51_21 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB51_44
; %bb.122:                              ;   in Loop: Header=BB51_21 Depth=1
	jmp	.LBB51_28
.LBB51_44:
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
.LBB51_45:
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	stz	__rc7
	cpx	#0
	bne	.LBB51_46
; %bb.124:
	jmp	.LBB51_30
.LBB51_46:
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
.LBB51_47:                              ; =>This Inner Loop Header: Depth=1
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
	bcs	.LBB51_49
; %bb.48:                               ;   in Loop: Header=BB51_47 Depth=1
	ldy	#0
.LBB51_49:                              ;   in Loop: Header=BB51_47 Depth=1
	sty	mos8(.L__udivdi3_zp_stk+7)
	ldy	__rc15
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bne	.LBB51_57
; %bb.50:                               ;   in Loop: Header=BB51_47 Depth=1
	ldy	__rc14
	cpy	mos8(.L__udivdi3_zp_stk+5)
	beq	.LBB51_51
; %bb.126:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_60
.LBB51_51:                              ;   in Loop: Header=BB51_47 Depth=1
	ldy	__rc13
	cpy	mos8(.L__udivdi3_zp_stk+4)
	beq	.LBB51_52
; %bb.128:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_61
.LBB51_52:                              ;   in Loop: Header=BB51_47 Depth=1
	ldy	__rc12
	cpy	mos8(.L__udivdi3_zp_stk+3)
	beq	.LBB51_53
; %bb.130:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_62
.LBB51_53:                              ;   in Loop: Header=BB51_47 Depth=1
	ldy	__rc11
	cpy	mos8(.L__udivdi3_zp_stk+2)
	beq	.LBB51_54
; %bb.132:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_63
.LBB51_54:                              ;   in Loop: Header=BB51_47 Depth=1
	ldy	__rc10
	cpy	mos8(.L__udivdi3_zp_stk+1)
	beq	.LBB51_55
; %bb.134:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_64
.LBB51_55:                              ;   in Loop: Header=BB51_47 Depth=1
	ldy	__rc9
	cpy	mos8(.L__udivdi3_zp_stk)
	beq	.LBB51_56
; %bb.136:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_65
.LBB51_56:                              ;   in Loop: Header=BB51_47 Depth=1
	ldy	__rc8
	cpy	__rc19
	bcs	.LBB51_58
	bra	.LBB51_59
.LBB51_57:                              ;   in Loop: Header=BB51_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+6)
	bcc	.LBB51_59
.LBB51_58:                              ;   in Loop: Header=BB51_47 Depth=1
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
.LBB51_59:                              ;   in Loop: Header=BB51_47 Depth=1
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
	beq	.LBB51_88
; %bb.138:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_47
.LBB51_88:
	jmp	.LBB51_30
.LBB51_60:                              ;   in Loop: Header=BB51_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+5)
	bcs	.LBB51_58
	bra	.LBB51_59
.LBB51_61:                              ;   in Loop: Header=BB51_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+4)
	bcc	.LBB51_59
; %bb.140:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_58
.LBB51_62:                              ;   in Loop: Header=BB51_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+3)
	bcc	.LBB51_59
; %bb.142:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_58
.LBB51_63:                              ;   in Loop: Header=BB51_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+2)
	bcc	.LBB51_59
; %bb.144:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_58
.LBB51_64:                              ;   in Loop: Header=BB51_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk+1)
	bcc	.LBB51_59
; %bb.146:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_58
.LBB51_65:                              ;   in Loop: Header=BB51_47 Depth=1
	cpy	mos8(.L__udivdi3_zp_stk)
	bcc	.LBB51_59
; %bb.148:                              ;   in Loop: Header=BB51_47 Depth=1
	jmp	.LBB51_58
.Lfunc_end51:
	.size	__udivdi3, .Lfunc_end51-__udivdi3
                                        ; -- End function
	.section	.text.__umodqi3,"ax",@progbits
	.globl	__umodqi3                       ; -- Begin function __umodqi3
	.type	__umodqi3,@function
__umodqi3:                              ; @__umodqi3
; %bb.0:
	cpx	#0
	bne	.LBB52_1
; %bb.15:
	jmp	.LBB52_13
.LBB52_1:
	stx	__rc3
	cmp	__rc3
	bcc	.LBB52_13
; %bb.2:
	ldx	__rc3
	bmi	.LBB52_14
; %bb.3:
	ldy	#0
	ldx	#0
	pha
	lda	__rc3
	sta	__rc2
	pla
.LBB52_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	stz	__rc4
	rol	__rc4
	cpy	__rc4
	bne	.LBB52_6
; %bb.5:                                ;   in Loop: Header=BB52_4 Depth=1
	cmp	__rc2
	bcc	.LBB52_8
	bra	.LBB52_7
.LBB52_6:                               ;   in Loop: Header=BB52_4 Depth=1
	cpy	__rc4
	bcc	.LBB52_8
.LBB52_7:                               ;   in Loop: Header=BB52_4 Depth=1
	inx
	phy
	ldy	__rc2
	sty	__rc3
	ply
	inc	__rc2
	dec	__rc2
	bpl	.LBB52_4
	bra	.LBB52_9
.LBB52_8:
	ldy	__rc3
	sty	__rc2
.LBB52_9:
	sec
	sbc	__rc2
	cpx	#0
	beq	.LBB52_13
.LBB52_10:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc2
	cmp	__rc2
	bcc	.LBB52_12
; %bb.11:                               ;   in Loop: Header=BB52_10 Depth=1
	sec
	sbc	__rc2
.LBB52_12:                              ;   in Loop: Header=BB52_10 Depth=1
	dex
	bne	.LBB52_10
.LBB52_13:
	rts
.LBB52_14:
	sec
	sbc	__rc3
	rts
.Lfunc_end52:
	.size	__umodqi3, .Lfunc_end52-__umodqi3
                                        ; -- End function
	.section	.text.__umodhi3,"ax",@progbits
	.globl	__umodhi3                       ; -- Begin function __umodhi3
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; %bb.0:
	tay
	txa
	ldx	__rc3
	bne	.LBB53_2
; %bb.1:
	ldx	__rc2
	bne	.LBB53_2
; %bb.22:
	jmp	.LBB53_19
.LBB53_2:
	cmp	__rc3
	bne	.LBB53_4
; %bb.3:
	cpy	__rc2
	bcs	.LBB53_5
; %bb.20:
	jmp	.LBB53_19
.LBB53_4:
	cmp	__rc3
	bcs	.LBB53_5
; %bb.24:
	jmp	.LBB53_19
.LBB53_5:
	sta	__rc6
	ldx	__rc3
	bpl	.LBB53_6
; %bb.26:
	jmp	.LBB53_18
.LBB53_6:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc4
	ldy	__rc3
	sty	__rc5
	ply
.LBB53_7:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	rol	__rc5
	cmp	__rc5
	bne	.LBB53_9
; %bb.8:                                ;   in Loop: Header=BB53_7 Depth=1
	cpy	__rc4
	lda	__rc6
	bcc	.LBB53_11
	bra	.LBB53_10
.LBB53_9:                               ;   in Loop: Header=BB53_7 Depth=1
	cmp	__rc5
	bcc	.LBB53_11
.LBB53_10:                              ;   in Loop: Header=BB53_7 Depth=1
	inx
	phy
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc3
	ply
	inc	__rc5
	dec	__rc5
	bpl	.LBB53_7
	bra	.LBB53_12
.LBB53_11:
	lda	__rc2
	sta	__rc4
	lda	__rc3
	sta	__rc5
.LBB53_12:
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc6
	sbc	__rc5
	cpx	#0
	beq	.LBB53_19
.LBB53_13:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	ror	__rc4
	cmp	__rc5
	bne	.LBB53_17
; %bb.14:                               ;   in Loop: Header=BB53_13 Depth=1
	sta	__rc2
	cpy	__rc4
	bcc	.LBB53_16
.LBB53_15:                              ;   in Loop: Header=BB53_13 Depth=1
	sta	__rc2
	sec
	tya
	sbc	__rc4
	tay
	lda	__rc2
	sbc	__rc5
.LBB53_16:                              ;   in Loop: Header=BB53_13 Depth=1
	dex
	bne	.LBB53_13
	bra	.LBB53_19
.LBB53_17:                              ;   in Loop: Header=BB53_13 Depth=1
	cmp	__rc5
	bcs	.LBB53_15
	bra	.LBB53_16
.LBB53_18:
	sec
	tya
	sbc	__rc2
	tay
	lda	__rc6
	sbc	__rc3
.LBB53_19:
	tax
	tya
	rts
.Lfunc_end53:
	.size	__umodhi3, .Lfunc_end53-__umodhi3
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
	bne	.LBB54_4
; %bb.1:
	ldx	__rc6
	bne	.LBB54_4
; %bb.2:
	ldx	__rc5
	bne	.LBB54_4
; %bb.3:
	ldx	__rc4
	bne	.LBB54_4
; %bb.42:
	jmp	.LBB54_35
.LBB54_4:
	ldx	__rc3
	cpx	__rc7
	bne	.LBB54_8
; %bb.5:
	cmp	__rc6
	bne	.LBB54_9
; %bb.6:
	ldx	__rc10
	cpx	__rc5
	bne	.LBB54_10
; %bb.7:
	ldx	__rc12
	cpx	__rc4
	bcs	.LBB54_11
; %bb.36:
	jmp	.LBB54_35
.LBB54_8:
	cpx	__rc7
	bcs	.LBB54_11
; %bb.38:
	jmp	.LBB54_35
.LBB54_9:
	cmp	__rc6
	bcs	.LBB54_11
; %bb.40:
	jmp	.LBB54_35
.LBB54_10:
	ldx	__rc10
	cpx	__rc5
	bcs	.LBB54_11
; %bb.44:
	jmp	.LBB54_35
.LBB54_11:
	ldx	__rc7
	bpl	.LBB54_12
; %bb.46:
	jmp	.LBB54_33
.LBB54_12:
	ldx	#0
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB54_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc2
	rol	__rc11
	rol	__rc8
	rol	__rc9
	ldy	__rc3
	cpy	__rc9
	bne	.LBB54_17
; %bb.14:                               ;   in Loop: Header=BB54_13 Depth=1
	cmp	__rc8
	bne	.LBB54_18
; %bb.15:                               ;   in Loop: Header=BB54_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB54_19
; %bb.16:                               ;   in Loop: Header=BB54_13 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcc	.LBB54_21
	bra	.LBB54_20
.LBB54_17:                              ;   in Loop: Header=BB54_13 Depth=1
	cpy	__rc9
	bcc	.LBB54_21
	bra	.LBB54_20
.LBB54_18:                              ;   in Loop: Header=BB54_13 Depth=1
	cmp	__rc8
	bcc	.LBB54_21
	bra	.LBB54_20
.LBB54_19:                              ;   in Loop: Header=BB54_13 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcc	.LBB54_21
.LBB54_20:                              ;   in Loop: Header=BB54_13 Depth=1
	inx
	ldy	__rc2
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	__rc8
	sty	__rc6
	ldy	__rc9
	sty	__rc7
	bpl	.LBB54_13
	bra	.LBB54_22
.LBB54_21:
	ldy	__rc4
	sty	__rc2
	ldy	__rc5
	sty	__rc11
	ldy	__rc6
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB54_22:
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
	bne	.LBB54_23
; %bb.48:
	jmp	.LBB54_34
.LBB54_23:
	tya
.LBB54_24:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc9
	ror	__rc8
	ror	__rc11
	ror	__rc2
	ldy	__rc3
	cpy	__rc9
	bne	.LBB54_28
; %bb.25:                               ;   in Loop: Header=BB54_24 Depth=1
	cmp	__rc8
	bne	.LBB54_31
; %bb.26:                               ;   in Loop: Header=BB54_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bne	.LBB54_32
; %bb.27:                               ;   in Loop: Header=BB54_24 Depth=1
	tay
	lda	__rc12
	cmp	__rc2
	tya
	bcs	.LBB54_29
	bra	.LBB54_30
.LBB54_28:                              ;   in Loop: Header=BB54_24 Depth=1
	cpy	__rc9
	bcc	.LBB54_30
.LBB54_29:                              ;   in Loop: Header=BB54_24 Depth=1
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
.LBB54_30:                              ;   in Loop: Header=BB54_24 Depth=1
	dex
	bne	.LBB54_24
	bra	.LBB54_35
.LBB54_31:                              ;   in Loop: Header=BB54_24 Depth=1
	cmp	__rc8
	bcs	.LBB54_29
	bra	.LBB54_30
.LBB54_32:                              ;   in Loop: Header=BB54_24 Depth=1
	ldy	__rc10
	cpy	__rc11
	bcs	.LBB54_29
	bra	.LBB54_30
.LBB54_33:
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
	bra	.LBB54_35
.LBB54_34:
	tya
.LBB54_35:
	sta	__rc2
	ldx	__rc10
	lda	__rc12
	rts
.Lfunc_end54:
	.size	__umodsi3, .Lfunc_end54-__umodsi3
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
	bne	.LBB55_8
; %bb.1:
	ldx	__rc14
	bne	.LBB55_8
; %bb.2:
	ldx	__rc13
	bne	.LBB55_8
; %bb.3:
	ldx	__rc12
	bne	.LBB55_8
; %bb.4:
	ldx	__rc11
	bne	.LBB55_8
; %bb.5:
	ldx	__rc10
	bne	.LBB55_8
; %bb.6:
	ldx	__rc9
	bne	.LBB55_8
; %bb.7:
	ldx	__rc8
	bne	.LBB55_8
; %bb.90:
	jmp	.LBB55_61
.LBB55_8:
	cmp	__rc15
	bne	.LBB55_16
; %bb.9:
	ldx	__rc6
	cpx	__rc14
	bne	.LBB55_17
; %bb.10:
	ldx	__rc5
	cpx	__rc13
	bne	.LBB55_18
; %bb.11:
	ldx	__rc4
	cpx	__rc12
	bne	.LBB55_19
; %bb.12:
	ldx	__rc3
	cpx	__rc11
	bne	.LBB55_20
; %bb.13:
	ldx	__rc2
	cpx	__rc10
	bne	.LBB55_21
; %bb.14:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bne	.LBB55_22
; %bb.15:
	ldx	mos8(.L__umoddi3_zp_stk+1)
	cpx	__rc8
	bcs	.LBB55_23
; %bb.62:
	jmp	.LBB55_61
.LBB55_16:
	cmp	__rc15
	bcs	.LBB55_23
; %bb.64:
	jmp	.LBB55_61
.LBB55_17:
	cpx	__rc14
	bcs	.LBB55_23
; %bb.66:
	jmp	.LBB55_61
.LBB55_18:
	cpx	__rc13
	bcs	.LBB55_23
; %bb.68:
	jmp	.LBB55_61
.LBB55_19:
	cpx	__rc12
	bcs	.LBB55_23
; %bb.70:
	jmp	.LBB55_61
.LBB55_20:
	cpx	__rc11
	bcs	.LBB55_23
; %bb.72:
	jmp	.LBB55_61
.LBB55_21:
	cpx	__rc10
	bcs	.LBB55_23
; %bb.74:
	jmp	.LBB55_61
.LBB55_22:
	ldx	mos8(.L__umoddi3_zp_stk+2)
	cpx	__rc9
	bcs	.LBB55_23
; %bb.92:
	jmp	.LBB55_61
.LBB55_23:
	ldx	__rc15
	bpl	.LBB55_24
; %bb.94:
	jmp	.LBB55_33
.LBB55_24:
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
.LBB55_25:                              ; =>This Inner Loop Header: Depth=1
	asl	mos8(.L__umoddi3_zp_stk+6)
	rol	mos8(.L__umoddi3_zp_stk+5)
	rol	mos8(.L__umoddi3_zp_stk+4)
	rol	mos8(.L__umoddi3_zp_stk+3)
	rol	mos8(.L__umoddi3_zp_stk)
	rol	__rc7
	rol	__rc18
	rol	__rc19
	cmp	__rc19
	bne	.LBB55_29
; %bb.26:                               ;   in Loop: Header=BB55_25 Depth=1
	ldy	__rc6
	cpy	__rc18
	bne	.LBB55_30
; %bb.27:                               ;   in Loop: Header=BB55_25 Depth=1
	ldy	__rc5
	cpy	__rc7
	bne	.LBB55_31
; %bb.28:                               ;   in Loop: Header=BB55_25 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB55_76
; %bb.96:                               ;   in Loop: Header=BB55_25 Depth=1
	jmp	.LBB55_38
.LBB55_76:                              ;   in Loop: Header=BB55_25 Depth=1
	jmp	.LBB55_34
.LBB55_29:                              ;   in Loop: Header=BB55_25 Depth=1
	cmp	__rc19
	bcs	.LBB55_32
; %bb.98:
	jmp	.LBB55_42
.LBB55_30:                              ;   in Loop: Header=BB55_25 Depth=1
	cpy	__rc18
	bcs	.LBB55_32
; %bb.100:
	jmp	.LBB55_42
.LBB55_31:                              ;   in Loop: Header=BB55_25 Depth=1
	cpy	__rc7
	bcs	.LBB55_32
; %bb.102:
	jmp	.LBB55_42
.LBB55_32:                              ;   in Loop: Header=BB55_25 Depth=1
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
	bmi	.LBB55_78
; %bb.104:                              ;   in Loop: Header=BB55_25 Depth=1
	jmp	.LBB55_25
.LBB55_78:
	jmp	.LBB55_43
.LBB55_33:
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
	jmp	.LBB55_61
.LBB55_34:                              ;   in Loop: Header=BB55_25 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bne	.LBB55_39
; %bb.35:                               ;   in Loop: Header=BB55_25 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bne	.LBB55_40
; %bb.36:                               ;   in Loop: Header=BB55_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bne	.LBB55_41
; %bb.37:                               ;   in Loop: Header=BB55_25 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+2)
	sta	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Spill
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	lda	mos8(.L__umoddi3_zp_stk+7)      ; 1-byte Folded Reload
	sta	mos8(.L__umoddi3_zp_stk+2)
	tya
	bcc	.LBB55_42
; %bb.82:                               ;   in Loop: Header=BB55_25 Depth=1
	jmp	.LBB55_32
.LBB55_38:                              ;   in Loop: Header=BB55_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcc	.LBB55_42
; %bb.84:                               ;   in Loop: Header=BB55_25 Depth=1
	jmp	.LBB55_32
.LBB55_39:                              ;   in Loop: Header=BB55_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcc	.LBB55_42
; %bb.86:                               ;   in Loop: Header=BB55_25 Depth=1
	jmp	.LBB55_32
.LBB55_40:                              ;   in Loop: Header=BB55_25 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcc	.LBB55_42
; %bb.88:                               ;   in Loop: Header=BB55_25 Depth=1
	jmp	.LBB55_32
.LBB55_41:                              ;   in Loop: Header=BB55_25 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB55_42
; %bb.106:                              ;   in Loop: Header=BB55_25 Depth=1
	jmp	.LBB55_32
.LBB55_42:
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
.LBB55_43:
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
	bne	.LBB55_44
; %bb.108:
	jmp	.LBB55_61
.LBB55_44:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc19
	ror	__rc18
	ror	__rc7
	ror	mos8(.L__umoddi3_zp_stk)
	ror	mos8(.L__umoddi3_zp_stk+3)
	ror	mos8(.L__umoddi3_zp_stk+4)
	ror	mos8(.L__umoddi3_zp_stk+5)
	ror	mos8(.L__umoddi3_zp_stk+6)
	cmp	__rc19
	bne	.LBB55_52
; %bb.45:                               ;   in Loop: Header=BB55_44 Depth=1
	ldy	__rc6
	cpy	__rc18
	beq	.LBB55_46
; %bb.110:                              ;   in Loop: Header=BB55_44 Depth=1
	jmp	.LBB55_55
.LBB55_46:                              ;   in Loop: Header=BB55_44 Depth=1
	ldy	__rc5
	cpy	__rc7
	beq	.LBB55_47
; %bb.112:                              ;   in Loop: Header=BB55_44 Depth=1
	jmp	.LBB55_56
.LBB55_47:                              ;   in Loop: Header=BB55_44 Depth=1
	ldy	__rc4
	cpy	mos8(.L__umoddi3_zp_stk)
	beq	.LBB55_48
; %bb.114:                              ;   in Loop: Header=BB55_44 Depth=1
	jmp	.LBB55_57
.LBB55_48:                              ;   in Loop: Header=BB55_44 Depth=1
	ldy	__rc3
	cpy	mos8(.L__umoddi3_zp_stk+3)
	beq	.LBB55_49
; %bb.116:                              ;   in Loop: Header=BB55_44 Depth=1
	jmp	.LBB55_58
.LBB55_49:                              ;   in Loop: Header=BB55_44 Depth=1
	ldy	__rc2
	cpy	mos8(.L__umoddi3_zp_stk+4)
	beq	.LBB55_50
; %bb.118:                              ;   in Loop: Header=BB55_44 Depth=1
	jmp	.LBB55_59
.LBB55_50:                              ;   in Loop: Header=BB55_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	beq	.LBB55_51
; %bb.120:                              ;   in Loop: Header=BB55_44 Depth=1
	jmp	.LBB55_60
.LBB55_51:                              ;   in Loop: Header=BB55_44 Depth=1
	tay
	lda	mos8(.L__umoddi3_zp_stk+1)
	cmp	mos8(.L__umoddi3_zp_stk+6)
	tya
	bcs	.LBB55_53
	bra	.LBB55_54
.LBB55_52:                              ;   in Loop: Header=BB55_44 Depth=1
	cmp	__rc19
	bcc	.LBB55_54
.LBB55_53:                              ;   in Loop: Header=BB55_44 Depth=1
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
.LBB55_54:                              ;   in Loop: Header=BB55_44 Depth=1
	dex
	beq	.LBB55_61
; %bb.122:                              ;   in Loop: Header=BB55_44 Depth=1
	jmp	.LBB55_44
.LBB55_55:                              ;   in Loop: Header=BB55_44 Depth=1
	cpy	__rc18
	bcs	.LBB55_53
	bra	.LBB55_54
.LBB55_56:                              ;   in Loop: Header=BB55_44 Depth=1
	cpy	__rc7
	bcs	.LBB55_53
	bra	.LBB55_54
.LBB55_57:                              ;   in Loop: Header=BB55_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk)
	bcs	.LBB55_53
	bra	.LBB55_54
.LBB55_58:                              ;   in Loop: Header=BB55_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+3)
	bcs	.LBB55_53
	bra	.LBB55_54
.LBB55_59:                              ;   in Loop: Header=BB55_44 Depth=1
	cpy	mos8(.L__umoddi3_zp_stk+4)
	bcs	.LBB55_53
	bra	.LBB55_54
.LBB55_60:                              ;   in Loop: Header=BB55_44 Depth=1
	ldy	mos8(.L__umoddi3_zp_stk+2)
	cpy	mos8(.L__umoddi3_zp_stk+5)
	bcc	.LBB55_54
; %bb.124:                              ;   in Loop: Header=BB55_44 Depth=1
	jmp	.LBB55_53
.LBB55_61:
	sta	__rc7
	ldx	mos8(.L__umoddi3_zp_stk+2)
	lda	mos8(.L__umoddi3_zp_stk+1)
	rts
.Lfunc_end55:
	.size	__umoddi3, .Lfunc_end55-__umoddi3
                                        ; -- End function
	.section	.text.__udivmodqi4,"ax",@progbits
	.globl	__udivmodqi4                    ; -- Begin function __udivmodqi4
	.type	__udivmodqi4,@function
__udivmodqi4:                           ; @__udivmodqi4
; %bb.0:
	tay
	lda	#0
	cpx	#0
	beq	.LBB56_8
; %bb.1:
	stx	__rc5
	sty	__rc7
	cpy	__rc5
	bcs	.LBB56_2
; %bb.18:
	jmp	.LBB56_17
.LBB56_2:
	lda	__rc5
	bpl	.LBB56_3
; %bb.20:
	jmp	.LBB56_15
.LBB56_3:
	ldy	#0
	ldx	#0
	lda	__rc5
	sta	__rc4
.LBB56_4:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc4
	stz	__rc6
	rol	__rc6
	cpy	__rc6
	bne	.LBB56_6
; %bb.5:                                ;   in Loop: Header=BB56_4 Depth=1
	lda	__rc7
	cmp	__rc4
	bcc	.LBB56_9
	bra	.LBB56_7
.LBB56_6:                               ;   in Loop: Header=BB56_4 Depth=1
	cpy	__rc6
	bcc	.LBB56_9
.LBB56_7:                               ;   in Loop: Header=BB56_4 Depth=1
	inx
	lda	__rc4
	sta	__rc5
	bpl	.LBB56_4
	bra	.LBB56_10
.LBB56_8:
	sty	__rc7
	bra	.LBB56_17
.LBB56_9:
	ldy	__rc5
	sty	__rc4
.LBB56_10:
	sec
	lda	__rc7
	sbc	__rc4
	sta	__rc7
	txa
	beq	.LBB56_16
; %bb.11:
	lda	#1
.LBB56_12:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc4
	asl
	tay
	lda	__rc7
	cmp	__rc4
	bcc	.LBB56_14
; %bb.13:                               ;   in Loop: Header=BB56_12 Depth=1
	sta	__rc5
	tya
	ora	#1
	tay
	sec
	lda	__rc5
	sbc	__rc4
	sta	__rc7
.LBB56_14:                              ;   in Loop: Header=BB56_12 Depth=1
	dex
	tya
	cpx	#0
	bne	.LBB56_12
	bra	.LBB56_17
.LBB56_15:
	sec
	tya
	sbc	__rc5
	sta	__rc7
.LBB56_16:
	lda	#1
.LBB56_17:
	tax
	lda	__rc7
	sta	(__rc2)
	txa
	rts
.Lfunc_end56:
	.size	__udivmodqi4, .Lfunc_end56-__udivmodqi4
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
	bne	.LBB57_2
; %bb.1:
	ldx	__rc2
	beq	.LBB57_4
.LBB57_2:
	cmp	__rc3
	bne	.LBB57_5
; %bb.3:
	ldx	__rc9
	cpx	__rc2
	bcs	.LBB57_6
.LBB57_4:
	ldx	#0
; %bb.26:
	jmp	.LBB57_24
.LBB57_5:
	cmp	__rc3
	bcc	.LBB57_4
.LBB57_6:
	tay
	ldx	__rc3
	bpl	.LBB57_7
; %bb.28:
	jmp	.LBB57_22
.LBB57_7:
	ldx	#0
	phy
	ldy	__rc2
	sty	__rc7
	ldy	__rc3
	sty	__rc8
	ply
.LBB57_8:                               ; =>This Inner Loop Header: Depth=1
	asl	__rc7
	rol	__rc8
	cmp	__rc8
	bne	.LBB57_10
; %bb.9:                                ;   in Loop: Header=BB57_8 Depth=1
	lda	__rc9
	cmp	__rc7
	tya
	bcs	.LBB57_11
	bra	.LBB57_12
.LBB57_10:                              ;   in Loop: Header=BB57_8 Depth=1
	cmp	__rc8
	bcc	.LBB57_12
.LBB57_11:                              ;   in Loop: Header=BB57_8 Depth=1
	inx
	phy
	ldy	__rc7
	sty	__rc2
	ldy	__rc8
	sty	__rc3
	ply
	inc	__rc8
	dec	__rc8
	bpl	.LBB57_8
	bra	.LBB57_13
.LBB57_12:
	lda	__rc2
	sta	__rc7
	lda	__rc3
	sta	__rc8
.LBB57_13:
	sec
	lda	__rc9
	sbc	__rc7
	sta	__rc9
	tya
	sbc	__rc8
	cpx	#0
	bne	.LBB57_14
; %bb.30:
	jmp	.LBB57_23
.LBB57_14:
	stz	__rc6
	ldy	#1
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB57_15:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc8
	ror	__rc7
	ldy	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	sty	__rc2
	asl	__rc2
	ldy	#1
	bcs	.LBB57_17
; %bb.16:                               ;   in Loop: Header=BB57_15 Depth=1
	ldy	#0
.LBB57_17:                              ;   in Loop: Header=BB57_15 Depth=1
	sty	__rc3
	ldy	__rc2
	sty	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
	cmp	__rc8
	bne	.LBB57_21
; %bb.18:                               ;   in Loop: Header=BB57_15 Depth=1
	ldy	__rc9
	cpy	__rc7
	bcc	.LBB57_20
.LBB57_19:                              ;   in Loop: Header=BB57_15 Depth=1
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
.LBB57_20:                              ;   in Loop: Header=BB57_15 Depth=1
	ldy	__rc3
	cpy	#1
	rol	__rc6
	dex
	bne	.LBB57_15
	bra	.LBB57_25
.LBB57_21:                              ;   in Loop: Header=BB57_15 Depth=1
	cmp	__rc8
	bcs	.LBB57_19
	bra	.LBB57_20
.LBB57_22:
	sec
	lda	__rc9
	sbc	__rc2
	sta	__rc9
	tya
	sbc	__rc3
.LBB57_23:
	ldx	#1
.LBB57_24:
	stx	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Spill
.LBB57_25:
	tax
	lda	__rc9
	sta	(__rc4)
	ldy	#1
	txa
	sta	(__rc4),y
	ldx	__rc6
	lda	mos8(.L__udivmodhi4_zp_stk)     ; 1-byte Folded Reload
	rts
.Lfunc_end57:
	.size	__udivmodhi4, .Lfunc_end57-__udivmodhi4
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
	bpl	.LBB58_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB58_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__divqi3_zp_stk)
	sta	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Spill
.LBB58_3:
	ldy	__rc2
	ldx	__rc2
	sty	mos8(.L__divqi3_zp_stk+1)
	tya
	bpl	.LBB58_6
; %bb.4:
	ldx	#128
	cpy	#128
	beq	.LBB58_6
; %bb.5:
	sec
	lda	#0
	sbc	mos8(.L__divqi3_zp_stk+1)
	tax
.LBB58_6:
	lda	mos8(.L__divqi3_zp_stk+2)       ; 1-byte Folded Reload
	jsr	__udivqi3
	sta	__rc2
	lda	mos8(.L__divqi3_zp_stk+1)
	eor	mos8(.L__divqi3_zp_stk)
	bpl	.LBB58_8
; %bb.7:
	lda	#0
	sec
	sbc	__rc2
	sta	__rc2
.LBB58_8:
	lda	__rc2
	rts
.Lfunc_end58:
	.size	__divqi3, .Lfunc_end58-__divqi3
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
	bmi	.LBB59_2
; %bb.1:
	bra	.LBB59_6
.LBB59_2:
	cpx	#128
	bne	.LBB59_5
; %bb.3:
	lda	__rc4
	bne	.LBB59_5
; %bb.4:
	stz	__rc4
	ldx	#128
	bra	.LBB59_6
.LBB59_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__divhi3_zp_stk)
	tax
.LBB59_6:
	tya
	bmi	.LBB59_8
; %bb.7:
	tya
	sty	mos8(.L__divhi3_zp_stk+1)
	bra	.LBB59_12
.LBB59_8:
	cpy	#128
	bne	.LBB59_11
; %bb.9:
	lda	__rc2
	bne	.LBB59_11
; %bb.10:
	stz	__rc2
	sty	mos8(.L__divhi3_zp_stk+1)
	lda	#128
	bra	.LBB59_12
.LBB59_11:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sty	mos8(.L__divhi3_zp_stk+1)
	sbc	__rc3
.LBB59_12:
	sta	__rc3
	lda	__rc4
	jsr	__udivhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__divhi3_zp_stk+1)
	eor	mos8(.L__divhi3_zp_stk)
	bpl	.LBB59_14
; %bb.13:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB59_14:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end59:
	.size	__divhi3, .Lfunc_end59-__divhi3
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
	bmi	.LBB60_2
; %bb.1:
	ldy	__rc3
	bra	.LBB60_8
.LBB60_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB60_7
; %bb.3:
	lda	__rc2
	bne	.LBB60_7
; %bb.4:
	lda	__rc8
	bne	.LBB60_7
; %bb.5:
	lda	__rc9
	bne	.LBB60_7
; %bb.6:
	stz	__rc9
	ldy	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB60_8
.LBB60_7:
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
.LBB60_8:
	lda	mos8(.L__divsi3_zp_stk)
	bmi	.LBB60_10
; %bb.9:
	lda	__rc7
	bra	.LBB60_16
.LBB60_10:
	ldx	__rc7
	cpx	#128
	bne	.LBB60_15
; %bb.11:
	lda	__rc6
	bne	.LBB60_15
; %bb.12:
	lda	__rc5
	bne	.LBB60_15
; %bb.13:
	lda	__rc4
	bne	.LBB60_15
; %bb.14:
	stz	__rc4
	lda	#128
	stz	__rc5
	stz	__rc6
	bra	.LBB60_16
.LBB60_15:
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
.LBB60_16:
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
	bne	.LBB60_18
; %bb.17:
	ldx	__rc8
	cpx	__rc6
	beq	.LBB60_19
.LBB60_18:
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
.LBB60_19:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end60:
	.size	__divsi3, .Lfunc_end60-__divsi3
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
	bmi	.LBB61_2
; %bb.1:
	ldy	__rc7
; %bb.28:
	jmp	.LBB61_12
.LBB61_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB61_11
; %bb.3:
	lda	__rc6
	bne	.LBB61_11
; %bb.4:
	lda	__rc5
	bne	.LBB61_11
; %bb.5:
	lda	__rc4
	bne	.LBB61_11
; %bb.6:
	lda	__rc3
	bne	.LBB61_11
; %bb.7:
	lda	__rc2
	bne	.LBB61_11
; %bb.8:
	lda	__rc18
	bne	.LBB61_11
; %bb.9:
	lda	__rc19
	bne	.LBB61_11
; %bb.10:
	stz	__rc19
	ldy	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB61_12
.LBB61_11:
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
.LBB61_12:
	lda	mos8(.L__divdi3_zp_stk)
	bmi	.LBB61_14
; %bb.13:
	lda	__rc15
; %bb.30:
	jmp	.LBB61_24
.LBB61_14:
	ldx	__rc15
	cpx	#128
	bne	.LBB61_23
; %bb.15:
	lda	__rc14
	bne	.LBB61_23
; %bb.16:
	lda	__rc13
	bne	.LBB61_23
; %bb.17:
	lda	__rc12
	bne	.LBB61_23
; %bb.18:
	lda	__rc11
	bne	.LBB61_23
; %bb.19:
	lda	__rc10
	bne	.LBB61_23
; %bb.20:
	lda	__rc9
	bne	.LBB61_23
; %bb.21:
	lda	__rc8
	bne	.LBB61_23
; %bb.22:
	stz	__rc8
	lda	#128
	stz	__rc9
	stz	__rc10
	stz	__rc11
	stz	__rc12
	stz	__rc13
	stz	__rc14
	bra	.LBB61_24
.LBB61_23:
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
.LBB61_24:
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
	bne	.LBB61_26
; %bb.25:
	ldx	__rc12
	cpx	__rc10
	beq	.LBB61_27
.LBB61_26:
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
.LBB61_27:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end61:
	.size	__divdi3, .Lfunc_end61-__divdi3
                                        ; -- End function
	.section	.text.__modqi3,"ax",@progbits
	.globl	__modqi3                        ; -- Begin function __modqi3
	.type	__modqi3,@function
__modqi3:                               ; @__modqi3
; %bb.0:
	sta	mos8(.L__modqi3_zp_stk)
	stx	__rc2
	tax
	bpl	.LBB62_3
; %bb.1:
	lda	#128
	ldx	mos8(.L__modqi3_zp_stk)
	cpx	#128
	beq	.LBB62_3
; %bb.2:
	lda	#0
	sec
	sbc	mos8(.L__modqi3_zp_stk)
.LBB62_3:
	tay
	lda	__rc2
	bmi	.LBB62_5
; %bb.4:
	lda	__rc2
	bra	.LBB62_7
.LBB62_5:
	lda	#128
	ldx	__rc2
	cpx	#128
	beq	.LBB62_7
; %bb.6:
	lda	#0
	sec
	sbc	__rc2
.LBB62_7:
	tax
	tya
	jsr	__umodqi3
	sta	__rc2
	ldx	mos8(.L__modqi3_zp_stk)
	bmi	.LBB62_9
; %bb.8:
	rts
.LBB62_9:
	lda	#0
	sec
	sbc	__rc2
	rts
.Lfunc_end62:
	.size	__modqi3, .Lfunc_end62-__modqi3
                                        ; -- End function
	.section	.text.__modhi3,"ax",@progbits
	.globl	__modhi3                        ; -- Begin function __modhi3
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; %bb.0:
	sta	__rc4
	stx	mos8(.L__modhi3_zp_stk)
	txa
	bmi	.LBB63_2
; %bb.1:
	txa
	bra	.LBB63_6
.LBB63_2:
	cpx	#128
	bne	.LBB63_5
; %bb.3:
	lda	__rc4
	bne	.LBB63_5
; %bb.4:
	stz	__rc4
	lda	#128
	bra	.LBB63_6
.LBB63_5:
	sec
	lda	#0
	sbc	__rc4
	sta	__rc4
	lda	#0
	sbc	mos8(.L__modhi3_zp_stk)
.LBB63_6:
	ldx	__rc3
	bpl	.LBB63_11
; %bb.7:
	ldx	__rc3
	cpx	#128
	bne	.LBB63_10
; %bb.8:
	ldx	__rc2
	bne	.LBB63_10
; %bb.9:
	stz	__rc2
	ldx	#128
	stx	__rc3
	bra	.LBB63_11
.LBB63_10:
	tax
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc3
	sta	__rc3
	txa
.LBB63_11:
	tax
	lda	__rc4
	jsr	__umodhi3
	sta	__rc3
	stx	__rc2
	lda	mos8(.L__modhi3_zp_stk)
	bpl	.LBB63_13
; %bb.12:
	sec
	lda	#0
	sbc	__rc3
	sta	__rc3
	lda	#0
	sbc	__rc2
	sta	__rc2
.LBB63_13:
	ldx	__rc2
	lda	__rc3
	rts
.Lfunc_end63:
	.size	__modhi3, .Lfunc_end63-__modhi3
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
	bmi	.LBB64_2
; %bb.1:
	lda	__rc3
	bra	.LBB64_8
.LBB64_2:
	ldx	__rc3
	cpx	#128
	bne	.LBB64_7
; %bb.3:
	lda	__rc2
	bne	.LBB64_7
; %bb.4:
	lda	__rc8
	bne	.LBB64_7
; %bb.5:
	lda	__rc9
	bne	.LBB64_7
; %bb.6:
	stz	__rc9
	lda	#128
	stz	__rc8
	stz	__rc2
	bra	.LBB64_8
.LBB64_7:
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
.LBB64_8:
	ldx	__rc7
	bpl	.LBB64_15
; %bb.9:
	ldx	__rc7
	cpx	#128
	bne	.LBB64_14
; %bb.10:
	ldx	__rc6
	bne	.LBB64_14
; %bb.11:
	ldx	__rc5
	bne	.LBB64_14
; %bb.12:
	ldx	__rc4
	bne	.LBB64_14
; %bb.13:
	stz	__rc4
	ldx	#128
	stz	__rc5
	stz	__rc6
	stx	__rc7
	bra	.LBB64_15
.LBB64_14:
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
.LBB64_15:
	sta	__rc3
	ldx	__rc8
	lda	__rc9
	jsr	__umodsi3
	sta	__rc5
	stx	__rc4
	lda	mos8(.L__modsi3_zp_stk)
	bpl	.LBB64_17
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
.LBB64_17:
	ldx	__rc4
	lda	__rc5
	rts
.Lfunc_end64:
	.size	__modsi3, .Lfunc_end64-__modsi3
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
	bmi	.LBB65_2
; %bb.1:
	lda	__rc7
; %bb.26:
	jmp	.LBB65_12
.LBB65_2:
	ldx	__rc7
	cpx	#128
	bne	.LBB65_11
; %bb.3:
	lda	__rc6
	bne	.LBB65_11
; %bb.4:
	lda	__rc5
	bne	.LBB65_11
; %bb.5:
	lda	__rc4
	bne	.LBB65_11
; %bb.6:
	lda	__rc3
	bne	.LBB65_11
; %bb.7:
	lda	__rc2
	bne	.LBB65_11
; %bb.8:
	lda	__rc18
	bne	.LBB65_11
; %bb.9:
	lda	__rc19
	bne	.LBB65_11
; %bb.10:
	stz	__rc19
	lda	#128
	stz	__rc18
	stz	__rc2
	stz	__rc3
	stz	__rc4
	stz	__rc5
	stz	__rc6
	bra	.LBB65_12
.LBB65_11:
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
.LBB65_12:
	ldx	__rc15
	bmi	.LBB65_13
; %bb.28:
	jmp	.LBB65_23
.LBB65_13:
	ldx	__rc15
	cpx	#128
	bne	.LBB65_22
; %bb.14:
	ldx	__rc14
	bne	.LBB65_22
; %bb.15:
	ldx	__rc13
	bne	.LBB65_22
; %bb.16:
	ldx	__rc12
	bne	.LBB65_22
; %bb.17:
	ldx	__rc11
	bne	.LBB65_22
; %bb.18:
	ldx	__rc10
	bne	.LBB65_22
; %bb.19:
	ldx	__rc9
	bne	.LBB65_22
; %bb.20:
	ldx	__rc8
	bne	.LBB65_22
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
	bra	.LBB65_23
.LBB65_22:
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
.LBB65_23:
	sta	__rc7
	ldx	__rc18
	lda	__rc19
	jsr	__umoddi3
	sta	__rc9
	stx	__rc8
	lda	mos8(.L__moddi3_zp_stk)
	bpl	.LBB65_25
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
.LBB65_25:
	ldx	__rc8
	lda	__rc9
	rts
.Lfunc_end65:
	.size	__moddi3, .Lfunc_end65-__moddi3
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
	bpl	.LBB66_3
; %bb.1:
	ldx	#128
	stx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
	tax
	cpx	#128
	beq	.LBB66_3
; %bb.2:
	sec
	lda	#0
	sbc	__rc4
	sta	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Spill
.LBB66_3:
	ldy	#1
	stz	__rc6
	lda	__rc8
	bmi	.LBB66_6
; %bb.4:
	ldx	__rc8
	stx	__rc5
	bne	.LBB66_10
; %bb.5:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB66_11
.LBB66_6:
	ldx	__rc8
	cpx	#128
	bne	.LBB66_9
; %bb.7:
	lda	#1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc7
	bmi	.LBB66_8
; %bb.34:
	jmp	.LBB66_24
.LBB66_8:
	stz	__rc7
	sta	__rc6
; %bb.30:
	jmp	.LBB66_24
.LBB66_9:
	lda	#0
	sec
	stx	__rc5
	sbc	__rc5
	sta	__rc5
.LBB66_10:
	ldx	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpx	__rc5
	bcs	.LBB66_12
.LBB66_11:
	stx	__rc7
; %bb.32:
	jmp	.LBB66_24
.LBB66_12:
	lda	#0
	tax
	phy
	ldy	__rc5
	sty	__rc6
	ply
.LBB66_13:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc6
	stz	__rc7
	rol	__rc7
	cmp	__rc7
	bne	.LBB66_15
; %bb.14:                               ;   in Loop: Header=BB66_13 Depth=1
	ldy	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	cpy	__rc6
	ldy	#1
	bcc	.LBB66_18
	bra	.LBB66_16
.LBB66_15:                              ;   in Loop: Header=BB66_13 Depth=1
	cmp	__rc7
	bcc	.LBB66_18
.LBB66_16:                              ;   in Loop: Header=BB66_13 Depth=1
	inx
	phy
	ldy	__rc6
	sty	__rc5
	ply
	inc	__rc6
	dec	__rc6
	bpl	.LBB66_13
; %bb.17:
	lda	#128
	sta	__rc5
.LBB66_18:
	lda	mos8(.L__divmodqi4_zp_stk)      ; 1-byte Folded Reload
	sec
	sbc	__rc5
	cpx	#0
	beq	.LBB66_23
; %bb.19:
	sta	__rc9
	lda	#1
.LBB66_20:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc5
	asl
	ldy	__rc9
	cpy	__rc5
	bcc	.LBB66_22
; %bb.21:                               ;   in Loop: Header=BB66_20 Depth=1
	ora	#1
	sec
	tay
	lda	__rc9
	sbc	__rc5
	sta	__rc9
	tya
.LBB66_22:                              ;   in Loop: Header=BB66_20 Depth=1
	dex
	ldy	__rc9
	sty	__rc7
	sta	__rc6
	cpx	#0
	bne	.LBB66_20
	bra	.LBB66_24
.LBB66_23:
	sta	__rc7
	sty	__rc6
.LBB66_24:
	lda	__rc4
	bmi	.LBB66_26
; %bb.25:
	lda	__rc7
	bra	.LBB66_27
.LBB66_26:
	lda	#0
	sec
	sbc	__rc7
.LBB66_27:
	sta	(__rc2)
	lda	__rc8
	eor	__rc4
	bpl	.LBB66_29
; %bb.28:
	lda	#0
	sec
	sbc	__rc6
	sta	__rc6
.LBB66_29:
	lda	__rc6
	rts
.Lfunc_end66:
	.size	__divmodqi4, .Lfunc_end66-__divmodqi4
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
	bmi	.LBB67_2
.LBB67_1:
	stx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB67_6
.LBB67_2:
	cpx	#128
	bne	.LBB67_5
; %bb.3:
	lda	__rc7
	bne	.LBB67_5
; %bb.4:
	lda	#0
	ldx	#128
	bra	.LBB67_1
.LBB67_5:
	sec
	lda	#0
	sbc	__rc7
	tax
	lda	#0
	sbc	__rc6
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	txa
.LBB67_6:
	ldx	#1
	stz	__rc3
	sty	__rc12
	sta	__rc10
	cpy	#0
	bmi	.LBB67_10
; %bb.7:
	sty	__rc7
	tya
	bne	.LBB67_15
; %bb.8:
	lda	__rc2
	bne	.LBB67_15
; %bb.9:
	ldx	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	stx	__rc11
	bra	.LBB67_18
.LBB67_10:
	cpy	#128
	bne	.LBB67_14
; %bb.11:
	ldy	__rc2
	bne	.LBB67_14
; %bb.12:
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bpl	.LBB67_13
; %bb.48:
	jmp	.LBB67_45
.LBB67_13:
	sta	__rc10
	sty	__rc11
	bra	.LBB67_18
.LBB67_14:
	sec
	lda	#0
	sbc	__rc2
	sta	__rc2
	lda	#0
	sbc	__rc12
	sta	__rc7
.LBB67_15:
	lda	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	cmp	__rc7
	bne	.LBB67_19
; %bb.16:
	ldx	__rc10
	cpx	__rc2
	bcs	.LBB67_20
.LBB67_17:
	sta	__rc11
.LBB67_18:
	stz	__rc9
; %bb.46:
	jmp	.LBB67_39
.LBB67_19:
	cmp	__rc7
	bcc	.LBB67_17
.LBB67_20:
	ldx	#0
	ldy	__rc2
	sty	__rc8
	ldy	__rc7
	sty	__rc9
.LBB67_21:                              ; =>This Inner Loop Header: Depth=1
	asl	__rc8
	rol	__rc9
	cmp	__rc9
	bne	.LBB67_23
; %bb.22:                               ;   in Loop: Header=BB67_21 Depth=1
	ldy	__rc10
	cpy	__rc8
	bcs	.LBB67_24
	bra	.LBB67_26
.LBB67_23:                              ;   in Loop: Header=BB67_21 Depth=1
	cmp	__rc9
	bcc	.LBB67_26
.LBB67_24:                              ;   in Loop: Header=BB67_21 Depth=1
	inx
	ldy	__rc8
	sty	__rc2
	ldy	__rc9
	sty	__rc7
	bpl	.LBB67_21
; %bb.25:
	stz	__rc2
	lda	#128
	sta	__rc7
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	bra	.LBB67_27
.LBB67_26:
	tay
.LBB67_27:
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
	cpx	#0
	bne	.LBB67_28
; %bb.50:
	jmp	.LBB67_37
.LBB67_28:
	stz	__rc8
	ldy	#1
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB67_32
.LBB67_29:                              ;   in Loop: Header=BB67_32 Depth=1
	tay
	cmp	__rc7
	lda	__rc10
	bcc	.LBB67_36
.LBB67_30:                              ;   in Loop: Header=BB67_32 Depth=1
	lda	__rc3
	ora	#1
	sta	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	sec
	lda	__rc10
	sbc	__rc2
	sta	__rc10
	tya
	sbc	__rc7
.LBB67_31:                              ;   in Loop: Header=BB67_32 Depth=1
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
	beq	.LBB67_39
.LBB67_32:                              ; =>This Inner Loop Header: Depth=1
	lsr	__rc7
	ror	__rc2
	ldy	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Reload
	sty	__rc3
	asl	__rc3
	ldy	#1
	bcs	.LBB67_34
; %bb.33:                               ;   in Loop: Header=BB67_32 Depth=1
	ldy	#0
.LBB67_34:                              ;   in Loop: Header=BB67_32 Depth=1
	sty	__rc9
	cmp	__rc7
	bne	.LBB67_29
; %bb.35:                               ;   in Loop: Header=BB67_32 Depth=1
	tay
	lda	__rc10
	cmp	__rc2
	bcs	.LBB67_30
.LBB67_36:                              ;   in Loop: Header=BB67_32 Depth=1
	sta	__rc10
	tya
	ldy	__rc3
	sty	mos8(.L__divmodhi4_zp_stk)      ; 1-byte Folded Spill
	bra	.LBB67_31
.LBB67_37:
	sta	__rc11
	ldx	#1
.LBB67_38:
	stx	__rc9
.LBB67_39:
	lda	__rc6
	bmi	.LBB67_41
; %bb.40:
	lda	__rc10
	bra	.LBB67_42
.LBB67_41:
	sec
	lda	#0
	sbc	__rc10
	tax
	lda	#0
	sbc	__rc11
	sta	__rc11
	txa
.LBB67_42:
	sta	(__rc4)
	lda	__rc12
	eor	__rc6
	tax
	ldy	#1
	lda	__rc11
	sta	(__rc4),y
	txa
	bpl	.LBB67_44
; %bb.43:
	sec
	lda	#0
	sbc	__rc9
	sta	__rc9
	lda	#0
	sbc	__rc3
	sta	__rc3
.LBB67_44:
	ldx	__rc3
	lda	__rc9
	rts
.LBB67_45:
	stz	__rc10
	stz	__rc11
	bra	.LBB67_38
.Lfunc_end67:
	.size	__divmodhi4, .Lfunc_end67-__divmodhi4
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	tay
	txa
	bne	.LBB68_2
; %bb.1:
	tya
	beq	.LBB68_11
.LBB68_2:
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB68_3:                               ; =>This Inner Loop Header: Depth=1
	lda	(__rc4)
	sta	(__rc6)
	inc	__rc6
	bne	.LBB68_5
; %bb.4:                                ;   in Loop: Header=BB68_3 Depth=1
	inc	__rc7
.LBB68_5:                               ;   in Loop: Header=BB68_3 Depth=1
	inc	__rc4
	bne	.LBB68_7
; %bb.6:                                ;   in Loop: Header=BB68_3 Depth=1
	inc	__rc5
.LBB68_7:                               ;   in Loop: Header=BB68_3 Depth=1
	tya
	dey
	cmp	#0
	bne	.LBB68_9
; %bb.8:                                ;   in Loop: Header=BB68_3 Depth=1
	dex
.LBB68_9:                               ;   in Loop: Header=BB68_3 Depth=1
	txa
	bne	.LBB68_3
; %bb.10:                               ;   in Loop: Header=BB68_3 Depth=1
	tya
	bne	.LBB68_3
.LBB68_11:
	rts
.Lfunc_end68:
	.size	memcpy, .Lfunc_end68-memcpy
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
.Lfunc_end69:
	.size	memset, .Lfunc_end69-memset
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	bra	.LBB70_4
.LBB70_1:                               ;   in Loop: Header=BB70_4 Depth=1
	sta	(__rc2)
	inc	__rc2
	bne	.LBB70_3
; %bb.2:                                ;   in Loop: Header=BB70_4 Depth=1
	inc	__rc3
.LBB70_3:                               ;   in Loop: Header=BB70_4 Depth=1
	phx
	ply
	dex
	cpy	#0
	beq	.LBB70_7
.LBB70_4:                               ; =>This Inner Loop Header: Depth=1
	ldy	__rc4
	bne	.LBB70_1
; %bb.5:                                ;   in Loop: Header=BB70_4 Depth=1
	cpx	#0
	bne	.LBB70_1
; %bb.6:
	rts
.LBB70_7:                               ;   in Loop: Header=BB70_4 Depth=1
	dec	__rc4
	jmp	.LBB70_4
.Lfunc_end70:
	.size	__memset, .Lfunc_end70-__memset
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
	beq	.LBB71_1
; %bb.15:
	jmp	.LBB71_13
.LBB71_1:
	ldx	__rc4
	cpx	__rc2
	bcc	.LBB71_2
; %bb.17:
	jmp	.LBB71_14
.LBB71_2:
	lda	__rc7
	bne	.LBB71_4
; %bb.3:
	lda	__rc6
	beq	.LBB71_12
.LBB71_4:                               ; =>This Inner Loop Header: Depth=1
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
	bne	.LBB71_6
; %bb.5:                                ;   in Loop: Header=BB71_4 Depth=1
	dec	__rc9
.LBB71_6:                               ;   in Loop: Header=BB71_4 Depth=1
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
	bne	.LBB71_8
; %bb.7:                                ;   in Loop: Header=BB71_4 Depth=1
	dec	__rc11
.LBB71_8:                               ;   in Loop: Header=BB71_4 Depth=1
	lda	(__rc8)
	sta	(__rc10)
	ldx	__rc7
	ldy	__rc6
	tya
	dey
	cmp	#0
	bne	.LBB71_10
; %bb.9:                                ;   in Loop: Header=BB71_4 Depth=1
	dex
.LBB71_10:                              ;   in Loop: Header=BB71_4 Depth=1
	sty	__rc6
	stx	__rc7
	txa
	bne	.LBB71_4
; %bb.11:                               ;   in Loop: Header=BB71_4 Depth=1
	tya
	bne	.LBB71_4
.LBB71_12:
	rts
.LBB71_13:
	cpx	__rc3
	bcs	.LBB71_14
; %bb.19:
	jmp	.LBB71_2
.LBB71_14:
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
.Lfunc_end71:
	.size	memmove, .Lfunc_end71-memmove
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

	.type	offsCurrIdx,@object             ; @offsCurrIdx
	.section	.zp.bss.offsCurrIdx,"aw",@nobits
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

	.type	BAMsector,@object               ; @BAMsector
	.section	.bss.BAMsector,"aw",@nobits
BAMsector:
	.zero	4
	.size	BAMsector, 4

	.type	worksector,@object              ; @worksector
	.section	.bss.worksector,"aw",@nobits
worksector:
	.zero	4
	.size	worksector, 4

	.type	worksectorasBAM.0,@object       ; @worksectorasBAM.0
	.section	.bss.worksectorasBAM.0,"aw",@nobits
worksectorasBAM.0:
	.short	0
	.size	worksectorasBAM.0, 2

	.type	direntryblock.0,@object         ; @direntryblock.0
	.section	.zp.bss.direntryblock.0,"aw",@nobits
direntryblock.0:
	.short	0
	.size	direntryblock.0, 2

	.type	direntryblock.1,@object         ; @direntryblock.1
	.section	.bss.direntryblock.1,"aw",@nobits
direntryblock.1:
	.short	0
	.size	direntryblock.1, 2

	.type	BAMside,@object                 ; @BAMside
	.section	.bss.BAMside,"aw",@nobits
BAMside:
	.byte	0                               ; 0x0
	.size	BAMside, 1

	.type	workside,@object                ; @workside
	.section	.bss.workside,"aw",@nobits
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
	.section	.rodata..Lswitch.table.gettype,"a",@progbits
.Lswitch.table.gettype:
	.ascii	"SPURC"
	.size	.Lswitch.table.gettype, 5

	.type	.Lswitch.table.gettype.38,@object ; @switch.table.gettype.38
	.section	.rodata..Lswitch.table.gettype.38,"a",@progbits
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
	.section	.zp.bss.s,"aw",@nobits
s:
	.zero	40
	.size	s, 40

	.type	.L.str.1.29,@object             ; @.str.1.29
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1.29:
	.asciz	"%4d"
	.size	.L.str.1.29, 4

	.type	.L.str.2.30,@object             ; @.str.2.30
.L.str.2.30:
	.asciz	" Choose disk image file: "
	.size	.L.str.2.30, 26

	.type	.L.str.3.31,@object             ; @.str.3.31
.L.str.3.31:
	.asciz	"mount failed"
	.size	.L.str.3.31, 13

	.type	curfile,@object                 ; @curfile
	.section	.bss.curfile,"aw",@nobits
curfile:
	.zero	65
	.size	curfile, 65

	.type	.L.str.4.32,@object             ; @.str.4.32
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4.32:
	.asciz	"val="
	.size	.L.str.4.32, 5

	.type	.L.str.5.35,@object             ; @.str.5.35
.L.str.5.35:
	.asciz	"already mounted"
	.size	.L.str.5.35, 16

	.type	.L.str.6.36,@object             ; @.str.6.36
.L.str.6.36:
	.asciz	" "
	.size	.L.str.6.36, 2

	.type	.L.str.7.37,@object             ; @.str.7.37
.L.str.7.37:
	.asciz	"not yet implemented"
	.size	.L.str.7.37, 20

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
	.zero	31
	.size	.Lzp_stack, 31

.set .L__udivmodhi4_zp_stk, .Lzp_stack+30
	.size	.L__udivmodhi4_zp_stk, 1
.set .Lcputsxy_zp_stk, .Lzp_stack+21
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
.set .Lmprintf_zp_stk, .Lzp_stack
	.size	.Lmprintf_zp_stk, 21
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
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.ident	"clang version 17.0.0 (https://github.com/llvm-mos/llvm-mos 120a489efa585bd89193ff5afd48a00a6ab7dd00)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym escNOP
	.addrsig_sym _out_buffer
	.addrsig_sym _out_null
	.addrsig_sym readdir_dirent
	.addrsig_sym fnamehi
	.addrsig_sym offsCurrIdx
	.addrsig_sym flagCurrSec
	.addrsig_sym filelist
	.addrsig_sym s
	.addrsig_sym curfile
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

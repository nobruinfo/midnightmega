.section .text,"ax",@progbits
.global lpoke, lpeek
; --- begin nobruinfo ---
; .section code, "a"
fourbytes:
        .byte  $0
        .byte  $0
        .byte  $0
        .byte  $0
lpstore:
		pha
		lda __rc5
		sta fourbytes
		lda __rc6
		sta fourbytes+1
		lda __rc7
		sta fourbytes+2
		lda __rc8
		sta fourbytes+3
		pla
		rts
lprestore:
		pha
		lda fourbytes
		sta __rc5
		lda fourbytes+1
		sta __rc6
		lda fourbytes+2
		sta __rc7
		lda fourbytes+3
		sta __rc8
		pla
        rts
; ---  end  nobruinfo ---
lpoke:
; --- begin nobruinfo ---
        jsr lpstore
; ---  end  nobruinfo ---
        ; copy 32-bit input address (a, x, rc2-rc3) to rc5-rc8
        sta __rc5
        stx __rc6
        lda __rc2
        sta __rc7
        lda __rc3
        sta __rc8
        ; 8-bit input value (rc4)
        lda __rc4
        ldz #0
        nop
        sta (__rc5), z
; --- begin nobruinfo ---
        jsr lprestore
; ---  end  nobruinfo ---
        rts
lpeek:
; --- begin nobruinfo ---
        jsr lpstore
; ---  end  nobruinfo ---
        ; copy 32-bit input address (a, x, rc2-rc3) to rc4-rc7
        sta __rc4
        stx __rc5
        lda __rc2
        sta __rc6
        lda __rc3
        sta __rc7
        ldz #0
        nop
        lda (__rc4), z
; --- begin nobruinfo ---
        jsr lprestore
; ---  end  nobruinfo ---
        rts

// Midnightmega is an approach to a file manager
.cpu _45gs02
  // MEGA65 platform PRG executable starting in MEGA65 mode.
.file [name="midnightmega.prg", type="prg", segments="Program"]
.segmentdef Program [segments="Basic, Code, Data"]
.segmentdef Basic [start=$2001]
.segmentdef Code [start=$2017]
.segmentdef Data [startAfter="Code"]
.segment Basic
.byte $0a, $20, $0a, $00, $fe, $02, $20, $30, $00       // 10 BANK 0
.byte $15, $20, $14, $00, $9e, $20                      // 20 SYS 
.text toIntString(__start)                                   //         NNNN
.byte $00, $00, $00                                     // 
  /// Map 2nd KB of colour RAM $DC00-$DFFF (hiding CIA's)
  .const CRAM2K = 1
  .const LIGHT_BLUE = $e
  .const BINARY = 2
  .const OCTAL = 8
  .const DECIMAL = $a
  .const HEXADECIMAL = $10
  .const SIZEOF_STRUCT___0 = $57
  .const SIZEOF_POINTER = 2
  .const OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS = 1
  .const OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC1 = 1
  .const OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC2 = 2
  .const OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC3 = 3
  .const OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC4 = 4
  .const OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC5 = 5
  .const OFFSET_STRUCT_STRUCTDATABLOCK_CHNSECTOR = 1
  .const OFFSET_STRUCT_STRUCTDATABLOCK_DATA = 2
  .const OFFSET_STRUCT_MEGA65_VICIV_CONTROLB = $31
  .const OFFSET_STRUCT_MEGA65_VICIV_CONTROLC = $54
  .const OFFSET_STRUCT_STRUCTBAM_ENTRY = $10
  .const STACK_BASE = $103
  .const SIZEOF_STRUCT_PRINTF_BUFFER_NUMBER = $c
  // TRAP Writing triggers hypervisor trap $00
  .label HTRAP00 = $d640
  /// I/O Personality selection
  .label IO_KEY = $d02f
  /// C65 Banking Register
  .label IO_BANK = $d030
  /// The VIC IV
  .label VICIV = $d000
  /// Color Ram
  .label COLORRAM = $d800
  /// Default address of screen character matrix
  .label DEFAULT_SCREEN = $800
  // [256 + 12];
  .label entry = _readdir_dirent
  .label kbscan = $d610
  // The number of bytes on the screen
  // The current cursor x-position
  .label conio_cursor_x = $59
  // The current cursor y-position
  .label conio_cursor_y = $5d
  // The current text cursor line start
  .label conio_line_text = $5e
  // The current color cursor line start
  .label conio_line_color = $60
  // Gibt es im Basic eine Möglichkeit festzustellen um was für
  // ein Laufwerk es sich bei U8 oder U9 handelt, also ob es das
  // interne oder ein .d81 Image ist ?
  // gardners: Du könntest $D6A9 peeken und die Bits daraus lesen
  .label retval = $46
  // unsigned char ptrMiniOffs = $DE;
  .label ptrMiniOffs = $48
  // = "";
  .label offsCurrIdx = $63
  .label flagCurrSec = $64
  .label datNextTrk = $54
  .label datNextSec = $55
  .label workside = $58
  .label i = $3f
.segment Code
__start: {
    ldz #0
    stz.z conio_cursor_x
    stz.z conio_cursor_y
    lda #<DEFAULT_SCREEN
    sta.z conio_line_text
    lda #>DEFAULT_SCREEN
    sta.z conio_line_text+1
    lda #<COLORRAM
    sta.z conio_line_color
    lda #>COLORRAM
    sta.z conio_line_color+1
    stz.z retval
    tza
    sta.z ptrMiniOffs
    sta.z ptrMiniOffs+1
    lda #<0>>$10
    sta.z ptrMiniOffs+2
    lda #>0>>$10
    sta.z ptrMiniOffs+3
    stz.z offsCurrIdx
    stz.z flagCurrSec
    stz.z datNextTrk
    stz.z datNextSec
    jsr conio_mega65_init
    jsr main
    rts
}
// Enable 2K Color ROM
conio_mega65_init: {
    // Position cursor at current line
    .label BASIC_CURSOR_LINE = $eb
    sei
    // Map memory to BANK 0 : 0x00XXXX - giving access to I/O
    jsr memoryRemap
    // Enable the VIC 4
    ldz #$47
    stz IO_KEY
    ldz #$53
    stz IO_KEY
    // Enable 2K Color RAM
    lda #CRAM2K
    ora IO_BANK
    sta IO_BANK
    lda.z BASIC_CURSOR_LINE
    inc
    cmp #$19
    bcc __b1
    lda #$19-1
  __b1:
    jsr gotoxy
    rts
}
// Output one character at the current cursor position
// Moves the cursor forward. Scrolls the entire screen if needed
// void cputc(__register(A) char c)
cputc: {
    .const OFFSET_STACK_C = 0
    tsx
    lda STACK_BASE+OFFSET_STACK_C,x
    cmp #'\n'
    beq __b1
    ldz conio_cursor_x
    sta (conio_line_text),z
    lda #LIGHT_BLUE
    sta (conio_line_color),z
    inc.z conio_cursor_x
    ldz #$50
    cpz.z conio_cursor_x
    bne __breturn
    jsr cputln
  __breturn:
    rts
  __b1:
    jsr cputln
    rts
}
// KickC calls conio_mega65_init() before doing main():
main: {
    .label __3 = 9
    .label __5 = $18
    .label __17 = $2c
    .label __36 = $3d
    .label j = $5b
    .label fd = $57
    .label i = $4c
    .label readerr = $47
    /*
	// Enable MEGA65 features
    VICIII->KEY = 0x47;   
    VICIII->KEY = 0x53;
    // Enable 48MHz fast mode
    VICIV->CONTROLB |= 0x40;
    VICIV->CONTROLC |= 0x40;
    // no kernal or BASIC rom visible
    *PROCPORT_DDR = PROCPORT_DDR_MEMORY_MASK;
    *PROCPORT = PROCPORT_BASIC_KERNEL_IO; // PROCPORT_RAM_IO;
*/
    // Disable 48MHz fast mode
    lda #$40^$ff
    and VICIV+OFFSET_STRUCT_MEGA65_VICIV_CONTROLB
    sta VICIV+OFFSET_STRUCT_MEGA65_VICIV_CONTROLB
    lda #$40^$ff
    and VICIV+OFFSET_STRUCT_MEGA65_VICIV_CONTROLC
    sta VICIV+OFFSET_STRUCT_MEGA65_VICIV_CONTROLC
    jsr waitfornokey
    jsr clrscr
    lda #0
    jsr gotoxy
    //    printf("\0e");  // upper/lower case mode
    //	POKE $D018,PEEK($D018) AND $F0 OR $04  // uppercase
    //	POKE $D018,PEEK($D018) AND $F0 OR $06  // lowercase
    //	PRINT CHR$(9)  // enable toggle case
    //	PRINT CHR$(8)  // disable toggle case
    lda $d018
    ora #6
    sta $d018
    jsr hyppo_setname
    sta.z __3
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s
    sta.z printf_str.s
    lda #>s
    sta.z printf_str.s+1
    jsr printf_str
    lda.z __3
    sta.z printf_sint.value
    lda #0
    sta.z printf_sint.value+1
    jsr printf_sint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<@s2
    sta.z printf_str.s
    lda #>@s2
    sta.z printf_str.s+1
    jsr printf_str
    jsr hyppo_d81attach1
    sta.z __5
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s2
    sta.z printf_str.s
    lda #>s2
    sta.z printf_str.s+1
    jsr printf_str
    lda.z __5
    sta.z printf_sint.value
    lda #0
    sta.z printf_sint.value+1
    jsr printf_sint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s1
    sta.z printf_str.s
    lda #>s1
    sta.z printf_str.s+1
    jsr printf_str
  __b1:
    jsr waitforkeyandletgo
    txa
    cmp #0
    beq __b1
    jsr clrscr
    ldz #0
    stz.z i
  //  for (char i=0; i <= 12; i++) {
  __b3:
    lda.z i
    cmp #$20+1
    bcc __b23
    //  testbam();
    jsr testsectors
    cli
    rts
  __b23:
    lda.z i
    sta.z hyppo_selectdrive.nb
    jsr hyppo_selectdrive
    sta.z j
    lda.z i
    cmp.z j
    bcs __b5
  __b6:
    inc.z i
    jmp __b3
  __b5:
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s4
    sta.z printf_str.s
    lda #>s4
    sta.z printf_str.s+1
    jsr printf_str
    lda.z i
    sta.z printf_sint.value
    lda #0
    sta.z printf_sint.value+1
    jsr printf_sint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s5
    sta.z printf_str.s
    lda #>s5
    sta.z printf_str.s+1
    jsr printf_str
    lda.z j
    sta.z printf_sint.value
    lda #0
    sta.z printf_sint.value+1
    jsr printf_sint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<@s2
    sta.z printf_str.s
    lda #>@s2
    sta.z printf_str.s+1
    jsr printf_str
    jsr hyppo_getcurrentdrive
    sta.z __17
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s7
    sta.z printf_str.s
    lda #>s7
    sta.z printf_str.s+1
    jsr printf_str
    lda.z __17
    sta.z printf_sint.value
    lda #0
    sta.z printf_sint.value+1
    jsr printf_sint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s1
    sta.z printf_str.s
    lda #>s1
    sta.z printf_str.s+1
    jsr printf_str
    jsr hyppo_opendir
    sta.z fd
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s9
    sta.z printf_str.s
    lda #>s9
    sta.z printf_str.s+1
    jsr printf_str
    lda.z fd
    sta.z printf_uint.uvalue
    lda #0
    sta.z printf_uint.uvalue+1
    ldz #2
    stz.z printf_uint.format_min_length
    jsr printf_uint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s1
    sta.z printf_str.s
    lda #>s1
    sta.z printf_str.s+1
    jsr printf_str
    ldz #$84
    cpz.z fd
    bne !__b6+
    jmp __b6
  !__b6:
    ldz #$87
    cpz.z fd
    bne __b7
    jmp __b6
  __b7:
    lda.z fd
    sta.z hyppo_readdir.filedescriptor
    jsr hyppo_readdir
    sta.z readerr
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s11
    sta.z printf_str.s
    lda #>s11
    sta.z printf_str.s+1
    jsr printf_str
    lda.z readerr
    sta.z printf_uint.uvalue
    lda #0
    sta.z printf_uint.uvalue+1
    ldz #4
    stz.z printf_uint.format_min_length
    jsr printf_uint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<@s2
    sta.z printf_str.s
    lda #>@s2
    sta.z printf_str.s+1
    jsr printf_str
    ldz #$85
    cpz.z readerr
    beq __b8
    ldz #$ff
    cpz.z readerr
    bne __b9
  __b8:
    ldz #$85
    cpz.z readerr
    beq __b10
    ldz #$ff
    cpz.z readerr
    bne __b7
  __b10:
    lda.z fd
    sta.z hyppo_closedir.filedescriptor
    jsr hyppo_closedir
    sta.z __36
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s15
    sta.z printf_str.s
    lda #>s15
    sta.z printf_str.s+1
    jsr printf_str
    lda.z __36
    sta.z printf_uint.uvalue
    lda #0
    sta.z printf_uint.uvalue+1
    ldz #2
    stz.z printf_uint.format_min_length
    jsr printf_uint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s1
    sta.z printf_str.s
    lda #>s1
    sta.z printf_str.s+1
    jsr printf_str
  __b11:
    jsr waitforkeyandletgo
    txa
    cmp #0
    beq __b11
    jmp __b6
  __b9:
    jsr getsfn
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s13
    sta.z printf_str.s
    lda #>s13
    sta.z printf_str.s+1
    jsr printf_str
    jsr printf_string
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s1
    sta.z printf_str.s
    lda #>s1
    sta.z printf_str.s+1
    jsr printf_str
    jmp __b8
  .segment Data
    filename: .text "NOBRU.D81"
    .byte 0
    s: .text "hyppo_setname is: "
    .byte 0
    s2: .text "hyppo_d81attach1 is: "
    .byte 0
    s4: .text "hyppo_selectdrive "
    .byte 0
    s5: .text " is: "
    .byte 0
    s7: .text "hyppo_getcurrentdrive is: "
    .byte 0
    s9: .text "hyppo_opendir, file descriptor is: "
    .byte 0
    s11: .text "hyppo_readdir, err is: "
    .byte 0
    s13: .text "filename is: "
    .byte 0
    s15: .text "hyppo_closedir is: "
    .byte 0
}
.segment Code
// Remap some of the eight 8K memory blocks in the 64K address space of the 6502 to point somewhere else in the first 1MB memory space of the MEGA65.
// After the remapping the CPU will access the mapped memory whenever it uses instructions that access a remapped block.
// See section 2.3.4 in http://www.zimmers.net/cbmpics/cbm/c65/c65manual.txt for a description of the CPU memory remapper of the C65.
// remapBlocks: Indicates which 8K blocks of the 6502 address space to remap. Each bit represents one 8K block
// - bit 0  Memory block $0000-$1fff. Use constant MEMORYBLOCK_0000.
// - bit 1  Memory block $2000-$3fff. Use constant MEMORYBLOCK_2000.
// - bit 2  Memory block $4000-$5fff. Use constant MEMORYBLOCK_4000.
// - bit 3  Memory block $6000-$7fff. Use constant MEMORYBLOCK_6000.
// - bit 4  Memory block $8000-$9fff. Use constant MEMORYBLOCK_8000.
// - bit 5  Memory block $a000-$bfff. Use constant MEMORYBLOCK_A000.
// - bit 6  Memory block $c000-$dfff. Use constant MEMORYBLOCK_C000.
// - bit 7  Memory block $e000-$ffff. Use constant MEMORYBLOCK_E000.
// lowerPageOffset: Offset that will be added to any remapped blocks in the lower 32K of memory (block 0-3).
// The offset is a page offset (meaning it is multiplied by 0x100). Only the lower 12bits of the passed value is used.
// - If block 0 ($0000-$1fff) is remapped it will point to lowerPageOffset*$100.
// - If block 1 ($2000-$3fff) is remapped it will point to lowerPageOffset*$100 + $2000.
// - If block 2 ($4000-$5fff) is remapped it will point to lowerPageOffset*$100 + $4000.
// - If block 3 ($6000-$7fff) is remapped it will point to lowerPageOffset*$100 + $6000.
// upperPageOffset: Offset that will be added to any remapped blocks in the upper 32K of memory (block 4-7).
// The offset is a page offset (meaning it is multiplied by 0x100). Only the lower 12bits of the passed value is used.
// - If block 4 ($8000-$9fff) is remapped it will point to upperPageOffset*$100 + $8000
// - If block 5 ($a000-$bfff) is remapped it will point to upperPageOffset*$100 + $a000.
// - If block 6 ($c000-$dfff) is remapped it will point to upperPageOffset*$100 + $c000.
// - If block 7 ($e000-$ffff) is remapped it will point to upperPageOffset*$100 + $e000.
// void memoryRemap(char remapBlocks, unsigned int lowerPageOffset, unsigned int upperPageOffset)
memoryRemap: {
    .label aVal = $5c
    .label xVal = $5a
    .label yVal = $56
    .label zVal = $53
    // lower blocks offset page low
    ldz #0
    stz.z aVal
    // lower blocks to map + lower blocks offset high nibble
    stz.z xVal
    // upper blocks offset page
    stz.z yVal
    // upper blocks to map + upper blocks offset page high nibble
    stz.z zVal
    lda aVal
    ldx xVal
    ldy yVal
    map
    eom
    rts
}
// Set the cursor to the specified position
// void gotoxy(char x, __register(A) char y)
gotoxy: {
    .label __5 = $4f
    .label __6 = $44
    .label __7 = $44
    .label line_offset = $44
    .label __8 = $4d
    .label __9 = $44
    cmp #$19+1
    bcc __b2
    lda #0
  __b2:
    ldz #0
    stz.z conio_cursor_x
    sta.z conio_cursor_y
    sta.z __7
    tza
    sta.z __7+1
    lda.z __7
    asl
    sta.z __8
    lda.z __7+1
    rol
    sta.z __8+1
    asl.z __8
    rol.z __8+1
    clc
    lda.z __9
    adc.z __8
    sta.z __9
    lda.z __9+1
    adc.z __8+1
    sta.z __9+1
    asw line_offset
    asw line_offset
    asw line_offset
    asw line_offset
    lda.z line_offset
    clc
    adc #<DEFAULT_SCREEN
    sta.z __5
    lda.z line_offset+1
    adc #>DEFAULT_SCREEN
    sta.z __5+1
    lda.z __5
    sta.z conio_line_text
    lda.z __5+1
    sta.z conio_line_text+1
    lda.z __6
    clc
    adc #<COLORRAM
    sta.z __6
    lda.z __6+1
    adc #>COLORRAM
    sta.z __6+1
    lda.z __6
    sta.z conio_line_color
    lda.z __6+1
    sta.z conio_line_color+1
    rts
}
// Print a newline
cputln: {
    lda #$50
    clc
    adc.z conio_line_text
    sta.z conio_line_text
    bcc !+
    inc.z conio_line_text+1
  !:
    lda #$50
    clc
    adc.z conio_line_color
    sta.z conio_line_color
    bcc !+
    inc.z conio_line_color+1
  !:
    ldz #0
    stz.z conio_cursor_x
    inc.z conio_cursor_y
    jsr cscroll
    rts
}
waitfornokey: {
  __b1:
    jsr kbhit3
    cmp #0
    bne __b1
    rts
}
// clears the screen and moves the cursor to the upper left-hand corner of the screen.
clrscr: {
    .label line_text = 2
    .label line_cols = $a
    lda #<COLORRAM
    sta.z line_cols
    lda #>COLORRAM
    sta.z line_cols+1
    lda #<DEFAULT_SCREEN
    sta.z line_text
    lda #>DEFAULT_SCREEN
    sta.z line_text+1
    ldx #0
  __b1:
    cpx #$19
    bcc __b2
    ldz #0
    stz.z conio_cursor_x
    stz.z conio_cursor_y
    lda #<DEFAULT_SCREEN
    sta.z conio_line_text
    lda #>DEFAULT_SCREEN
    sta.z conio_line_text+1
    lda #<COLORRAM
    sta.z conio_line_color
    lda #>COLORRAM
    sta.z conio_line_color+1
    rts
  __b2:
    ldz #0
  __b3:
    cpz #$50
    bcc __b4
    lda #$50
    clc
    adc.z line_text
    sta.z line_text
    bcc !+
    inc.z line_text+1
  !:
    lda #$50
    clc
    adc.z line_cols
    sta.z line_cols
    bcc !+
    inc.z line_cols+1
  !:
    inx
    jmp __b1
  __b4:
    lda #' '
    sta (line_text),z
    lda #LIGHT_BLUE
    sta (line_cols),z
    inz
    jmp __b3
}
// __register(A) char hyppo_setname(char *filename)
hyppo_setname: {
    jsr strcpy
    ldx #$00    // shouldn't be necessary
	ldy #>(Hyppo_Filename)
    lda #$2e
	sta HTRAP00
	clv
	bcc error
    sta retval
	jmp done
error:
	lda #$ff
    sta retval
done:
    nop
  
    lda.z retval
    rts
}
/// Print a NUL-terminated string
// void printf_str(__zp(2) void (*putc)(char), __zp($a) const char *s)
printf_str: {
    .label s = $a
    .label putc = 2
  __b1:
    ldy #0
    lda (s),y
    inw.z s
    cmp #0
    bne __b2
    rts
  __b2:
    pha
    jsr icall1
    pla
    jmp __b1
  icall1:
    jmp (putc)
}
// Print a signed integer using a specific format
// void printf_sint(void (*putc)(char), __zp(2) int value, char format_min_length, char format_justify_left, char format_sign_always, char format_zero_padding, char format_upper_case, char format_radix)
printf_sint: {
    .label value = 2
    // Handle any sign
    ldz #0
    stz printf_buffer
    lda.z value+1
    bmi __b1
    jmp __b2
  __b1:
    lda #0
    sec
    sbc.z value
    sta.z value
    lda #0
    sbc.z value+1
    sta.z value+1
    ldz #'-'
    stz printf_buffer
  __b2:
    lda #DECIMAL
    jsr utoa
    lda printf_buffer
    sta.z printf_number_buffer.buffer_sign
  // Print using format
    ldz #0
    stz.z printf_number_buffer.format_upper_case
    lda #<cputc
    sta.z printf_number_buffer.putc
    lda #>cputc
    sta.z printf_number_buffer.putc+1
    stz.z printf_number_buffer.format_zero_padding
    stz.z printf_number_buffer.format_justify_left
    ldx #0
    jsr printf_number_buffer
    rts
}
hyppo_d81attach1: {
    // ; Get the current drive
    ldx #0
    lda #$46
    sta HTRAP00
    clv
    bcc error
    sta retval
    jmp done
  error:
    lda #$ff
    sta retval
  done:
    nop
    lda.z retval
    rts
}
waitforkeyandletgo: {
  __b1:
  // mega65-book.pdf#20d
    jsr kbhit2
    cmp #0
    bne __b1
  __b2:
  // wait until buffer empty
    jsr kbhit2
    tax
    cpx #0
    beq __b2
  __b3:
  // wait and read key
    jsr kbhit2
    cmp #0
    bne __b3
    rts
}
testsectors: {
    .label __28 = $10
    .label __29 = 7
    .label __30 = $12
    .label BAMside = $62
    .label ws = $12
    lda #<$4000
    sta BAMsector
    lda #>$4000
    sta BAMsector+1
    lda #<$4100
    sta BAMsector+1*SIZEOF_POINTER
    lda #>$4100
    sta BAMsector+1*SIZEOF_POINTER+1
    lda #<$4200
    sta worksector
    lda #>$4200
    sta worksector+1
    lda #<$4300
    sta worksector+1*SIZEOF_POINTER
    lda #>$4300
    sta worksector+1*SIZEOF_POINTER+1
    lda #<$4200
    sta worksectorasBAM
    lda #>$4200
    sta worksectorasBAM+1
    lda #<$4300
    sta worksectorasBAM+1*SIZEOF_POINTER
    lda #>$4300
    sta worksectorasBAM+1*SIZEOF_POINTER+1
    jsr _miniInit
    lda BAMsector
    sta.z GetWholeSector.entry
    lda BAMsector+1
    sta.z GetWholeSector.entry+1
  //  datNextTrk = BAMTRACK;
  //  datNextSec = BAMSECT;
  //  _miniReadNextSector(DRIVE); // drive
    ldy #1
    ldx #$28
    jsr GetWholeSector
    stx.z BAMside
    ldz #2
    stz.z datNextTrk
    ldz #0
    stz.z i
  __b1:
    lda.z i
    cmp #$28-2
    bcs !__b2+
    jmp __b2
  !__b2:
    lda BAMsector
    sta.z PutWholeSector.entry
    lda BAMsector+1
    sta.z PutWholeSector.entry+1
    lda.z BAMside
    sta.z PutWholeSector.side
    ldx #$28
    ldz #1
    stz.z PutWholeSector.sector
    jsr PutWholeSector
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s13
    sta.z printf_str.s
    lda #>s13
    sta.z printf_str.s+1
    jsr printf_str
    lda.z datNextTrk
    sta.z printf_sint.value
    lda #0
    sta.z printf_sint.value+1
    jsr printf_sint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s14
    sta.z printf_str.s
    lda #>s14
    sta.z printf_str.s+1
    jsr printf_str
    lda.z datNextSec
    sta.z printf_sint.value
    lda #0
    sta.z printf_sint.value+1
    jsr printf_sint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s15
    sta.z printf_str.s
    lda #>s15
    sta.z printf_str.s+1
    jsr printf_str
    lda.z BAMside
    sta.z printf_sint.value
    lda #0
    sta.z printf_sint.value+1
    jsr printf_sint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s16
    sta.z printf_str.s
    lda #>s16
    sta.z printf_str.s+1
    jsr printf_str
    rts
  __b2:
    lda.z i
    sta.z datNextSec
    lda worksectorasBAM
    sta.z GetWholeSector.entry
    lda worksectorasBAM+1
    sta.z GetWholeSector.entry+1
    ldx.z datNextTrk
    ldy.z datNextSec
    jsr GetWholeSector
    stx.z workside
    txa
    asl
    /*struct*/
    tay
    lda worksector,y
    sta.z ws
    lda worksector+1,y
    sta.z ws+1
    lda.z datNextTrk
    ldy #0
    sta (ws),y
    lda.z datNextSec
    inc
    ldz #OFFSET_STRUCT_STRUCTDATABLOCK_CHNSECTOR
    sta (ws),z
    lda.z datNextTrk
    ldz #OFFSET_STRUCT_STRUCTDATABLOCK_DATA
    sta (ws),z
    ldx.z datNextSec
    inx
    tza
    clc
    adc.z ws
    sta.z __28
    tya
    adc.z ws+1
    sta.z __28+1
    ldz #1
    txa
    sta (__28),z
    lda #OFFSET_STRUCT_STRUCTDATABLOCK_DATA
    clc
    adc.z ws
    sta.z __29
    tya
    adc.z ws+1
    sta.z __29+1
    lda #$ee
    ldz #$fc
    sta (__29),z
    // test highest byte
    lda #OFFSET_STRUCT_STRUCTDATABLOCK_DATA
    clc
    adc.z __30
    sta.z __30
    bcc !+
    inc.z __30+1
  !:
    // test highest byte
    lda #$aa
    ldz #$fd
    sta (__30),z
    lda.z BAMside
    asl
    tay
    lda BAMsector,y
    sta.z BAMSectorUpdate.BAMsector
    lda BAMsector+1,y
    sta.z BAMSectorUpdate.BAMsector+1
    ldx.z datNextTrk
    lda.z i
    // test highest byte
    jsr BAMSectorUpdate
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s
    sta.z printf_str.s
    lda #>s
    sta.z printf_str.s+1
    jsr printf_str
    lda.z i
    sta.z printf_sint.value
    lda #0
    sta.z printf_sint.value+1
    jsr printf_sint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s1
    sta.z printf_str.s
    lda #>s1
    sta.z printf_str.s+1
    jsr printf_str
    lda.z workside
    sta.z printf_sint.value
    lda #0
    sta.z printf_sint.value+1
    jsr printf_sint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s2
    sta.z printf_str.s
    lda #>s2
    sta.z printf_str.s+1
    jsr printf_str
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s3
    sta.z printf_str.s
    lda #>s3
    sta.z printf_str.s+1
    jsr printf_str
    lda $4100
    ldz #2
    stz.z printf_uchar.format_min_length
    jsr printf_uchar
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s2
    sta.z printf_str.s
    lda #>s2
    sta.z printf_str.s+1
    jsr printf_str
    lda $4101
    ldz #2
    stz.z printf_uchar.format_min_length
    jsr printf_uchar
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s2
    sta.z printf_str.s
    lda #>s2
    sta.z printf_str.s+1
    jsr printf_str
    lda $41fe
    ldz #2
    stz.z printf_uchar.format_min_length
    jsr printf_uchar
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s2
    sta.z printf_str.s
    lda #>s2
    sta.z printf_str.s+1
    jsr printf_str
    lda $41ff
    ldz #2
    stz.z printf_uchar.format_min_length
    jsr printf_uchar
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<@s1
    sta.z printf_str.s
    lda #>@s1
    sta.z printf_str.s+1
    jsr printf_str
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s8
    sta.z printf_str.s
    lda #>s8
    sta.z printf_str.s+1
    jsr printf_str
    lda $4000
    sta.z printf_uint.uvalue
    lda #0
    sta.z printf_uint.uvalue+1
    ldz #4
    stz.z printf_uint.format_min_length
    jsr printf_uint
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s2
    sta.z printf_str.s
    lda #>s2
    sta.z printf_str.s+1
    jsr printf_str
    lda $4001
    ldz #4
    stz.z printf_uchar.format_min_length
    jsr printf_uchar
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s2
    sta.z printf_str.s
    lda #>s2
    sta.z printf_str.s+1
    jsr printf_str
    lda $4002
    ldz #4
    stz.z printf_uchar.format_min_length
    jsr printf_uchar
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s2
    sta.z printf_str.s
    lda #>s2
    sta.z printf_str.s+1
    jsr printf_str
    lda $4003
    ldz #4
    stz.z printf_uchar.format_min_length
    jsr printf_uchar
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<@s1
    sta.z printf_str.s
    lda #>@s1
    sta.z printf_str.s+1
    jsr printf_str
    lda worksectorasBAM
    sta.z PutWholeSector.entry
    lda worksectorasBAM+1
    sta.z PutWholeSector.entry+1
    lda.z workside
    sta.z PutWholeSector.side
    ldx.z datNextTrk
    lda.z datNextSec
    sta.z PutWholeSector.sector
  //	printf("entry: %04x %04x %04x %04x\n", (unsigned int) PEEK($4016),
  //		 PEEK($4017), PEEK($4018), PEEK($4019));
    jsr PutWholeSector
    inc.z i
    jmp __b1
  .segment Data
    s: .text "testsectors: sector "
    .byte 0
    s1: .text "  workside "
    .byte 0
    s3: .text "bytes "
    .byte 0
    s8: .text "testsectors: "
    .byte 0
    s13: .text "testsectors done, datNextTrk "
    .byte 0
    s14: .text "  datNextSec "
    .byte 0
    s15: .text ", BAMside "
    .byte 0
    s16: .text @"\n\n"
    .byte 0
}
.segment Code
// __register(A) char hyppo_selectdrive(__zp($51) volatile char nb)
hyppo_selectdrive: {
    .label nb = $51
    ldx nb
	lda #$06
	sta HTRAP00
	clv
	bcc error
    stx retval
	jmp done
error:
	sta retval
done:
    nop
  
    lda.z retval
    rts
}
hyppo_getcurrentdrive: {
    // ; Get the current drive
    ldx #0
    lda #4
    sta HTRAP00
    clv
    bcc error
    sta retval
    jmp done
  error:
    lda #$ff
    sta retval
  done:
    nop
    lda.z retval
    rts
}
/*
hyppo_loadfile
HTRAP00

void hyppo_loadfile(__zp unsigned long addr) {
  // Use the 45GS02 32-bit addressing mode
  asm {
        ldz #0
        lda val
        sta ((addr)),z
		
		
	; Assume the current Hyppo filename has already been set.
	; No need to find the file first.
	LDZ #$04 ; Most significant byte
	LDY #$80 ; Middle byte
	LDX #$00 ; Least significant byte
	LDA #$36 : STA HTRAP00 : CLV : BCC error
  }
}
*/
hyppo_opendir: {
    // ; Get the current drive
    ldx #0
    lda #$12
    sta HTRAP00
    clv
    bcc error
    sta retval
    jmp done
  error:
    lda #$ff
    sta retval
  done:
    nop
    lda.z retval
    rts
}
// Print an unsigned int using a specific format
// void printf_uint(void (*putc)(char), __zp(2) unsigned int uvalue, __zp($18) char format_min_length, char format_justify_left, char format_sign_always, char format_zero_padding, char format_upper_case, char format_radix)
printf_uint: {
    .label uvalue = 2
    .label format_min_length = $18
    // Handle any sign
    ldz #0
    stz printf_buffer
  // Format number into buffer
    lda #HEXADECIMAL
    jsr utoa
    lda printf_buffer
    sta.z printf_number_buffer.buffer_sign
    ldx.z format_min_length
  // Print using format
    ldz #0
    stz.z printf_number_buffer.format_upper_case
    lda #<cputc
    sta.z printf_number_buffer.putc
    lda #>cputc
    sta.z printf_number_buffer.putc+1
    ldz #1
    stz.z printf_number_buffer.format_zero_padding
    ldz #0
    stz.z printf_number_buffer.format_justify_left
    jsr printf_number_buffer
    rts
}
// char *DIRENT _readdir_dirent;
// __register(A) char hyppo_readdir(__zp($43) volatile char filedescriptor)
hyppo_readdir: {
    .label filedescriptor = $43
    //  volatile char register(Y) _rd = _readdir_dirent / 256;
    // pha
	phx
	// First, clear out the dirent
	ldx #0
	txa
@l1: sta _readdir_dirent,x	
	dex
	bne @l1
	plx
	ldx filedescriptor

	// Third, call the hypervisor trap
	// File descriptor gets passed in in X.
	// Result gets written to transfer area we setup at $0400
	ldy #>(_readdir_dirent)
	lda #$14
	sta HTRAP00
	nop

	bcs @readDirSuccess

	//  Return end of directory
	lda #$00
	ldx #$00
	// RTS
    lda #$FF
	sta retval
	jmp done

@readDirSuccess:
	lda #$00
	sta retval
done:
    nop
  
    lda #0
    ldy entry+$40
    sta entry,y
    // str terminate
    lda.z retval
    rts
}
// __register(A) char hyppo_closedir(__zp($52) volatile char filedescriptor)
hyppo_closedir: {
    .label filedescriptor = $52
    ldx filedescriptor
    lda #$16
	sta HTRAP00
	clv
	bcc error
    stx retval
	jmp done
error:
	sta retval
done:
    nop
  
    lda.z retval
    rts
}
getsfn: {
    .label i = 2
    .label i1 = $a
    .label __23 = $10
    .label __24 = $1a
    .label __25 = $1f
    .label __26 = 7
    .label __27 = $1d
    .label __28 = 4
    ldx #0
    txa
    sta.z i
    sta.z i+1
  __b1:
    lda #<entry+$41
    clc
    adc.z i
    sta.z __23
    lda #>entry+$41
    adc.z i+1
    sta.z __23+1
    lda.z i
    cmp #<8
    lda.z i+1
    sbc #>8
    bvc !+
    eor #$80
  !:
    bpl __b3
    ldy #0
    lda (__23),y
    cmp #$20
    bne __b2
  __b3:
    lda #'.'
    sta s,x
    inx
    lda #<8
    sta.z i1
    lda #>8
    sta.z i1+1
  __b6:
    lda #<entry+$41
    clc
    adc.z i1
    sta.z __26
    lda #>entry+$41
    adc.z i1+1
    sta.z __26+1
    lda.z i1
    cmp #<$b
    lda.z i1+1
    sbc #>$b
    bvc !+
    eor #$80
  !:
    bpl __b8
    ldy #0
    lda (__26),y
    cmp #$20
    bne __b7
  __b8:
    lda #0
    sta s,x
    jsr strlowr
    rts
  __b7:
    lda #<entry+$41
    clc
    adc.z i1
    sta.z __27
    lda #>entry+$41
    adc.z i1+1
    sta.z __27+1
    ldy #0
    lda (__27),y
    cmp #$20+1
    bcc __b9
    lda #<entry+$41
    clc
    adc.z i1
    sta.z __28
    lda #>entry+$41
    adc.z i1+1
    sta.z __28+1
    lda (__28),y
    sta s,x
    inx
  __b9:
    inw.z i1
    jmp __b6
  __b2:
    lda #<entry+$41
    clc
    adc.z i
    sta.z __24
    lda #>entry+$41
    adc.z i+1
    sta.z __24+1
    ldy #0
    lda (__24),y
    cmp #$20+1
    bcc __b4
    lda #<entry+$41
    clc
    adc.z i
    sta.z __25
    lda #>entry+$41
    adc.z i+1
    sta.z __25+1
    lda (__25),y
    sta s,x
    inx
  __b4:
    inw.z i
    jmp __b1
  .segment Data
    s: .fill $14, 0
}
.segment Code
// Print a string value using a specific format
// Handles justification and min length 
// void printf_string(void (*putc)(char), char *str, char format_min_length, char format_justify_left)
printf_string: {
    .label putc = cputc
    lda #<putc
    sta.z printf_str.putc
    lda #>putc
    sta.z printf_str.putc+1
    lda #<getsfn.s
    sta.z printf_str.s
    lda #>getsfn.s
    sta.z printf_str.s+1
    jsr printf_str
    rts
}
// Scroll the entire screen if the cursor is beyond the last line
cscroll: {
    ldz #$19
    cpz.z conio_cursor_y
    bne __breturn
    lda #<DEFAULT_SCREEN
    sta.z memcpy.destination
    lda #>DEFAULT_SCREEN
    sta.z memcpy.destination+1
    lda #<DEFAULT_SCREEN+$50
    sta.z memcpy.source
    lda #>DEFAULT_SCREEN+$50
    sta.z memcpy.source+1
    jsr memcpy
    lda #<COLORRAM
    sta.z memcpy.destination
    lda #>COLORRAM
    sta.z memcpy.destination+1
    lda #<COLORRAM+$50
    sta.z memcpy.source
    lda #>COLORRAM+$50
    sta.z memcpy.source+1
    jsr memcpy
    ldz #' '
    lda #<DEFAULT_SCREEN+$19*$50-$50
    sta.z memset.str
    lda #>DEFAULT_SCREEN+$19*$50-$50
    sta.z memset.str+1
    jsr memset
    ldz #LIGHT_BLUE
    lda #<COLORRAM+$19*$50-$50
    sta.z memset.str
    lda #>COLORRAM+$19*$50-$50
    sta.z memset.str+1
    jsr memset
    sec
    lda.z conio_line_text
    sbc #$50
    sta.z conio_line_text
    lda.z conio_line_text+1
    sbc #0
    sta.z conio_line_text+1
    sec
    lda.z conio_line_color
    sbc #$50
    sta.z conio_line_color
    lda.z conio_line_color+1
    sbc #0
    sta.z conio_line_color+1
    dec.z conio_cursor_y
  __breturn:
    rts
}
kbhit3: {
    //  while (*kbscan == 0);
    lda kbscan
    ldz #0
    stz kbscan
    rts
}
// Copies the C string pointed by source into the array pointed by destination, including the terminating null character (and stopping at that point).
// char * strcpy(char *destination, char *source)
strcpy: {
    .label dst = 7
    .label src = $a
    lda #<Hyppo_Filename
    sta.z dst
    lda #>Hyppo_Filename
    sta.z dst+1
    lda #<main.filename
    sta.z src
    lda #>main.filename
    sta.z src+1
  __b1:
    ldy #0
    lda (src),y
    cmp #0
    bne __b2
    tya
    tay
    sta (dst),y
    rts
  __b2:
    ldy #0
    lda (src),y
    sta (dst),y
    inw.z dst
    inw.z src
    jmp __b1
}
// Converts unsigned number value to a string representing it in RADIX format.
// If the leading digits are zero they are not included in the string.
// - value : The number to be converted to RADIX
// - buffer : receives the string representing the number and zero-termination.
// - radix : The radix to convert the number to (from the enum RADIX)
// void utoa(__zp(2) unsigned int value, __zp($12) char *buffer, __register(A) char radix)
utoa: {
    .label digit_value = 4
    .label buffer = $12
    .label value = 2
    .label started = $1c
    .label max_digits = 6
    .label digit_values = 7
    cmp #DECIMAL
    beq __b2
    cmp #HEXADECIMAL
    beq __b3
    cmp #OCTAL
    beq __b4
    cmp #BINARY
    beq __b5
    // Unknown radix
    ldz #'e'
    stz printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    ldz #'r'
    stz printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS+1
    stz printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS+2
    ldz #0
    stz printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS+3
    rts
  __b2:
    lda #<RADIX_DECIMAL_VALUES
    sta.z digit_values
    lda #>RADIX_DECIMAL_VALUES
    sta.z digit_values+1
    ldz #5
    stz.z max_digits
    jmp __b1
  __b3:
    lda #<RADIX_HEXADECIMAL_VALUES
    sta.z digit_values
    lda #>RADIX_HEXADECIMAL_VALUES
    sta.z digit_values+1
    ldz #4
    stz.z max_digits
    jmp __b1
  __b4:
    lda #<RADIX_OCTAL_VALUES
    sta.z digit_values
    lda #>RADIX_OCTAL_VALUES
    sta.z digit_values+1
    ldz #6
    stz.z max_digits
    jmp __b1
  __b5:
    lda #<RADIX_BINARY_VALUES
    sta.z digit_values
    lda #>RADIX_BINARY_VALUES
    sta.z digit_values+1
    ldz #$10
    stz.z max_digits
  __b1:
    lda #<printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    sta.z buffer
    lda #>printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    sta.z buffer+1
    ldz #0
    stz.z started
    ldx #0
  __b6:
    lda.z max_digits
    taz
    dez
    stz.z $ff
    cpx.z $ff
    bcc __b7
    ldx.z value
    lda DIGITS,x
    ldy #0
    sta (buffer),y
    inw.z buffer
    tya
    sta (buffer),y
    rts
  __b7:
    txa
    asl
    tay
    lda (digit_values),y
    sta.z digit_value
    iny
    lda (digit_values),y
    sta.z digit_value+1
    lda.z started
    bne __b10
    lda.z digit_value+1
    cmp.z value+1
    bne !+
    lda.z digit_value
    cmp.z value
    beq __b10
  !:
    bcc __b10
  __b9:
    inx
    jmp __b6
  __b10:
    lda.z buffer
    sta.z utoa_append.buffer
    lda.z buffer+1
    sta.z utoa_append.buffer+1
    jsr utoa_append
    inw.z buffer
    ldz #1
    stz.z started
    jmp __b9
}
// Print the contents of the number buffer using a specific format.
// This handles minimum length, zero-filling, and left/right justification from the format
// void printf_number_buffer(__zp($12) void (*putc)(char), __zp($2c) char buffer_sign, char *buffer_digits, __register(X) char format_min_length, __zp(6) char format_justify_left, char format_sign_always, __zp($1c) char format_zero_padding, __zp($3d) char format_upper_case, char format_radix)
printf_number_buffer: {
    .label __19 = $10
    .label buffer_sign = $2c
    .label padding = $21
    .label format_zero_padding = $1c
    .label putc = $12
    .label format_justify_left = 6
    .label format_upper_case = $3d
    cpx #0
    beq __b6
    jsr strlen
    // There is a minimum length - work out the padding
    ldy.z __19
    lda.z buffer_sign
    beq __b13
    iny
  __b13:
    txa
    sty.z $ff
    sec
    sbc.z $ff
    sta.z padding
    cmp #0
    bpl __b1
  __b6:
    ldz #0
    stz.z padding
  __b1:
    lda.z format_justify_left
    bne __b2
    lda.z format_zero_padding
    bne __b2
    lda.z padding
    cmp #0
    bne __b8
    jmp __b2
  __b8:
    lda.z putc
    sta.z printf_padding.putc
    lda.z putc+1
    sta.z printf_padding.putc+1
    lda.z padding
    sta.z printf_padding.length
    ldz #' '
    stz.z printf_padding.pad
    jsr printf_padding
  __b2:
    lda.z buffer_sign
    beq __b3
    pha
    jsr icall2
    pla
  __b3:
    lda.z format_zero_padding
    beq __b4
    lda.z padding
    cmp #0
    bne __b10
    jmp __b4
  __b10:
    lda.z putc
    sta.z printf_padding.putc
    lda.z putc+1
    sta.z printf_padding.putc+1
    lda.z padding
    sta.z printf_padding.length
    ldz #'0'
    stz.z printf_padding.pad
    jsr printf_padding
  __b4:
    lda.z format_upper_case
    beq __b5
    jsr strupr
  __b5:
    lda.z putc
    sta.z printf_str.putc
    lda.z putc+1
    sta.z printf_str.putc+1
    lda #<printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    sta.z printf_str.s
    lda #>printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    sta.z printf_str.s+1
    jsr printf_str
    lda.z format_justify_left
    beq __breturn
    lda.z format_zero_padding
    bne __breturn
    lda.z padding
    cmp #0
    bne __b12
    rts
  __b12:
    lda.z putc
    sta.z printf_padding.putc
    lda.z putc+1
    sta.z printf_padding.putc+1
    lda.z padding
    sta.z printf_padding.length
    ldz #' '
    stz.z printf_padding.pad
    jsr printf_padding
  __breturn:
    rts
  icall2:
    jmp (putc)
}
kbhit2: {
    lda $d610
    ldz #0
    stz $d610
    rts
}
/* struct MEGA65_VICIV* const VICIV = (struct MEGA65_VICIV*)0xd000;

struct BAM* const BAMsector[2] = { (struct BAM*) $4000, (struct BAM*) $4100 };
struct DATABLOCK* const worksector[2] = {
                                 (struct DATABLOCK*) $4200, (struct DATABLOCK*) $4300 };
struct BAM* const worksectorasBAM[2] = { (struct BAM*) $4200, (struct BAM*) $4300 };
*/
_miniInit: {
    ldz #0
    stz.z offsCurrIdx
    stz.z flagCurrSec
    stz.z datNextTrk
    stz.z datNextSec
    /*	ptrMiniOffs[0] = 0;    // Buffered Sector Operations:
	ptrMiniOffs[1] = 0x6C;  // mega65-book.pdf#3ec
	ptrMiniOffs[2] = 0xFD;
	ptrMiniOffs[3] = 0x0F;  */
    lda #<$ffd6c00
    sta.z ptrMiniOffs
    lda #>$ffd6c00
    sta.z ptrMiniOffs+1
    lda #<$ffd6c00>>$10
    sta.z ptrMiniOffs+2
    lda #>$ffd6c00>>$10
    sta.z ptrMiniOffs+3
    tza
    sta $d080
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s
    sta.z printf_str.s
    lda #>s
    sta.z printf_str.s+1
    jsr printf_str
    ldq.z ptrMiniOffs
    stq.z printf_ulong.uvalue
    jsr printf_ulong
    lda #<cputc
    sta.z printf_str.putc
    lda #>cputc
    sta.z printf_str.putc+1
    lda #<s1
    sta.z printf_str.s
    lda #>s1
    sta.z printf_str.s+1
    jsr printf_str
    rts
  .segment Data
    s: .text "_miniInit 32addr is: "
    .byte 0
}
.segment Code
// depending on the sector's side this returns the wanted
// sector in the regular or upper 256 bytes of the 512
// bytes buffer:
// __register(X) char GetWholeSector(__zp(7) struct structBAM *entry, char drive, __register(X) char track, __register(Y) char sector)
GetWholeSector: {
    .label ret = $2b
    .label i = $27
    .label __5 = $1f
    .label entry = 7
    .label __6 = $1d
    .label __7 = $1f
    ldz #0
    stz.z ret
    tza
    sta.z i
    sta.z i+1
    stz.z ReadSector.drive
    stx.z ReadSector.track
    sty.z ReadSector.sector
    jsr ReadSector
    cpx #1+1
    bcc __b1
    rts
  __b1:
    lda #<$ffd6c00
    sta.z ptrMiniOffs
    lda #>$ffd6c00
    sta.z ptrMiniOffs+1
    lda #<$ffd6c00>>$10
    sta.z ptrMiniOffs+2
    lda #>$ffd6c00>>$10
    sta.z ptrMiniOffs+3
    lda #<0
    sta.z i
    sta.z i+1
  __b2:
    lda.z i+1
    cmp #>$100
    bcc __b3
    bne !+
    lda.z i
    cmp #<$100
    bcc __b3
  !:
    lda #<$ffd6d00
    sta.z ptrMiniOffs
    lda #>$ffd6d00
    sta.z ptrMiniOffs+1
    lda #<$ffd6d00>>$10
    sta.z ptrMiniOffs+2
    lda #>$ffd6d00>>$10
    sta.z ptrMiniOffs+3
    lda #<0
    sta.z i
    sta.z i+1
  __b5:
    lda.z i+1
    cmp #>$100
    bcc __b6
    bne !+
    lda.z i
    cmp #<$100
    bcc __b6
  !:
    rts
  __b6:
    ldz i
    nop
    lda (ptrMiniOffs),z
    sta ret
    tza
    clc
    adc #<$100
    sta.z __5
    lda.z i+1
    adc #>$100
    sta.z __5+1
    clc
    lda.z __7
    adc.z entry
    sta.z __7
    lda.z __7+1
    adc.z entry+1
    sta.z __7+1
    lda.z ret
    ldy #0
    sta (__7),y
    inw.z i
    jmp __b5
  __b3:
    ldz i
    nop
    lda (ptrMiniOffs),z
    sta ret
    lda.z entry
    clc
    adc.z i
    sta.z __6
    lda.z entry+1
    adc.z i+1
    sta.z __6+1
    lda.z ret
    ldy #0
    sta (__6),y
    inw.z i
    jmp __b2
}
// char PutWholeSector(__zp(7) struct structBAM *entry, __zp($18) char side, char drive, __register(X) char track, __zp($2c) char sector)
PutWholeSector: {
    .label i = $29
    .label val = $26
    .label __6 = $1d
    .label entry = 7
    .label side = $18
    .label sector = $2c
    .label __7 = 4
    .label __8 = $1d
    lda #<0
    sta.z i
    sta.z i+1
    taz
    stz.z val
    lda.z side
    cmp #1+1
    bcc __b1
    rts
  __b1:
    lda #<$ffd6c00
    sta.z ptrMiniOffs
    lda #>$ffd6c00
    sta.z ptrMiniOffs+1
    lda #<$ffd6c00>>$10
    sta.z ptrMiniOffs+2
    lda #>$ffd6c00>>$10
    sta.z ptrMiniOffs+3
    lda #<0
    sta.z i
    sta.z i+1
  __b2:
    lda.z i+1
    cmp #>$100
    bcc __b3
    bne !+
    lda.z i
    cmp #<$100
    bcc __b3
  !:
    lda #<$ffd6d00
    sta.z ptrMiniOffs
    lda #>$ffd6d00
    sta.z ptrMiniOffs+1
    lda #<$ffd6d00>>$10
    sta.z ptrMiniOffs+2
    lda #>$ffd6d00>>$10
    sta.z ptrMiniOffs+3
    lda #<0
    sta.z i
    sta.z i+1
  __b5:
    lda.z i+1
    cmp #>$100
    bcc __b6
    bne !+
    lda.z i
    cmp #<$100
    bcc __b6
  !:
    lda.z sector
    sec
    sbc.z side
    ldz #0
    stz.z WriteSector.drive
    stx.z WriteSector.track
    sta.z WriteSector.sector
    jsr WriteSector
    rts
  __b6:
    lda.z i
    clc
    adc #<$100
    sta.z __6
    lda.z i+1
    adc #>$100
    sta.z __6+1
    clc
    lda.z __8
    adc.z entry
    sta.z __8
    lda.z __8+1
    adc.z entry+1
    sta.z __8+1
    ldy #0
    lda (__8),y
    sta.z val
    ldz i
    nop
    sta (ptrMiniOffs),z
    inw.z i
    jmp __b5
  __b3:
    lda.z entry
    clc
    adc.z i
    sta.z __7
    lda.z entry+1
    adc.z i+1
    sta.z __7+1
    ldy #0
    lda (__7),y
    sta.z val
    ldz i
    nop
    sta (ptrMiniOffs),z
    inw.z i
    jmp __b2
}
// this expects data in sector buffer:
// void BAMSectorUpdate(__zp($1d) struct structBAM *BAMsector, __zp(6) char track, __register(A) char sector, char set)
BAMSectorUpdate: {
    .const bitshifter = 1
    .label __60 = $3b
    .label __61 = $33
    .label __62 = $39
    .label __63 = $31
    .label __64 = 2
    .label __65 = $a
    .label __66 = $1a
    .label __67 = $1f
    .label __68 = 4
    .label __69 = $22
    .label __71 = $24
    .label __72 = $1d
    .label __126 = $3b
    .label __128 = $33
    .label __130 = $39
    .label __132 = $31
    .label __134 = 2
    .label __136 = $a
    .label __138 = $1a
    .label __140 = $1f
    .label __142 = 4
    .label __144 = $22
    .label track = 6
    .label BAMsector = $1d
    dex
    stx.z track
    // if set clear alloc bit below to allocate:
    cmp #8
    bcs !__b6+
    jmp __b6
  !__b6:
    cmp #$10
    bcs !__b7+
    jmp __b7
  !__b7:
    cmp #$18
    bcs !__b8+
    jmp __b8
  !__b8:
    cmp #$20
    bcc __b9
    sec
    sbc #$20
    tay
    lda #bitshifter
    cpy #0
    beq !e+
  !:
    asl
    dey
    bne !-
  !e:
    eor #$ff
    taz
    lda.z track
    asl
    clc
    adc.z track
    asl
    tay
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z BAMsector
    sta.z __142
    lda #0
    adc.z BAMsector+1
    sta.z __142+1
    lda #OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC5
    clc
    adc.z __68
    sta.z __68
    bcc !+
    inc.z __68+1
  !:
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z BAMsector
    sta.z __144
    lda #0
    adc.z BAMsector+1
    sta.z __144+1
    lda #OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC5
    clc
    adc.z __69
    sta.z __69
    bcc !+
    inc.z __69+1
  !:
    tza
    and (__68),y
    sta (__69),y
  __b10:
    lda.z track
    asl
    clc
    adc.z track
    asl
    tay
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z BAMsector
    sta.z __71
    lda #0
    adc.z BAMsector+1
    sta.z __71+1
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z __72
    sta.z __72
    bcc !+
    inc.z __72+1
  !:
    lda (__71),y
    sec
    sbc #1
    sta (__72),y
    rts
  __b9:
    sec
    sbc #$18
    tay
    lda #bitshifter
    cpy #0
    beq !e+
  !:
    asl
    dey
    bne !-
  !e:
    eor #$ff
    taz
    lda.z track
    asl
    clc
    adc.z track
    asl
    tay
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z BAMsector
    sta.z __138
    lda #0
    adc.z BAMsector+1
    sta.z __138+1
    lda #OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC4
    clc
    adc.z __66
    sta.z __66
    bcc !+
    inc.z __66+1
  !:
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z BAMsector
    sta.z __140
    lda #0
    adc.z BAMsector+1
    sta.z __140+1
    lda #OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC4
    clc
    adc.z __67
    sta.z __67
    bcc !+
    inc.z __67+1
  !:
    tza
    and (__66),y
    sta (__67),y
    jmp __b10
  __b8:
    sec
    sbc #$10
    tay
    lda #bitshifter
    cpy #0
    beq !e+
  !:
    asl
    dey
    bne !-
  !e:
    eor #$ff
    taz
    lda.z track
    asl
    clc
    adc.z track
    asl
    tay
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z BAMsector
    sta.z __134
    lda #0
    adc.z BAMsector+1
    sta.z __134+1
    lda #OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC3
    clc
    adc.z __64
    sta.z __64
    bcc !+
    inc.z __64+1
  !:
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z BAMsector
    sta.z __136
    lda #0
    adc.z BAMsector+1
    sta.z __136+1
    lda #OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC3
    clc
    adc.z __65
    sta.z __65
    bcc !+
    inc.z __65+1
  !:
    tza
    and (__64),y
    sta (__65),y
    jmp __b10
  __b7:
    sec
    sbc #8
    tay
    lda #bitshifter
    cpy #0
    beq !e+
  !:
    asl
    dey
    bne !-
  !e:
    eor #$ff
    taz
    lda.z track
    asl
    clc
    adc.z track
    asl
    tay
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z BAMsector
    sta.z __130
    lda #0
    adc.z BAMsector+1
    sta.z __130+1
    lda #OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC2
    clc
    adc.z __62
    sta.z __62
    bcc !+
    inc.z __62+1
  !:
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z BAMsector
    sta.z __132
    lda #0
    adc.z BAMsector+1
    sta.z __132+1
    lda #OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC2
    clc
    adc.z __63
    sta.z __63
    bcc !+
    inc.z __63+1
  !:
    tza
    and (__62),y
    sta (__63),y
    jmp __b10
  __b6:
    tay
    lda #bitshifter
    cpy #0
    beq !e+
  !:
    asl
    dey
    bne !-
  !e:
    eor #$ff
    taz
    lda.z track
    asl
    clc
    adc.z track
    asl
    tay
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z BAMsector
    sta.z __126
    lda #0
    adc.z BAMsector+1
    sta.z __126+1
    lda #OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC1
    clc
    adc.z __60
    sta.z __60
    bcc !+
    inc.z __60+1
  !:
    lda #OFFSET_STRUCT_STRUCTBAM_ENTRY
    clc
    adc.z BAMsector
    sta.z __128
    lda #0
    adc.z BAMsector+1
    sta.z __128+1
    lda #OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC1
    clc
    adc.z __61
    sta.z __61
    bcc !+
    inc.z __61+1
  !:
    tza
    and (__60),y
    sta (__61),y
    jmp __b10
}
// Print an unsigned char using a specific format
// void printf_uchar(void (*putc)(char), __register(A) char uvalue, __zp($3d) char format_min_length, char format_justify_left, char format_sign_always, char format_zero_padding, char format_upper_case, char format_radix)
printf_uchar: {
    .label format_min_length = $3d
    // Handle any sign
    ldz #0
    stz printf_buffer
    sta.z uctoa.value
  // Format number into buffer
    jsr uctoa
    lda printf_buffer
    sta.z printf_number_buffer.buffer_sign
    ldx.z format_min_length
  // Print using format
    ldz #0
    stz.z printf_number_buffer.format_upper_case
    lda #<cputc
    sta.z printf_number_buffer.putc
    lda #>cputc
    sta.z printf_number_buffer.putc+1
    ldz #1
    stz.z printf_number_buffer.format_zero_padding
    ldz #0
    stz.z printf_number_buffer.format_justify_left
    jsr printf_number_buffer
    rts
}
// char * strlowr(char *str)
strlowr: {
    .label src = 7
    lda #<getsfn.s
    sta.z src
    lda #>getsfn.s
    sta.z src+1
  __b1:
    ldy #0
    lda (src),y
    cmp #0
    bne __b2
    rts
  __b2:
    ldy #0
    lda (src),y
    jsr tolower
    ldy #0
    sta (src),y
    inw.z src
    jmp __b1
}
// Copy block of memory (forwards)
// Copies the values of num bytes from the location pointed to by source directly to the memory block pointed to by destination.
// void * memcpy(__zp($37) void *destination, __zp($2e) void *source, unsigned int num)
memcpy: {
    .label src_end = $41
    .label dst = $37
    .label src = $2e
    .label source = $2e
    .label destination = $37
    lda.z source
    clc
    adc #<$19*$50-$50
    sta.z src_end
    lda.z source+1
    adc #>$19*$50-$50
    sta.z src_end+1
  __b1:
    lda.z src+1
    cmp.z src_end+1
    bne __b2
    lda.z src
    cmp.z src_end
    bne __b2
    rts
  __b2:
    ldy #0
    lda (src),y
    sta (dst),y
    inw.z dst
    inw.z src
    jmp __b1
}
// Copies the character c (an unsigned char) to the first num characters of the object pointed to by the argument str.
// void * memset(__zp($2e) void *str, __register(Z) char c, unsigned int num)
memset: {
    .label end = $37
    .label dst = $2e
    .label str = $2e
    lda #$50
    clc
    adc.z str
    sta.z end
    lda #0
    adc.z str+1
    sta.z end+1
  __b2:
    lda.z dst+1
    cmp.z end+1
    bne __b3
    lda.z dst
    cmp.z end
    bne __b3
    rts
  __b3:
    tza
    ldy #0
    sta (dst),y
    inw.z dst
    jmp __b2
}
// Used to convert a single digit of an unsigned number value to a string representation
// Counts a single digit up from '0' as long as the value is larger than sub.
// Each time the digit is increased sub is subtracted from value.
// - buffer : pointer to the char that receives the digit
// - value : The value where the digit will be derived from
// - sub : the value of a '1' in the digit. Subtracted continually while the digit is increased.
//        (For decimal the subs used are 10000, 1000, 100, 10, 1)
// returns : the value reduced by sub * digit so that it is less than sub.
// __zp(2) unsigned int utoa_append(__zp($1a) char *buffer, __zp(2) unsigned int value, __zp(4) unsigned int sub)
utoa_append: {
    .label buffer = $1a
    .label value = 2
    .label sub = 4
    .label return = 2
    ldz #0
  __b1:
    lda.z sub+1
    cmp.z value+1
    bne !+
    lda.z sub
    cmp.z value
    beq __b2
  !:
    bcc __b2
    tza
    tay
    lda DIGITS,y
    ldy #0
    sta (buffer),y
    rts
  __b2:
    inz
    lda.z value
    sec
    sbc.z sub
    sta.z value
    lda.z value+1
    sbc.z sub+1
    sta.z value+1
    jmp __b1
}
// Computes the length of the string str up to but not including the terminating null character.
// __zp($10) unsigned int strlen(__zp(7) char *str)
strlen: {
    .label len = $10
    .label str = 7
    .label return = $10
    lda #<0
    sta.z len
    sta.z len+1
    lda #<printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    sta.z str
    lda #>printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    sta.z str+1
  __b1:
    ldy #0
    lda (str),y
    cmp #0
    bne __b2
    rts
  __b2:
    inw.z len
    inw.z str
    jmp __b1
}
// Print a padding char a number of times
// void printf_padding(__zp(7) void (*putc)(char), __zp($19) char pad, __zp($18) char length)
printf_padding: {
    .label i = 9
    .label putc = 7
    .label length = $18
    .label pad = $19
    ldz #0
    stz.z i
  __b1:
    lda.z i
    cmp.z length
    bcc __b2
    rts
  __b2:
    lda.z pad
    pha
    jsr icall3
    pla
    inc.z i
    jmp __b1
  icall3:
    jmp (putc)
}
// Converts a string to uppercase.
// char * strupr(char *str)
strupr: {
    .label str = printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    .label src = 7
    lda #<str
    sta.z src
    lda #>str
    sta.z src+1
  __b1:
    ldy #0
    lda (src),y
    cmp #0
    bne __b2
    rts
  __b2:
    ldy #0
    lda (src),y
    jsr toupper
    ldy #0
    sta (src),y
    inw.z src
    jmp __b1
}
// Print an unsigned int using a specific format
// void printf_ulong(void (*putc)(char), __zp($c) unsigned long uvalue, char format_min_length, char format_justify_left, char format_sign_always, char format_zero_padding, char format_upper_case, char format_radix)
printf_ulong: {
    .const format_min_length = 8
    .const format_justify_left = 0
    .const format_zero_padding = 1
    .const format_upper_case = 0
    .label putc = cputc
    .label uvalue = $c
    // Handle any sign
    ldz #0
    stz printf_buffer
  // Format number into buffer
    jsr ultoa
    lda printf_buffer
    sta.z printf_number_buffer.buffer_sign
  // Print using format
    ldz #format_upper_case
    stz.z printf_number_buffer.format_upper_case
    lda #<putc
    sta.z printf_number_buffer.putc
    lda #>putc
    sta.z printf_number_buffer.putc+1
    ldz #format_zero_padding
    stz.z printf_number_buffer.format_zero_padding
    ldz #format_justify_left
    stz.z printf_number_buffer.format_justify_left
    ldx #format_min_length
    jsr printf_number_buffer
    rts
}
// returns 1 for odd numbered sectors, 0 for even:
// __register(X) char ReadSector(__zp($30) volatile char drive, __zp($35) volatile char track, __zp($3e) volatile char sector)
ReadSector: {
    .label drive = $30
    .label track = $35
    .label sector = $3e
    lda.z track
    bne __b1
    ldx #$fc
    rts
  __b1:
    lda #$60
    clc
    adc.z drive
    sta.z drive
    // #$60 drive 0
    sta $d080
    lda #$20
    sta $d081
    ldx track
    dex
    stx $d084
    lda sector
    lsr
    tax
    inx
    stx $d085
    lda #0
    sta $d086
    adc #0
    sta flagCurrSec
    lda #$41
    sta $d081
  wait0:
    lda $d082
    bmi wait0
    and #$18
    beq succeed
    lda #$40
    sta $d080
    sec
    jmp endsub
  succeed:
    lda #$80
    trb $d689
    clc
    lda #0
    sta offsCurrIdx
    lda flagCurrSec
    beq upper
    lda #$6d
    sta ptrMiniOffs+1
    jmp endsub
  upper:
    lda #$6c
    sta ptrMiniOffs+1
  endsub:
    bcs err1
    lda flagCurrSec
    jmp end1
  err1:
    lda #$ff
  end1:
    sta retval
    tax
    rts
}
// both physical sectors are written:
// char WriteSector(__zp($2d) volatile char drive, __zp($40) volatile char track, __zp($36) volatile char sector)
WriteSector: {
    .label drive = $2d
    .label track = $40
    .label sector = $36
    lda #$60
    clc
    adc.z drive
    sta.z drive
    lda.z sector
    cmp #$14
    bcc __b1
    lda #8
    clc
    adc.z drive
    sta.z drive
  __b1:
    lda drive
    sta $d080
    lda #$20
    sta $d081
    ldx track
    dex
    stx $d084
    lda sector
    lsr
    tax
    inx
    stx $d085
    lda #0
    sta $d086
    adc #0
    sta flagCurrSec
    lda #$84
    sta $d081
  wait0:
    lda $d082
    bmi wait0
    and #$18
    beq succeed
    lda #$40
    sta $d080
    sec
    jmp endsub
  succeed:
    lda #$80
    trb $d689
    clc
  endsub:
    bcs err1
    lda #0
    jmp end1
  err1:
    lda #$ff
  end1:
    sta retval
    rts
}
// Converts unsigned number value to a string representing it in RADIX format.
// If the leading digits are zero they are not included in the string.
// - value : The number to be converted to RADIX
// - buffer : receives the string representing the number and zero-termination.
// - radix : The radix to convert the number to (from the enum RADIX)
// void uctoa(__zp($18) char value, __zp($10) char *buffer, char radix)
uctoa: {
    .label digit_value = 6
    .label buffer = $10
    .label digit = $21
    .label value = $18
    lda #<printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    sta.z buffer
    lda #>printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    sta.z buffer+1
    ldx #0
    ldz #0
    stz.z digit
  __b1:
    lda.z digit
    cmp #2-1
    bcc __b2
    ldy.z value
    lda DIGITS,y
    ldy #0
    sta (buffer),y
    inw.z buffer
    tya
    sta (buffer),y
    rts
  __b2:
    ldy.z digit
    lda RADIX_HEXADECIMAL_VALUES_CHAR,y
    sta.z digit_value
    cpx #0
    bne __b5
    lda.z value
    cmp.z digit_value
    bcs __b5
  __b4:
    inc.z digit
    jmp __b1
  __b5:
    lda.z buffer
    sta.z uctoa_append.buffer
    lda.z buffer+1
    sta.z uctoa_append.buffer+1
    ldz value
    jsr uctoa_append
    tza
    sta.z value
    inw.z buffer
    ldx #1
    jmp __b4
}
/* todo
- reading the last sector 39 results in side 1 and an invalid next track
- two for loops need their loop variable declared beforehand
*/
// *********************************************************
// ***  libc.h abstraction to hyppo mount handling       ***
// *********************************************************
// __register(A) char tolower(__register(A) char ch)
tolower: {
    cmp #'A'
    bcc __breturn
    cmp #'Z'
    bcc __b1
    beq __b1
    rts
  __b1:
    clc
    adc #'a'-'A'
  __breturn:
    rts
}
// Convert lowercase alphabet to uppercase
// Returns uppercase equivalent to c, if such value exists, else c remains unchanged
// __register(A) char toupper(__register(A) char ch)
toupper: {
    cmp #'a'
    bcc __breturn
    cmp #'z'
    bcc __b1
    beq __b1
    rts
  __b1:
    clc
    adc #'A'-'a'
  __breturn:
    rts
}
// Converts unsigned number value to a string representing it in RADIX format.
// If the leading digits are zero they are not included in the string.
// - value : The number to be converted to RADIX
// - buffer : receives the string representing the number and zero-termination.
// - radix : The radix to convert the number to (from the enum RADIX)
// void ultoa(__zp($c) unsigned long value, __zp($12) char *buffer, char radix)
ultoa: {
    .const max_digits = 8
    .label digit_value = $14
    .label buffer = $12
    .label digit = $19
    .label value = $c
    lda #<printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    sta.z buffer
    lda #>printf_buffer+OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS
    sta.z buffer+1
    ldx #0
    ldz #0
    stz.z digit
  __b1:
    lda.z digit
    cmp #max_digits-1
    bcc __b2
    lda.z value
    tay
    lda DIGITS,y
    ldy #0
    sta (buffer),y
    inw.z buffer
    tya
    sta (buffer),y
    rts
  __b2:
    lda.z digit
    asl
    asl
    tay
    lda RADIX_HEXADECIMAL_VALUES_LONG,y
    sta.z digit_value
    lda RADIX_HEXADECIMAL_VALUES_LONG+1,y
    sta.z digit_value+1
    lda RADIX_HEXADECIMAL_VALUES_LONG+2,y
    sta.z digit_value+2
    lda RADIX_HEXADECIMAL_VALUES_LONG+3,y
    sta.z digit_value+3
    cpx #0
    bne __b5
    lda.z value+3
    cmp.z digit_value+3
    bcc !+
    bne __b5
    lda.z value+2
    cmp.z digit_value+2
    bcc !+
    bne __b5
    lda.z value+1
    cmp.z digit_value+1
    bcc !+
    bne __b5
    lda.z value
    cmp.z digit_value
    bcs __b5
  !:
  __b4:
    inc.z digit
    jmp __b1
  __b5:
    lda.z buffer
    sta.z ultoa_append.buffer
    lda.z buffer+1
    sta.z ultoa_append.buffer+1
    jsr ultoa_append
    inw.z buffer
    ldx #1
    jmp __b4
}
// Used to convert a single digit of an unsigned number value to a string representation
// Counts a single digit up from '0' as long as the value is larger than sub.
// Each time the digit is increased sub is subtracted from value.
// - buffer : pointer to the char that receives the digit
// - value : The value where the digit will be derived from
// - sub : the value of a '1' in the digit. Subtracted continually while the digit is increased.
//        (For decimal the subs used are 10000, 1000, 100, 10, 1)
// returns : the value reduced by sub * digit so that it is less than sub.
// __register(A) char uctoa_append(__zp($22) char *buffer, __register(Z) char value, __zp(6) char sub)
uctoa_append: {
    .label buffer = $22
    .label sub = 6
    ldx #0
  __b1:
    cpz.z sub
    bcs __b2
    lda DIGITS,x
    ldy #0
    sta (buffer),y
    rts
  __b2:
    inx
    tza
    sec
    sbc.z sub
    taz
    jmp __b1
}
// Used to convert a single digit of an unsigned number value to a string representation
// Counts a single digit up from '0' as long as the value is larger than sub.
// Each time the digit is increased sub is subtracted from value.
// - buffer : pointer to the char that receives the digit
// - value : The value where the digit will be derived from
// - sub : the value of a '1' in the digit. Subtracted continually while the digit is increased.
//        (For decimal the subs used are 10000, 1000, 100, 10, 1)
// returns : the value reduced by sub * digit so that it is less than sub.
// __zp($c) unsigned long ultoa_append(__zp($24) char *buffer, __zp($c) unsigned long value, __zp($14) unsigned long sub)
ultoa_append: {
    .label buffer = $24
    .label value = $c
    .label sub = $14
    .label return = $c
    ldz #0
  __b1:
    lda.z value+3
    cmp.z sub+3
    bcc !+
    bne __b2
    lda.z value+2
    cmp.z sub+2
    bcc !+
    bne __b2
    lda.z value+1
    cmp.z sub+1
    bcc !+
    bne __b2
    lda.z value
    cmp.z sub
    bcs __b2
  !:
    tza
    tay
    lda DIGITS,y
    ldy #0
    sta (buffer),y
    rts
  __b2:
    inz
    lda.z value
    sec
    sbc.z sub
    sta.z value
    lda.z value+1
    sbc.z sub+1
    sta.z value+1
    lda.z value+2
    sbc.z sub+2
    sta.z value+2
    lda.z value+3
    sbc.z sub+3
    sta.z value+3
    jmp __b1
}
.segment Data
  // The digits used for numbers
  DIGITS: .text "0123456789abcdef"
  // Values of hexadecimal digits
  RADIX_HEXADECIMAL_VALUES_CHAR: .byte $10
  // Values of binary digits
  RADIX_BINARY_VALUES: .word $8000, $4000, $2000, $1000, $800, $400, $200, $100, $80, $40, $20, $10, 8, 4, 2
  // Values of octal digits
  RADIX_OCTAL_VALUES: .word $8000, $1000, $200, $40, 8
  // Values of decimal digits
  RADIX_DECIMAL_VALUES: .word $2710, $3e8, $64, $a
  // Values of hexadecimal digits
  RADIX_HEXADECIMAL_VALUES: .word $1000, $100, $10
  // Values of hexadecimal digits
  RADIX_HEXADECIMAL_VALUES_LONG: .dword $10000000, $1000000, $100000, $10000, $1000, $100, $10
  BAMsector: .fill 2*2, 0
  // to point into the disk buffer
  worksector: .fill 2*2, 0
  // to point into the disk buffer
  worksectorasBAM: .fill 2*2, 0
  .align $100
  Hyppo_Filename: .text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxFSHOT.D81"
  .byte 0
  // DIRENT __align(0x100) readdir_dirent;
  .align $100
  _readdir_dirent: .fill SIZEOF_STRUCT___0+$c8, 0
  s1: .text @"\n"
  .byte 0
  s2: .text " "
  .byte 0
  // Buffer used for stringified number being printed
  printf_buffer: .fill SIZEOF_STRUCT_PRINTF_BUFFER_NUMBER, 0

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
  .const SIZEOF_POINTER = 2
  .const OFFSET_STRUCT_PRINTF_BUFFER_NUMBER_DIGITS = 1
  .const OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC1 = 1
  .const OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC2 = 2
  .const OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC3 = 3
  .const OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC4 = 4
  .const OFFSET_STRUCT_STRUCTBAMENTRY_ALLOC5 = 5
  .const OFFSET_STRUCT_STRUCTDATABLOCK_CHNSECTOR = 1
  .const OFFSET_STRUCT_STRUCTDATABLOCK_DATA = 2
  .const OFFSET_STRUCT_STRUCTBAM_ENTRY = $10
  .const STACK_BASE = $103
  .const SIZEOF_STRUCT_PRINTF_BUFFER_NUMBER = $c
  /// I/O Personality selection
  .label IO_KEY = $d02f
  /// C65 Banking Register
  .label IO_BANK = $d030
  /// Color Ram
  .label COLORRAM = $d800
  /// Default address of screen character matrix
  .label DEFAULT_SCREEN = $800
  // The number of bytes on the screen
  // The current cursor x-position
  .label conio_cursor_x = $56
  // The current cursor y-position
  .label conio_cursor_y = $57
  // The current text cursor line start
  .label conio_line_text = $58
  // The current color cursor line start
  .label conio_line_color = $5a
  // Gibt es im Basic eine Möglichkeit festzustellen um was für
  // ein Laufwerk es sich bei U8 oder U9 handelt, also ob es das
  // interne oder ein .d81 Image ist ?
  // gardners: Du könntest $D6A9 peeken und die Bits daraus lesen
  .label retval = $46
  // unsigned char ptrMiniOffs = $DE;
  .label ptrMiniOffs = $47
  // = "";
  .label offsCurrIdx = $5d
  .label flagCurrSec = $5e
  .label datNextTrk = $50
  .label datNextSec = $51
  .label workside = $53
  .label i = $40
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
    //    printf("\0e");  // upper/lower case mode
    //	POKE $D018,PEEK($D018) AND $F0 OR $04  // uppercase
    //	POKE $D018,PEEK($D018) AND $F0 OR $06  // lowercase
    //	PRINT CHR$(9)  // enable toggle case
    //	PRINT CHR$(8)  // disable toggle case
    lda $d018
    ora #6
    sta $d018
    //  testbam();
    jsr testsectors
    cli
    rts
}
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
    .label aVal = $55
    .label xVal = $54
    .label yVal = $52
    .label zVal = $4f
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
    .const x = 0
    .label __5 = $4d
    .label __6 = $44
    .label __7 = $44
    .label line_offset = $44
    .label __8 = $4b
    .label __9 = $44
    cmp #$19+1
    bcc __b2
    lda #0
  __b2:
    ldz #x
    stz.z conio_cursor_x
    sta.z conio_cursor_y
    sta.z __7
    lda #0
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
testsectors: {
    .label __28 = $b
    .label __29 = $14
    .label __30 = $d
    .label BAMside = $5c
    .label ws = $d
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
    s2: .text " "
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
// __register(X) char GetWholeSector(__zp(2) struct structBAM *entry, char drive, __register(X) char track, __register(Y) char sector)
GetWholeSector: {
    .label ret = $2d
    .label i = $28
    .label __5 = $20
    .label entry = 2
    .label __6 = $1e
    .label __7 = $20
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
// char PutWholeSector(__zp(2) struct structBAM *entry, __zp($3e) char side, char drive, __register(X) char track, __zp($17) char sector)
PutWholeSector: {
    .label i = $2a
    .label val = $27
    .label __6 = $1e
    .label entry = 2
    .label side = $3e
    .label sector = $17
    .label __7 = $23
    .label __8 = $1e
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
/// Print a NUL-terminated string
// void printf_str(__zp(2) void (*putc)(char), __zp($d) const char *s)
printf_str: {
    .label s = $d
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
// this expects data in sector buffer:
// void BAMSectorUpdate(__zp($20) struct structBAM *BAMsector, __zp($2c) char track, __register(A) char sector, char set)
BAMSectorUpdate: {
    .const bitshifter = 1
    .label __60 = $3c
    .label __61 = $34
    .label __62 = $3a
    .label __63 = $32
    .label __64 = $1e
    .label __65 = 2
    .label __66 = $1a
    .label __67 = $25
    .label __68 = $23
    .label __69 = 5
    .label __71 = $1c
    .label __72 = $20
    .label __126 = $3c
    .label __128 = $34
    .label __130 = $3a
    .label __132 = $32
    .label __134 = $1e
    .label __136 = 2
    .label __138 = $1a
    .label __140 = $25
    .label __142 = $23
    .label __144 = 5
    .label track = $2c
    .label BAMsector = $20
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
// void printf_uchar(void (*putc)(char), __register(A) char uvalue, __zp($3e) char format_min_length, char format_justify_left, char format_sign_always, char format_zero_padding, char format_upper_case, char format_radix)
printf_uchar: {
    .label format_min_length = $3e
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
// Print an unsigned int using a specific format
// void printf_uint(void (*putc)(char), __zp(2) unsigned int uvalue, char format_min_length, char format_justify_left, char format_sign_always, char format_zero_padding, char format_upper_case, char format_radix)
printf_uint: {
    .const format_min_length = 4
    .const format_justify_left = 0
    .const format_zero_padding = 1
    .const format_upper_case = 0
    .label putc = cputc
    .label uvalue = 2
    // Handle any sign
    ldz #0
    stz printf_buffer
  // Format number into buffer
    lda #HEXADECIMAL
    jsr utoa
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
// Copy block of memory (forwards)
// Copies the values of num bytes from the location pointed to by source directly to the memory block pointed to by destination.
// void * memcpy(__zp($38) void *destination, __zp($2f) void *source, unsigned int num)
memcpy: {
    .label src_end = $42
    .label dst = $38
    .label src = $2f
    .label source = $2f
    .label destination = $38
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
// void * memset(__zp($2f) void *str, __register(Z) char c, unsigned int num)
memset: {
    .label end = $38
    .label dst = $2f
    .label str = $2f
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
// Print an unsigned int using a specific format
// void printf_ulong(void (*putc)(char), __zp(7) unsigned long uvalue, char format_min_length, char format_justify_left, char format_sign_always, char format_zero_padding, char format_upper_case, char format_radix)
printf_ulong: {
    .const format_min_length = 8
    .const format_justify_left = 0
    .const format_zero_padding = 1
    .const format_upper_case = 0
    .label putc = cputc
    .label uvalue = 7
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
// __register(X) char ReadSector(__zp($31) volatile char drive, __zp($36) volatile char track, __zp($3f) volatile char sector)
ReadSector: {
    .label drive = $31
    .label track = $36
    .label sector = $3f
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
// char WriteSector(__zp($2e) volatile char drive, __zp($41) volatile char track, __zp($37) volatile char sector)
WriteSector: {
    .label drive = $2e
    .label track = $41
    .label sector = $37
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
// void utoa(__zp(2) unsigned int value, __zp($14) char *buffer, __register(A) char radix)
utoa: {
    .label digit_value = 5
    .label buffer = $14
    .label value = 2
    .label started = $19
    .label max_digits = $17
    .label digit_values = $d
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
// void printf_number_buffer(__zp($14) void (*putc)(char), __zp($16) char buffer_sign, char *buffer_digits, __register(X) char format_min_length, __zp($19) char format_justify_left, char format_sign_always, __zp($17) char format_zero_padding, __zp($22) char format_upper_case, char format_radix)
printf_number_buffer: {
    .label __19 = $d
    .label buffer_sign = $16
    .label padding = $2c
    .label format_zero_padding = $17
    .label putc = $14
    .label format_justify_left = $19
    .label format_upper_case = $22
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
// Converts unsigned number value to a string representing it in RADIX format.
// If the leading digits are zero they are not included in the string.
// - value : The number to be converted to RADIX
// - buffer : receives the string representing the number and zero-termination.
// - radix : The radix to convert the number to (from the enum RADIX)
// void uctoa(__zp($16) char value, __zp($d) char *buffer, char radix)
uctoa: {
    .label digit_value = 4
    .label buffer = $d
    .label digit = $17
    .label value = $16
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
// Converts unsigned number value to a string representing it in RADIX format.
// If the leading digits are zero they are not included in the string.
// - value : The number to be converted to RADIX
// - buffer : receives the string representing the number and zero-termination.
// - radix : The radix to convert the number to (from the enum RADIX)
// void ultoa(__zp(7) unsigned long value, __zp($d) char *buffer, char radix)
ultoa: {
    .const max_digits = 8
    .label digit_value = $f
    .label buffer = $d
    .label digit = $22
    .label value = 7
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
// __zp(2) unsigned int utoa_append(__zp($1c) char *buffer, __zp(2) unsigned int value, __zp(5) unsigned int sub)
utoa_append: {
    .label buffer = $1c
    .label value = 2
    .label sub = 5
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
// __zp($d) unsigned int strlen(__zp($b) char *str)
strlen: {
    .label len = $d
    .label str = $b
    .label return = $d
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
// void printf_padding(__zp($b) void (*putc)(char), __zp($18) char pad, __zp(4) char length)
printf_padding: {
    .label i = $13
    .label putc = $b
    .label length = 4
    .label pad = $18
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
    .label src = $b
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
// Used to convert a single digit of an unsigned number value to a string representation
// Counts a single digit up from '0' as long as the value is larger than sub.
// Each time the digit is increased sub is subtracted from value.
// - buffer : pointer to the char that receives the digit
// - value : The value where the digit will be derived from
// - sub : the value of a '1' in the digit. Subtracted continually while the digit is increased.
//        (For decimal the subs used are 10000, 1000, 100, 10, 1)
// returns : the value reduced by sub * digit so that it is less than sub.
// __register(A) char uctoa_append(__zp($1a) char *buffer, __register(Z) char value, __zp(4) char sub)
uctoa_append: {
    .label buffer = $1a
    .label sub = 4
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
// __zp(7) unsigned long ultoa_append(__zp($25) char *buffer, __zp(7) unsigned long value, __zp($f) unsigned long sub)
ultoa_append: {
    .label buffer = $25
    .label value = 7
    .label sub = $f
    .label return = 7
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
  s1: .text @"\n"
  .byte 0
  // Buffer used for stringified number being printed
  printf_buffer: .fill SIZEOF_STRUCT_PRINTF_BUFFER_NUMBER, 0

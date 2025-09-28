// *********************************************************
// ***  calypsi.h diverted defines                       ***
// *********************************************************

// work in progress:
// https://github.com/hth313/Calypsi-tool-chains/releases
// https://github.com/hth313/Calypsi-MEGA65-hello-world/blob/main/Makefile

// dummy:
// #define __attribute__((used))  __attribute__((aligned(16)))
// #define __MEGA65__

#pragma require __preserve_zp

// kernel jsr table:
unsigned int SETNAM = 0xffbd;
unsigned int SETLFS = 0xffba;
unsigned int LOAD   = 0xffd5;
unsigned int SETBNK = 0xff6b;
unsigned int SAVE   = 0xffd8;

void bank_start(void)  {
  __asm(
    " sei\n"
    " ldx #0x2F\n" // restore default CPU I/O port data directions
    " stx 0\n"
    " ldx #0x3E\n" // LORAM = 0
    " stx 1\n"    // switch out C64 BASIC ROM at $A000-$BFFF for RAM
        
    " ldx #0x44\n" // unmap all C65 ROMs except $e000-$ffff
    " stx 0xd030\n"
/*
    " lda #0\n"   // Mapping like MEGASPUTM
    " tax\n"
    " tay\n"
    " taz\n"
    " map\n"
    " eom\n"
*/
  :  :  : "x");
}

void bank_end(void)  {
  __asm(
    " ldx #0x3F\n" // LORAM = 1
    " stx 1\n"    // switch in BASIC ROM at $A000-$BFFF

    " ldx #0x64\n" // restore C65 ROMs to as before
    " stx 0xd030\n"
    " cli\n"
  :  :  : "x");
}

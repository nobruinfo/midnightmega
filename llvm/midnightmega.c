// Midnightmega

// #pragma target(mega65)
// #include <mega65.h>
// #include <mega65-dma.h>
// #include <6502.h>    llvm
#include <stdlib.h>
#include <string.h>
#include <stdio.h>  // llvm
#include <mega65/conio.h>  // llvm instead of <printf.h>
#include <mega65/memory.h>  // mega65-libc
#include <mega65/hal.h>  // mega65-libc
// #include <peekpoke.h>  llvm
// #include <conio_.h>
// #include <conio-lines.h>

// #include <cbmiec.h>

// #define DEBUG

#include "regions.h"
#include "conioextensions.h"
#include "hyppo.h"
#include "nav.h"

// char* inputstr = (char*) INPUTSTRPAGE;

#include "testjmp.h"
extern unsigned char lfnname[LFNFILENAMELEN];
#include "fileio.h"
extern BAM * BAMsector[2];

// KickC calls conio_mega65_init() before doing main():
int main() {
  conioinit();
  // ASCII lowercase is in conioinit()

  textcolor (COLOUR_CYAN);
  bordercolor (COLOUR_BLACK);
  bgcolor (COLOUR_BLUE);
  
  // setscreensize(80, 50);  or 40 25
  setscreensize(80, 25);
/*
  setuppercase();
  for (int i = 0; i <= 255; i++)  {
    cputcxy(i % 40, i / 40, i);
  }
  cgetc();
*/

  clrhome();

  // mprintf("hyppo_getcurrentdrive=", hyppo_getcurrentdrive());

  mcputsxy(0, 22, "The function keys shown in the bottom line are ");
  msprintf("meant to be used with ");
  mcputsxy(0, 23, "and without [Shift] and [Mega] after the messagebox is dismissed:");
  shortcuts(20, 0);

  if (messagebox(1, "is currently beta and may destroy data structures on",
                    ".d81 and real disks! Please work on backed up media.",
                    "Press RETURN to continue, STOP to halt.", 0))  {
    navi(0);
  }

  clrhome();
  msprintf("Have fun with your MEGA65!");
  usleep(2000000); // microseconds
//  cputln();
//  cgetc();
//  flushkeybuf();
  hyppo_reset();

  return 0;
}


int _main2() {
  conioinit();
    strcpy((char *) lfnname, (char *) "midnightmega.0");
//    char* pointer = (char*) 0x1700;

/*
  asm volatile(
    "brk\n"
    "brk\n"
    "brk\n"
    "brk\n"
    "eter%=:\n"
    "jmp eter%=\n"
    "brk\n"
    "brk\n"
    "brk\n"
    "brk\n"
  :  :  : );
//  :  : "y"(pointer >> 8), "a"(strlen(lfnname)), "x"(pointer & 0xff) : );
*/

//  unsigned char retval;
  char status;

//  POKE(0, 7);  POKE(1, 5);
//    POKE(0xd02fU, 0x47);
//    POKE(0xd02fU, 0x53);
/*
  // to map kernel and I/O:
  asm volatile(
    " lda #0x00\n"
    " tax\n"
    " tay\n"
    " taz\n"
    " map\n"
    " nop\n"
    "ldz #0\n"      // make z zero for llvm-mos indirect addressing
  : : : "y", "a", "x" );
*/
  pcputs("file: ");
  pcputs((char *) lfnname);
  cputln();
  cgetc();
  flushkeybuf();

  char filename_len = (char) strlen((const char *) lfnname);
  fnamehi = (unsigned int) lfnname >> 8;
  fnamelo = (unsigned int) lfnname & 0xff;
  pcputs("filename_len is: ");
  cputhex((unsigned int) filename_len, 4);

  // apparently there should be direct access to register contents from
  // C language by using the compiler's __rc2 name convention:
  // https://llvm-mos.org/wiki/C_calling_convention

  // the following routine includes SETBNK as shown in the big book
  // in the example listing under the kernal routine LOAD.
#define SETBKN $FF6B
  asm volatile(
    "taz\n"

    "lda #$00\n" // Switch zero page back to default
    "tab\n"

    "tza\n"
    "ldz #0\n"      // make z zero for llvm-mos indirect addressing
    
    "lda #$0\n" // memory in bank 0
    "ldx #$0\n" // filename in bank 0
    "jsr $ff6b\n" // C64 SETBNK

    "lda #$16\n" // Switch zero page to $1600 - $16ff
    "tab\n"
  :  :  : "a", "x" );

  asm volatile(
    "taz\n"

    "lda #$00\n" // Switch zero page back to default
    "tab\n"

    "tza\n"
    "ldz #0\n"      // make z zero for llvm-mos indirect addressing
    
    // Kernal SETNAM function
    // SETNAM. Set file name parameters.
    // Input: A = File name length; X/Y = Pointer to file name.
//    "lda #(filename_len)\n"
//    "ldx #<filename\n"
//    "ldy #>filename\n"
    "lda #$e\n"    // strlen          TESTING ***
//    "ldx #$67\n"
//    "ldy #$36\n"
    "jsr SETNAM\n" // C64 $ffbd

    // SETLFS. Set file parameters.
    // Input: A = Logical number; X = Device number; Y = Secondary address.
    "ldx #$8\n"
    "lda #$1\n" // #$0f
    "ldy #$0\n" // #$ff
    "jsr SETLFS\n" // C64 $ffba

// LOAD. Load or verify file. (Must call SETLFS and SETNAM beforehands.)
// - verify: 0 = Load, 1-255 = Verify
//
// Returns a status, 0xff: Success other: Kernal Error Code

    //LOAD. Load or verify file. (Must call SETLFS and SETNAM beforehands.)
    // Input: A: 0 = Load, 1-255 = Verify; X/Y = Load address (if secondary address = 0).
    // Output: Carry: 0 = No errors, 1 = Error; A = KERNAL error code (if Carry = 1); X/Y = Address of last byte loaded/verified (if Carry = 0).
//    "ldx address\n"
//    "ldy address+1\n"
//    "lda verify\n"
    "lda #$0\n"
    "ldx #$00\n"
    "ldy #$17\n"
    "jsr LOAD\n" // C64 $ffd5
    "bcs loaderror%=\n"
    "lda #$ff\n"
    "loaderror%=:\n"
    "sta %0\n"
    "lda #$16\n" // Switch zero page to $1600 - $16ff
    "tab\n"
  : "=r"(status) : "y"(fnamehi), "a"(filename_len), "x"(fnamelo) : );
  mh4printf("result: ", status);

//    mh4printf("result: ",
//      loadFileToMemory(8, (char*) lfnname, pointer));
  cputln();
  cgetc();
  flushkeybuf();

  clrhome();
  msprintf("Have fun with your MEGA65!");
  usleep(2000000); // microseconds
//  cputln();
//  cgetc();
//  flushkeybuf();
hyppo_reset();

  return 0;
}

int _main() {
  conioinit();
  mcputsxy(20, 3, "test");
  cputln();
  cgetc();
  flushkeybuf();

  return 0;
}
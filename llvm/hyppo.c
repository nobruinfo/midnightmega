#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "regions.h"
#include "conioextensions.h"
#include "hyppo.h"
#include "fileio.h"

// *********************************************************
// ***  hyppo.c abstraction to hyppo mount handling      ***
// *********************************************************

// need to be at a page frame border, CAREFUL as this define does not throw warnings:
#define readdir_direntasm DIRENTPAGELOW
struct DIRENT* const __attribute__((used)) readdir_dirent = (struct DIRENT*) DIRENTPAGELOW;
// static char * __attribute__((used)) HTRAP00asm = HTRAP00;
#define HTRAP00asm $d640
#define STR(x) #x
#define XSTR(s) STR(s)
__asm__(".set HTRAP00, " XSTR(HTRAP00asm) );
__asm__(".set readdir_dirent, " XSTR(readdir_direntasm) );

struct HYPPOFILENAME* const hyppofn = (struct HYPPOFILENAME*) FILENAMEPAGE;

// https://stackoverflow.com/questions/8810390/how-to-use-a-global-variable-in-gcc-inline-assembly
// define fnamehi (unsigned char)((unsigned int)hyppofn->name >> 8)
static unsigned char __attribute__((used)) fnamehi;
unsigned char hyppo_setup_transfer_area(void)  {
	unsigned char retval;

  fnamehi = (unsigned int)hyppofn->name >> 8;

  asm volatile(
	"ldx #$00\n"         // shouldn't be necessary
//	"ldy #>(fnamehi)\n"  // works only because "name" is first in struct
    "lda #$3a\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc errsettrans%=\n"
    "sta %0\n"
	"jmp donesettrans%=\n"
"errsettrans%=:\n"
    "lda #$FF\n"
	"sta %0\n"
"donesettrans%=:\n"
    "nop\n"
	: "=r"(retval) : "y"(fnamehi) : "a", "x");
  return retval;
}

unsigned char hyppo_getcurrentdrive(void)  {
	unsigned char retval;

  // ; Get the current drive
  asm volatile(
	"ldx #$00\n"    // shouldn't be necessary
    "lda #$04\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc errgetcurdrv%=\n"
    "sta %0\n"
	"jmp donegetcurdrv%=\n"
"errgetcurdrv%=:\n"
    "lda #$FF\n"
	"sta %0\n"
"donegetcurdrv%=:\n"
    "nop"
	: "=r"(retval) :: "a", "x");

  return retval;
}

// https://llvm-mos.org/wiki/C_Inline_Assembly
// https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html
//                            : %0  :  %1  :
//                asm         :input:output:clobber  comma separated
// asm volatile ("st%0 0x1234"::"R"(value));

unsigned char hyppo_selectdrive(unsigned char nb)  {
	unsigned char retval;

  asm volatile(
//    "ldx %1\n"
	"lda #$06\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc errseldrv%=\n"
    "stx %0\n"
	"jmp doneseldrv%=\n"
"errseldrv%=:\n"
    "lda #$FF\n"
	"sta %0\n"
"doneseldrv%=:\n"
    "nop\n"
    : "=r"(retval)  // output
    : "x"(nb)       // input
	: "a","x"       // clobber
	);

  return retval;
}

unsigned char hyppo_setname(char *filename)  {
	unsigned char retval;

fnamehi = (unsigned int)hyppofn->name >> 8;

  strcpy(hyppofn->name, filename);

  asm volatile(
	"ldx #$00\n"         // shouldn't be necessary
//	"ldy #>(fnamehi)\n"  // works only because "name" is first in struct
    "lda #$2e\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc errhypsetnam%=\n"
	"lda #0\n"           // upon success return 0
    "sta %0\n"
	"jmp donehypsetnam%=\n"
"errhypsetnam%=:\n"
	"lda #$ff\n"
    "sta %0\n"
"donehypsetnam%=:\n"
    "nop\n"
	: "=r"(retval) : "y"(fnamehi) : "a", "x");
  return retval;
}

unsigned char hyppo_d81attach0(void)  {
	unsigned char retval;

  asm volatile(
	"ldx #$00\n"    // shouldn't be necessary
    "lda #$40\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc errhyp0att%=\n"
    "lda #$00\n"
    "sta %0\n"
	"jmp donehyp0att%=\n"
"errhyp0att%=:\n"
    "lda #$FF\n"
	"sta %0\n"
"donehyp0att%=:\n"
    "nop\n"
	: "=r"(retval) : : "a", "x");
  return retval;
}

unsigned char hyppo_d81attach1(void)  {
	unsigned char retval;

  asm volatile(
	"ldx #$00\n"    // shouldn't be necessary
    "lda #$46\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc errhyp1att%=\n"
    "lda #$00\n"
    "sta %0\n"
	"jmp donehyp1att%=\n"
"errhyp1att%=:\n"
    "lda #$FF\n"
	"sta %0\n"
"donehyp1att%=:\n"
    "nop\n"
  : "=r"(retval) : : "a", "x");
  return retval;
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

unsigned char hyppo_opendir(void)  {
	unsigned char retval;

  asm volatile(
	"ldx #$00\n"    // shouldn't be necessary
    "lda #$12\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc errhypopendir%=\n"
    "sta %0\n"
	"jmp donehypopendir%=\n"
"errhypopendir%=:\n"
    "lda #$FF\n"
	"sta %0\n"
"donehypopendir%=:\n"
    "nop\n"
  : "=r"(retval) : : "a", "x");
  return retval;
}

unsigned char hyppo_closedir(unsigned char filedescriptor)  {
	unsigned char retval;

  asm volatile(
//	"ldx filedescriptor\n"
    "lda #$16\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc errhypclosedir%=\n"
    "stx %0\n"
	"jmp donehypclosedir%=\n"
"errhypclosedir%=:\n"
	"sta %0\n"
"donehypclosedir%=:\n"
    "nop\n"
  : "=r"(retval) : "x"(filedescriptor) : "a");
  return retval;
}

unsigned char hyppo_readdir(unsigned char filedescriptor)  {
	unsigned char retval;

  asm volatile(
	// pha
	"phx\n"
	// First, clear out the dirent
	"ldx #0\n"
	"txa\n"
"hypreaddirloop%=: sta readdir_dirent,x\n"
	"dex\n"
	"bne hypreaddirloop%=\n"
	"plx\n"
//	"ldx filedescriptor\n"
	"tya\n"
	"tax\n"

	// Third, call the hypervisor trap
	// File descriptor gets passed in in X.
	// Result gets written to transfer area we setup at $0400
	"ldy #>(readdir_dirent)\n"
	"lda #$14\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc errhypreaddir%=\n"
    "stx %0\n"
	"jmp donehypreaddir%=\n"
"errhypreaddir%=:\n"
	"sta %0\n"
"donehypreaddir%=:\n"
    "nop\n"
  : "=r"(retval) : "y"(filedescriptor) : "a", "x", "y");

  readdir_dirent->lfn[readdir_dirent->length] = 0; // put str terminate null

  return retval;
}

char * getsfn() {
  unsigned char i;
//  char sfn[20]; //    [13];
  char c = 0;

  for (int i = 0; i < 8 && readdir_dirent->sfn[i] != 32; i++) {
	if (readdir_dirent->sfn[i] > 0x20) {
	  hyppofn->sfn[c] = readdir_dirent->sfn[i];
	  c++;
	}
  }
  hyppofn->sfn[c] = '.';
  c++;
  for (int i = 8; i < 11 && readdir_dirent->sfn[i] != 32; i++) {
	if (readdir_dirent->sfn[i] > 0x20) {
	  hyppofn->sfn[c] = readdir_dirent->sfn[i];
	  c++;
	}
  }
  hyppofn->sfn[c] = 0;
  return /*strlowr(*/hyppofn->sfn;  // );
}

char * getlfn() {
  return readdir_dirent->lfn;
}

void hyppo_reset(void)  {
  asm volatile(
    "lda #$7E\n"
	"sta HTRAP00\n"
	"clv\n"
  :  :  : "a");
}

// ******************************************
// ***  End of hyppo related functions    ***
// ******************************************

// to test
// - loop both drives but only use "0" as the parameter

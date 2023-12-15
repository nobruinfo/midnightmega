#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <mega65/memory.h>  // mega65-libc
#include "regions.h"
#include "conioextensions.h"
#include "hyppo.h"
#include "fileio.h"

// *********************************************************
// ***  hyppo.c abstraction to hyppo mount handling      ***
// *********************************************************

// need to be at a page frame border, CAREFUL as this define does not throw warnings:
#define readdir_direntasm DIRENTPAGELOW
struct HYPPODIRENT* const __attribute__((used)) readdir_dirent = (struct HYPPODIRENT*) DIRENTPAGELOW;
// static char * __attribute__((used)) HTRAP00asm = HTRAP00;
#define HTRAP00asm $d640
#define STR(x) #x
#define XSTR(s) STR(s)
__asm__(".set HTRAP00, " XSTR(HTRAP00asm) );
__asm__(".set readdir_dirent, " XSTR(readdir_direntasm) );

// please be aware the following structures are the same RAM page:
struct HYPPOFILENAME* const hyppofn = (struct HYPPOFILENAME*) FILENAMEPAGE;
struct TASKBLOCK* const taskblock = (struct TASKBLOCK*) FILENAMEPAGE;

extern DIRENT direntryleft[NBRENTRIES];
extern DIRENT direntryright[NBRENTRIES];
// eight entries per single block:
extern SECTDIRENT * direntryblock[2];

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
unsigned char hyppo_get_proc_desc(void)  {
  unsigned char retval;

  fnamehi = (unsigned int)taskblock >> 8;

  asm volatile(
	"ldx #$00\n"         // shouldn't be necessary
//	"ldy #>(fnamehi)\n"  // works only because "name" is first in struct
    "lda #$48\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc errgetproc%=\n"
    "sta %0\n"
	"jmp donegetproc%=\n"
"errgetproc%=:\n"
    "lda #$FF\n"
	"sta %0\n"
"donegetproc%=:\n"
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

unsigned char hyppo_d81detach(void)  {
	unsigned char retval;

  asm volatile(
	"ldx #$00\n"    // shouldn't be necessary
    "lda #$42\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc errhypd81detach%=\n"
    "sta %0\n"
	"jmp donehypd81detach%=\n"
"errhypd81detach%=:\n"
    "lda #$FF\n"
	"sta %0\n"
"donehypd81detach%=:\n"
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

unsigned char hyppo_chdir(void)  {
	unsigned char retval;

  asm volatile(
	"ldx #$00\n"    // shouldn't be necessary
    "lda #$34\n"    // hyppo_findfile
	"sta HTRAP00\n"
	"clv\n"
	"bcc errhypchdir%=\n"

//	"ldx #$00\n"    // shouldn't be necessary
    "lda #$0c\n"    // hyppo_chdir
	"sta HTRAP00\n"
	"clv\n"
//	"bcc errhypchdir%=\n"
    "sta %0\n"
	"jmp donehypchdir%=\n"
"errhypchdir%=:\n"
    "lda #$FF\n"
	"sta %0\n"
"donehypchdir%=:\n"
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

// @@ ideas for optimisation: skip the whole emptying of the dirent completely
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
  char dotpos;

  for (int i = 0; i < 8 && readdir_dirent->sfn[i] != 32; i++) {
	if (readdir_dirent->sfn[i] > 0x20) {
	  hyppofn->sfn[c] = readdir_dirent->sfn[i];
	  c++;
	}
  }
  hyppofn->sfn[c] = '.';
  dotpos = c;
  c++;
  for (int i = 8; i < 11 && readdir_dirent->sfn[i] != 32; i++) {
	if (readdir_dirent->sfn[i] > 0x20) {
	  hyppofn->sfn[c] = readdir_dirent->sfn[i];
	  c++;
	}
  }
  if (dotpos + 1 == c)  c = dotpos;
  hyppofn->sfn[c] = 0;
  return /*strlowr(*/hyppofn->sfn;  // );
}

char * getlfn() {
  return readdir_dirent->lfn;
}

// misuse a DOS dirent to store Hyppo dirent:
unsigned char getallhyppoentries(unsigned char drive, unsigned char side,
                                 unsigned char maxentries)  {
  unsigned char i;
  unsigned char curdrv = 0;
  unsigned char fd = 0xff;
  unsigned char readerr = 0xff;
  unsigned char entries = 0;
  DIRENT* ds;

  // @@ later to be changed to switch storage card drives according to
  // Lydon's undocumented traps 0xc0 and 0xc1:
  curdrv = hyppo_getcurrentdrive();

  if (curdrv < 0xff)  {
    fd = hyppo_opendir();

    if (fd != 0x84 && fd != 0x87 && fd != 0xff) {
      readerr = 0;
      for (i = 0; i < maxentries; i++)  {
        ds = (DIRENT *) direntryblock[0]; // to be changed to smaller array
        readerr = hyppo_readdir(fd);
		
		// @@ add check to exclude non-.d81 and non-dir entries!
		// @@ see #386, attributes for it in big book.
		
        if (readerr != 0x85 && readerr != 0xff &&
		    ((readdir_dirent->attr & HYPPODIRENTATTRDIR) ||
			 ((readdir_dirent->ext[0] == 'd' || readdir_dirent->ext[0] == 'D') &&
			  readdir_dirent->ext[1] == '8' &&
			  readdir_dirent->ext[2] == '1')))
		{
          msprintfd("filename is: ");
          msprintfd(getsfn()); // already null terminated
		  cputlnd();
		  cgetcd();
		  strcpy((char *) ds->name, getsfn());
		  ds->chntrack = (readdir_dirent->clusternumber >> 24) | 0x80; // Highest bit set
		  ds->chnsector = (readdir_dirent->clusternumber >> 16) & 0xff;
		  ds->track = (readdir_dirent->clusternumber >> 8) & 0xff | 0x80; // Highest bit set
		  ds->sector = readdir_dirent->clusternumber & 0xff;
		  ds->type = readdir_dirent->attr | HYPPODIRENTATTR; // to determine from mounted
		  ds->size = readdir_dirent->size / 1024; // kB
		  ds->access = 0;
	      lcopy((uint32_t) ds,
	            ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + entries * DIRENTSIZE,
			    DIRENTSIZE);
		  entries++;
        }
		else  {
		  // empty string usually crash when printed, so:
		  ds->name[0] = 32; ds->name[1] = 0;
/*
		  snprintf( filelist[i], 65, "%d", i);
		  messagebox(1, "error at reading storage card entry",
                     filelist[i],
			         "for current directory.");
*/
		}
	  }
	  hyppo_closedir(fd);
	}
  }
  // snprintf( ds->name, 65, "%d", entries);
//  messagebox(1, "returning", ds->name, "entries.");
  return entries - 1;
}
unsigned char gethyppodirent(unsigned char drive, unsigned char side,
                             unsigned char maxentries)  {
  unsigned char i;

/*
  msprintf("before readblockchain");
  cputln();
  cgetc();
*/
  i = getallhyppoentries(drive, side, maxentries);
//  readblockchain(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE,
//                 DIRENTBLOCKS, drive, DIRENTTRACK, DIRENTSECT);
/*
  msprintf("after readblockchain");
  cputln();
  cgetc();
*/
//  for (i = ENTRIESPERBLOCK * DIRENTBLOCKS; i > 0; i--)  {
//	if (getdirententry(side, i) != NULL)  return i;  // nbr of entries
//  }
//  return 0;
  return i;
}

void hyppo_reset(void)  {
  asm volatile(
    "lda #$7E\n"
	"sta HTRAP00\n"
	"clv\n"
  :  :  : "a");
}

// https://www.felixcloutier.com/documents/gcc-asm.html#outputs
// @@ minorHDOS not yet implemented
void hyppo_getversion(unsigned char * majorhyppo, unsigned char * minorhyppo,
                      unsigned char * majorHDOS,  unsigned char * minorHDOS)  {
  asm volatile(
    "lda #$00\n"
	"sta HTRAP00\n"
	"clv\n"
	                                                  // llvm doesn't know the z reg
  : "=a" (*majorhyppo), "=x" (*minorhyppo), "=y" (*majorHDOS) // , "=z" (*minorHDOS)
  :  : "a", "x", "y" /* , "z" */ );
}

// ******************************************
// ***  End of hyppo related functions    ***
// ******************************************

// to test
// - loop both drives but only use "0" as the parameter

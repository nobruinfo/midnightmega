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
#define readdir_direntasm BLOCKDIRENT
struct HYPPODIRENT* const /* __attribute__((used)) */
                    readdir_dirent = (struct HYPPODIRENT*) BLOCKDIRENT;

// static char * __attribute__((used)) HTRAP00asm = HTRAP00;
// unsigned int HTRAP00asm = 0xd640;
// unsigned int HTRAP3Fasm = 0xd67f;
#define STR(x) #x
#define XSTR(s) STR(s)
// __asm__(".set HTRAP00, " XSTR(HTRAP00asm) );
// __asm__(".set HTRAP3F, " XSTR(HTRAP3Fasm) );
// __asm(" .set readdir_dirent, " XSTR(readdir_direntasm) );

// please be aware the following structures are the same RAM page:
struct HYPPOFILENAME* const hyppofn = (struct HYPPOFILENAME*) FILENAMEPAGE;
struct TASKBLOCK* const taskblock = (struct TASKBLOCK*) FILENAMEPAGE;

// Calypsi 5.7 change notes:
// MEGA65: The symbols HTRAP00 to HTRAP3F are now recognized as having arbitrary
// register effects and setting the carry flag. This prevents instructions from
// being optimized away when doing a Hyppo call from inline assembly. You will
// need to import the symbol used, e.g. " .extern HTRAP00"\\n. The HTRAP symbols
// are defined in the supplied MEGA65 library which is automatically linked with
// when using --target=mega65.
// This is done in the first function as __asm can't be in global scope.

// https://stackoverflow.com/questions/8810390/how-to-use-a-global-variable-in-gcc-inline-assembly
// define fnamehi (unsigned char)((unsigned int)hyppofn->name >> 8)
static unsigned char /* __attribute__((used)) */ fnamehi;
unsigned char hyppo_setup_transfer_area(void)  {
  unsigned char retval;

  fnamehi = (unsigned int)hyppofn->name >> 8;

  __asm(
	" .extern HTRAP00\n"   // global but can't stand outside of a C function
	" .extern HTRAP3F\n"

  " ldx #0x00\n"         // shouldn't be necessary
//	"ldy #>(fnamehi)\n"  // works only because "name" is first in struct
    " lda #0x3a\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errsettrans\n"
//    "sta %0\n"  Calypsi
	" jmp donesettrans\n"
"errsettrans:\n"
    " lda #0xff\n"
//	" sta %0\n"  Calypsi
"donesettrans:\n"
    " nop\n"
	: "=Ka"(retval) : "Ky"(fnamehi) : "a", "x");
  return retval;
}
unsigned char hyppo_get_proc_desc(void)  {
  unsigned char retval;

  fnamehi = (unsigned int)taskblock >> 8;

  __asm(
	" ldx #0x00\n"         // shouldn't be necessary
//	"ldy #>(fnamehi)\n"  // works only because "name" is first in struct
    " lda #0x48\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errgetproc\n"
//    "sta %0\n"  Calypsi
	" jmp donegetproc\n"
"errgetproc:\n"
    " lda #0xff\n"
//	"sta %0\n"  Calypsi
"donegetproc:\n"
    " nop\n"
	: "=Ka"(retval) : "Ky"(fnamehi) : "a", "x");
  return retval;
}

unsigned char hyppo_getcurrentdrive(void)  {
	unsigned char retval;

  // ; Get the current drive
  __asm(
	" ldx #0x00\n"    // shouldn't be necessary
    " lda #0x04\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errgetcurdrv\n"
//    "sta %0\n"  Calypsi
	" jmp donegetcurdrv\n"
"errgetcurdrv:\n"
    " lda #0xff\n"
//	"sta %0\n"  Calypsi
"donegetcurdrv:\n"
    " nop"
	: "=Ka"(retval) :: "a", "x");

  return retval;
}

// https://llvm-mos.org/wiki/C_Inline_Assembly
// https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html
//                            : %0  :  %1  :
//                asm         :input:output:clobber  comma separated
// __asm ("st%0 0x1234"::"R"(value));

unsigned char hyppo_selectdrive(unsigned char nb)  {
	unsigned char retval;

  __asm(
//    "ldx %1\n"
	" lda #0x06\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errseldrv\n"
    " txa\n"  //   Calypsi stx %0\n"
	" jmp doneseldrv\n"
"errseldrv:\n"
    " lda #0xff\n"
//	"sta %0\n"  Calypsi
"doneseldrv:\n"
    " nop\n"
    : "=Ka"(retval)  // output
    : "Kx"(nb)       // input
	: "a"           // clobber
	);

  return retval;
}

unsigned char hyppo_setname(char *filename)  {
	unsigned char retval;

fnamehi = (unsigned int)hyppofn->name >> 8;

  strcpy(hyppofn->name, filename);

  __asm(
	" ldx #0x00\n"         // shouldn't be necessary
//	"ldy #>(fnamehi)\n"  // works only because "name" is first in struct
    " lda #0x2e\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhypsetnam\n"
	" lda #0\n"           // upon success return 0
//    "sta %0\n"  Calypsi
	" jmp donehypsetnam\n"
"errhypsetnam:\n"
	" lda #0xff\n"
//    "sta %0\n"  Calypsi
"donehypsetnam:\n"
    " nop\n"
	: "=Ka"(retval) : "Ky"(fnamehi) : "a", "x");
  return retval;
}

unsigned char hyppo_d81attach0(void)  {
	unsigned char retval;

  __asm(
	" ldx #0x00\n"    // shouldn't be necessary
    " lda #0x40\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhyp0att\n"
    " lda #0x00\n"
//    "sta %0\n"  Calypsi
	" jmp donehyp0att\n"
"errhyp0att:\n"
    " lda #0xff\n"
//	"sta %0\n"  Calypsi
"donehyp0att:\n"
    " nop\n"
	: "=Ka"(retval) : : "a", "x");
  return retval;
}

unsigned char hyppo_d81attach1(void)  {
	unsigned char retval;

  __asm(
	" ldx #0x00\n"    // shouldn't be necessary
    " lda #0x46\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhyp1att\n"
    " lda #0x00\n"
//    "sta %0\n"  Calypsi
	" jmp donehyp1att\n"
"errhyp1att:\n"
    " lda #0xff\n"
//	"sta %0\n"  Calypsi
"donehyp1att:\n"
    " nop\n"
  : "=Ka"(retval) : : "a", "x");
  return retval;
}
/*
unsigned char hyppo_d81detach(void)  {
	unsigned char retval;

  __asm(
	" ldx #0x00\n"    // shouldn't be necessary
    " lda #0x42\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhypd81detach\n"
//    "sta %0\n"  Calypsi
	" jmp donehypd81detach\n"
"errhypd81detach:\n"
    " lda #0xff\n"
//	"sta %0\n"  Calypsi
"donehypd81detach:\n"
    " nop\n"
  : "=Ka"(retval) : : "a", "x");
  return retval;
}
*/
unsigned char hyppo_dos_attach(unsigned char mountbits)  {
	unsigned char retval;

  __asm(
    " lda #0x4a\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhypd81dosattach\n"
//    "sta %0\n"  Calypsi
	" jmp donehypd81dosattach\n"
"errhypd81dosattach:\n"
    " lda #0xff\n"
//	"sta %0\n"  Calypsi
"donehypd81dosattach:\n"
    " nop\n"
  : "=Ka"(retval) : "Kx"(mountbits) : "a", "y");
  return retval;
}
/*
unsigned char hyppo_d81attach0() {return hyppo_dos_attach(0b00000000);}
unsigned char hyppo_d81attach1() {return hyppo_dos_attach(0b00000001);}
unsigned char hyppo_d81detach()  {return hyppo_dos_attach(0b10000010);}
*/

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
	LDZ #0x04 ; Most significant byte
	LDY #0x80 ; Middle byte
	LDX #0x00 ; Least significant byte
	LDA #0x36 : STA HTRAP00 : CLV : BCC error
  }
}
*/

unsigned char hyppo_opendir(void)  {
	unsigned char retval;

  __asm(
	" ldx #0x00\n"    // shouldn't be necessary
    " lda #0x12\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhypopendir\n"
//    "sta %0\n"  Calypsi
	" jmp donehypopendir\n"
"errhypopendir:\n"
    " lda #0xff\n"
//	"sta %0\n"  Calypsi
"donehypopendir:\n"
    " nop\n"
  : "=Ka"(retval) : : "a", "x");
  return retval;
}

unsigned char hyppo_chdir(void)  {
	unsigned char retval;

  __asm(
	" ldx #0x00\n"    // shouldn't be necessary
    " lda #0x34\n"    // hyppo_findfile
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhypchdir\n"

//	"ldx #0x00\n"    // shouldn't be necessary
    " lda #0x0c\n"    // hyppo_chdir
	" sta HTRAP00\n"
	" clv\n"
//	"bcc errhypchdir\n"
//    "sta %0\n"  Calypsi
	" jmp donehypchdir\n"
"errhypchdir:\n"
    " lda #0xff\n"
//	"sta %0\n"  Calypsi
"donehypchdir:\n"
    " nop\n"
  : "=Ka"(retval) : : "a", "x");
  return retval;
}

unsigned char hyppo_closedir(unsigned char filedescriptor)  {
	unsigned char retval;

  __asm(
//	"ldx filedescriptor\n"
    " lda #0x16\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhypclosedir\n"
    " txa\n" //   Calypsi stx %0\n"
	" jmp donehypclosedir\n"
"errhypclosedir:\n"
//	"sta %0\n"  Calypsi
"donehypclosedir:\n"
    " nop\n"
  : "=Ka"(retval) : "Kx"(filedescriptor) : "a");
  return retval;
}

unsigned char hyppo_readdir(unsigned char filedescriptor)  {
	unsigned char retval;

// @@ ideas for optimisation: skip the whole emptying of the dirent completely
  __asm(
	// pha
	" phx\n"
	// First, clear out the dirent
	" ldx #0\n"
	" txa\n"
"hypreaddirloop: sta " XSTR(readdir_direntasm) ",x\n"
	" dex\n"
	" bne hypreaddirloop\n"
	" plx\n"
//	"ldx filedescriptor\n"
	" tya\n"
	" tax\n"

	// Third, call the hypervisor trap
	// File descriptor gets passed in in X.
	// Result gets written to transfer area we setup at $0400
	" ldy #.byte1 (" XSTR(readdir_direntasm) ")\n"  // before Calypsi #>readdir_dirent
	" sty 0x1630\n"  // @@@@ testing
	" lda #0x14\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhypreaddir\n"
    " txa\n" //   Calypsi stx %0\n"
	" jmp donehypreaddir\n"
"errhypreaddir:\n"
//	"sta %0\n"  Calypsi
"donehypreaddir:\n"
    " nop\n"
  : "=Ka"(retval) : "Ky"(filedescriptor) : "a", "x");

  if (readdir_dirent->length >= LFNFILENAMELEN)  {
    readdir_dirent->lfn[LFNFILENAMELEN - 1] = 0;     // cut last character :(
  } else {
    readdir_dirent->lfn[readdir_dirent->length] = 0; // put str terminate null
  }

  return retval;
}

unsigned char hyppo_findfirst(void)  {
	unsigned char retval;

  __asm(
	" ldx #0x00\n"    // reset number of found file entries
    " lda #0x30\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhypfindfirst\n"
//    "sta %0\n"  Calypsi
	" jmp donehypfindfirst\n"
"errhypfindfirst:\n"
/*  a already carries the return (error) code
    "lda #0xff\n"
*/
//	"sta %0\n"  Calypsi
"donehypfindfirst:\n"
    " nop\n"
  : "=Ka"(retval) : : "a", "x");
  return retval;
}

unsigned char hyppo_openfile(unsigned char filedescriptor)  {
	unsigned char retval;

  __asm(
//	"ldx #0x00\n"    // shouldn't be necessary
    " lda #0x18\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhypopenfile\n"
//    "sta %0\n"  Calypsi
	" jmp donehypopenfile\n"
"errhypopenfile:\n"
/*  a already carries the return (error) code
    "lda #0xff\n"
*/
//	"sta %0\n"  Calypsi
"donehypopenfile:\n"
    " nop\n"
  : "=Ka"(retval) : "Kx"(filedescriptor) : "a" );
  return retval;
}

unsigned char hyppo_readfile(unsigned char filedescriptor)  {
	unsigned char retval;

  __asm(
//	"ldx #0x00\n"    // shouldn't be necessary
    " lda #0x1a\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhypreadfile\n"
//    "sta %0\n"  Calypsi
	" jmp donehypreadfile\n"
"errhypreadfile:\n"
    " lda #0xff\n"
//	"sta %0\n"  Calypsi
"donehypreadfile:\n"
    " nop\n"
  : "=Ka"(retval) : "Kx"(filedescriptor) : "a");
  return retval;
}

unsigned char hyppo_closefile(unsigned char filedescriptor)  {
	unsigned char retval;

  __asm(
//	"ldx #0x00\n"    // shouldn't be necessary
    " lda #0x20\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errhypclosefile\n"
//    "sta %0\n"  Calypsi
	" jmp donehypclosefile\n"
"errhypclosefile:\n"
    " lda #0xff\n"
//	"sta %0\n"  Calypsi
"donehypclosefile:\n"
    " nop\n"
  : "=Ka"(retval) : "Kx"(filedescriptor) : "a");
  return retval;
}

unsigned char hyppo_rmfile(unsigned char filedescriptor)  {
  unsigned char retval;

  __asm(
//    "ldx #$00\n"    // shouldn't be necessary
    " lda #0x26\n"
    " sta HTRAP00\n"
    " clv\n"
    " bcc errhyprmfile\n"
//    "sta %0\n"  Calypsi
    " jmp donehyprmfile\n"
"errhyprmfile:\n"
    " lda #0xFF\n"
//    "sta %0\n"  Calypsi
"donehyprmfile:\n"
    " nop\n"
  : "=Ka"(retval) : "Kx"(filedescriptor) : "a");
  return retval;
}

unsigned char hyppo_rmdir(unsigned char filedescriptor)  {
  unsigned char retval;

  __asm(
//    "ldx #$00\n"    // shouldn't be necessary
    " lda #0x10\n"
    " sta HTRAP00\n"
    " clv\n"
    " bcc errhyprmfile\n"
//    "sta %0\n"  Calypsi
    " jmp donehyprmfile\n"
"errhyprmfile:\n"
    " lda #0xFF\n"
//    "sta %0\n"  Calypsi
"donehyprmfile:\n"
    " nop\n"
  : "=Ka"(retval) : "Kx"(filedescriptor) : "a");
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

DIRENT direntryblock2; // @@@@ to be changed to an own array
// misuse a DOS dirent to store Hyppo dirent:
unsigned char getallhyppoentries(unsigned char drive, unsigned char side,
                                 unsigned char maxentries)  {
  unsigned char i;
  unsigned char curdrv = 0;
  unsigned char fd = 0xff;
  unsigned char readerr;
  unsigned char entries = 0;
//  DIRENT* ds;

  // @@ later to be changed to switch storage card drives according to
  // Lydon's undocumented traps 0xc0 and 0xc1:
  curdrv = hyppo_getcurrentdrive();

  if (curdrv < 0xff)  {
    fd = hyppo_opendir();

    if (fd != 0x84 && fd != 0x87 && fd != 0xff) {
      readerr = 0;
	  i = 0;
	  // @@ 255 because "i" is a byte, error $85 is bad cluster meaning end of dir:
      while (entries < maxentries && i < 255 && readerr != 0x85) {
//        ds = (DIRENT *) direntryblock2;
        readerr = hyppo_readdir(fd);
		
		// @@ add check to exclude non-.d81 and non-dir entries!
		// @@ see #386, attributes for it in big book.
		
        // No error apparent, must be a dir entry, a file with extension .d81
		// and must not be a directory entry named ".":
		if (readerr != 0x85 && readerr != 0xff &&
		    (((readdir_dirent->attr & HYPPODIRENTATTRDIR) &&
			  !(readdir_dirent->sfn[0] == '.' && readdir_dirent->sfn[1] == ' ')) ||
			 ((readdir_dirent->ext[0] == 'd' || readdir_dirent->ext[0] == 'D') &&
			  readdir_dirent->ext[1] == '8' &&
			  readdir_dirent->ext[2] == '1')))
		{
          msprintfd("filename is: ");
          msprintfd(getsfn()); // already null terminated
		  cputlnd();
		  cgetcd();
		  strcpy((char *) direntryblock2.name, getsfn());
		  direntryblock2.chntrack = (readdir_dirent->clusternumber >> 24) | 0x80; // Highest bit set
		  direntryblock2.chnsector = (readdir_dirent->clusternumber >> 16) & 0xff;
		  direntryblock2.track = (readdir_dirent->clusternumber >> 8) & 0xff | 0x80; // Highest bit set
		  direntryblock2.sector = readdir_dirent->clusternumber & 0xff;
		  direntryblock2.type = readdir_dirent->attr | HYPPODIRENTATTR; // to determine from mounted
		  direntryblock2.size = readdir_dirent->size / 1024; // kB
//		  direntryblock2.access = 0;
	      lcopy((uint32_t) &direntryblock2,
	            ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + entries * DIRENTSIZE,
			    DIRENTSIZE);
	      lcopy((uint32_t) readdir_dirent->lfn,
	            ATTICLFNBUFFER + side * ATTICLFNBUFFERSIZE + entries * LFNFILENAMELEN,
			    LFNFILENAMELEN);
		  entries++;
        } else  {
		  // empty string usually crash when printed, so:
		  direntryblock2.name[0] = 32; direntryblock2.name[1] = 0;
/*
		  snprintf( filelist[i], 65, "%d", i);
		  messagebox(0, "error at reading storage card entry",
                     filelist[i],
			         "for current directory.");
*/
		}
		i++;
	  }
	  hyppo_closedir(fd);
	}
  }

  // snprintf( ds->name, 65, "%d", entries);
//  messagebox(0, "returning", ds->name, "entries.");
  return entries - 1;
}
unsigned char gethyppodirent(unsigned char drive, unsigned char side,
                             unsigned char maxentries)  {
  unsigned char i;

  i = getallhyppoentries(drive, side, maxentries);
  return i;
}

void hyppo_reset(void)  {
  __asm(
    " lda #0x7e\n"
	  " sta HTRAP00\n"
	  " clv\n"
    " bcc errhypreset\n"
//    "sta %0\n"  Calypsi
    " jmp donehypreset\n"
"errhypreset:\n"
    " lda #0xFF\n"
//    "sta %0\n"  Calypsi
"donehypreset:\n"
    " nop\n"
  :  :  : "a");
}

void hyppo_freeze_self(void)  {
  __asm(
    " lda #0x00\n"     // book says value is "xx"
	  " sta HTRAP3F\n"  // mind the different trap
	  " clv\n"
    " bcc errhypfreeze\n"
//    "sta %0\n"  Calypsi
    " jmp donehypfreeze\n"
"errhypfreeze:\n"
    " lda #0xFF\n"
//    "sta %0\n"  Calypsi
"donehypfreeze:\n"
    " nop\n"
  :  :  : "a");
}

// https://www.felixcloutier.com/documents/gcc-asm.html#outputs
// @@ minorHDOS not yet implemented
/*
unsigned char hyppo_getversion(unsigned char * _majorhyppo, unsigned char * _minorhyppo,
                      unsigned char * _majorHDOS,  unsigned char * _minorHDOS)  {
  unsigned char _majhyp;
  unsigned char _minhyp;
  unsigned char _majdos;
  unsigned char _mindos;
*/
unsigned char hyppo_getversion_majorhyppo(void)  {
  unsigned char ret;

  __asm(
    " lda #0x00\n"
      " ldx #0x00\n"  // @@@@ testing
      " ldy #0x00\n"
      " ldz #0x00\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errmajhyp\n"
//    "sta %0\n"  Calypsi
	" jmp donemajhyp\n"
"errmajhyp:\n"
    " lda #0xff\n"
//	" sta %0\n"  Calypsi
"donemajhyp:\n"
	" nop\n"
  : "=Ka" (ret)
  :  : "a", "x", "y", "z" );
//  *_majorhyppo = _majhyp;

  return ret;
}

unsigned char hyppo_getversion_minorhyppo(void)  {
  unsigned char ret;

  __asm(
    " lda #0x00\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errminhyp\n"
//    "sta %0\n"  Calypsi
	" jmp doneminhyp\n"
"errminhyp:\n"
    " ldx #0xff\n"
//	" sta %0\n"  Calypsi
"doneminhyp:\n"
	" nop\n"
  : "=Kx" (ret)
  :  : "a", "x", "y", "z" );
//  *_minorhyppo = _minhyp;

  return ret;
}

unsigned char hyppo_getversion_majorHDOS(void)  {
  unsigned char ret;

  __asm(
    " lda #0x00\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errmajdos\n"
//    "sta %0\n"  Calypsi
	" jmp donemajdos\n"
"errmajdos:\n"
    " ldy #0xff\n"
//	" sta %0\n"  Calypsi
"donemajdos:\n"
	" nop\n"
  : "=Ky" (ret)
  :  : "a", "x", "y", "z" );
//  *_majorHDOS = _majdos;

  return ret;
}

unsigned char hyppo_getversion_minorHDOS(void)  {
  unsigned char ret;

  __asm(
    " lda #0x00\n"
	" sta HTRAP00\n"
	" clv\n"
	" bcc errmindos\n"
//    "sta %0\n"  Calypsi
	" jmp donemindos\n"
"errmindos:\n"
    " ldz #0xff\n"
//	" sta %0\n"  Calypsi
"donemindos:\n"
	" nop\n"
	// llvm doesn't know the z reg

//    " sta 0x1700\n"   // @@@@ testing
//    " stx 0x1701\n"
//    " sty 0x1702\n"
//    " stz 0x1703\n"

//	" tza\n"
  : "=Kz" (ret)
  :  : "a", "x", "y", "z" );
//  *_minorHDOS = _mindos;

  return ret;
}

// ******************************************
// ***  End of hyppo related functions    ***
// ******************************************

// to test
// - loop both drives but only use "0" as the parameter

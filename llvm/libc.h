// *********************************************************
// ***  libc.h abstraction to hyppo mount handling       ***
// *********************************************************

// char __align(0x100) Hyppo_Filename[] = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxFSHOT.D81";
struct HYPPOFILENAME {
	char name[65];
	char sfn[65];
	unsigned char dummy[256-65-65];  // blown up to fill a whole page
};

struct DIRENT {
	char lfn[0x40];    // The long file name
	char length;      // The length of long file name
	char sfn[8];      // The short file name without the extension
	char ext[3];      // The extension
	char res[2];      // unused
	unsigned long clusternumber; // The cluster number where the file
	                             // begins. For sub-directories, this
								 // is where the FAT dir entries start
								 // for that sub-directory
	unsigned long size; // The length of file in bytes
	char attr;        // The type and attribute bits:
					  // Bit Meaning if bit is set
					  // 0   Read only
					  // 1   Hidden
					  // 2   System
					  // 3   Volume label
					  // 4   Sub-directory
					  // 5   Archive
	unsigned char dummy[256-87];  // blown up to fill a whole page
};

struct DIRENT* const readdir_dirent = (struct DIRENT*) 0x6000; // needs be at page frame
// char __align(0x100) readdir_dirent[256]; // sizeof(DIRENT)]; occupies the whole page!
// DIRENT* entry = (DIRENT*) &readdir_dirent;

struct HYPPOFILENAME* const hyppofn = (struct HYPPOFILENAME*) 0x6100; // needs be at a
                                                                  // page frame border

char tolower(char ch) {
    if(ch>='A' && ch<='Z') {
        return ch + ('a'-'A');
    } else {
        return ch;
    }
}

char * strlowr(char *str) {
    char * src = str;
    while(*src) {
        *src = tolower(*src);
        src++;
    }
    return str;
}

char * strsan(char *str) {
  char * s = str;
  
  while (*s) {
//  for (int i=0; i < sizeof(s); s++) {
	if (*s < 0x20 || *s > 0x7d) *s = '?';
	s++;
  }
  return s;
}

unsigned char hyppo_setup_transfer_area(void)  {
  unsigned char fnamelo = (unsigned int)hyppofn & 0xFFFF;
  unsigned char fnamehi = (unsigned int)hyppofn >> 8;
  unsigned char fnamelen = strlen(hyppofn);

  asm volatile(
	"ldx #$00\n"         // shouldn't be necessary
	"ldy #>(fnamehi)\n"  // works only because "name" is first in struct
    "lda #$3a\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc error01\n"
    "sta retval\n"
	"jmp done01\n"
"error01:\n"
    "lda #$FF\n"
	"sta retval\n"
"done01:\n"
    "nop\n"
	: "=r"(retval) : "d"(fnamehi) : "a");
  return retval;
}

unsigned char hyppo_getcurrentdrive(void)
{
  // ; Get the current drive
  asm volatile(
	"ldx #$00\n"    // shouldn't be necessary
    "lda #$04\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc error02\n"
    "sta %0\n"
	"jmp done02\n"
"error02:\n"
    "lda #$FF\n"
	"sta %0\n"
"done02:\n"
    "nop"
	: "=r"(retval) ::);

  return retval;
}

// https://llvm-mos.org/wiki/C_Inline_Assembly
// https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html
//                            : %0  :  %1  :
//                asm         :input:output:clobber  comma separated
// asm volatile ("st%0 0x1234"::"R"(value));

unsigned char hyppo_selectdrive(unsigned char nb)
{
  asm volatile(
    "ldx %1\n"
	"lda #$06\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc error03\n"
    "stx %0\n"
	"jmp done03\n"
"error03:\n"
	"sta %0\n"
"done03:\n"
    "nop\n"
: "=r"(retval)
: "r"(nb) :);   // input

  return retval;
}

unsigned char hyppo_setname(char *filename)
{
  unsigned char fnamelo = (unsigned int)hyppofn & 0xFFFF;
  unsigned char fnamehi = (unsigned int)hyppofn >> 8;
  unsigned char fnamelen = strlen(hyppofn);

  strcpy(hyppofn->name, filename);

  asm volatile(
	"ldx #$00\n"         // shouldn't be necessary
	"ldy #>(fnamehi)\n"  // works only because "name" is first in struct
    "lda #$2e\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc error04\n"
    "sta retval\n"
	"jmp done04\n"
"error04:\n"
	"lda #$ff\n"
    "sta retval\n"
"done04:\n"
    "nop\n"
	: "=r"(retval) : "d"(fnamehi) : "a");
  return retval;
}

unsigned char hyppo_d81attach0(void)
{
  // ; Get the current drive
  asm volatile(
	"ldx #$00\n"    // shouldn't be necessary
    "lda #$40\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc error05\n"
    "sta retval\n"
	"jmp done05\n"
"error05:\n"
    "lda #$FF\n"
	"sta retval\n"
"done05:\n"
    "nop\n"
	: "=r"(retval) : : "a");
  return retval;
}

unsigned char hyppo_d81attach1(void)
{
  // ; Get the current drive
  asm volatile(
	"ldx #$00\n"    // shouldn't be necessary
    "lda #$46\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc error06\n"
    "sta retval\n"
	"jmp done06\n"
"error06:\n"
    "lda #$FF\n"
	"sta retval\n"
"done06:\n"
    "nop\n"
  : "=r"(retval) : : "a");
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

unsigned char hyppo_opendir(void)
{
  // ; Get the current drive
  asm volatile(
	"ldx #$00\n"    // shouldn't be necessary
    "lda #$12\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc error07\n"
    "sta retval\n"
	"jmp done07\n"
"error07:\n"
    "lda #$FF\n"
	"sta retval\n"
"done07:\n"
    "nop\n"
  : "=r"(retval) : : "a");
  return retval;
}

unsigned char hyppo_closedir(unsigned char filedescriptor)
{
  asm volatile(
	"ldx filedescriptor\n"
    "lda #$16\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc error08\n"
    "stx retval\n"
	"jmp done08\n"
"error08:\n"
	"sta retval\n"
"done08:\n"
    "nop\n"
  : "=r"(retval) : "d"(filedescriptor) : "a");
  return retval;
}

unsigned char hyppo_readdir(unsigned char filedescriptor)
{
//  volatile char register(Y) _rd = _readdir_dirent / 256;
  unsigned char direntlo = (unsigned int)readdir_dirent & 0xFFFF;
  unsigned char direnthi = (unsigned int)hyppofn >> 8;

  asm volatile(
	// pha
	"phx\n"
	// First, clear out the dirent
	"ldx #0\n"
	"txa\n"
"loop1: sta direnthi,x\n"
	"dex\n"
	"bne loop1\n"
	"plx\n"
	"ldx filedescriptor\n"

	// Third, call the hypervisor trap
	// File descriptor gets passed in in X.
	// Result gets written to transfer area we setup at $0400
	"ldy #>(direnthi)\n"
	"lda #$14\n"
	"sta HTRAP00\n"
	"clv\n"
	"bcc error09\n"
    "stx retval\n"
	"jmp done09\n"
"error09:\n"
	"sta retval\n"
"done09:\n"
    "nop\n"
  : "=r"(retval) : "d"(direnthi),"d"(filedescriptor) : "a");

  readdir_dirent->lfn[readdir_dirent->length] = 0; // put str terminate null

  return retval;
/*	nop

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
  }}
  readdir_dirent->lfn[readdir_dirent->length] = 0; // put str terminate null
  
  return retval;   */
}

char * getsfn() {
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

// ******************************************
// ***  End of hyppo related functions    ***
// ******************************************

// to test
// - replace keyboard empty wait and keypress routines to one from Discord
// - loop both drives but only use "0" as the parameter

int minimedir(void)
{
    unsigned char go = 0;
    unsigned char rc;

    for (unsigned char i = 0; i <= 1; i++)  {
	  /* Open the directory. */
	  miniSetDriveNbr(i);
	  unsigned char filename[] = "midnightmega.0";
	  miniSetFileName(filename);
	  miniSetFileType(VAL_DOSFTYPE_PRG);
      if ((rc = miniOpenFile()) != 0) {
          printf("error opening %s: %02x\n", filename, rc);
          return 1;
      }
	  unsigned char keycode;
	  while(! (keycode=waitforkeyandletgo())) {}
	}

    /* Output the directory. * /
    printf("contents of \"%s\":\n", name);
    while ((rc = cbm_readdir (myLFN, &E)) != 2) {
        if (rc != 0) {
          if (rc <= 6) {
            printf ("\ndirectory error:\n %s.\n", error[rc]);
          }
          cbm_closedir (myLFN);
          return 1;
        }

        printf (" name[]: \"%s\"\n", E.name);
        printf (" size  :%6u\n",     E.size);
        printf (" type  : %s\n",     type[E.type]);
        printf (" access: %s\n",     access[E.access > 3 ? 0 : E.access]);
        printf ("----\n");

        if (!go) {
            switch (cgetc ()) {
              case 'q':
//                goto done;
				break;

              case 'g':
                go = 1;
            }
        }
    }

    printf (" size  :%6u free.\n", E.size);
done:
*/
    /* Close the directory. */
    miniCloseFile();
    return 0;
}

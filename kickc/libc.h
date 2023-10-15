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
	char lfn[$40];    // The long file name
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
	if (*s < $20 || *s > $7d) *s = '?';
	s++;
  }
  return s;
}

unsigned char hyppo_setup_transfer_area(void)  {
  kickasm (uses hyppofn) {{
	ldx #$00         // shouldn't be necessary
	ldy #>(hyppofn)  // works only because "name" is first in struct
    lda #$3a
	sta HTRAP00
	clv
	bcc error
    sta retval
	jmp done
error:
    lda #$FF
	sta retval
done:
    nop
  }}
  return retval;
}

unsigned char hyppo_getcurrentdrive(void)
{
  // ; Get the current drive
  asm {
	ldx #$00    // shouldn't be necessary
    lda #$04
	sta HTRAP00
	clv
	bcc error
    sta retval
	jmp done
error:
    lda #$FF
	sta retval
done:
    nop
  }
  return retval;
}

unsigned char hyppo_selectdrive(unsigned char nb)
{
  kickasm (uses nb) {{
    ldx nb
	lda #$06
	sta HTRAP00
	clv
	bcc error
    stx retval
	jmp done
error:
    lda #$FF
	sta retval
done:
    nop
  }}
  return retval;
}

unsigned char hyppo_setname(char *filename)
{
  strcpy(hyppofn->name, filename);

  kickasm (uses hyppofn) {{
	ldx #$00         // shouldn't be necessary
	ldy #>(hyppofn)  // works only because "name" is first in struct
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
  }}
  return retval;
}

unsigned char hyppo_d81attach0(void)
{
  // ; Get the current drive
  asm {
	ldx #$00    // shouldn't be necessary
    lda #$40
	sta HTRAP00
	clv
	bcc error
    sta retval
	jmp done
error:
    lda #$FF
	sta retval
done:
    nop
  }
  return retval;
}

unsigned char hyppo_d81attach1(void)
{
  // ; Get the current drive
  asm {
	ldx #$00    // shouldn't be necessary
    lda #$46
	sta HTRAP00
	clv
	bcc error
    sta retval
	jmp done
error:
    lda #$FF
	sta retval
done:
    nop
  }
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
  asm {
	ldx #$00    // shouldn't be necessary
    lda #$12
	sta HTRAP00
	clv
	bcc error
    sta retval
	jmp done
error:
    lda #$FF
	sta retval
done:
    nop
  }
  return retval;
}

unsigned char hyppo_closedir(unsigned char filedescriptor)
{
  kickasm (uses filedescriptor) {{
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
  }}
  return retval;
}

unsigned char hyppo_readdir(unsigned char filedescriptor)
{
//  volatile char register(Y) _rd = readdir_dirent / 256;

  kickasm (uses readdir_dirent, uses filedescriptor) {{
	// pha
	phx
	// First, clear out the dirent
	ldx #0
	txa
@l1: sta readdir_dirent,x	
	dex
	bne @l1
	plx
	ldx filedescriptor

	// Third, call the hypervisor trap
	// File descriptor gets passed in in X.
	// Result gets written to transfer area we setup at $0400
	ldy #>(readdir_dirent)
	lda #$14
	sta HTRAP00
	clv
	bcc error
    stx retval
	jmp done
error:
	sta retval
done:
    nop
  }}
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
	if (readdir_dirent->sfn[i] > $20) {
	  hyppofn->sfn[c] = readdir_dirent->sfn[i];
	  c++;
	}
  }
  hyppofn->sfn[c] = '.';
  c++;
  for (int i = 8; i < 11 && readdir_dirent->sfn[i] != 32; i++) {
	if (readdir_dirent->sfn[i] > $20) {
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
*/
done:
    /* Close the directory. */
    miniCloseFile();
    return 0;
}

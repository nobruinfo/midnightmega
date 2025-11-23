/* static */ unsigned char /* __attribute__((used)) */ fnamehi;
/* static */ unsigned char /* __attribute__((used)) */ fnamelo;

// different way to access low/high bytes would be, but only works on globals:
//  " ldy #.byte1 (lfnname)\n"
//  " ldx #.byte0 (lfnname)\n"

// ******************************************
// ***  Begin of C64 kernelload KickC     ***
// ******************************************

// Example for SETNAM etc.:
// https://www.devili.iki.fi/pub/Commodore/docs/books/C128_Programmers_Reference_OCR.pdf

void setbnk()  {
  __asm volatile(
	" lda #0x00  ; lfBank	; bank for save\n"
	" ldx #0x00	; bank for filename\n"
  " jsr 0xff6b\n" // SETBNK
  :  :  : );
}

// Kernal SETNAM function
// SETNAM. Set file name parameters.
void setnam(char* filename) {
  char filename_len = (char)strlen(filename);

  __asm volatile(
    " ; Kernal SETNAM function\n"
    " ; SETNAM. Set file name parameters.\n"
    " ; Input: A = File name length; X/Y = Pointer to file name.\n"
    " lda %[filename_len]\n"
    " ldx %[filename]\n"
    " ldy %[filename] + 1\n"
    " sta 0x1610\n"  // @@@@@
    " stx 0x1611\n"
    " sty 0x1612\n"
    " jsr 0xffbd\n" // SETNAM
  :  : [filename_len] "Kzp8"(filename_len), [filename] "Kzp16"(filename)
     : "a", "x", "y", "z" );
}

// SETLFS. Set file parameters.
void setlfs(char device, char log, char sec) {
                                   // $00 means: load to new address
  __asm volatile(
    " ; SETLFS. Set file parameters.\n"
    " ; Input: A = Logical number; X = Device number; Y = Secondary address.\n"
    " ; ldx device\n"
    " ; lda log ; #0x0f\n"
    " ; ldy sec ; #0xff\n"
    " sta 0x1620\n"  // @@@@@
    " stx 0x1621\n"
    " sty 0x1622\n"
    " jsr 0xffba\n" // SETLFS
  :  : "Kx"(device), "Ka"(log), "Ky"(sec)
     : "a", "x", "y", "z" );
}

// LOAD. Load or verify file. (Must call SETLFS and SETNAM beforehands.)
// - verify: 0 = Load, 1-255 = Verify
//
// Returns a status, 0xff: Success other: Kernal Error Code
char load(char* address, char verify) {
  char status;

  fnamehi = (unsigned int) address >> 8;
  fnamelo = (unsigned int) address & 0xff;
  
/*    clrhome();
  printf("fnamehi is: %04x ", (unsigned int) fnamehi);
    cputln();
  printf("fnamelo is: %04x ", (unsigned int) fnamelo);
    cputln();
    cgetc();
*/

  __asm volatile(
    " ; LOAD. Load or verify file. (Must call SETLFS and SETNAM beforehands.)\n"
    " ; Input: A: 0 = Load, 1-255 = Verify; X/Y = Load address (if secondary address = 0).\n"
    " ; Output: Carry: 0 = No errors, 1 = Error; A = KERNAL error code (if Carry = 1);\n"
    " ;         X/Y = Address of last byte loaded/verified (if Carry = 0).\n"
    " ; ldx address\n"
    " ; ldy address+1\n"
    " ; lda verify\n"
    " ;        \n"
    " ; Testing\n"
    " ; ldy #0x16\n"
    " ; ldx #0x00\n"
    " ;        \n"
    " jsr 0xffd5\n" // LOAD
    " bcs loaderror\n"
    " lda #0xff\n"
    "loaderror: nop\n"
    " ; sta %0  Calypsi\n"
  : "=Ka"(status) : "Ky"(fnamehi), "Ka"(verify), "Kx"(fnamelo) : );
  return status;
}

char readstr(char log, unsigned int address) {
  char status;

  __asm volatile(
/*
    " jsr 0xffb7\n"       // READST
    " bne end_copy\n"           // eof oder fehler
*/
    " lda %[log]\n"           // channel von SETLFS
    " tax\n"              // channel von SETLFS
    " jsr 0xffc6\n"       // CHKIN (input file)
/*
    " jsr 0xffb7\n"       // READST error status
    " bne end_copy\n"           // eof oder fehler
*/
    " ldy #0\n"           // index im block,  für Schleife mit y von GPT
"read:\n"
    " jsr 0xffcf\n"       // CHRIN
    " sta (%[address]),y\n"
    " iny\n"
//    " bcc read\n"
    " cmp	#0x0D\n"        // carriage return?
    " bne read\n"

    " jsr 0xffcc\n"       // CLRCHN
    "end_copy:\n"
  : "=Ka"(status) : [log] "Kzp8"(log), [address] "Kzp16"(address)
     : "a", "x", "y", "z" );
  return status;
}

char readbytes(char log, unsigned int address, unsigned int nbrbytes) {
  char status;

  __asm volatile(
    " lda %[address]\n"
    " sta 0x160c\n"
    " lda %[address]+1\n"
    " sta 0x160d\n"
/*
    " jsr 0xffb7\n"       // READST
    " bne end_copy\n"           // eof or error
*/
    " ldx %[log]\n"       // as set with SETLFS
    " jsr 0xffc6\n"       // CHKIN (input file)
/*
    " jsr 0xffb7\n"       // READST error status
    " bne end_copy\n"           // eof or error
*/
    " ldy #0\n"           // index within block
"read:\n"
    " jsr 0xffcf\n"       // CHRIN
//    " sta 0x1660,y\n"
//    " tya\n"              // @@@@@
    " sta 0x160a\n"
    " sta (%[address]),y\n"
    " iny\n"
//    " bcc read\n"
    " cpy #0x00\n"  // " cpy %[nbrbytes]\n"
    " bne read\n"

    " sty 0x160b\n"

    " jsr 0xffcc\n"       // CLRCHN
    "end_copy:\n"
  : "=Ka"(status) : [log] "Kzp8"(log), [nbrbytes] "Kzp16"(nbrbytes),
                    [address] "Kzp16"(address)
     : "a", "x", "y", "z" );
  return status;
}

char writebytes(char log, unsigned int address, unsigned int nbrbytes) {
  char status;
  unsigned int firstaddress = address;

  address++;

  __asm volatile(
/*
    " jsr 0xffb7\n"       // READST
    " bne end_copy\n"           // eof oder error
*/
    " ldx %[log]\n"       // as set with SETLFS
    " jsr 0xffc9\n"       // CHKOUT
/*
    " jsr 0xffb7\n"       // READST error status
    " bne end_copy\n"           // eof oder error
*/
    " ldz #0\n"           // index within block
    " ldx #0\n"           // maybe X should be initialised?
"nextwrite:\n"
    " lda (%[address]),z\n"
//    " tza\n"              // @@@@@
    " jsr 0xffd2\n"       // CHROUT
    " inz\n"
    " cpz #0xff\n"  //  " cpy %[nbrbytes]\n"
    " bne nextwrite\n"

    " ldz #0\n"
    " lda (%[firstaddress]),z\n" // @@@@@ first byte last sent
    " jsr 0xffd2\n"       // CHROUT

    " jsr 0xffcc\n"       // CLRCHN
//    "end_copy:\n"
  : "=Ka"(status) : [log] "Kzp8"(log), [nbrbytes] "Kzp16"(nbrbytes),
                    [address] "Kzp16"(address),
                    [firstaddress] "Kzp16"(firstaddress)
     : "a", "x", "y", "z" );
  return status;
}

char writestr(char log, unsigned int address) {
  char status;

  __asm volatile(
    " lda %[address]\n"
    " sta 0x160e\n"
    " lda %[address]+1\n"
    " sta 0x160f\n"
/*
    " jsr 0xffb7\n"       // READST
    " bne end_copy\n"     // eof oder fehler
*/
    " lda %[log]\n"       // channel von SETLFS
    " tax\n"              // channel von SETLFS
    " jsr 0xffc9\n"       // CHKOUT
/*
    " jsr 0xffb7\n"       // READST error status
    " bne end_copy\n"           // eof oder fehler
*/
    " ldy #0\n"           // index im block,  für Schleife mit y von GPT
"nextwrite:\n"
    " lda (%[address]),y\n"

    " sta 0x16a0,y\n"

    " beq end_copy\n"
    " jsr 0xffd2\n"       // CHROUT
    " iny\n"
    " bne nextwrite\n"
    " beq nextwrite\n"    // @@@@@

    "end_copy:\n"
    " jsr 0xffcc\n"       // CLRCHN
  : "=Ka"(status) : [log] "Kzp8"(log), [address] "Kzp16"(address)
     : "a", "x", "y", "z" );
  return status;
}

void iecopen(void)  {

  asm volatile(
    " jsr 0xffc0\n"        // OPEN
/*
    " bcs end_copy\n"           // fehler

    " jsr 0xffb7\n"       // READST
    " bne end_copy\n"           // eof oder fehler
*/
    "end_copy:\n"
  : : : "a", "x", "y", "z" );
}

void iecclose(char log)  {

  asm volatile(
//    " lda #9\n"           // channel von SETLFS
    " jsr 0xffc3\n"       // CLOSE
    " bcs end_copy\n"           // fehler

    " jsr 0xffb7\n"       // READST error status
    " bne end_copy\n"           // eof oder fehler

    "end_copy:\n"
  :  : "Ka"(log)
     : "a", "x", "y", "z" );
}

/* *** Not implemented, not needed ***

// Load a file to memory
// Returns a status:
// - 0xff: Success
// - other: Kernal Error Code (https://commodore.ca/manuals/pdfs/commodore_error_messages.pdf)
char loadFileToMemory( char device, char* filename, char* address) {
  setnam(filename);
  setlfs(device, 1, 0);
  return load(address, 0);
}

volatile __zp char* addresszp;
volatile char* endaddress;

char saveFileToMemory( char device, char* filename, char* address) {
//	printf("SETNAM is: %04x ", (unsigned int) SETNAM);
//	printf("SETLFS is: %04x ", (unsigned int) SETLFS);
//	printf("SAVE is: %04x ", (unsigned int) SAVE);
	endaddress = (address + sizeof(address));
	addresszp = address;
	printf("addresszp is: %04x ", (unsigned int) addresszp);
	printf("endaddress is: %04x ", (unsigned int) endaddress);
	printf("\n\n\n\n");
	setbnk();
    setnam(filename);
    setlfs(device);
    return save(addresszp, endaddress);
}

char save(char* address, char* end) {
    char status;
    asm {
		
*/

/*
		// https://github.com/MEGA65/mega65-examples/blob/main/asm/load_save_d81/main.asm
		lda #<$0000
		sta $04
		lda #>$0000
		sta $05

		// for start address
		lda #0x00  // lfBank+1
		sta $b0
		lda #0x00  // lfBank
		sta $af
		// for end address
		lda #0x00  // lfBank+1
		sta $ac
		lda #0x00  // lfBank
		sta $ab
*/

/*

        // regular routine:
		ldx end
        ldy end+1
        lda #<address
		clc
        jsr SAVE
        bcs error
        lda #0xff
        error:
        sta status
    }
    return status;
}

*/

void checkerrorchannel(unsigned char drive, char* msg) {
  unsigned char cmdchannel = 14;
  unsigned char status;

  setbnk();
  setnam("");  // no setnam needed
  setlfs(drive, cmdchannel, 15);
  iecopen();
  status = readstr(cmdchannel, 0x1680);
  iecclose(cmdchannel);

	mh4printf(msg, status); // @@@@@
  cputln();
  cgetc();
  flushkeybuf();
  
  for (int i=0; PEEK(0x1680 + i) != 0xd; i++)  {
    POKE(0x1680 + i, 0);
  }
}

unsigned char readtracksector(unsigned char drive,
                              unsigned char datachannel, unsigned char cmdchannel,
                              unsigned char track, unsigned char sector) {
  char status;  // @@@@@ Could this be handled better?

  // *** open command channel ***
  setbnk();
  setnam("");  // ("U1 2 0 40 3");
  //   dev log sec
  setlfs(drive, cmdchannel,15);
  iecopen();

  // *** open data channel ***
  // data read channel needs to be open before the command is given:
  setbnk();
  setnam("#");
  //   dev log sec
  setlfs(drive, datachannel, datachannel); // needs to be the same sec=2 as in the U1 command
  iecopen();
  // This doesn't seem to be data but the file name a few lines above:
  //  status = writestr(datachannel, (unsigned int)(uintptr_t) "#");
  
  // Do not check the error channel in between asking for data an getting:
  //  checkerrorchannel(drive, "dos after open datachannel ");

  // *** write command channel ***
  strcopy((char *) "U1 dc 0 tt ss", (char *) lfnname, 13);
  lfnname[3] = (datachannel / 10) ? (datachannel / 10 + 0x30) : ' ';
  lfnname[4] = datachannel % 10 + 0x30;
  lfnname[8] = (track / 10) ? (track / 10 + 0x30) : ' ';
  lfnname[9] = track % 10 + 0x30;
  lfnname[11] = (sector / 10) ? (sector / 10 + 0x30) : ' ';
  lfnname[12] = sector % 10 + 0x30;
  status = writestr(cmdchannel, (unsigned int)(uintptr_t) lfnname);

  // Do not check the error channel in between asking for data an getting:
  //  checkerrorchannel(drive, "dos after track/sector command ");

  // *** read data channel ***
  status = readbytes(datachannel, 0x6000, 0x100);
  iecclose(datachannel);

  // *** close command channel ***
  iecclose(cmdchannel);

  return status;
}

unsigned char writetracksector(unsigned char drive,
                              unsigned char datachannel, unsigned char cmdchannel,
                              unsigned char track, unsigned char sector) {
  char status;  // @@@@@ Could this be handled better?

  // *** open command channel ***
  setbnk();
  setnam("");  // ("U1 4 0 40 3");
  //   dev log sec
  setlfs(drive, cmdchannel,15);
  iecopen();

  // *** open data channel ***
  // data read channel needs to be open before the command is given:
  setbnk();
  setnam("#");
  //   dev log sec
  setlfs(drive, datachannel, datachannel); // needs to be the same sec=4 as in the U1 command
  iecopen();
  // This doesn't seem to be data but the file name a few lines above:
  //  status = writestr(datachannel, (unsigned int)(uintptr_t) "#");
  
  // Do not check the error channel in between asking for data an getting:
  //  checkerrorchannel("dos after open datachannel ");

  // *** write data channel ***
  status = writebytes(datachannel, 0x6000, 0x100);

  // *** write command channel ***
  strcopy((char *) "U2 dc 0 tt ss", (char *) lfnname, 13);
  lfnname[3] = (datachannel / 10) ? (datachannel / 10 + 0x30) : ' ';
  lfnname[4] = datachannel % 10 + 0x30;
  lfnname[8] = (track / 10) ? (track / 10 + 0x30) : ' ';
  lfnname[9] = track % 10 + 0x30;
  lfnname[11] = (sector / 10) ? (sector / 10 + 0x30) : ' ';
  lfnname[12] = sector % 10 + 0x30;
  status = writestr(cmdchannel, (unsigned int)(uintptr_t) lfnname);

  // Do not check the error channel in between asking for data an getting:
  //  checkerrorchannel("dos after track/sector command ");

  iecclose(datachannel);

  // *** close command channel ***
  iecclose(cmdchannel);

  return status;
}

// ******************************************
// ***  End of C64 kernelload KickC       ***
// ******************************************

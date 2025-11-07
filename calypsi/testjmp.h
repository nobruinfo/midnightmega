/* static */ unsigned char /* __attribute__((used)) */ fnamehi;
/* static */ unsigned char /* __attribute__((used)) */ fnamelo;

// ******************************************
// ***  Begin of C64 kernelload KickC     ***
// ******************************************
// Kernal SETNAM function
// SETNAM. Set file name parameters.
void setnam(char* filename) {
  unsigned char retval;

  char filename_len = (char)strlen(filename);
  fnamehi = (unsigned int) filename >> 8;
  fnamelo = (unsigned int) filename & 0xff;
//  printf("filename_len is: %04x ", (unsigned int) filename_len);

  __asm(
    " ; Kernal SETNAM function\n"
    " ; SETNAM. Set file name parameters.\n"
    " ; Input: A = File name length; X/Y = Pointer to file name.\n"
    " ; lda #(filename_len)\n"
    " ; ldx #<filename\n"
    " ; ldy #>filename\n"
    " jsr SETNAM ; C64 $ffbd\n"
  :  : "Ky"(fnamehi), "Ka"(filename_len), "Kx"(fnamelo) : );
}

// SETLFS. Set file parameters.
void setlfs(char device) {
  unsigned char log = 1;
  unsigned char sec = 0; // $00 means: load to new address
  __asm(
    " ; SETLFS. Set file parameters.\n"
    " ; Input: A = Logical number; X = Device number; Y = Secondary address.\n"
    " ; ldx device\n"
    " ; lda log ; #0x0f\n"
    " ; ldy sec ; #0xff\n"
    " jsr SETLFS ; C64 $ffba\n"
  :  : "Ky"(sec), "Ka"(log), "Kx"(device) : );
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

  __asm(
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
    " jsr LOAD ; C64 $ffd5\n"
    " bcs loaderror\n"
    " lda #0xff\n"
    "loaderror: nop\n"
    " ; sta %0  Calypsi\n"
  : "=Ka"(status) : "Ky"(fnamehi), "Ka"(verify), "Kx"(fnamelo) : );
  return status;
}

void setbnk()  {
  __asm(
	" lda #0x00  ; lfBank	; bank for save\n"
	" ldx #0x00	; bank for filename\n"
	" jsr SETBNK  ; $ff6b\n"
  :  :  : );
}

// Load a file to memory
// Returns a status:
// - 0xff: Success
// - other: Kernal Error Code (https://commodore.ca/manuals/pdfs/commodore_error_messages.pdf)
char loadFileToMemory( char device, char* filename, char* address) {
  setnam(filename);
  setlfs(device);
  return load(address, 0);
}

/*

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

// ******************************************
// ***  End of C64 kernelload KickC       ***
// ******************************************

*/

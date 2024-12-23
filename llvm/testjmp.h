// __attribute__((section(".data")))
static unsigned char __attribute__((used)) fnamehi;
// __attribute__((section(".data")))
static unsigned char __attribute__((used)) fnamelo;

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
//  mh4printf("filename_len is: ", (unsigned long) filename_len);

  asm volatile(
    // Kernal SETNAM function
    // SETNAM. Set file name parameters.
    // Input: A = File name length; X/Y = Pointer to file name.
//    "lda #(filename_len)\n"
//    "ldx #<filename\n"
//    "ldy #>filename\n"
//    "brk\n"
//    "brk\n"
//    "brk\n"
//    "brk\n"
//    "eter%=:\n"
//    "jmp eter%=\n"
//    "brk\n"
//    "brk\n"
//    "brk\n"
//    "brk\n"
    "jsr SETNAM\n" // C64 $ffbd
  :  : "y"(fnamehi), "a"(filename_len), "x"(fnamelo) : );
}

// SETLFS. Set file parameters.
void setlfs(char device) {
  unsigned char log = 1;
  unsigned char sec = 0; // $00 means: load to new address
  asm volatile(
    // SETLFS. Set file parameters.
    // Input: A = Logical number; X = Device number; Y = Secondary address.
//    "ldx device\n"
//    "lda log\n" // #$0f
//    "ldy sec\n" // #$ff
    "jsr SETLFS\n" // C64 $ffba
  :  : "y"(sec), "a"(log), "x"(device) : );
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
  mh4printf("fnamehi is: ", (unsigned long) fnamehi);
  cputln();
  mh4printf("fnamelo is: ", (unsigned long) fnamelo);
  cputln();
  cgetc();
*/
  asm volatile(
    //LOAD. Load or verify file. (Must call SETLFS and SETNAM beforehands.)
    // Input: A: 0 = Load, 1-255 = Verify; X/Y = Load address (if secondary address = 0).
    // Output: Carry: 0 = No errors, 1 = Error; A = KERNAL error code (if Carry = 1); X/Y = Address of last byte loaded/verified (if Carry = 0).
//    "ldx address\n"
//    "ldy address+1\n"
//    "lda verify\n"
    "ldx #$16\n"
    "ldy #$00\n"
    "jsr LOAD\n" // C64 $ffd5
    "bcs loaderror%=\n"
    "lda #$ff\n"
    "loaderror%=:\n"
    "sta %0\n"
  : "=r"(status) : "y"(fnamehi), "a"(verify), "x"(fnamelo) : );
  return status;
}

void setbnk()  {
  asm volatile(
    "lda #$00\n"  // lfBank    // bank for save
    "ldx #$00\n"    // bank for filename
    "jsr SETBNK\n"  // $ff6b
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
//    mh4printf("SETNAM is: ", (unsigned long) SETNAM);
//    mh4printf("SETLFS is: ", (unsigned long) SETLFS);
//    mh4printf("SAVE is: ", (unsigned long) SAVE);
  endaddress = (address + sizeof(address));
  addresszp = address;
  mh4printf("addresszp is: ", (unsigned long) addresszp);
  mh4printf("endaddress is: ", (unsigned long) endaddress);
  cputln();
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
    lda #$00  // lfBank+1
    sta $b0
    lda #$00  // lfBank
    sta $af
    // for end address
    lda #$00  // lfBank+1
    sta $ac
    lda #$00  // lfBank
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
    lda #$ff
    error:
    sta status
  }
  return status;
}

// ******************************************
// ***  End of C64 kernelload KickC       ***
// ******************************************

*/

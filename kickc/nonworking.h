// ******************************************
// ***  Begin of C64 kernelload KickC     ***
// ******************************************
// Load a file to memory
// Returns a status:
// - 0xff: Success
// - other: Kernal Error Code (https://commodore.ca/manuals/pdfs/commodore_error_messages.pdf)
char loadFileToMemory( char device, char* filename, char* address) {
    setnam(filename);
    setlfs(device);
    return load(address, 0);
}

// Kernal SETNAM function
// SETNAM. Set file name parameters.
void setnam(char* filename) {
    char filename_len = (char)strlen(filename);
	printf("filename_len is: %04x ", (unsigned int) filename_len);
    asm {
        // Kernal SETNAM function
        // SETNAM. Set file name parameters.
        // Input: A = File name length; X/Y = Pointer to file name.
        lda filename_len
        ldx filename
        ldy filename+1
        jsr SETNAM // C64 $ffbd
    }
}

// SETLFS. Set file parameters.
void setlfs(char device) {
    asm {
        // SETLFS. Set file parameters.
        // Input: A = Logical number; X = Device number; Y = Secondary address.
        ldx device
        lda #0 // #$0f
        ldy #1 // #$ff
        jsr SETLFS // C64 $ffba
    }
}

// LOAD. Load or verify file. (Must call SETLFS and SETNAM beforehands.)
// - verify: 0 = Load, 1-255 = Verify
//
// Returns a status, 0xff: Success other: Kernal Error Code
char load(char* address, char verify) {
    char status;
    asm {
        //LOAD. Load or verify file. (Must call SETLFS and SETNAM beforehands.)
        // Input: A: 0 = Load, 1-255 = Verify; X/Y = Load address (if secondary address = 0).
        // Output: Carry: 0 = No errors, 1 = Error; A = KERNAL error code (if Carry = 1); X/Y = Address of last byte loaded/verified (if Carry = 0).
        ldx address
        ldy address+1
        lda verify
        jsr LOAD // C64 $ffd5
        bcs error
        lda #$ff
        error:
        sta status
    }
    return status;
}

void setbnk()  {
    asm {
		lda #$00  // lfBank	// bank for save
		ldx #$00	// bank for filename
		jsr SETBNK  // $ff6b
	}
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

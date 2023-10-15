// Gibt es im Basic eine Möglichkeit festzustellen um was für
// ein Laufwerk es sich bei U8 oder U9 handelt, also ob es das
// interne oder ein .d81 Image ist ?
// gardners: Du könntest $D6A9 peeken und die Bits daraus lesen

static unsigned char retval;

// unsigned char ptrMiniOffs = $DE;
volatile __zp unsigned long ptrMiniOffs;
// unsigned char * ptrMiniOffs = 0xFFD6C00; the address region is given
#define SECTBUF      0xFFD6C00
#define SECTBUFUPPER 0xFFD6D00
// unsigned char ptrFileName	=	0xE2;
char *sectbuf = (char *)SECTBUF;

#define VAL_DOSFTYPE_DEL 0
#define VAL_DOSFTYPE_SEQ 1
#define VAL_DOSFTYPE_PRG 2
#define VAL_DOSFTYPE_USR 3
#define VAL_DOSFTYPE_REL 4
#define VAL_DOSFTYPE_CBM 5

#define LEFTSIDE 0
#define RIGHTSIDE 1

unsigned char lenFileName = 0;
unsigned char datFileType = 0;

unsigned char arrFileName[0x10]; // = "";
unsigned char offsCurrIdx = 0;
unsigned char flagCurrSec = 0;
unsigned char datCurrDrv = 0;
unsigned char datCurrSide = LEFTSIDE;
unsigned char datNextTrk = 0;
volatile __zp unsigned char datNextSec = 0;
unsigned char datCurrTrk = 0;
unsigned char datCurrSec = 0;
unsigned char datCurrLen = 0;
#define ENTRYSIZE $20
unsigned char arrEntryBuf[ENTRYSIZE]; // = "";

unsigned char datEntryCntr = 0;
unsigned char datEntryType = 0;
unsigned char datEntryTrk = 0;
unsigned char datEntrySec = 0;
unsigned char datTempByte = 0;

#define NBRENTRIES 30
typedef struct structsectdirent {
	unsigned char chntrack;
	unsigned char chnsector;
    unsigned char type;
	unsigned char track;
	unsigned char sector;
             char name[16];     /* File name in PetSCII, limited to 16 chars */
	unsigned char dummy[8];
    unsigned int  size;
    unsigned char access;
} sectdirent;

sectdirent * direntry; // = &arrEntryBuf;  to be pointing to current entry
sectdirent direntryleft[NBRENTRIES];
sectdirent direntryright[NBRENTRIES];

#define BLOCKSIZE $100

typedef struct structBAMentry {
	unsigned char free;
	unsigned char alloc1;
	unsigned char alloc2;
	unsigned char alloc3;
	unsigned char alloc4;
	unsigned char alloc5;
} BAMentry;

typedef struct structBAM {
// struct BAM {
	unsigned char chntrack;
	unsigned char chnsector;
    unsigned char version;
	unsigned char versioninvert;
	unsigned char diskid1;
	unsigned char diskid2;
	unsigned char io;
	unsigned char autoboot;
	unsigned char dummy[8];
    BAMentry      entry[40];
} BAM;

typedef struct structdatablock {
// struct DATABLOCK {
	unsigned char chntrack;
	unsigned char chnsector;
	unsigned char data[254];
} DATABLOCK;

BAM * BAMsector[2]; // to point into the disk buffer
DATABLOCK * worksector[2]; // to point into the disk buffer
BAM * worksectorasBAM[2]; // to point into the disk buffer

/* struct MEGA65_VICIV* const VICIV = (struct MEGA65_VICIV*)0xd000;

struct BAM* const BAMsector[2] = { (struct BAM*) $4000, (struct BAM*) $4100 };
struct DATABLOCK* const worksector[2] = {
                                 (struct DATABLOCK*) $4200, (struct DATABLOCK*) $4300 };
struct BAM* const worksectorasBAM[2] = { (struct BAM*) $4200, (struct BAM*) $4300 };
*/

void _miniInit()  {
  offsCurrIdx = 0;
  flagCurrSec = 0;
  datNextTrk = 0;
  datNextSec = 0;
  datCurrTrk = 0;
  datCurrSec = 0;

/*	ptrMiniOffs[0] = 0;    // Buffered Sector Operations:
	ptrMiniOffs[1] = 0x6C;  // mega65-book.pdf#3ec
	ptrMiniOffs[2] = 0xFD;
	ptrMiniOffs[3] = 0x0F;  */
  ptrMiniOffs = SECTBUF;
  asm{
    lda #$00    // clear F011 Floppy Controller Registers
    sta $D080
  }
  printf("_miniInit 32addr is: %08x\n", ptrMiniOffs);
}

void miniSetFileName(const char* filename) {
// .A		IN	File Name Length
// .X		IN	File Name Addr Lo
// .Y		IN	File Name Addr Hi
	unsigned char l = strlen(filename);
	for (unsigned char i = 0; i < $10; i++)  {
		if (i < l)  {
			arrFileName[i] = filename[i];
		} else {
			arrFileName[i] = $A0;
		}
	}
}

void miniSetFileType(unsigned char type)  {
//	.A		IN	File Type
	datFileType = type;
}

void miniSetDriveNbr(unsigned char drive)  {
//	.A		IN	File Type
	datCurrDrv = drive;
}

unsigned char miniOpenFile()
{
// .A		IN	Handle - 0     ??
// .ST_C	OUT	Set if error
	_miniInit();
	unsigned char ret = _miniFindFile();
	printf("_miniFindFile ret=%d\n", (int) ret);
	if (ret == 0)  {
		datNextTrk = datEntryTrk;
		datNextSec = datEntrySec;
		printf("miniOpenFile after found datNextTrk %d ", (int) datNextTrk);
		printf("datNextSec %d ", (int) datNextSec);

		if (_miniReadNextSector(datCurrDrv) != 0)  return $F0;

		_miniChainSector();
	}
	printf("arrFileName %s ", arrFileName);
	return ret;
}

void miniCloseFile()  {
	_miniInit();
}

unsigned char miniReadByte()  {
// .A		OUT	Data
// .ST_C	OUT	Set if error
	if (datCurrLen == $FF)  return $FF;  // @@@@ needs be other than payload!

	unsigned char data = _miniReadByte();

	// byte read, so done:
	if (offsCurrIdx != datCurrLen)  return data;

	if (datNextTrk == 0)  {
		datCurrLen = $FF;
		return data;
	}

	if (flagCurrSec != 0 ||
		datCurrTrk != datNextTrk ||
		datCurrSec + 1 != datNextSec)  {
		// load sector:
		if (_miniReadNextSector(datCurrDrv) != 0)  return $FF;  // @@@@ needs be other than payload!

		_miniChainSector();
		return data;
	} else {
		_miniSwapSector();
		_miniChainSector();
		return data;
	}
}

unsigned char _miniReadNextSector(unsigned char drive) {
	if (datNextTrk == 0)  return $FC;
	drive += $60;   // #$60 drive 0
	asm{
		// Turn on motor + led (which causes led to light solid):
		lda	drive
		sta	$D080

		// Wait for ready:
		lda	#$20
		sta	$D081

		// Track (start at 0)
		ldx	datNextTrk
		stx	datCurrTrk
		dex
		stx	$D084

		// Sector (only side 0 ones)
		lda	datNextSec
		lsr
		sta	datCurrSec

		// Sectors start at 1
		tax
		inx

		stx	$D085
		// Side
		lda	#$00
		sta	$D086

		// Flag which side we need
		adc	#$00
		sta	flagCurrSec

		// Read
		lda	#$41
		sta	$D081

		// Wait while busy:
wait0:
		lda	$D082
		bmi	wait0

		// Check for error
		lda	$D082
		and	#$18
		beq	succeed

		// Turn on just the LED, this causes to blink
		lda	#$40
		sta	$D080

		sec
		jmp endsub

succeed:
		// Make sure we can see the data
		lda	#$80    // bit 7 as mask
		trb	$D689   // clear bit 7

		clc

		lda	#$00
		sta	offsCurrIdx

		lda	flagCurrSec
		beq	upper

		lda	#$6D
		sta	ptrMiniOffs + 1

		jmp endsub

upper:
		lda	#$6C
		sta	ptrMiniOffs + 1
		jmp endsub

endsub:
		bcs err1
		lda #$00
		jmp end1
err1:   lda #$ff
end1:   sta retval
	}
	return retval;
}

// returns 1 for odd numbered sectors, 0 for even:
unsigned char ReadSector(unsigned char drive, char track, char sector) {
	if (track == 0)  return $FC;
	drive += $60;   // #$60 drive 0
	asm{
		// Turn on motor + led (which causes led to light solid):
		lda	drive
		sta	$D080

		// Wait for ready:
		lda	#$20
		sta	$D081

		// Track (start at 0)
		ldx	track
		dex
		stx	$D084

		// Sector (only side 0 ones)
		lda	sector
		lsr

		// Sectors start at 1
		tax
		inx
		stx	$D085

		// Side
		lda	#$00
		sta	$D086

		// Flag which side we need
		adc	#$00
		sta	flagCurrSec

		// Read
		lda	#$41
		sta	$D081

		// Wait while busy:
wait0:
		lda	$D082
		bmi	wait0

		// Check for error
		lda	$D082
		and	#$18
		beq	succeed

		// Turn on just the LED, this causes to blink
		lda	#$40
		sta	$D080

		sec
		jmp endsub

succeed:
		// Make sure we can see the data
		lda	#$80    // bit 7 as mask
		trb	$D689   // clear bit 7

		clc

		lda	#$00
		sta	offsCurrIdx

		lda	flagCurrSec
		beq	upper

		lda	#$6D
		sta	ptrMiniOffs + 1

		jmp endsub

upper:
		lda	#$6C
		sta	ptrMiniOffs + 1
		jmp endsub

endsub:
		bcs err1
		lda flagCurrSec
		jmp end1
err1:   lda #$ff
end1:   sta retval
	}
	return retval;
}

// both physical sectors are written:
unsigned char WriteSector(unsigned char drive, char track, char sector) {
	drive += $60;   // #$60 drive 0
	char side = 0;
	if (sector >= 20)  {
		drive += $08; // second side of disk
		side = 1;
	}
	asm(clobbers "AX") {
		// Turn on motor + led (which causes led to light solid):
		lda	drive
		sta	$D080

		// Wait for ready:
		lda	#$20
		sta	$D081

		// Track (start at 0)
		ldx	track
		dex
		stx	$D084

		// Sector (only side 0 ones)
		lda	sector
        tya
		lsr

		// Sectors start at 1   mega65-book.pdf#3f0
		tax
		inx
		stx	$D085

		// Side
		lda	#$00   // side
		sta	$D086

		// Flag which side we need
		adc	#$00
		sta	flagCurrSec

		// Write
		lda	#$84
		sta	$D081

		// Wait while busy:
wait0:
		lda	$D082
		bmi	wait0

		// Check for error
		lda	$D082
		and	#$18
		beq	succeed

		// Turn on just the LED, this causes to blink
		lda	#$40
		sta	$D080

		sec
		jmp endsub

succeed:
		// Make sure we can see the data
		lda	#$80    // bit 7 as mask
		trb	$D689   // clear bit 7

		clc

endsub:
		bcs err1
		lda #$00
		jmp end1
err1:   lda #$ff
end1:   sta retval
	}
	return retval;
}

void _miniSwapSector()  {
//	ptrMiniOffs[1] = $6D;
	ptrMiniOffs = SECTBUFUPPER;
	offsCurrIdx = 0;
	flagCurrSec = $01;
}

void _miniChainSector()  {
	datNextTrk = _miniReadByte();
	if (datNextTrk == $00)  {
		datNextSec = 0;
		datCurrLen = _miniReadByte() + 1;
	} else {
		datNextSec = _miniReadByte();
		datCurrLen = 0;
	}
}

unsigned char _miniReadByte()  {
//	unsigned char const * p = (unsigned char *) &(ptrMiniOffs + offsCurrIdx);
//	offsCurrIdx++;
//	return *p;
	asm{
		ldz	offsCurrIdx

		nop     // initiates 32-bit Base-Page Indirect Z-Indexed Mode
				// mega65-book.pdf#259
		lda	(ptrMiniOffs), z
		sta retval
	}
	offsCurrIdx++;
	return retval;
}

void FillBuffer()  {
  volatile char register(Z) i;

  for (i=0; i < $FF; i++)  {
	asm(clobbers "A") {  // there's no clobbers for Z
//		phz
//		phy // ldz i
//		plz
		tza

		nop     // initiates 32-bit Base-Page Indirect Z-Indexed Mode
				// mega65-book.pdf#259
		sta	(ptrMiniOffs), z
//		stz $0800
//		plz
	}
  }
}

void _miniGetFileEntry(sectdirent * entry)  {
	unsigned char * p = (unsigned char *) entry;

	for (unsigned char i=0; i < ENTRYSIZE; i++)  {
		p[i] = _miniReadByte();
	}
}

/* --------- old -----------
void GetWholeSector(BAM * entry)  {
	unsigned char * p = (unsigned char *) entry;

	for (unsigned int i=0; i < BLOCKSIZE; i++)  {
		p[i] = _miniReadByte();
	}
}  */

// depending on the sector's side this returns the wanted
// sector in the regular or upper 256 bytes of the 512
// bytes buffer:
unsigned char GetWholeSector(/*struct*/ BAM* entry, unsigned char drive,
                             char track, char sector)  {
  unsigned char * p = (unsigned char *) entry;
  unsigned int i;

  unsigned char side = ReadSector(drive, track, sector);

  if (side > 1)  return side;
  ptrMiniOffs = SECTBUF;
  for (i=0; i < BLOCKSIZE; i++)  {
	asm(clobbers "A") {
		ldz	i

		nop     // initiates 32-bit Base-Page Indirect Z-Indexed Mode
				// mega65-book.pdf#259
		lda	(ptrMiniOffs), z
		sta retval
	}
	p[i] = retval;
  }

  ptrMiniOffs = SECTBUFUPPER;
  for (i=0; i < BLOCKSIZE; i++)  {
	asm(clobbers "A") {
		ldz	i

		nop     // initiates 32-bit Base-Page Indirect Z-Indexed Mode
				// mega65-book.pdf#259
		lda	(ptrMiniOffs), z
		sta retval
	}
	p[i + BLOCKSIZE] = retval;
//	DEFAULT_SCREEN[i] = retval;
  }
  return side;
}
unsigned char PutWholeSector(/*struct*/ BAM* entry, unsigned char side,
                    unsigned char drive, char track, char sector)  {
  unsigned char * p = (unsigned char *) entry;
  unsigned int i;

  if (side > 1)  return side;
  ptrMiniOffs = SECTBUF;
  for (i=0; i < BLOCKSIZE; i++)  {
	retval = p[i];   // is no return value here
	asm(clobbers "A") {
		ldz	i
		lda retval
		nop     // initiates 32-bit Base-Page Indirect Z-Indexed Mode
				// mega65-book.pdf#259
		sta	(ptrMiniOffs), z
	}
  }

  ptrMiniOffs = SECTBUFUPPER;
  for (i=0; i < BLOCKSIZE; i++)  {
	retval = p[i + BLOCKSIZE];
	asm(clobbers "A") {
		ldz	i
		lda retval
		nop     // initiates 32-bit Base-Page Indirect Z-Indexed Mode
				// mega65-book.pdf#259
		sta	(ptrMiniOffs), z
	}
  }

  return WriteSector(drive, track, sector - side);
}

unsigned char driveled(unsigned char errorcode)  {
	// Turn on just the LED, this causes it to blink:
	asm{
		lda	#$40
		sta	$D080
	}
	return errorcode;
}

unsigned char _miniFindFile()  {
	unsigned char i;

	// open dir:
	datNextTrk = $28;  // track 40 for .d81
	datNextSec = $00;
		printf("_miniFindFile start datNextTrk %d  ", (int) datNextTrk);
		printf("datNextSec %d\n", (int) datNextSec);

	if (_miniReadNextSector(datCurrDrv) != 0)  return driveled($FE);

	datNextTrk = _miniReadByte();
	datNextSec = _miniReadByte();
		for (i = 0; i < 10; i++)  {
			printf("%c", _miniReadByte());
		}
		printf("\n");
		printf("after readbyte datNextTrk %d  ", (int) datNextTrk);
		printf("datNextSec %d\n", (int) datNextSec);

	// FINDNEXTDIRTRK
	unsigned char e = 0; // populate array of entries
	do {
		// Get directory list sector:
		if (_miniReadNextSector(datCurrDrv) != 0)  return driveled($FD);
		datNextTrk = $00;
		datNextSec = $00;
		datEntryCntr = $00;

		do {
			if (datCurrSide == LEFTSIDE)  {
			  direntry = &direntryleft[e];
			} else  {
			  direntry = &direntryright[e];
			}
			// READDIR
			_miniGetFileEntry(direntry);

			if (direntry->track == 0)    return 0; // done  driveled($FC);

			// direntry = (sectdirent *) &arrEntryBuf;
				printf("_miniFindFile _miniGetFileEntry: "); // %s ", &arrEntryBuf[5]);
				printf("direntry is: %04x ", (unsigned int) direntry);
				printf("name %s ", direntry->name);
				printf("drv %d ", (int) datCurrDrv);
				printf("chntrk %d ", (int) direntry->chntrack);
				printf("chnsect %u ", direntry->chnsector);
				printf("type %u ", direntry->type);
				printf("trk %u ", direntry->track);
				printf("sect %u ", direntry->sector);
				printf("size %d\n", (int) direntry->size);

			if (direntry->chntrack > 0)  {
			  datNextTrk = direntry->chntrack;  // chained directory sectors
			  datNextSec = direntry->chnsector;
			}
			datEntryType = direntry->type;
			datEntryTrk = direntry->track;
			datEntrySec = direntry->sector;

			if (strcmp(direntry->name, arrFileName) == 0)  {
				printf(" found!\n");
			}
/*
			unsigned char y = $00;
			if (arrEntryBuf[y] > 0)  datNextTrk = arrEntryBuf[y];
			y++;
			if (arrEntryBuf[y] > 0)  datNextSec = arrEntryBuf[y];
			y++;
			datEntryType = arrEntryBuf[y];
			y++;

			// File track/sector:
			if (arrEntryBuf[y] == 0)    return driveled($FC);
			datEntryTrk = arrEntryBuf[y];
			y++;
			datEntrySec = arrEntryBuf[y];
			y++;

//			if ((datEntryType & $0F) == datFileType)  {
				// File name:
				for (unsigned char x = 0; x < $10; x++, y++)  {
					if (arrEntryBuf[y] != arrFileName[x])  {
						break;
					}
				}
				return 0;  // found!
//			}
*/
			datEntryCntr++;
			e++;
		} while (datEntryCntr < $08); // eight entries per sector
		unsigned char keycode;
		while(! (keycode=waitforkeyandletgo())) {}
	} while (datNextTrk != 0);
	return driveled($FC);
}

// this expects data in sector buffer:
void BAMSectorUpdate(/*struct*/ BAM* BAMsector, char track, char sector, char set) {
  unsigned char bitshifter = 1;

//  BAMsector += $100;  // @@@@@ dirty test
//  printf("BAMSectorUpdate BAMsector is: %08x\n", (unsigned long) BAMsector);

  track--;  // access array zero based
  if (set)  {  // if set clear alloc bit below to allocate:
    if (sector < 8)  {
	  BAMsector->entry[track].alloc1 &= ~(bitshifter << sector);
    }
    else if (sector < 16)  {
	  BAMsector->entry[track].alloc2 &= ~(bitshifter << (sector - 8));
    }
    else if (sector < 24)  {
	  BAMsector->entry[track].alloc3 &= ~(bitshifter << (sector - 16));
    }
    else if (sector < 32)  {
	  BAMsector->entry[track].alloc4 &= ~(bitshifter << (sector - 24));
    }
    else  {
	  BAMsector->entry[track].alloc5 &= ~(bitshifter << (sector - 32));
    }
    BAMsector->entry[track].free--;
  }
  else  {
    if (sector < 8)  {
	  BAMsector->entry[track].alloc1 |= (bitshifter << sector);
    }
    else if (sector < 16)  {
	  BAMsector->entry[track].alloc2 |= (bitshifter << (sector - 8));
    }
    else if (sector < 24)  {
	  BAMsector->entry[track].alloc3 |= (bitshifter << (sector - 16));
    }
    else if (sector < 32)  {
	  BAMsector->entry[track].alloc4 |= (bitshifter << (sector - 24));
    }
    else  {
	  BAMsector->entry[track].alloc5 |= (bitshifter << (sector - 32));
    }
    BAMsector->entry[track].free++;
  }
}

void testfillsector()  {
  _miniInit();
  datNextTrk = 0;
  datNextSec = 1;
  _miniReadNextSector(0); // drive
  FillBuffer();
  //           drive track sector:
  WriteSector(0, 22, 22);
}

#ifdef shgdjhsgdhjgds
void testbam()  {
/*
  asm{
	// map 0xFFD6C00 to $DE00 – $DFFF
	lda	$81
	sta	$D680 // SD command register
  }
*/
  // memoryRemap256M(MEMORYBLOCK_4000, 0xFFD6C, 0); // omit last two 00
  BAMsector = (BAM*) $4000;
  _miniInit();
  datNextTrk = 40;
  datNextSec = 1;  // BAM
  _miniReadNextSector(0); // drive

  GetWholeSector(BAMsector);
  BAMsector->entry[2].free=$AA;
  BAMsector->entry[2].alloc1= $BB;
  BAMsector->entry[2].alloc2= $CC;
  BAMsector->entry[2].alloc3= $DD;
  BAMsector->entry[2].alloc4= $EE;
  BAMsector->entry[2].alloc5= $55;
  printf("testbam: %04x %04x %04x %04x\n", (unsigned int) PEEK($4000),
		 PEEK($4001), PEEK($4002), PEEK($4003));
  printf("entry: %04x %04x %04x %04x\n", (unsigned int) PEEK($4016),
		 PEEK($4017), PEEK($4018), PEEK($4019));
  PutWholeSector(BAMsector);
//  BAMsector-->entry[22 - 1].alloc[4] = $FF;
  //           drive track sector:
  WriteSector(0, datNextTrk, datNextSec);
//  memoryRemap256M(0, 0, 0);
  printf("bamtest done.\n\n");
}
#endif

#define BAMTRACK 40
#define BAMSECT   1
#define DRIVE     0
unsigned char workside;
unsigned char i;

void testsectors()  {
  BAMsector[0] = (BAM*) $4000;
  BAMsector[1] = (BAM*) $4100;
  worksector[0] = (DATABLOCK*) $4200;
  worksector[1] = (DATABLOCK*) $4300;
  worksectorasBAM[0] = (BAM*) $4200;
  worksectorasBAM[1] = (BAM*) $4300;
  _miniInit();
//  datNextTrk = BAMTRACK;
//  datNextSec = BAMSECT;
//  _miniReadNextSector(DRIVE); // drive
  unsigned char BAMside = GetWholeSector(BAMsector[0], DRIVE, BAMTRACK, BAMSECT);
  datNextTrk = 2;
  for (i = 0; i < 40         -         2  ; i++)  {
	datNextSec = i;
//	_miniReadNextSector(DRIVE); // drive
	workside = GetWholeSector(worksectorasBAM[0], DRIVE, datNextTrk, datNextSec);
	/*struct*/ DATABLOCK* ws = worksector[workside];
	ws->chntrack = datNextTrk;
	ws->chnsector = datNextSec + 1;
	ws->data[0] = datNextTrk;
	ws->data[1] = datNextSec + 1;
	ws->data[252]=$EE; // test highest byte
	ws->data[253]=$AA; // test highest byte
	BAMSectorUpdate(BAMsector[BAMside], datNextTrk, i, 1); // 1=allocate
	printf("testsectors: sector %d  workside %d ",
           (int) i, (int) workside);
	printf("bytes %02x %02x %02x %02x\n", PEEK($4100),
		 PEEK($4101), PEEK($41FE), PEEK($41FF));

	printf("testsectors: %04x %04x %04x %04x\n", (unsigned int) PEEK($4000),
		 PEEK($4001), PEEK($4002), PEEK($4003));
//	printf("entry: %04x %04x %04x %04x\n", (unsigned int) PEEK($4016),
//		 PEEK($4017), PEEK($4018), PEEK($4019));
	PutWholeSector(worksectorasBAM[0], workside, DRIVE, datNextTrk, datNextSec);
	//           drive track sector:
//	WriteSector(DRIVE, datNextTrk, datNextSec);
  }
  PutWholeSector(BAMsector[0], BAMside, DRIVE, BAMTRACK, BAMSECT);
//  WriteSector(DRIVE, BAMTRACK, BAMSECT);
  printf("testsectors done, datNextTrk %d  datNextSec %d, BAMside %d\n\n",
         (int) datNextTrk, (int) datNextSec, (int) BAMside);
}

/* todo
- reading the last sector 39 results in side 1 and an invalid next track
- two for loops need their loop variable declared beforehand
*/
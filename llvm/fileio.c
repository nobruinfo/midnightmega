#include <string.h>
#include <stdint.h>
#include <mega65/conio.h>  // llvm instead of <printf.h>
#include <mega65/memory.h>  // mega65-libc
#include "regions.h"
#include "fileio.h"
#include "conioextensions.h"

// Gibt es im Basic eine Möglichkeit festzustellen um was für
// ein Laufwerk es sich bei U8 oder U9 handelt, also ob es das
// interne oder ein .d81 Image ist ?
// gardners: Du könntest $D6A9 peeken und die Bits daraus lesen

// static unsigned char __attribute__((used)) retval;

// unsigned char ptrMiniOffs = $DE;
// #pragma bss-name (push, "ZEROPAGE")
// /* volatile __zp */ unsigned long ptrMiniOffs;
// #pragma bss-name (pop)
// unsigned char * ptrMiniOffs = 0xFFD6C00; the address region is given
#define SECTBUF      0xFFD6C00
#define SECTBUFUPPER 0xFFD6D00

unsigned char __attribute__((used)) offsCurrIdx = 0;
unsigned char __attribute__((used)) flagCurrSec = 0;
// #pragma bss-name (push, "ZEROPAGE")
// for zp global vars use: unsigned char var = 0;
// #pragma bss-name (pop)

BAM * BAMsector[2]; // to point into the disk buffer
DATABLOCK * worksector[2]; // to point into the disk buffer
BAM * worksectorasBAM[2]; // to point into the disk buffer

DIRENT direntryleft[NBRENTRIES];
DIRENT direntryright[NBRENTRIES];
SECTDIRENT * direntryblock[2];

unsigned char workside;
unsigned char BAMside;
unsigned char direntside;

unsigned char dosfilename[DOSFILENAMELEN + 1]; // extra byte for nullterm

void _miniInit()  {
  BAMsector[0] = (BAM*) BLOCKBAMLOW;
  BAMsector[1] = (BAM*) BLOCKBAMHIGH;
  worksector[0] = (DATABLOCK*) BLOCKDATALOW;      // to access as data
  worksector[1] = (DATABLOCK*) BLOCKDATAHIGH;
  worksectorasBAM[0] = (BAM*) BLOCKDATALOW;       // to transfer as fake BAM struct
  worksectorasBAM[1] = (BAM*) BLOCKDATAHIGH;
  direntryblock[0] = (SECTDIRENT*) DIRENTPAGELOW; // eight entries per single block
  direntryblock[1] = (SECTDIRENT*) DIRENTPAGEHIGH;

  offsCurrIdx = 0;
  flagCurrSec = 0;

/*	ptrMiniOffs[0] = 0;    // Buffered Sector Operations:
	ptrMiniOffs[1] = 0x6C;  // mega65-book.pdf#3ec
	ptrMiniOffs[2] = 0xFD;
	ptrMiniOffs[3] = 0x0F;  */
  asm volatile(
    "lda #$00\n"    // clear F011 Floppy Controller Registers
    "sta $D080\n"
  );
  mh4printfd("_miniinit SECTBUF 32addr is: ", SECTBUF >> 16);
  mh4printfd(" ", SECTBUF & 0xffff);
  cputlnd();
}

// returns 1 for odd numbered sectors, 0 for even:
unsigned char ReadSector(unsigned char drive, char track,
                                              char sector) {
	unsigned char retval;

	if (track == 0)  return 0xFC;
	drive += 0x60;   // #$60 drive 0
    mprintfd("Begin ReadSector t=", track);
    mprintfd(" s=", sector);
	asm volatile(
		// Turn on motor + led (which causes led to light solid):
//		"lda	drive\n"
		"sta	$D080\n"

		// Wait for ready:
		"lda	#$20\n"
		"sta	$D081\n"

		// Track (start at 0)
//		"ldx	track\n"
		"dex\n"
		"stx	$D084\n"

		// Sector (only side 0 ones)
//		"lda	sector\n"
		"tya\n"
		"lsr\n"

		// Sectors start at 1
		"tax\n"
		"inx\n"
		"stx	$D085\n"

		// Side
		"lda	#$00\n"
		"sta	$D086\n"

		// Flag which side we need
		"adc	#$00\n"
		"sta	flagCurrSec\n"

		// Read
		"lda	#$41\n"
		"sta	$D081\n"

		// Wait while busy:
"wait02%=:\n"
		"lda	$D082\n"
		"bmi	wait02%=\n"

		// Check for error
		"lda	$D082\n"
		"and	#$18\n"
		"beq	succeed02%=\n"

		// Turn on just the LED, this causes to blink
		"lda	#$40\n"
		"sta	$D080\n"

		"sec\n"
		"jmp endsub02%=\n"

"succeed02%=:\n"
		// Make sure we can see the data
		"lda	#$80\n"    // bit 7 as mask
		"trb	$D689\n"   // clear bit 7

		"clc\n"

		"lda	#$00\n"
		"sta	offsCurrIdx\n"

		"lda	flagCurrSec\n"
		"beq	upper02%=\n"

//		"lda	#$6D\n"
//		"sta	ptrMiniOffs + 1\n"

		"jmp endsub02%=\n"

"upper02%=:\n"
//		"lda	#$6C\n"
//		"sta	ptrMiniOffs + 1\n"
		"jmp endsub02%=\n"

"endsub02%=:\n"
		"bcs err02%=\n"
		"lda flagCurrSec\n"
		"jmp end02%=\n"
"err02%=:   lda #$ff\n"
"end02%=:   sta %0\n"
	: "=r"(retval) :"a"(drive),"x"(track),"y"(sector):);
	return retval;
}

// both physical sectors are written:
unsigned char WriteSector(unsigned char drive, char track,
                                               char sector) {
	unsigned char retval;

	drive += 0x60;   // #$60 drive 0
	char side = 0;
	if (sector >= 20)  {
		drive += 0x08; // second side of disk
		side = 1;
	}
    asm volatile(
		// Turn on motor + led (which causes led to light solid):
//		"lda	drive\n"
		"sta	$D080\n"

		// Wait for ready:
		"lda	#$20\n"
		"sta	$D081\n"

		// Track (start at 0)
//		"ldx	track\n"
		"dex\n"
		"stx	$D084\n"

		// Sector (only side 0 ones)
//		"lda	sector\n"
		"tya\n"
		"lsr\n"

		// Sectors start at 1   mega65-book.pdf#3f0
		"tax\n"
		"inx\n"
		"stx	$D085\n"

		// Side
		"lda	#$00\n"   // side
		"sta	$D086\n"

		// Flag which side we need
		"adc	#$00\n"
		"sta	flagCurrSec\n"

		// Write
		"lda	#$84\n"
		"sta	$D081\n"

		// Wait while busy:
"wait03%=:\n"
		"lda	$D082\n"
		"bmi	wait03%=\n"

		// Check for error
		"lda	$D082\n"
		"and	#$18\n"
		"beq	succeed03%=\n"

		// Turn on just the LED, this causes to blink
		"lda	#$40\n"
		"sta	$D080\n"

		"sec\n"
		"jmp endsub03%=\n"

"succeed03%=:\n"
		// Make sure we can see the data
		"lda	#$80\n"    // bit 7 as mask
		"trb	$D689\n"   // clear bit 7

		"clc\n"

"endsub03%=:\n"
		"bcs err03%=\n"
		"lda #$00\n"
		"jmp end03%=\n"
"err03%=:   lda #$ff\n"
"end03%=:   sta %0\n"
	: "=r"(retval) :"a"(drive),"x"(track),"y"(sector):"a","x");
	return retval;
}

// depending on the sector's side this returns the wanted
// sector in the regular or upper 256 bytes of the 512
// bytes buffer:
unsigned char GetWholeSector(BAM* entry, unsigned char drive,
                             char track, char sector)  {
  BAM* ws = entry;   // later to be DATABLOCK*
  unsigned char side;
#ifdef DEBUG
  mprintf("GetWholeSector before ReadSector. Track=", track);
  mprintf(" Sector=", sector);
  mh4printf(" p=", (long) p);
  cputln();
  cgetc();
#endif
  side = ReadSector(drive, track, sector);

  if (side > 1)  return side;
  lcopy(SECTBUF,      (uint32_t) ws,             BLOCKSIZE);
  lcopy(SECTBUFUPPER, (uint32_t) ws + BLOCKSIZE, BLOCKSIZE);
#ifdef DEBUG
  mprintf("GetWholeSector done. side=", side);
  cputln();
  cgetc();
#endif
  return side;
}
unsigned char PutWholeSector(/*struct*/ BAM* entry, unsigned char side,
                    unsigned char drive, char track, char sector)  {
  BAM* ws = entry;   // later to be DATABLOCK*

  if (side > 1)  return side;
  
  // Now first read the state from the disk, because only one of
  // the two logical sectors will be overwritten:
  ReadSector(drive, track, sector);
  
  if (side == 0)  {
//  clrhome();
    mprintfd("PutWholeSector before lower buffer. Track=", track);
    mprintfd(" Sector=", sector);
    cputlnd();
    cgetcd();
    lcopy((uint32_t) ws, SECTBUF, BLOCKSIZE);
  } else {
    clrhome();
    mprintfd("PutWholeSector before upper buffer. Track=", track);
    mprintfd(" Sector=", sector);
    cputlnd();
    lcopy((uint32_t) ws, SECTBUFUPPER, BLOCKSIZE);
  }
  msprintfd("PutWholeSector done. Returning while WriteSector.");
  cgetcd();
  return WriteSector(drive, track, sector - side);
}

unsigned char driveled(unsigned char errorcode)  {
	// Turn on just the LED, this causes it to blink:
    asm volatile(
		"lda	#$40\n"
		"sta	$D080\n");
	return errorcode;
}

// this expects data in sector buffer:
void BAMSectorUpdate(/*struct*/ BAM* BAMsector, char track, char sector, char set) {
  unsigned char bitshifter = 1;

//  BAMsector += $100;  // @@@@@ dirty test
//  printf("BAMSectorUpdate BAMsector is: %lx\n", (unsigned long) BAMsector);

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

void testsectors(unsigned char track, unsigned char sector)  {
  unsigned char i;
// lfill(BLOCKBAMLOW, 0xaa, 4 * 0x100);
  _miniInit();
//  track = BAMTRACK;
//  sector = BAMSECT;
//  _miniReadNextSector(DRIVE); // drive
  direntside = GetWholeSector((BAM *) direntryblock[0], DRIVE, DIRENTTRACK, DIRENTSECT);
  SECTDIRENT* ds = direntryblock[direntside];
  for (i = 0; i < ENTRIESPERBLOCK; i++)  {
	if (ds->entry[i].track > 0)  {
		mprintf("direntry ", i);
		mh4printf(" is: ", (long) &ds->entry[i]);
		memcpy(dosfilename, ds->entry[i].name, DOSFILENAMELEN);
		dosfilename[DOSFILENAMELEN] = 0; // proper null termination
		msprintf(" name "); msprintf((char *) dosfilename);
		mprintf(" chntrk ", ds->entry[i].chntrack);
		mprintf(" chnsect ", ds->entry[i].chnsector);
		mhprintf(" type ", ds->entry[i].type);
		mprintf(" trk ", ds->entry[i].track);
		mprintf(" sect ", ds->entry[i].sector);
		mprintf(" size ", ds->entry[i].size);
		mhprintf(" access ", ds->entry[i].access);
		cputln();
		cgetc();
	}
  }
  msprintf("Dirlist done.");
  cgetc();
  
  clrhomed();
  msprintfd("Before GetWholeSector.");
  cgetcd();
  BAMside = GetWholeSector(BAMsector[0], DRIVE, BAMTRACK, BAMSECT);
  msprintfd("GetWholeSector done.");
//  for (i = 0; i < 40; i++)  {
//	_miniReadNextSector(DRIVE); // drive
    clrhomed();
	msprintfd("Begin GetWholeSector worksectorasBAM. ");
	workside = GetWholeSector(worksectorasBAM[0], DRIVE, track, sector);
    msprintfd("worksectorasBAM done.");
	cputlnd();
	DATABLOCK* ws = worksector[workside];
	ws->chntrack = track;
	ws->chnsector = sector + 1;
	ws->data[0] = track;
	ws->data[1] = sector + 1;
	ws->data[252]=0xEE; // test highest byte
	ws->data[253]=0xAA; // test highest byte
    mprintfd("track: ", track);
    mprintfd(" ws->data[1]: ", ws->data[1]);
	cputlnd();
	cgetcd();
	BAMSectorUpdate(BAMsector[BAMside], track, i, 1); // 1=allocate
	// printf("testsectors: sector %d  workside %d ",
    //        (int) i, (int) workside);
    msprintfd("BAMSectorUpdate done.");
	cputlnd();
    mprintfd("testsectors: sector ", i);
    mprintfd(" workside ", workside);
	// printf("bytes %02x %02x %02x %02x\n", PEEK(0x4100),
	//  	 PEEK(0x4101), PEEK(0x41FE), PEEK(0x41FF));
    mhprintfd(" bytes ", PEEK(BLOCKBAMHIGH));
    mhprintfd(" ",    PEEK(BLOCKBAMHIGH + 1));
    mhprintfd(" ",    PEEK(BLOCKBAMHIGH + 0xFE));
    mhprintfd(" ",    PEEK(BLOCKBAMHIGH + 0xFF));
	cputlnd();
	cgetcd();

	// printf("testsectors: %04x %04x %04x %04x\n", (unsigned int) PEEK(0x4000),
	//  	 PEEK(0x4001), PEEK(0x4002), PEEK(0x4003));
    mhprintfd(" testsectors: ", PEEK(BLOCKBAMLOW));
    mhprintfd(" ",    PEEK(BLOCKBAMLOW + 1));
    mhprintfd(" ",    PEEK(BLOCKBAMLOW + 2));
    mhprintfd(" ",    PEEK(BLOCKBAMLOW + 3));
	cputlnd();
	cgetcd();
//	printf("entry: %04x %04x %04x %04x\n", (unsigned int) PEEK($4016),
//		 PEEK($4017), PEEK($4018), PEEK($4019));
	PutWholeSector(worksectorasBAM[workside], workside, DRIVE, track, sector);
    msprintfd("PutWholeSector done.");
	cputlnd();
	cgetcd();
	//           drive track sector:
//	WriteSector(DRIVE, track, sector);
//  }
  PutWholeSector(BAMsector[BAMside], BAMside, DRIVE, BAMTRACK, BAMSECT);
//  WriteSector(DRIVE, BAMTRACK, BAMSECT);
  // printf("testsectors done, track %d  sector %d, BAMside %d\n\n",
  //       (int) track, (int) sector, (int) BAMside);
  mprintfd("testsectors done, track ", track);
  mprintfd(" sector ", sector);
  mprintfd(" BAMside ", BAMside);
  cputlnd();
  cgetcd();
}

void readblockchain(uint32_t destination_address, // attic RAM
                    unsigned char maxblocks,
                    unsigned char track, unsigned char sector)  {
  unsigned char i;
  unsigned char nexttrack;
  unsigned char nextsector;

  _miniInit();
  nexttrack = track;
  nextsector = sector;

		mprintf("nexttrack ", nexttrack);
		mprintf(" nextsector ", nextsector);
		cputln();

  for (i = 0; i < maxblocks; i++)  {
    workside = GetWholeSector(worksectorasBAM[0], DRIVE, nexttrack, nextsector);
    DATABLOCK* ws = worksector[workside];
	nexttrack = ws->chntrack;
	nextsector = ws->chnsector;
#ifdef DEBUG
		mprintf("nexttrack ", nexttrack);
		mprintf(" nextsector ", nextsector);
		mprintf(" workside ", workside);
		mprintf(" block ", i);
		mh4printf(" is: ", (long) &ws);
		mh4printf(" worksector[workside]: ", (long) worksector[workside]);
		cputln();
#endif
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy((uint32_t) ws, destination_address + i * BLOCKSIZE, BLOCKSIZE);
	
	if (nexttrack == 0)  break;
  }
  
  if (nexttrack > 0)  {
	messagebox("number of sectors too big");
	cgetc();
  }
}

void findnextBAMtracksector(unsigned char * nexttrack, unsigned char * nextsector)  {
  unsigned char bitshifter = 1;
  unsigned char track;
  unsigned char sector;
  unsigned char done = 0;
  BAM* bs;

  _miniInit();
  BAMside = GetWholeSector(BAMsector[0], DRIVE, BAMTRACK, BAMSECT);
  bs = BAMsector[BAMside];

  // access track array zero based
  for (track = 0; track <= 39; track++)  {
    for (sector = 0; sector <= 39; sector++)  {
      if (sector < 8)  {
        if (bs->entry[track].alloc1 & (bitshifter << sector))  {
          done = 1;

		gotoxy(42, 7);
		mprintf("t=", track);
		mprintf(" s=", sector);
		mprintf(" nt=", bs->chntrack);
		mprintf(" ns=", bs->chnsector);
		mprintf(" a1=", bs->entry[track].alloc1);
		cgetc();

          break;
        }
      }
      else if (sector < 16)  {
        if (bs->entry[track].alloc2 & (bitshifter << (sector - 8)))  {
          done = 1;

		gotoxy(42, 8);
		mprintf("t=", track);
		mprintf(" s=", sector);
		mprintf(" nt=", bs->chntrack);
		mprintf(" ns=", bs->chnsector);
		cgetc();

          break;
        }
      }
      else if (sector < 24)  {
        if (bs->entry[track].alloc3 & (bitshifter << (sector - 16)))  {
          done = 1;

		gotoxy(42, 9);
		mprintf("t=", track);
		mprintf(" s=", sector);
		mprintf(" nt=", bs->chntrack);
		mprintf(" ns=", bs->chnsector);
		cgetc();

          break;
        }
      }
      else if (sector < 32)  {
        if (bs->entry[track].alloc4 & (bitshifter << (sector - 24)))  {
          done = 1;

		gotoxy(42, 10);
		mprintf("t=", track);
		mprintf(" s=", sector);
		mprintf(" nt=", bs->chntrack);
		mprintf(" ns=", bs->chnsector);
		cgetc();

          break;
        }
      }
      else  {
        if (bs->entry[track].alloc5 & (bitshifter << (sector - 32)))  {
          done = 1;

		gotoxy(42, 11);
		mprintf("t=", track);
		mprintf(" s=", sector);
		mprintf(" nt=", bs->chntrack);
		mprintf(" ns=", bs->chnsector);
		cgetc();

          break;
        }
      }
      if (done)  break;
    }
	if (done)  break;
  }
  track++;  // access array zero based, but tracks are 1..80

  if (done)  {
    BAMSectorUpdate(BAMsector[BAMside], track, sector, 1); // 1=allocate
    PutWholeSector(BAMsector[BAMside], BAMside, DRIVE, BAMTRACK, BAMSECT);
  
    // return values:
    *nexttrack  = track;
    *nextsector = sector;
  } else {
    *nexttrack  = 0xff;
    *nextsector = 0;
  }
}

void writeblockchain(uint32_t source_address, // attic RAM
                    unsigned char maxblocks,
                    unsigned char track, unsigned char sector)  {
  unsigned char i;
  unsigned char nexttrack;
  unsigned char nextsector;

  _miniInit();
  nexttrack = track;
  nextsector = sector;
  DATABLOCK* ws = worksector[workside];
  
  for (i = 0; i < maxblocks; i++)  {
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy(source_address + i * BLOCKSIZE, (uint32_t) ws, BLOCKSIZE);

	nexttrack = ws->chntrack;
	nextsector = ws->chnsector;
#ifdef DEBUG
		mprintf("nexttrack ", nexttrack);
		mprintf(" nextsector ", nextsector);
		mprintf(" workside ", workside);
		mprintf(" block ", i);
		mh4printf(" is: ", (long) &ws);
		mh4printf(" worksector[workside]: ", (long) worksector[workside]);
		cputln();
#endif

	PutWholeSector(worksectorasBAM[0], 0, DRIVE, nexttrack, nextsector);
	
	if (nexttrack == 0)  break;
  }
  
  if (nexttrack > 0)  {
	messagebox("number of sectors too big");
	cgetc();
  }
}

DIRENT* getdirententry(unsigned char entry)  {
  unsigned char i;
  DIRENT* ds;
  unsigned int max = ENTRIESPERBLOCK;

  _miniInit();
  ds = (DIRENT *) direntryblock[0]; // to be changed to smaller array

  for (i = 0; i < max; i++)  {
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy(ATTICDIRENTBUFFER + i * DIRENTSIZE, (uint32_t) ds, DIRENTSIZE);

	if (ds->track == 0)  return NULL; // no more entries
	if (ds->chntrack > 0)  max += ENTRIESPERBLOCK; // more attic pages
	if (i == entry)  return ds; // found

#ifdef DEBUG
	if (ds->track > 0)  {
	  mprintf("direntry ", i);
	  mh4printf(" is: ", (long) &ds);
	  memcpy(dosfilename, ds->name, DOSFILENAMELEN);
	  dosfilename[DOSFILENAMELEN] = 0; // proper null termination
	  msprintf(" name ");
//		msprintf((char *) dosfilename);
	  mprintf(" chntrk ", ds->chntrack);
	  mprintf(" chnsect ", ds->chnsector);
	  mhprintf(" type ", ds->type);
	  mprintf(" trk ", ds->track);
	  mprintf(" sect ", ds->sector);
	  mprintf(" size ", ds->size);
	  mhprintf(" access ", ds->access);
	  cputln();
    }
#endif
  }
//  cgetc();
  return NULL;
}
unsigned char getdirent(void)  {
  unsigned char i;

  _miniInit();
/*
  msprintf("before readblockchain");
  cputln();
  cgetc();
*/
  readblockchain(ATTICDIRENTBUFFER, DIRENTBLOCKS, 40, 3);
/*
  msprintf("after readblockchain");
  cputln();
  cgetc();
*/
  for (i = ENTRIESPERBLOCK * DIRENTBLOCKS; i > 0; i--)  {
	if (getdirententry(i) != NULL)  return i;  // nbr of entries
  }
  return 0;
}

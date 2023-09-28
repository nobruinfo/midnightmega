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

// unsigned char __attribute__((used)) offsCurrIdx = 0;
// unsigned char __attribute__((used)) flagCurrSec = 0;
// #pragma bss-name (push, "ZEROPAGE")
// for zp global vars use: unsigned char var = 0;
// #pragma bss-name (pop)

BAM * BAMsector[2]; // to point into the disk buffer
DATABLOCK * worksector[2]; // to point into the disk buffer
BAM * worksectorasBAM[2]; // to point into the disk buffer

DIRENT direntryleft[NBRENTRIES];
DIRENT direntryright[NBRENTRIES];
SECTDIRENT * direntryblock[2];

// unsigned char workside;
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

  // clear F011 Floppy Controller Registers
  POKE(0xd080U, 0);

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
	
	// Turn on motor + led (which causes led to light solid):
	POKE(0xd080U, drive);
	// Wait for ready:
	POKE(0xd081U, 0x20);
	// Track (start at 0):
	POKE(0xd084U, track - 1);
	// Sector (only side 0 ones):
	POKE(0xd085U, sector / 2 + 1);
	// Side:
	POKE(0xd086U, 0);
	// Flag which side we need:
	retval = sector % 2;
	// Read:
	POKE(0xd081U, 0x41);
	// Wait while busy:
	while (PEEK(0xd082U) & 0x80) {}
	// Check for error:
	if (PEEK(0xd082U) & 0x18) {
      // Turn on just the LED, this causes to blink:
	  POKE(0xd080U, 0x40);
	  return 0xff;
	}
	// Make sure we can see the data, clear bit 7:
	POKE(0xd689U, PEEK(0xd689U) & ~0x80);

	return retval;
}

// both physical sectors are written:
unsigned char WriteSector(unsigned char drive, char track,
                                               char sector) {
	unsigned char retval;

	drive += 0x60;   // #$60 drive 0
	if (sector >= 20)  {
		drive += 0x08; // second side of disk
	}

	// Turn on motor + led (which causes led to light solid):
	POKE(0xd080U, drive);
	// Wait for ready:
	POKE(0xd081U, 0x20);
	// Track (start at 0):
	POKE(0xd084U, track - 1);
	// Sector (only side 0 ones):
	// Sectors start at 1   mega65-book.pdf#3f0
	POKE(0xd085U, sector / 2 + 1);
	// Side:
	POKE(0xd086U, 0);
	// Flag which side we need:
	retval = sector % 2;
	// Write:
	POKE(0xd081U, 0x84);
	// Wait while busy:
	while (PEEK(0xd082U) & 0x80) {}
	// Check for error:
	if (PEEK(0xd082U) & 0x18) {
      // Turn on just the LED, this causes to blink:
	  POKE(0xd080U, 0x40);
	  return 0xff;
	}
	// Make sure we can see the data, clear bit 7:
	POKE(0xd689U, PEEK(0xd689U) & ~0x80);

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
unsigned char GetOneSector(BAM* entry, unsigned char drive,
                             char track, char sector)  {
  BAM* ws = entry;   // later to be DATABLOCK*
  unsigned char side;
#ifdef DEBUG
  mprintf("GetOneSector before ReadSector. Track=", track);
  mprintf(" Sector=", sector);
  mh4printf(" p=", (long) p);
  cputln();
  cgetc();
#endif
  side = ReadSector(drive, track, sector);

  if (side > 1)  return side;
  if (side == 0)  lcopy(SECTBUF,      (uint32_t) ws, BLOCKSIZE);
  else            lcopy(SECTBUFUPPER, (uint32_t) ws, BLOCKSIZE);
#ifdef DEBUG
  mprintf("GetOneSector done. side=", side);
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
    clrhomed();
    mprintfd("PutWholeSector before upper buffer. Track=", track);
    mprintfd(" Sector=", sector);
    cputlnd();
    lcopy((uint32_t) ws, SECTBUFUPPER, BLOCKSIZE);
  }
  msprintfd("PutWholeSector done. Returning while WriteSector.");
  cgetcd();
  return WriteSector(drive, track, sector - side);
}
unsigned char PutOneSector(BAM* entry, unsigned char drive, 
                           char track, char sector)  {
  BAM* ws = entry;   // later to be DATABLOCK*

  unsigned char side = sector % 2;
  
  // Now first read the state from the disk, because only one of
  // the two logical sectors will be overwritten:
  ReadSector(drive, track, sector);
  
  if (side == 0)  {
//  clrhome();
    mprintfd("PutOneSector before lower buffer. Track=", track);
    mprintfd(" Sector=", sector);
    cputlnd();
    cgetcd();
    lcopy((uint32_t) ws, SECTBUF, BLOCKSIZE);
  } else {
    clrhomed();
    mprintfd("PutOneSector before upper buffer. Track=", track);
    mprintfd(" Sector=", sector);
    cputlnd();
    lcopy((uint32_t) ws, SECTBUFUPPER, BLOCKSIZE);
  }
  msprintfd("PutOneSector done. Returning while WriteSector.");
  cgetcd();
  return WriteSector(drive, track, sector - side);
}

unsigned char driveled(unsigned char errorcode)  {
	// Turn on just the LED, this causes it to blink:
    POKE(0xd080U, 0x40);
	return errorcode;
}

// this expects data in sector buffer:
void BAMSectorUpdate(BAM* BAMsector, BAM* BAMsector2, char track, char sector, char set) {
  unsigned char bitshifter = 1;

//  BAMsector += $100;  // @@@@@ dirty test
//  printf("BAMSectorUpdate BAMsector is: %lx\n", (unsigned long) BAMsector);

  // next BAM sector of two in total:
  if (track > 40)  {
    track -= 40;
	BAMsector = BAMsector2;
  }
		gotoxy(42, 20);
		mh4printf("BAMsector ", (long) BAMsector);
		cputln();
		cgetc();
  
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

void readblockchain(uint32_t destination_address, // attic RAM
                    unsigned char maxblocks, unsigned char drive,
                    unsigned char track, unsigned char sector)  {
  unsigned char i;
  unsigned char nexttrack;
  unsigned char nextsector;

  _miniInit();
  nexttrack = track;
  nextsector = sector;
#ifdef DEBUG
		mprintf("nexttrack ", nexttrack);
		mprintf(" nextsector ", nextsector);
		cputln();
#endif
  for (i = 0; i < maxblocks; i++)  {
    /* workside = */ GetOneSector(worksectorasBAM[0], drive, nexttrack, nextsector);
    DATABLOCK* ws = worksector[0];
	nexttrack = ws->chntrack;
	nextsector = ws->chnsector;
#ifdef DEBUG
		gotoxy(42, 0);
		mprintf("nexttrack ", nexttrack);
		mprintf(" nextsector ", nextsector);
//		mprintf(" workside ", workside);
		cputln();
		gotoxy(42, 1);
		mprintf(" block ", i);
		mh4printf(" is: ", (long) &ws);
		cputln();
		gotoxy(42, 2);
		mh4printf(" worksector[0]: ", (long) worksector[0]);
		cputln();
		cgetc();
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

void findnextBAMtracksector(unsigned char drive,
                            unsigned char * nexttrack, unsigned char * nextsector)  {
  unsigned char bitshifter = 1;
  unsigned char track;
  unsigned char sector;
  unsigned char done = 0;
  BAM* bs;

  _miniInit();
  /* BAMside = */ GetOneSector(BAMsector[0], drive, BAMTRACK, BAMSECT);
  bs = BAMsector[0];
  GetOneSector(BAMsector[1], drive, bs->chntrack, bs->chnsector);

  // access track array zero based
  for (track = 0; track <= 79; track++)  {
    for (sector = 0; sector <= 39; sector++)  {
      if (sector < 8)  {
        if (bs->entry[track].alloc1 & (bitshifter << sector))  {
          done = 1;
#ifdef DEBUG
		gotoxy(42, 7);
		mprintf("t=", track);
		mprintf(" s=", sector);
		mprintf(" nt=", bs->chntrack);
		mprintf(" ns=", bs->chnsector);
		mprintf(" a1=", bs->entry[track].alloc1);
		cgetc();
#endif
          break;
        }
      }
      else if (sector < 16)  {
        if (bs->entry[track].alloc2 & (bitshifter << (sector - 8)))  {
          done = 1;
#ifdef DEBUG
		gotoxy(42, 8);
		mprintf("t=", track);
		mprintf(" s=", sector);
		mprintf(" nt=", bs->chntrack);
		mprintf(" ns=", bs->chnsector);
		cgetc();
#endif
          break;
        }
      }
      else if (sector < 24)  {
        if (bs->entry[track].alloc3 & (bitshifter << (sector - 16)))  {
          done = 1;
#ifdef DEBUG
		gotoxy(42, 9);
		mprintf("t=", track);
		mprintf(" s=", sector);
		mprintf(" nt=", bs->chntrack);
		mprintf(" ns=", bs->chnsector);
		cgetc();
#endif
          break;
        }
      }
      else if (sector < 32)  {
        if (bs->entry[track].alloc4 & (bitshifter << (sector - 24)))  {
          done = 1;
#ifdef DEBUG
		gotoxy(42, 10);
		mprintf("t=", track);
		mprintf(" s=", sector);
		mprintf(" nt=", bs->chntrack);
		mprintf(" ns=", bs->chnsector);
		cgetc();
#endif
          break;
        }
      }
      else  {
        if (bs->entry[track].alloc5 & (bitshifter << (sector - 32)))  {
          done = 1;
#ifdef DEBUG
		gotoxy(42, 11);
		mprintf("t=", track);
		mprintf(" s=", sector);
		mprintf(" nt=", bs->chntrack);
		mprintf(" ns=", bs->chnsector);
		cgetc();
#endif
          break;
        }
      }
      if (done)  break;
    }
	if (done)  break;
  }
  track++;  // access array zero based, but tracks are 1..80

  if (done)  {
    BAMSectorUpdate(BAMsector[0], BAMsector[1], track, sector, 1); // 1=allocate
    PutOneSector(BAMsector[0], drive, BAMTRACK, BAMSECT);
    PutOneSector(BAMsector[1], drive, bs->chntrack, bs->chnsector);
  
    // return values:
    *nexttrack  = track;
    *nextsector = sector;
  } else {
    *nexttrack  = 0xff;
    *nextsector = 0;
  }
}

// ignores start track and sector upon call but gives them back:
void writeblockchain(uint32_t source_address, // attic RAM
                    unsigned char maxblocks, unsigned char drive,
					unsigned char * starttrack, unsigned char * startsector)  {
  unsigned char i;
  unsigned char nexttrack = 0;
  unsigned char nextsector = 0xff;
  unsigned char track;
  unsigned char sector;

  _miniInit();
  DATABLOCK* ws = worksector[0];

  // get a first sector anyway:
  findnextBAMtracksector(drive, &track, &sector);
  *starttrack = track;  // to later write dirent
  *startsector = sector;
  
  for (i = 0; i < maxblocks; i++)  {
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy(source_address + i * BLOCKSIZE, (uint32_t) ws, BLOCKSIZE);

#ifdef DEBUG
		mprintf("nexttrack ", nexttrack);
		mprintf(" nextsector ", nextsector);
//		mprintf(" workside ", workside);
		mprintf(" block ", i);
		mh4printf(" is: ", (long) &ws);
		mh4printf(" worksector[0]: ", (long) worksector[0]);
		cputln();
#endif

	// replace chain with available ones or leave 0 if last datablock:
	if (ws->chntrack > 0)  {
      findnextBAMtracksector(drive, &nexttrack, &nextsector);
      ws->chntrack = nexttrack;
      ws->chnsector = nextsector;
	}

	PutOneSector((BAM *) ws, drive, track, sector);
	if (ws->chntrack == 0)  break;
    track = nexttrack;
    sector = nextsector;
  }
  
  if (nexttrack > 0 && i >= maxblocks)  {
	messagebox("number of sectors too big");
	cgetc();
  }
}

// not physically deleting but BAM deallocating:
void deleteblockchain(unsigned char drive,
                      unsigned char track, unsigned char sector)  {
  unsigned char nexttrack;
  unsigned char nextsector;
  BAM* bs;

  _miniInit();
  /* BAMside = */ GetOneSector(BAMsector[0], drive, BAMTRACK, BAMSECT);
  bs = BAMsector[0];
  GetOneSector(BAMsector[1], drive, bs->chntrack, bs->chnsector);

  nexttrack = track;
  nextsector = sector;
#ifdef DEBUG
		mprintf("nexttrack ", nexttrack);
		mprintf(" nextsector ", nextsector);
		cputln();
#endif
  while (nexttrack > 0)  {
    /* workside = */ GetOneSector(worksectorasBAM[0], drive, nexttrack, nextsector);
    DATABLOCK* ws = worksector[0];
	BAMSectorUpdate(BAMsector[0], BAMsector[1], nexttrack, nextsector, 0); // 0=free up
//#ifdef DEBUG
		gotoxy(42, 0);
		mprintf("nexttrack ", nexttrack);
		mprintf(" nextsector ", nextsector);
//		mprintf(" workside ", workside);
		cputln();
		gotoxy(42, 1);
		mh4printf(" block is: ", (long) &ws);
		cputln();
		gotoxy(42, 2);
		mh4printf(" worksector[0]: ", (long) worksector[0]);
		cputln();
		cgetc();
//#endif
	nexttrack = ws->chntrack;
	nextsector = ws->chnsector;
  }
  PutOneSector(BAMsector[0], drive, BAMTRACK, BAMSECT);
  PutOneSector(BAMsector[1], drive, bs->chntrack, bs->chnsector);
}

unsigned char gettype(unsigned char type, unsigned char * s, unsigned char i)  {
  unsigned char t = (unsigned char) (type & 0xf);

  switch (t) { // (type & 0xf) {
    case VAL_DOSFTYPE_SEQ:
	  s[i++] = 'S';
	  s[i++] = 'E';
	  s[i++] = 'Q';
    break;
    case VAL_DOSFTYPE_PRG:
	  s[i++] = 'P';
	  s[i++] = 'R';
	  s[i++] = 'G';
    break;
    case VAL_DOSFTYPE_USR:
	  s[i++] = 'U';
	  s[i++] = 'S';
	  s[i++] = 'R';
    break;
    case VAL_DOSFTYPE_REL:
	  s[i++] = 'R';
	  s[i++] = 'E';
	  s[i++] = 'L';
    break;
    case VAL_DOSFTYPE_CBM:
	  s[i++] = 'C';
	  s[i++] = 'B';
	  s[i++] = 'M';
    break;
    default: // VAL_DOSFTYPE_DEL
	  s[i++] = 'D';
	  s[i++] = 'E';
	  s[i++] = 'L';
    break;
  }
  return i;
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
	  mhprintf(" type ", ds->type&0xf);
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
unsigned char getdirent(unsigned char drive)  {
  unsigned char i;

  _miniInit();
/*
  msprintf("before readblockchain");
  cputln();
  cgetc();
*/
  readblockchain(ATTICDIRENTBUFFER, DIRENTBLOCKS, drive, 40, 3);
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

// start track/sector must be present in newds:
void writenewdirententry(unsigned char drive, DIRENT* newds2)  {
  unsigned char i;
  DIRENT* ds;
  DIRENT* newds;
  unsigned int max = ENTRIESPERBLOCK;
  unsigned char track = 40;
  unsigned char sector = 3;  // to be changed for sector chained by t=40, s=0

  _miniInit();

  ds = (DIRENT *) direntryblock[0]; // to be changed to smaller array
  // for write operations:
  newds = (DIRENT *) direntryblock[1]; // to be changed to smaller array
  // to use own pointer for write dirent:
  lcopy((uint32_t) newds2, (uint32_t) newds, DIRENTSIZE);

  // first try overwriting DEL file entry:
  for (i = 0; i < max; i++)  {
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy(ATTICDIRENTBUFFER + i * DIRENTSIZE, (uint32_t) ds, DIRENTSIZE);

//	if (ds->track == 0)  break; // no more entries
	if (ds->chntrack > 0)  {
      max += ENTRIESPERBLOCK; // more attic pages
	  track = ds->chntrack;  // chain for where to write dirent sector
	  sector = ds->chnsector;
	  mprintfd("writenewdirententry next block at i=", i);
	  cputlnd();
	  cgetcd();
	}
	if ((ds->type&0xf) == VAL_DOSFTYPE_DEL)  {
	  newds->chntrack = ds->chntrack;  // keep original chain
	  newds->chnsector = ds->chnsector;
	  lcopy((uint32_t) newds, ATTICDIRENTBUFFER + i * DIRENTSIZE, DIRENTSIZE);
#ifdef DEBUG
	  mprintf("writenewdirententry i=", i);
	  mprintf(" ofs=", i / (BLOCKSIZE / DIRENTSIZE) * BLOCKSIZE);
	  mprintf(" side=", sector % 2);
	  mprintf(" track=", track);
	  mprintf(" sector=", sector);
	  mprintf(" type=", (newds->type&0xf));
	  mh4printf(" ds addr=", (long) &ds);
	  mh4printf(" newds addr=", (long) &newds);
	  mh4printf(" newds2 addr=", (long) &newds2);
	  cputln();
	  cgetc();
#endif
	  lcopy(ATTICDIRENTBUFFER + i / (BLOCKSIZE / DIRENTSIZE) * BLOCKSIZE,
	        BLOCKDATALOW, BLOCKSIZE);
	  PutOneSector((BAM *) worksectorasBAM[0], drive, track, sector);
#ifdef DEBUG
	  msprintf("writenewdirententry done");
	  cputln();
	  cgetc();
#endif
	  return;
	}

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
	  mhprintf(" type ", ds->type&0xf);
	  mprintf(" trk ", ds->track);
	  mprintf(" sect ", ds->sector);
	  mprintf(" size ", ds->size);
	  mhprintf(" access ", ds->access);
	  cputln();
	  cgetc();
    }
#endif
  }
  messagebox("directory entries exhausted");
  cgetc();
}

void deletedirententry(unsigned char drive, unsigned char entry)  {
  unsigned char i;
  DIRENT* ds;
  unsigned int max = ENTRIESPERBLOCK;
  unsigned char track = 40;
  unsigned char sector = 3;  // to be changed for sector chained by t=40, s=0

  _miniInit();

  ds = (DIRENT *) direntryblock[0]; // to be changed to smaller array

  // loop all entries:
  for (i = 0; i < max; i++)  {
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy(ATTICDIRENTBUFFER + i * DIRENTSIZE, (uint32_t) ds, DIRENTSIZE);

//	if (ds->track == 0)  break; // no more entries
	if (ds->chntrack > 0)  {
      max += ENTRIESPERBLOCK; // more attic pages
	  track = ds->chntrack;  // chain for where to write dirent sector
	  sector = ds->chnsector;
#ifdef DEBUG
	  mprintf("deletedirententry next block at i=", i);
	  cputln();
	  cgetc();
#endif
	}
	if (i == entry)  {
	  //                           also clear upper bits:
	  ds->type = VAL_DOSFTYPE_DEL; // + (ds->type & ~0xf);
	  lcopy((uint32_t) ds, ATTICDIRENTBUFFER + i * DIRENTSIZE, DIRENTSIZE);
#ifdef DEBUG
	  mprintf("deletedirententry i=", i);
	  mprintf(" ofs=", i / (BLOCKSIZE / DIRENTSIZE) * BLOCKSIZE);
	  mprintf(" side=", sector % 2);
	  mprintf(" track=", track);
	  mprintf(" sector=", sector);
	  mprintf(" type=", (ds->type&0xf));
	  mh4printf(" ds addr=", (long) &ds);
	  cputln();
	  cgetc();
#endif
	  lcopy(ATTICDIRENTBUFFER + i / (BLOCKSIZE / DIRENTSIZE) * BLOCKSIZE,
	        BLOCKDATALOW, BLOCKSIZE);
	  PutOneSector((BAM *) worksectorasBAM[0], drive, track, sector);
	  deleteblockchain(drive, ds->track, ds->sector);
#ifdef DEBUG
	  msprintf("deletedirententry done");
	  cputln();
	  cgetc();
#endif
	  return;
	}

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
	  mhprintf(" type ", ds->type&0xf);
	  mprintf(" trk ", ds->track);
	  mprintf(" sect ", ds->sector);
	  mprintf(" size ", ds->size);
	  mhprintf(" access ", ds->access);
	  cputln();
	  cgetc();
    }
#endif
  }
  messagebox("entry not found");
  cgetc();
}

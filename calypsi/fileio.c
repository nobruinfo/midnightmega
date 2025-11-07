#include <string.h>
#include <stdint.h>
#include <mega65/conio.h>  // llvm instead of <printf.h>
#include <mega65/memory.h>  // mega65-libc
#include <mega65/hal.h>  // mega65-libc
#include "regions.h"
#include "hyppo.h"
#include "fileio.h"
#include "conioextensions.h"

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

// All to point into the disk buffer.
// to access as data:
BAM * BAMsector[2] = { (BAM*) BLOCKBAMLOW, (BAM*) BLOCKBAMHIGH };
// to transfer as fake BAM struct:
DATABLOCK * worksector[2] = { (DATABLOCK*) BLOCKDATALOW, (DATABLOCK*) BLOCKDATAHIGH };
// eight entries per single block:
BAM * worksectorasBAM[2] = { (BAM*) BLOCKDATALOW, (BAM*) BLOCKDATAHIGH };

// eight entries per single block:
// /* SECT */ DIRENT * direntryblock[2] = {
//  ( /* SECT */ DIRENT*) DIRENTPAGELOW,
//  ( /* SECT */ DIRENT*) (DIRENTPAGELOW + DIRENTSIZE) }; // HIGH };

DIRFLAGS direntflags[2][NBRENTRIES];

// unsigned char workside;
unsigned char BAMside;
unsigned char direntside;
unsigned char dosfilename[DOSFILENAMELEN + 1]; // extra byte for nullterm

// Midnight Mega general setup options:
// __attribute__((section(".data")))
OPTION option;

#define READ 0
#define WRITE 1
#define OFF 2
#define SHOWACCESSX 26
#define SHOWACCESSY 22
void ShowAccess(unsigned char drive,
                char track, char sector, unsigned char rw)  {
  if (rw == OFF)  {
    textcolor(COLOUR_CYAN);
    hline(SHOWACCESSX, SHOWACCESSY, 12, 32); // 64);  // 64 is the horizontal line
  } else if (option.option & OPTIONshowDRV) {
// #ifdef DISKDEBUG
    revers(1);
    if (drive)  textcolor(COLOUR_LIGHTGREEN);
    else        textcolor(COLOUR_LIGHTGREY);
    mcputsxy(SHOWACCESSX, SHOWACCESSY, " D");
    csputdec(drive, 1, 0);
    textcolor(COLOUR_ORANGE);
    cputc('T');
    csputdec(track, 2, 0);
    textcolor(COLOUR_LIGHTBLUE);
    cputc('S');
    csputdec(sector, 2, 0);
/*
    cputc('H');
    cputc((sector >= 20) ? '1' : '0');
*/
    cputc(' ');
    if (rw == WRITE)  {
      textcolor(COLOUR_RED);
      cputc('W');
    } else {
      textcolor(COLOUR_ORANGE);
      cputc('R');
    }
    if (drive)  textcolor(COLOUR_LIGHTGREEN);
    else        textcolor(COLOUR_LIGHTGREY);
    cputc(' ');
    revers(0);
    cputc(' ');
/*
#ifdef DELAYDEBUG
  usleep(800000); // microseconds
#endif
  textcolor(COLOUR_CYAN);
  mcputsxy(SHOWACCESSX, SHOWACCESSY, " D");
  hline(SHOWACCESSX, SHOWACCESSY, 12, 32); // 64);  // 64 is the horizontal line
#ifdef DELAYDEBUG
  usleep(20000); // microseconds
#endif
#endif
*/
  }
}

// __attribute__((section(".data")))
char lastdrive = 0;
// __attribute__((section(".data")))
char prevtrack = 0;
// __attribute__((section(".data")))
char lastdoublesector = 0;
void _miniInit()  {
  // clear F011 Floppy Controller Registers
  if (PEEK(0xd080U) != 0x40)  POKE(0xd080U, 0);
  prevtrack = 0;

  mh4printfd("_miniinit SECTBUF 32addr is: ", SECTBUF >> 16);
  mh4printfd(" ", SECTBUF & 0xffff);
  cputlnd();
}

unsigned char driveled(unsigned char errorcode)  {
    // Turn on just the LED, this causes it to blink:
    POKE(0xd080U, 0x40);
    bordercolor (COLOUR_RED);
    return errorcode;
}

// returns 1 for odd numbered sectors, 0 for even:
unsigned char ReadSector(unsigned char legacyHDOSstate,
                         unsigned char drive, char track,
                                              char sector) {
  unsigned char retval;
  unsigned char s;

  ShowAccess(drive, track, sector, READ);

  if (track == 0)  return 0xFC;
  drive += 0x20;   // #$60 drive 0
  if (sector < 20)  {
     drive += 0x08; // second side of disk
  }

  // Flag which side we need:
  retval = sector % 2;
  
  if (lastdrive != drive ||
      prevtrack != track || lastdoublesector != (sector / 2))  {
//    mcputsxy(3, SHOWACCESSY, " reading ");
//    csputdec(sector, 2, 0);
    // Turn on motor + led (which causes led to light solid):
    POKE(0xd080U, drive);
    // @@@@ legacy timing:
//    if (legacyHDOSstate)  {
    if (lastdrive != drive)  {
      // Spinup for ready:
      POKE(0xd081U, 0x20);
      // Wait while busy:
      while (PEEK(0xd082U) & 0x80) {}
    }
    // Track (start at 0):
    POKE(0xd084U, track - 1);
    // Sector (only side 0 ones):
//    POKE(0xd085U, sector / 2 + 1);
    POKE(0xd085U, (((sector) % 20) / 2) + 1);
//    if (sector < 20)  s = (sector / 2) + 1;
//    else              s = ((sector - 20) / 2) + 1;
//    POKE(0xd085U, s);
    // Side:
//    POKE(0xd086U, 0);
    POKE(0xd086U, ((sector >= 20) ? 1 : 0)); // side
    // Read:
    POKE(0xd081U, 0x41);
    // Wait while busy:
    while (PEEK(0xd082U) & 0x80) {}
    // Check for error:
    if (PEEK(0xd082U) & 0x18) {
      // Turn on just the LED, this causes to blink:
//      POKE(0xd080U, 0x40);
//      bordercolor(COLOUR_RED);
      prevtrack = 0;
  mprintfd("ReadSector. Track=", track);
  mprintfd(" Sector=", sector);
  mhprintfd(" $d082U=", PEEK(0xd082U));
  cputlnd();
  cgetcd();
      return driveled(0xff);
    }    // Make sure we can see the data, clear bit 7:
    POKE(0xd689U, PEEK(0xd689U) & ~0x80);
    lastdrive = drive;
    prevtrack = track;
    lastdoublesector = (sector / 2);
  } /*
  else {
    mcputsxy(3, SHOWACCESSY, " cached ");
    csputdec(sector, 2, 0);
  }  */
  ShowAccess(drive, track, sector, OFF);
  return retval;
}

// both physical sectors are written:
unsigned char WriteSector(unsigned char legacyHDOSstate,
                          unsigned char drive, char track,
                                               char sector) {
    unsigned char retval;

  ShowAccess(drive, track, sector, WRITE);
  prevtrack = 0; // @@@@@

    if (track == 0)  return 0xFC;
    drive += 0x20;   // #$60 drive 0
    if (sector < 20)  {
        drive += 0x08; // second side of disk
    }

    // Flag which side we need:
    retval = sector % 2;

    // Turn on motor + led (which causes led to light solid):
    POKE(0xd080U, drive);
    // @@@@ legacy timing:
//    if (legacyHDOSstate)  {
    if (lastdrive != drive)  {
      // Spinup for ready:
      POKE(0xd081U, 0x20);
      // Wait while busy:
      while (PEEK(0xd082U) & 0x80) {}
    }
    // Track (start at 0):
    POKE(0xd084U, track - 1);
    // Sector (only side 0 ones):
    // Sectors start at 1   mega65-book.pdf#3f0
//    POKE(0xd085U, sector / 2 + 1);
    POKE(0xd085U, (((sector) % 20) / 2) + 1);
    // Side:
    POKE(0xd086U, (sector >= 20 ? 1 : 0));
    // Write:
    POKE(0xd081U, 0x84);
    // Wait while busy and writing:
    while ((PEEK(0xd082U) & 0x80) ||
           (PEEK(0xd083U) & 0x10))  {}
    // Check for error:
    if (PEEK(0xd082U) & 0x18) {
      // Turn on just the LED, this causes to blink:
//      POKE(0xd080U, 0x40);
//      bordercolor(COLOUR_RED);
  mprintfd("WriteSector. Track=", track);
  mprintfd(" Sector=", sector);
  mhprintfd(" $d082U=", PEEK(0xd082U));
  cputlnd();
  cgetcd();
      return driveled(0xff);
    }
    // Make sure we can see the data, clear bit 7:
    POKE(0xd689U, PEEK(0xd689U) & ~0x80);
    lastdrive = drive;

  ShowAccess(drive, track, sector, OFF);
    return retval;
}

// depending on the sector's side this returns the wanted
// sector in the regular or upper 256 bytes of the 512
// bytes buffer:
unsigned char GetWholeSector(unsigned char legacyHDOSstate,
                             BAM* entry, unsigned char drive,
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
  side = ReadSector(legacyHDOSstate, drive, track, sector);

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
unsigned char GetOneSector(unsigned char legacyHDOSstate,
                           BAM* entry, unsigned char drive,
                             char track, char sector)  {
  BAM* ws = entry;   // later to be DATABLOCK*
  unsigned char side;
#ifdef DEBUG
  mprintf("GetOneSector before ReadSector. Track=", track);
  mprintf(" Sector=", sector);
  // mh4printf(" p=", (long) p);
  cputln();
  cgetc();
#endif
  side = ReadSector(legacyHDOSstate, drive, track, sector);

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
unsigned char PutWholeSector(unsigned char legacyHDOSstate,
                             BAM* entry, unsigned char drive,
                             char track, char sector)  {
  BAM* ws = entry;   // later to be DATABLOCK*

//  if (side > 1)  return side;
  unsigned char side = sector % 2;

  if (side == 0)  {
    clrhomed();
    mprintfd("PutWholeSector before lower buffer. Track=", track);
    mprintfd(" Sector=", sector);
    cputlnd();
    cgetcd();
    lcopy((uint32_t) ws, SECTBUF, BLOCKSIZE * 2); // <-- take both sectors
  } else {  // @@@@ probably no longer needed:
    // Now first read the state from the disk, because only one of
    // the two logical sectors will be overwritten:
    ReadSector(legacyHDOSstate, drive, track, sector);
  
    clrhomed();
    mprintfd("PutWholeSector before upper buffer. Track=", track);
    mprintfd(" Sector=", sector);
    cputlnd();
    lcopy((uint32_t) ws, SECTBUFUPPER, BLOCKSIZE);
  }
  msprintfd("PutWholeSector done. Returning while WriteSector.");
  cgetcd();
  return WriteSector(legacyHDOSstate, drive, track, sector - side);
}
unsigned char PutOneSector(unsigned char legacyHDOSstate,
                           BAM* entry, unsigned char drive,
                           char track, char sector)  {
  BAM* ws = entry;   // later to be DATABLOCK*

  unsigned char side = sector % 2;
  
  // Now first read the state from the disk, because only one of
  // the two logical sectors will be overwritten:
  ReadSector(legacyHDOSstate, drive, track, sector);
  
  if (side == 0)  {
    clrhomed();
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

  return WriteSector(legacyHDOSstate, drive, track, sector - side);
}

void GetBAM(unsigned char legacyHDOSstate, unsigned char side)  {
  BAM* bs;

  bs = BAMsector[0];
  lcopy(ATTICBAMBUFFER + side * ATTICBAMBUFFERSIZE,
        (uint32_t) bs, ATTICBAMBUFFERSIZE);
}
void PutBAM(unsigned char legacyHDOSstate,
            unsigned char drive, unsigned char side, unsigned char dirtrack)  {
  BAM* bs;

  PutOneSector(legacyHDOSstate, BAMsector[0], drive, dirtrack, BAMSECT);
  bs = BAMsector[0];
  PutOneSector(legacyHDOSstate,
               BAMsector[1], drive, bs->chntrack, bs->chnsector);
  lcopy((uint32_t) bs,
        ATTICBAMBUFFER + side * ATTICBAMBUFFERSIZE, ATTICBAMBUFFERSIZE);
}

unsigned char BAM2Attic(unsigned char legacyHDOSstate, unsigned char drive,
                        unsigned char side, unsigned char dirtrack) {
  // _miniInit();

  return readblockchain(legacyHDOSstate, side?ATTICBAM2BUFFER:ATTICBAMBUFFER,
                        BAMBLOCKS, drive, dirtrack, BAMSECT);
}

// this expects data in sector buffer:
void BAMSectorUpdate(BAM* BAMsector, BAM* BAMsector2, char track, char sector, char set) {
  unsigned char bitshifter = 1;

//  BAMsector += $100;  // @@@@@ dirty test
//  mprintf("BAMSectorUpdate BAMsector is:", (unsigned long) BAMsector);

  // next BAM sector of two in total:
  if (track > 40)  {
    track -= 40;
    BAMsector = BAMsector2;
  }
#ifdef DEBUG
        gotoxy(42, 20);
        mh4printf("BAMsector ", (long) BAMsector);
        cputln();
        cgetc();
#endif
  
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

unsigned int BAMSectorsFreeBlocks(BAM* BAMsector, BAM* BAMsector2,
                     unsigned char dirtrack,
                     unsigned char firsttrack, unsigned char lasttrack) {
  unsigned char track80;
  unsigned char track;
  unsigned int free = 0;

  // access track array zero based
  for (track80 = (firsttrack - 1); track80 < lasttrack; track80++)  {
    // next BAM sector of two in total:
    if (track80 < 40)  {
      track = track80;
    } else {
      track = track80 - 40;
      BAMsector = BAMsector2;
    }

    if (track80 != (dirtrack - 1))  {
      free += BAMsector->entry[track].free;
    }
  }

  return free;
}

unsigned int FreeBlocks(unsigned char legacyHDOSstate,
                        unsigned char side, unsigned char dirtrack,
                        unsigned char firsttrack, unsigned char lasttrack) {
  GetBAM(legacyHDOSstate, side);
  return BAMSectorsFreeBlocks(BAMsector[0], BAMsector[1], dirtrack,
                              firsttrack, lasttrack);
}

unsigned int BAMCheckSizeinFilebuffer(unsigned char legacyHDOSstate,
                                      unsigned char drive, unsigned char side,
                                      unsigned char dirtrack,
                                      unsigned char firsttrack,
                                      unsigned char lasttrack) {
  BAM* bs;

  readblockchain(legacyHDOSstate, ATTICFILEBUFFER, BAMBLOCKS,
                 drive, dirtrack, BAMSECT);
  bs = BAMsector[0];
  lcopy(ATTICFILEBUFFER, (uint32_t) bs, ATTICBAMBUFFERSIZE);
  return BAMSectorsFreeBlocks(BAMsector[0], BAMsector[1], dirtrack,
                              firsttrack, lasttrack);
}

// @@@@ debug
// unsigned char* const basepage = (unsigned char*) BASEPAGERESERVED;
unsigned char BAMFreeTracksinaRow(BAM* BAMsector, BAM* BAMsector2,
                     unsigned char firsttrack, unsigned char lasttrack,
                     unsigned char * starttrack, unsigned char * endtrack,
                     unsigned char nboftracks) {
  unsigned char track80;
  unsigned char track;
  unsigned char number = 0;
  unsigned char numberprev = 0;
  unsigned char starttrackprev = 0;
  unsigned char endtrackprev = 0;

  *starttrack = 0; // to return the range matching the number of requested
  *endtrack = 0;   // tracks

  // access track array zero based
  for (track80 = (firsttrack - 1); track80 < lasttrack; track80++)  {
    // next BAM sector of two in total:
    if (track80 < 40)  {
      track = track80;
    } else {
      track = track80 - 40;
      BAMsector = BAMsector2;
    }

    if (BAMsector->entry[track].free >= 40)  {
      if (*starttrack == 0)  *starttrack = track80 + 1;
      number ++;
    } else {
      if (number)  {
        *endtrack = track80;
        if ((*endtrack - *starttrack) >= (nboftracks - 1))  {
          // weak strategy to find lowest track count in a row:
          if ((*endtrack - *starttrack) >= (endtrackprev - starttrackprev)) {
            endtrackprev = *endtrack;
            starttrackprev = *starttrack;
          } else {
            *endtrack = endtrackprev;
            *starttrack = starttrackprev;
          }
        } else {  // requested number of tracks not met:
          *endtrack = 0;
          *starttrack = 0;
        }
      }
      number = 0; // re-begin finding biggest consecutive number
    }
  }

  // determine last track being unallocated:
  if ((*starttrack + number) > lasttrack)  *endtrack = lasttrack;

//  basepage[0] = number;      // @@@@ debug
//  basepage[1] = *starttrack; // @@@@ debug
//  basepage[2] = *endtrack;   // @@@@ debug

  return number;
}

unsigned char FreeTracks(unsigned char legacyHDOSstate,
                         unsigned char side,
                         unsigned char firsttrack, unsigned char lasttrack,
                         unsigned char * starttrack, unsigned char * endtrack,
                         unsigned char nboftracks) {
  GetBAM(legacyHDOSstate, side);
  return BAMFreeTracksinaRow(BAMsector[0], BAMsector[1],
                             firsttrack, lasttrack,
                             starttrack, endtrack, nboftracks);
}

#define ID_i 'I'
#define ID_d 'D'
void FormatPartition(unsigned char legacyHDOSstate,
                     unsigned char drive, unsigned char side,
                     unsigned char dirtrack,
                     unsigned char firsttrack, unsigned char lasttrack,
                     char* name)  {
  BAM* bs;
  BAM* bs1;
  HEADER* hs;
  unsigned char track;

  bs = BAMsector[0];
  bs1 = BAMsector[1];
  hs = (HEADER *) BAMsector[0];

  // do it all backwards to profit from BAM similarities.

  // create first empty dirent sector:
  lfill((uint32_t) bs1, 0, BLOCKSIZE);
  bs1->chnsector = 0xff;

  // now BAM sectors:
  bs->chntrack = 0;   // second BAM sector first
  bs->chnsector = 0xff;  // next sector of BAM
  bs->version = 0x44;
  bs->versioninvert = 0xbb;
  bs->diskid1 = ID_i;  // @@@@@
  bs->diskid2 = ID_d;
  bs->io = 0x40;
  // for (i = 0x07; i <= 0x0f; i++)  bs[i] = 0;
  lfill((uint32_t) bs + 0x07, 0, 0x0f - 0x07 + 1); // clear bytes 07..0f
  for (track = 0; track < 40; track++)  {
    if ((track + 41) == dirtrack)  {
      bs->entry[track].free = 0x24;  // occupy header, BAM and dirent
      bs->entry[track].alloc1 = 0xf0;
    } else {
      bs->entry[track].free = 0x28;
      bs->entry[track].alloc1 = 0xff;
    }
    bs->entry[track].alloc2 = 0xff;
    bs->entry[track].alloc3 = 0xff;
    bs->entry[track].alloc4 = 0xff;
    bs->entry[track].alloc5 = 0xff;
  }
  progress("Writing...", "directory/BAM", 30);
  PutWholeSector(legacyHDOSstate, (BAM *) bs, drive, dirtrack, BAMSECT + 1);

  // both BAM sectors look almost the same:
  lcopy((uint32_t) bs, (uint32_t) bs1, BLOCKSIZE);

  bs1->chntrack = dirtrack;  // first BAM sector points to second one
  bs1->chnsector = BAMSECT + 1;  // next sector of BAM
  if (dirtrack > 40)  {  // reset eventual dirtrack in upper BAM
    bs1->entry[dirtrack - 41].free = 0x28;
    bs1->entry[dirtrack - 41].alloc1 = 0xff;
  }
  if (dirtrack <= 40)  {
    bs1->entry[dirtrack - 1].free = 0x24;  // occupy header, BAM and dirent
    bs1->entry[dirtrack - 1].alloc1 = 0xf0;
  }

  // create first empty header sector:
  lfill((uint32_t) bs, 0, BLOCKSIZE);
  hs->chntrack = dirtrack;  // first BAM sector points to second one
  hs->chnsector = DIRENTSECT;
  hs->diskdosversion = 0x44;
  strcopy(name, (char *) hs->diskname, 16);
  hs->unused1 = 0xa0;
  hs->unused2 = 0xa0;
  hs->diskid1 = ID_i;  // @@@@
  hs->diskid2 = ID_d;
  hs->unused3 = 0xa0;
  hs->dosversion = 0x33;
  hs->diskversion = 0x44;
  hs->unused4 = 0xa0;
  hs->unused5 = 0xa0;

  progress("Writing...", "BAM/header", 60);
  PutWholeSector(legacyHDOSstate, (BAM *) bs, drive, dirtrack, HEADERSECT);
}

void BAMAllocateTracks(unsigned char legacyHDOSstate, unsigned char side,
                       unsigned char starttrack, unsigned char endtrack) {
  unsigned char track80;
  unsigned char sector;

  GetBAM(legacyHDOSstate, side);
  for (track80 = starttrack; track80 <= endtrack; track80++)  {
    for (sector = 0; sector < 40; sector++)  {
      BAMSectorUpdate(BAMsector[0], BAMsector[1], track80, sector, 1); // 1=allocate
    }
  }
}

// @@@@ this has old filename handling and uses a BAM sector instead
// @@@@ of passing a pointer:
void getDiskname(unsigned char legacyHDOSstate,
                 unsigned char drive, unsigned char dirtrack, char* diskname) {
  HEADER* hs;
  unsigned char i;

  // _miniInit();

  if (GetOneSector(legacyHDOSstate,
                   BAMsector[0], drive, dirtrack, HEADERSECT) < 2)  {
    hs = (HEADER*) BAMsector[0];

    i = 0;
    while (hs->diskname[i] != 0xa0 && i < DOSFILENAMELEN)  {
      diskname[i] = hs->diskname[i];
      i++;
    }
    diskname[i] = 0;
  } else {
    strcopy("read error", (char *) diskname, 16);
  }
}

unsigned char readblockchain(unsigned char legacyHDOSstate,
                             uint32_t destination_address,
                             unsigned int maxblocks, unsigned char drive,
                             unsigned char track, unsigned char sector)  {
  unsigned int i;
  unsigned char nexttrack;
  unsigned char nextsector;

  // _miniInit();
  nexttrack = track;
  nextsector = sector;
#ifdef DEBUG
        mprintf("readblockchain first nexttrack ", nexttrack);
        mprintf(" nextsector ", nextsector);
        cputln();
#endif

  for (i = 0; i < maxblocks; i++)  {
    if (GetOneSector(legacyHDOSstate,
                     worksectorasBAM[0], drive, nexttrack, nextsector) > 1)  {
      return(0xff);
    }
    DATABLOCK* ws = worksector[0];
    nexttrack = ws->chntrack;
    nextsector = ws->chnsector;
#ifdef DEBUG
        mprintf("nexttrack ", nexttrack);
        mprintf(" nextsector ", nextsector);
//        mprintf(" workside ", workside);
        cputln();
        mprintf(" block ", i);
        mh4printf(" is: ", (long) &ws);
        cputln();
        mh4printf(" worksector[0]: ", (long) worksector[0]);
        mh4printf(" worksectorasBAM[0]: ", (long) worksectorasBAM[0]);
        cputln();
        cgetc();
#endif
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy((uint32_t) ws, destination_address + i * BLOCKSIZE, BLOCKSIZE);
    
    if (nexttrack == 0)  break;
  }
  
  if (nexttrack > 0)  {
    return(0xfe);
  }
  return 0;
}

unsigned char isallocatedBAMtracksector(unsigned char track,
                                        unsigned char sector)  {
  unsigned char bitshifter = 1;
  BAM* bs;

  track--;  // zero based array access
  if (track < 40)  {
    bs = BAMsector[0];
  } else {
    track = track - 40;
    bs = BAMsector[1];
  }
  if (sector < 8)  {
    if (!(bs->entry[track].alloc1 & (bitshifter << sector)))  {
#ifdef DEBUG
        gotoxy(42, 7);
        mprintf("t=", track);
        mprintf(" s=", sector);
        mprintf(" nt=", bs->chntrack);
        mprintf(" ns=", bs->chnsector);
        mprintf(" a1=", bs->entry[track].alloc1);
        cgetc();
#endif
      return TRUE;
    }
  }
  else if (sector < 16)  {
    if (!(bs->entry[track].alloc2 & (bitshifter << (sector - 8))))  {
#ifdef DEBUG
        gotoxy(42, 8);
        mprintf("t=", track);
        mprintf(" s=", sector);
        mprintf(" nt=", bs->chntrack);
        mprintf(" ns=", bs->chnsector);
        cgetc();
#endif
      return TRUE;
    }
  }
  else if (sector < 24)  {
    if (!(bs->entry[track].alloc3 & (bitshifter << (sector - 16))))  {
#ifdef DEBUG
        gotoxy(42, 9);
        mprintf("t=", track);
        mprintf(" s=", sector);
        mprintf(" nt=", bs->chntrack);
        mprintf(" ns=", bs->chnsector);
        cgetc();
#endif
      return TRUE;
    }
  }
  else if (sector < 32)  {
    if (!(bs->entry[track].alloc4 & (bitshifter << (sector - 24))))  {
#ifdef DEBUG
        gotoxy(42, 10);
        mprintf("t=", track);
        mprintf(" s=", sector);
        mprintf(" nt=", bs->chntrack);
        mprintf(" ns=", bs->chnsector);
        cgetc();
#endif
      return TRUE;
    }
  }
  else  {
    if (!(bs->entry[track].alloc5 & (bitshifter << (sector - 32))))  {
#ifdef DEBUG
        gotoxy(42, 11);
        mprintf("t=", track);
        mprintf(" s=", sector);
        mprintf(" nt=", bs->chntrack);
        mprintf(" ns=", bs->chnsector);
        cgetc();
#endif
      return TRUE;
    }
  }
  return FALSE;
}

// track40 = TRUE lets search for an empty sector in dirtrack:
void findnextBAMtracksector(unsigned char * nexttrack, unsigned char * nextsector,
                        unsigned char track40, unsigned char dirtrack,
                        unsigned char firsttrack, unsigned char lasttrack)  {
  unsigned char bitshifter = 1;
  unsigned char track80;
  unsigned char track;
  unsigned char i;
  unsigned char sector;
  unsigned char done = 0; //      0   1   2   3   4   5   6   7   8   9
  unsigned char strategy[80] = { 38, 41, 40, 42, 37, 43, 36, 44, 35, 45,
                                 34, 46, 33, 47, 32, 48, 31, 49, 30, 50,
                                 29, 51, 28, 52, 27, 53, 26, 54, 25, 55,
                                 24, 56, 23, 57, 22, 58, 21, 59, 20, 60,
                                 19, 61, 18, 62, 17, 63, 16, 64, 15, 65,
                                 14, 66, 13, 67, 12, 68, 11, 69, 10, 70,
                                  9, 71,  8, 72,  7, 73,  6, 74,  5, 75,
                                  4, 76,  3, 77,  2, 78,  1, 79,  0, 39 };
  BAM* bs;

  // access track array zero based
  // track strategy on track 40 is overridden by leaping to the following
  // track of element [0] := 38 + 1 ==> track 39, physical 40
  for (i = (firsttrack - 1); i < lasttrack; i++)  {
    if (dirtrack != HEADERTRACK)  {
      if (!track40 && i == (firsttrack - 1))  i++; // BAM strategy is different
      track80 = i;  // no strategy for subpartitions
    } else {
      track80 = strategy[i];
      if (track40)       track80++;    // BAM strategy is different
      if (track80 > 79)  track80 = 0;
      // next BAM sector of two in total:
    }
    if (track80 < 40)  {
      track = track80;
      bs = BAMsector[0];
    } else {
      track = track80 - 40;
      bs = BAMsector[1];
    }
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
  track80++;  // access array zero based, but tracks are 1..80

  if (done)  {
    BAMSectorUpdate(BAMsector[0], BAMsector[1], track80, sector, 1); // 1=allocate
  
    // return values:
    *nexttrack  = track80;
    *nextsector = sector;
  } else {
    *nexttrack  = 0xff;
    *nextsector = 0;
  }
}

// ignores start track and sector upon call but gives them back:
void writeblockchain(unsigned char legacyHDOSstate,
                     uint32_t source_address,
                     unsigned int maxblocks, unsigned char drive,
                     unsigned char * starttrack, unsigned char * startsector,
                     unsigned char dirtrack, unsigned char dirtrackflag,
                     unsigned char firsttrack, unsigned char lasttrack)  {
  unsigned int i;
  unsigned char nexttrack = 0;
  unsigned char nextsector = 0xff;
  unsigned char track;
  unsigned char sector;

  // _miniInit();
  DATABLOCK* ws = worksector[0];
  DATABLOCK* ws1 = worksector[1];

  // get a first sector anyway:
  findnextBAMtracksector(&track, &sector, dirtrackflag, dirtrack,
                         firsttrack, lasttrack);
  *starttrack = track;  // to later write dirent
  *startsector = sector;
  
  for (i = 0; i < maxblocks; i++)  {
    lcopy(source_address + i * BLOCKSIZE, (uint32_t) ws, BLOCKSIZE);

#ifdef DEBUG
        mprintf("nexttrack ", nexttrack);
        mprintf(" nextsector ", nextsector);
        mprintf(" block ", i);
        mh4printf(" is: ", (long) &ws);
        mh4printf(" worksector[0]: ", (long) worksector[0]);
        cputln();
        cgetc();
#endif

    // replace chain with available ones or leave 0 if last datablock:
    if (ws->chntrack > 0)  {
      findnextBAMtracksector(&nexttrack, &nextsector, dirtrackflag, dirtrack,
                             firsttrack, lasttrack);
      ws->chntrack = nexttrack;
      ws->chnsector = nextsector;
    }
    // is there a second sector to combine write a physical sector?
    if (ws->chntrack > 0 && track == ws->chntrack &&
        (sector / 2) == (ws->chnsector / 2))  {
      i++;
      lcopy(source_address + i * BLOCKSIZE, (uint32_t) ws1, BLOCKSIZE);
      if (ws1->chntrack > 0)  {
        findnextBAMtracksector(&nexttrack, &nextsector, dirtrackflag, dirtrack,
                               firsttrack, lasttrack);
        ws1->chntrack = nexttrack;
        ws1->chnsector = nextsector;
      }
#ifdef DEBUG
        mprintf("double sectors, track=", track);
        mprintf(" sector=", sector);
        cputln();
        cgetc();
#endif
      PutWholeSector(legacyHDOSstate, (BAM *) ws, drive, track, sector);
      ws->chntrack = ws1->chntrack; // fake to abort below if zero
    } else {
#ifdef DEBUG
        mprintf("single sectors, track=", track);
        mprintf(" sector=", sector);
        cputln();
        cgetc();
#endif
      PutOneSector(legacyHDOSstate, (BAM *) ws, drive, track, sector);
    }

    if (ws->chntrack == 0)  break;
    track = nexttrack;
    sector = nextsector;
  }
  
  if (nexttrack > 0 && i >= maxblocks)  {
    messagebox(MBOXNUMBER, "Writing file,", "number of sectors too big",
                           "max", (long) maxblocks);
  }
}

// not physically deleting but BAM deallocating:
unsigned char deleteblockchain(unsigned char legacyHDOSstate,
                               unsigned char drive, unsigned char dirtrack,
                               unsigned char track, unsigned char sector)  {
  unsigned char nexttrack;
  unsigned char nextsector;
  BAM* bs;

  // _miniInit();
  if (GetOneSector(legacyHDOSstate,
                   BAMsector[0], drive, dirtrack, BAMSECT) > 1)  {
    return 0xff;
  }
  bs = BAMsector[0];
  if (GetOneSector(legacyHDOSstate,
                   BAMsector[1], drive, bs->chntrack, bs->chnsector) > 1)  {
    return 0xfe;
  }

  nexttrack = track;
  nextsector = sector;
#ifdef DEBUG
        mprintf("nexttrack ", nexttrack);
        mprintf(" nextsector ", nextsector);
        cputln();
#endif
  while (nexttrack > 0)  {
    /* workside = */ GetOneSector(legacyHDOSstate,
                          worksectorasBAM[0], drive, nexttrack, nextsector);
    DATABLOCK* ws = worksector[0];
    BAMSectorUpdate(BAMsector[0], BAMsector[1], nexttrack, nextsector, 0); // 0=free up
#ifdef DEBUG
        gotoxy(42, 0);
        mprintf("nexttrack ", nexttrack);
        mprintf(" nextsector ", nextsector);
//        mprintf(" workside ", workside);
        cputln();
        gotoxy(42, 1);
        mh4printf(" block is: ", (long) &ws);
        cputln();
        gotoxy(42, 2);
        mh4printf(" worksector[0]: ", (long) worksector[0]);
        cputln();
        cgetc();
#endif
    nexttrack = ws->chntrack;
    nextsector = ws->chnsector;
  }
  PutOneSector(legacyHDOSstate, BAMsector[0], drive, dirtrack, BAMSECT);
  PutOneSector(legacyHDOSstate,
               BAMsector[1], drive, bs->chntrack, bs->chnsector);
  return 0;
}

extern unsigned char s[]; // @@@@
char * tracksectorstring(unsigned char track, unsigned char sector)  {
  unsigned int  i;

  i = 0;
  s[i++] = 'T'; // @@ is this now how I want things to be?
  s[i++] = 'r';
  s[i++] = 'a';
  s[i++] = 'c';
  s[i++] = 'k';
  s[i++] = ':';
  s[i++] = ' ';
  s[i++] = track / 10 + 48; // digit screen codes
  s[i++] = track % 10 + 48;
  s[i++] = ' ';
  s[i++] = 'S';
  s[i++] = 'e';
  s[i++] = 'c';
  s[i++] = 't';
  s[i++] = 'o';
  s[i++] = 'r';
  s[i++] = ':';
  s[i++] = ' ';
  s[i++] = sector / 10 + 48;
  s[i++] = sector % 10 + 48;
  s[i++] = 0;
  return (char*) s;
}

unsigned char copywholedisk(unsigned char legacyHDOSstate,
                            unsigned char srcdrive, unsigned char destdrive,
                            unsigned char side)  {
  unsigned char track;
  unsigned char sector;
  unsigned int  i;
  DATABLOCK* ws;
/*
  // if setting allocated BAM blocks only:
  if ((option.option & OPTIONshowALO))  {
    i = 0;
    GetBAM(side);
    for (track = 1; track <= 80; track++)  {
      for (sector = 0; sector < 40; sector++)  {
        if (isallocatedBAMtracksector(track, sector))  {
          progress("Reading...", tracksectorstring(track, sector), i / 64);
          if (GetOneSector(worksectorasBAM[0], srcdrive, track, sector) > 1)  {
            return 0xff;
          }
          ws = worksector[0];
          lcopy((uint32_t) ws, ATTICFILEBUFFER + i * BLOCKSIZE, BLOCKSIZE);

          progress("Writing...", tracksectorstring(track, sector), i / 64 + 50);
          lcopy(ATTICFILEBUFFER + i * BLOCKSIZE, (uint32_t) ws, BLOCKSIZE);
          PutOneSector((BAM *) ws, destdrive, track, sector);
        }
        i++;
      }
    }
  } else  {
*/
    i = 0;
    for (track = 1; track <= 80; track++)  {
      for (sector = 0; sector < 40; sector += 2)  {
        if (!(option.option & OPTIONshowALO) ||
            isallocatedBAMtracksector(track, sector) ||
            isallocatedBAMtracksector(track, sector + 1))  {
          progress("Reading...", tracksectorstring(track, sector), i / 64);
          if (GetWholeSector(legacyHDOSstate,
                          worksectorasBAM[0], srcdrive, track, sector) > 1)  {
            return 0xff;
          }
          ws = worksector[0];
          lcopy((uint32_t) ws, ATTICFILEBUFFER + i * BLOCKSIZE, BLOCKSIZE * 2);
          i += 2;
        }
      }
    }
    i = 0;
    for (track = 1; track <= 80; track++)  {
      for (sector = 0; sector < 40; sector += 2)  {
        if (!(option.option & OPTIONshowALO) ||
            isallocatedBAMtracksector(track, sector) ||
            isallocatedBAMtracksector(track, sector + 1))  {
          progress("Writing...", tracksectorstring(track, sector), i / 64 + 50);
          lcopy(ATTICFILEBUFFER + i * BLOCKSIZE, (uint32_t) ws, BLOCKSIZE * 2);
          PutWholeSector(legacyHDOSstate,
                         (BAM *) ws, destdrive, track, sector);
          i += 2;
        }
      }
    }
//  }
  return 0;
}

// this is a mixture of storage card and C= file types:
unsigned char gettype(unsigned char type, unsigned char * s, unsigned char i)  {
  if (type & HYPPODIRENTATTR)  {
    switch (type & (~HYPPODIRENTATTR)) {
      case HYPPODIRENTATTRDIR:
        s[i++] = 'D';
        s[i++] = 'I';
        s[i++] = 'R';
      break;
      default:
        s[i++] = ' ';
        s[i++] = ' ';
        s[i++] = ' ';
      break;
    }
  } else {
    switch (type & 0xf) {
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
  }
  return i;
}

DIRENT* getdirententry(unsigned char side, unsigned int entry)  {
  unsigned int i;
  unsigned int pos;
  DIRENT* ds;
  unsigned int max = ENTRIESPERBLOCK;

  ds = &readdir_dirent->direntryblock[0];

  for (i = 0, pos = 0; i < max; i++)  {
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i * DIRENTSIZE,
          (uint32_t) ds, DIRENTSIZE);

//    if (ds->track == 0)  return NULL; // no more entries
    if ((ds->chntrack > 0) &&
        ((i % ENTRIESPERBLOCK) == 0))  {
      max += ENTRIESPERBLOCK; // more attic pages
    }
    // if a non-deleted or a SD card file (hence no mask) ?
    if (ds->type != VAL_DOSFTYPE_DEL || (option.option & OPTIONshowDEL))  {
      if (pos == entry)  return ds; // found
      pos++;
    }

#ifdef DEBUG
    if (ds->track > 0)  {
      mprintf("direntry ", i);
      mh4printf(" is: ", (long) &ds);
      memcpy(dosfilename, ds->name, DOSFILENAMELEN);
      dosfilename[DOSFILENAMELEN] = 0; // proper null termination
      msprintf(" name ");
//        msprintf((char *) dosfilename);
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
unsigned char getdirent(unsigned char legacyHDOSstate, unsigned char drive,
                        unsigned char side, unsigned char dirtrack)  {
  signed int entry; // counts below zero

  // _miniInit();
/*
  msprintf("before readblockchain");
  cputln();
  cgetc();
*/
  if (readblockchain(legacyHDOSstate,
                     ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE,
                     DIRENTBLOCKS, drive, dirtrack, DIRENTSECT) > 1)  {
    return 0xff;
  }
/*
  msprintf("after readblockchain");
  cputln();
  cgetc();
*/
  for (entry = NBRENTRIES; entry >= 0; entry--)  {
//    if (entry < 10)  valuesbox(0, "loop entries", "entry=", entry, " ", 0);
    if (getdirententry(side, entry) != NULL)  return entry;  // nbr of entries
  }
  return 0xff;
}

// start track/sector must be present in newds:
void writenewdirententry(unsigned char legacyHDOSstate,
                         unsigned char drive, unsigned char side,
                         unsigned char dirtrack,
                         unsigned char firsttrack, unsigned char lasttrack,
                         DIRENT* newds)  {
  unsigned char i;
  unsigned char topdirent = 0;  // keep number of first dirent of current sector
  DIRENT* ds;
//  DIRENT* newds;
  unsigned int max = ENTRIESPERBLOCK;
  unsigned char track = dirtrack;
  unsigned char sector = DIRENTSECT;  // @@ to be changed for sector chained by t=40, s=0
  unsigned char nexttrack = 0;
  unsigned char nextsector = 0;

  // _miniInit();

  // blatantly misuse the unfilled DIRENT buffer:
  ds = &readdir_dirent->direntryblock[1];

  // first try overwriting DEL file entry:
  for (i = 0; i < max; i++)  {
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i * DIRENTSIZE,
          (uint32_t) ds, DIRENTSIZE);

    if ((i % ENTRIESPERBLOCK) == 0)  {
      topdirent = i;
      // not for the first iteration:
      if (i > 0)  {
        track = nexttrack;
        sector = nextsector;
      }
    }
    if (ds->chntrack > 0)  {
      max += ENTRIESPERBLOCK; // more attic pages
      nexttrack = ds->chntrack;  // chain for where to write dirent sector
      nextsector = ds->chnsector;
    }
    if ((ds->type&0xf) == VAL_DOSFTYPE_DEL)  {
      newds->chntrack = ds->chntrack;  // keep blockchain
      newds->chnsector = ds->chnsector;
      lcopy((uint32_t) newds,
            ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i * DIRENTSIZE,
            DIRENTSIZE);

#ifdef DEBUG
      mprintf("writenewdirententry i=", i);
      mprintf(" ofs=", side * ATTICDIRENTSIZE +
                       i / (BLOCKSIZE / DIRENTSIZE) * BLOCKSIZE);
      mprintf(" side=", sector % 2);
      mprintf(" newds->track=", newds->track);
      mprintf(" newds->sector=", newds->sector);
      cputln();
      mprintf("track=", track);
      mprintf(" sector=", sector);
      mprintf(" nexttrack=", nexttrack);
      mprintf(" nextsector=", nextsector);
      mprintf(" type=", (newds->type&0xf));
      cputln();
      mh4printf(" ds addr=", (long) ds);
      mh4printf(" newds addr=", (long) newds);
      cputln();
      cgetc();
#endif

      lcopy(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE +
              i / (BLOCKSIZE / DIRENTSIZE) * BLOCKSIZE,
            BLOCKDATALOW, BLOCKSIZE);
      PutOneSector(legacyHDOSstate,
                   (BAM *) worksectorasBAM[0], drive, track, sector);
#ifdef DEBUG
      msprintf("writenewdirententry done");
      cputln();
      cgetc();
#endif
      return;
    }

#ifdef DEBUG
    if (ds->track > 0)  {
      mprintf("writedirentry ", i);
      mh4printf(" is: ", (long) &ds);
      memcpy(dosfilename, ds->name, DOSFILENAMELEN);
      dosfilename[DOSFILENAMELEN] = 0; // proper null termination
      msprintf(" name ");
//        msprintf((char *) dosfilename);
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
  
  // peek first dirent of full block to set new chain:
  lcopy(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + topdirent * DIRENTSIZE,
        (uint32_t) ds, DIRENTSIZE);
  // dirent already full, establish an additional sector:
  // @@ sector strategy needed
  findnextBAMtracksector(&nexttrack, &nextsector, TRUE, dirtrack,
                         firsttrack, lasttrack);
  ds->chntrack = nexttrack;
  ds->chnsector = nextsector;
  // write new chain:
  lcopy((uint32_t) ds, // first dirent is the new one
        ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + topdirent * DIRENTSIZE,
        DIRENTSIZE);
  // dirty, copy attic back to block buffer and save it:
  lcopy(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE +
        topdirent / (BLOCKSIZE / DIRENTSIZE) * BLOCKSIZE,
        BLOCKDATALOW, BLOCKSIZE);
  PutOneSector(legacyHDOSstate,
               (BAM *) worksectorasBAM[0], drive, track, sector);
#ifdef DEBUG
      mprintf("first sector set, i=", i);
      cputln();
      cgetc();
#endif

  // i is already incremented after the loop, so step into next dirent block
  lfill(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i * DIRENTSIZE,
        0, BLOCKSIZE); // zero the whole block to fill one dirent after
  newds->chntrack = 0;  // indicate end of chain
  newds->chnsector = 0xff;
  lcopy((uint32_t) newds, // first dirent is the new one
        ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i * DIRENTSIZE,
        DIRENTSIZE);

  // dirty, copy attic back to block buffer and save it:
  lcopy(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE +
        i / (BLOCKSIZE / DIRENTSIZE) * BLOCKSIZE,
        BLOCKDATALOW, BLOCKSIZE);
  PutOneSector(legacyHDOSstate,
               (BAM *) worksectorasBAM[0], drive, nexttrack, nextsector);
//  messagebox(0, "directory entries exhausted");
}

void deletedirententry(unsigned char legacyHDOSstate,
                       unsigned char drive, unsigned char side,
                       unsigned char dirtrack, unsigned char entry)  {
  unsigned char i;
  unsigned int s;
  unsigned char pos;
  unsigned char filetypebefore;
  DIRENT* ds;
  unsigned int max = ENTRIESPERBLOCK;
  unsigned char track = dirtrack;
  unsigned char sector = DIRENTSECT;  // @@ to be changed for sector chained by t=40, s=0
  unsigned char nexttrack = 0;
  unsigned char nextsector = 0;

  // _miniInit();

  ds = &readdir_dirent->direntryblock[0];

  // loop all entries:
  for (i = 0, pos = 0; i < max; i++)  {
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i * DIRENTSIZE,
          (uint32_t) ds, DIRENTSIZE);

    // not for the first iteration:
    if (i > 0 && (i % ENTRIESPERBLOCK) == 0)  {
      track = nexttrack;
      sector = nextsector;
    }
    if (ds->chntrack > 0)  {
      max += ENTRIESPERBLOCK; // more attic pages
      nexttrack = ds->chntrack;  // chain for where to write dirent sector
      nextsector = ds->chnsector;
    }

    // if a non-deleted or a SD card file (hence no mask) ?
    if (ds->type != VAL_DOSFTYPE_DEL || (option.option & OPTIONshowDEL))  {
      if (pos == entry)  {
//        valuesbox(0, "Deleting...", "i=", i, "pos=", pos);
        //                           also clear upper bits:
        filetypebefore = ds->type;
        ds->type = VAL_DOSFTYPE_DEL; // + (ds->type & ~0xf);
        lcopy((uint32_t) ds, ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i * DIRENTSIZE,
              DIRENTSIZE);
#ifdef DEBUG
        mprintf("deletedirententry i=", i);
        mprintf(" ofs=", i / (BLOCKSIZE / DIRENTSIZE) * BLOCKSIZE);
        mprintf(" side=", side);
        mprintf(" track=", track);
        mprintf(" sector=", sector);
        mprintf(" nexttrack=", nexttrack);
        mprintf(" nextsector=", nextsector);
        mprintf(" type=", (ds->type&0xf));
        mh4printf(" ds addr=", (long) &ds);
        mprintf(" filetrack=", ds->track);
        mprintf(" filesector=", ds->sector);
        cputln();
        cgetc();
#endif
        lcopy(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE +
                i / (BLOCKSIZE / DIRENTSIZE) * BLOCKSIZE,
              BLOCKDATALOW, BLOCKSIZE);
        PutOneSector(legacyHDOSstate,
                     (BAM *) worksectorasBAM[0], drive, track, sector);
// basepage[3] = 0xff; // @@@@ debug
// basepage[4] = 0xff; // @@@@ debug
        if ((filetypebefore&0xf) != VAL_DOSFTYPE_CBM)  {
          deleteblockchain(legacyHDOSstate,
                           drive, dirtrack, ds->track, ds->sector);
        } else {
          // remove 40 more sectors because the dirent track is not in size:
          for (s = 0; s < (ds->size + 40); s++)  {
            BAMSectorUpdate(BAMsector[0], BAMsector[1],
                            ds->track + (s / 40), ds->sector + (s % 40), 0); // 0=free up
// basepage[3] = ds->track + (s / 40);  // @@@@ debug
// basepage[4] = ds->sector + (s % 40); // @@@@ debug
          }
// basepage[5] = (ds->size + 40) % 256; // @@@@ debug
// basepage[6] = (ds->size + 40) / 256; // @@@@ debug
        }
#ifdef DEBUG
        msprintf("deletedirententry done");
        cputln();
        cgetc();
#endif
        return;
      }
      pos++;
    }

#ifdef DEBUG
    if (ds->track > 0)  {
      mprintf("direntry ", i);
      mh4printf(" is: ", (long) &ds);
      memcpy(dosfilename, ds->name, DOSFILENAMELEN);
      dosfilename[DOSFILENAMELEN] = 0; // proper null termination
      msprintf(" name ");
//        msprintf((char *) dosfilename);
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
//  messagebox(0, "entry not found");
}

void swapdirententry(unsigned char side, unsigned int entry1,
                                         unsigned int entry2)  {
  unsigned int i1;
  unsigned int i2;
  unsigned int pos;
  DIRENT* ds;
  DIRENT* dstemp;
  unsigned int max = ENTRIESPERBLOCK;

  ds = &readdir_dirent->direntryblock[0];
  dstemp = &readdir_dirent->direntryblock[1];

  // These two loops are to search/skip non-del items until the entry 
  // matches:
  for (i1 = 0, pos = 0; i1 < max; i1++)  {
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i1 * DIRENTSIZE,
          (uint32_t) ds, DIRENTSIZE);

    if (ds->chntrack > 0)  max += ENTRIESPERBLOCK; // more attic pages
    // if a non-deleted or a SD card file (hence no mask) ?
    if (ds->type != VAL_DOSFTYPE_DEL || (option.option & OPTIONshowDEL))  {
      if (pos == entry1)  { // found
        break;
      }
      pos++;
    }
  }

  for (i2 = 0, pos = 0; i2 < max; i2++)  {
    // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
    lcopy(ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i2 * DIRENTSIZE,
          (uint32_t) ds, DIRENTSIZE);

    if (ds->chntrack > 0)  max += ENTRIESPERBLOCK; // more attic pages
    // if a non-deleted or a SD card file (hence no mask) ?
    if (ds->type != VAL_DOSFTYPE_DEL || (option.option & OPTIONshowDEL))  {
      if (pos == entry2)  { // found
        break;
      }
      pos++;
    }
  }

  // Temporarily dump first dirent into data block not in use. From v0.6.6
  // this is leaving the first two bytes alone which are the blockchain:
  lcopy((ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i1 * DIRENTSIZE) + 2,
        (uint32_t) dstemp, DIRENTSIZE - 2);
  // Copy second one in first:
  lcopy((ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i2 * DIRENTSIZE) + 2,
        (ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i1 * DIRENTSIZE) + 2,
        DIRENTSIZE - 2);
  // Now temporary in second:
  lcopy((uint32_t) dstemp,
        (ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i2 * DIRENTSIZE) + 2,
        DIRENTSIZE - 2);

//  cgetc();
}

// @@@@ this deletes all dirents and completely saves them back as new,
// @@@@ thus should be changed at some point:
void rewritedirent(unsigned char legacyHDOSstate,
                   unsigned char drive, unsigned char side,
                   unsigned char dirtrack,
                   unsigned char firsttrack, unsigned char lasttrack)  {
  unsigned char starttrack;
  unsigned char startsector;

  if (deleteblockchain(legacyHDOSstate, drive, dirtrack,
                       dirtrack, DIRENTSECT))  {
    messagebox(MBOXNOCANCEL, "Updating directory,",
               "fatal error",
               " ", 0);
  } else {
    writeblockchain(legacyHDOSstate,
                    ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE,
                    DIRENTBLOCKS, drive,
                    &starttrack, &startsector,
                    dirtrack, TRUE, firsttrack, lasttrack);
    PutBAM(legacyHDOSstate, drive, side, dirtrack);
  }
}

void renamedisk(unsigned char legacyHDOSstate,
                unsigned char drive, unsigned char side,
                unsigned char dirtrack,
                char* name)  {
  HEADER* hs;
  hs = (HEADER *) worksector[0]; // misuse data sector

  if (GetOneSector(legacyHDOSstate,
                   (BAM *) hs, drive, dirtrack, HEADERSECT) < 2)  {
    strcopy(name, (char *) hs->diskname, 16);
    if (PutOneSector(legacyHDOSstate,
                     (BAM *) hs, drive, dirtrack, HEADERSECT) > 2)  {
      messagebox(MBOXNOCANCEL, "Renaming subpartition,",
                 "write error",
                 " ", 0);
    }
  } else {
    messagebox(MBOXNOCANCEL, "Renaming subpartition,",
               "read error",
               " ", 0);
  }
}

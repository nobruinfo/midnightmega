#include <stdint.h>

#define VAL_DOSFTYPE_DEL 0
#define VAL_DOSFTYPE_SEQ 1
#define VAL_DOSFTYPE_PRG 2
#define VAL_DOSFTYPE_USR 3
#define VAL_DOSFTYPE_REL 4
#define VAL_DOSFTYPE_CBM 5

/* now in hyppo.h:
#define DOSFILENAMELEN 16  // dirent DOS file name with no null termination
*/
#define DOSFILENAMEANDTYPELEN 40  // dirent output string with no null termination

#define LEFTSIDE 0
#define RIGHTSIDE 1
#define ENTRIESPERBLOCK 8 // nbr of entries on disk block
#define DIRENTBLOCKS 31   // nbr of dirent pages in attic @@@@ would be 37
                          // @@@@  possible, but 32 * 8 exceeds a byte full
#define NBRENTRIES (DIRENTBLOCKS * ENTRIESPERBLOCK) // nbr of GUI entries
/* now in hyppo.h:
typedef struct structdirent {
  unsigned char chntrack;
  unsigned char chnsector;
  unsigned char type;
  unsigned char track;
  unsigned char sector;
           char name[DOSFILENAMELEN]; // File name in PetSCII, limited to 16 chars
  unsigned char dummy[9];  // see bytes $15..$1D of
                           // http://justsolve.archiveteam.org/wiki/GEOS_VLIR
  unsigned int  size;      // in blocks, also for subpartitions
  unsigned char access;
} DIRENT;
*/
/* @@@@ no longer needed:
typedef struct structsectdirent {
  DIRENT entry[ENTRIESPERBLOCK];
} SECTDIRENT;
extern SECTDIRENT * direntryblock[2];
*/
#define DIRFLAGSisselected 1

typedef struct structDIRFLAGS {
  unsigned char flags;     // see defines above
} DIRFLAGS; // for each of the two sides of the file navi
extern DIRFLAGS direntflags[2][NBRENTRIES];
// eight entries per single block:

#define BLOCKSIZE 0x100UL  // regions.h needs unsigned long
#define DIRENTSIZE 32

typedef struct structBAMentry {
  unsigned char free;
  unsigned char alloc1;
  unsigned char alloc2;
  unsigned char alloc3;
  unsigned char alloc4;
  unsigned char alloc5;
} BAMentry;

typedef struct structBAM {
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
#define BAMBLOCKS    2   // nbr of BAM pages in attic

typedef struct structHEADER {
  unsigned char chntrack;
  unsigned char chnsector;
  unsigned char diskdosversion; // $44
  unsigned char unused;
           char diskname[DOSFILENAMELEN]; // name in PetSCII, limited to 16 chars
  unsigned char unused1;  // $a0
  unsigned char unused2;  // $a0
  unsigned char diskid1;
  unsigned char diskid2;
  unsigned char unused3;  // $a0
  unsigned char dosversion; // $19
  unsigned char diskversion; // $1a
  unsigned char unused4;  // $a0
  unsigned char unused5;  // $a0
  unsigned char dummy[227];
} HEADER;

// 3160 is the usable space for data, 3200 to copy whole disks
#define DATABLOCKS 3200 // 199   // nbr of file data pages in attic
typedef struct structdatablock {
  unsigned char chntrack;
  unsigned char chnsector;
  unsigned char data[254];
} DATABLOCK;

#define HEADERTRACK 40
#define HEADERSECT   0
#define BAMTRACK    40
#define BAMSECT      1
#define DIRENTTRACK 40
#define DIRENTSECT   3
#define FIRSTTRACK   1
#define LASTTRACK   80

// Midnight Mega general setup options:
#define OPTIONshowDEL 1  // show deleted files as type DEL
#define OPTIONshowALO 2  // copy allocated BAM blocks only
#define OPTIONshowDRV 4
#define OPTIONshow4   8
#define OPTIONshow5   0x10
#define OPTIONMAX     4
typedef struct structOPTION {
  unsigned char option;    // bitwise flags
} OPTION;
extern OPTION option;

void _miniInit();
void GetBAM(unsigned char legacyHDOSstate, unsigned char side);
void PutBAM(unsigned char legacyHDOSstate,
            unsigned char drive, unsigned char side, unsigned char dirtrack);
unsigned char BAM2Attic(unsigned char legacyHDOSstate, unsigned char drive,
                        unsigned char side, unsigned char dirtrack);
void BAMSectorUpdate(BAM* BAMsector, BAM* BAMsector2, char track, char sector, char set);
void FormatPartition(unsigned char legacyHDOSstate,
                     unsigned char drive, unsigned char side,
                     unsigned char dirtrack,
                     unsigned char firsttrack, unsigned char lasttrack,
                     char* name);
unsigned int FreeBlocks(unsigned char legacyHDOSstate,
                        unsigned char drive, unsigned char dirtrack,
                        unsigned char firsttrack, unsigned char lasttrack);
unsigned char FreeTracks(unsigned char legacyHDOSstate,
                         unsigned char side,
                         unsigned char firsttrack, unsigned char lasttrack,
                         unsigned char * starttrack, unsigned char * endtrack,
                         unsigned char nboftracks);
unsigned int BAMCheckSizeinFilebuffer(unsigned char legacyHDOSstate,
                                      unsigned char drive, unsigned char side,
                                      unsigned char dirtrack,
                                      unsigned char firsttrack,
                                      unsigned char lasttrack);
void BAMAllocateTracks(unsigned char legacyHDOSstate, unsigned char side,
                       unsigned char starttrack, unsigned char endtrack);
void getDiskname(unsigned char legacyHDOSstate, unsigned char drive,
                 unsigned char dirtrack, char* diskname);
unsigned char readblockchain(unsigned char legacyHDOSstate,
                             uint32_t destination_address, // attic RAM
                             unsigned int maxblocks, unsigned char drive,
                             unsigned char track, unsigned char sector);
void findnextBAMtracksector(unsigned char * nexttrack, unsigned char * nextsector,
                     unsigned char track40, unsigned char dirtrack,
                     unsigned char firsttrack, unsigned char lasttrack);
void writeblockchain(unsigned char legacyHDOSstate,
                     uint32_t source_address, // attic RAM
                     unsigned int maxblocks, unsigned char drive,
                     unsigned char * starttrack, unsigned char * startsector,
                     unsigned char dirtrack,
                     unsigned char firsttrack, unsigned char lasttrack);
unsigned char deleteblockchain(unsigned char legacyHDOSstate,
                               unsigned char drive, unsigned char dirtrack,
                               unsigned char track, unsigned char sector);
unsigned char copywholedisk(unsigned char legacyHDOSstate,
                            unsigned char srcdrive, unsigned char destdrive,
                            unsigned char side);
unsigned char gettype(unsigned char type, unsigned char * s, unsigned char i);
DIRENT* getdirententry(unsigned char side, unsigned int entry);
unsigned char getdirent(unsigned char legacyHDOSstate, unsigned char drive,
                        unsigned char side, unsigned char dirtrack);
void writenewdirententry(unsigned char legacyHDOSstate,
                         unsigned char drive, unsigned char side,
                         unsigned char dirtrack,
                         unsigned char firsttrack, unsigned char lasttrack,
                         DIRENT* newds);
void deletedirententry(unsigned char legacyHDOSstate,
                       unsigned char drive, unsigned char side,
                       unsigned char dirtrack,  unsigned char entry);

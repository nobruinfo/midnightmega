#include <stdint.h>

#define VAL_DOSFTYPE_DEL 0
#define VAL_DOSFTYPE_SEQ 1
#define VAL_DOSFTYPE_PRG 2
#define VAL_DOSFTYPE_USR 3
#define VAL_DOSFTYPE_REL 4
#define VAL_DOSFTYPE_CBM 5

#define DOSFILENAMELEN 16  // dirent DOS file name with no null termination
#define DOSFILENAMEANDTYPELEN 40  // dirent output string with no null termination

#define LEFTSIDE 0
#define RIGHTSIDE 1
#define ENTRIESPERBLOCK 8 // nbr of entries on disk block
#define DIRENTBLOCKS 14    // nbr of dirent pages in attic
#define NBRENTRIES (DIRENTBLOCKS * ENTRIESPERBLOCK) // nbr of GUI entries
typedef struct structdirent {
	unsigned char chntrack;
	unsigned char chnsector;
    unsigned char type;
	unsigned char track;
	unsigned char sector;
             char name[DOSFILENAMELEN]; /* File name in PetSCII, limited to 16 chars */
	unsigned char dummy[9];
    unsigned int  size;
    unsigned char access;
} DIRENT;
typedef struct structsectdirent {
	DIRENT entry[ENTRIESPERBLOCK];
} SECTDIRENT;

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
             char diskname[DOSFILENAMELEN]; /* name in PetSCII, limited to 16 chars */
	unsigned char unused1;
	unsigned char unused2;
	unsigned char diskid;
	unsigned char unused3;
    unsigned char dosversion; // $19
    unsigned char diskversion; // $1a
	unsigned char unused4;
	unsigned char unused5;
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
#define BAMTRACK 40
#define BAMSECT   1
#define DIRENTTRACK 40
#define DIRENTSECT   3

void GetBAM(unsigned char side);
void PutBAM(unsigned char drive, unsigned char side);
void BAM2Attic(unsigned char drive, unsigned char side);
void BAMSectorUpdate(BAM* BAMsector, BAM* BAMsector2, char track, char sector, char set);
unsigned int FreeBlocks(unsigned char drive);
void getDiskname(unsigned char drive, char* diskname);
void readblockchain(uint32_t destination_address, // attic RAM
                    unsigned int maxblocks, unsigned char drive,
                    unsigned char track, unsigned char sector);
void BAM2Attic(unsigned char drive, unsigned char side);
void findnextBAMtracksector(unsigned char * nexttrack, unsigned char * nextsector,
                            unsigned char track40);
void writeblockchain(uint32_t source_address, // attic RAM
                    unsigned int maxblocks, unsigned char drive,
					unsigned char * starttrack, unsigned char * startsector);
void deleteblockchain(unsigned char drive,
                      unsigned char track, unsigned char sector);
void copywholedisk(unsigned char srcdrive, unsigned char destdrive);
unsigned char gettype(unsigned char type, unsigned char * s, unsigned char i);
DIRENT* getdirententry(unsigned char side, unsigned char entry);
unsigned char getdirent(unsigned char drive, unsigned char side);
void writenewdirententry(unsigned char drive, unsigned char side, DIRENT* newds);
void deletedirententry(unsigned char drive, unsigned char side, unsigned char entry);

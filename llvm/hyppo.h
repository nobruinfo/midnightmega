// *********************************************************
// ***  hyppo.h abstraction to hyppo mount handling      ***
// *********************************************************

// please be aware the following structures are the same RAM page:
struct HYPPOFILENAME {
	char name[65];
	char sfn[65];
	unsigned char dummy[256-65-65];  // blown up to fill a whole page
};
struct TASKBLOCK {  // big book page #39b
    char taskID;
	char taskname[16];
	char d81flags0;
	char d81flags1;
	char d81filenamelength0;
	char d81filenamelength1;
	char d81filename0[32];
	char d81filename1[32];
	unsigned char notimplemented[256-32-32-16-5];
};                                   // blown up to fill a whole page

#define DOSFILENAMELEN 16  // dirent DOS file name with no null termination

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

#define LFNFILENAMELEN 64
#define LFNENTRIESPERBLOCK 4 // nbr of entries on disk block
#define LFNBLOCKS 14    // nbr of dirent pages in attic
#define LFNNBRENTRIES (LFNBLOCKS * LFNENTRIESPERBLOCK) // nbr of GUI entries
typedef struct structlfn {
  char name[LFNFILENAMELEN]; // no termination
} LFNENTRY;
typedef struct structsectlfn {
  LFNENTRY entry[LFNENTRIESPERBLOCK];
} SECTLFN;

#define HYPPODIRENTATTRRO  0x01
#define HYPPODIRENTATTRHID 0x02
#define HYPPODIRENTATTRSYS 0x04
#define HYPPODIRENTATTRVOL 0x08
#define HYPPODIRENTATTRDIR 0x10
#define HYPPODIRENTATTRARC 0x20
#define HYPPODIRENTATTR    0x40 // denotes the type being from storage card
struct HYPPODIRENT {
	char lfn[LFNFILENAMELEN];    // The long file name
	char length;      // The length of long file name
	char sfn[8];      // The short file name without the extension
	char ext[3];      // The extension
	char res[2];      // unused
	unsigned long clusternumber; // The cluster number where the file
	                             // begins. For sub-directories, this
								 // is where the FAT dir entries start
								 // for that sub-directory
	unsigned long size; // The length of file in bytes
	char attr;        // The type and attribute bits:
					  // Bit Meaning if bit is set
					  // 0   Read only
					  // 1   Hidden
					  // 2   System
					  // 3   Volume label
					  // 4   Sub-directory
					  // 5   Archive
	unsigned char dummy[256-87-64];  // blown up to fill a whole page
	DIRENT direntryblock[2];
};

extern struct HYPPODIRENT *const readdir_dirent;

extern struct TASKBLOCK* const taskblock;

unsigned char hyppo_setup_transfer_area(void);
unsigned char hyppo_get_proc_desc(void);
unsigned char hyppo_getcurrentdrive(void);
unsigned char hyppo_selectdrive(unsigned char nb);
unsigned char hyppo_setname(char *filename);

/* dos_attach (probably $4A)
dos_attach:
        ;; NEW CALL DOS 1.3
        ;;
        ;; handles both attaching and detaching images and real drives
        ;;
        ;; X.0 - DRVNUM  select drive 0 or 1
        ;; X.1 - BOTHDRV (MODE=detach) selects both drives
        ;; X.6 - NOREAL  (MODE=detach) don't attach real drive if set
        ;; X.7 - MODE    select mode 0 - attach, 1 - detach

Preconditions: The current Hyppo filename has been set using
        hyppo_setname (only for mount).
unsigned char hyppo_d81attach0(void);
unsigned char hyppo_d81attach1(void);
unsigned char hyppo_d81detach(void);
*/
unsigned char hyppo_dos_attach(unsigned char mountbits);
unsigned char hyppo_opendir(void);
unsigned char hyppo_chdir(void);
unsigned char hyppo_closedir(unsigned char filedescriptor);
unsigned char hyppo_readdir(unsigned char filedescriptor);
unsigned char hyppo_findfirst(void);
unsigned char hyppo_openfile(unsigned char filedescriptor);
unsigned char hyppo_readfile(unsigned char filedescriptor);
unsigned char hyppo_closefile(unsigned char filedescriptor);
unsigned char hyppo_rmfile(unsigned char filedescriptor);
char * getsfn();
char * getlfn();
unsigned char getallhyppoentries(unsigned char drive, unsigned char side,
                                 unsigned char maxentries);
unsigned char gethyppodirent(unsigned char drive, unsigned char side,
                             unsigned char maxentries);
void hyppo_reset(void);
void hyppo_freeze_self(void);
// void hyppo_getversion(unsigned char * majorhyppo, unsigned char * minorhyppo,
//                       unsigned char * majorHDOS,  unsigned char * minorHDOS);
void hyppo_getversion(void);

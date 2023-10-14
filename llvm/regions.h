// *********************************************************
// ***  regions.h additional RAM pages management        ***
// *********************************************************

// mega65-book.pdf#7a states:
// 0.1600 0.1EFF Free for program use

#define BLOCKBAMLOW    0x1600  // double sector buffers for BAM and data.
#define BLOCKBAMHIGH   0x1700
#define BLOCKDATALOW   0x1800
#define BLOCKDATAHIGH  0x1900  // @@ no longer needed

#define DIRENTPAGELOW  0x1A00  // used by DOS and Hyppo
#define DIRENTPAGEHIGH 0x1B00
#define FILENAMEPAGE   0x1C00  // used by nav

#define MIDNIGHTLEFTPAGE   0x1D00  // used by nav
#define MIDNIGHTRIGHTPAGE  0x1E00

// visit the attic mega65-book.pdf#229

#define ATTIC         0x8000000UL

#define ATTICDIRENTBUFFER (ATTIC + 0)
#define ATTICDIRENTSIZE (DIRENTBLOCKS * BLOCKSIZE)  // allocated twice:

//                    0x8000E00

#define ATTICDIRENT2NDBUFFER (ATTICDIRENTBUFFER + ATTICDIRENTSIZE)

//                    0x8001C00

#define ATTICBAMBUFFER (ATTICDIRENT2NDBUFFER + ATTICDIRENTSIZE)
#define ATTICBAMBUFFERSIZE (BAMBLOCKS * BLOCKSIZE)

//                    0x8001E00

#define ATTICBAM2BUFFER (ATTICBAMBUFFER + ATTICBAMBUFFERSIZE)

//                    0x8002000

#define ATTICFILEBUFFER (ATTICBAM2BUFFER + ATTICBAMBUFFERSIZE)
#define ATTICFILEBUFFERSIZE (DATABLOCKS * BLOCKSIZE)

//                    0x800E700

#define ATTICZPBACKUP (ATTICFILEBUFFER + ATTICFILEBUFFERSIZE)
#define ATTICZPBACKUPSIZE (BLOCKSIZE)

//                    0x800E800

#define ATTICEND (ATTICZPBACKUP + ATTICZPBACKUPSIZE)

// llvm does not evaluate this, error is not fired:
#if (ATTICEND > 0x8001000UL) // 0x87FFFFFUL)
  #error attic RAM allocation exceeded!
#endif

// *********************************************************
// ***  regions.h additional RAM pages management        ***
// *********************************************************

// mega65-book.pdf#7a states:
// 0.1600 0.1EFF Free for program use

#define BLOCKBAMLOW    0x1600  // double sector buffers for BAM and data.
#define BLOCKBAMHIGH   0x1700
#define BLOCKDATALOW   0x1800
#define BLOCKDATAHIGH  0x1900

#define DIRENTPAGELOW  0x1A00  // used by DOS and Hyppo
#define DIRENTPAGEHIGH 0x1B00
#define FILENAMEPAGE   0x1C00  // used by nav

#define MIDNIGHTLEFTPAGE   0x1D00  // used by nav
#define MIDNIGHTRIGHTPAGE  0x1E00

// visit the attic mega65-book.pdf#229

#define ATTIC         0x8000000UL

#define ATTICDIRENTBUFFER (ATTIC + 0)
#define ATTICDIRENTSIZE (DIRENTBLOCKS * BLOCKSIZE)

//   800:0e00         0x8000e00

#define ATTICBAMBUFFER (ATTICDIRENTBUFFER + ATTICDIRENTSIZE)
#define ATTICBAMBUFFERSIZE (BAMBLOCKS * BLOCKSIZE)

//   800:1000         0x8001000

#define ATTICFILEBUFFER (ATTICBAMBUFFER + ATTICBAMBUFFERSIZE)
#define ATTICFILEBUFFERSIZE (DATABLOCKS * BLOCKSIZE)

//   800:D700         0x800D700

#define ATTICZPBACKUP (ATTICFILEBUFFER + ATTICFILEBUFFERSIZE)
#define ATTICZPBACKUPSIZE (BLOCKSIZE)

//   800:D800         0x800D800

#define ATTICEND (ATTICZPBACKUP + ATTICZPBACKUPSIZE)

// llvm does not evaluate this, error is not fired:
#if (ATTICEND > 0x8001000UL)
  #error attic RAM allocation exceeded!
#endif

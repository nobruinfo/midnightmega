// *********************************************************
// ***  regions.h additional RAM pages management        ***
// *********************************************************

// mega65-book.pdf#7a states:
// 0.1600 0.1EFF Free for program use

#define BASEPAGERESERVED 0x1600
#define BLOCKBAMLOW    0x1700  // double sector buffers for BAM and data.
#define BLOCKBAMHIGH   0x1800
#define BLOCKDATALOW   0x1900
#define BLOCKDATAHIGH  0x1A00

#define BLOCKDIRENT    0x1B00  // used by DOS and Hyppo
// #define DIRENT_PAGEHIGH 0x1B00  // @@ no longer needed
#define FILENAMEPAGE   0x1C00  // used by nav

#define MIDNIGHTLEFTPAGE   0x1D00  // used by nav
#define MIDNIGHTRIGHTPAGE  0x1E00

// visit the attic mega65-book.pdf#229

#define ATTIC         0x8000000UL

#define ATTICDIRENTBUFFER (ATTIC + 0)
#define ATTICDIRENTSIZE (DIRENTBLOCKS * BLOCKSIZE)  // allocated twice:

//                    0x8002500   0x8000E00

#define ATTICDIRENT2NDBUFFER (ATTICDIRENTBUFFER + ATTICDIRENTSIZE)

//                    0x8007400   0x8001C00

#define ATTICLFNBUFFER (ATTICDIRENT2NDBUFFER + ATTICDIRENTSIZE)
#define ATTICLFNBUFFERSIZE (LFNBLOCKS * BLOCKSIZE)

//                    0x800CC00   0x8003000

#define ATTICLFNBUFFER2 (ATTICLFNBUFFER + ATTICLFNBUFFERSIZE)

//                    0x800E000   0x8004400

#define ATTICBAMBUFFER (ATTICLFNBUFFER2 + ATTICLFNBUFFERSIZE)
#define ATTICBAMBUFFERSIZE (BAMBLOCKS * BLOCKSIZE)

//                    0x800E200   0x8004600

#define ATTICBAM2BUFFER (ATTICBAMBUFFER + ATTICBAMBUFFERSIZE)

//                    0x800E400   0x8004800

#define ATTICFILEBUFFER (ATTICBAM2BUFFER + ATTICBAMBUFFERSIZE)
#define ATTICFILEBUFFERSIZE (DATABLOCKS * BLOCKSIZE)

//                    0x80D6400   0x80CC800

#define ATTICTEXTBUFFER (ATTICFILEBUFFER + ATTICFILEBUFFERSIZE)
#define ATTICTEXTBUFFERSIZE (TEXTBLOCKS * BLOCKSIZE)

//                    0x80D9600   0x80CFA00

#define ATTICZPBACKUP (ATTICTEXTBUFFER + ATTICTEXTBUFFERSIZE)
#define ATTICZPBACKUPSIZE (BLOCKSIZE)

//                    0x80CFB00   0x80CFB00

#define ATTICEND (ATTICZPBACKUP + ATTICZPBACKUPSIZE)

// llvm does not evaluate this, error is not fired:
#if (ATTICEND > 0x8001000UL) // 0x87FFFFFUL)
  #error attic RAM allocation exceeded!
#endif

// *********************************************************
// ***  regions.h additional RAM pages management        ***
// *********************************************************

// mega65-book.pdf#7a states:
// 0.1600 0.1EFF Free for program use

#define BLOCKBAMLOW   0x1600  // double sector buffers for BAM and data.
#define BLOCKBAMHIGH  0x1700
#define BLOCKDATALOW  0x1800
#define BLOCKDATAHIGH 0x1900

#define DIRENTPAGE    0x1A00
#define FILENAMEPAGE  0x1B00

#define INPUTSTRPAGE  0x1C00

// visit the attic

#define ATTIC         0x8000000
#define ATTICFILEBUFFER (ATTIC + 0)

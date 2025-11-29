// *********************************************************
// ***  filekernel.h Midnight Mega's kernel file I/O     ***
// *********************************************************

extern unsigned char lfnname[LFNFILENAMELEN]; // @@@@@

void checkerrorchannel(unsigned char drive, char* msg);
unsigned char readtracksector(BAM* entry, unsigned char drive,
                              unsigned char track, unsigned char sector);
unsigned char writetracksector(BAM* entry, unsigned char drive,
                               unsigned char track, unsigned char sector);

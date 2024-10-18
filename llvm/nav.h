// *********************************************************
// ***  nav.h Midnight Mega's window mgmt                ***
// *********************************************************

// read mount state of real hardware floppy drives:
#define D6A1_USEREAL0 1
#define D6A1_USEREAL1 4

#define MIDNIGHTFLAGismounted 1

typedef struct structMIDNIGHT {
  unsigned char drive;     // 0 or 1
  unsigned char pos;       // cursor bar
  unsigned char entries;   // nbr of list entries
  unsigned char curfile[65];  // currently mounted .d81 filename
  unsigned int  blocksfree;
  unsigned char flags;     // see defines above
  unsigned char dirtrack;  // BAM/dirent track for current partition
  unsigned char dummy3;
  unsigned char inputstr[80];  // for conio text input
} MIDNIGHT; // for each of the two sides of the file navi

void listboxd81(unsigned char x, unsigned char y,
                unsigned char currentitem, unsigned char nbritems);
void listbox(unsigned char iscurrent, unsigned char side,
             unsigned char x, unsigned char y,
             unsigned char currentitem, unsigned char nbritems);
void shortcuts(unsigned char mod, unsigned char side);
unsigned char d81navi(unsigned char drive, unsigned char side);
void navi(unsigned char side);

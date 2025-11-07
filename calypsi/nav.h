// *********************************************************
// ***  nav.h Midnight Mega's window mgmt                ***
// *********************************************************

// read mount state of real hardware floppy drives:
#define D6A1_USEREAL0 1
#define D6A1_USEREAL1 4
// image in drive used, 0 if real drive:
#define D68B_IMG1     8
// real drive media present:
#define D68B_D1P     16

#define MIDNIGHTFLAGismounted     1
#define MIDNIGHTFLAGdirsortactive 2

typedef struct structMIDNIGHT {
  unsigned char drive;      // 0 or 1
  unsigned char pos;        // cursor bar
  unsigned char entries;    // nbr of list entries
  unsigned char curfile[65];  // currently mounted .d81 filename
  unsigned int  blocksfree;
  unsigned char flags;      // see defines above
  unsigned char dirtrack;   // BAM/dirent track for current partition
  unsigned char firsttrack; // relevant for subdirs
  unsigned char lasttrack;
  unsigned char inputstr[80];  // for conio text input
} MIDNIGHT; // for each of the two sides of the file navi

// Midnight Mega general menu:
#define MENUMAX     2

void listboxd81(unsigned char x, unsigned char y,
                unsigned char currentitem, unsigned char nbritems);
void listbox(unsigned char iscurrent, unsigned char side,
             unsigned char x, unsigned char y,
             unsigned char currentitem, unsigned char nbritems);
void shortcuts(unsigned char mod, unsigned char side);
void UpdateSectors(unsigned char drive, unsigned char side);
void navi(unsigned char side);

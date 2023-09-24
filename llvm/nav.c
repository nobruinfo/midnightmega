#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <mega65/conio.h>  // llvm instead of <printf.h>
#include <mega65/memory.h>  // mega65-libc
#include "regions.h"
#include "conioextensions.h"
#include "hyppo.h"
#include "fileio.h"

// *********************************************************
// ***  nav.c Midnight Mega's window mgmt                ***
// *********************************************************

// flags and stuff:
MIDNIGHT* midnight[2] = { (MIDNIGHT*) MIDNIGHTLEFTPAGE,
                          (MIDNIGHT*) MIDNIGHTRIGHTPAGE };

#define FILEENTRIES 18
unsigned char filelist[FILEENTRIES][65];

void listboxd81(unsigned char x, unsigned char y,
             unsigned char currentitem, unsigned char nbritems)  {
  unsigned int n;

  for (n = 0; n < FILEENTRIES; n++)  {
	if (filelist[n][0] == 0)  break;
	if (n == currentitem)  revers(1);
	else                   revers(0);
	cputsxy(x, y + n, filelist[n]);
  }
  revers(0);
  cputln();
}

unsigned char getd81(void)  {
  unsigned char i;
  unsigned char curdrv = 0;
  unsigned char fd = 0xff;
  unsigned char readerr = 0xff;
  unsigned char entries = 0;

  curdrv = hyppo_getcurrentdrive();

  if (curdrv < 0xff)  {
    fd = hyppo_opendir();

    if (fd != 0x84 && fd != 0x87 && fd != 0xff) {
      readerr = 0;
      for (i = 0; i < FILEENTRIES; i++)  {
        readerr = hyppo_readdir(fd);
        if (readerr != 0x85 && readerr != 0xff) {
          msprintfd("filename is: ");
          msprintfd(getsfn()); // already null terminated
		  cputlnd();
		  strcpy((char *) filelist[i], getlfn());
		  entries++;
        }
		else  {
		  filelist[i][0] = 32; filelist[i][1] = 0;
		}
	  }
	  hyppo_closedir(fd);
	}
  }
  return entries;
}

#define DIRENTENTRIES 22
unsigned char s[DOSFILENAMEANDTYPELEN];
void listbox(unsigned char x, unsigned char y,
             unsigned char currentitem, unsigned char nbritems)  {
  unsigned int n;
  unsigned char i;
  unsigned char j;
  unsigned int ofs = 0;
  DIRENT* ds;

  if (currentitem + 1 >= DIRENTENTRIES)  ofs = currentitem + 1 - DIRENTENTRIES;

  for (n = 0 ; n < DIRENTENTRIES; n++)  {
	ds = getdirententry(n + ofs);
	if (ds == NULL)  break;

	i = 0;
	if (n + ofs == currentitem)  s[i++] = '>';
	else                   s[i++] = ' ';
	s[i++] = ' ';
	j = 0;
	while (ds->name[j] != 0xa0 && j < DOSFILENAMELEN)  {
	  s[i++] = ds->name[j];
	  j++;
	}
	for ( ; j < DOSFILENAMELEN; j++)  s[i++] = ' ';
	s[i++] = ' ';
	s[i++] = 93; // '|';
	s[i++] = ' ';
	i = gettype(ds->type, s, i);
	s[i++] = ' ';
	s[i++] = 93; // '|';
	s[i++] = ' ';
	
	s[i++] = 0;
	if (n + ofs == currentitem)  revers(1);
	else                   revers(0);
	cputsxy(x, y + n, s);  // print what we've got so far
	// i = i + sprintf((char*) &s[i], "%4d", ds->size);
	csputdec(ds->size, 5, 0);
	cputc(' '); // s[i++] = ' ';
	if (n + ofs == currentitem)  cputc('<'); // s[i++] = '<';
	else                   cputc(' '); // s[i++] = ' ';
//	s[i++] = 0;

//	if (n + ofs == currentitem)  revers(1);
//	else                   revers(0);
//	cputsxy(x, y + n, s);
  }
  revers(0);
  cputln();
}

unsigned char d81navi(unsigned char side)  {
  char c;
  char pos = 0;
  unsigned char entries = 0;
  unsigned char attachresult;

  entries = getd81();
  while (1)  {
    if (pos >= entries || filelist[pos][0] == 0)  pos = 0;
    mcbox(8, 3, 8 + 65, 3 + 20, COLOUR_CYAN, BOX_STYLE_INNER, 1, 1);
    revers(1);
    mcputsxy(12, 3, " Choose disk image file: ");
    revers(0);
    listboxd81(10, 5, pos, entries);
    c = cgetc();
    switch (c) {
	  case 145: // Crsrup
	    if (pos > 0)  pos--;
      break;
	  case 17: // Crsrdown
	    pos++;
      break;

	  case 13: // return
	    // @@ todo choose drive
		hyppo_setname((char *) filelist[pos]);
		attachresult = (midnight[side]->drive ? hyppo_d81attach1() : hyppo_d81attach0());
		if (attachresult != 0)  {
		  messagebox("mount failed");
		  cgetc();
		} else {
		  strcpy((char *) midnight[side]->curfile, (char *) filelist[pos]);
		  return 1;
		}		
      break;

	  case 27:
	    return 0;
      break;
	
	  default:
	    mprintf("val=", c);
    }
  }
  return 0;
}

// unsigned char testtrack;
// unsigned char testsector;
void navi(unsigned char side)  {
  char c;
//  unsigned char pos = 0;
//  unsigned char entries = 0;
  unsigned char leftx;
  unsigned char starttrack;
  unsigned char startsector;
  DIRENT* ds;
  
  // @@ test
  midnight[0]->drive = 0;
  midnight[1]->drive = 1;

  // title of mcbox is .d81 file name, cannot be read at startup:
  strcpy((char *) midnight[0]->curfile, (char *) "already mounted");
  strcpy((char *) midnight[1]->curfile, (char *) "already mounted");
  midnight[side]->entries = getdirent(midnight[side]->drive);
  midnight[side]->pos = 0;
  while (1)  {
    if (midnight[side]->pos > midnight[side]->entries)  {
      midnight[side]->pos = midnight[side]->entries;
	}
	leftx = side * 40;
    mcbox(leftx, 0, leftx + 39, 0 + 23, COLOUR_CYAN, BOX_STYLE_INNER, 1, 0);
    revers(1);
    mcputsxy(leftx + 2, 0, " ");
	msprintf((char *) midnight[side]->curfile);
	cputc(' ');
    revers(0);
    listbox(leftx + 1, 1, midnight[side]->pos, midnight[side]->entries);
    c = cgetc();
    switch (c) {
	  case 145: // Crsrup
	    if (midnight[side]->pos > 0)  midnight[side]->pos--;
      break;
	  case 17: // Crsrdown
	    midnight[side]->pos++;
      break;

	  case 9: // Tab
	    side = (side ? 0 : 1);
		midnight[side]->entries = getdirent(midnight[side]->drive);
      break;

	  case 0xf2: // Modifier and ASC_F1:
	    if (d81navi(side))  midnight[side]->entries = getdirent(midnight[side]->drive);
      break;

	  case 0xf5: // ASC_F5 copy
	  case 0xf8: // Modifier and ASC_F8 delete
        ds = getdirententry(midnight[side]->pos);
/*
		gotoxy(42, 20);
        msprintf("name: ");
        msprintf(ds->name);
        mprintf(" t=", ds->track);
        mprintf(" s=", ds->sector);
        mprintf(" type=", ds->type&0xf);

//		gotoxy(42, 20);
//  mh4printf("ATTICFILEBUFFER 32addr is: ", ATTICFILEBUFFER >> 16);
//  mh4printf(" ", ATTICFILEBUFFER & 0xffff);
		  gotoxy(42, 0);
		  mprintf("before write type=", ds->type);
	  cputln();
	      cgetc();
*/
	    if (c == 0xf5)  {  // copy
		  readblockchain(ATTICFILEBUFFER, DATABLOCKS, midnight[side]->drive,
                         ds->track, ds->sector);
		  writeblockchain(ATTICFILEBUFFER, DATABLOCKS, midnight[side]->drive,
		                  &starttrack, &startsector);
		  ds->track = starttrack;  // recycle src dirent for destination
		  ds->sector = startsector;
//	    ds->type = 
//	    ds->name = "dest";
//	    ds->size = 
//	    ds->access = 
/*
		  gotoxy(42, 0);
		  mprintf("   before newds type=", ds->type);
	  cputln();
	      cgetc();
*/
		  writenewdirententry(midnight[side]->drive, ds);
		} else {  // delete
		  // confirmation box
		  ds->type = VAL_DOSFTYPE_DEL;
		  deletedirententry(midnight[side]->drive, midnight[side]->pos);
		}
		midnight[side]->entries = getdirent(midnight[side]->drive);
      break;

	  case 0x12: // Ctrl-r
		midnight[side]->entries = getdirent(midnight[side]->drive);
      break;

	  case 13: // return
		messagebox("not yet implemented");
		cgetc();
/* DESTRUCTIVE test:
		if (strcmp((char *) midnight[side]->curfile, "already mounted") == 0)  {
		  findnextBAMtracksector(&testtrack, &testsector);
		  gotoxy(42, 0);
		  mprintf("t=", testtrack);
		  mprintf(" s=", testsector);
//	      cgetc();
		}
*/
      break;

	  // case 0xF9: // ASC_F9:
	  case 0xFA: // Modifier and ASC_F9:
	    if (getkeymodstate() == KEYMOD_RSHIFT || getkeymodstate() == KEYMOD_LSHIFT)  {
	      clrhome();
    	  return;
	    }
      break;

//	  case 27:
//	    return;
//    break;
	
	  default:
	    mprintf("val=", c);
		cputc('  ');
    }
  }
}
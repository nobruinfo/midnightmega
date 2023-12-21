#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>
#include <mega65/conio.h>  // llvm instead of <printf.h>
#include <mega65/memory.h>  // mega65-libc
#include "regions.h"
#include "conioextensions.h"
#include "hyppo.h"
#include "fileio.h"
#include "nav.h"
#include "sid.h"

// *********************************************************
// ***  nav.c Midnight Mega's window mgmt                ***
// *********************************************************

// flags and stuff:
MIDNIGHT* midnight[2] = { (MIDNIGHT*) MIDNIGHTLEFTPAGE,
                          (MIDNIGHT*) MIDNIGHTRIGHTPAGE };
unsigned char diskname[2][DOSFILENAMELEN + 1]; // @@ change for pointer

#define FILEENTRIES 32
unsigned char filelist[FILEENTRIES][65];

#define DIRENTPERSCREEN 22
// @@ The in here present recognition of 0xa0 is also in conioextensions.c
// @@ string build-up may be used elsewhere
unsigned char s[DOSFILENAMEANDTYPELEN];
void listbox(unsigned char iscurrent, unsigned char side,
             unsigned char x, unsigned char y,
             unsigned char currentitem, unsigned char nbritems)  {
  unsigned int n;
  unsigned char i;
  unsigned char j;
  unsigned int ofs = 0;
  DIRENT* ds;

  if (currentitem + 1 >= DIRENTPERSCREEN)  ofs = currentitem + 1 - DIRENTPERSCREEN;

  for (n = 0 ; n < DIRENTPERSCREEN; n++)  {
	ds = getdirententry(side, n + ofs);
	if (ds == NULL || (n + ofs) > nbritems)  break;

	i = 0;
	if (n + ofs == currentitem)  s[i++] = '>';
	else                   s[i++] = ' ';
	s[i++] = ' ';
	j = 0;
	while (ds->name[j] != 0xa0 && ds->name[j] != 0 && j < DOSFILENAMELEN)  {
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
	if (ds->type == VAL_DOSFTYPE_DEL)  textcolor (COLOUR_GREY2);
    else                               textcolor (COLOUR_CYAN);
	if ((n + ofs == currentitem) && iscurrent)  revers(1);
	else  revers(0);
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

void shortcutprint(unsigned char active, char* textbefore, char* textafter)  {
  textcolor(COLOUR_WHITE);
  msprintf(textbefore);
  if (active)  textcolor(COLOUR_CYAN);
  else         textcolor(COLOUR_GREY);
  revers(1);
  msprintf(textafter);
  revers(0);
}

void shortcuts(unsigned char mod)  {
  gotoxy(0, 24);

  // MODKEY, with 1 meaning the key was held during the event:
  // Bit 6 Bit 5 Bit 4 Bit 3 Bit 2 Bit 1 Bit 0
  // CAPS  NO    ALT   C=    CTRL  SHIFT SHIFT
  // LOCK  SCROLL                  right left
  if (mod & 20)  {  // Alt or ctrl are masked
	shortcutprint(FALSE, " 1",  "Help  ");
	shortcutprint(FALSE, " 2",  "Mount ");
	shortcutprint(FALSE, " 3",  "View  ");
	shortcutprint(FALSE, " 4",  "Edit  ");
	shortcutprint(FALSE, " 5",  "Copy  ");
	shortcutprint(FALSE, " 6",  "RenMov");
	shortcutprint(FALSE, " 7",  "Mkdir ");
	shortcutprint(FALSE, " 8",  "Delete");
	shortcutprint(FALSE, " 9",  "Menu  ");
	shortcutprint(FALSE, " 10", "Quit ");
  } else if (mod & 8)  {  // MEGA key, C=
	shortcutprint(FALSE, " 1",  "      ");
	shortcutprint(FALSE, " 2",  "      ");
	shortcutprint(FALSE, " 3",  "      ");
	shortcutprint(FALSE, " 4",  "      ");
	shortcutprint(TRUE , " 5",  "DskCpy");
	shortcutprint(FALSE, " 6",  "      ");
	shortcutprint(FALSE, " 7",  "      ");
	shortcutprint(FALSE, " 8",  "Format");
	shortcutprint(FALSE, " 9",  "      ");
	shortcutprint(FALSE, " 10", "     ");
  } else if (mod & 3)  {  // either of the shift keys makes next even numbered F key
	shortcutprint( TRUE, " 1",  "Mount ");
	shortcutprint(FALSE, " 2",  "      ");
	shortcutprint(FALSE, " 3",  "Edit  ");
	shortcutprint(FALSE, " 4",  "      ");
	shortcutprint(FALSE, " 5",  "RenMov");
	shortcutprint(FALSE, " 6",  "      ");
	shortcutprint( TRUE, " 7",  "Delete");
	shortcutprint(FALSE, " 8",  "      ");
	shortcutprint( TRUE, " 9",  "Quit  ");
	shortcutprint(FALSE, " 10", "     ");
  } else {
	shortcutprint(FALSE, " 1",  "Help  ");
	shortcutprint( TRUE, " 2",  "Mount ");
	shortcutprint(FALSE, " 3",  "View  ");
	shortcutprint(FALSE, " 4",  "Edit  ");
	shortcutprint( TRUE, " 5",  "Copy  ");
	shortcutprint(FALSE, " 6",  "RenMov");
	shortcutprint(FALSE, " 7",  "Mkdir ");
	shortcutprint( TRUE, " 8",  "Delete");
	shortcutprint( TRUE, " 9",  "Menu  ");
	shortcutprint( TRUE, " 10", "Quit ");
  }

  textcolor(COLOUR_CYAN);
}

void optionstring(unsigned char optionbyte, unsigned char optionbitmask,
                   char* str, unsigned char tabpos, unsigned char pos)  {
  unsigned char i;
  unsigned char j;

	i = 0;
	if (optionbyte & optionbitmask)  s[i++] = '*'; // 81; // 113; // filled o
	else                             s[i++] = 'o'; // 87; // 119; // empty o
	s[i++] = ' ';
	if (tabpos == pos)  s[i++] = '>';
	else                s[i++] = ' ';
	s[i++] = ' ';
	j = 0;
	while (str[j] != 0 && j < DOSFILENAMEANDTYPELEN)  {
	  s[i++] = str[j];
	  j++;
	}
	for ( ; j < DOSFILENAMELEN; j++)  s[i++] = ' ';
	s[i++] = ' ';
	if (tabpos == pos)  s[i++] = '<';
	else                s[i++] = ' ';
	
	s[i++] = 0;
	mcputsxy(12, 6 + pos, (char*) s);
}

unsigned char setupbox()  {
  unsigned char clear = 1;
  unsigned char shadow = 1;
  char c;
  unsigned char tabpos = 0;
  unsigned char bitshifter = 1;

  // Because of the additional messagebox we need to redraw all:
  while(1)  {
    mcbox(10, 4, 70, 20, COLOUR_CYAN, BOX_STYLE_INNER, clear, shadow);
  
    revers(1);
    mcputsxy(14, 4, " Midnight Mega ");
    mcputsxy(31, 4, " Setup ");
    mcputsxy(40, 4, " The MEGA65 file commander ");
    revers(0);

    mcputsxy(23, 16, "Use the spacebar to select/unselect.");
    revers(1);
    mcputsxy(36, 18, "   OK   ");
//  mcputsxy(12, 18, "  Save  ");
//  mcputsxy(60, 18, " Cancel ");
    revers(0);

//  while(1)  {
	if (tabpos > OPTIONMAX)  {
	  tabpos = OPTIONMAX;
	}         // byte           bit                                     pos
    optionstring(option.option, OPTIONshowDEL, "show DEL files", tabpos, 0);
    optionstring(option.option, OPTIONshow2, "goes nowhere and does nothing", tabpos, 1);
    optionstring(option.option, OPTIONshow3, "goes nowhere and does nothing", tabpos, 2);
    optionstring(option.option, OPTIONshow4, "goes nowhere and does nothing", tabpos, 3);
    optionstring(option.option, OPTIONshow5, "goes nowhere and does nothing", tabpos, 4);
    c = cgetc();
    switch (c) {
	  case 0x91: // Crsrup
	  case 0x9d: // Left
	    if (tabpos > 0)  tabpos--;
      break;
	  case 0x11: // Crsrdown
	  case 0x1d: // Right
	    tabpos++;
      break;

	  case ' ':
		option.option ^= (bitshifter << tabpos);
//		valuesbox(0, "opt", "opt=", option.option,
//                        "tabpos=", tabpos);
      break;

	  case 13: // RETURN
	    return TRUE;
      break;

	  case 3:  // STOP
	  case 27: // Esc
        sidbong();
	    messagebox(0, "Currently this option dialog cannot",
                    "be quit unsaved. So use RETURN to",
			        "accept.");
//	    return FALSE;
      break;

	  default:
        sidbong();
//	    mprintf("val=", c);
//		cputc(' ');
      break;
	}
  }
}

unsigned int cgetcalt(void)
{
    unsigned char k;
    unsigned char m, mbefore;
	
	shortcuts(0);
    while ((k = PEEK(0xD610U)) == 0)  {
      m = getkeymodstate();
      if (m != mbefore)  {
        shortcuts(m);
		mbefore = m;
	  }
	}
    POKE(0xD610U, 0);
    gotoxy(0, 0); // @@ To get debug output from top left
    return (m << 8) + k;
}

void UpdateSectors(unsigned char drive, unsigned char side)  {
  unsigned char c;  // build up a string

  if (midnight[side]->flags & MIDNIGHTFLAGismounted)  {
    // This would actually only have to be done once for both drives:
    hyppo_get_proc_desc();
    /*
    // https://stackoverflow.com/questions/1258550/why-should-you-use-strncpy-instead-of-strcpy
    strncpy((char *) midnight[side]->curfile,
            (drive ? (char *) taskblock->d81filename1 : (char *) taskblock->d81filename0),
            (drive ? taskblock->d81filenamelength1 : taskblock->d81filenamelength0));
*/
    if (drive == 0)  {
/*
      strncpy(midnight[side]->curfile,
              taskblock->d81filename0,
              taskblock->d81filenamelength0);
      midnight[side]->curfile[taskblock->d81filenamelength0] = 0;
*/
      c = 0;
      while (taskblock->d81filename0[c] != 0 && c < taskblock->d81filenamelength0)  {
        midnight[side]->curfile[c] = taskblock->d81filename0[c];
        c++;
      }
      midnight[side]->curfile[c] = 0;
    } else {
/*
      strncpy(midnight[side]->curfile,
              taskblock->d81filename1,
              taskblock->d81filenamelength1);
      midnight[side]->curfile[taskblock->d81filenamelength1] = 0;
*/
      c = 0;
      while (taskblock->d81filename1[c] != 0 && c < taskblock->d81filenamelength1)  {
        midnight[side]->curfile[c] = taskblock->d81filename1[c];
        c++;
      }
      midnight[side]->curfile[c] = 0;
    }

    getDiskname(drive, (char *) diskname[side]);
    if (BAM2Attic(drive, side) > 1)  {
	  messagebox(0, "Reading file,", "read error.", " ");
	}
    midnight[side]->blocksfree = FreeBlocks(side);
    midnight[side]->entries = getdirent(drive, side);
  } else {
	strcopy("storage card", (char *) diskname[side], 16);
	strcopy("storage card", (char *) midnight[side]->curfile, 16);
	midnight[side]->blocksfree = UINT_MAX;
    midnight[side]->entries = gethyppodirent(drive, side, FILEENTRIES);
  }
}

// unsigned char testtrack;
// unsigned char testsector;
void navi(unsigned char side)  {
  unsigned int c;
  unsigned char leftx;
  unsigned char starttrack;
  unsigned char startsector;
  unsigned char attachresult;
  unsigned char i;
  DIRENT* ds;
  
  // initialising:
  for (i = 0; i <= 1; i++)  {
    // @@ to be made variable maybe?
    midnight[i]->drive = i;

    // title of mcbox is .d81 file name, cannot be read at startup:
    strcpy((char *) midnight[i]->curfile, (char *) "already mounted");
    midnight[i]->pos = 0;
    midnight[i]->flags |= MIDNIGHTFLAGismounted;
    progress("Initialising...", "reading disk drives", i * 40 + 40);
    UpdateSectors(midnight[i]->drive, i);
  }

  while (1)  {
    for (i = 0; i <= 1; i++)  {
      if (midnight[i]->pos > midnight[i]->entries)  {
        midnight[i]->pos = midnight[i]->entries;
      }
	  leftx = i * 40;
      mcbox(leftx, 0, leftx + 39, 0 + 23, COLOUR_CYAN, BOX_STYLE_INNER, 1, 0);
      revers(1);
      mcputsxy(leftx + 2, 0, " ");  // @@ to be string optimised as in listbox()
	  msprintf((char *) diskname[i]);
	  cputc(' ');
      if ((midnight[i]->flags & MIDNIGHTFLAGismounted) == TRUE)  {
        mcputsxy(wherex() + 1, 0, " ");
        msprintf((char *) midnight[i]->curfile);
	    cputc(' ');
	  }
      mcputsxy(leftx + 2, 23, " drv:");
      csputdec(midnight[i]->drive, 0, 0);
	  if (midnight[i]->entries == 0xff)  {
	    mcputsxy(leftx + 17, 3, " empty ");
		if (side == i)  mcputsxy(leftx + 12, 5, " > F2 to mount < ");
	  } else {
	    cputc(' ');
        if (midnight[i]->blocksfree != UINT_MAX)  {
	      mcputsxy(leftx + 12, 23, " ");
          csputdec(midnight[i]->blocksfree, 0, 0);
	      msprintf(" blocks free ");
	    }
        revers(0);
        listbox((side == i), i, leftx + 1, 1, midnight[i]->pos, midnight[i]->entries);
	  }
	}

    c = cgetcalt();
    bordercolor (COLOUR_BLACK); // to unset red error borders
    switch (c) { // mega65-book.pdf#229
	  case 0x91: // Crsrup
	  case 0x191: // Shift Crsrup
	  case 0x291:
	    if (midnight[side]->pos > 0)  midnight[side]->pos--;
      break;
	  case 0x11: // Crsrdown
	    midnight[side]->pos++;
      break;
	  case 0x9d: // Left
	  case 0x19d:
	  case 0x29d:
	    if (midnight[side]->pos > 10)  midnight[side]->pos -= 10;
		else                           midnight[side]->pos = 0;
      break;
	  case 0x1d: // Right
	    midnight[side]->pos += 10;
      break;

	  case 0x9: // Tab
	  case 0x109:
	  case 0x209:
	    side = (side ? 0 : 1);
//		midnight[side]->entries = getdirent(midnight[side]->drive, side);
      break;

	  case 0xf2: // Modifiers and ASC_F1:
	  case 0x1f2:
	  case 0x2f2:
/*
	    if (d81navi(midnight[side]->drive, side))  {
	      UpdateSectors(midnight[side]->drive, side);
		}
*/
        // Unconditional unmount:
		midnight[side]->flags ^= MIDNIGHTFLAGismounted;
		UpdateSectors(midnight[side]->drive, side);
      break;

	  case 0xf5: // ASC_F5 copy
	  case 0xf8: // Modifiers and ASC_F8 delete
	  case 0x1f8:
	  case 0x2f8:
		if ((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE)  {
		  messagebox(0, "Copying/deleting storage files/folders", "is not supported.", " ");
		} else {
          ds = getdirententry(side, midnight[side]->pos);
	  	  if ((ds->type&0xf) != VAL_DOSFTYPE_CBM && ds->type != VAL_DOSFTYPE_DEL)  {

#ifdef DEBUG
            msprintf("name: ");
            msprintf(ds->name);
            mprintf(" t=", ds->track);
            mprintf(" s=", ds->sector);
            mprintf(" type=", ds->type&0xf);

//  mh4printf("ATTICFILEBUFFER 32addr is: ", ATTICFILEBUFFER >> 16);
//  mh4printf(" ", ATTICFILEBUFFER & 0xffff);
	        cputln();
		    mprintf("before copy/del type=", ds->type);
	        cputln();
	        cgetc();
#endif
            if (c == 0xf5)  {  // copy
              if (ds->size > midnight[side?0:1]->blocksfree)  {
			    messagebox(0, "File copy,", "destination disk space insufficient", " ");
			  } else if (messagebox(0, "File copy,", ds->name,
			             (side ? "from right to left" : "from left to right"))) {
                progress("Reading...", "source file", 20);
			    readblockchain(ATTICFILEBUFFER, DATABLOCKS, midnight[side]->drive,
                               ds->track, ds->sector);
                progress("Reading...", "BAM", 30);
                // write on opposing side disk:
                GetBAM(side?0:1);
                progress("Writing...", "destination file", 40);
                writeblockchain(ATTICFILEBUFFER, DATABLOCKS, midnight[side?0:1]->drive,
		                        &starttrack, &startsector);
                ds->track = starttrack;  // recycle src dirent for destination
		        ds->sector = startsector;

#ifdef DEBUG
		        mprintf("   before newds type=", ds->type);
	            cputln();
	            cgetc();
#endif
                progress("Writing...", "directory", 60);
		        // load opposing side dirent block into Attic:
//		      midnight[side?0:1]->entries = getdirent(midnight[side?0:1]->drive, side?0:1);
		        writenewdirententry(midnight[side?0:1]->drive, side?0:1, ds);
		        // re-read altered dirent on opposing side after entry added:
//		      midnight[side?0:1]->entries = getdirent(midnight[side?0:1]->drive, side?0:1);
                progress("Writing...", "BAM", 80);
		        PutBAM(midnight[side?0:1]->drive, side?0:1);
	            UpdateSectors(midnight[side?0:1]->drive, side?0:1);
			  }
		    } else if (ds->type != VAL_DOSFTYPE_DEL &&  // delete
			           messagebox(0, "File delete,", ds->name,
			                      (side ? "from right side" : "from left side")))  {
              progress("Reading...", "BAM", 20);
              ds->type = VAL_DOSFTYPE_DEL;
              GetBAM(side);
              progress("Writing...", "removing BAM entries", 40);
              deletedirententry(midnight[side]->drive, side, midnight[side]->pos);
              progress("Writing...", "updating BAM", 80);
              PutBAM(midnight[side]->drive, side);
              UpdateSectors(midnight[side]->drive, side);
		    }
		  }
		}
      break;

	  case 0x8f6: // Mega-F5
		if ((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE)  {
		  messagebox(0, "Copying full storage cards", "is not supported.", " ");
		} else {
	      if (messagebox(0, "Disk copy,", "destination disk will be OVERWRITTEN", " "))  {
            copywholedisk(midnight[side]->drive, midnight[side?0:1]->drive);
		    UpdateSectors(midnight[side?0:1]->drive, side?0:1);
		  }
		}
      break;

	  case 0xf9:
	    setupbox();
		progress("Reading...", "BAM", 20);
		UpdateSectors(midnight[side]->drive, side);
		UpdateSectors(midnight[side?0:1]->drive, side?0:1);
      break;

	  case 0x412: // Ctrl-r
	    UpdateSectors(midnight[side]->drive, side);
      break;

	  case 0x5f: // left (for updir)
	  case 3:    // STOP
	  case 27:   // Esc
		if ((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE)  {
          for (i = 0; i <= midnight[side]->entries; i++)  {
		    ds = getdirententry(side, i);
			
		    if ((ds->type & HYPPODIRENTATTRDIR) &&
			    (ds->name[0] == '.' && ds->name[1] == '.'))  {
			  hyppo_setname((char *) ds->name);
			  attachresult = hyppo_chdir();

		      if (attachresult > 0xf)  {  // @@ better error handling in Hyppo reqd
  		        messagebox(0, "Storage card parent directory,", "open failed for",
                           (char *) ds->name);
		      } else {
	            UpdateSectors(midnight[side]->drive, side);
              }
			}
		  }
		}
      break;

	  case 13: // return
        ds = getdirententry(side, midnight[side]->pos);

		if ((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE)  {
		  if (ds->type & HYPPODIRENTATTRDIR)  {
			hyppo_setname((char *) ds->name);
			attachresult = hyppo_chdir();

		    if (attachresult > 0xf)  {  // @@ better error handling in Hyppo reqd
  		      messagebox(0, "Storage card change directory,", "open failed for",
                         (char *) ds->name);
		    } else {
	          UpdateSectors(midnight[side]->drive, side);
            }		
		  } else {
	        // @@ todo: choose drive
		    if (midnight[side]->drive)  {
		      hyppo_setname((char *) ds->name);
		      attachresult = hyppo_d81attach1();
		    } else {
		      hyppo_setname((char *) ds->name);
		      attachresult = hyppo_d81attach0();
		    }
//		hyppo_setname((char *) filelist[pos]);
//		attachresult = (midnight[side]->drive ? hyppo_d81attach1() : hyppo_d81attach0());
		    if (attachresult != 0)  {
		      messagebox(0, "Storage card mounting,", "mount failed for", (char *) ds->name);
		    } else {
		      midnight[side]->flags |= MIDNIGHTFLAGismounted;
	          UpdateSectors(midnight[side]->drive, side);
            }		
		  }
		} else {
		  sidbong();
		  messagebox(0, "This file type/directory", "is not yet implemented.", " ");
		}
      break;

	  case 0x20: // Space
	  case 0x1f: // HELP
	  case 0xf1: // unused F keys
	  case 0x1f1:
	  case 0x2f1:
	  case 0xf3:
	  case 0x1f3:
	  case 0x2f3:
	  case 0xf4:
	  case 0x1f4:
	  case 0x2f4:
	  case 0xf6:
	  case 0x1f6:
	  case 0x2f6:
	  case 0xf7:
	  case 0x1f7:
	  case 0x2f7:
	  case 0x415: // Ctrl-u
        sidbong();
//		messagebox(0, "Some function keys,", "are not yet implemented.", " ");
      break;

	  // case 0xF9: // ASC_F9:
	  case 0xFA: // Modifiers and ASC_F9:
	  case 0x1FA:
	  case 0x2FA:
	    if (getkeymodstate() == KEYMOD_RSHIFT || getkeymodstate() == KEYMOD_LSHIFT)  {
    	  return;
	    }
      break;

	  default:
        sidbong();
//	    mh4printf("val=$", c);
//		cputc(' ');
      break;
   }
  }
}
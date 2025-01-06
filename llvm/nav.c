#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>
#include <mega65/conio.h>  // llvm instead of <printf.h>
#include <mega65/memory.h>  // mega65-libc
#include <mega65/hal.h>  // mega65-libc
#include "regions.h"
#include "conioextensions.h"
#include "hyppo.h"
#include "fileio.h"
#include "texts.h"
#include "romlist.h"
#include "nav.h"
#include "sid.h"

// *********************************************************
// ***  nav.c Midnight Mega's window mgmt                ***
// *********************************************************

// flags and stuff:
// __attribute__((section(".data")))
MIDNIGHT* midnight[2] = { (MIDNIGHT*) MIDNIGHTLEFTPAGE,
                          (MIDNIGHT*) MIDNIGHTRIGHTPAGE };
unsigned char disknames[2][DOSFILENAMELEN + 1]; // @@ change for pointer
unsigned char lfnname[LFNFILENAMELEN];         // @@ change for pointer

#define DIRENTPERSCREEN 22
// @@ The in here present recognition of 0xa0 is also in conioextensions.c
// @@ string build-up may be used elsewhere
unsigned char s[2 * DOSFILENAMEANDTYPELEN]; // @@@@
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
    if (direntflags[side][n + ofs].flags & DIRFLAGSisselected)  textcolor(COLOUR_YELLOW);
    else if (ds->type == VAL_DOSFTYPE_DEL)  textcolor(COLOUR_GREY2);
    else                                    textcolor(COLOUR_CYAN);
    if ((n + ofs == currentitem) && iscurrent)  revers(1);
    else  revers(0);
    cputsxy(x, y + n, s);  // print what we've got so far
    // i = i + sprintf((char*) &s[i], "%4d", ds->size);
    if (ds->size > 0)  {
      csputdec(ds->size, 5, 0);
    } else {
      cputs((unsigned char*) "    ");
    }
    cputc(' '); // s[i++] = ' ';
    if (n + ofs == currentitem)  cputc('<'); // s[i++] = '<';
    else                   cputc(' '); // s[i++] = ' ';
//    s[i++] = 0;

//    if (n + ofs == currentitem)  revers(1);
//    else                   revers(0);
//    cputsxy(x, y + n, s);
    textcolor(COLOUR_CYAN);
    if ((midnight[side]->flags & MIDNIGHTFLAGdirsortactive) &&
        (direntflags[side][n + ofs].flags & DIRFLAGSisselected) &&
        (n + ofs == currentitem))  {
      cputc(' ');
      if (currentitem > 0)         cputc(0x1e);
      if (currentitem < nbritems)  mcputc('v');
//      msprintf(" \x1ev");
    }
  }
  revers(0);  // otherwise last entry selected makes neighbouring frame reversed
//  cputln();
}

void Deselect(unsigned char side)  {
  unsigned int i;

  // deselect all entries:
  for (i = 0; i < NBRENTRIES; i++)  {
    direntflags[side][i].flags &= ~(DIRFLAGSisselected);
  }
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

void shortcuts(unsigned char mod, unsigned char side)  {
  unsigned char width;
  unsigned char height;

  gotoxy(0, 24);
  if (midnight[side]->flags & MIDNIGHTFLAGdirsortactive)  {
    textcolor(COLOUR_YELLOW);
    msprintf("Arrange entries:");
    shortcutprint(TRUE, " \x1e",  "Crsr up");
    shortcutprint(TRUE, " v",  "Crsr down");
    shortcutprint(TRUE, " Space",  "select");
    shortcutprint(TRUE, " STOP",  "abort");
    shortcutprint(TRUE, " RETURN",  "save");

    getscreensize(&width, &height);
//    while (wherex() + 1 < width)  { cputc(' '); }
    lfill(getscreenaddr() + (width * height) - width + wherex(),
          ' ', width - wherex());
    lfill(COLOR_RAM_BASE + + (width * height) - width + wherex(),
          COLOUR_CYAN, width - wherex());
  } else {
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
      shortcutprint(FALSE, " 6",  "Rename"); // "RenMov");
      shortcutprint(FALSE, " 7",  "Mkdir ");
      shortcutprint(FALSE, " 8",  "Delete");
      shortcutprint(FALSE, " 9",  "Menu  ");
      shortcutprint(FALSE, " 10", "Quit ");
    } else if (((mod & 9) == 9) ||
               ((mod & 10) == 10)) {  // MEGA key, C= and any of the shift keys
      shortcutprint(FALSE, " 1",  "      ");
      shortcutprint(FALSE, " 2",  "      ");
      shortcutprint(FALSE, " 3",  "      ");
      shortcutprint(FALSE, " 4",  "      ");
      shortcutprint(FALSE, " 5",  "      ");
      shortcutprint(FALSE, " 6",  "      ");
      shortcutprint(FALSE, " 7",  "      ");
      shortcutprint(FALSE, " 8",  "      ");
      shortcutprint(FALSE, " 9",  "      ");
      shortcutprint(FALSE, " 10", "     ");
    } else if (mod & 8)  {  // MEGA key, C=
      shortcutprint(FALSE, " 1",  "      ");
      shortcutprint(FALSE, " 2",  "      ");
      shortcutprint( TRUE, " 3",  "Freezr");
      shortcutprint(FALSE, " 4",  "      ");
      shortcutprint((midnight[side]->dirtrack == HEADERTRACK),
                           " 5",  "DskCpy");
      shortcutprint(FALSE, " 6",  "      ");
      shortcutprint((midnight[side]->dirtrack == HEADERTRACK),
                           " 7",  "Format");
      shortcutprint(FALSE, " 8",  "      ");
      shortcutprint( TRUE, " 9",  "ROMlst");
      shortcutprint(FALSE, " 10", "     ");
    } else if (mod & 3)  {                   // either of the shift keys makes
      shortcutprint( TRUE, " 1",  "Mount "); // next even numbered F key
      shortcutprint(FALSE, " 2",  "      ");
      shortcutprint(FALSE, " 3",  "Edit  ");
      shortcutprint(FALSE, " 4",  "      ");
      shortcutprint( TRUE, " 5",  "Rename"); // "RenMov");
      shortcutprint(FALSE, " 6",  "      ");
      shortcutprint( TRUE, " 7",  "Delete");
      shortcutprint(FALSE, " 8",  "      ");
      shortcutprint( TRUE, " 9",  "Quit  ");
      shortcutprint(FALSE, " 10", "     ");
    } else {
      shortcutprint( TRUE, " 1",  "Help  ");
      shortcutprint( TRUE, " 2",  "Mount ");
      shortcutprint(FALSE, " 3",  "View  ");
      shortcutprint(FALSE, " 4",  "Edit  ");
      shortcutprint( TRUE, " 5",  "Copy  ");
      shortcutprint( TRUE, " 6",  "Rename"); // "RenMov");
      shortcutprint( TRUE, " 7",  "Mkdir ");
      shortcutprint( TRUE, " 8",  "Delete");
      shortcutprint( TRUE, " 9",  "Menu  ");
      shortcutprint( TRUE, " 10", "Quit ");
    }
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
    }         // byte           bit          2 * DOSFILENAMEANDTYPELEN  pos
    optionstring(option.option, OPTIONshowDEL, "show DEL files", tabpos, 0);
    optionstring(option.option, OPTIONshowALO, "copy allocated BAM blocks only", tabpos, 1);
    optionstring(option.option, OPTIONshowDRV, "show drive access overlay", tabpos, 2);
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
//        valuesbox(0, "opt", "opt=", option.option,
//                        "tabpos=", tabpos);
      break;

      case 13: // RETURN
        return TRUE;
      break;

      case 3:  // STOP
      case 27: // Esc
        sidbong();
        messagebox(MBOXNOCANCEL, "Currently this option dialog cannot",
                                 "be quit unsaved. So use RETURN to",
                                 "accept.", 0);
//        return FALSE;
      break;

      default:
        sidbong();
//        mh4printf("val=", c);
//        cputc(' ');
//        usleep(400000); // microseconds
      break;
    }
  }
}

unsigned char menubox(unsigned char side)  {
  unsigned char clear = 1;
  unsigned char shadow = 1;
  char c;
  unsigned char pos = 0;
  unsigned char ret = FALSE;
  unsigned char i;
  unsigned char drawn = FALSE;

  // Because of the additional messagebox we need to redraw all:
  while(1)  {
    if (!drawn)  {
      mcbox(10, 4, 70, 20, COLOUR_CYAN, BOX_STYLE_INNER, clear, shadow);
    
      revers(1);
      mcputsxy(14, 4, " Midnight Mega ");
      mcputsxy(31, 4, " Menu ");
      mcputsxy(40, 4, " The MEGA65 file commander ");
      mcputsxy(36, 18, "   OK   ");
  //  mcputsxy(12, 18, "  Save  ");
  //  mcputsxy(60, 18, " Cancel ");
      revers(0);
      text(MENUTITLE, TRUE);
//      text(MENUDIRSORT, FALSE);
//      text(MENUSETUP, FALSE);
      drawn = TRUE;
    }

    if (pos >= MENUMAX)  {
      pos = MENUMAX - 1;
    }
    for (i = 0; i < MENUMAX; i++)  {
      if (pos == i)  cputcxy(12, 8 + i, '>');
      else           cputcxy(12, 8 + i, ' ');
    }

    c = cgetc();
    switch (c) {
      case 0x91: // Crsrup
      case 0x9d: // Left
        if (pos > 0)  pos--;
      break;
      case 0x11: // Crsrdown
      case 0x1d: // Right
        pos++;
      break;

      case 13: // RETURN
        switch (pos) {
          case 0:  // dirsort
            if (midnight[side]->flags & MIDNIGHTFLAGismounted)  {
              midnight[side]->flags |= MIDNIGHTFLAGdirsortactive;
              Deselect(side);
              return FALSE;
            } else {
              messagebox(MBOXNOCANCEL, "Directory entry sorting,",
                         "on storage card not possible",
                         " ", 0);
              drawn = FALSE;
            }
          break;
          default:
            ret = setupbox();
            drawn = FALSE;
          break;
        }
        if (ret)  return TRUE;
      break;

      case 3:  // STOP
      case 27: // Esc
        return FALSE;
      break;

      default:
        sidbong();
//        mh4printf("val=", c);
//        cputc(' ');
//        usleep(400000); // microseconds
      break;
    }
  }
}

void helpbegin()  {
  text(HELPBEGIN, TRUE);
  cputcxy(7, 24, ' ');
  // cputs(petsciitoscreencode_s(VERSION));   @@@@
  msprintf(VERSION);
  cputc(' ');
}

unsigned char helpbox()  {
  unsigned char clear = 1;
  unsigned char shadow = 1;
  char c;
  unsigned char page = 0;

  // Because of the additional messagebox we need to redraw all:
  while(1)  {
/*
    mcbox(4, 0, 76, 24, COLOUR_CYAN, BOX_STYLE_INNER, clear, shadow);
  
    revers(1);
    mcputsxy(14, 0, " Midnight Mega ");
    mcputsxy(31, 0, " Help ");
    mcputsxy(40, 0, " The MEGA65 file commander ");
    revers(0);

    mcputsxy(7, 24, " ");
    msprintf(VERSION);
    msprintf(" ");
    mcputsxy(52, 24, " github.com/nobruinfo ");

    revers(1);
    mcputsxy(6,  2, " Ctrl ");
    revers(0);
    msprintf(" ");
    revers(1);
    msprintf(" r ");
    revers(0);
    msprintf(" to rescan current file panel (left or right).");

    mcputsxy(6,  4, "Due to Hypervisor limitations .d81 image files can neither be copied");
    mcputsxy(6,  5, "as a whole nor be created, use ");
    revers(1);
    msprintf(" Mega ");
    revers(0);
    msprintf(" ");
    revers(1);
    msprintf(" F3 ");
    revers(0);
    msprintf(" for the freezer.");

    revers(1);
    mcputsxy(6,  7, " Mega ");
    revers(0);
    msprintf(" ");
    revers(1);
    msprintf(" F5 ");
    revers(0);
    msprintf(" copies all blocks (allocated ones if configured) to");
    mcputsxy(6,  8, "the opposite side, this will ");
    highlight(1);
    msprintf("overwrite");
    highlight(0);
    msprintf(" a whole disk (image)");
    mcputsxy(6,  9, "contents irrevocably.");

    revers(1);
    mcputsxy(6, 11, " ");
    cputc(31);  // left arrow character
    msprintf(" ");
    revers(0);
    msprintf(" in the upper left of your keyboard can be used instead of the");
    revers(1);
    mcputsxy(6, 12, " .. ");
    revers(0);
    msprintf(" directory entry to climb to the parent directory.");

    mcputsxy(6, 14, "Currently the left pane is always drive 0 and the right one drive 1,");
    mcputsxy(6, 15, "a later handling within the same drive is planned allowing you");
    mcputsxy(6, 16, "to copy files within one disk.");

    revers(1);
    mcputsxy(6, 18, " F2 ");
    revers(0);
    msprintf(" (");
    revers(1);
    msprintf(" Shift ");
    revers(0);
    msprintf(" ");
    revers(1);
    msprintf(" F1 ");
    revers(0);

    msprintf(" on the MEGA65 of course) is used for switching");
    mcputsxy(6, 19, "from a mounted .d81 to the selection within the storage card and");
    mcputsxy(6, 20, "back. ");
    revers(1);
    msprintf(" F11 ");
    revers(0);
    msprintf(" unmounts the current side to reach a real floppy drive.");

    revers(1);
    mcputsxy(36, 22, "   OK   ");
    revers(0);
*/

    switch (page) {
      case 1:
        helpbegin();
        text(HELP1, TRUE);
      break;

      case 2:
        helpbegin();
        text(HELP2, TRUE);
      break;

      default:
        helpbegin();
        text(HELP0, TRUE);
      break;
    }

    c = cgetc();
    switch (c) {
      case 0x91: // Crsrup
        if (page > 0)  page--;
      break;
      case 0x11: // Crsrdown
        if (page < HELPMAX)  page++;
      break;

      case ' ':
      case 13: // RETURN
        return TRUE;
      break;

      case 3:  // STOP
      case 27: // Esc
        return FALSE;
      break;

/*        // Testing:
      case 0x1f: // HELP
      case 0xf1: // unused F keys
        clrhome();
        text(0);
        text(1);
        text(2);
        text(3);
        text(4);
        text(5);
        text(6);
        text(7);
        text(8);
        cgetc();
      break;
*/

      default:
        sidbong();
//        mprintf("val=", c);
//        cputc(' ');
      break;
    }
  }
}

// This uses $1703 so has to be called off usage of this memory:
unsigned char legacyHDOS()  {
  unsigned char majorhyppo;
  unsigned char minorhyppo;
  unsigned char majorHDOS;
  unsigned char minorHDOS;

  hyppo_getversion(&majorhyppo, &minorhyppo, &majorHDOS, &minorHDOS);
  if ((((majorhyppo * 100) + minorhyppo) < 102) ||
      (((majorHDOS * 100) + minorHDOS) < 103))  return TRUE;
  else return FALSE;
}

unsigned char rombox()  {
  unsigned char clear = 1;
  unsigned char shadow = 1;
  char c;

  mcbox(4, 4, 75, 20, COLOUR_CYAN, BOX_STYLE_INNER, clear, shadow);

  revers(1);
  mcputsxy(6, 4, " Midnight Mega ");
  mcputsxy(25, 4, " List of ROM files ");
  mcputsxy(47, 4, " The MEGA65 file commander ");
  revers(0);

  mcputsxy(7, 20, " ");
  msprintf(VERSION);
  msprintf(" ");
  mcputsxy(52, 20, " github.com/nobruinfo ");

  romlist(6);

  while(1)  {
    c = cgetc();
    switch (c) {
      case ' ':
      case 13: // RETURN
        return TRUE;
      break;

      case 3:  // STOP
       case 27: // Esc
        return FALSE;
      break;

      default:
        sidbong();
//        mprintf("val=", c);
//        cputc(' ');
      break;
    }
  }
}

unsigned int cgetcalt(unsigned char side)
{
    unsigned char k;
    unsigned char m, mbefore;
    
    shortcuts(0, side);
    while ((k = PEEK(0xD610U)) == 0)  {
      m = getkeymodstate();
      if (m != mbefore)  {
        shortcuts(m, side);
        mbefore = m;
      }
    }
    POKE(0xD610U, 0);
    return (m << 8) + k;
}

#define SETHYPPOOFF       0
#define SETHYPPOON        1
#define SETHYPPOONBYERROR 2
unsigned char legacyHDOSstate;
void UpdateSectors(unsigned char drive, unsigned char side)  {
  unsigned char c;  // build up a string
  unsigned char sethyppo;  // failures set "storage selection dirent mode"

  midnight[side]->flags &= (~MIDNIGHTFLAGdirsortactive);

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
* /
      c = 0;
      while (taskblock->d81filename0[c] != 0 && c < taskblock->d81filenamelength0)  {
        midnight[side]->curfile[c] = taskblock->d81filename0[c];
        c++;
      }
      midnight[side]->curfile[c] = 0;
*/
      if (PEEK(0xd6a1) & D6A1_USEREAL0)  {
        strcopy("real drive", (char *) midnight[side]->curfile, DOSFILENAMELEN);
      } else {
        strcopy((char *) taskblock->d81filename0,
                (char *) midnight[side]->curfile,
                taskblock->d81filenamelength0);
      }
    } else {
/*
      strncpy(midnight[side]->curfile,
              taskblock->d81filename1,
              taskblock->d81filenamelength1);
      midnight[side]->curfile[taskblock->d81filenamelength1] = 0;
* /
      c = 0;
      while (taskblock->d81filename1[c] != 0 && c < taskblock->d81filenamelength1)  {
        midnight[side]->curfile[c] = taskblock->d81filename1[c];
        c++;
      }
      midnight[side]->curfile[c] = 0;
*/
      if (PEEK(0xd6a1) & D6A1_USEREAL1)  {
        strcopy("real drive", (char *) midnight[side]->curfile, DOSFILENAMELEN);
      } else {
        strcopy((char *) taskblock->d81filename1,
                (char *) midnight[side]->curfile,
                taskblock->d81filenamelength1);
      }
    }

    getDiskname(legacyHDOSstate,
                drive, midnight[side]->dirtrack, (char *) disknames[side]);
    c = BAM2Attic(legacyHDOSstate, drive, side, midnight[side]->dirtrack);
    if (c > 1)  {
/*
      messagebox(MBOXNUMBER, "Reading BAM error, probably unmounted",
                             (drive ? "drive 1" : "drive 0"),
                             "error=", (long) c);
*/
      midnight[side]->flags &= (~MIDNIGHTFLAGismounted);
      sethyppo = SETHYPPOONBYERROR;
    } else {
      midnight[side]->blocksfree = FreeBlocks(legacyHDOSstate,
                                              side, midnight[side]->dirtrack,
                                              midnight[side]->firsttrack,
                                              midnight[side]->lasttrack);
      midnight[side]->entries = getdirent(legacyHDOSstate, drive, side,
                                          midnight[side]->dirtrack);
      sethyppo = SETHYPPOOFF;
    }
  } else {
    sethyppo = SETHYPPOON;
  }
  
  if (sethyppo != SETHYPPOOFF)  {
    strcopy("storage card", (char *) disknames[side], DOSFILENAMELEN);
    strcopy("storage card", (char *) midnight[side]->curfile, DOSFILENAMELEN);
    midnight[side]->entries = gethyppodirent(drive, side, LFNNBRENTRIES);
    midnight[side]->blocksfree = UINT_MAX;
    if (sethyppo == SETHYPPOONBYERROR)  midnight[side]->blocksfree = UINT_MAX - 1;
  }
}

// overwrites the current file as selected if there's no other:
unsigned int sizeselectcurrentifnone(unsigned char side)  {
  unsigned int i;
  DIRENT* ds;
  unsigned int size = 0;
  unsigned char found = FALSE;

  for (i = 0; i < NBRENTRIES; i++)  {
    if (direntflags[side][i].flags & DIRFLAGSisselected)  {
      found = TRUE;
      // add to size:
      ds = getdirententry(side, i);
      size += ds->size;
      
      // @@ momentary workaround:
      if ((ds->type&0xf) == VAL_DOSFTYPE_CBM)  {
        messagebox(MBOXNOCANCEL, "Copying subdirectories",
                   "is not yet implemented.",
                   " ", 0);
        return UINT_MAX;
      }
    }
  }
  // no selection uses currently highlighted entry:
  if (!found)  {
    direntflags[side][midnight[side]->pos].flags |= DIRFLAGSisselected;
    ds = getdirententry(side, midnight[side]->pos);
    size += ds->size;
  }
  return size;
}

// unsigned char testtrack;
// unsigned char testsector;
void navi(unsigned char side)  {
  unsigned int c;  // keyboard input
  unsigned char leftx;
  unsigned char starttrack;
  unsigned char startsector;
  unsigned char endtrack;
  unsigned char attachresult;
  unsigned int i;
  unsigned char fd;
  unsigned char number;
  DIRENT* ds;
  unsigned char alive = TRUE;

  option.option = OPTIONshowALO | OPTIONshowDRV;
  legacyHDOSstate = legacyHDOS(); // clobbers $1703
/*
messagebox(MBOXNUMBER, "after legacy()",
                       " ", // (midnight[side]->drive ? "drive 1" : "drive 0"),
                       "BASEPAGERESERVED=", *(long*) BASEPAGERESERVED);
*/
  // initialising:
  for (i = 0; i < 2; i++)  {
    // @@ to be made variable maybe?
    midnight[i]->drive = i;

    // title of mcbox is .d81 file name, cannot be read at startup:
    strcpy((char *) midnight[i]->curfile, (char *) "already mounted");
    midnight[i]->dirtrack = HEADERTRACK;
    midnight[i]->firsttrack = FIRSTTRACK;
    midnight[i]->lasttrack = LASTTRACK;
    midnight[i]->pos = 0;
    midnight[i]->flags |= MIDNIGHTFLAGismounted;
    messagebox(MBOXFALLTHROUGH, " ", " ", " ", 0);
    progress("Initialising...", "reading disk drives", i * 40 + 40);
    UpdateSectors(midnight[i]->drive, i);
    Deselect(i);
  }

  // find dirent with text file:
  alive = FALSE;
  for (i = 0; i < NBRENTRIES; i++)  {
    ds = getdirententry(side, i);

    if (mstrcmp(ds->name, "MIDNIGHTMEGATEXT", 17) == 0)  {
      // valuesbox(0, "mstrcmp", "i=", i, "last=", ds->name[15]);
      alive = TRUE;
      break;
    }
  }

  // read complete text file into Attic:
  if (alive)  {
    if (readblockchain(legacyHDOSstate, ATTICTEXTBUFFER, TEXTBLOCKS,
                       midnight[side]->drive, ds->track, ds->sector) > 0)  {
      // valuesbox(0, "readblockchain", "t=", ds->track, "s=", ds->sector);
      pcputs("ERROR too much text data for available blocks!");
      cgetc();
      alive = FALSE;
    } else {
      // Info above keybar:
      text(INFOFOOTER1, FALSE);
      text(INFOFOOTER2, FALSE);
      shortcuts(20, 0);
    }
  } else {
    // pcputs("ERROR text data file not found!");
    // cgetc();
    messagebox(MBOXNOCANCEL, "ERROR text data file not found!",
                             "Programme terminating.",
                             " ", 0);
  }

  _miniInit();  // Pause the floppy drive while waiting for the user
  // @@@@ legacy timing:
  if (legacyHDOSstate &&
      !messagebox(MBOXVERSION,
                     "A HICKUP.M65 v1.2 or older is active on your storage card",
                     "or an old core containing it. Falling back to slow mode.",
                     "Press RETURN to continue, STOP to halt.", 0))  {
    alive = FALSE;
  }

/* @@@@
  if (!messagebox(MBOXVERSION,
                     "is currently beta and may destroy data structures on",
                     ".d81 and real disks! Please work on backed up media.",
                     "Press RETURN to continue, STOP to halt.", 0))  {
    alive = FALSE;
  }
@@@@ */

  // main navigation loop:
  while (alive)  {
    // end running drive access:
    _miniInit();
    for (i = 0; i < 2; i++)  {
      if (midnight[i]->pos > midnight[i]->entries)  {
        midnight[i]->pos = midnight[i]->entries;
      }
      if (midnight[i]->entries == 0xff)  {
        midnight[i]->pos = 0;  // @@@@ empty list is not handled below :(
      }
      leftx = i * 40;
      mcbox(leftx, 0, leftx + 39, 0 + 23, COLOUR_CYAN, BOX_STYLE_INNER, 1, 0);
      revers(1);
      mcputsxy(leftx + 2, 0, " ");  // @@ to be string optimised as in listbox()
      msprintf((char *) disknames[i]); // @@@@ maybe simply call GetDisknames here
      cputc(' ');
      if (midnight[i]->flags & MIDNIGHTFLAGismounted)  {
        mcputsxy(wherex() + 1, 0, " ");
        msprintf((char *) midnight[i]->curfile);
        cputc(' ');
      }
      mcputsxy(leftx + 2, 23, " drv:");
      csputdec(midnight[i]->drive, 0, 0);
      cputc(' ');
      if (midnight[i]->entries == 0xff)  {
        // can also indicate more than the allowed number of dirents:
        mcputsxy(leftx + 17, 3, " empty ");
//        if (side == i)  mcputsxy(leftx + 12, 5, " > F2 to mount < ");
//        valuesbox(0, "empty list", "entries=", midnight[i]->entries, " ", 0);
      } else {
        listbox((side == i), i, leftx + 1, 1,
                midnight[i]->pos, midnight[i]->entries);
      }
      if (midnight[i]->blocksfree == (UINT_MAX - 1))  {
        blink(TRUE);
        textcolor(COLOUR_ORANGE);
        mcputsxy(leftx + 12, 23, " disk access error ");
        blink(FALSE);
        sidbong();
        midnight[i]->blocksfree = UINT_MAX;
      }
      else if (midnight[i]->blocksfree != UINT_MAX)  {
        mcputsxy(leftx + 12, 23, " ");
        csputdec(midnight[i]->blocksfree, 0, 0);
        msprintf(" blocks free ");
      }
      else {
        mcputsxy(leftx + 12, 23, " F11 to mount real drive ");
      }
      revers(0);
    }

    c = cgetcalt(side);
    bordercolor (COLOUR_BLACK); // to unset red error borders
    
    // Drop all keys not used in dir sort mode:
    if (midnight[side]->flags & MIDNIGHTFLAGdirsortactive)  {
      switch (c) { // mega65-book.pdf#229
        case 0x91: // Crsrup
        case 0x191: // Shift Crsrup
        case 0x291:
        case 0x11: // Crsrdown
        case 0x412: // Ctrl-r
        case 0x20: // Space to toggle
        case 0x194: // Shift-Inst
        case 0x294:
        case 0x1f: // HELP
        case 0xf1: // unused F keys
        case 0x1f1:
        case 0x2f1:
          // allowed keys in this mode
        break;

        case 13: // return
          rewritedirent(legacyHDOSstate, midnight[side]->drive, side,
                        midnight[side]->dirtrack,
                        midnight[side]->firsttrack, midnight[side]->lasttrack);
        // ... falling through ... no break;
        case 3:    // STOP
        case 27:   // Esc
          UpdateSectors(midnight[side]->drive, side);
          Deselect(side);
          c = 0xFF; // bong preventing
        break;

        default:
          c = 0;
        break;
      }
    }

    switch (c) { // mega65-book.pdf#229
      case 0x91: // Crsrup
      case 0x191: // Shift Crsrup
      case 0x291:
        if (midnight[side]->pos > 0)  {
          if ((midnight[side]->flags & MIDNIGHTFLAGdirsortactive) &&
              (direntflags[side][midnight[side]->pos].flags &
                    DIRFLAGSisselected))  {
            swapdirententry(side, midnight[side]->pos, midnight[side]->pos - 1);
            Deselect(side);
            direntflags[side][midnight[side]->pos - 1].flags |=
                    DIRFLAGSisselected;
          }
          midnight[side]->pos--;
        }
      break;
      case 0x11: // Crsrdown
        if (midnight[side]->pos < midnight[side]->entries)  {
          if ((midnight[side]->flags & MIDNIGHTFLAGdirsortactive) &&
              (direntflags[side][midnight[side]->pos].flags &
                    DIRFLAGSisselected))  {
            swapdirententry(side, midnight[side]->pos, midnight[side]->pos + 1);
            Deselect(side);
            direntflags[side][midnight[side]->pos + 1].flags |=
                    DIRFLAGSisselected;
          }
          midnight[side]->pos++;
        }
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
      break;

      case 0xf2: // Modifiers and ASC_F1:
      case 0x1f2:
      case 0x2f2:
        // Mount toggle and reset to root dirent:
        midnight[side]->flags ^= MIDNIGHTFLAGismounted;
        midnight[side]->dirtrack = HEADERTRACK;
        midnight[side]->firsttrack = FIRSTTRACK;
        midnight[side]->lasttrack = LASTTRACK;
        UpdateSectors(midnight[side]->drive, side);
        Deselect(side);
      break;
/*
      case 0x8f2: // Mega-F1
        if ((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE)  {
          messagebox(MBOXNOCANCEL, "Unmount",
                                   "not supported in mount mode.", " ", 0);
        } else {
          if (messagebox(MBOXREGULAR, "Unmount",
                         (side ? "right drive" : "left drive"), " ", 0))  {
            hyppo_dos_attach(0b10000000 + side); // hyppo_d81detach();
            UpdateSectors(midnight[side?0:1]->drive, side?0:1);
          }
        }
      break;
*/
      case 0x8f4: // Mega-F3
        if (messagebox(MBOXREGULAR, "Freezer", "did you save your work?",
                       " ", 0))  {
          hyppo_freeze_self();
          progress("Reading...", "BAM", 30);
          usleep(2000000); // microseconds
          midnight[side]->flags |= MIDNIGHTFLAGismounted; // try remount
          midnight[side?0:1]->flags |= MIDNIGHTFLAGismounted;
          midnight[side]->dirtrack = HEADERTRACK;
          midnight[side]->firsttrack = FIRSTTRACK;
          midnight[side]->lasttrack = LASTTRACK;
          midnight[side?0:1]->dirtrack = HEADERTRACK;
          midnight[side?0:1]->firsttrack = FIRSTTRACK;
          midnight[side?0:1]->lasttrack = LASTTRACK;
          UpdateSectors(midnight[side]->drive, side);
          UpdateSectors(midnight[side?0:1]->drive, side?0:1);
        }
      break;

/* renaming not implemented on Hyppo side:
          hyppo_setname(ds->name); // hyppofn->name);
          fd = hyppo_findfirst();
          if (fd >= 0x84)  {
            messagebox(MBOXNOCANCEL, "File ", ds->name,
                       "not found", 0);
          } else {
            input file name
            hyppo_setname again
            hyppo_rename(fd);
          }
          hyppo_closedir(fd);
*/

      case 0xf5: // ASC_F5 copy
      case 0xf6: // Modifiers and ASC_F5 rename
      case 0x1f6:
      case 0x2f6:
      case 0xf8: // Modifiers and ASC_F8 delete
      case 0x1f8:
      case 0x2f8:
        // check for multiselect and disallow on Hyppo and multiple
        // directory selections:
        number = 0;
        ds = getdirententry(side, midnight[side]->pos);
        for (i = 0; i < NBRENTRIES; i++)  {
          if (direntflags[side][i].flags & DIRFLAGSisselected)  {
            // overwrite highlighted when a selection is active:
            if (!(direntflags[side][midnight[side]->pos].flags &
                  DIRFLAGSisselected))  {
              midnight[side]->pos = i;
            }
            ds = getdirententry(side, i);
            number++;
          }
        }
        if (number == 0)  { // nothing selected, goes to highlighted
          direntflags[side][midnight[side]->pos].flags ^= DIRFLAGSisselected;
          number++;
        }
        // multiple selection abort criteria:
        if (number > 1 &&
            ((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE))  {
          messagebox(MBOXNOCANCEL, "Operation on mulitiple",
                     "storage card files/folders",
                     "is not supported.", 0);
        } else if (number > 1 &&
                 ((ds->type&0xf) == VAL_DOSFTYPE_CBM))  {
          messagebox(MBOXNOCANCEL, "Directory operation on",
                     "multiple selected entries",
                     "is not supported", 0);
        } else { // okay to start:
          if (number > 1)  {
            strcpy((char*) midnight[side]->inputstr,
                   (char*) "multiple selected entries");
          } else {
            strcpy((char*) midnight[side]->inputstr, (char*) ds->name);
          }

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

          if ((ds->type&0xf) == VAL_DOSFTYPE_DEL &&
              ((midnight[side]->flags & MIDNIGHTFLAGismounted)))  {
            messagebox(MBOXNOCANCEL, "File type for",
                       (char *) midnight[side]->inputstr,
                       "unsupported", 0);
          } else if (c == 0xf5)  {  // copy
            if ((ds->type&0xf) == VAL_DOSFTYPE_CBM)  {
              messagebox(MBOXNOCANCEL, "Copying full directory structures",
                         "is not supported.", " ", 0);
            } else if (((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE) ||
                       ((midnight[side?0:1]->flags & MIDNIGHTFLAGismounted) == FALSE))  {
              messagebox(MBOXNOCANCEL, "Copying storage card files/folders",
                         "is not supported.",
                            " ", 0);
//            } else if (midnight[side?0:1]->dirtrack != HEADERTRACK)  {
//              messagebox(MBOXNOCANCEL, "File copy,",
//                         "into subfolders currently unsupported.",
//                         " ", 0);
            // @@ these "if"s need to be swapped:
            } else if (sizeselectcurrentifnone(side) > midnight[side?0:1]->blocksfree)  {
              messagebox(MBOXNOCANCEL, "File copy,",
                         "destination disk space insufficient", " ", 0);
            } else if (messagebox(MBOXREGULAR, "File copy,",
                       (char *) midnight[side]->inputstr,
                       (side ? "from right to left" : "from left to right"),
                       0)) {
              for (i = 0; i < NBRENTRIES; i++)  {
                if (direntflags[side][i].flags & DIRFLAGSisselected)  {
                  ds = getdirententry(side, i);

                  progress("Reading...", "source file", 20);
                  readblockchain(legacyHDOSstate, ATTICFILEBUFFER, DATABLOCKS,
                                 midnight[side]->drive, ds->track, ds->sector);
                  progress("Reading...", "BAM", 30);
                  // write on opposing side disk:
                  GetBAM(legacyHDOSstate, side?0:1);
                  progress("Writing...", "destination file", 40);
                  writeblockchain(legacyHDOSstate,
                                  ATTICFILEBUFFER, DATABLOCKS,
                                  midnight[side?0:1]->drive,
                                  &starttrack, &startsector,
                                  midnight[side?0:1]->dirtrack, FALSE,
                                  midnight[side?0:1]->firsttrack,
                                  midnight[side?0:1]->lasttrack);
                  ds->track = starttrack;  // recycle src dirent for destination
                  ds->sector = startsector;

#ifdef DEBUG
                  mprintf("   before newds type=", ds->type);
                  cputln();
                  cgetc();
#endif
                  progress("Writing...", "directory", 60);
                  // load opposing side dirent block into Attic:
//                  midnight[side?0:1]->entries = getdirent(midnight[side?0:1]->drive, side?0:1);
                  writenewdirententry(legacyHDOSstate,
                                      midnight[side?0:1]->drive, side?0:1,
                                      midnight[side?0:1]->dirtrack,
                                      midnight[side?0:1]->firsttrack,
                                      midnight[side?0:1]->lasttrack,
                                      ds);
                  // re-read altered dirent on opposing side after entry added:
//                  midnight[side?0:1]->entries = getdirent(midnight[side?0:1]->drive, side?0:1);
                  progress("Writing...", "BAM", 80);
                  PutBAM(legacyHDOSstate, midnight[side?0:1]->drive, side?0:1,
                         midnight[side?0:1]->dirtrack);
                }
              }
              UpdateSectors(midnight[side?0:1]->drive, side?0:1);
              Deselect(side);
            }
          } else if ((c == 0xf6) || (c == 0x1f6) || (c == 0x2f6))  {  // copy
            for (i = 0; i < NBRENTRIES; i++)  {
              if (direntflags[side][i].flags & DIRFLAGSisselected)  {
                ds = getdirententry(side, i);
                strcpy((char*) midnight[side]->inputstr,
                       "Enter the new name, empty to skip:");
                inputbox((char*) midnight[side]->inputstr,
                         (char*) midnight[side]->inputstr);
                if (midnight[side]->inputstr[0] != 0)  {
                  strmakefilename((char*) midnight[side]->inputstr,
                                  (char*) ds->name, DOSFILENAMELEN);
                  lcopy((uint32_t) ds,
                        ATTICDIRENTBUFFER + side * ATTICDIRENTSIZE + i * DIRENTSIZE,
                        DIRENTSIZE);
                  if ((ds->type&0xf) == VAL_DOSFTYPE_CBM)  {
                    renamedisk(legacyHDOSstate,
                               midnight[side]->drive, side,
                               ds->track, // dirtrack of subpartition
                               ds->name);
                  }
                  rewritedirent(legacyHDOSstate, midnight[side]->drive, side,
                                midnight[side]->dirtrack,
                                midnight[side]->firsttrack,
                                midnight[side]->lasttrack);
                }
              }
            }
            UpdateSectors(midnight[side]->drive, side);
            Deselect(side);
          } else if ((ds->type&0xf) == VAL_DOSFTYPE_CBM &&
                     (midnight[side]->entries != 0xff))  {
            number = 0;
            for (i = NBRENTRIES; i > 0; i--)  {
              if (direntflags[side][i - 1].flags & DIRFLAGSisselected)  {
                number++;
              }
            }
            if (number > 1)  {
              messagebox(MBOXNOCANCEL, "Directory delete,",
                         "on multiple selected",
                         "entries is not supported", 0);
            // use file data buffer to peek the dir BAM:
            } else if (ds->size !=
                            BAMCheckSizeinFilebuffer(legacyHDOSstate,
                              midnight[side]->drive, side,
                              ds->track, // dirtrack
                              ds->track, // firsttrack
                              (ds->size / 40) + ds->track))  { // lasttrack
              messagebox(MBOXNOCANCEL, "Directory delete,", ds->name,
                         "directory is not empty", 0);
#ifdef DEBUG
              messagebox(MBOXNUMBER, "Directory delete,",
                         " ",
                         "ds-size=",
                         ds->size);
              messagebox(MBOXNUMBER, "Directory delete,",
                         " ",
                         "size in BAM=",
                         BAMCheckSizeinFilebuffer(legacyHDOSstate,
                                           midnight[side]->drive,
                                           side,
                                           ds->track, // dirtrack
                                           ds->track, // firsttrack
                                           (ds->size / 40) + ds->track));
#endif
            } else if (messagebox(MBOXREGULAR, "Directory delete,", ds->name,
                                  (side ? "from right side" :
                                          "from left side"), 0))  {
              // restore BAM to finally delete:
              GetBAM(legacyHDOSstate, side);
//              ds->type = VAL_DOSFTYPE_DEL;
              deletedirententry(legacyHDOSstate,
                                midnight[side]->drive, side,
                                midnight[side]->dirtrack,
                                midnight[side]->pos);
              PutBAM(legacyHDOSstate,
                     midnight[side]->drive, side, midnight[side]->dirtrack);
              UpdateSectors(midnight[side]->drive, side);
              Deselect(side);
            }
          } else if (ds->type != VAL_DOSFTYPE_DEL &&  // file delete
                     ds->size > 0)  {     // storage card dirs are size zero
            if (messagebox(MBOXREGULAR, "File delete,",
                           (char *) midnight[side]->inputstr,
                           (side ? "from right side" : "from left side"),
                           0))  {
              if ((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE)  {
                hyppo_setname(ds->name); // hyppofn->name);  // @@@@ same
                fd = hyppo_findfirst();                 // @@@@ block as below
                if (fd >= 0x84)  {
                  messagebox(MBOXNOCANCEL, "File ", ds->name,
                             "not found", 0);
                } else {
                  hyppo_rmfile(fd);
                }
                hyppo_closedir(fd);
              } else {
                // size returned doesn't matter to delete:
                if (sizeselectcurrentifnone(side) != UINT_MAX)  {
                  for (i = NBRENTRIES; i > 0; i--)  {
                    if (direntflags[side][i - 1].flags & DIRFLAGSisselected)  {
                      ds = getdirententry(side, i - 1);

                      progress("Reading...", "BAM", 20);
  //                    ds->type = VAL_DOSFTYPE_DEL;
                      GetBAM(legacyHDOSstate, side);
                      progress("Writing...", "removing BAM entries", 40);
                      deletedirententry(legacyHDOSstate,
                                        midnight[side]->drive, side,
                                        midnight[side]->dirtrack, i - 1);
                      progress("Writing...", "updating BAM", 80);
                      PutBAM(legacyHDOSstate,
                             midnight[side]->drive, side,
                             midnight[side]->dirtrack);
                    }
                  }
                }
              }
              UpdateSectors(midnight[side]->drive, side);
              Deselect(side);
            }
          } else {
/*
            number = 0;
            for (i = NBRENTRIES; i > 0; i--)  {
              if (direntflags[side][i - 1].flags & DIRFLAGSisselected)  {
                number++;
              }
            }
            if (number > 1)  {
              messagebox(MBOXNOCANCEL, "Directory delete,",
                         "on multiple selected",
                         "entries is not supported", 0);
            } else 
*/
            if (messagebox(MBOXREGULAR, "Directory structure delete,",
                                  ds->name, (side ? "from right side" :
                                                    "from left side"),
                                  0))  {
              hyppo_setname(ds->name); // hyppofn->name);  // @@@@ same
              fd = hyppo_findfirst();                 // @@@@ block as below
              if (fd >= 0x84)  {
                messagebox(MBOXNOCANCEL, "Directory ", ds->name,
                           "not found", 0);
              } else {
                hyppo_rmdir(fd);
              }
              hyppo_closedir(fd);
            }
            UpdateSectors(midnight[side]->drive, side);
            Deselect(side);
          }
        }
      break;

      case 0x8f6: // Mega-F5
        if (((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE) ||
            ((midnight[side?0:1]->flags & MIDNIGHTFLAGismounted) == FALSE))  {
          messagebox(MBOXNOCANCEL, "Copying from/to storage cards",
                     "is not supported.", " ", 0);
        } else {
          if ((midnight[side]->dirtrack == HEADERTRACK) &&
               messagebox(MBOXREGULAR, "Disk copy,",
                          "destination disk will be OVERWRITTEN",
                          " ", 0))  {
            GetBAM(legacyHDOSstate, side);
            copywholedisk(legacyHDOSstate,
                          midnight[side]->drive, midnight[side?0:1]->drive,
                          side); // , midnight[side]->dirtrack);
            UpdateSectors(midnight[side?0:1]->drive, side?0:1);
          }
        }
      break;

      case 0xf7:  // F7
      case 0x1f7:
      case 0x2f7:
        if ((midnight[side]->dirtrack != HEADERTRACK) ||
            ((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE))  {
          messagebox(MBOXNOCANCEL, "To create a directory a disk has to",
                     "be mounted and its root directory selected.",
                     " ", 0);
        } else {
          // @@@@ to be replaced by asking name and ID:
          FreeTracks(legacyHDOSstate, side,
                     midnight[side]->firsttrack,
                     midnight[side]->lasttrack,
                     &starttrack, &endtrack, 2); // two tracks
          if ((endtrack - starttrack) < 2)  {
            messagebox(MBOXNOCANCEL, "Not enough tracks available",
                       "to create a directory.",
                       " ", 0);
          } else {
            number = endtrack - starttrack + 1;
            strcpy((char*) midnight[side]->inputstr,
                   "Enter amount of tracks 2..80, 0 to quit:");
            midnight[side]->inputstr[26] = number / 10 + 0x30;
            midnight[side]->inputstr[27] = number % 10 + 0x30;
            inputbox((char*) midnight[side]->inputstr,
                     (char*) midnight[side]->inputstr);
            number = atoi((char*) midnight[side]->inputstr);
            FreeTracks(legacyHDOSstate, side,
                       midnight[side]->firsttrack,
                       midnight[side]->lasttrack,
                       &starttrack, &endtrack, number);
            if (number >= 2 && (endtrack - starttrack) >= 2 &&
                number <= (endtrack - starttrack + 1))  {
              inputbox((char*) midnight[side]->inputstr,
                       "Please enter name of the subdirectory");
              endtrack = starttrack + number - 1;
#ifdef DEBUG
              messagebox(MBOXNUMBER, "Creating subdirectory",
                         // (char *) disknames[side],
                         (side ? "mounted on right side" : "mounted on left side"),
                         // "number=", number))  {
                         "start-/endtrack=",
                         starttrack * 256 + endtrack);
#endif
              // First allocate BAM because the following format will use
              // the BAM of the partition:
              BAMAllocateTracks(legacyHDOSstate, side, starttrack, endtrack);
              PutBAM(legacyHDOSstate,
                     midnight[side]->drive, side, midnight[side]->dirtrack);

              ds->chntrack = 0;
              ds->chnsector = 0;
              ds->type = VAL_DOSFTYPE_CBM | 0x80;
              ds->track = starttrack;  // recycle src dirent for destination
              ds->sector = 0;
              strmakefilename((char*) midnight[side]->inputstr,
                              (char*) ds->name, DOSFILENAMELEN);
              ds->size = (endtrack - starttrack) * 40; // omit dirtrack
              writenewdirententry(legacyHDOSstate,
                                  midnight[side]->drive, side,
                                  midnight[side]->dirtrack,
                                  midnight[side]->firsttrack,
                                  midnight[side]->lasttrack,
                                  ds);
              FormatPartition(legacyHDOSstate, midnight[side]->drive, side,
                              starttrack, // midnight[side]->dirtrack,
                              starttrack, // midnight[side]->firsttrack,
                              endtrack,   // midnight[side]->lasttrack);
                              (char*) ds->name);

              UpdateSectors(midnight[side]->drive, side);
              Deselect(side);
            } else {
              if (number > 0)  {
                messagebox(MBOXNOCANCEL, "No space to create a",
                           "subdirectory.",
                           " ", 0);
              }
            }
          }
        }
      break;

      case 0x8f8: // Mega-F7
        if ((midnight[side]->dirtrack != HEADERTRACK) ||
            ((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE))  {
          messagebox(MBOXNOCANCEL, "The to be formatted disk/image file has to",
                     "be mounted and its root directory selected.",
                     " ", 0);
        } else {
          // @@@@ to be replaced by asking name and ID:
          if (messagebox(MBOXREGULAR, "Disk will be quickformatted",
                         (char *) disknames[side],
                         (side ? "mounted on right side" :
                                 "mounted on left side"),
                         0))  {
            inputbox((char*) midnight[side]->inputstr,
                     "Please enter the disk's name");
            strmakefilename((char*) midnight[side]->inputstr,
                            (char*) midnight[side]->inputstr, DOSFILENAMELEN);
            FormatPartition(legacyHDOSstate, midnight[side]->drive, side,
                            midnight[side]->dirtrack,
                            midnight[side]->firsttrack,
                            midnight[side]->lasttrack,
                            (char*) midnight[side]->inputstr);

            UpdateSectors(midnight[side]->drive, side);
            Deselect(side);
          }
        }
      break;

      case 0x8fa: // Mega-F9
        rombox();
      break;

      case 0xf9:
        shortcuts(20, 0);
        if (menubox(side))  {
          messagebox(MBOXFALLTHROUGH, " ", " ", " ", 0);
          progress("Reading...", "BAM", 20);
          UpdateSectors(midnight[side]->drive, side);
          Deselect(side);
          UpdateSectors(midnight[side?0:1]->drive, side?0:1);
          Deselect(side?0:1);
        }
      break;

      case 0xfb: // F11
        if (legacyHDOSstate)  {
/*
  unsigned char majorhyppo;
  unsigned char minorhyppo;
  unsigned char majorHDOS;
  unsigned char minorHDOS;
  hyppo_getversion(&majorhyppo, &minorhyppo, &majorHDOS, &minorHDOS);
          unsigned char clear = 1;
          unsigned char shadow = 1;

          mcbox(20, 15, 70, 19, COLOUR_CYAN, BOX_STYLE_INNER, clear, shadow);
          gotoxy(24, 17);
          mprintf(" Hyppo v", majorhyppo);
          mprintf(".", minorhyppo);
          mprintf(" HDOS v", majorHDOS);
          mprintf(".", minorHDOS);
*/
          messagebox(MBOXNOCANCEL,
                     "Your version of the Hyppo/HDOS is too old",
                     "to unmount drives.",
                     "Press RETURN or STOP to continue.", 0);
        } else {
          if (messagebox(MBOXREGULAR, "Unmount",
                         (side ? "right drive?" : "left drive?"), " ", 0))  {
            hyppo_dos_attach(0b10000000 + midnight[side]->drive); // hyppo_d81detach();
            midnight[side]->flags |= MIDNIGHTFLAGismounted;
            midnight[side]->dirtrack = HEADERTRACK;
            midnight[side]->firsttrack = FIRSTTRACK;
            midnight[side]->lasttrack = LASTTRACK;
            UpdateSectors(midnight[side]->drive, side);
            Deselect(side);
          }
        }
      break;

      case 0x412: // Ctrl-r
        midnight[side]->flags |= MIDNIGHTFLAGismounted;
        midnight[side]->dirtrack = HEADERTRACK;
        midnight[side]->firsttrack = FIRSTTRACK;
        midnight[side]->lasttrack = LASTTRACK;
        UpdateSectors(midnight[side]->drive, side);
        Deselect(side);
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
                messagebox(MBOXNOCANCEL, "Storage card parent directory,",
                           "open failed for", (char *) ds->name, 0);
              } else {
                UpdateSectors(midnight[side]->drive, side);
                Deselect(side);
              }
            }
          }
        } else {
          midnight[side]->dirtrack = HEADERTRACK;
          midnight[side]->firsttrack = FIRSTTRACK;
          midnight[side]->lasttrack = LASTTRACK;
          UpdateSectors(midnight[side]->drive, side);
          Deselect(side);
        }
      break;

      case 0x20: // Space to toggle
      case 0x194: // Shift-Inst
      case 0x294:
        if ((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE)  {
          sidbong();
        } else {
          direntflags[side][midnight[side]->pos].flags ^= DIRFLAGSisselected;
          if (!(midnight[side]->flags & MIDNIGHTFLAGdirsortactive))  {
            midnight[side]->pos++;
          }
        }
      break;

      case 13: // return
        ds = getdirententry(side, midnight[side]->pos);
        lcopy(ATTICLFNBUFFER + side * ATTICLFNBUFFERSIZE + midnight[side]->pos * LFNFILENAMELEN,
             (uint32_t) lfnname,
             LFNFILENAMELEN);

        if ((midnight[side]->flags & MIDNIGHTFLAGismounted) == FALSE)  {
          if (ds->type & HYPPODIRENTATTRDIR)  {
            hyppo_setname((char*) lfnname);  // ds->name);
            attachresult = hyppo_chdir();

            if (attachresult > 0xf)  {  // @@ better error handling in Hyppo reqd
              messagebox(MBOXNOCANCEL, "Storage card change directory,",
                         "open failed for", (char *) ds->name, 0);
            } else {
              UpdateSectors(midnight[side]->drive, side);
              Deselect(side);
            }        
          } else {
            // @@@@ currently trying to mount everything that is not a dir:
            if (midnight[side]->drive)  {
              hyppo_setname((char *) lfnname); // (char *) ds->name);
              attachresult = (legacyHDOSstate ? hyppo_d81attach1() : hyppo_dos_attach(1));
            } else {
              hyppo_setname((char *) lfnname); // (char *) ds->name);
              attachresult = (legacyHDOSstate ? hyppo_d81attach0() : hyppo_dos_attach(0));
            }

            if (attachresult > 0x4a)  { // @@@@ to be reviewed
              messagebox(MBOXNOCANCEL, "Storage card mounting,",
                         "mount failed for",
                         (char *) lfnname, 0); // ds->name, 0);
            } else {
              midnight[side]->flags |= MIDNIGHTFLAGismounted;
              UpdateSectors(midnight[side]->drive, side);
              Deselect(side);
            }
          }
        } else {
          if ((ds->type&0xf) == VAL_DOSFTYPE_CBM &&
              (midnight[side]->entries != 0xff))  {
            midnight[side]->dirtrack = ds->track;
            midnight[side]->firsttrack = ds->track;
            midnight[side]->lasttrack = (ds->size / 40) + ds->track;
            UpdateSectors(midnight[side]->drive, side);
            Deselect(side);
          } else {
            sidbong();
            if (midnight[side]->entries != 0xff)  {
              messagebox(MBOXNOCANCEL, "This file type/directory",
                         "is not yet implemented.", " ", 0);
            }
          }
        }
      break;

      case 0x1f: // HELP
      case 0xf1: // unused F keys
      case 0x1f1:
      case 0x2f1:
        shortcuts(20, 0);
        helpbox();
      break;

      case 0xf3:
      case 0x1f3:
      case 0x2f3:
      case 0xf4:
      case 0x1f4:
      case 0x2f4:
      case 0x415: // Ctrl-u
        sidbong();
//        messagebox(MBOXNOCANCEL, "Some function keys,",
//                   "are not yet implemented.", " ");
      break;

      // case 0xF9: // ASC_F9:
      case 0xFA: // Modifiers and ASC_F9:
      case 0x1FA:
      case 0x2FA:
        if (getkeymodstate() == KEYMOD_RSHIFT || getkeymodstate() == KEYMOD_LSHIFT)  {
          return;
        }
      break;
      
      case 0xFF: // bong preventing
      break;

      default:
        sidbong();
        /*
        gotoxy(0, 0); // @@ To get debug output from top left
        mh4printf("val=", c);
        cputc('  ');
        usleep(2000000); // microseconds
        */
      break;
    }
  }
}

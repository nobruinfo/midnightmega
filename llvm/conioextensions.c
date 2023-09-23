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
// ***  conioextensions.c strings and scrolling          ***
// *********************************************************

static char* p2sbuf = (char*)0x334;

char tolowerchar(char ch) {
    if(ch>='A' && ch<='Z') {
        return ch + ('a'-'A');
    } else {
        return ch;
    }
}

char * strlowr(char *str) {
    char * src = str;
    while(*src) {
        *src = tolowerchar(*src);
        src++;
    }
    return str;
}

char * strsan(char *str) {
  char * s = str;
  
  while (*s) {
//  for (int i=0; i < sizeof(s); s++) {
	if (*s < 0x20 || *s > 0x7d) *s = '?';
	s++;
  }
  return s;
}

#define COLOR_RAM_BASE 0xFF80000UL
// to by replaced by a getter function
void cputln(void)  {
  unsigned char width;
  unsigned char height;
  unsigned int screenbytes;
  
  getscreensize(&width, &height);
  screenbytes = width * height;
  if (wherey() + 1 >= height)  {
	lcopy(getscreenaddr() + width, getscreenaddr(), screenbytes - width);
    lcopy(COLOR_RAM_BASE + width, COLOR_RAM_BASE, screenbytes - width);
    lfill(getscreenaddr() + screenbytes - width, ' ', width);
    lfill(COLOR_RAM_BASE + screenbytes - width, COLOUR_WHITE, width);
		// COLOUR_WHITE to be replaced by a getter function
		// COLOR_RAM_BASE calculation supports one-byte colours only
	gotoxy(0, wherey());
  } else {
	gotoxy(0, wherey() + 1);
  }
}

// taken from mega65-libc memory.c being inactive by #ifdef:
uint8_t lpeek__________(uint32_t address)
{
  return dma_peek(address);
}
void lpoke___________(uint32_t address, uint8_t value)
{
  dma_poke(address, value);
}

#define MAXDECDIGITS 10
void csputdec(long n, unsigned char padding, unsigned char leadingZeros)
{
    unsigned char buffer[MAXDECDIGITS + 1];
    unsigned char rem = 0, i = 0;
    char digit = MAXDECDIGITS - 1;
    buffer[MAXDECDIGITS] = 0;
    do {
        rem = n % 10;
        n /= 10;
        buffer[digit--] = '0' + rem; // static: hexDigits[rem];
    } while (((int)digit >= 0) && (n != 0));

    while (digit > 0)  {
	  if (leadingZeros > 0)  {
		leadingZeros--;
        buffer[digit--] = '0'; // static: hexDigits[0];
	  } else if (digit > (MAXDECDIGITS - padding))  {  // padding actually aligns
		buffer[digit--] = ' ';
	  } else break;
    }

    cputs(&buffer[digit + 1]);
}

char asciitoscreencode(char c)
{
//    if (c >= 64 && c <= 95) {
//        return c - 64;
//    }

    if (c >= 192) {
        return c - 128;
    }

    if (c >= 96 && c < 192) {
        return c - 96;
    }

    if (c == '[') return 27;
    if (c == '\\') return 105;
    if (c == ']') return 29;
    if (c == '^') return 100;
    if (c == '_') return 100;

    return c;
}

char* asciitoscreencode_s(char* s)
{
    char* src = s;
    char* dest = p2sbuf;
    while ((*dest++ = asciitoscreencode(*src++)))
        ;
    return p2sbuf;
}

void clrhome(void)
{
    clrscr();
    gohome();
}

// instead of printf() variants:
void msprintf(char* str)  {
  cputs((const unsigned char*) asciitoscreencode_s(str));
}
void mprintf(char* str, long n)  {
  cputs((const unsigned char*) asciitoscreencode_s(str));
  csputdec(n, 0, 0);
}
void mhprintf(char* str, long n)  {
  cputs((const unsigned char*) asciitoscreencode_s(str));
  cputhex(n, 2);
}
void mh4printf(char* str, long n)  {
  cputs((const unsigned char*) asciitoscreencode_s(str));
  cputhex(n, 4);
}
void mcprintf(char* str, char c)  {
  cputs((const unsigned char*) asciitoscreencode_s(str));
  cputc(c);
}
void mcputsxy(unsigned char x, unsigned char y, char* str)  {
	cputsxy(x, y, (const unsigned char *) asciitoscreencode_s(str));
}
// Debug defined:
void msprintfd(char* str)  {
#ifdef DEBUG
	msprintf(str);
#endif
}
void mprintfd(char* str, long n)  {
#ifdef DEBUG
	mprintf(str, n);
#endif
}
void mhprintfd(char* str, long n)  {
#ifdef DEBUG
	mhprintf(str, n);
#endif
}
void mh4printfd(char* str, long n)  {
#ifdef DEBUG
	mh4printf(str, n);
#endif
}
void mcprintfd(char* str, char c)  {
#ifdef DEBUG
	mcprintf(str, c);
#endif
}
void cputcd(unsigned char c)  {
#ifdef DEBUG
	cputc(c);
#endif
}
void clrhomed(void)  {
#ifdef DEBUG
	clrhome();
#endif
}
void cputlnd(void)  {
#ifdef DEBUG
	cputln();
#endif
}
unsigned char cgetcd(void)  {
  unsigned char c = 0;
#ifdef DEBUG
	c = cgetc();
#endif
  return c;
}

unsigned char cinput2(
    unsigned char* buffer2, unsigned char buflen, unsigned char flags)
{
    register unsigned char numch = 0, i, ch;
    const int sx = wherex();
    const int sy = wherey();

    if (buffer2 == NULL || buflen == 0) {
        return 0;
    }

    flushkeybuf();

    for (i = 0; i < buflen; ++i) {
        buffer2[i] = '\0';
    }

    while (1) {
        if (buffer2[0]!=0)  cputsxy(sx, sy, buffer2);
		else gotoxy(sx, sy);
        blink(1);
        cputc(224);
        blink(0);
        ch = cgetc();

        if (ch == 13) {
            break;
        }

        if (ch == 20) {
		  if (numch > 0) {
            moveleft(1);
            cputc(' ');
            buffer2[--numch] = '\0';
		  }
        }
        else if (numch < buflen - 1) {
            if ((((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'))
                    && (flags & CINPUT_ACCEPT_LETTER))
                || ((ch >= '0' && ch <= '9') && (flags & CINPUT_ACCEPT_NUMERIC))
                || (flags & CINPUT_ACCEPT_ALL)) {
                if ((ch >= 0x61 && ch <= 0x7a) && (PEEK(0x0D18) & ~2)
                    && (flags & ~CINPUT_NO_AUTOTRANSLATE)) {
                    ch -= 0x20;
                }

                buffer2[numch++] = ch;
            }
        }
    }

    moveleft(1);
	cputc(' ');  // remove blinking cursor after last entered char
	return numch;
}

void mcbox(unsigned char left, unsigned char top, unsigned char right, unsigned char bottom,
    unsigned char color, unsigned char style, unsigned char clear, unsigned char shadow)
{
	RECT rc = { left, top, right, bottom };
    register unsigned char i = 0;
    const unsigned char len = right - left;
//    unsigned char prevCol = g_curTextColor;

    textcolor(color);
    if (clear) {
        fillrect(&rc, ' ', color); // g_curTextColor);
    }

    // https://c64os.com/post/c64screencodes
	cputcxy(left, top, 112); // 176);
    cputcxy(left, bottom, 109); // 173);
    cputcxy(right, top, 110); // 174);
    cputcxy(right, bottom, 125); // 189);

    for (i = 1; i < len; ++i) {
        cputcxy(left + i, top, 64); // 99);
        cputcxy(left + i, bottom, 64); // 99);
    }

    for (i = top + 1; i <= bottom - 1; ++i) {
        cputcxy(left, i, 93); // 98);
        cputcxy(right, i, 93); // 98);
    }

	unsigned char width;
	unsigned char height;
	getscreensize(&width, &height);

    if (shadow && bottom < height && right < width) {
        lfill(COLOR_RAM_BASE + ((bottom + 1) * (unsigned int)width)
                  + (1 + left),
            COLOUR_DARKGREY, len);
        for (i = top + 1; i <= bottom + 1; ++i) {
            cellcolor(right + 1, i, COLOUR_DARKGREY);
        }
    }
//    textcolor(prevCol);
}

void messagebox(char* message)  {
  unsigned char clear = 1;
  unsigned char shadow = 1;

  mcbox(10, 4, 70, 9, COLOUR_CYAN, BOX_STYLE_INNER, clear, shadow);
  
  gotoxy(12, 5);
  msprintf(message);
  gotoxy(1, 10);
}

char* inputbox(char* inputstr, char* message)  {
  messagebox(message);
  gotoxy(12, 6);
  cinput2((unsigned char*) inputstr, 56, CINPUT_ACCEPT_ALL); // | CINPUT_NO_AUTOTRANSLATE);

  gotoxy(1, 10);
  return inputstr;
}

#define FILEENTRIES 18
unsigned char filelist[FILEENTRIES][65];
unsigned char curfile[65];

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

unsigned char d81navi(void)  {
  char c;
  char pos = 0;
  unsigned char entries = 0;

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
	    hyppo_setname((char *) filelist[pos]);
		if (hyppo_d81attach1() != 0)  {
		  messagebox("mount failed");
		  cgetc();
		} else {
		  strcpy((char *) curfile, (char *) filelist[pos]);
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
void navi(void)  {
  char c;
  unsigned char pos = 0;
  unsigned char entries = 0;
  unsigned char starttrack;
  unsigned char startsector;
  DIRENT* ds;

  // title of mcbox is .d81 file name, cannot be read at startup:
  strcpy((char *) curfile, (char *) "already mounted");
  entries = getdirent();
  while (1)  {
    if (pos > entries)  pos = entries;
    mcbox(0, 0, 0 + 39, 0 + 23, COLOUR_CYAN, BOX_STYLE_INNER, 1, 1);
    revers(1);
    mcputsxy(2, 0, " ");
	msprintf((char *) curfile);
	cputc(' ');
    revers(0);
    listbox(1, 1, pos, entries);
    c = cgetc();
    switch (c) {
	  case 145: // Crsrup
	    if (pos > 0)  pos--;
      break;
	  case 17: // Crsrdown
	    pos++;
      break;

	  case 0xf2: // Modifier and ASC_F1:
	    if (d81navi())  entries = getdirent();
      break;

	  case 0xf5: // ASC_F5 copy
	  case 0xf8: // Modifier and ASC_F8 delete
        ds = getdirententry(pos);
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
		  readblockchain(ATTICFILEBUFFER, DATABLOCKS,
                      /* track */ ds->track, /* sector*/ ds->sector);
		  writeblockchain(ATTICFILEBUFFER, DATABLOCKS, &starttrack, &startsector);
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
		  writenewdirententry(ds);
		} else {  // delete
		  // confirmation box
		  ds->type = VAL_DOSFTYPE_DEL;
		  deletedirententry(pos);
		}
		entries = getdirent();
      break;

	  case 0x12: // Ctrl-r
		entries = getdirent();
      break;

	  case 13: // return
		messagebox("not yet implemented");
		cgetc();
/* DESTRUCTIVE test:
		if (strcmp((char *) curfile, "already mounted") == 0)  {
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
    }
  }
}
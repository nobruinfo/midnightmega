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

void strcopy(char *src, char *dest, unsigned char len) {
  unsigned char c = 0;  // build up a string

  while (src[c] != 0 && c < len)  {
	dest[c] = src[c];
	c++;
  }
  dest[c] = 0;
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

    if (c == 0xa0) return 32; // unused dos file name characters

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
    if (p2sbuf[0] == 0)  {
      p2sbuf[0] = ' ';  // print crash prevention
      p2sbuf[1] = 0;
	}
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

unsigned char messagebox(unsigned char mode, char* message, char* message2,
                         char* message3)  {
  unsigned char clear = 1;
  unsigned char shadow = 1;
  char c;

  mcbox(10, 4, 70, 12, COLOUR_CYAN, BOX_STYLE_INNER, clear, shadow);
  
  revers(1);
  mcputsxy(14, 4, " Midnight Mega ");
  mcputsxy(40, 4, " The MEGA65 file commander ");
  revers(0);

  mcputsxy(12, 6, message);
  mcputsxy(12, 7, message2);
  mcputsxy(12, 8, message3);

  revers(1);
  mcputsxy(12, 10, "   OK   ");
  mcputsxy(60, 10, " Cancel ");
  revers(0);
//  gotoxy(1, 10);
  if (mode == 1)  {
    mcputsxy(2, 1, VERSION);
    mcputsxy(58, 1, "github.com/nobruinfo");
  }
  
  if (mode != 2)  {
    while(1)  {
      c = cgetc();
      switch (c) {
	    case 13: // RETURN
	      return TRUE;
        break;

	    case 3:  // STOP
	    case 27: // Esc
	      return FALSE;
        break;

	    default:
//	      mprintf("val=", c);
//		  cputc(' ');
	    break;
	  }
	}
  }
}

unsigned char valuesbox(unsigned char mode, char* message, char* message2, long val2,
                        char* message3, long val3)  {
  unsigned char ret = messagebox(mode, message, " ", " ");
  gotoxy(12, 7);
  mprintf(message2, val2);
  gotoxy(12, 8);
  mprintf(message3, val3);
  cgetc();
  return ret;
}

// used to be put over previously printed messagebox:
void progress(char* message, char* message2, unsigned char progresspercent)  {
  unsigned char i;

  //        left top right bottom  to clear out previous box contents
  RECT rc = { 12, 6, 68, 8 };
  fillrect(&rc, ' ', COLOUR_CYAN);

  mcputsxy(12, 6, message);
  mcputsxy(12, 7, message2);
  cputcxy(12, 9, 0xa0); // filled space
  for (i = 0; i < 50; i++)  {
    if (progresspercent / 2 > i)  {
	  cputc(0xa0); // filled space
	} else {
	  cputc(0x7b); // '. '
	}
  }
  cputc(0x65); // '| '
  mprintf(" ", progresspercent);
  cputc('%');

  mcputsxy(12, 10, "        ");
  mcputsxy(60, 10, "        ");
}

char* inputbox(char* inputstr, char* message)  {
  messagebox(2, message, "", "");
  gotoxy(12, 8);
  cinput2((unsigned char*) inputstr, 56, CINPUT_ACCEPT_ALL); // | CINPUT_NO_AUTOTRANSLATE);

  gotoxy(1, 10);
  return inputstr;
}

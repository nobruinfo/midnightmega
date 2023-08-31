// *********************************************************
// ***  conioextensions.h strings and scrolling          ***
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
  cputdec(n, 0, 0);
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

void ______navi(void)  {
  char c;
  char pos = 0;

  // title of mcbox is .d81 file name, cannot be read at startup:
  strcpy((char *) curfile, (char *) "already mounted");
  getdirent();
  while (1)  {
    if (pos >= FILEENTRIES || filelist[pos][0] == 0)  pos = 0;
    mcbox(0, 0, 0 + 39, 0 + 24, COLOUR_CYAN, BOX_STYLE_INNER, 1, 1);
    revers(1);
    mcputsxy(12, 0, " ");
	msprintf((char *) curfile);
	cputc(' ');
    revers(0);
    listbox(10, 5, pos, 30);
    c = cgetc();
    switch (c) {
	  case 145: // Crsrup
	    if (pos > 0)  pos--;
      break;
	  case 17: // Crsrdown
	    pos++;
      break;

	  case 0xf2: // Modifier and ASC_F1:
	    if (d81navi())  getdirent();
      break;

	  case 13: // return
		messagebox("not yet implemented");
	    cgetc();
      break;

	  // case 0xF9: // ASC_F9:
	  case 0xFA: // Modifier and ASC_F9:
	    if (getkeymodstate() == KEYMOD_RSHIFT || getkeymodstate() == KEYMOD_LSHIFT)  {
	      clrhome();
    	    return;
	    }
      break;

	  case 27:
	    return;
      break;
	
	  default:
	    mprintf("val=", c);
    }
  }
}

unsigned char testtrack;
unsigned char testsector;
void navi(void)  {
  char c;
  unsigned char pos = 0;
  unsigned char entries = 0;

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

	  case 13: // return
		messagebox("not yet implemented");
		cgetc();
		findnextBAMtracksector(&testtrack, &testsector);
		gotoxy(42, 0);
		mprintf("t=", testtrack);
		mprintf(" s=", testsector);
//	    cgetc();
      break;

	  // case 0xF9: // ASC_F9:
	  case 0xFA: // Modifier and ASC_F9:
	    if (getkeymodstate() == KEYMOD_RSHIFT || getkeymodstate() == KEYMOD_LSHIFT)  {
	      clrhome();
    	    return;
	    }
      break;

	  case 27:
	    return;
      break;
	
	  default:
	    mprintf("val=", c);
    }
  }
}
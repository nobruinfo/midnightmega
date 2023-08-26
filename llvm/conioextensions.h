// *********************************************************
// ***  conioextensions.h strings and scrolling          ***
// *********************************************************

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

void clrhome(void)
{
    clrscr();
    gohome();
}

// instead of printf() variants:
void msprintf(char* str)  {
  cputs((const unsigned char*) petsciitoscreencode_s(str));
}
void mprintf(char* str, long n)  {
  cputs((const unsigned char*) petsciitoscreencode_s(str));
  cputdec(n, 0, 0);
}
void mhprintf(char* str, long n)  {
  cputs((const unsigned char*) petsciitoscreencode_s(str));
  cputhex(n, 2);
}
void mh4printf(char* str, long n)  {
  cputs((const unsigned char*) petsciitoscreencode_s(str));
  cputhex(n, 4);
}
void mcprintf(char* str, char c)  {
  cputs((const unsigned char*) petsciitoscreencode_s(str));
  cputc(c);
}

#define MAXINPUTCHARS 15
unsigned char inputbuffer[MAXINPUTCHARS] = { 0 };
unsigned char inputvalue(char* str)  {
  msprintf(str);
  cputc(' ');
  unsigned char retval = cinput(inputbuffer, MAXINPUTCHARS, CINPUT_ACCEPT_NUMERIC);
  cputln();
  inputbuffer[retval] = 0;
  return 3;
}

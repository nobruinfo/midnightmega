// Midnightmega is an approach to a file manager

// #pragma target(mega65)  target is set in makefile
#include <mega65.h>
#include <mega65-dma.h>
#include <6502.h>
#include <stdlib.h>
#include <string.h>
#include <printf.h>
#include <peekpoke.h>
#include <conio-lines.h>

#include "minime.h"
#include "libc.h"

/* From an old BIt Shifter comment:
The storage of ML programs depends on their size and your needs.
If you don't use graphics, the area $1800 - $1FFF is a good
choice. There you can run them in the standard memory mapping
and have access to BASIC ROM routines, KERNAL, EDITOR and I/O.
If you want to use graphics, which uses the range $1800 - $1FFF,
you have to place your ML programs elsewhere, for example in
BANK 4 or 5. */

#define ATTIC_START 0x8000000
#define FILEDESCRIPTOR_MSB 0x18 // (ATTIC_START + 0)

// char transferarea[1000] = 0;
char *transferarea = (char *)0x0400; // general purpose buffer
char filearea[200] = "abcdef";

static unsigned char XSize, YSize;

void MakeTeeLine (unsigned char Y)
/* Make a divider line */
{
    cputcxy (0, Y, CH_LTEE);
    chline (XSize - 2);
    cputc (CH_RTEE);
}

byte *kbscan = (char *) 0xd610;
char cgetc()
{
  char res;
  while (*kbscan == 0);
  res = *kbscan;
  *kbscan = 0;
  return res;
}

#define initkeyboard()  POKE(0xD610U, 0)
unsigned char kbhit2(void)
{
    unsigned char c = PEEK(0xD610U);
	initkeyboard();
	return c;
}
unsigned char kbhit3(void)
{
  char res;
//  while (*kbscan == 0);
  res = *kbscan;
  *kbscan = 0;
  return res;
}
unsigned char waitforkeyandletgo(void)
{
//    cgetc();
//	return 1;
	
	unsigned char c;         // mega65-book.pdf#20d
	while(kbhit2()) {}       // wait until buffer empty
	while(! (c=kbhit2())) {} // wait and read key
	while(kbhit2()) {}       // wait until buffer empty
	return c;
}
void waitfornokey(void)
{
  while(kbhit3()) {}
}

void cputu(char* pref, unsigned int uint, enum RADIX radix) {
  unsigned int b = (unsigned int) PEEK(0xD012);
  char ss[100];
  const char* s=ss;
  utoa(b, s, radix);
  cputs(pref);
  cputs(ss);
}

// KickC calls conio_mega65_init() before doing main():
void main() {
/*
	// Enable MEGA65 features
    VICIII->KEY = 0x47;   
    VICIII->KEY = 0x53;
    // Enable 48MHz fast mode
    VICIV->CONTROLB |= 0x40;
    VICIV->CONTROLC |= 0x40;
    // no kernal or BASIC rom visible
    *PROCPORT_DDR = PROCPORT_DDR_MEMORY_MASK;
    *PROCPORT = PROCPORT_BASIC_KERNEL_IO; // PROCPORT_RAM_IO;
*/
  // Disable 48MHz fast mode
  VICIV->CONTROLB &= ~0x40;
  VICIV->CONTROLC &= ~0x40;

  unsigned char keycode;
  waitfornokey();

  clrscr();
  gotoxy(0, 0);

#ifdef kihdsikdshg
  unsigned int b = (unsigned int) PEEK(0xD012);
  cputu("Peek is: ", b, DECIMAL);
  cputln();
  cputln();
/*  char ss[100];
  const char* s=ss;
  utoa(b, s, DECIMAL);
  cputs("Peek is: ");
  cputs(ss);
  cputs("\n\n"); */

  // printf("Peek is: %d\n\n", b);
  gotoxy(30, 10);
  // printf("Peek is: %d\n\n", (int) b);
  cputu("Peek is: ", b, DECIMAL);
  while(!waitforkeyandletgo()) {}
  
  // struct tagRECT *ecke;
  // ecke = &ecken;
  // fillrect(ecke, 0xa0, 2);
  
  // conioinit();
  // long* ad=getscreenaddr();
  // printf("Screen address is: %p", ad);
  // char * const SCREEN = DEFAULT_SCREEN;
  // memset(SCREEN, 0xa0, 1000);

    screensize(&XSize, &YSize);

    // disable scrolling
    scroll(0);
    /* Clear the screen hide the cursor, set colors */
    textcolor (COLOR_GRAY3);
    bordercolor (COLOR_BLACK);
    bgcolor (COLOR_BLACK);
#endif
//    printf("\0e");  // upper/lower case mode
//	POKE $D018,PEEK($D018) AND $F0 OR $04  // uppercase
//	POKE $D018,PEEK($D018) AND $F0 OR $06  // lowercase
//	PRINT CHR$(9)  // enable toggle case
//	PRINT CHR$(8)  // disable toggle case
	asm{
	// lower case
		lda	$D018
		ora	#$06
		sta	$D018
	}

#ifdef kihdsikdshg
    clrscr ();
    cursor (0);

    /* Top line */
    cputcxy (0, 0, CH_ULCORNER);
    chline (XSize - 2);
    cputc (CH_URCORNER);

    /* Left line */
    cvlinexy (0, 1, 23);

    /* Bottom line */
    cputc (CH_LLCORNER);
    chline (XSize - 2);
    cputc (CH_LRCORNER);

    /* Right line */
    cvlinexy (XSize - 1, 1, 23);

    /* Several divider lines */
    MakeTeeLine (7);
    MakeTeeLine (22);
  
//  while(!kbhit())  { }
	while(! (keycode=waitforkeyandletgo())) {}
  // printf("kbhit is: %d\n\n", (int)keycode);
  cputu("keycode is: ", keycode, HEXADECIMAL);
  cputln();
  cputln();
#endif
  // cputu("hyppo_setname is: ", hyppo_setname("EXTERNAL.D81"), HEXADECIMAL);
  printf("hyppo_setname is: %d ", (int)hyppo_setname("NOBRU.D81"));
  // cputu("hyppo_d81attach1 is: ", hyppo_d81attach1(), HEXADECIMAL);
  // cputln();
  printf("hyppo_d81attach1 is: %d\n", (int)hyppo_d81attach1());
  while(! (keycode=waitforkeyandletgo())) {}

  clrscr ();
//  for (char i=0; i <= 12; i++) {
  for (char i=0; i <= 32; i++) {
// char i=9;
    cursor (0);
	char j = hyppo_selectdrive(i);
	if (j > i)  continue;
    printf("hyppo_selectdrive %d is: %d ", (int)i, (int) j);
    printf("hyppo_getcurrentdrive is: %d\n", (int)hyppo_getcurrentdrive());

    unsigned char fd = hyppo_opendir();
    printf("hyppo_opendir, file descriptor is: %02x\n", (unsigned int) fd);

    if (fd != $84 && fd != $87) {
      unsigned char readerr = 0;
      do {
//  printf("hyppo_readdir, val is: %04x\n", (unsigned int)hyppo_readdir(fd, FILEDESCRIPTOR_MSB));
//  printf("test, val is: %04x\n", (unsigned int)test(transferarea));
        readerr = hyppo_readdir(fd);
        printf("hyppo_readdir, err is: %04x ", (unsigned int)readerr);
	    if (readerr != $85 && readerr != $ff) {
          printf("filename is: %s\n", getsfn());
        }
	    // while(! (keycode=waitforkeyandletgo())) {}
	    // if (keycode == 128) break;
      } while (readerr != $85 && readerr != $ff);
      printf("hyppo_closedir is: %02x\n", (unsigned int) hyppo_closedir(fd));
	  while(! (keycode=waitforkeyandletgo())) {}
    }
  }

//  printf("dir2 %d", dir2());

//  printf("minimedir %d\n", minimedir());
  
//  testbam();
  testsectors();

#ifdef dshkjdsgjfhgds
  printf("savefiletomemory begin, ");
  char status = saveFileToMemory(8, "TEST", filearea);
  if(status!=0xff) {
    VICII->BORDER_COLOR = 0x02;
	printf("savefiletomemory error is: %d\n", (int) status);
  }

  printf("loadfiletomemory begin, ");
  status = loadFileToMemory(8, "MIDNIGHTMEGA.0", filearea);
  if(status!=0xff) {
    VICII->BORDER_COLOR = 0x02;
	printf("loadfiletomemory error is: %d\n", (int) status);
  }

//  while(! (keycode=waitforkeyandletgo())) {}
//  printf("fileloadexample2 %d", fileloadexample2("hellolibc"));
//  while(! (keycode=waitforkeyandletgo())) {}
//  clrscr ();
//  cursor (0);
//  scroll(1);
//  gotoxy(0, YSize - 5);
//  while(! (keycode=waitforkeyandletgo())) {}
//  initkeyboard();
#endif
  asm {
	  cli
  }
}

// Midnightmega

// #pragma target(mega65)
// #include <mega65.h>
// #include <mega65-dma.h>
// #include <6502.h>    llvm
// #include <stdlib.h>  llvm
#include <string.h>
#include <stdio.h>  // llvm
#include <mega65/conio.h>  // llvm instead of <printf.h>
#include <mega65/memory.h>  // mega65-libc
// #include <peekpoke.h>  llvm
// #include <conio_.h>
// #include <conio-lines.h>

// #include <cbmiec.h>
#include <mega65.h>  // taken from KickC

void _miniSwapSector();
unsigned char _miniReadNextSector(unsigned char drive);
void _miniChainSector();
unsigned char _miniReadByte();
unsigned char _miniFindFile();
unsigned char waitforkeyandletgo(void);

#include "minime.h"
#include "libc.h"

// static unsigned char XSize, YSize;

/*
void MakeTeeLine (unsigned char Y)
/ * Make a divider line * /
{
    cputcxy (0, Y, CH_LTEE);
    chline (XSize - 2);
    cputc (CH_RTEE);
}
*/

// KickC calls conio_mega65_init() before doing main():
int main() {
  unsigned char i=0;
  unsigned char j = 0;
  unsigned char curdrv = 0;
  unsigned char fd = 0;
  unsigned char readerr = 0;

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

  conioinit();
  flushkeybuf();
//  mega65_io_enable();
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
  cgetc();
  
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

// LLVM lowercase is in conioinit():

//    printf("\0e");  // upper/lower case mode
//	POKE $D018,PEEK($D018) AND $F0 OR $04  // uppercase
//	POKE $D018,PEEK($D018) AND $F0 OR $06  // lowercase
//	PRINT CHR$(9)  // enable toggle case
//	PRINT CHR$(8)  // disable toggle case
	asm volatile(
	// lower case
		"lda	$D018\n"
		"ora	#$06\n"
		"sta	$D018\n"
	);

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
  
    cgetc();
  // cputu("keycode is: ", keycode, HEXADECIMAL);
  cputln();
  cputln();
#endif
  // cputu("hyppo_setname is: ", hyppo_setname("EXTERNAL.D81"), HEXADECIMAL);
  mhprintf("hyppo_setname is: ", hyppo_setname("external.d81"));
  // cputu("hyppo_d81attach1 is: ", hyppo_d81attach1(), HEXADECIMAL);
  // cputln();

  // mcprintf(" in ", PEEK(24841)); // $6100
  // mcprintf(" ",    PEEK(24842));
  // mcprintf(" ",    PEEK(24843));
  // mcprintf(" ",    PEEK(24844));

  msprintf(" hyppofn: ");
  msprintf(hyppofn->name);

hyppo_setname("EXTERNAL.D81");
  mhprintf(" hyppo_d81attach1 is: ", hyppo_d81attach1());
  cputln();
  cgetc();
//  clrscr ();
//  for (i = 0; i <= 12; i++) {
  for (i = 0; i <= 32; i++) {
// i=9;
//    cursor (0);
	j = hyppo_selectdrive(i);
//	if (j > i)  continue;
//    printf("hyppo_selectdrive %d is: %d ", (int)i, (int) j);
    mprintf("hyppo_selectdrive ", i);
    mprintf(" is: ", j);
    cputln();

	curdrv = hyppo_getcurrentdrive();
    mhprintf("hyppo_getcurrentdrive is: ", curdrv);
    cputln();

    if (curdrv < 0xff)  {
      fd = hyppo_opendir();
      mhprintf("hyppo_opendir, file descriptor is: ", fd);
      cputln();

      if (fd != 0x84 && fd != 0x87 && fd != 0xff) {
        readerr = 0;
        do {
//  printf("hyppo_readdir, val is: %04x\n", (unsigned int)hyppo_readdir(fd, FILEDESCRIPTOR_MSB));
//  printf("test, val is: %04x\n", (unsigned int)test(transferarea));
          readerr = hyppo_readdir(fd);
          mhprintf("hyppo_readdir, err is: ", readerr);
		  cputc(' ');
          cgetc();
          if (readerr != 0x85 && readerr != 0xff) {
		    getsfn();
            msprintf("filename is: ");
		    msprintf(hyppofn->sfn);
		    cputc(' ');
            mprintf("filenamelength is: ", strlen(hyppofn->sfn));
            cputln();
          }
          cgetc();
	      // if (keycode == 128) break;
        } while (readerr != 0x85 && readerr != 0xff);
        mhprintf("hyppo_closedir is: ", hyppo_closedir(fd));
	    cputln();
        cgetc();
	  }
    }
	cgetc();
  }

return 0;
//		  asm volatile("brk");

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
  
  return 0;
}

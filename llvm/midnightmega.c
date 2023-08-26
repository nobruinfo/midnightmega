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

// to be tidyed into propper .h files:
void _miniSwapSector();
unsigned char _miniReadNextSector(unsigned char drive);
void _miniChainSector();
unsigned char _miniReadByte();
unsigned char _miniFindFile();
unsigned char waitforkeyandletgo(void);
void cputln(void);

#include "conioextensions.h"
#include "minime.h"
#include "libc.h"

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

  msprintf("UPPERCASE lowercase.");
  cputln();
  cgetc();

  textcolor (COLOUR_GREY3);
  bordercolor (COLOUR_BLACK);
  bgcolor (COLOUR_BLACK);

  clrhome();
  gotoxy(0, 0);

// LLVM lowercase is in conioinit():

	asm volatile(
	// lower case
		"lda	$D018\n"
		"ora	#$06\n"
		"sta	$D018\n"
	);

  RECT rc = { 10, 4, 70, 9 };
  unsigned char clear = 0;
  unsigned char shadow = 1;

  box(&rc, COLOUR_WHITE, BOX_STYLE_OUTER, clear, shadow);
  
  cgetc();

  cputln();
  cputln();

  // cputu("hyppo_setname is: ", hyppo_setname("EMPTY.D81"), HEXADECIMAL);
  mhprintf("hyppo_setname is: ", hyppo_setname("EMPTY.d81"));
  // cputu("hyppo_d81attach1 is: ", hyppo_d81attach1(), HEXADECIMAL);
  // cputln();

  // mcprintf(" in ", PEEK(24841)); // $6100
  // mcprintf(" ",    PEEK(24842));
  // mcprintf(" ",    PEEK(24843));
  // mcprintf(" ",    PEEK(24844));

  msprintf(" hyppofn: ");
  msprintf(hyppofn->name);

hyppo_setname("EMPTY.D81");
  mhprintf(" hyppo_d81attach1 is: ", hyppo_d81attach1());
  cputln();
//  clrscr ();
//  for (i = 0; i <= 12; i++) {
  // for (i = 0; i <= 32; i++) {
  // i = inputvalue("input device number for floppy drive:");
  i = 9;
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
          if (readerr != 0x85 && readerr != 0xff) {
		    getsfn();
            msprintf("filename is: ");
		    msprintf(hyppofn->sfn);
		    cputc(' ');
            mprintf("filenamelength is: ", strlen(hyppofn->sfn));
            cputln();
          }
	      // if (keycode == 128) break;
        } while (readerr != 0x85 && readerr != 0xff);
        mhprintf("hyppo_closedir is: ", hyppo_closedir(fd));
	    cputln();
        cgetc();
	  }
    }
//  }

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

  msprintf("Have fun with your Mega65!");
  cputln();
  cgetc();

  asm volatile(
	"rts\n"
    // jmp restor, restore vectors to initial system
	// https://mega65.atlassian.net/wiki/spaces/MEGA65/pages/6619137/Kernel+Jump+Table
	"jmp $ff8a"
  );

  return 0;
}

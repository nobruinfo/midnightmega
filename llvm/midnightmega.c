// Midnightmega

// #pragma target(mega65)
// #include <mega65.h>
// #include <mega65-dma.h>
// #include <6502.h>    llvm
#include <stdlib.h>
#include <string.h>
#include <stdio.h>  // llvm
#include <mega65/conio.h>  // llvm instead of <printf.h>
#include <mega65/memory.h>  // mega65-libc
#include <mega65/hal.h>  // mega65-libc
// #include <peekpoke.h>  llvm
// #include <conio_.h>
// #include <conio-lines.h>

// #include <cbmiec.h>

// #define DEBUG

#include "regions.h"
#include "conioextensions.h"
#include "hyppo.h"
#include "nav.h"

// char* inputstr = (char*) INPUTSTRPAGE;

#include "testjmp.h"
extern unsigned char lfnname[LFNFILENAMELEN];
#include "fileio.h"
extern BAM * BAMsector[2];

// KickC calls conio_mega65_init() before doing main():
int main() {
  conioinit();
  // ASCII lowercase is in conioinit()

  textcolor (COLOUR_CYAN);
  bordercolor (COLOUR_BLACK);
  bgcolor (COLOUR_BLUE);
  
  // setscreensize(80, 50);  or 40 25
  setscreensize(80, 25);
/*
  setuppercase();
  for (int i = 0; i <= 255; i++)  {
	cputcxy(i % 40, i / 40, i);
  }
  cgetc();
*/

  clrhome();
  
  // mprintf("hyppo_getcurrentdrive=", hyppo_getcurrentdrive());

  // testing:
  // clrhome();
  // mprintf("hyppo_get_proc_desc=", hyppo_get_proc_desc());
  // clrhome();
  // mprintf("hyppo_d81detach=", hyppo_d81detach());

/*
  unsigned char majorhyppo;
  unsigned char minorhyppo;
  unsigned char majorHDOS;
  unsigned char minorHDOS;
  hyppo_getversion(&majorhyppo, &minorhyppo, &majorHDOS, &minorHDOS);
  mprintf(" majorhyppo=", majorhyppo);
  mprintf(" minorhyppo=", minorhyppo);
  mprintf(" majorHDOS=", majorHDOS);
  mprintf(" minorHDOS=", minorHDOS);
*/

  mcputsxy(0, 22, "The function keys shown in the bottom line are ");
  msprintf("meant to be used with ");
  mcputsxy(0, 23, "and without [Shift] and [Mega] after the messagebox is dismissed:");
  shortcuts(20, 0);

  if (messagebox(1, "is currently beta and may destroy data structures on",
                    ".d81 and real disks! Please work on backed up media.",
			        "Press RETURN to continue, STOP to halt.", 0))  {
    navi(0);
/*
    strcpy((char *) lfnname, (char *) "midnightmega.0");
	char* pointer = (char*) 0x1600;
	printf("result: %04x ",
	  loadFileToMemory(8, (char*) lfnname, pointer));
    cputln();
    cgetc();
    flushkeybuf();
*/
  }

  clrhome();
  msprintf("Have fun with your MEGA65!");
  usleep(2000000); // microseconds
//  cputln();
//  cgetc();
//  flushkeybuf();
hyppo_reset();

  return 0;
}

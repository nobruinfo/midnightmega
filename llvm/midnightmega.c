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
// #include <peekpoke.h>  llvm
// #include <conio_.h>
// #include <conio-lines.h>

// #include <cbmiec.h>
#include <mega65.h>  // taken from KickC

// #define DEBUG

#include "regions.h"
#include "conioextensions.h"
#include "nav.h"

// char* inputstr = (char*) INPUTSTRPAGE;

// KickC calls conio_mega65_init() before doing main():
int main() {
  unsigned char i=0;
  unsigned char j = 0;
  unsigned char curdrv = 0;
  unsigned char fd = 0;
  unsigned char readerr = 0;

  asm volatile(
	"php\n"
	"pha\n"
	"phx\n"
	"phy\n"
	"phz"
  );

  // Backup ZP:
//  lcopy(0, ATTICZPBACKUP, BLOCKSIZE);

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

  conioinit();
  // ASCII lowercase is in conioinit()
//  setuppercase();  // to activate PETSCII
//  POKE(0xD018U, PEEK(0xD018U) ^ 0x02); // toggle case as if [Mega][Alt] was pressed
//  flushkeybuf();  <-- done in conioinit()
//  mega65_io_enable();

//  POKE(0,64);
  // Disable 48MHz fast mode
  VICIV->CONTROLB &= ~(VICIV_FAST);
  VICIV->CONTROLC &= ~(VICIV_VFAST);
  sethotregs(0);  // make effects imminent

  msprintf("UPPERCASE lowercase."); // Atticend=", ATTICEND);
  cputln();
  cgetcd();

  textcolor (COLOUR_CYAN);
  bordercolor (COLOUR_BLACK);
  bgcolor (COLOUR_BLUE);
  
  // setscreensize(80, 50);  or 40 25
  setscreensize(80, 25);

  clrhome();
/*
  mh4printf("ATTICZPBACKUP 32addr is: ", ATTICZPBACKUP >> 16);
  mh4printf(" ", ATTICZPBACKUP & 0xffff);
  cputln();
  printf("ATTICZPBACKUP 32addr is: %08lx", (unsigned long) ATTICZPBACKUP);
  cgetc();
*/
  if (messagebox(1, "is currently beta and may destroy data structures on",
                    ".d81 and real disks! Please work on backed up media.",
			        "Press RETURN to continue, STOP to halt."))  {

#ifdef sduhgsiuzfgsuzd
  // cputu("hyppo_setname is: ", hyppo_setname("EMPTY.D81"), HEXADECIMAL);
  mhprintf("hyppo_setname is: ", hyppo_setname("DATADISK.d81"));
  // cputu("hyppo_d81attach1 is: ", hyppo_d81attach1(), HEXADECIMAL);
  // cputln();

  // mcprintf(" in ", PEEK(24841)); // $6100
  // mcprintf(" ",    PEEK(24842));
  // mcprintf(" ",    PEEK(24843));
  // mcprintf(" ",    PEEK(24844));

  msprintf(" hyppofn: ");
  msprintf(hyppofn->name);

hyppo_setname("DATADISK.D81");
  mhprintf(" hyppo_d81attach1 is: ", hyppo_d81attach1());
  cputln();
  cgetc();

//  clrscr ();
//  for (i = 0; i <= 12; i++) {
  // for (i = 0; i <= 32; i++) {
  // i = inputvalue("input device number for floppy drive:");
  i = 1;
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
        cgetcd();
	  }
    }
//  }

//		  asm volatile("brk");

//  printf("dir2 %d", dir2());

//  printf("minimedir %d\n", minimedir());
  
//  testbam();

/*
  inputbox(inputstr, "Enter track number 1..80, 0 to quit:");
  unsigned char track = atoi(inputstr);
  if (track > 0)  {
    inputbox(inputstr, "Enter sector number 0..39:");
    testsectors(track, atoi(inputstr));
  }

  // lcopy(uint32_t source_address, uint32_t destination_address, uint16_t count);
  lcopy(SECTBUFUPPER, ATTICFILEBUFFER, BLOCKSIZE);
*/

  readblockchain(ATTICDIRENTBUFFER, DIRENTBLOCKS, 1, 40, 3);
  readblockchain(ATTICFILEBUFFER, DATABLOCKS, 1, 45, 8);
  msprintf("dirent in attic done.");
  cgetcd();
#endif

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

    navi(0);
  }
  clrhome();
  msprintf("Have fun with your Mega65!");
  cputln();
  cgetc();
  flushkeybuf();

  // Restore ZP:
//  lcopy(ATTICZPBACKUP, 0, BLOCKSIZE);

  asm volatile(
	"plz\n"
	"ply\n"
	"plx\n"
	"pla\n"
	"plp\n"
	"cli"
  );

  asm volatile(
	"lda #$37\n"  // reinstate previous banking
	"sta $01\n"
//	"rts\n"
    // jmp restor, restore vectors to initial system
	// https://mega65.atlassian.net/wiki/spaces/MEGA65/pages/6619137/Kernel+Jump+Table
	"jmp ($FFF6)" // ($FFFC)"  // $e4b8" // $ff8a"
  );

  return 0;
}

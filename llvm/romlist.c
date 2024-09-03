#include <string.h>
#include <stdint.h>
#include <mega65/conio.h>  // llvm instead of <printf.h>
#include <mega65/memory.h>  // mega65-libc
#include <mega65/hal.h>  // mega65-libc
#include "regions.h"
#include "hyppo.h"
#include "fileio.h"
#include "conioextensions.h"

#define SECTHYPLOAD      0xFFD6E00
#define FILENAMECOLON 17
#define TEXTCOLON     30

extern DATABLOCK * worksector[2];
extern struct HYPPOFILENAME* const hyppofn;

void romlist(unsigned char ypos)  {
  unsigned char fd = 0;
  unsigned int i;

  for (i = 0; i < 11; i++)  {
	if (i < 10)  {
	  strcpy(hyppofn->name, "MEGA650.ROM");
	  hyppofn->name[6] = '0' + i;
	} else {
	  strcpy(hyppofn->name, "MEGA65.ROM");
	}
	hyppo_setname(hyppofn->name);
    mcputsxy(FILENAMECOLON, i + ypos, hyppofn->name);
	fd = hyppo_findfirst();
	if (fd == 0x88)  {
      mcputsxy(TEXTCOLON, i + ypos, "file not found.");
	} else {
	  fd = hyppo_openfile(fd);
	  if (fd == 0x84)  {
        mcputsxy(TEXTCOLON, i + ypos, "too many open files.");
	  } else {
	    if (fd == 0x86)  {
          mcputsxy(TEXTCOLON, i + ypos, "file is a directory.");
	    } else {
	      if (hyppo_readfile(fd) == 0x89)  {
		    mcputsxy(TEXTCOLON, i + ypos, "invalid file descriptor.");
	      } else {
	        hyppo_closefile(fd);
			// mcputsxy(TEXTCOLON, i + ypos, "file loaded into $FFD6E00 .. $FFD6FF");

			DATABLOCK* ws = worksector[0];
			
			lfill((uint32_t) ws, 0, BLOCKSIZE);
			lcopy(SECTHYPLOAD + 0x16, (uint32_t) ws, BLOCKSIZE);
			mcputsxy(TEXTCOLON, i + ypos, (char *) ws);
			
//			cgetc();
		  }
		}
	  }
	}
  }
}

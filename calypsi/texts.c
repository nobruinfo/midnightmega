#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>
#include <mega65/conio.h>  // llvm instead of <printf.h>
#include <mega65/memory.h>  // mega65-libc
#include <mega65/hal.h>  // mega65-libc
#include "regions.h"
#include "conioextensions.h"
#include "hyppo.h"
#include "fileio.h"

// *********************************************************
// ***  texts.c Midnight Mega's text mgmt                ***
// *********************************************************

unsigned char blockreadbyte(unsigned int byte, unsigned char raw)  {
  unsigned char data;
  unsigned int b = 0; // higher byte number that skips t/s bytes
  unsigned int i;

  for (i = 0; i <= byte; i++)  {
    // skip track/sector bytes:
    if ((b & 0xff) == 0)  {
      b += 2;
    }
    b++;
    // valuesbox(0, "bytes", "i=", i, "b=", b);
  }
  // b is pointing to the next data byte, so use previous one:
  b--;
  lcopy(ATTICTEXTBUFFER + b, (uint32_t) &data, 1);
  // treat carriage return as terminator to use Petcat:
  if (data == 13 && raw == TRUE)  data = 0;
  // lpoke(getscreenaddr(), data);
  // valuesbox(0, "bytes", "i=", i, "b=", b);
  return data;
}

/*
unsigned char readblockstring(unsigned char b, char *str) {
    char * src = str;
    while(blockreadbyte(b)) {
        *src = blockreadbyte(b);
        src++;
        b++;
    }
    *src = 0;
    return b;
}
*/

// char str[60] = "";
void text(unsigned char instance, unsigned char continuous)  {
  unsigned int b = 0;
  unsigned int curinstance = 0;
  unsigned char c;
  unsigned char clear = 1;  // @@@@
  unsigned char shadow = 1; // @@@@

  while (curinstance <= instance)  {
    switch (blockreadbyte(b, FALSE)) {
      case 0: // terminator
        mprintf("ERROR text data instance not found! ", instance);
        cgetc();
        return;
      break;
      case 1: // print with x/y
        if (curinstance == instance)  {
          gotoxy(blockreadbyte(b + 1, FALSE), blockreadbyte(b + 2, FALSE));
        }
        // b = readblockstring(b + 3, str);
        b += 3;
        while ((c = blockreadbyte(b, TRUE)))  {
          if (curinstance == instance)  {
            cputcctrl(c);
          }
          b++;
        }
        b++;  // skip string terminator

        if (curinstance == instance)  {
          // valuesbox(0, "after string", "highbyte=", (b / 256),
          //              "next byte=", (b % 256));
          // cgetc();
          if (!continuous)  {  // if found the whole function needs to end:
            return;
          } else {  // exceed found instance if in continuous mode:
            instance++;
          }
        }
        curinstance++;
      break;

      case 2: // draw box
        if (curinstance == instance)  {
          mcbox(blockreadbyte(b + 1, FALSE),
                blockreadbyte(b + 2, FALSE),
                blockreadbyte(b + 3, FALSE),
                blockreadbyte(b + 4, FALSE),
                COLOUR_CYAN, BOX_STYLE_INNER, clear, shadow);
        }
        b += 6; // four data and one terminator to skip

        if (curinstance == instance)  {
          if (!continuous)  {  // if found the whole function needs to end:
            return;
          } else {  // exceed found instance if in continuous mode:
            instance++;
          }
        }
        curinstance++;
      break;

      case 10: // stop continuous
        if (curinstance == instance)  {
        }
        b += 2; // one terminator to skip

        // if found the whole function needs to end:
        if (curinstance == instance)  {
          return;
        }
        curinstance++;
      break;

      default:
        mprintf("ERROR text data instance function undefined! ",
                blockreadbyte(b, FALSE));
        mprintf(" byte=", b);
        cgetc();
        return;
      break;
    }
    // valuesbox(0, "text", "i=", instance, "byte=", blockreadbyte(instance));
  }
}

// Romlister

#include <stdlib.h>
#include <string.h>
#include <stdio.h>  // llvm
#include <mega65/conio.h>  // llvm instead of <printf.h>
#include <mega65/memory.h>  // mega65-libc
#include <mega65/hal.h>  // mega65-libc

#include "regions.h"
#include "conioextensions.h"
#include "hyppo.h"
#include "fileio.h"
#include "romlist.h"

// KickC calls conio_mega65_init() before doing main():
int main() {
  conioinit();
  // ASCII lowercase is in conioinit()

  clrhome();
  textcolor (COLOUR_CYAN);
  
  setscreensize(80, 25);
  romlist(wherey() + 1);

  cputln();
  cputln();
  msprintf("Have fun with your MEGA65!");
  usleep(8000000); // microseconds

  return 0;
}

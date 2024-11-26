// *********************************************************
// ***  texts.h Midnight Mega's text mgmt                ***
// *********************************************************

// planned to be used in midnightmegatext.src:
// https://www.c64-wiki.de/wiki/Petcat#Nicht_druckbare_Zeichen

// disk blocks to read into Attic:
#define TEXTBLOCKS 50

// literals for accessing the correct instance (line number - 1):
#define HELPBEGIN (101 - 1)
#define HELP0     (107 - 1)
#define HELP1     (124 - 1)
#define HELP2     (142 - 1)
#define HELPMAX   2

void text(unsigned char instance, unsigned char continuous);

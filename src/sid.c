#include <mega65/hal.h>  // mega65-libc
#include <mega65.h>  // taken from KickC
#include "sid.h"

// *********************************************************
// ***  sid.c Midnight Mega's SID minimal effects        ***
// *********************************************************

// extern struct MOS6581_SID * const SID;
// struct MOS6581_SID * const SID3 = (struct MOS6581_SID *)0xd440; before Calypsi

const int scale[] = {
	0x1125,	0x133F,	0x159A,	0x16E3,	
	0x19B1, 0x1CD6,	0x205E,	0x22AF
};

/*
    unsigned int freq;
    /// Channel 1 Pulse Width (0-4095)
    unsigned int pw;
    /// Channel 1 Control
    char ctrl;
    /// Channel 1 Attack/decay
    char ad;
    /// Channel 1 Sustain/Release
    char CH1_SUSTAIN_RELEASE;
*/

void sidtest2 (void) {
	unsigned int i;
	unsigned char t;
	
	SID1.v1.pw      = 0x1F; 	// Volume
	SID1.v1.ad    = 0x09; 	// Attack/decay voice 1
	
	for (t = 0 ; t < sizeof(scale) / 2; t++) {
		SID1.v1.freq  = scale[t];	// Frequency 
		SID1.v1.ctrl  = 0x11;	// Control voice 1
//		for (i = 0 ; i < 5000; i++) {}
	    usleep(2000000); // microseconds
		SID1.v1.ctrl  = 0x10;
//		for (i = 0 ; i < 1000 ; i++) {}
	    usleep(2000000); // microseconds
	}		
}

void sidbong(void) {
	unsigned int i;
	unsigned char t;
	
	SID1.v1.pw      = 0x1F; 	// Volume
	SID1.v1.ad    = 0x09; 	// Attack/decay voice 1
	
	SID1.v1.freq  = 0x1125;	// Frequency 
	SID1.v1.ctrl  = 0x11;	// Control voice 1
	
	SID3.v1.pw      = 0x1F; 	// Volume
	SID3.v1.ad    = 0x09; 	// Attack/decay voice 1
	
	SID3.v1.freq  = 0x159A;	// Frequency 
	SID3.v1.ctrl  = 0x11;	// Control voice 1

	usleep(200000); // microseconds
	SID1.v1.ctrl  = 0x10;
	SID3.v1.ctrl  = 0x10;
}

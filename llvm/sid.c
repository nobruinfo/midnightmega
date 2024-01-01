#include <mega65/hal.h>  // mega65-libc
#include <mega65.h>  // taken from KickC
#include "sid.h"

// *********************************************************
// ***  sid.c Midnight Mega's SID minimal effects        ***
// *********************************************************

// extern struct MOS6581_SID * const SID;
struct MOS6581_SID * const SID3 = (struct MOS6581_SID *)0xd440;

const int scale[] = {
	0x1125,	0x133F,	0x159A,	0x16E3,	
	0x19B1, 0x1CD6,	0x205E,	0x22AF
};

/*
    unsigned int CH1_FREQ;
    /// Channel 1 Pulse Width (0-4095)
    unsigned int CH1_PULSE_WIDTH;
    /// Channel 1 Control
    char CH1_CONTROL;
    /// Channel 1 Attack/decay
    char CH1_ATTACK_DECAY;
    /// Channel 1 Sustain/Release
    char CH1_SUSTAIN_RELEASE;
*/

void sidtest2 (void) {
	unsigned int i;
	unsigned char t;
	
	SID->CH1_PULSE_WIDTH      = 0x1F; 	// Volume
	SID->CH1_ATTACK_DECAY    = 0x09; 	// Attack/decay voice 1
	
	for (t = 0 ; t < sizeof(scale) / 2; t++) {
		SID->CH1_FREQ  = scale[t];	// Frequency 
		SID->CH1_CONTROL  = 0x11;	// Control voice 1
//		for (i = 0 ; i < 5000; i++) {}
	    usleep(2000000); // microseconds
		SID->CH1_CONTROL  = 0x10;
//		for (i = 0 ; i < 1000 ; i++) {}
	    usleep(2000000); // microseconds
	}		
}

void sidbong(void) {
	unsigned int i;
	unsigned char t;
	
	SID->CH1_PULSE_WIDTH      = 0x1F; 	// Volume
	SID->CH1_ATTACK_DECAY    = 0x09; 	// Attack/decay voice 1
	
	SID->CH1_FREQ  = 0x1125;	// Frequency 
	SID->CH1_CONTROL  = 0x11;	// Control voice 1
	
	SID3->CH1_PULSE_WIDTH      = 0x1F; 	// Volume
	SID3->CH1_ATTACK_DECAY    = 0x09; 	// Attack/decay voice 1
	
	SID3->CH1_FREQ  = 0x159A;	// Frequency 
	SID3->CH1_CONTROL  = 0x11;	// Control voice 1

	usleep(200000); // microseconds
	SID->CH1_CONTROL  = 0x10;
	SID3->CH1_CONTROL  = 0x10;
}

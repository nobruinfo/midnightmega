/// @file
/// MEGA65 Registers and Constants
#ifndef __MEGA65__
#error "Target platform must be MEGA65"
#endif
#include <mos6526.h>
#include <mos6569.h>
#include <mos6581.h>
#include <mos4569.h>
#include <mega65-viciv.h>
#include <mega65-memorymapper.h>
#include <mega65-f018.h>
#include <mega65-math.h>
#include <mega65-hypervisor.h>

/// I/O Personality selection
volatile char * const IO_KEY = (char*)0xd02f;
/// C65 Banking Register
volatile char * const IO_BANK = (char*)0xd030;
/// Map 2nd KB of colour RAM $DC00-$DFFF (hiding CIA's)
const char CRAM2K = 0b00000001;

/// Processor port data direction register
char*  const PROCPORT_DDR = (char*)0x00;
/// Mask for PROCESSOR_PORT_DDR which allows only memory configuration to be written
const char PROCPORT_DDR_MEMORY_MASK = 0b00000111;
/// Processor Port Register controlling RAM/ROM configuration and the datasette
char*  const PROCPORT = (char*)0x01;
/// RAM in all three areas 0xA000, 0xD000, 0xE000
const char PROCPORT_RAM_ALL         = 0b00000000;
/// RAM in 0xA000, 0xE000 I/O in 0xD000
const char PROCPORT_RAM_IO          = 0b00000101;
/// RAM in 0xA000, 0xE000 CHAR ROM in 0xD000
const char PROCPORT_RAM_CHARROM     = 0b00000001;
/// RAM in 0xA000, I/O in 0xD000, KERNEL in 0xE000
const char PROCPORT_KERNEL_IO       = 0b00000110;
/// BASIC in 0xA000, I/O in 0xD000, KERNEL in 0xE000
const char PROCPORT_BASIC_KERNEL_IO = 0b00000111;

/// The VIC-II MOS 6567/6569
struct MOS6569_VICII* const VICII = (struct MOS6569_VICII*)0xd000;
/// The VIC III MOS 4567/4569
struct MOS4569_VICIII* const VICIII = (struct MOS4569_VICIII*)0xd000;
/// The VIC IV
struct MEGA65_VICIV* const VICIV = (struct MEGA65_VICIV*)0xd000;
/// The address of the CHARGEN character set
char * const CHARGEN = (char*)0xd000;
/// Palette RED
char * const PALETTE_RED = (char*)0xd100;
/// Palette GREEN
char * const PALETTE_GREEN = (char*)0xd200;
/// Palette BLUE
char * const PALETTE_BLUE = (char*)0xd300;
/// The SID MOS 6581/8580
struct MOS6581_SID * const SID = (struct MOS6581_SID *)0xd400;
/// DMAgic F018 Controller
struct F018_DMAGIC * const DMA = (struct F018_DMAGIC *)0xd700;
/// Color Ram
char * const COLORRAM = (char*)0xd800;

/// Default address of screen character matrix
#ifdef __MEGA65_C64__
    char * const DEFAULT_SCREEN = (char*)0x0400;
#else
    char * const DEFAULT_SCREEN = (char*)0x0800;
#endif

/// The CIA#1: keyboard matrix, joystick #1/#2
struct MOS6526_CIA * const CIA1 = (struct MOS6526_CIA *)0xdc00;
/// The CIA#2: Serial bus, RS-232, VIC memory bank
struct MOS6526_CIA * const CIA2 = (struct MOS6526_CIA *)0xdd00;
/// CIA#1 Interrupt for reading in ASM
char * const CIA1_INTERRUPT = (char*)0xdc0d;
/// CIA#2 timer A&B as one single 32-bit value
unsigned long* const CIA2_TIMER_AB = (unsigned long*)0xdd04;
/// CIA#2 Interrupt for reading in ASM
char * const CIA2_INTERRUPT = (char*)0xdd0d;

/// Pointer to interrupt function
typedef void (*IRQ_TYPE)(void);

/// The vector used when the KERNAL serves IRQ interrupts
IRQ_TYPE * const KERNEL_IRQ = (IRQ_TYPE*)0x0314;
/// The vector used when the KERNAL serves NMI interrupts
IRQ_TYPE * const KERNEL_NMI = (IRQ_TYPE*)0x0318;
/// The vector used when the HARDWARE serves IRQ interrupts
IRQ_TYPE * const HARDWARE_IRQ = (IRQ_TYPE*)0xfffe;

/// The colors of the C64
const char BLACK = 0x0;
const char WHITE = 0x1;
const char RED = 0x2;
const char CYAN = 0x3;
const char PURPLE = 0x4;
const char GREEN = 0x5;
const char BLUE = 0x6;
const char YELLOW = 0x7;
const char ORANGE = 0x8;
const char BROWN = 0x9;
const char PINK = 0xa;
const char DARK_GREY= 0xb;
const char GREY = 0xc;
const char LIGHT_GREEN = 0xd;
const char LIGHT_BLUE = 0xe;
const char LIGHT_GREY = 0xf;

/// Get the value to store into D018 to display a specific screen and charset/bitmap
/// Optimized for ASM from (char)((((unsigned int)screen&0x3fff)/0x40)|(((unsigned int)charset&0x3fff)/0x400));
char toD018(char*  screen, char*  gfx);

/// Get the value to store into DD00 (CIA 2 port A) to choose a specific VIC bank
/// Optimized for ASM from %00000011 ^ (char)((unsigned int)gfx/0x4000)
char toDd00(char*  gfx);

/// Get the sprite pointer for a sprite.
/// The sprite pointer is the index of the sprite within the graphics bank and equal to the sprite (char)(sprite_addr/64)
/// The sprite pointers are stored SCREEN+0x3f8+sprite_id to set the pointer of each sprite
char toSpritePtr(char*  sprite);

/// Select a specific VIC graphics bank by setting the CIA 2 port A (0xdd00) as needed
void vicSelectGfxBank(char*  gfx);
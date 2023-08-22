/// @file
/// Functions for using the F018 DMA for very fast copying or filling of memory
#include <mega65.h>

/// Copy a memory block within the first 64K memory space using MEGA65 DMagic DMA
/// Copies the values of num bytes from the location pointed to by source directly to the memory block pointed to by destination.
/// @param dest The destination address (within the MB and bank)
/// @param src The source address (within the MB and bank)
/// @param num The number of bytes to copy
void memcpy_dma(void* dest, void* src, unsigned int num);

/// Copy a memory block anywhere in first 4MB memory space using MEGA65 DMagic DMA
/// Copies the values of num bytes from the location pointed to by source directly to the memory block pointed to by destination.
/// @param dest_bank The 64KB bank for the destination (0-127)
/// @param dest The destination address (within the MB and bank)
/// @param src_bank The 64KB bank for the source (0-127)
/// @param src The source address (within the MB and bank)
/// @param num The number of bytes to copy
void memcpy_dma4(char dest_bank, void* dest, char src_bank, void* src, unsigned int num);

/// Copy a memory block anywhere in the entire 256MB memory space using MEGA65 DMagic DMA
/// Copies the values of num bytes from the location pointed to by source directly to the memory block pointed to by destination.
/// @param dest_mb The MB value for the destination (0-255)
/// @param dest_bank The 64KB bank for the destination (0-15)
/// @param dest The destination address (within the MB and bank)
/// @param src_mb The MB value for the source (0-255)
/// @param src_bank The 64KB bank for the source (0-15)
/// @param src The source address (within the MB and bank)
/// @param num The number of bytes to copy
void memcpy_dma256(char dest_mb, char dest_bank, void* dest, char src_mb, char src_bank, void* src, unsigned int num);

/// Fill a memory block within the first 64K memory space using MEGA65 DMagic DMA
/// Fills the values of num bytes at the destination with a single byte value.
/// @param dest The destination address (within the MB and bank)
/// @param fill The char to fill with
/// @param num The number of bytes to copy
void memset_dma(void* dest, char fill, unsigned int num);

/// Set a memory block anywhere in the entire 256MB memory space using MEGA65 DMagic DMA
/// Sets the values of num bytes to the memory block pointed to by destination.
/// @param dest_mb The MB value for the destination (0-255)
/// @param dest_bank The 64KB bank for the destination (0-15)
/// @param dest The destination address (within the MB and bank)
/// @param fill The byte to fill into the memory
/// @param num The number of bytes to copy
void memset_dma256(char dest_mb, char dest_bank, void* dest, char fill, unsigned int num);
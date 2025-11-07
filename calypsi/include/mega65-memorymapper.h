/// @file
/// MEGA65 Memory Mapper allows the 6502 CPU to access up to 256MB of memory by remapping where the eight 8K blocks point in real memory.
///
/// The memory mapping is configured through the new MAP instruction of the MOS 4510.
/// https://mega65.org/
/// https://mega.scryptos.com/sharefolder-link/MEGA/MEGA65+filehost/Docs/MEGA65-Book_draft.pdf
/// https://github.com/MEGA65/mega65-core/blob/master/src/vhdl/gs4510.vhdl
/// http://www.zimmers.net/cbmpics/cbm/c65/c65manual.txt
/// http://anyplatform.net/media/guides/cpus/65xx%20Processor%20Data.txt

/// Bit representing 8K block #0 of the 64K addressable memory ($0000-$1fff)
const unsigned char MEMORYBLOCK_0000 = 0b00000001;
/// Bit representing 8K block #1 of the 64K addressable memory ($2000-$3fff)
const unsigned char MEMORYBLOCK_2000 = 0b00000010;
/// Bit representing 8K block #2 of the 64K addressable memory ($4000-$5fff)
const unsigned char MEMORYBLOCK_4000 = 0b00000100;
/// Bit representing 8K block #3 of the 64K addressable memory ($6000-$7fff)
const unsigned char MEMORYBLOCK_6000 = 0b00001000;
/// Bit representing 8K block #4 of the 64K addressable memory ($8000-$9fff)
const unsigned char MEMORYBLOCK_8000 = 0b00010000;
/// Bit representing 8K block #5 of the 64K addressable memory ($a000-$bfff)
const unsigned char MEMORYBLOCK_A000 = 0b00100000;
/// Bit representing 8K block #6 of the 64K addressable memory ($c000-$dfff)
const unsigned char MEMORYBLOCK_C000 = 0b01000000;
/// Bit representing 8K block #7 of the 64K addressable memory ($e000-$ffff)
const unsigned char MEMORYBLOCK_E000 = 0b10000000;

/// Remap some of the eight 8K memory blocks in the 64K address space of the 6502 to point somewhere else in the first 1MB memory space of the MEGA65.
/// After the remapping the CPU will access the mapped memory whenever it uses instructions that access a remapped block.
/// See section 2.3.4 in http://www.zimmers.net/cbmpics/cbm/c65/c65manual.txt for a description of the CPU memory remapper of the C65.
/// remapBlocks: Indicates which 8K blocks of the 6502 address space to remap. Each bit represents one 8K block
/// - bit 0  Memory block $0000-$1fff. Use constant MEMORYBLOCK_0000.
/// - bit 1  Memory block $2000-$3fff. Use constant MEMORYBLOCK_2000.
/// - bit 2  Memory block $4000-$5fff. Use constant MEMORYBLOCK_4000.
/// - bit 3  Memory block $6000-$7fff. Use constant MEMORYBLOCK_6000.
/// - bit 4  Memory block $8000-$9fff. Use constant MEMORYBLOCK_8000.
/// - bit 5  Memory block $a000-$bfff. Use constant MEMORYBLOCK_A000.
/// - bit 6  Memory block $c000-$dfff. Use constant MEMORYBLOCK_C000.
/// - bit 7  Memory block $e000-$ffff. Use constant MEMORYBLOCK_E000.
/// lowerPageOffset: Offset that will be added to any remapped blocks in the lower 32K of memory (block 0-3).
/// The offset is a page offset (meaning it is multiplied by 0x100). Only the lower 12bits of the passed value is used.
/// - If block 0 ($0000-$1fff) is remapped it will point to lowerPageOffset*$100.
/// - If block 1 ($2000-$3fff) is remapped it will point to lowerPageOffset*$100 + $2000.
/// - If block 2 ($4000-$5fff) is remapped it will point to lowerPageOffset*$100 + $4000.
/// - If block 3 ($6000-$7fff) is remapped it will point to lowerPageOffset*$100 + $6000.
/// upperPageOffset: Offset that will be added to any remapped blocks in the upper 32K of memory (block 4-7).
/// The offset is a page offset (meaning it is multiplied by 0x100). Only the lower 12bits of the passed value is used.
/// - If block 4 ($8000-$9fff) is remapped it will point to upperPageOffset*$100 + $8000
/// - If block 5 ($a000-$bfff) is remapped it will point to upperPageOffset*$100 + $a000.
/// - If block 6 ($c000-$dfff) is remapped it will point to upperPageOffset*$100 + $c000.
/// - If block 7 ($e000-$ffff) is remapped it will point to upperPageOffset*$100 + $e000.
void memoryRemap(unsigned char remapBlocks, unsigned int lowerPageOffset, unsigned int upperPageOffset);

/// Remap a single 8K memory block in the 64K address space of the 6502 to point somewhere else in the first 1MB memory space of the MEGA65.
/// All the other 8K memory blocks will not be mapped and will point to their own address in the lowest 64K of the MEGA65 memory.
/// blockPage: Page address of the 8K memory block to remap (ie. the block that is remapped is $100 * the passed page address.)
/// memoryPage: Page address of the memory that the block should point to in the 1MB memory space of the MEGA65.
/// Ie. the memory that will be pointed to is $100 * the passed page address. Only the lower 12bits of the passed value is used.
void memoryRemapBlock(unsigned char blockPage, unsigned int memoryPage);

/// Remap some of the eight 8K memory blocks in the 64K address space of the 6502 to point somewhere else in the entire 256MB memory space of the MEGA65.
/// After the remapping the CPU will access the mapped memory whenever it uses instructions that access a remapped block.
/// See section 2.3.4 in http://www.zimmers.net/cbmpics/cbm/c65/c65manual.txt for a description of the CPU memory remapper of the C65.
/// See Appendix G in file:///Users/jespergravgaard/Downloads/MEGA65-Book_draft%20(5).pdf for a description of the CPU memory remapper of the MEGA65.
/// remapBlocks: Indicates which 8K blocks of the 6502 address space to remap. Each bit represents one 8K block
/// - bit 0  Memory block $0000-$1fff. Use constant MEMORYBLOCK_0000.
/// - bit 1  Memory block $2000-$3fff. Use constant MEMORYBLOCK_2000.
/// - bit 2  Memory block $4000-$5fff. Use constant MEMORYBLOCK_4000.
/// - bit 3  Memory block $6000-$7fff. Use constant MEMORYBLOCK_6000.
/// - bit 4  Memory block $8000-$9fff. Use constant MEMORYBLOCK_8000.
/// - bit 5  Memory block $a000-$bfff. Use constant MEMORYBLOCK_A000.
/// - bit 6  Memory block $c000-$dfff. Use constant MEMORYBLOCK_C000.
/// - bit 7  Memory block $e000-$ffff. Use constant MEMORYBLOCK_E000.
/// lowerPageOffset: Offset that will be added to any remapped blocks in the lower 32K of memory (block 0-3).
/// The offset is a page offset (meaning it is multiplied by 0x100). Only the lower 20bits of the passed value is used.
/// - If block 0 ($0000-$1fff) is remapped it will point to lowerPageOffset*$100.
/// - If block 1 ($2000-$3fff) is remapped it will point to lowerPageOffset*$100 + $2000.
/// - If block 2 ($4000-$5fff) is remapped it will point to lowerPageOffset*$100 + $4000.
/// - If block 3 ($6000-$7fff) is remapped it will point to lowerPageOffset*$100 + $6000.
/// upperPageOffset: Offset that will be added to any remapped blocks in the upper 32K of memory (block 4-7).
/// The offset is a page offset (meaning it is multiplied by 0x100). Only the lower 20bits of the passed value is used.
/// - If block 4 ($8000-$9fff) is remapped it will point to upperPageOffset*$100 + $8000
/// - If block 5 ($a000-$bfff) is remapped it will point to upperPageOffset*$100 + $a000.
/// - If block 6 ($c000-$dfff) is remapped it will point to upperPageOffset*$100 + $c000.
/// - If block 7 ($e000-$ffff) is remapped it will point to upperPageOffset*$100 + $e000.
void memoryRemap256M(unsigned char remapBlocks, unsigned long lowerPageOffset, unsigned long upperPageOffset);
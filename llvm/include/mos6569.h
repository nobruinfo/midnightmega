/// @file
/// MOS 6567 / 6569 Video Interface Chip (VIC II)
///
///  http://archive.6502.org/datasheets/mos_6567_vic_ii_preliminary.pdf
///  https://dustlayer.com/vic-ii/2013/4/22/when-visibility-matters
///  http://www.zimmers.net/cbmpics/cbm/c64/vic-ii.txt

/// MOS 6567 / 6569 Video Interface Chip (VIC II)
struct MOS6569_VICII {
    /// $D000 X-Coordinate Sprite#0
    char SPRITE0_X;
    /// $D001 Y-Coordinate Sprite#0
    char SPRITE0_Y;
    /// $D002 X-Coordinate Sprite#1
    char SPRITE1_X;
    /// $D003 Y-Coordinate Sprite#1
    char SPRITE1_Y;
    /// $D004 X-Coordinate Sprite#2
    char SPRITE2_X;
    /// $D005 Y-Coordinate Sprite#2
    char SPRITE2_Y;
    /// $D006 X-Coordinate Sprite#3
    char SPRITE3_X;
    /// $D007 Y-Coordinate Sprite#3
    char SPRITE3_Y;
    /// $D008 X-Coordinate Sprite#4
    char SPRITE4_X;
    /// $D009 Y-Coordinate Sprite#4
    char SPRITE4_Y;
    /// $D00A X-Coordinate Sprite#5
    char SPRITE5_X;
    /// $D00B Y-Coordinate Sprite#5
    char SPRITE5_Y;
    /// $D00C X-Coordinate Sprite#6
    char SPRITE6_X;
    /// $D00D Y-Coordinate Sprite#6
    char SPRITE6_Y;
    /// $D00E X-Coordinate Sprite#7
    char SPRITE7_X;
    /// $D00F Y-Coordinate Sprite#7
    char SPRITE7_Y;
    /// $D010 Bit#9 for Sprite X-Coordinates
    char SPRITES_XMSB;
    /// $D011 Control Register #1
    /// - Bit#0-#2: YSCROLL Screen Soft Scroll Vertical
    /// - Bit#3: RSEL Switch betweem 25 or 24 visible rows
    ///          RSEL|  Display window height   | First line  | Last line
    ///          ----+--------------------------+-------------+----------
    ///            0 | 24 text lines/192 pixels |   55 ($37)  | 246 ($f6)
    ///            1 | 25 text lines/200 pixels |   51 ($33)  | 250 ($fa)
    /// - Bit#4: DEN Switch VIC-II output on/off
    /// - Bit#5: BMM Turn Bitmap Mode on/off
    /// - Bit#6: ECM Turn Extended Color Mode on/off
    /// - Bit#7: RST8 9th Bit for $D012 Rasterline counter
    /// Initial Value: %10011011
    char CONTROL1;
    /// $D012 RASTER Raster counter
    char RASTER;
    /// $D013 LPX Light pen X
    /// When Reading:Return current Rasterline
    /// When Writing:Define Rasterline for Interrupt triggering
    char LIGHTPEN_X;
    /// $D014 LPY Light pen Y
    char LIGHTPEN_Y;
    /// $D015 Sprite enabled
    /// If a bit is set high the corresponding Sprite is enabled on Screen
    char SPRITES_ENABLE;
    /// $D016 Control register 2
    /// -  Bit#0-#2: XSCROLL Screen Soft Scroll Horizontal
    /// -  Bit#3: CSEL Switch betweem 40 or 38 visible columns
    ///           CSEL|   Display window width   | First X coo. | Last X coo.
    ///           ----+--------------------------+--------------+------------
    ///             0 | 38 characters/304 pixels |   31 ($1f)   |  334 ($14e)
    ///             1 | 40 characters/320 pixels |   24 ($18)   |  343 ($157)
    /// -  Bit#4: MCM Turn Multicolor Mode on/off
    /// -  Bit#5-#7: not used
    /// Initial Value: %00001000
    char CONTROL2;
    /// $D017 Sprite Y expansion
    /// If a bit is set high, the corresponding Sprite will be stretched vertically x2
    char SPRITES_EXPAND_Y;
    /// $D018 VIC-II base addresses
    /// - Bit#0: not used
    /// - Bit#1-#3: CB Address Bits 11-13 of the Character Set (*2048)
    /// - Bit#4-#7: VM Address Bits 10-13 of the Screen RAM (*1024)
    /// Initial Value: %00010100
    char MEMORY;
    /// $D019 Interrupt Status Register
    /// - Bit#0: IRST Interrupt by Rasterline triggered when high
    /// - Bit#1: IMBC Interrupt by Spite-Background collision triggered when high
    /// - Bit#2: IMMC Interrupt by Sprite-Sprite collision triggered when high
    /// - Bit#3: ILP Interrupt by Lightpen impulse triggered when high
    /// - Bit#4-#6: not used
    /// - Bit#7: IRQ If set high at least one of the Interrupts above were triggered
    char IRQ_STATUS;
    /// $D01A Interrupt Enable Register
    /// - Bit#0: ERST Request Interrupt by Rasterline by setting high
    /// - Bit#1: EMBC Request Interrupt by Spite-Background collision by setting high
    /// - Bit#2: EMMC Request Interrupt by Sprite-Sprite collision by setting high
    /// - Bit#3: ELP Request Interrupt by Lightpen impulse by setting high
    /// - Bit#4-#7: not used
    char IRQ_ENABLE;
    /// $D01B Sprite data priority
    /// If a bit is set high, the Background overlays the corresponding Sprite, if set low, the Sprite overlays Background.
    char SPRITES_PRIORITY;
    /// $D01C Sprite multicolor
    /// If a bit is set high, the the corresponding Sprite is a Multicolor-Sprite
    char SPRITES_MC;
    /// $D01D Sprite X expansion
    /// If a bit is set high, the corresponding Sprite will be stretched horizontally x2
    char SPRITES_EXPAND_X;
    /// $D01E Sprite-sprite collision
    /// If two sprites collide, then corresponding Bits involved in the collision are set to high.
    char SPRITES_COLLISION;
    /// $D01F Sprite-data collision
    /// If a sprite collides with the background, then its Bit is set to high.
    char SPRITES_BG_COLLISION;
    /// $D020 Border Color
    char BORDER_COLOR;
    /// $D021 Background Color 0
    char BG_COLOR;
    /// $D022 Background Color 1
    char BG_COLOR1;
    /// $D023 Background Color 2
    char BG_COLOR2;
    /// $D024 Background Color 3
    char BG_COLOR3;
    /// $D025 Sprite multicolor 0
    char SPRITES_MCOLOR1;
    /// $D026 Sprite multicolor 1
    char SPRITES_MCOLOR2;
    /// $D027 Color Sprite#0
    char SPRITE0_COLOR;
    /// $D028 Color Sprite#1
    char SPRITE1_COLOR;
    /// $D029 Color Sprite#2
    char SPRITE2_COLOR;
    /// $D02a Color Sprite#3
    char SPRITE3_COLOR;
    /// $D02b Color Sprite#4
    char SPRITE4_COLOR;
    /// $D02c Color Sprite#5
    char SPRITE5_COLOR;
    /// $D02d Color Sprite#6
    char SPRITE6_COLOR;
    /// $D02e Color Sprite#7
    char SPRITE7_COLOR;
};

/// Position of the left border (in sprite X positions)
const char BORDER_XPOS_LEFT=24;
/// Position of the right border (in sprite X positions)
const unsigned int BORDER_XPOS_RIGHT=344;
/// Positions of the top border (in sprite Y positions)
const char BORDER_YPOS_TOP=50;
/// Positions of the lower border (in sprite Y positions)
const char BORDER_YPOS_BOTTOM=250;

/// The offset of the sprite pointers from the screen start address
const unsigned int OFFSET_SPRITE_PTRS = 0x3f8;

/// Sprite X position register for sprite #0
char * const SPRITES_XPOS = (char*)0xd000;
/// Sprite Y position register for sprite #0
char * const SPRITES_YPOS = (char*)0xd001;
/// Sprite X position MSB register
char * const SPRITES_XMSB = (char*)0xd010;
/// Sprite colors register for sprite #0
char * const SPRITES_COLOR = (char*)0xd027;
/// Sprite enable register
char *  const SPRITES_ENABLE = (char*)0xd015;
/// Sprite expand Y register
char *  const SPRITES_EXPAND_Y = (char*)0xd017;
/// Sprite priority register
char *  const SPRITES_PRIORITY = (char*)0xd01b;
/// Sprite multicolor enable register
char *  const SPRITES_MC = (char*)0xd01c;
/// Sprite expand X register
char *  const SPRITES_EXPAND_X = (char*)0xd01d;

/// $D012 RASTER Raster counter
char*  const RASTER = (char*)0xd012;

/// $D020 Border Color
char*  const BORDER_COLOR = (char*)0xd020;
/// $D021 Background Color 0
char*  const BG_COLOR = (char*)0xd021;
/// $D021 Background Color 0
char*  const BG_COLOR0 = (char*)0xd021;
/// $D022 Background Color 1
char*  const BG_COLOR1 = (char*)0xd022;
/// $D023 Background Color 2
char*  const BG_COLOR2 = (char*)0xd023;
/// $D024 Background Color 3
char*  const BG_COLOR3 = (char*)0xd024;

/// $D025 Sprite multicolor 0
char*  const SPRITES_MC1 = (char*)0xd025;
/// $D026 Sprite multicolor 1
char*  const SPRITES_MC2 = (char*)0xd026;

/// $D011 Control Register #1
/// - Bit#0-#2: YSCROLL Screen Soft Scroll Vertical
/// - Bit#3: RSEL Switch betweem 25 or 24 visible rows
///          RSEL|  Display window height   | First line  | Last line
///          ----+--------------------------+-------------+----------
///            0 | 24 text lines/192 pixels |   55 ($37)  | 246 ($f6)
///            1 | 25 text lines/200 pixels |   51 ($33)  | 250 ($fa)
/// - Bit#4: DEN Switch VIC-II output on/off
/// - Bit#5: BMM Turn Bitmap Mode on/off
/// - Bit#6: ECM Turn Extended Color Mode on/off
/// - Bit#7: RST8 9th Bit for $D012 Rasterline counter
/// Initial Value: %10011011
char*  const VICII_CONTROL1 = (char*)0xd011;
/// $D011 Control Register #1
/// @see #VICII_CONTROL1
char*  const D011 = (char*)0xd011;
/// $D011 Control Register #1 Bit#7: RST8 9th Bit for $D012 Rasterline counter
const char VICII_RST8 = 0b10000000;
/// $D011 Control Register #1 Bit#6: ECM Turn Extended Color Mode on/off
const char VICII_ECM =  0b01000000;
/// $D011 Control Register #1  Bit#5: BMM Turn Bitmap Mode on/off
const char VICII_BMM =  0b00100000;
/// $D011 Control Register #1  Bit#4: DEN Switch VIC-II output on/off
const char VICII_DEN =  0b00010000;
/// $D011 Control Register #1  Bit#3: RSEL Switch betweem 25 or 24 visible rows
///          RSEL|  Display window height   | First line  | Last line
///          ----+--------------------------+-------------+----------
///            0 | 24 text lines/192 pixels |   55 ($37)  | 246 ($f6)
///            1 | 25 text lines/200 pixels |   51 ($33)  | 250 ($fa)
const char VICII_RSEL = 0b00001000;

/// $D016 Control register 2
/// -  Bit#0-#2: XSCROLL Screen Soft Scroll Horizontal
/// -  Bit#3: CSEL Switch betweem 40 or 38 visible columns
///           CSEL|   Display window width   | First X coo. | Last X coo.
///           ----+--------------------------+--------------+------------
///             0 | 38 characters/304 pixels |   31 ($1f)   |  334 ($14e)
///             1 | 40 characters/320 pixels |   24 ($18)   |  343 ($157)
/// -  Bit#4: MCM Turn Multicolor Mode on/off
/// -  Bit#5-#7: not used
/// Initial Value: %00001000
char*  const VICII_CONTROL2 = (char*)0xd016;
/// $D016 Control register 2
/// @see #VICII_CONTROL2
char*  const D016 = (char*)0xd016;
/// $D016 Control register #2 Bit#4: MCM Turn Multicolor Mode on/off
const char VICII_MCM =  0b00010000;
/// $D016 Control register #2 Bit#3: CSEL Switch betweem 40 or 38 visible columns
///           CSEL|   Display window width   | First X coo. | Last X coo.
///           ----+--------------------------+--------------+------------
///             0 | 38 characters/304 pixels |   31 ($1f)   |  334 ($14e)
///             1 | 40 characters/320 pixels |   24 ($18)   |  343 ($157)
const char VICII_CSEL = 0b00001000;

/// $D018 VIC-II base addresses
/// - Bit#0: not used
/// - Bit#1-#3: CB Address Bits 11-13 of the Character Set (*2048)
/// - Bit#4-#7: VM Address Bits 10-13 of the Screen RAM (*1024)
/// Initial Value: %00010100
char*  const VICII_MEMORY = (char*)0xd018;
/// $D018 VIC-II base addresses
// @see #VICII_MEMORY
char*  const D018 = (char*)0xd018;

/// VIC II IRQ Status Register
char*  const IRQ_STATUS = (char*)0xd019;
/// VIC II IRQ Enable Register
char*  const IRQ_ENABLE = (char*)0xd01a;

/// VICII IRQ Status/Enable Raster
// @see #IRQ_ENABLE #IRQ_STATUS
///  0 | RST| Reaching a certain raster line. The line is specified by writing
///    |    | to register 0xd012 and bit 7 of $d011 and internally stored by
///    |    | the VIC for the raster compare. The test for reaching the
///    |    | interrupt raster line is done in cycle 0 of every line (for line
///    |    | 0, in cycle 1).
const char IRQ_RASTER = 0b00000001;
/// VICII IRQ Status/Enable Background Collision
// @see #IRQ_ENABLE #IRQ_STATUS
///  1 | MBC| Collision of at least one sprite with the text/bitmap graphics
///    |    | (one sprite data sequencer outputs non-transparent pixel at the
///    |    | same time at which the graphics data sequencer outputs a
///    |    | foreground pixel)
const char IRQ_COLLISION_BG = 0b00000010;
/// VICII IRQ Status/Enable Sprite Collision
// @see #IRQ_ENABLE #IRQ_STATUS
///  2 | MMC| Collision of two or more sprites (two sprite data sequencers
///    |    | output a non-transparent pixel at the same time)
const char IRQ_COLLISION_SPRITE = 0b00000100;
/// VICII IRQ Status/Enable Lightpen
// @see #IRQ_ENABLE #IRQ_STATUS
///  3 | LP | Negative edge on the LP input (lightpen)const char IRQ_RASTER = %00000001;
const char IRQ_LIGHTPEN = 0b00001000;

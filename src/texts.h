// *********************************************************
// ***  texts.h Midnight Mega's text mgmt                ***
// *********************************************************

// planned to be used in midnightmegatext.src:
// https://www.c64-wiki.de/wiki/Petcat#Nicht_druckbare_Zeichen

// disk blocks to read into Attic:
#define TEXTBLOCKS 50

// literals for accessing the correct instance (line number - 1):
#define INFOFOOTER1 (1 - 1)
#define INFOFOOTER2 (2 - 1)
#define ROMBOX       (4 - 1)
#define SETUPBOX     (16 - 1)
#define BARACTIVE    (28 - 1)
#define BARINACTIVE  (29 - 1)
#define BAROFF       (30 - 1)
#define BARMEGA      (31 - 1)
#define BARMEGASUBDIR (32 - 1)
#define BARSHIFT     (33 - 1)
#define BARDIRSORT   (34 - 1)
#define DIALOGBOX    (10 - 1)
// #define DIALOGTITLE  (40 - 1)
// #define DIALOGSLOGAN (42 - 1)
#define DIALOGOKLEFT (35 - 1)
#define DIALOGOKCENT (36 - 1)
#define DIALOGCANCEL (37 - 1)
#define MENUBOX     (39 - 1)
// #define MENUTITLE   (94 - 1)
// #define MENUDIRSORT (95 - 1)
// #define MENUREGIONS (96 - 1)
// #define MENUSETUP   (97 - 1)
#define HELPBOX   (51 - 1)
#define HELP0     (57 - 1)
#define HELP1     (74 - 1)
#define HELP2     (92 - 1)
#define HELPMAX   2
#define REGIONS      (110 - 1)

#define INPTXTSUBDIRTRACK (127 - 1)
#define INPTXTSUBDIRNAME  (129 - 1)
#define INPTXTRENAME      (131 - 1)
#define INPTXTFORMATNAME  (133 - 1)
#define DLGTXTSETUPSAVE   (135 - 1)
#define DLGTXTDIRSORTSD   (139 - 1)
#define DLGTXTSUBDIRCOPY  (142 - 1)
#define DLGTXTHICKUP12    (145 - 1)
#define DLGTXTBETA        (149 - 1)
#define DLGTXTIECMOUNT    (153 - 1)
#define DLGTXTFREEZER     (157 - 1)
#define DLGTXTSDMULTI     (160 - 1)
#define DLGTXTDIRMULTI    (164 - 1)
#define DLGTXTTYPEUNSUPP  (168 - 1)
#define DLGTXTCPYDIRUNSUP (171 - 1)
#define DLGTXTCPYSDUNSUP  (174 - 1)
#define DLGTXTNOSPACE     (178 - 1)
#define DLGTXTFILECOPY    (181 - 1)
#define DLGTXTDELDIRUNSUP (183 - 1)
#define DLGTXTDELDIREMPTY (187 - 1)
#define DLGTXTCPYDIR      (190 - 1)
#define DLGTXTFILEDEL     (192 - 1)
#define DLGTXTFILEDELSD   (194 - 1)
#define DLGTXTDIRDELSD    (197 - 1)
#define DLGTXTDIRDELERR   (202 - 1)
#define DLGTXTDISKCOPY    (205 - 1)
#define DLGTXTMKDIRMNT    (208 - 1)
#define DLGTXTMKDIRSPC    (211 - 1)
#define DLGTXTMKDIRSPC2   (214 - 1)
#define DLGTXTFORMATMNT   (217 - 1)

uint32_t lzsa1_decompress_far(uint32_t srcAddr, uint32_t destAddr);
void text(unsigned char instance, unsigned char continuous);

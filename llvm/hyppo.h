// *********************************************************
// ***  hyppo.h abstraction to hyppo mount handling      ***
// *********************************************************

struct HYPPOFILENAME {
	char name[65];
	char sfn[65];
	unsigned char dummy[256-65-65];  // blown up to fill a whole page
};

struct DIRENT {
	char lfn[0x40];    // The long file name
	char length;      // The length of long file name
	char sfn[8];      // The short file name without the extension
	char ext[3];      // The extension
	char res[2];      // unused
	unsigned long clusternumber; // The cluster number where the file
	                             // begins. For sub-directories, this
								 // is where the FAT dir entries start
								 // for that sub-directory
	unsigned long size; // The length of file in bytes
	char attr;        // The type and attribute bits:
					  // Bit Meaning if bit is set
					  // 0   Read only
					  // 1   Hidden
					  // 2   System
					  // 3   Volume label
					  // 4   Sub-directory
					  // 5   Archive
	unsigned char dummy[256-87];  // blown up to fill a whole page
};

unsigned char hyppo_setup_transfer_area(void);
unsigned char hyppo_getcurrentdrive(void);
unsigned char hyppo_selectdrive(unsigned char nb);
unsigned char hyppo_setname(char *filename);
unsigned char hyppo_d81attach0(void);
unsigned char hyppo_d81attach1(void);
unsigned char hyppo_opendir(void);
unsigned char hyppo_closedir(unsigned char filedescriptor);
unsigned char hyppo_readdir(unsigned char filedescriptor);
char * getsfn();
char * getlfn();

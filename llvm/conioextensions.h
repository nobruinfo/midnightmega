// *********************************************************
// ***  conioextensions.h strings and scrolling          ***
// *********************************************************

#define TRUE  1
#define FALSE 0

char tolowerchar(char ch);
char * strlowr(char *str);
char * strsan(char *str);
void strcopy(char *src, char *dest, unsigned char len);

#define COLOR_RAM_BASE 0xFF80000UL
// to be replaced by a getter function
void cputln(void);

// taken from mega65-libc memory.c being inactive by #ifdef:
uint8_t lpeek__________(uint32_t address);
void lpoke___________(uint32_t address, uint8_t value);

void csputdec(long n, unsigned char padding, unsigned char leadingZeros);
char asciitoscreencode(char c);
char* asciitoscreencode_s(char* s);
void clrhome(void);

// instead of printf() variants:
void msprintf(char* str);
void mprintf(char* str, long n);
void mhprintf(char* str, long n);
void mh4printf(char* str, long n);
void mcprintf(char* str, char c);
void mcputsxy(unsigned char x, unsigned char y, char* str);
// Debug defined:
void msprintfd(char* str);
void mprintfd(char* str, long n);
void mhprintfd(char* str, long n);
void mh4printfd(char* str, long n);
void mcprintfd(char* str, char c);
void cputcd(unsigned char c);
void clrhomed(void);
void cputlnd(void);
unsigned char cgetcd(void);

unsigned char cinput2(
    unsigned char* buffer2, unsigned char buflen, unsigned char flags);

void mcbox(unsigned char left, unsigned char top, unsigned char right, unsigned char bottom,
    unsigned char color, unsigned char style, unsigned char clear, unsigned char shadow);
unsigned char messagebox(unsigned char mode, char* message, char* message2,
                         char* message3, long n);
unsigned char valuesbox(unsigned char mode, char* message, char* message2, long val2,
                        char* message3, long val3);
void progress(char* message, char* message2, unsigned char progresspercent);
char* inputbox(char* inputstr, char* message);

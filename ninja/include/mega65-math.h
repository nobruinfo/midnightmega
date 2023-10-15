/// @file
/// MEGA65 CPU MATHS ACCELERATION REGISTERS
///
/// Every MEGA65 contains a combined 32-bit hardware multiplier and divider. This device
/// takes two 32-bit inputs, MULTINA and MULTINB, and simultaneously calculates:
/// • the 64-bit product of MULTINA and MULTINB
/// • the 32-bit whole part of MULTINA / MULTINB
/// • the 32-bit fractional part of MULTINA / MULTINB
/// It is always updating the outputs based on the inputs, so there is no need to take special
/// action when changing the inputs. The multiplier takes 1 cycle to calculate, and the updated result will thus be available immediately.
/// The hardware divider, however, can take up to 16 cycles depending on the particular inputs. Thus programmers should insert a short
/// delay after changing the inputs before reading the output. As this delay is so short, it can be implemented by simply reading the first
/// byte of the result four times consecutively, as the 4th read will occur after the result has settled.

/// $D70F MATH BUSY
/// Bit 7: DIVBUSY
/// Bit 6: MULBUSY
char * const MATH_BUSY = (char *)0xd70f;

/// $D768-$D76F DIVOUT 64-bit output of MULTINA ÷ MULTINB
/// $D768-$D76B DIVOUT FRAC 32-bit output of MULTINA ÷ MULTINB
signed char volatile * const MATH_DIVOUT_FRAC_CHAR0 = (signed char*)0xd768;
signed char volatile * const MATH_DIVOUT_FRAC_CHAR1 = (signed char*)0xd769;
signed char volatile * const MATH_DIVOUT_FRAC_CHAR2 = (signed char*)0xd76a;
signed char volatile * const MATH_DIVOUT_FRAC_CHAR3 = (signed char*)0xd76b;
signed int  volatile * const MATH_DIVOUT_FRAC_INT0  = (signed int*)0xd768;
signed int  volatile * const MATH_DIVOUT_FRAC_INT1  = (signed int*)0xd76a;
signed long volatile * const MATH_DIVOUT_FRAC_LONG0 = (signed long*)0xd768;
/// $D768-$D76F DIVOUT 64-bit output of MULTINA ÷ MULTINB
signed char volatile * const MATH_DIVOUT_WHOLE_CHAR0 = (signed char*)0xd76c;
signed int  volatile * const MATH_DIVOUT_WHOLE_INT0  = (signed int*)0xd76c;
signed int  volatile * const MATH_DIVOUT_WHOLE_INT1  = (signed int*)0xd76e;
signed long volatile * const MATH_DIVOUT_WHOLE_LONG  = (signed long*)0xd76c;

/// $D770-$D773 MULTINA Multiplier input A / Divider numerator (32 bit)
signed char * const MATH_MULTINA_CHAR0 = (signed char*)0xd770;
signed char * const MATH_MULTINA_CHAR1 = (signed char*)0xd771;
signed char * const MATH_MULTINA_CHAR2 = (signed char*)0xd772;
signed char * const MATH_MULTINA_CHAR3 = (signed char*)0xd773;
signed int  * const MATH_MULTINA_INT0  = (signed int*)0xd770;
signed int  * const MATH_MULTINA_INT1  = (signed int*)0xd772;
signed long * const MATH_MULTINA_LONG  = (signed long*)0xd770;

/// $D774-$D777 MULTINB Multiplier input B / Divider denominator (32 bit)
signed char * const MATH_MULTINB_CHAR0 = (signed char*)0xd774;
signed char * const MATH_MULTINB_CHAR1 = (signed char*)0xd775;
signed char * const MATH_MULTINB_CHAR2 = (signed char*)0xd776;
signed char * const MATH_MULTINB_CHAR3 = (signed char*)0xd777;
signed int  * const MATH_MULTINB_INT0  = (signed int*)0xd774;
signed int  * const MATH_MULTINB_INT1  = (signed int*)0xd776;
signed long * const MATH_MULTINB_LONG  = (signed long*)0xd774;

/// $D778-$D77F MULTOUT 64-bit output of MULTINA × MULTINB
signed char volatile * const MATH_MULTOUT_CHAR0 = (signed char*)0xd778;
signed int  volatile * const MATH_MULTOUT_INT0  = (signed int*)0xd778;
signed long volatile * const MATH_MULTOUT_LONG0 = (signed long*)0xd778;
signed long volatile * const MATH_MULTOUT_LONG1 = (signed long*)0xd77c;
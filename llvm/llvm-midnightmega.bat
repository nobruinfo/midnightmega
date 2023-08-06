@ECHO OFF

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.6.1-win64\bin\
SET c1541="%VICE%\c1541"

SET XMEGA65=D:\Game Collections\C64\Mega65\xemu-binaries-win64\
SET PATH=%PATH%;%VICE%;%XMEGA65%

CD /D %~dp0


SET PRJ=midnightmega

set LLVM_HOME=%~dp0..\..\..\Mega65\llvm-mos\llvm-mos
SET opts=--include-directory=..\..\mega65-libc\clang\include
SET opts=%opts% -ferror-limit=1 -Wno-error=implicit-function-declaration

CALL %LLVM_HOME%\bin\mos-mega65-clang.bat -Os %opts% -o %PRJ%.s -Wl,--lto-emit-asm %PRJ%.c
REM CALL %LLVM_HOME%\bin\mos-mega65-clang.bat -Wall -Os -o %PRJ%.prg %opts% %PRJ%.c

:NOBUILD
IF ERRORLEVEL == 1 (
  PAUSE
) ELSE (
  %c1541% -format disk%PRJ%,id d81 %PRJ%.d81
  %c1541% -attach %PRJ%.d81 -delete %PRJ%
  %c1541% -attach %PRJ%.d81 -write %PRJ%.prg %PRJ%
  ECHO this is a sequential file for testing.>%PRJ%.seq
  %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.0
  ECHO this is a relential file for testing.>%PRJ%.seq
  %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.1,l80,01,01
  ECHO this is a sequential file for testing.>%PRJ%.seq
  %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.2,s
  ECHO this is a sequential file for testing.>%PRJ%.seq
  %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.3,s
  ECHO this is a deleted file for testing.>%PRJ%.seq
  %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.4,d
  DEL %PRJ%.seq>NUL

  XMEGA65 -besure -8 %PRJ%.d81 -autoload -hdosvirt -syscon
  REM XMEGA65 -besure -prg %PRJ%.prg
)

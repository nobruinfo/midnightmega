@ECHO OFF

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.6.1-win64\bin\
SET c1541="%VICE%\c1541"

SET XMEGA65=D:\Game Collections\C64\Mega65\Xemu\xemu-binaries-win64\
SET PATH=%PATH%;%VICE%;%XMEGA65%

CD /D %~dp0


SET PRJ=midnightmega
SET DATADISK=datadisk

set LLVM_HOME=%~dp0..\..\..\Mega65\llvm-mos\llvm-mos
set LLVM_BAT=%LLVM_HOME%\bin\mos-mega65-clang.bat
set LLVMDUMP=%LLVM_HOME%\bin\llvm-objdump.exe
SET cfilesdir=..\..\mega65-libc\src
SET cfiles=%cfilesdir%\conio.c %cfilesdir%\memory.c include\memory_asm.s
REM  %cfilesdir%\llvm\memory_asm.s
REM https://clang.llvm.org/docs/ClangCommandLineReference.html
SET opts=--include-directory=.\include
SET opts=%opts% --include-directory=..\..\mega65-libc\include
SET opts=%opts% -ferror-limit=1 -Wno-error=implicit-function-declaration
REM https://courses.washington.edu/cp105/GCC/Removing%20unused%20functions%20and%20dead%20code.html
REM SET opts=%opts% -Wl,-static -fdata-sections -ffunction-sections
REM SET opts=%opts% -Wl,--gc-sections -Wl,-s
SET opts=%opts% -Wl,-Map=%PRJ%.map
SET opts=%opts% -Wl,-trace
SET opts=%opts% -Wl,--reproduce=reproduce.tar

REM DEL %TEMP%\*.o
CALL %LLVM_BAT% -Os %opts% -o %PRJ%.s -Wl,--lto-emit-asm %PRJ%.c %cfiles%
ECHO ------------------------------------------------------
REM  -Wall
CALL %LLVM_BAT% -Os -o %PRJ%.prg %opts% %PRJ%.c %cfiles%

for /f "tokens=1* delims=?" %%i in ('DIR /B /O:DN "%TEMP%\*.o"') do (
  ECHO File is %%i
  SET file=%%i
  SET "f=!file:~-1,1!"
  ECHO %LLVMDUMP% --disassemble --syms %%i > %PRJ%_!f!_dump.txt
)

:NOBUILD
IF ERRORLEVEL == 1 (
  PAUSE
) ELSE (
  %LLVMDUMP% --disassemble --syms %PRJ%.prg.elf > %PRJ%_dump.txt

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

  %c1541% -format disk%DATADISK%,id d81 %DATADISK%.d81
  %c1541% -attach %DATADISK%.d81 -delete %DATADISK%
  ECHO this is a sequential file for testing.>%DATADISK%.seq
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.0
  ECHO this is a relential file for testing.>%DATADISK%.seq
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.1,l80,01,01
  ECHO this is a sequential file for testing.>%DATADISK%.seq
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.2,s
  ECHO this is a sequential file for testing.>%DATADISK%.seq
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.3,s
  ECHO this is a deleted file for testing.>%DATADISK%.seq
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.4,d
  DEL %DATADISK%.seq>NUL
  for /l %%i in (1, 1, 10) do (
    %c1541% -attach %DATADISK%.d81 -write %PRJ%.prg %PRJ%.%%i
  )

  XMEGA65 -besure -8 %PRJ%.d81 -9 %DATADISK%.d81 -autoload -hdosvirt -syscon
  REM XMEGA65 -besure -prg %PRJ%.prg
)

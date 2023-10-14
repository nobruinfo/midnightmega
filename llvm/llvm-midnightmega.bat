@ECHO OFF

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.6.1-win64\bin\
SET c1541="%VICE%\c1541"

SET XMEGA65=D:\Game Collections\C64\Mega65\Xemu\xemu-binaries-win64\
SET HDOS=%APPDATA%\xemu-lgb\mega65\hdos\
SET PATH=%PATH%;%VICE%;%XMEGA65%

CD /D %~dp0


SET PRJ=midnightmega
SET DATADISK=datadisk

set LLVM_HOME=%~dp0..\..\..\Mega65\llvm-mos\llvm-mos
set LLVM_BAT=%LLVM_HOME%\bin\mos-mega65-clang.bat
set LLVMDUMP=%LLVM_HOME%\bin\llvm-objdump.exe
SET libcfilesdir=..\..\mega65-libc\src
SET libcfiles=%libcfilesdir%\conio.c %libcfilesdir%\memory.c %libcfilesdir%\hal.c
SET libcfiles=%libcfiles% include\memory_asm.s
REM  %libcfilesdir%\llvm\memory_asm.s
SET cfiles=%PRJ%.c hyppo.c fileio.c conioextensions.c nav.c
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

REM git tag -a "v0.1.0-beta" -m "version v0.1.0-beta"
git describe --tags>arghh.tmp
SET /P v=<arghh.tmp
IF "%v%" == "" (
  ECHO FATAL: v is %v%
  PAUSE
  GOTO :eof
)
DEL arghh.tmp > NUL 2> NUL
SET opts=%opts% -DVERSION=\"%v%\"

REM DEL %TEMP%\*.o
CALL %LLVM_BAT% -Os %opts% -o %PRJ%.s -Wl,--lto-emit-asm %cfiles% %libcfiles%

:NOBUILD
IF ERRORLEVEL == 1 (
  PAUSE
) ELSE (
  ECHO ------------------------------------------------------
  REM  -Wall
  CALL %LLVM_BAT% -Os -o %PRJ%.prg %opts% %cfiles% %libcfiles%
  SET opts=%opts% -DDISKDEBUG
  CALL %LLVM_BAT% -Os -o emu%PRJ%.prg !opts! %cfiles% %libcfiles%

  for /f "tokens=1* delims=?" %%i in ('DIR /B /O:DN "%TEMP%\*.o"') do (
    ECHO File is %%i
    SET file=%%i
    SET "f=!file:~-1,1!"
    ECHO %LLVMDUMP% --disassemble --syms %%i > %PRJ%_!f!_dump.txt
  )

  %LLVMDUMP% --disassemble --syms %PRJ%.prg.elf > %PRJ%_dump.txt

  %c1541% -format disk%PRJ%,id d81 %PRJ%.d81
  %c1541% -attach %PRJ%.d81 -delete %PRJ%
  %c1541% -attach %PRJ%.d81 -write %PRJ%.prg %PRJ%
  %c1541% -attach %PRJ%.d81 -write emu%PRJ%.prg emu%PRJ%
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

  IF NOT EXIST %DATADISK%.ro (
    %c1541% -format disk%DATADISK%,id d81 %DATADISK%.d81
    %c1541% -attach %DATADISK%.d81 -delete %DATADISK%
    ECHO this is a sequential file for testing.>%DATADISK%.seq
    %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.0
    ECHO this is a relential file for testing.>%DATADISK%.seq
    %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.1,l80,01,01
    ECHO this is a sequential file for testing.>%DATADISK%.seq
    for /l %%i in (1, 1, 1500) do (
      ECHO trying to make this file %%i times bigger.>>%DATADISK%.seq
    )
    %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.2,s
    ECHO this is a sequential file for testing.>%DATADISK%.seq
    %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.3,s
    ECHO this is a deleted file for testing.>%DATADISK%.seq
    %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.4,d
    DEL %DATADISK%.seq>NUL
    for /l %%i in (1, 1, 10) do (
      %c1541% -attach %DATADISK%.d81 -write %PRJ%.prg _%PRJ%.%%i
    )
  )
  REM Use in Xemu's out of the image file fs access:
  XCOPY /Y %PRJ%.d81 %HDOS%
  XCOPY /Y %DATADISK%.d81 %HDOS%

  XMEGA65 -besure -8 %HDOS%%PRJ%.d81 -9 %HDOS%%DATADISK%.d81 -autoload -hdosvirt
  REM XMEGA65 -syscon -besure -prg %PRJ%.prg
)

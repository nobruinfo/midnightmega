@ECHO OFF

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.8-win64\bin\
SET c1541="%VICE%\c1541"
SET PETCAT=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\
SET PETCAT="%PETCAT%2021\GTK3VICE-3.8-win64\bin\petcat.exe"

SET M65DBG=F:\Entwicklungsprojekte\github-nobru\m65dbg\m65dbg\m65dbg.exe
SET MTOO=D:\Game Collections\C64\Mega65\Tools\M65Tools\
SET MFTP=%MTOO%m65tools-develo-165-c2b03a-windows\mega65_ftp.exe
SET ETHL=%MTOO%m65tools-develo-165-c2b03a-windows\etherload.exe
SET HICKUP=D:\Game Collections\C64\Mega65\Xemu
SET XMEGA65=%HICKUP%\xemu-binaries-win64\
SET HDOS=%APPDATA%\xemu-lgb\mega65\hdos
SET "HDOSSLASH=%HDOS:\=/%"
SET IMG=%APPDATA%\xemu-lgb\mega65\mega65.img
SET D81NAME=MEGA65.D81
SET PATH=%PATH%;%VICE%;%XMEGA65%

CD /D %~dp0

SET PRJ=midnightmega
SET ROMLIST=romlister
SET DATADISK=datadisk
SET versions=..\versions.txt

set LLVM_HOME=%~dp0..\..\..\Mega65\llvm-mos\llvm-mos
set LLVM_BAT=%LLVM_HOME%\bin\mos-mega65-clang.bat
set LLVMDUMP=%LLVM_HOME%\bin\llvm-objdump.exe
SET libcfilesdir=..\mega65-libc\src
REM  SET libcfiles=%libcfilesdir%\conio.c %libcfilesdir%\memory.c %libcfilesdir%\hal.c
SET libcfiles=%libcfilesdir%\hal.c
SET libcfiles=%libcfiles% include\memory_asm.s
REM  %libcfilesdir%\llvm\memory_asm.s
SET cfiles=%PRJ%.c hyppo.c fileio.c conioextensions.c nav.c sid.c romlist.c conio.c memory.c
SET cfilesrom=%ROMLIST%.c hyppo.c fileio.c conioextensions.c romlist.c conio.c memory.c

REM https://clang.llvm.org/docs/ClangCommandLineReference.html
SET opts=--include-directory=.\include
SET opts=%opts% --include-directory=..\mega65-libc\include
SET opts=%opts% -ferror-limit=1 -Wno-error=implicit-function-declaration
REM https://courses.washington.edu/cp105/GCC/Removing%20unused%20functions%20and%20dead%20code.html
REM SET opts=%opts% -Wl,-static -fdata-sections -ffunction-sections
REM SET opts=%opts% -Wl,--gc-sections -Wl,-s
REM https://www.c64-wiki.com/wiki/llvm-mos -Oz gives "size at all costs":
SET opts=%opts% -Oz
REM You can pass -mreserve-zp= to tell the compiler to reduce
REM its ZP spend by that amount:
REM SET opts=%opts% -mreserve-zp=2
REM SET opts=%opts% -mlto-zp=5
SET opts=%opts% -Wl,-trace
REM SET opts=%opts% -Wl,--reproduce=reproduce.tar
REM SET opts=%opts% -mcpu=mos45gs02
REM SET opts=%opts% -T midnightmega.ld

REM git tag -a "v0.1.0-beta" -m "version v0.1.0-beta"
git describe --tags>arghh.tmp
SET /P v=<arghh.tmp
IF "%v%" == "" (
  ECHO FATAL: v is %v%
  PAUSE
  GOTO :eof
)
DEL arghh.tmp > NUL 2> NUL

REM Forget the git tag as it always is one commit behind:
SET v=v0.5.16-beta
SET opts=%opts% -DVERSION=\"%v%\"

ECHO versions for Midnight Mega %v%>%versions%
ECHO:>>%versions%
%c1541% -version>>%versions%
ECHO:>>%versions%
%PETCAT% -version>>%versions%
ECHO:>>%versions%
"%MFTP%" -xyz>>arghh.tmp 2>&1
TYPE arghh.tmp | find /i "cross-development">>%versions%
TYPE arghh.tmp | find /i "version">>%versions%
DEL arghh.tmp > NUL 2> NUL
ECHO:>>%versions%
%LLVM_HOME%\bin\mos-clang.exe --version>>%versions%
ECHO:>>%versions%
%LLVM_HOME%\bin\llvm-objdump.exe --version>>%versions%
ECHO:>>%versions%
REM Xemu uses an additional console window that cannot be GREPped:
REM XMEGA65 -version -headless>>%versions%
ECHO:>>%versions%

REM DEL %TEMP%\*.o
REM -c does a .o without linking:
CALL %LLVM_BAT% -c -o unmap-basic-basepage.o unmap-basic-basepage.S
CALL %LLVM_BAT% -Os %opts% -o %PRJ%.s -Wl,--lto-emit-asm %cfiles% %libcfiles%

:NOBUILD
IF ERRORLEVEL == 1 (
  PAUSE
) ELSE (
  ECHO ------------------------------------------------------
  REM  -Wall
  CALL %LLVM_BAT% -Os -o %PRJ%.prg %opts% -Wl,-Map=%PRJ%.map %cfiles% %libcfiles%
REM  SET opts=%opts% -DDISKDEBUG
REM  CALL %LLVM_BAT% -Os -o dbg%PRJ%.prg !opts! %cfiles% %libcfiles%
REM  SET opts=!opts! -DDELAYDEBUG
REM  CALL %LLVM_BAT% -Os -o emu%PRJ%.prg !opts! %cfiles% %libcfiles%

  for /f "tokens=1* delims=?" %%i in ('DIR /B /O:DN "%TEMP%\*.o"') do (
    ECHO File is %%i
    SET file=%%i
    SET "f=!file:~-1,1!"
    ECHO %LLVMDUMP% --disassemble --syms %%i > %PRJ%_!f!_dump.txt
  )

  %LLVMDUMP% --disassemble --syms %PRJ%.prg.elf > %PRJ%_dump.txt

  REM seperate ROM list application
  CALL %LLVM_BAT% -Os -o %ROMLIST%.prg %opts% -Wl,-Map=%ROMLIST%.map %cfilesrom% %libcfiles%
  %LLVMDUMP% --disassemble --syms %ROMLIST%.prg.elf > %ROMLIST%_dump.txt

  %c1541% -format disk%PRJ%,id d81 %PRJ%.d81
  %c1541% -attach %PRJ%.d81 -delete %PRJ%
  %c1541% -attach %PRJ%.d81 -write %PRJ%.prg %PRJ%
  %c1541% -attach %PRJ%.d81 -delete %ROMLIST%
  %c1541% -attach %PRJ%.d81 -write %ROMLIST%.prg %ROMLIST%
REM  %c1541% -attach %PRJ%.d81 -write dbg%PRJ%.prg dbg%PRJ%
REM  %c1541% -attach %PRJ%.d81 -write emu%PRJ%.prg emu%PRJ%

  REM file for loadFileToMemory():
    ECHO this is a sequential file for testing.>%PRJ%.seq
    %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.0,s
    DEL %PRJ%.seq>NUL
  IF 1 == 2 (
    ECHO this is a sequential file for testing.>%PRJ%.seq
    %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.0,s
    ECHO this is a relential file for testing.>%PRJ%.seq
    %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.1,l80,01,01
    ECHO this is a sequential file for testing.>%PRJ%.seq
    %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.2,s
    ECHO this is a sequential file for testing.>%PRJ%.seq
    %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.3,s
    ECHO this is a deleted file for testing.>%PRJ%.seq
    %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.4,d
    DEL %PRJ%.seq>NUL
    %petcat% -w65 -o ht2.src.prg -- ht2.src.bas
    %c1541% -attach %PRJ%.d81 -write ht2.src.prg ht2.src
    
    REM Helpfile with control codes and colours:
    REM https://mega65.atlassian.net/wiki/x/AYCjAQ
    REM https://dansanderson.com/mega65/petscii-codes/ section "PETSCII control codes"
    REM https://vice-emu.sourceforge.io/vice_toc.html#TOC391
    REM https://www.c64-wiki.de/wiki/Petcat#Nicht_druckbare_Zeichen
    %petcat% -text -c -w2 -o help.seq -- help.txt
    %c1541% -attach %PRJ%.d81 -write help.seq help.seq,s
  )

  REM Use in Xemu's out of the image file fs access:
  XCOPY /Y %PRJ%.d81 %HDOS%\
  attrib -a %HDOS%\%PRJ%.d81

  REM Put project into the storage card image file:
  SET "PRJSHORT=%PRJ:~0,8%"
  DEL %HDOS%\!PRJSHORT!.d81
  REN %HDOS%\%PRJ%.d81 !PRJSHORT!.d81

  REM storage card files are uppercase:
  SET "PRJUPPER=!PRJSHORT!"
  SET "DATADISKUPPER=!DATADISK!"
  for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    set "PRJUPPER=!PRJUPPER:%%b=%%b!"
    set "DATADISKUPPER=!DATADISKUPPER:%%b=%%b!"
  )

  %c1541% -format disk%DATADISK%,id d81 %DATADISK%.d81
  REM Only in the virtual storage card image file some directories are created:
  "%MFTP%" -d %IMG% -c "put !DATADISKUPPER!.D81"
  ECHO 0 REM *** %DATADISK% ***>mega65.bas
  ECHO 1 MOUNT "%DATADISK%.D81">>mega65.bas
  for /l %%j in (0, 1, 1) do (
    ECHO 1%%j0 MKDIR "FOLDER %%j",L 11 >>mega65.bas
    ECHO 1%%j1 MKDIR "SUBFOLDER %%j",L 4 >>mega65.bas
    ECHO 1%%j5 CHDIR "/">>mega65.bas
  )
  ECHO 900 POKE $D6CF, $42>>mega65.bas

  SET HEADLESS=-headless -sleepless -testing
  XMEGA65 !HEADLESS! -hickup "%HICKUP%\HICKUP.M65" -importbas mega65.bas
  "%MFTP%" -d %IMG% -c "get !DATADISKUPPER!.D81"

  REM c1541 currently destroys neighbouring subpartitions if only 3 tracks of size:
  for /l %%j in (0, 1, 1) do (
    for /l %%i in (0, 1, 1) do (
REM      %c1541% -attach %DATADISK%.d81 -@ "/%%j:folder %%j" -delete %PRJ%
      %c1541% -attach %DATADISK%.d81 -@ "/0:folder %%j" -write %PRJ%.prg %%j%PRJ%.%%i
    )
  )

  %c1541% -attach %DATADISK%.d81 -delete %DATADISK%
  %c1541% -attach %DATADISK%.d81 -write regions.h regions.h,s

  ECHO 10 POKE $D080,$20>F011.BAS
  ECHO 20 POKE $D081,$20>>F011.BAS
  ECHO 30 POKE $D084,41>>F011.BAS
  ECHO 40 POKE $D085,1>>F011.BAS
  ECHO 50 POKE $D086,0>>F011.BAS
  ECHO 60 POKE $D081,$41>>F011.BAS
  ECHO 65 SLEEP 1>>F011.BAS
  ECHO 70 PRINT PEEK^($D082^)>>F011.BAS
  ECHO 80 PRINT PEEK^($D689^)>>F011.BAS
  ECHO 90 POKE $D689,0>>F011.BAS
  ECHO 110 POKE $D080,0>>F011.BAS
  %petcat% -w65 -o F011.prg -- F011.bas
  %c1541% -attach %DATADISK%.d81 -write F011.prg f011readsect
  DEL F011.bas>NUL
  DEL F011.prg>NUL

  for /l %%i in (1, 1, 1) do (
    %c1541% -attach %DATADISK%.d81 -write %PRJ%.s asm%%i%PRJ%,s
  )
  ECHO this is a sequential file for testing.>%DATADISK%.seq
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.0
  ECHO this is a relential file for testing.>%DATADISK%.seq
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.1,l80,01,01
  ECHO this is a sequential file for testing.>%DATADISK%.seq
  IF NOT EXIST %DATADISK%.ro (
    for /l %%i in (1, 1, 1500) do (
      ECHO trying to make this file %%i times bigger.>>%DATADISK%.seq
    )
  )
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.2,s
  ECHO this is a sequential file for testing.>%DATADISK%.seq
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.3,s
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.4,s
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.5,s
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.6,s
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.7,s
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.8,s
  ECHO this is a deleted file for testing.>%DATADISK%.seq
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.9,d
  DEL %DATADISK%.seq>NUL

  XCOPY /Y %DATADISK%.d81 %HDOS%\
  attrib -a %HDOS%\%DATADISK%.d81
  XCOPY /Y FAKEDISK.d81 %HDOS%\
  attrib -a %HDOS%\FAKEDISK.d81

REM  "%MFTP%" -d %IMG% -c "del !PRJSHORT!.d81"
  "%MFTP%" -d %IMG% -c "put %HDOSSLASH%/!PRJUPPER!.D81"
  "%MFTP%" -e -c "put %HDOSSLASH%/!PRJUPPER!.D81"
REM  "%MFTP%" -d %IMG% -c "del %DATADISK%.d81"
  "%MFTP%" -d %IMG% -c "put %HDOSSLASH%/!DATADISKUPPER!.D81"
  "%MFTP%" -e -c "put %HDOSSLASH%/!DATADISKUPPER!.D81"
  "%MFTP%" -d %IMG% -c "put %HDOSSLASH%/FAKEDISK.D81"
  "%MFTP%" -e -c "put %HDOSSLASH%/FAKEDISK.D81"

  TIMEOUT 1
  "%ETHL%" --run %PRJ%.prg

  REM Create a stub disk to be loaded at CLI level from current host
  REM directory to mount .d81 within virtual storage card image:

  REM Mount the two disks from the virtual storage image:
  ECHO 10 REM SLEEP 1 >mega65.bas
  ECHO 20 MOUNT "!PRJUPPER!.D81">>mega65.bas
  ECHO 30 MOUNT "!DATADISKUPPER!.D81",U9>>mega65.bas
  ECHO 40 REM SLEEP 1 >>mega65.bas
  ECHO 50 RUN "*">>mega65.bas

  XMEGA65 -besure ^
    -importbas mega65.bas ^
    -hickup "%HICKUP%\HICKUP.M65" ^
	-driveled
REM    -hdosvirt -defd81fromsd
REM    -8 !PRJSHORT!.d81 -9 %DATADISK%.d81 -autoload
  REM XMEGA65 -syscon -besure -prg !PRJSHORT!.prg
  DEL mega65.bas

  MKDIR %TEMP%\Xemu 2>&1 >NUL
  CHDIR /D %TEMP%\Xemu
  "%MFTP%" -d %IMG% -c "get !PRJUPPER!.D81"
  "%MFTP%" -d %IMG% -c "get !DATADISKUPPER!.D81"
  "%MFTP%" -d %IMG% -c "get MEGA65.D81"
  "%MFTP%" -d %IMG% -c "get EXTERNAL.D81"
  START "Readback" /MIN .
  
REM  "%M65DBG%" -l tcp
REM  pause
)

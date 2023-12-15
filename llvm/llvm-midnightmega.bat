@ECHO OFF

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.6.1-win64\bin\
SET c1541="%VICE%\c1541"
SET PETCAT=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\
SET PETCAT="%PETCAT%2021\GTK3VICE-3.6.1-win64\bin\petcat.exe"

SET MFTP=D:\Game Collections\C64\Mega65\Tools\M65Connect\M65Connect Resources\mega65_ftp.exe
SET HICKUP=D:\Game Collections\C64\Mega65\Xemu
SET XMEGA65=%HICKUP%\xemu-binaries-win64\
SET HDOS=%APPDATA%\xemu-lgb\mega65\hdos
SET "HDOSSLASH=%HDOS:\=/%"
SET IMG=%APPDATA%\xemu-lgb\mega65\mega65.img
SET D81NAME=MEGA65.D81
SET PATH=%PATH%;%VICE%;%XMEGA65%

CD /D %~dp0

SET PRJ=midnightmega
SET DATADISK=datadisk

set LLVM_HOME=%~dp0..\..\..\Mega65\llvm-mos\llvm-mos
set LLVM_BAT=%LLVM_HOME%\bin\mos-mega65-clang.bat
set LLVMDUMP=%LLVM_HOME%\bin\llvm-objdump.exe
SET libcfilesdir=..\mega65-libc\src
SET libcfiles=%libcfilesdir%\conio.c %libcfilesdir%\memory.c %libcfilesdir%\hal.c
SET libcfiles=%libcfiles% include\memory_asm.s
REM  %libcfilesdir%\llvm\memory_asm.s
SET cfiles=%PRJ%.c hyppo.c fileio.c conioextensions.c nav.c
REM https://clang.llvm.org/docs/ClangCommandLineReference.html
SET opts=--include-directory=.\include
SET opts=%opts% --include-directory=..\mega65-libc\include
SET opts=%opts% -ferror-limit=1 -Wno-error=implicit-function-declaration
REM https://courses.washington.edu/cp105/GCC/Removing%20unused%20functions%20and%20dead%20code.html
REM SET opts=%opts% -Wl,-static -fdata-sections -ffunction-sections
REM SET opts=%opts% -Wl,--gc-sections -Wl,-s
SET opts=%opts% -Oz
SET opts=%opts% -Wl,-Map=%PRJ%.map
SET opts=%opts% -Wl,-trace
REM SET opts=%opts% -Wl,--reproduce=reproduce.tar

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
SET v=v0.4.1-beta
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

  %c1541% -format disk%DATADISK%,id d81 %DATADISK%.d81
  %c1541% -attach %DATADISK%.d81 -delete %DATADISK%
  %c1541% -attach %DATADISK%.d81 -write regions.h regions.h,s
  for /l %%i in (1, 1, 2) do (
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
  ECHO this is a deleted file for testing.>%DATADISK%.seq
  %c1541% -attach %DATADISK%.d81 -write %DATADISK%.seq %DATADISK%.4,d
  DEL %DATADISK%.seq>NUL
  for /l %%i in (1, 1, 12) do (
    %c1541% -attach %DATADISK%.d81 -write %PRJ%.prg _%PRJ%.%%i
  )
  REM Use in Xemu's out of the image file fs access:
  XCOPY /Y %PRJ%.d81 %HDOS%\
  attrib -a %HDOS%\%PRJ%.d81
  XCOPY /Y %DATADISK%.d81 %HDOS%\
  attrib -a %HDOS%\%DATADISK%.d81

  REM Put project into the storage card image file:
  SET "PRJ=%PRJ:~0,8%"
  DEL %HDOS%\!PRJ!.d81
  REN %HDOS%\%PRJ%.d81 !PRJ!.d81

  REM Create a stub disk to be loaded at CLI level from current host
  REM directory to mount .d81 within virtual storage card image:
  SET "PRJUPPER=!PRJ!"
  SET "DATADISKUPPER=!DATADISK!"
  for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    set "PRJUPPER=!PRJUPPER:%%b=%%b!"
    set "DATADISKUPPER=!DATADISKUPPER:%%b=%%b!"
  )

REM  "%MFTP%" -d %IMG% -c "del !PRJ!.d81"
  "%MFTP%" -d %IMG% -c "put %HDOSSLASH%/!PRJUPPER!.D81"
REM  "%MFTP%" -d %IMG% -c "del %DATADISK%.d81"
  "%MFTP%" -d %IMG% -c "put %HDOSSLASH%/!DATADISKUPPER!.D81"

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
REM    -8 !PRJ!.d81 -9 %DATADISK%.d81 -autoload
  REM XMEGA65 -syscon -besure -prg %PRJ%.prg
  DEL mega65.bas
)

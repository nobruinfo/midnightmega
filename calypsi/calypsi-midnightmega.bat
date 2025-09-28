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
SET MTOO=%MTOO%m65tools-release-1.00-windows
SET MFTP=%MTOO%\mega65_ftp.exe
SET MFTP=F:\Entwicklungsprojekte\github-nobru\mega65-tools\bin\mega65_ftp.exe
SET ETHL=%MTOO%\etherload.exe
SET HICKUPDIR=D:\Game Collections\C64\Mega65\Xemu
SET HICKUPFILE=HICKUP hyppo13.M65
SET HICKUPFILEOLD=HICKUP.M65
SET HICKUPOPT=-hickup "%HICKUPDIR%\%HICKUPFILE%"
SET HICKUPOPTOLD=-hickup "%HICKUPDIR%\%HICKUPFILEOLD%"
SET XMEGA65=%HICKUPDIR%\xemu-binaries-win64\
SET HDOS=%APPDATA%\xemu-lgb\mega65\hdos
SET "HDOSSLASH=%HDOS:\=/%"
SET IMG=%APPDATA%\xemu-lgb\mega65\mega65.img
SET D81NAME=MEGA65.D81
SET PATH=%PATH%;%VICE%;%XMEGA65%;D:\Eigene Programme\Grafik\Latex\pandoc-3.6

CD /D %~dp0

SET PRJ=midnightmega
SET ROMLIST=romlister
SET DATADISK=datadisk
SET versions=..\versions_calypsi.txt

set CALYPSI_HOME=%~dp0..\..\..\Mega65\calypsi-6502-5.12
set CC6502="%CALYPSI_HOME%\bin\cc6502.exe"
set CA6502="%CALYPSI_HOME%\bin\as6502.exe"
set LN6502="%CALYPSI_HOME%\bin\ln6502.exe"
SET libcfilesdir=..\mega65-libc\src
SET libcfiles=%libcfilesdir%\conio.c %libcfilesdir%\memory.c %libcfilesdir%\hal.c
REM before Calypsi: SET libcfiles=%libcfiles% include\memory_asm.s
REM  %libcfilesdir%\llvm\memory_asm.s
SET cfiles=%PRJ%.c hyppo.c fileio.c conioextensions.c nav.c texts.c sid.c romlist.c
REM SET cfiles=%PRJ%.c conioextensions.c
SET cfilesrom=%ROMLIST%.c hyppo.c fileio.c conioextensions.c romlist.c

SET opts=--include-directory=.\include
SET opts=%opts% --include-directory=..\mega65-libc\include
SET opts=%opts% -ferror-limit=1 -Wno-error=implicit-function-declaration
REM https://courses.washington.edu/cp105/GCC/Removing%20unused%20functions%20and%20dead%20code.html
REM SET opts=%opts% -Wl,-static -fdata-sections -ffunction-sections
REM SET opts=%opts% -Wl,--gc-sections -Wl,-s
REM https://www.c64-wiki.com/wiki/llvm-mos -Oz gives "size at all costs":
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
SET v=v0.6.6-beta
SET opts=%opts% -DVERSION=\"%v%\"
SET calopts=-D asm=__asm -I calypsi.h -D VERSION=\"%v%\" -I .\include -I ..\mega65-libc\include
SET calopts=-D asm=__asm -I calypsi.h -D VERSION=\"%v%\" -I ..\mega65-libc\include
SET calopts=%calopts% -O 2 --core 45gs02 --target MEGA65
SET calopts=%calopts% -D FULLFEATURES

:menu
echo ==========================
echo     Choose an option
echo ==========================
echo (n) no hickup, no ethernet
echo (e) no hickup
echo (h) hickup
echo (o) hickup, no ethernet
echo (q) quit
echo ==========================
choice /c nehoq /n /m "Type key of option to be executed: "

if errorlevel 5 goto end
if errorlevel 4 goto dohicknoeth
if errorlevel 3 goto dohick
if errorlevel 2 goto donohick
if errorlevel 1 goto donono

echo Invalid choice. Try again.
pause
goto menu

:donono
SET HICK=
SET ETH=
goto startllvm
:donohick
SET HICK=
SET ETH=YES
goto startllvm
:dohick
SET HICK=YES
SET ETH=YES
goto startllvm
:dohicknoeth
SET HICK=YES
SET ETH=
goto startllvm

:startllvm
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
%CC6502% --version>>%versions%
ECHO:>>%versions%
%CA6502% --version>>%versions%
ECHO:>>%versions%
REM Xemu uses an additional console window that cannot be GREPped:
REM XMEGA65 -version -headless>>%versions%
ECHO:>>%versions%

REM Reformat the .md to give it a table of contents:
pandoc -s ..\docsrc\readmesrc.md --toc -t gfm -o ..\readme.md

REM DEL %TEMP%\*.o
REM CALL %CC6502% -Os %opts% -o %PRJ%.s -Wl,--lto-emit-asm %cfiles% %libcfiles%

GOTO SKIPFUNCT

:compile
FOR /F "tokens=1,* delims= " %%i IN ("%~1") DO (
  ECHO %%i ...
  SET c="%%i"
  SET obj="%%~dpni.o"
  SET lst="%%~dpni.lst"
  SET asm="%%~dpni.s"

  IF "%%~dpnxi" == !asm! (
    %CA6502% --target=mega65 --list-file=!lst! -o !obj! !asm!
  ) ELSE (
    %CC6502% %calopts% -S !c!
    %CC6502% --list-file=!lst! %calopts% -o !obj! !c!
  )
  SET objs=!objs! !obj!
  ECHO:
  call :compile "%%~j"
)
@goto :EOF

:SKIPFUNCT
SET objs=
CALL :compile "%cfiles% %libcfiles%"

REM %LN6502% -o %PRJ% --list-file=%prj%.lst --verbose --output-format prg --core 45gs02 --target=mega65
%LN6502% -o %PRJ%.prg --list-file=%prj%.lst --output-format prg --core 45gs02 --target=mega65 ^
  !objs! mega65-%PRJ%.scm

REM	hello.prg:  $(OBJS)
REM		ln6502 --target=mega65 mega65-plain.scm -o $@ $^  --output-format=prg --list-file=hello-mega65.lst

REM  hello.elf: $(OBJS_DEBUG)
REM	ln6502 --target=mega65 mega65-plain.scm --debug -o $@ $^ --list-file=hello-debug.lst --semi-hosted

:NOBUILD
IF ERRORLEVEL == 1 (
  PAUSE
) ELSE (
  REM seperate ROM list application
  SET objs=
  CALL :compile "%cfilesrom% %libcfiles%"
  %LN6502% -o %ROMLIST%.prg --list-file=%ROMLIST%.lst --output-format prg --core 45gs02 --target=mega65 ^
    !objs! mega65-%PRJ%.scm

  ECHO ------------------------------------------------------

  %c1541% -format disk%PRJ%,id d81 %PRJ%.d81
  %c1541% -attach %PRJ%.d81 -delete %PRJ%
  %c1541% -attach %PRJ%.d81 -write %PRJ%.prg %PRJ%

REM  %c1541% -attach %PRJ%.d81 -write dbg%PRJ%.prg dbg%PRJ%
REM  %c1541% -attach %PRJ%.d81 -write emu%PRJ%.prg emu%PRJ%

  REM file for loadFileToMemory():
REM    ECHO this is a sequential file for testing.>%PRJ%.seq
REM    %c1541% -attach %PRJ%.d81 -write %PRJ%.seq %PRJ%.0,p
REM    DEL %PRJ%.seq>NUL
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
  REM Text file created by https://github.com/dadadel/binmake :
  REM wsl --exec sh maketextseqfile.sh %PRJ%text_binmake.src %PRJ%text1_binmake.seq
  %petcat% -text -c -w2 -o %PRJ%text.seq -- %PRJ%text.src
  %c1541% -attach %PRJ%.d81 -write %PRJ%text.seq %PRJ%text,s
  REM DEL %PRJ%text.seq %PRJ%text_binmake.seq
  %c1541% -attach %PRJ%.d81 -delete %ROMLIST%
  %c1541% -attach %PRJ%.d81 -write %ROMLIST%.prg %ROMLIST%

  REM @@@@ Testing:
  REM %c1541% -attach %PRJ%.d81 -write ..\..\fireplace.prg fireplace

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
    REM Subfolder makes C1541 freak out:
    ECHO 1%%j1 REM MKDIR "SUBFOLDER %%j",L 4 >>mega65.bas
    ECHO 1%%j5 CHDIR "/">>mega65.bas
  )
  ECHO 900 POKE $D6CF, $42>>mega65.bas

  SET HEADLESS=-headless -sleepless -testing
  XMEGA65 !HEADLESS! %HICKUPOPT% -importbas mega65.bas
  "%MFTP%" -d %IMG% -c "get !DATADISKUPPER!.D81"

  IF 1 == 2 (
    REM c1541 currently destroys neighbouring subpartitions if only 3 tracks
    REM of size. Also with copying two or more files it writes one of them
    REM in tracks lower than the dirtrack:
  for /l %%j in (0, 1, 1) do (
    for /l %%i in (0, 1, 1) do (
REM      %c1541% -attach %DATADISK%.d81 -@ "/%%j:folder %%j" -delete %PRJ%
      %c1541% -attach %DATADISK%.d81 -@ "/0:folder %%j" -write %PRJ%.prg %%j%PRJ%.%%i
      )
    )
  )

  %c1541% -attach %DATADISK%.d81 -delete %DATADISK%
  %c1541% -attach %DATADISK%.d81 -write regions.h regions.h,s

  ECHO 10 POKE $D080,$20>F011.BAS
  ECHO 20 POKE $D081,$20>>F011.BAS
  ECHO 30 POKE $D084,39>>F011.BAS
  ECHO 40 POKE $D085,^1>>F011.BAS
  ECHO 50 POKE $D086,^0>>F011.BAS
  ECHO 60 POKE $D081,$41>>F011.BAS
  ECHO 65 SLEEP ^1>>F011.BAS
  ECHO 70 PRINT PEEK^($D082^)>>F011.BAS
  ECHO 80 PRINT PEEK^($D689^)>>F011.BAS
  ECHO 90 POKE $D689,^0>>F011.BAS
  ECHO 110 POKE $D080,^0>>F011.BAS
  ECHO 200 REM NOW IN MATRIX MODE EXAMINE TWO PAGES>>F011.BAS
  ECHO 210 REM BEGINNING $FFD6000>>F011.BAS
  powershell -command "&{(Get-Content F011.bas).ToLower() | Out-File F011lower.bas -Encoding Ascii}"
  %petcat% -w65 -o F011.prg -- F011lower.bas
  %c1541% -attach %DATADISK%.d81 -write F011.prg f011readsect
  DEL F011.bas>NUL
  DEL F011lower.bas>NUL
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
  IF "%ETH%" == "YES" (
  "%MFTP%" -e -c "put %HDOSSLASH%/!PRJUPPER!.D81"
  )
REM  "%MFTP%" -d %IMG% -c "del %DATADISK%.d81"
  "%MFTP%" -d %IMG% -c "put %HDOSSLASH%/!DATADISKUPPER!.D81"
  IF "%ETH%" == "YES" (
  "%MFTP%" -e -c "put %HDOSSLASH%/!DATADISKUPPER!.D81"
  )
  "%MFTP%" -d %IMG% -c "put %HDOSSLASH%/FAKEDISK.D81"
  IF "%ETH%" == "YES" (
  "%MFTP%" -e -c "put %HDOSSLASH%/FAKEDISK.D81"
  )

  IF "%HICK%" == "YES" (
    REM storage card hickup seems to always win:
    "%MFTP%" -d %IMG% -c "put '%HICKUPDIR%\%HICKUPFILE%' HICKUP.M65"
    IF "%ETH%" == "YES" (
      "%MFTP%" -e -c "put '%HICKUPDIR%\%HICKUPFILE%' HICKUP.M65"
    )
  ) ELSE (
    "%MFTP%" -d %IMG% -c "del HICKUP.M65"
    IF "%ETH%" == "YES" (
      "%MFTP%" -e -c "del HICKUP.M65"
    )
  )

  TIMEOUT 1
  REM "%ETHL%" --mount !PRJSHORT!.d81 --run %PRJ%.prg

  REM Create a stub disk to be loaded at CLI level from current host
  REM directory to mount .d81 within virtual storage card image:

  REM Mount the two disks from the virtual storage image:
  ECHO 10 REM SLEEP 1 >mega65.bas
  ECHO 20 MOUNT "!PRJUPPER!.D81">>mega65.bas
  REM @@@@ Maybe later second mount done upon a user option:
  ECHO 30 MOUNT "!DATADISKUPPER!.D81",U9>>mega65.bas
  ECHO 40 REM SLEEP 1 >>mega65.bas
  ECHO 50 RUN "*">>mega65.bas

  powershell -command "&{(Get-Content mega65.bas).ToLower() | Out-File mega65lower.bas -Encoding Ascii}"
  %petcat% -w65 -o mega65.bas.prg -- mega65lower.bas
  IF "%ETH%" == "YES" (
    "%ETHL%" --mount !PRJSHORT!.d81 --run mega65.bas.prg
  )

  REM Nasty, the before headless XMega65 urgently needed a hickup:
  IF NOT "%HICK%" == "YES" (
    SET HICKUPOPT=%HICKUPOPTOLD%
  )

  XMEGA65 -besure ^
    -importbas mega65.bas ^
    !HICKUPOPT! ^
    -allowfreezer -driveled
REM    -hdosvirt -defd81fromsd
REM    -8 !PRJSHORT!.d81 -9 %DATADISK%.d81 -autoload
  REM XMEGA65 -syscon -besure -prg !PRJSHORT!.prg
  DEL mega65.bas mega65.bas.prg mega65lower.bas

  REM This is no good if using Xmega65 further on:
  "%MFTP%" -d %IMG% -c "del HICKUP.M65"

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

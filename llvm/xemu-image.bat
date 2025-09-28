@ECHO OFF

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.8-win64\bin\
SET c1541="%VICE%\c1541"
SET PETCAT=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\
SET PETCAT="%PETCAT%2021\GTK3VICE-3.8-win64\bin\petcat.exe"

REM Should mega65_ftp cease to work at later versions consider adding
REM "-c exit" to all lines:
SET MTOO=D:\Game Collections\C64\Mega65\Tools\M65Tools\
REM SET MTOO=%MTOO%m65tools-release-1.00-windows
SET MTOO=%MTOO%m65tools-develo-165-c2b03a-windows
SET M65=%MTOO%\m65.exe
REM SET MFTP=%MTOO%\mega65_ftp.exe
SET MFTP=F:\Entwicklungsprojekte\github-nobru\mega65-tools\bin\mega65_ftp.exe
SET DEST=-e
SET XMEGA65=D:\Game Collections\C64\Mega65\Xemu\xemu-binaries-win64\
SET HDOS=%APPDATA%\xemu-lgb\mega65\hdos\
SET D81=D:\Game Collections\C64\Mega65\disks
SET D81INTRO=D:\Game Collections\C64\Mega65\disks unsorted\Intro\ALL_INTROS\sdcard-files
SET D81INTRO=D:\Game Collections\C64\Mega65\disks unsorted\Intro\2025 INTRO4\ALL_INTROS\sdcard-files
SET D81FNX=D:\Game Collections\C64\FNX1591\disks
SET D81C64=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme
SET D81MM=F:\Entwicklungsprojekte\github-nobru\midnightmega\llvm
SET CORE=D:\Game Collections\C64\Mega65\core\CORE
SET ESSENTIALS=D:\Game Collections\C64\Mega65\core\sdcardfiles
SET INTRODEST=INTRO
SET IMG=%APPDATA%\xemu-lgb\mega65\mega65.img
SET PATH=%PATH%;%VICE%;%XMEGA65%

CD /D %~dp0

SET PRJ=midnightmega
SET DATADISK=datadisk

CLS

:menu
title MEGA65_FTP script
echo ==========================
echo     Choose an option
echo ==========================
echo (m) do stuff manually
echo (d) populate "disks"
echo (i) populate "intro"
echo (f) populate "FNX1591"
echo (6) populate "C64"
echo (o) populate "CORE"
echo (a) populate "autoboot"
echo (e) populate "essentials"
echo (h) show ftp command list
echo (c) execute ftp dir command
echo (l) put latest Midnight Mega
echo (s) change destination ethernet/Xemu
echo (t) test
echo (r) populate "ROMS"
echo (0) do stuff manually in DESTRUCTIVE mode
echo (1) make a screenshot
echo (q) quit
echo ==========================
choice /c mdif6oaehclstr01q /n /m "Type key of option to be executed: "

if errorlevel 17 goto end
if errorlevel 16 goto screenshot
if errorlevel 15 goto dopromptdestructive
if errorlevel 14 goto roms
if errorlevel 13 goto test
if errorlevel 12 goto doswap
if errorlevel 11 goto mmput
if errorlevel 10 goto dodir
if errorlevel 9 goto dohelp
if errorlevel 8 goto doessentials
if errorlevel 7 goto doautoboot
if errorlevel 6 goto docore
if errorlevel 5 goto doc64
if errorlevel 4 goto dofnx
if errorlevel 3 goto dointro
if errorlevel 2 goto dodisks
if errorlevel 1 goto doprompt

echo Invalid choice. Try again.
pause
goto menu

:doprompt
title MEGA65_FTP CLI mode
CD /D "%D81%"
"%MFTP%" %DEST%
pause
goto menu

:dopromptdestructive
title MEGA65_FTP CLI mode DESTRUCTIVE mode
CD /D "%D81%"
"%MFTP%" %DEST% -y
pause
goto menu

:dodisks
title MEGA65_FTP populating disks
CD /D "%D81%"
IF 1 == 2 (
  for /d %%k in ("%D81%\*") do (
    SET FOLDER=%%~nk
    SET "prefix1=!FOLDER!\*.d81"
    SET "prefix2=!FOLDER!\*.d64"
    SET "prefix3=!FOLDER!\*.prg"
    SET "prefix="!prefix1!" "!prefix2!" "!prefix3!""
    ECHO !prefix!
    "%MFTP%" %DEST% -c "mkdir %%~nk"
    for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N !prefix!') do (
    REM ECHO CD=!CD!  D81=!DISKUPPER!
      SET "FOLDERSLASH=!FOLDER:\=/!"
    "%MFTP%" %DEST% -c "del !FOLDERSLASH!/%%i"
      SET "DISKUPPER=%%i"
      for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        set "DISKUPPER=!DISKUPPER:%%b=%%b!"
      )
      "%MFTP%" %DEST% -c "cd %%~nk" -c "put '!FOLDERSLASH!/!DISKUPPER!'"
      REM "%MFTP%" %DEST% -c "cd %%~nk" -c "ren ??????~?.D81 ??????-?.D81"
    )
  )
)

REM CD done above
CALL :upload

"%MFTP%" %DEST% -c "dir"|more
pause
goto menu

:dointro
title MEGA65_FTP populating intro
CD /D "%D81INTRO%"
"%MFTP%" %DEST% -c "mkdir %INTRODEST%"

REM Read all files in subfolders:
for /d %%k in ("%D81INTRO%\*") do (
  SET FOLDER=%%~nk
  SET "prefix=!FOLDER!\*.*"
  "%MFTP%" %DEST% -c "mkdir %%~nk"
  for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N "!prefix!"') do (
    SET "FOLDERSLASH=!FOLDER:\=/!"
	"%MFTP%" %DEST% -c "del !FOLDERSLASH!/%%i"
    SET "DISKUPPER=%%i"
    for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
      set "DISKUPPER=!DISKUPPER:%%b=%%b!"
    )
	REM ECHO CD=!CD!  D81=!DISKUPPER!
    "%MFTP%" %DEST% -c "cd %INTRODEST%" -c "mkdir %%~nk" -c "cd %%~nk" -c "put !FOLDERSLASH!/!DISKUPPER!"
    REM "%MFTP%" %DEST% -c "cd %%~nk" -c "ren ??????~?.D81 ??????-?.D81"
  )
)

REM Also read all files in main folder:
SET "prefix=%D81INTRO%\*.*"
for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N "!prefix!"') do (
  "%MFTP%" %DEST% -c "del %%i"
  SET "DISKUPPER=%%i"
  for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    set "DISKUPPER=!DISKUPPER:%%b=%%b!"
  )
  REM ECHO CD=!CD!  D81=!DISKUPPER!
  "%MFTP%" %DEST% -c "cd %INTRODEST%" -c "put '!DISKUPPER!'"
  REM "%MFTP%" %DEST% -c "ren ??????~?.D81 ??????-?.D81"
)

"%MFTP%" %DEST% -c "dir"|more
pause
CD /D "%D81%"
goto menu

:dofnx
title MEGA65_FTP populating disks
CD /D "%D81FNX%"
SET FOLDER=FNX1591
SET "prefix1=*.d81"
SET "prefix2=*.d64"
SET "prefix3=*.prg"
SET "prefix="!prefix1!" "!prefix2!" "!prefix3!""
ECHO !prefix!
"%MFTP%" %DEST% -c "mkdir %FOLDER%"
for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N !prefix!') do (
  REM ECHO CD=!CD!  D81=!DISKUPPER!
  SET "FOLDERSLASH=!FOLDER:\=/!"
  "%MFTP%" %DEST% -c "del !FOLDERSLASH!/%%i"
  SET "DISKUPPER=%%i"
  for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    set "DISKUPPER=!DISKUPPER:%%b=%%b!"
  )
  "%MFTP%" %DEST% -c "cd !FOLDERSLASH!" -c "put '!DISKUPPER!'"
)
"%MFTP%" %DEST% -c "dir"|more
pause
goto menu

:doc64
title MEGA65_FTP populating disks
IF 1 == 2 (
  CD /D "%D81C64%"
  SET FOLDER=C64
  SET "prefix1=*.d81"
  SET "prefix2=*.d64"
  SET "prefix3=*.prg"
  SET "prefix="!prefix1!" "!prefix2!" "!prefix3!""
  ECHO !prefix!
  "%MFTP%" %DEST% -c "mkdir %FOLDER%"
  SET "FOLDERSLASH=!FOLDER:\=/!"
  for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N !prefix!') do (
    REM ECHO CD=!CD!  D81=!DISKUPPER!
    "%MFTP%" %DEST% -c "del !FOLDERSLASH!/%%i"
    SET "DISKUPPER=%%i"
    for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
      set "DISKUPPER=!DISKUPPER:%%b=%%b!"
    )
    "%MFTP%" %DEST% -c "cd !FOLDERSLASH!" -c "put '!DISKUPPER!'"
  )
)

REM Has ( ) brackets:
CD /D "D:\Game Collections\C64\2022 Hardware\Kung Fu Flash\Backups\230303 SD Card\-cbm\C64"
REM CALL :upload C64\cbm
CD /D "D:\Game Collections\C64\2022 Hardware\Kung Fu Flash\Backups\230303 SD Card\-cbm\kung_fu_flash"
CALL :upload C64\cbm\kung_fu_flash
CD /D "D:\Game Collections\C64\2022 Hardware\Kung Fu Flash\Backups\230303 SD Card\nobru"
REM CALL :upload C64\nobru
CD /D "D:\Game Collections\C64\2022 Hardware\Kung Fu Flash\Backups\230303 SD Card\nobru\0_2023"
CALL :upload C64\nobru\0_2023
CD /D "D:\Game Collections\C64\2022 Hardware\Kung Fu Flash\Backups\230303 SD Card\nobru\0cartridges"
CALL :upload C64\nobru\0cartridges
CD /D "D:\Game Collections\C64\2022 Hardware\Kung Fu Flash\Backups\230303 SD Card\nobru\0demo"
CALL :upload C64\nobru\0demo
CD /D "D:\Game Collections\C64\2022 Hardware\Kung Fu Flash\Backups\230303 SD Card\nobru\0disks"
CALL :upload C64\nobru\0disks
CD /D "D:\Game Collections\C64\2022 Hardware\Kung Fu Flash\Backups\230303 SD Card\nobru\0nowhere"
CALL :upload C64\nobru\0nowhere
CD /D "D:\Game Collections\C64\2022 Hardware\Kung Fu Flash\Backups\230303 SD Card\nobru\sound\mod"
CALL :upload C64\nobru\sound\mod
CD /D "D:\Game Collections\C64\2022 Hardware\Kung Fu Flash\Backups\230303 SD Card\nobru\sound\SID for Deft"
CALL :upload C64\nobru\sound\SID for Deft

REM config file:
CD /D "D:\Game Collections\C64\Mega65\core\C64\C64"
CALL :upload C64

REM Install Jiffy:
SET BASIC=W:\ftp.zimmers.net\pub\cbm\firmware\computers\c64\basic.901226-01.bin
REM JiffyDOS_C64_6.01.bin
SET JDOS=D:\Game Collections\C64\2022 Hardware\Kung Fu Flash\
SET JDOS="%JDOS%\Backups\230303 SD Card\nobru\0cartridges\JiffyDOS_C64.bin"
COPY /b %BASIC%+%JDOS% JD-C64.BIN
COPY "D:\Game Collections\C64\Eigene Programme Backup\Tests\JiffyDOS\C1541.ROM" JD-C1541.BIN
REM ECHO !FOLDERSLASH!
"%MFTP%" %DEST% -c "cd C64" -c "put 'JD-C64.BIN'"
"%MFTP%" %DEST% -c "cd C64" -c "put 'JD-C1541.BIN'"
"%MFTP%" %DEST% -c "dir"|more
pause
DEL JD-C64.BIN
DEL JD-C1541.BIN
goto menu

:docore
title MEGA65_FTP populating disks
CD /D "%CORE%"
SET FOLDER=CORE
SET "prefix="*.cor""
ECHO !prefix!
"%MFTP%" %DEST% -c "mkdir %FOLDER%"
for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N !prefix!') do (
  REM ECHO CD=!CD!  D81=!DISKUPPER!
  SET "FOLDERSLASH=!FOLDER:\=/!"
  "%MFTP%" %DEST% -c "del !FOLDERSLASH!/%%i"
  SET "DISKUPPER=%%i"
  for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    set "DISKUPPER=!DISKUPPER:%%b=%%b!"
  )
  "%MFTP%" %DEST% -c "cd !FOLDERSLASH!" -c "put '!DISKUPPER!'"
)
"%MFTP%" %DEST% -c "dir"|more
pause
goto menu

:doautoboot
title MEGA65_FTP ftp commands
CD /D "%D81%"
ECHO 0 rem *** %datadisk% ***>mega65.bas
ECHO 1 print " 1) intro">>mega65.bas
ECHO 2 print " 2) geos">>mega65.bas
ECHO 3 print " 3) midnight mega">>mega65.bas
ECHO 4 print " 4) petterm">>mega65.bas
ECHO 5 print " 5) gehaf's imager">>mega65.bas
ECHO 6 print " 6) intro4 test">>mega65.bas
ECHO 7 print " 7) eleven">>mega65.bas
ECHO 8 print " 8) mega-ip term">>mega65.bas
ECHO 9 print " 9) mega-ip web server">>mega65.bas
ECHO 20 print " /  quit to basic">>mega65.bas

ECHO 25 getkey a$>>mega65.bas
ECHO 30 if a$ = "1" then 100 : rem intro>>mega65.bas
ECHO 31 if a$ = "2" then 200 : rem geos>>mega65.bas
ECHO 32 if a$ = "3" then 300 : rem midnight>>mega65.bas
ECHO 33 if a$ = "4" then 400 : rem petterm>>mega65.bas
ECHO 34 if a$ = "5" then 500 : rem imager>>mega65.bas
ECHO 35 if a$ = "6" then 600 : rem intro4>>mega65.bas
ECHO 36 if a$ = "7" then 700 : rem eleven>>mega65.bas
ECHO 37 if a$ = "8" then 800 : rem mega-ip term>>mega65.bas
ECHO 38 if a$ = "9" then 900 : rem mega-ip web server>>mega65.bas
ECHO 49 if a$ = "/" then end>>mega65.bas
ECHO 50 goto 25>>mega65.bas

ECHO 100 chdir "intro",u12>>mega65.bas
ECHO 110 mount "mega65.d81">>mega65.bas
ECHO 120 boot>>mega65.bas

ECHO 200 chdir "geos",u12>>mega65.bas
ECHO 210 mount "geos65v4.0.d81">>mega65.bas
ECHO 220 boot>>mega65.bas

ECHO 300 rem is in root folder>>mega65.bas
ECHO 310 mount "midnight.d81">>mega65.bas
ECHO 315 mount "datadisk.d81",u9>>mega65.bas
ECHO 320 run "*">>mega65.bas

ECHO 400 rem is in root folder>>mega65.bas
ECHO 410 mount "petterm.d81">>mega65.bas
ECHO 420 run "*">>mega65.bas

ECHO 500 chdir "tools",u12>>mega65.bas
ECHO 501 chdir "geehaf",u12>>mega65.bas
ECHO 510 mount "imager20 fat support.d81">>mega65.bas
ECHO 520 run "*">>mega65.bas

ECHO 600 chdir "intro4",u12>>mega65.bas
ECHO 610 mount "intro4.d81">>mega65.bas
ECHO 620 boot>>mega65.bas

ECHO 700 rem is in root folder>>mega65.bas
ECHO 710 mount "11distnobru.d81">>mega65.bas
ECHO 720 boot>>mega65.bas

ECHO 800 chdir "community",u12>>mega65.bas
ECHO 801 chdir "xlar54",u12>>mega65.bas
ECHO 810 mount "mega-ip.d81">>mega65.bas
ECHO 820 run "term">>mega65.bas

ECHO 900 chdir "community",u12>>mega65.bas
ECHO 901 chdir "xlar54",u12>>mega65.bas
ECHO 910 mount "mega-ip.d81">>mega65.bas
ECHO 920 run "web server">>mega65.bas

%petcat% -w65 -o mega65.prg -- mega65.bas
%c1541% -format mega65,id d81 mega65.d81
%c1541% -attach mega65.d81 -write mega65.prg autoboot.c65

"%MFTP%" %DEST% -c "del MEGA65.D81"
"%MFTP%" %DEST% -c "put MEGA65.D81"
"%MFTP%" %DEST% -c dir
pause
DEL mega65.bas
DEL mega65.prg
DEL MEGA65.D81
goto menu

:doessentials
title MEGA65_FTP populating essentials
CD /D "%ESSENTIALS%"
SET FOLDER=.
SET "prefix="*.m65""
ECHO !prefix!
REM "%MFTP%" %DEST% -c "mkdir %FOLDER%"
for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N !prefix!') do (
  REM ECHO CD=!CD!  D81=!DISKUPPER!
  SET "FOLDERSLASH=!FOLDER:\=/!"
  "%MFTP%" %DEST% -c "del !FOLDERSLASH!/%%i"
  SET "DISKUPPER=%%i"
  for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    set "DISKUPPER=!DISKUPPER:%%b=%%b!"
  )
  "%MFTP%" %DEST% -c "cd !FOLDERSLASH!" -c "put '!DISKUPPER!'"
)
"%MFTP%" %DEST% -c "dir"|more
pause
goto menu

:dodir
title MEGA65_FTP ftp commands
CD /D "%D81%"
"%MFTP%" %DEST% -c dir
pause
goto menu

:mmput
title MEGA65_FTP put Midnight Mega files
CD /D "%D81MM%"
"%MFTP%" %DEST% -c "put MIDNIGHTMEGA.D81 MIDNIGHT.D81"
"%MFTP%" %DEST% -c "put DATADISK.D81"
pause
goto menu

:dohelp
title MEGA65_FTP ftp commands
CD /D "%D81%"
"%MFTP%" -d %IMG% -c help
pause
goto menu

:doswap
title MEGA65_FTP swap destination
echo ==========================
echo     Choose an option
echo ==========================
echo (e) ethernet
echo (x) Xemu
echo (q) quit
echo ==========================
choice /c exq /n /m "Type key of option to be executed: "

if errorlevel 3 goto menu
if errorlevel 2 goto destxemu
if errorlevel 1 goto destethernet

echo Invalid choice. Try again.
pause
goto doswap

:destethernet
SET DEST=-0 0 -e
echo Destination is now ethernet.
pause
goto menu

:destxemu
SET DEST=-0 0 -d %IMG%
echo Destination is now the image file for Xemu.
pause
goto menu

:test
echo Testing:
CD /D "D:\Game Collections\C64\Mega65\disktest"
CALL :upload
pause
goto menu

:roms
echo ROMS:
CD /D "D:\Game Collections\C64\Mega65\roms"
"%MFTP%" %DEST% -c "mkdir ROMS"
"%MFTP%" %DEST% -c "cd ROMS" -c "put '920*.BIN'"
"%MFTP%" %DEST% -c "dir"|more
pause
goto menu

REM The following nasty subroutine makes it happen a
REM nested\path\structure can be local and will be
REM mirrored onto the storage card (image file):
:upload
  REM function parameters:
  SET FOLDER=%~1
  SET LOCALFOLDER=%~2
  SET "prefix=%CD%\%LOCALFOLDER%\*.*"

  ECHO upload started with "%FOLDER%" and local "%LOCALFOLDER%" and cd=%CD%
  SET DIRCMDS=
  SET LCDCMD=
  SET tok=
  IF /I "%LOCALFOLDER%" NEQ "" (
    SET LCDCMD=-c "lcd '%LOCALFOLDER%'"
  )
  IF /I "%FOLDER%" NEQ "." SET tok=%FOLDER%

:uploadloop
  FOR /F "tokens=1* delims=\" %%a in ("%tok%") do (
    REM ECHO tok=%%a
    SET DIRCMDS=%DIRCMDS% -c "mkdir '%%a'" -c "cd '%%a'"
    SET tok=%%b
  )
  if defined tok goto :uploadloop

  REM Loop files of this dir level:
  FOR /F "tokens=1* delims=?" %%i in ('DIR /B /O:N "!prefix!"') do (
    REM Ignore directories:
    FOR %%F in ("%%~i") do set "ATTR=%%~aF"
    SET ATTR=!ATTR:~0,1!
    IF /I "!ATTR!" NEQ "d" (
      REM Shouldn't be necessary as mega65_ftp handles overwrite:
      REM but if this will need 'cd' into each level:
      REM "%MFTP%" %DEST% -c "del '%%i'"
      REM Preferably enforce uppercase, especially for FAT 8.3 names:
      SET "DISKUPPER=%%i"
      for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        set "DISKUPPER=!DISKUPPER:%%b=%%b!"
      )
      REM ECHO file=!DISKUPPER!
      "%MFTP%" %DEST% %LCDCMD% %DIRCMDS% -c "put '!DISKUPPER!'"
      REM "%MFTP%" %DEST% -c "cd '%%~nk'" -c "ren '??????~?.D81' '??????-?.D81'"
    )
  )

  REM Loop directories to recursively call this routine:
  FOR /D %%k in ("*.*") do (
    REM ECHO ----- new cd=!CD! k=%%k -----
    REM Dive the given level(s) deeper:
    REM SET OLDPATH=!CD!
    CD "%%k"

    REM ECHO k=%%k folder=%FOLDER% cd=%CD%
    IF /I "%LOCALFOLDER%" NEQ "" (
      CALL :upload "%FOLDER%\%%k" "%LOCALFOLDER%"
    ) ELSE (
      CALL :upload "%FOLDER%\%%k"
    )

    ECHO oldpath=!OLDPATH! cd=!CD! k=%%k
    REM CD /D !OLDPATH!
    CD ..
  )
EXIT /B 0

:screenshot
SET DATUM=%date:~8,2%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%%time:~6,2%

CD /D "D:\Game Collections\C64\Mega65\doc\screenshots"
"%M65%" -l COM4 -S%DATUM%.png
pause
goto menu

:end
CD /D %~dp0
echo End of script.
REM PAUSE
GOTO :eof
  REM Use in Xemu's out of the image file fs access:
REM  XCOPY /Y %PRJ%.d81 %HDOS%
REM  XCOPY /Y %DATADISK%.d81 %HDOS%

          REM -8 %HDOS%%PRJ%.d81 -9 %HDOS%%DATADISK%.d81
  XMEGA65 -besure -autoload ^
    -hdosvirt -driveled
  REM XMEGA65 -syscon -besure -prg %PRJ%.prg
)

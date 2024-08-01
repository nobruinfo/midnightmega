@ECHO OFF

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.8-win64\bin\
SET c1541="%VICE%\c1541"
SET PETCAT=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\
SET PETCAT="%PETCAT%2021\GTK3VICE-3.8-win64\bin\petcat.exe"

SET MFTP=D:\Game Collections\C64\Mega65\Tools\M65Tools\
SET MFTP=%MFTP%m65tools-develo-165-c2b03a-windows\mega65_ftp.exe
SET DEST=-e
SET XMEGA65=D:\Game Collections\C64\Mega65\Xemu\xemu-binaries-win64\
SET HDOS=%APPDATA%\xemu-lgb\mega65\hdos\
SET D81=D:\Game Collections\C64\Mega65\disks
SET D81INTRO=D:\Game Collections\C64\Mega65\disks unsorted\Intro\ALL_INTROS\sdcard-files
SET D81FNX=D:\Game Collections\C64\FNX1591\disks
SET D81C64=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme
SET CORE=D:\Game Collections\C64\Mega65\core\CORE
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
echo (h) show ftp command list
echo (c) execute ftp dir command
echo (s) change destination ethernet/Xemu
echo (q) quit
echo ==========================
choice /c mdif6oahcsq /n /m "Type key of option to be executed: "

if errorlevel 11 goto end
if errorlevel 10 goto doswap
if errorlevel 9 goto dodir
if errorlevel 8 goto dohelp
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

:dodisks
title MEGA65_FTP populating disks
CD /D "%D81%"
for /d %%k in ("%D81%\*") do (
  SET FOLDER=%%~nk
  SET "prefix1=!FOLDER!\*.d81"
  SET "prefix2=!FOLDER!\*.d64"
  SET "prefix3=!FOLDER!\*.prg"
  SET "prefix="!prefix1!" "!prefix2!" "!prefix3!""
  ECHO !prefix!
  "%MFTP%" %DEST% -c "mkdir %%~nk"
  for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N !prefix!') do (
	ECHO CD=!CD!  D81=!DISKUPPER!
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
	ECHO CD=!CD!  D81=!DISKUPPER!
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
  ECHO CD=!CD!  D81=!DISKUPPER!
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
  ECHO CD=!CD!  D81=!DISKUPPER!
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
CD /D "%D81C64%"
SET FOLDER=C64
SET "prefix1=*.d81"
SET "prefix2=*.d64"
SET "prefix3=*.prg"
SET "prefix="!prefix1!" "!prefix2!" "!prefix3!""
ECHO !prefix!
"%MFTP%" %DEST% -c "mkdir %FOLDER%"
for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N !prefix!') do (
  ECHO CD=!CD!  D81=!DISKUPPER!
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

:docore
title MEGA65_FTP populating disks
CD /D "%CORE%"
SET FOLDER=CORE
SET "prefix="*.cor""
ECHO !prefix!
"%MFTP%" %DEST% -c "mkdir %FOLDER%"
for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N !prefix!') do (
  ECHO CD=!CD!  D81=!DISKUPPER!
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
ECHO 20 print " / quit to basic">>mega65.bas
ECHO 25 getkey a$>>mega65.bas
ECHO 30 if a$ = "1" then 100 : rem intro>>mega65.bas
ECHO 31 if a$ = "2" then 200 : rem geos>>mega65.bas
ECHO 32 if a$ = "3" then 300 : rem midnight>>mega65.bas
ECHO 39 if a$ = "/" then end>>mega65.bas

ECHO 100 chdir "intro",u12>>mega65.bas
ECHO 110 mount "mega65.d81">>mega65.bas
ECHO 120 boot>>mega65.bas

ECHO 200 chdir "geos",u12>>mega65.bas
ECHO 210 mount "mega65.d81">>mega65.bas
ECHO 220 boot>>mega65.bas

ECHO 300 rem is in root folder>>mega65.bas
ECHO 310 mount "midnight.d81">>mega65.bas
ECHO 320 run "*">>mega65.bas

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

:dodir
title MEGA65_FTP ftp commands
CD /D "%D81%"
"%MFTP%" %DEST% -c dir
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
SET DEST=-e
echo Destination is now ethernet.
pause
goto menu

:destxemu
SET DEST=-d %IMG%
echo Destination is now the image file for Xemu.
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

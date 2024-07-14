@ECHO OFF

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.8-win64\bin\
SET c1541="%VICE%\c1541"
SET PETCAT=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\
SET PETCAT="%PETCAT%2021\GTK3VICE-3.8-win64\bin\petcat.exe"

SET MFTP=D:\Game Collections\C64\Mega65\Tools\M65Connect\M65Connect\M65Connect Resources\mega65_ftp.exe
SET XMEGA65=D:\Game Collections\C64\Mega65\Xemu\xemu-binaries-win64\
SET HDOS=%APPDATA%\xemu-lgb\mega65\hdos\
SET D81=D:\Game Collections\C64\Mega65\disks
SET D81INTRO=D:\Game Collections\C64\Mega65\disks unsorted\Intro\ALL_INTROS\sdcard-files
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
echo (a) populate "autoboot"
echo (h) show ftp command list
echo (c) execute ftp dir command
echo (q) quit
echo ==========================
choice /c mdiahcq /n /m "Type key of option to be executed: "

if errorlevel 7 goto end
if errorlevel 6 goto dodir
if errorlevel 5 goto dohelp
if errorlevel 4 goto doautoboot
if errorlevel 3 goto dointro
if errorlevel 2 goto dodisks
if errorlevel 1 goto doprompt

echo Invalid choice. Try again.
pause
goto menu

:doprompt
title MEGA65_FTP CLI mode
CD /D "%D81%"
"%MFTP%" -d %IMG%
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
  "%MFTP%" -d %IMG% -c "mkdir %%~nk"
  for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N !prefix!') do (
	ECHO CD=!CD!  D81=!DISKUPPER!
    SET "FOLDERSLASH=!FOLDER:\=/!"
	"%MFTP%" -d %IMG% -c "del !FOLDERSLASH!/%%i"
    SET "DISKUPPER=%%i"
    for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
      set "DISKUPPER=!DISKUPPER:%%b=%%b!"
    )
    "%MFTP%" -d %IMG% -c "cd %%~nk" -c "put !FOLDERSLASH!/!DISKUPPER!"
    REM "%MFTP%" -d %IMG% -c "cd %%~nk" -c "ren ??????~?.D81 ??????-?.D81"
  )
)
"%MFTP%" -d %IMG% -c "dir"|more
pause
goto menu

:dointro
title MEGA65_FTP populating intro
CD /D "%D81INTRO%"
"%MFTP%" -d %IMG% -c "mkdir %INTRODEST%"

REM Read all files in subfolders:
for /d %%k in ("%D81INTRO%\*") do (
  SET FOLDER=%%~nk
  SET "prefix=!FOLDER!\*.*"
  "%MFTP%" -d %IMG% -c "mkdir %%~nk"
  for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N "!prefix!"') do (
    SET "FOLDERSLASH=!FOLDER:\=/!"
	"%MFTP%" -d %IMG% -c "del !FOLDERSLASH!/%%i"
    SET "DISKUPPER=%%i"
    for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
      set "DISKUPPER=!DISKUPPER:%%b=%%b!"
    )
	ECHO CD=!CD!  D81=!DISKUPPER!
    "%MFTP%" -d %IMG% -c "cd %INTRODEST%" -c "mkdir %%~nk" -c "cd %%~nk" -c "put !FOLDERSLASH!/!DISKUPPER!"
    REM "%MFTP%" -d %IMG% -c "cd %%~nk" -c "ren ??????~?.D81 ??????-?.D81"
  )
)

REM Also read all files in main folder:
SET "prefix=%D81INTRO%\*.*"
for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N "!prefix!"') do (
  "%MFTP%" -d %IMG% -c "del %%i"
  SET "DISKUPPER=%%i"
  for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    set "DISKUPPER=!DISKUPPER:%%b=%%b!"
  )
  ECHO CD=!CD!  D81=!DISKUPPER!
  "%MFTP%" -d %IMG% -c "cd %INTRODEST%" -c "put !DISKUPPER!"
  REM "%MFTP%" -d %IMG% -c "ren ??????~?.D81 ??????-?.D81"
)

"%MFTP%" -d %IMG% -c "dir"|more
pause
CD /D "%D81%"
goto menu

:doautoboot
title MEGA65_FTP ftp commands
CD /D "%D81%"
ECHO 0 rem *** %datadisk% ***>mega65.bas
ECHO 1 print " 1 intro">>mega65.bas
ECHO 2 print " 2 geos">>mega65.bas
ECHO 20 print " / quit to basic">>mega65.bas
ECHO 25 getkey a$>>mega65.bas
ECHO 30 if a$ = "1" then 100 : rem intro>>mega65.bas
ECHO 31 if a$ = "2" then 200 : rem geos>>mega65.bas
ECHO 39 if a$ = "/" then end>>mega65.bas

ECHO 100 chdir "intro",u12>>mega65.bas
ECHO 110 mount "mega65.d81">>mega65.bas
ECHO 120 boot>>mega65.bas

ECHO 200 chdir "geos",u12>>mega65.bas
ECHO 210 mount "mega65.d81">>mega65.bas
ECHO 220 boot>>mega65.bas

%petcat% -w65 -o mega65.prg -- mega65.bas
%c1541% -format mega65,id d81 mega65.d81
%c1541% -attach mega65.d81 -write mega65.prg autoboot.c65

"%MFTP%" -d %IMG% -c "del MEGA65.D81"
"%MFTP%" -d %IMG% -c "put MEGA65.D81"
"%MFTP%" -d %IMG% -c dir
pause
DEL mega65.bas
DEL mega65.prg
DEL MEGA65.D81
goto menu

:dodir
title MEGA65_FTP ftp commands
CD /D "%D81%"
"%MFTP%" -d %IMG% -c dir
pause
goto menu

:dohelp
title MEGA65_FTP ftp commands
CD /D "%D81%"
"%MFTP%" -d %IMG% -c help
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

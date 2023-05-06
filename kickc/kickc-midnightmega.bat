@ECHO OFF

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.6.1-win64\bin\
SET c1541="%VICE%\c1541"

SET XMEGA65=D:\Game Collections\C64\Mega65\xemu-binaries-win64\
SET PATH=%PATH%;%VICE%;%XMEGA65%

CD /D %~dp0

REM JAVA HOME
REM KICKC HOME
set KICKC_HOME=%~dp0..\..\..\Mega65\KickC\kickc
echo KICKC_HOME=%KICKC_HOME% 
REM KCLIB HOME
set KICKC_STDLIB="%KICKC_HOME%\lib"
set KICKC_STDINCLUDE="%KICKC_HOME%\include"
echo KICKC_STDLIB=%KICKC_STDINCLUDE%
echo KICKC_STDINCLUDE=%KICKC_STDINCLUDE%
set KICKC_FRAGMENT_HOME="%KICKC_HOME%\fragment"
echo KICKC_FRAGMENT_HOME=%KICKC_FRAGMENT_HOME%
set KICKC_PLATFORM_HOME="%KICKC_HOME%\target"
echo KICKC_PLATFORM_HOME=%KICKC_PLATFORM_HOME%
set MEGA65_STDINCLUDE=..\..\include
set MEGA65_STDLIB=..\..\src
REM KICKASSEMBLER HOME
REM VICE HOME
REM KICKC_JAR
for %%I in ( "%KICKC_HOME%\jar\kickc-*.jar" ) do set KICKC_JAR="%%I"
echo KICKC_JAR=%KICKC_JAR%

for %%I in ( "%MEGA65_STDLIB%\*.c" ) do set MEGA65_STDLIB_FILES=!MEGA65_STDLIB_FILES! "%%I"
echo MEGA65_STDLIB_FILES=%MEGA65_STDLIB_FILES%

SET PRJ=midnightmega

REM FOR %%i IN (%PRJ%.c) DO SET DATE1=%%~ti
REM FOR %%i IN (%PRJ%.d81) DO SET DATE2=%%~ti
REM IF "%DATE1%"=="%DATE2%" GOTO NOBUILD

REM FOR /F %%i IN ('DIR /B /O:D %PRJ%.c %PRJ%.d81') DO SET NEWEST=%%i
REM IF %NEWEST%==%PRJ%.d81 GOTO NOBUILD

REM echo java -jar %KICKC_JAR% -I %KICKC_STDINCLUDE% -L %KICKC_STDLIB% -F %KICKC_FRAGMENT_HOME% -P %KICKC_PLATFORM_HOME% %*
SET BUILD=java -jar %KICKC_JAR% -I %KICKC_STDINCLUDE% -L %KICKC_STDLIB% ^
-I %MEGA65_STDINCLUDE% -L "%MEGA65_STDLIB%" ^
-F %KICKC_FRAGMENT_HOME% ^
-a ^
-P %KICKC_PLATFORM_HOME% ^
-target=mega65

REM -o "%~dp0"


REM -o "%~dp0" -a  "%MEGA65_STDLIB%\*.c"

REM %BUILD% %MEGA65_STDLIB%\memory.c %PRJ%.c %*
%BUILD% %PRJ%.c%MEGA65_STDLIB_FILES% %*

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

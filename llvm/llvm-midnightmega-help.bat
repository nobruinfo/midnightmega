@ECHO OFF

REM  _            _                 _       
REM | |_ ___  ___| |_    ___  _ __ | |_   _ 
REM | __/ _ \/ __| __|  / _ \| '_ \| | | | |
REM | ||  __/\__ \ |_  | (_) | | | | | |_| |
REM  \__\___||___/\__|  \___/|_| |_|_|\__, |
REM                                   |___/ 
REM This is in competition with the original
REM .bat file.

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.7-win64\bin\
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


  %c1541% -format disk%PRJ%,id d81 %PRJ%.d81
  %c1541% -attach %PRJ%.d81 -delete %PRJ%
  %c1541% -attach %PRJ%.d81 -write %PRJ%.prg %PRJ%
  %c1541% -attach %PRJ%.d81 -write emu%PRJ%.prg emu%PRJ%
  %petcat% -w65 -o ht2.src.prg -- ht2.src.bas
  %c1541% -attach %PRJ%.d81 -write ht2.src.prg ht2.src
  
  REM Helpfile with control codes and colours:
  REM https://mega65.atlassian.net/wiki/x/AYCjAQ
  REM https://dansanderson.com/mega65/petscii-codes/ section "PETSCII control codes"
  REM https://vice-emu.sourceforge.io/vice_toc.html#TOC391
  REM https://www.c64-wiki.de/wiki/Petcat#Nicht_druckbare_Zeichen
  %petcat% -text -c -w2 -o help.seq -- help.txt
  %c1541% -attach %PRJ%.d81 -write help.seq help.seq,s

  XMEGA65 -besure ^
	-driveled ^
    -8 %PRJ%.d81
REM	-autoload
REM    -hdosvirt
REM	-defd81fromsd
REM	-9 %DATADISK%.d81 -autoload
  REM XMEGA65 -syscon -besure -prg !PRJSHORT!.prg

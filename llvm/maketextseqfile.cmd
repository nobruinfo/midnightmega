@ECHO OFF

REM maketextseqfile.cmd  uses a Linux tool to create
REM           the SEQ file to contain strings used in
REM           
REM           Midnight Mega
REM
REM based on: https://github.com/dadadel/binmake
REM
REM prerequsites: - wsl
REM               - 
REM               - 
REM           
REM 2022-12-02  nobruinfo  - Replaced Xemu with cbm-shell, see prerequsites.
REM                        - Disk image generated if not existant.
REM 2022-11-28  nobruinfo  Initial version.
REM

CHCP 65001

SET ps=C:\WINNT\system32\windowspowershell\v1.0\powershell.exe
SET ps=powershell.exe

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

FOR /D %%I IN ("%~dp0") do SET LATEXROOT=%%~sI.

SET nir="%LATEXROOT%\Nircmd\nircmd.exe"
REM SET PATH=%PATH%;C:\Python312

TITLE %~n0
REM https://opensourcepack.blogspot.com/2012/06/rsvg-convert-svg-image-conversion-tool.html
REM SET PATH=%PATH%;C:\Python312\Lib\site-packages
SET "PATH=%PATH:\.\=\%"

SET zenitypath=%LATEXROOT%\zenity-2.28.0_win32-3\bin
SET zenity="%zenitypath%\zenity.exe"
SET ZENITY_DATADIR=%LATEXROOT%\zenity-2.28.0_win32-3\share\

SET GCC=F:\Entwicklungsprojekte\Hugin\pantest\
SET GCC=%GCC%strawberry-perl-5.32.1.1-64bit-portable\c\bin\
SET GCC=%GCC%x86_64-w64-mingw32-gcc.exe

REM Now remove all paths that could interfere:
CALL SET PATH=%%PATH:%LOCALAPPDATA%\Microsoft\WindowsApps=%%
CALL SET PATH=%%PATH:C:\Program Files (x86)\GnuPG\bin=%%
CALL SET PATH=%%PATH:C:\Program Files ^(x86^)\Common Files\Oracle\Java\javapath=%%
CALL SET PATH=%%PATH:C:\ProgramData\Oracle\Java\javapath=%%
CALL SET PATH=%%PATH:C:\Windows\System32\OpenSSH\=%%
CALL SET PATH=%%PATH:C:\tools\Cmder=%%
CALL SET PATH=%%PATH:C:\ProgramData\chocolatey\bin=%%
CALL SET PATH=%%PATH:;;=;%%

REM echo %path%
REM pause

SET consolewidth=140

REM X Y width height, the actual size to be set by powershell command:
%nir% win setsize foreground 5 5 500 500
mode %consolewidth%,60
REM mode con: lines=2500
REM mode con: cols=%1 lines=%2
powershell -command "&{$H=get-host;$W=$H.ui.rawui;$B=$W.buffersize;$B.width=%consolewidth%;$B.height=1000;$W.buffersize=$B;}"

CD /D %~dp0

REM SETLOCAL

REM python factoriomod.py
REM cmd

REM PAUSE

IF 1 == 2 (
  CD /D F:\Entwicklungsprojekte\make\binmake-master\src

  REM PATH=%PATH%;C:\MinGW64\bin;C:\MinGW64\msys\1.0\bin;C:\MinGW64\msys\1.0\opt\windows_64\bin
REM  PATH=%PATH%;F:\Entwicklungsprojekte\Hugin\pantest\strawberry-perl-5.32.1.1-64bit-portable\c\bin
REM  PATH=%PATH%;C:\MinGW64\msys\1.0\bin;C:\MinGW64\msys\1.0\opt\windows_64\bin

  set LIBRARY_PATH=c:\MinGW64\lib
  set LIBRARY_PATH=F:\Entwicklungsprojekte\Hugin\pantest\strawberry-perl-5.32.1.1-64bit-portable\c\lib

  SET INC=-I. -I../include
  SET CFLAGS=-std=c++11 -Wall -Wextra

  %GCC% -o BinStream.o BinStream.cpp %INC% %CFLAGS%
  %GCC% -o binmake.o binmake.cpp %INC% %CFLAGS%
  %GCC% -o bin_tools.o bin_tools.cpp %INC% %CFLAGS%
  %GCC% -o utils.o utils.cpp %INC% %CFLAGS%

  %GCC% --static binmake -o BinStream.o binmake.o bin_tools.o utils.o
)

echo #!/usr/bin/env sh>sh.sh
echo /mnt/f/Entwicklungsprojekte/github-nobru/binmake/bin/binmake ^< /mnt/f/Entwicklungsprojekte/github-nobru/binmake/example.txt ^> test.out>>sh.sh
echo ls -l /mnt/f/Entwicklungsprojekte/github-nobru/midnightmega/llvm/>>sh.sh
wsl --exec sh sh.sh
del sh.sh

:Ende
REM ping -n 3 localhost>NUL

CHCP 850 >> NUL 2>>NUL
PAUSE

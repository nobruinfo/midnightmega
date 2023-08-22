@ECHO OFF

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.6.1-win64\bin\
SET c1541="%VICE%\c1541"

SET XMEGA65=D:\Game Collections\C64\Mega65\Xemu\xemu-binaries-win64\
set LLVM_HOME=%~dp0..\..\..\Mega65\llvm-mos\llvm-mos
set LLVM_BAT=%LLVM_HOME%\bin\mos-mega65-clang.bat
SET PATH=%PATH%;%VICE%;%XMEGA65%
SET PATH=%PATH%;C:\Program Files\CMake\bin
SET PATH=%PATH%;F:\chocolatey\ProgramData\chocolatey\bin
SET PATH=%PATH%;%LLVM_HOME%\bin

CD /D %~dp0


SET PRJ=midnightmega

SET opts=
SET cfiles=

SET CMAKE_PREFIX_PATH=F:\Entwicklungsprojekte\Mega65\llvm-mos\llvm-mos\lib\cmake\llvm-mos-sdk
cd /D F:\Entwicklungsprojekte\github-nobru\midnightmega\ninja

ECHO cmake_minimum_required(VERSION 3.18) > CMakeLists.txt
ECHO set(LLVM_MOS_PLATFORM mega65)        >>CMakeLists.txt
ECHO find_package(llvm-mos-sdk REQUIRED)  >>CMakeLists.txt
ECHO project(%PRJ% VERSION 1.0.0 LANGUAGES C) >>CMakeLists.txt
ECHO add_subdirectory(mega65-libc)  >>CMakeLists.txt
ECHO include_directories(include)  >>CMakeLists.txt
ECHO add_executable(%PRJ%.prg %PRJ%.c)        >>CMakeLists.txt
ECHO target_link_libraries(%PRJ%.prg PRIVATE mega65libc) >>CMakeLists.txt

REM cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX=F:\Entwicklungsprojekte\Mega65\llvm-mos\llvm-mos\bin
REM ninja install
cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX=F:\Entwicklungsprojekte\Mega65\llvm-mos\llvm-mos\bin
ninja install

REM CALL %LLVM_BAT% -Os %opts% -o %PRJ%.s -Wl,--lto-emit-asm %PRJ%.c %cfiles%
REM ECHO ------------------------------------------------------
REM  -Wall
REM CALL %LLVM_BAT% -Os -o %PRJ%.prg %opts% %PRJ%.c %cfiles%

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


@ECHO OFF

REM This to have those !vars! at hand which aren't preset outside loops:
setlocal enabledelayedexpansion

SET VICE=D:\Eigene Programme\Emulatoren-Zusatzdateien\Eigene Programme\2021
SET VICE=%VICE%\GTK3VICE-3.6.1-win64\bin\
SET c1541="%VICE%\c1541"

SET MFTP=D:\Game Collections\C64\Mega65\Tools\M65Connect\M65Connect Resources\mega65_ftp.exe
SET XMEGA65=D:\Game Collections\C64\Mega65\Xemu\xemu-binaries-win64\
SET HDOS=%APPDATA%\xemu-lgb\mega65\hdos\
SET "HDOSSLASH=%HDOS:\=/%"
SET IMG=%APPDATA%\xemu-lgb\mega65\mega65.img
SET PATH=%PATH%;%VICE%;%XMEGA65%

CD /D %~dp0

GOTO HELPSKIP

MEGA65 File Transfer Program Command Reference:

dir [directory|wildcardpattern] - show contents of current or specified sdcard directory. Can use a wildcard pattern on current directory.
ldir [wildcardpattern] - shows the contents of current local directory.
cd [directory] - change current sdcard working directory.
lcd [directory] - change current local working directory.
put <file> [destination name] - upload file to SD card, and optionally rename it destination file.
get <file> [destination name] - download file from SD card, and optionally rename it destination file.
dput <file> - upload .prg file wrapped into a .d81 file
del <file> - delete a file from SD card.
mkdir <dirname> - create a directory on the SD card.
cd <dirname> - change directory on the SD card. (aka. 'chdir')
rename <oldname> <newname> - rename a file on the SD card.
clusters <file> - show cluster chain of specified file.
mount <d81file> - Mount the specified .d81 file (which resides on the SD card).
sector <number|$hex number> - display the contents of the specified sector.
getslot <slot> <destination name> - download a freeze slot.
dirent_raw 0|1|2 - flag to hide/show 32-byte dump of directory entries. (2=more verbose)
clustermap <startidx> [<count>] - show cluster-map entries for specified range.
cluster <num> - dump the entire contents of this cluster.
secdump <filename> <startsec> <count> - dump the specified sector range to a file.
secrestore <filename> <startsec> - restore a dumped file back into the specified sector area.
secinfo - lists the locations of various useful sectors, for easy reference.
mbrinfo - lists the partitions specified in the MBR (sector 0)
vbrinfo - lists the VBR details of the main Mega65 partition
poke <sector> <offset> <val> - poke a value into a sector, at the desired offset.
fh - retrieve a list of files available on the filehost at files.mega65.org
     - can use wildcard searches. E.g. 'fh *.cor'
     - can use -t to sort by published datetime
fhget <num> [destname] - download a file from the filehost and upload it onto your sd-card
                         (to only download to local drive, set destname to -
fhflash <num> <slotnum> - download a cor file from the filehost and flash it to specified slot via vivado
flash <fname> <slotnum> - flash a cor file on your local drive to specified slot via vivado
roms - list all MEGA65x.ROM files on your sd-card along with their version information
exit - leave this programme.
quit - leave this programme.

:HELPSKIP

SET PRJ=midnightmega
SET DATADISK=datadisk
SET "prefix=%HDOS%\*.d81"

REM mega65_ftp -d mega65.img

"%MFTP%" -d %IMG%
for /f "tokens=1* delims=?" %%i in ('DIR /B /O:N "%prefix%"') do (
  "%MFTP%" -d %IMG% -c "del %%i"
  "%MFTP%" -d %IMG% -c "put %HDOSSLASH%/%%i"
)
"%MFTP%" -d %IMG% -c "dir"|more

PAUSE
GOTO :eof
  REM Use in Xemu's out of the image file fs access:
  XCOPY /Y %PRJ%.d81 %HDOS%
  XCOPY /Y %DATADISK%.d81 %HDOS%

  XMEGA65 -besure -8 %HDOS%%PRJ%.d81 -9 %HDOS%%DATADISK%.d81 -autoload ^
    -hdosvirt -driveled
  REM XMEGA65 -syscon -besure -prg %PRJ%.prg
)

@echo off
setlocal enabledelayedexpansion

SET xxd=F:\chocolatey\tools\Cmder\vendor\git-for-windows\usr\bin\xxd.exe

:: Name der Ausgabedatei
set "output_file=fakedisk.d81"

:: Anzahl der 64-Byte-Blöcke
set "num_blocks=3200"

:: Leeren der Ausgabedatei, falls sie existiert
break > "%output_file%"

:: Temporäre Datei für einen 64-Byte-Block
set "temp_block=temp_block.bin"

:: Erstellen eines 64-Byte-Blocks, initialisiert mit Null-Bytes
break > "%temp_block%"
for /L %%i in (1,1,84) do (
    (echo. & set /p "= " < nul) >> "%temp_block%"
)

GOTO skip
for /L %%i in (1,1,%num_blocks%) do (
    :: Erstellen der Blocknummer als 4 Byte
    set /A "high=%%i >> 8"
    set /A "low=%%i & 0xFF"
    set "block_number=!high!!low!"

    :: Temporäre Datei für die Blocknummer
    break > block_number.bin

    :: Schreiben der Blocknummer als 4-Byte-Wert
    set /A "byte1=%%i %% 10"
    set /A "byte2=%%i / 10 %% 10"
    set /A "byte3=%%i / 100 %% 10"
    set /A "byte4=%%i / 1000 %% 10"
REM	ECHO !byte4!!byte3!!byte2!!byte1!

    <nul set /p "=0x3!byte4!" | %xxd% -r -p >> block_number.bin
    <nul set /p "=0x3!byte3!" | %xxd% -r -p >> block_number.bin
    <nul set /p "=0x3!byte2!" | %xxd% -r -p >> block_number.bin
    <nul set /p "=0x3!byte1!" | %xxd% -r -p >> block_number.bin

    copy /b block_number.bin + %temp_block% new_block.bin > nul
    copy /b "%output_file%" + new_block.bin "%output_file%.tmp" > nul
    move /Y "%output_file%.tmp" "%output_file%" > nul
)
:skip

for /L %%i in (1,1,80) do (
  for /L %%j in (0,1,39) do (
    set /A "ts=%%i * 100 + %%j"
	:: Erstellen der Blocknummer als 4 Byte
    set /A "high=%%i >> 8"
    set /A "low=%%i & 0xFF"
    set "block_number=!high!!low!"

    :: Temporäre Datei für die Blocknummer
    break > block_number.bin

    :: Schreiben der Blocknummer als 4-Byte-Wert
    set /A "byte1=!ts! %% 10"
    set /A "byte2=!ts! / 10 %% 10"
    set /A "byte3=!ts! / 100 %% 10"
    set /A "byte4=!ts! / 1000 %% 10"
REM	ECHO !byte4!!byte3!!byte2!!byte1!

    <nul set /p "=0x3!byte4!" | %xxd% -r -p >> block_number.bin
    <nul set /p "=0x3!byte3!" | %xxd% -r -p >> block_number.bin
    <nul set /p "=0x3!byte2!" | %xxd% -r -p >> block_number.bin
    <nul set /p "=0x3!byte1!" | %xxd% -r -p >> block_number.bin

    copy /b block_number.bin + %temp_block% new_block.bin > nul
    copy /b "%output_file%" + new_block.bin "%output_file%.tmp" > nul
    move /Y "%output_file%.tmp" "%output_file%" > nul
  )
)

:: Bereinigung der temporären Dateien
del "%temp_block%"
del block_number.bin
del new_block.bin

echo Binärdatei %output_file% erfolgreich erstellt.
endlocal
PAUSE

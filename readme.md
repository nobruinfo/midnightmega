# Midnight Mega

A simple file commander and disk mounting
programme.

Work in progress.

# subfolders

## kickc

When adding/removing lines of code the emulator freezes at various positions
with no apparent reason.

## llvm

Downloaded the .7z file `release` from the llvm-mos Github repo and
built my own make batch file for it. Seems to have wasted all zeropage
*imaginary registers* and won't let me have a running programme. When
arbitrarily commenting out line the amount of overflow varies accordingly.

## ninja

Switched to repo `https://github.com/mlund/llvm-mos-sdk` branch
`mega65-headers` to have KickC alike include files. Did have to rebuild
the whole `llvm-mos-sdk` first but now am stuck at the exact position
as describes in subchapter `llvm` above.

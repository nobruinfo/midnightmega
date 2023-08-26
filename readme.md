# Midnight Mega

A simple file commander and disk mounting programme.

Work in progress.

# subfolders

## kickc

When adding/removing lines of code the emulator freezes at various
positions with no apparent reason.

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

# requirements

## not yet in progress

* Hyppo SD card handling as far as possible (writing not yet implemented
  on Hyppo side)
* Creation of .d81 image files currently unsopported by Hyppo
* copying of complete disk images, real diskettes respectively
* copying of single/multiple files in between real/virtual drives,
  mounted images
* GUI, Midnight/Norton Commander oriented

# tasks

* proof of concept accessing .d81 mount handling
* proof of concept abstraction layer real/virtual floppy image
* proof of concept reading floppy (sub-) directories
* proof of concept reading files, sectors, tracks
* proof of concept writing files, sectors, tracks
* refactoring for code runtime optimisation

# bugs

* reading/writing .d81 always takes two logical sectors at once, writing
  of a single one should first read its accompaigning one
* reading the last sector 39 results in side 1 and an invalid next track

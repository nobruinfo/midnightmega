# Midnight Mega

A simple file commander and disk mounting programme.

Work in progress.

# subfolders

## kickc

When adding/removing lines of code the emulator freezes at various
positions with no apparent reason.

## llvm

Downloaded the .7z file `release` from the llvm-mos Github repo and
built my own make batch file for it. In this folder I'm currently
adding functionality to my little file manager project.

## ninja

Switched to repo `https://github.com/mlund/llvm-mos-sdk` branch
`mega65-headers` to have KickC alike include files. Did have to rebuild
the whole `llvm-mos-sdk` to get it to cross compile. Currently I'm not
following this line of development chain. I'm awaiting the latest
additions to the [mega65-libc](https://github.com/mega65/mega65-libc).

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

## contributions to `mega65-libc`

* are in file `llvm/conioextensions.h` and are quirky because of most
  in `conio.c` being `static`
* the full removal of `KickC` based include files from folder
  `llvm/include`

## contributions to llvm-mos

* The following line do autodeclare `DIRENTPAGELOW` in case it
  is not defined elsewhere. It's value then is indetermined.

```c
#define readdir_direntasm DIRENTPAGELOW
__asm__(".set readdir_dirent, " XSTR(readdir_direntasm) );
```

# bugs

* `dirent` is currently not fully updated, additional sectors are
  currently not added automatically
* The yet state of development only uses the left file list so *copy*
  actually only duplicates files on the same disk
* BAM is only supported for one sector, tracks 41 to 80 therefore not
  yet covered
* BAM is not yet in attic RAM, therefore multiple discs not cached
* Handling of DEL type files
* ~~reading/writing .d81 always takes two logical sectors at once,~~
  ~~writing of a single one should first read its accompaigning one~~
* ~~reading the last sector 39 results in side 1 and an invalid next~~
  ~~track~~

# Midnight Mega

A simple file commander and disk mounting programme.

Work in progress.

# installation

Try only with **backed up** disks and .d81 ! The current state
of this development will **eat** your files.

* Check the project out and dive into folder `llvm`.
* Use `MOUNT "midnightmega.d81"` as programme disk.
* Optionally use `MOUNT "datadisk.d81",U9` as a torture disk. Or
  use **copies** of your own disks.

# subfolders

## llvm

Downloaded the .7z file `release` from the llvm-mos Github repo and
built my own make batch file for it. In this folder I'm currently
adding functionality to my little file manager project.

Please be aware currently Midnight Mega is in an unstable state, it
might handle your .d81 and real disk drive inserted diskettes
maliciously. Expect data loss. Feedback welcome as issue tickets.

# requirements

## not yet in progress

* Hyppo SD card handling as far as possible (writing not yet
  implemented on Hyppo side, neither reading back info on already
  mounted image files)
* Creation of .d81 image files currently unsopported by Hyppo
* copying of complete disk images, real diskettes respectively
* copying of single/multiple files in between real/virtual drives,
  mounted images
* Text based GUI, Midnight/Norton Commander oriented
* It will not be possible to copy full .d81 files or complete disk
  images to new ones of each other because of the lack of Hyppo
  functions for it. So use the freezer to have a couple of empty .d81
  files at hand and use full disk or per file copy, whatever suits.
* Handling of subdirectories (sub-partitions of file type `CBM`).
* Full disk copy, meaning only within already mounted .d81 disk
  image files or with real floppy diskettes.
* For `llvm` replace most fixed strings for screen output with
  [their syntax](https://llvm-mos.org/wiki/Character_set). Maybe
  check how PETSCII differs from screen codes/attributes. Otherwise
  use the cc65 approach.

# tasks

* ✓ proof of concept accessing .d81 mount handling
* ability to use the same drive number on both sides of the commander
  to copy files onto the same disk
* proof of concept abstraction layer real/virtual floppy image
* proof of concept reading floppy (sub-) directories
* ✓ proof of concept reading files, sectors, tracks
* ✓ proof of concept writing files, sectors, tracks
* refactoring for code runtime optimisation
* test data copy by exceeding the maximum number of allowed blocks
* test unmounted drives, empty disks and other error handling
* remove `dirent` sectors if empty after file deletions, retain
  track chain.
* ✓ show a status feeter with number of blocks available

## additions to `mega65-libc`

* are in file `llvm/conioextensions.h` and are quirky because of most
  in `conio.c` being `static`
* the full removal of `KickC` based include files from folder
  `llvm/include`

## additions to llvm-mos

* The following line do autodeclare `DIRENTPAGELOW` in case it
  is not defined elsewhere. It's value then is indetermined.

```c
#define readdir_direntasm DIRENTPAGELOW
__asm__(".set readdir_dirent, " XSTR(readdir_direntasm) );
```

# bugs

* Additional `dirent` blocks are placed outside track 40 and this
  is not what Commodore did.
* Additional file blocks are also placed within track 40.
* BAM and `dirent` blocks are read/written way too often. With the
  now cache for two disks (left and right) in place this can be
  optimised.
* ✓ ~~`dirent` is currently not fully updated, additional sectors~~
  ~~are currently not added automatically.~~
* `dirent` currently uses a full 255 bytes page of data which of
  course is completely unecessary.
* ✓ ~~`dirent` currently is read beginning with the first block of~~
  ~~file entries not supporting the disk name block at track 40~~
  ~~sector 0.~~
* ✓ ~~The yet state of development only uses the left file list so~~
  ~~*copy* actually only duplicates files on the same disk~~
* ✓ ~~BAM is only supported for one sector, tracks 41 to 80~~
  ~~therefore not yet covered.~~
* ✓ ~~BAM is not yet in attic RAM, therefore multiple discs not~~
  ~~cached.~~
* Improve handling of DEL type files.
* ✓ ~~reading/writing .d81 always takes two logical sectors at once,~~
  ~~writing of a single one should first read its accompaigning one~~
* ✓ ~~reading the last sector 39 results in side 1 and an invalid next~~
  ~~track~~

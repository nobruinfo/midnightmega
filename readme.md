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

# operation

* Most keys are shown in the feeter bar
* [Ctrl][r] to rescan current file panel (left or right)
* Due to Hypervisor limitations .d81 image files can neither be
  copied as a whole nor be created, use the MEGA65 freezer menu
  to do so
* [Mega][F5] copies each and every files of the selected side
  (left or right) to the opposite one, this will **overwrite** a
  whole disk (image) contents irrevocably
* [&larr;] in the upper left of your keyboard can be used instead
  of the `..` directory entry to climb to the parent directory
* Currently the left pane is always drive 0 and the right one
  drive 1, a later handling within the same drive is planned
  allowing you to copy files within one disk
* [F2] ([Shift][F1] on the MEGA65 of course) is used for both
  switching from a mounted .d81 to the selection within the
  storage card and back

# subfolders

## llvm

Downloaded the .7z file `release` from the llvm-mos Github repo and
built my own make batch file for it. In this folder I'm currently
adding functionality to my little file manager project.

Please be aware currently Midnight Mega is in an unstable state, it
might handle your .d81 and real disk drive inserted diskettes
maliciously. Expect data loss. Feedback welcome as issue tickets.

# requirements, project

## not yet in progress

* greyed out function keys will get implemented
* function keys in the foot of the screen will be showing more
  modifier key combinations 
* Hyppo SD card handling as far as possible (writing not yet
  implemented on Hyppo side)
* Creation of .d81 image files currently unsopported by Hyppo
* copying of ~~single~~/multiple files in between real/virtual drives,
  mounted images
* Handling of subdirectories (sub-partitions of file type `CBM`)
  inside diskettes
* For `llvm` replace most fixed strings for screen output with
  [their syntax](https://llvm-mos.org/wiki/Character_set). Maybe
  check how PETSCII differs from screen codes/attributes. Otherwise
  use the cc65 approach.
* Maybe reading of a setting file to get configurable personal
  preferences a go, a seperate setup programme could be added to
  the disk

## tasks

* ✓ Text based GUI, Midnight/Norton Commander oriented
* ✓ copying of complete disk images, real diskettes respectively
* ✓ proof of concept accessing .d81 mount handling
* [Ctrl][u] to swap mount situation
* ability to use the same drive number on both sides of the commander
  to copy files onto the same disk
* Unmounting to gain full access to the underlying real floppy drive
  is not yet implemented
* ✓ Full disk copy, meaning only within already mounted .d81 disk
  image files or with real floppy diskettes
* ✓ proof of concept abstraction layer real/virtual floppy image
* proof of concept reading floppy (sub-) directories
* ✓ proof of concept reading files, sectors, tracks
* ✓ proof of concept writing files, sectors, tracks
* refactoring for code runtime optimisation
* test data copy by exceeding the maximum number of allowed blocks
* test unmounted drives, empty disks and other error handling
* remove `dirent` sectors if empty after file deletions, retain
  track chain
* ✓ show a status feeter with number of blocks available
* Involving the user to handle same name files/directories
* `s[]` and `OPTION option` are maybe data to put to different
  places, `s[]` could be the same pointer as `p2sbuf`

## bugs

* ✓ ~~Additional `dirent` blocks are placed outside track 40~~
  ~~and this is not what Commodore did.~~
* ✓ ~~Additional file blocks are also placed within track 40.~~
* BAM and `dirent` blocks are read/written way too often. With the
  now cache for two disks (left and right) in place this can be
  optimised.<br />
  A BAM flag could be used to only read it back in case disk
  operation need access to it/alter it.
* The disk controller always reads/writes two logical sectors
  at a time because of course it acts on physical 80 sectored
  dual sided media. The now abstraction make in no way optimal
  use of that.<br />
  Either reading one sector could keep the other in a cache or
  `UpdateSectors()` could be optimised to read them all at once
  in a proper numeric order.
* ✓ ~~`dirent` is currently not fully updated, additional sectors~~
  ~~are currently not added automatically.~~
* `dirent` currently uses a full 255 bytes page of data which of
  course is completely unnecessary.
* ✓ ~~`dirent` currently is read beginning with the first block of~~
  ~~file entries not supporting the disk name block at track 40~~
  ~~sector 0.~~
* ✓ ~~The yet state of development only uses the left file list so~~
  ~~*copy* actually only duplicates files on the same disk~~
* ✓ ~~BAM is only supported for one sector, tracks 41 to 80~~
  ~~therefore not yet covered.~~
* ✓ ~~BAM is not yet in attic RAM, therefore multiple discs not~~
  ~~cached.~~
* ✓ ~~Improve handling of DEL type files.~~
* ✓ ~~reading/writing .d81 always takes two logical sectors at once,~~
  ~~writing of a single one should first read its accompaigning one~~
* ✓ ~~reading the last sector 39 results in side 1 and an invalid next~~
  ~~track~~
* Modifier key handling could be improved/optimised to treat keys
  different that don't require modification at all
* Flickering in Xemu when e.g. cursor up is performed multiple times
  because of how modifier keys are currently handled

# C environment

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

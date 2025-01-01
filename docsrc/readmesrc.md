# Midnight Mega

A simple file commander and disk mounting programme.

Work in progress.

# News

The current versions of `Midnight Mega` unfortunately are
**slowed down** on purpose if you use a release version of
the core software for your MEGA65. Specifically this is The
file `HICKUP.M65` which resides on your storage card.

You might temporarily install a newer `HICKUP.M65` with a
factory delivered R6 machine to get the full `Midnight Mega`
experience. Should you stay as you are MM will prompt you
what you miss, mainly speed.

# Installation

Try only with **backed up** disks and .d81 ! The current state
of this development will **eat** your files.

* Check the project out and dive into folder `llvm`.
* Use `MOUNT "MIDNIGHT.D81"` as programme disk.
* Optionally use `MOUNT "DATADISK.D81",U9` as a torture disk. Or
  use **copies** of your own disks.

# Start

Currently `MIDNIGHTMEGA` PRG is the only programme. You find it
within `MIDNIGHT.D81`.

The earlier file `DBGMIDNIGHTMEGA` PRG to see an additional
disk/track/sector/read/write in the lower left of the screen is
no longer needed. The overlay is configurable in the setup which
you can reach with the [F9] key.

The second file `EMUMIDNIGHTMEGA` PRG no longer provided was the
same as `DBGMIDNIGHTMEGA` but with additional delays for each
sector read and written. It was used to examine `.d81` on storage
card behaviours or in XMega65 from the Xemu emulators suite. Both
otherwise being quite fast to look at. The delay feature currently
is not available.

The additional output shows like `D1T40S1 R` where `D1` is the
chosen disk drive number (currently 0 for the left screen pane
and 1 for the righthand one). `T40` is the track, `S1` the sector
number currently in operation. So `R` is reading while `W` is
writing the disk (image).

After starting the main programme `MIDNIGHTMEGA` is loading an SEQ
file named `MIDNIGHTMEGATEXT` into the Attic RAM of your MEGA65
computer or XMega65 (Xemu) emulator. If it is unable to do so it
will prompt you and cease to work. Hence both files are essential
for the operation of *Midnight Mega*.

# Limitations

* *Midnight Mega* is still in a beta testing release, and it is
  recommended to back up your data regularly.
* Please report any issues you find, and join the discussion
  on the `#midnight-mega` channel of the MEGA65 Discord.
* Also note that it only supports disk images and the internal
  floppy drive; it does not yet support external IEC drives.
* Since the left listing pane is always drive `0` and the right
  one `1` you have to set up both sides reasonably. In most cases
  drive `1` will not have a disk image mounted when you start
  *Midnight Mega*. This will give you a ping sound, a red
  screen border and the flashing message `disk access error`,
  displaying the list of available subfolders and disk image files
  on the storage card (image file) to be mounted instead.
* Should you try to mount a disk with illegal track/sector file
  chains or other erroneous data it will not be opened and you
  will be sent back to the storage card file selection instead.
  This is because *Midnight Mega* is currently unable to show
  incomplete directory structures. You may want to try accessing
  such disks in normal BASIC and optionally reformat to make them
  usable for *Midnight Mega*.

# Operation

The following keymapping is also shown when opened by pressing
the [F1] or [HELP] key.

* Most keys are shown in the feeter bar
* [Ctrl][r] to rescan current file panel (left or right)
* Due to Hypervisor limitations .d81 image files can neither be
  copied as a whole nor be created, use [Mega][F3] to reach the
  MEGA65 freezer menu to do so
* [Mega][F5] copies all blocks (allocated ones if configured) of
  the selected side (left or right) to the opposite one, this
  will **overwrite** a whole disk (image) contents irrevocably
* [&larr;] in the upper left of your keyboard can be used instead
  of the `..` directory entry to climb to the parent directory
* Currently the left pane is always drive 0 and the right one
  drive 1, a later handling within the same drive is planned
  allowing you to copy files within one disk
* [F2] ([Shift][F1] on the MEGA65 of course) is used for both
  switching from a mounted .d81 to the selection within the
  storage card and back
* [F11] unmounts the current side to reach a real floppy
  drive. Bear in mind the MEGA65 in its factory delivered state
  has no hardware drive 1, so the right side unmount will greet
  you with an error message.
* [Mega][F3] opens the Freezer screen. It is an in-application
  alternative to using a longer press onto the [RESTORE] key.
  After coming back the application is rescanning the drives like
  it does if the [Ctrl][r] combination of keys is used to ensure
  updated disk contents
* [F7] is to create a subdirectory. [Mega][Shift][F7] to format
  the disk/image file completely. This only writes a few blocks,
  there is no low level format. Should you have difficulties
  regaining access to a disk through *Midnight Commander* please
  consider a real `FORMAT` from BASIC.

# Project subfolders here on Github

## llvm

The downloaded .7z file `release` from the llvm-mos Github repo is
used in my own make batch file. In this folder I'm currently
adding functionality to my little file manager project.

Please be aware currently *Midnight Mega* is in an unstable state,
it might handle your .d81 and real disk drive inserted diskettes
maliciously. Expect data loss. Feedback welcome as issue tickets.

## Others

Previously present folders for `KickC` and `Calypsi` were removed.

# Tools and experiments

## Romlister

Shipped with *Midnight Mega's* .d81 disk image file comes
*Romlister*. This is a simple output page also available within
*Midnight Mega* showing the versions of each `MEGA65.ROM` file
on the storage card (image file). So it actually uses the MEGA65's
so called Hyppo functions to see the underlying FAT based file
system.

## PC transfer

Also in subfolder `llvm` you find a script `xemu-image.bat`. This
is currently used to populate an empty storage card image file to
be used in Xemu. It also allows to choose in between image files
and real seriel/network connections towards the hardware. You may
want to look into the lines to get some ideas for your own setup.

## Handling PETSCII texts

`midnightmegatext.src` is a text file which gets converted into
a `SEQ` file. Like this I can use screen output strings in a
preformatted way. Within the source file you can see curly braces
used for control characters and codes being intercepted by the
programme's code. The file is loaded at startup and the code reads
each byte. After every line end (ASCII code 13) it expects a new
string. The function being called thus sees over a hundred single
fromatted text lines originating from within the file. This is
supposed to make the actual programme file smaller to allow for
more features. Currently still lots of strings are within the
`PRG` file waiting for a transfer.

# Requirements, project

## Not yet in progress

* greyed out function keys will get implemented.
* function keys in the foot of the screen will be showing more
  modifier key combinations.
* storage card and file entry flags need to be handled outside
  of the dirent to further support illegal dirent attributes.
* Hyppo SD card handling as far as possible (writing not yet
  implemented on Hyppo side).
* Creation of .d81 image files currently unsopported by Hyppo.
* For `llvm` replace most fixed strings for screen output with
  [their syntax](https://llvm-mos.org/wiki/Character_set). Maybe
  check how PETSCII differs from screen codes/attributes. Otherwise
  use the cc65 approach.
* Maybe reading of a setting file to get configurable personal
  preferences a go, a seperate setup programme could be added to
  the disk.
* [F1][Help] need to load a text file from the diskette and show
  the user, same routines to be used as for [F3].
* GEOS VLIR filenames and file types are not displayed correctly,
  neither are they supported nor rejected.
* Add the core's .d64 support.
* In addition to `.prg` and `.d81` create a ROM file with the
  programme to be used like so.

## Tasks

### operational

* ✓ copying of complete disk images, real diskettes respectively
* ✓ proof of concept accessing .d81 mount handling
* ✓ copying of single/multiple files in between real/virtual drives,
  mounted images
* ✓ Handling of subdirectories (sub-partitions of file type `CBM`)
  inside diskettes
* [Ctrl][u] to swap mount situation, mind swapping the complete
  attic too &#x2639;
* ability to use the same drive number on both sides of the commander
  to copy files onto the same disk
* ✓ Full disk copy, meaning only within already mounted .d81 disk
  image files or with real floppy diskettes
* ✓ proof of concept abstraction layer real/virtual floppy image
* ✓ proof of concept reading floppy (sub-) directories
* ✓ proof of concept reading files, sectors, tracks
* ✓ proof of concept writing files, sectors, tracks
* refactoring for code runtime optimisation
* ✓ test data copy by exceeding the maximum number of allowed
  blocks
* ✓ unmounting to gain full access to the underlying real floppy drive
  is not yet implemented
* test unmounted drives, empty disks and other error handling
* handle errors when copying files from mounted .d81 in the
  storage card subdirectory, this currently writes illegal track
  numbers as blockchains
* remove `dirent` sectors if empty after file deletions, retain
  track chain
* involving the user to handle same name files/directories
* not all routines take care of changing header sectors if dived
  into sub-partitions, most of them are secured by an error
  message though
* Completing the routines to create subdirectories, strategy for
  consecutive tracks to first present the maximum size and to
  finally create
* Currently the subpartition startegy always heads for the biggest
  available chunk of consecutive empty tracks, even if a very low
  number is needed
* Speed up with now into a SEQ file outsourced strings
* Maybe change reading disk sectors completely to a tracked based
  cached reading like is done in Megasputm:
  https://github.com/ki-bo/megasputm/blob/main/src/diskio.c#L1555
* If track chains are created by other tools like Dirmaster or
  C1541 they may contain illegal track numbers, there should be
  dedicated error messages for it

### string, screen handling

* `s[]` and `OPTION option` are maybe data to put to different
  places, `s[]` could be the same pointer as `p2sbuf`<br />
  also all little string places like `disknames[]` and fixed
  strings everywhere can be optimised<br />
  `strcopy()` doesn't consider strings filled with $0a as used
  in filenames and disk names<br />
  There is an input string in both sides of the MIDNIGHT data
  structure which can be used
* Handling of `$a0` as the space character replacement is done
  at screen output in `conioextensions.c` which isn't ideal.
* Maybe unify `strcopy` alike functions to handle all variants
  and fixed length strings as well
* all variants of printing to the screen need to be replaced by
  only one to not have redundant code
* all texts at startup can now go to the help pages

### graphics

* ✓ Text based GUI, Midnight/Norton Commander oriented
* ✓ show a status feeter with number of blocks available
* better visualise disk and mounting errors
* message boxes for errors and warnings in different colours/sounds?
* Use different (grid?) colour when SD card content is shown
* Maybe replace some (most?) of the dialog boxes with a status
  bar
* On multiple selected entries present the user a nice sum of
  their total size
* How about those separator lines and graphics using DEL file
  type entries?

## Bugs

* ✓ ~~Copying files into subdirs currently allocates BAM outside~~
  ~~the subfolder tracks.~~
* ✓ ~~The help file display routine is currently limited to one~~
  ~~block of data instead of four for a full screen.~~
* ✓ ~~Additional `dirent` blocks are placed outside track 40~~
  ~~and this is not what Commodore did.~~
* ✓ ~~Additional file blocks are also placed within track 40.~~
* Updir within disk root folder unecessarily re-reads the headers
* ✓ ~~After file delete BAM seems to be written in the according
  function as well as in nav.c~~ <br />
  ~~better check with DEBUG on~~
* ~~BAM and `dirent` blocks are read/written way too often. With~~
  ~~the now cache for two disks (left and right) in place this~~
  ~~can be optimised.~~<br />
  A BAM flag could be used to only read it back in case disk
  operation need access to it/alter it.<br />
  Also BAM and dirent should be handled in one go as the double
  logical sectors for both share same physical ones on a disk.
* ✓ ~~Storage card file deletion (also used for directories) takes~~
  ~~place more than once, should be wrapped in a function.~~
* ✓ ~~The disk controller always reads/writes two logical sectors~~
  ~~at a time because of course it acts on physical 80 sectored~~
  ~~dual sided media. The now abstraction make in no way optimal~~
  ~~use of that.~~<br />
  ✓ ~~Either reading one sector could keep the other in a cache or~~
  ~~`UpdateSectors()` could be optimised to read them all at once~~
  ~~in a proper numeric order.~~
* ✓ ~~`dirent` is currently not fully updated, additional sectors~~
  ~~are currently not added automatically.~~
* ✓ ~~`dirent` currently uses a full 255 bytes page of data which of~~
  ~~course is completely unnecessary.~~
* ✓ ~~`dirent` currently is read beginning with the first block of~~
  ~~file entries not supporting the disk name block at track 40~~
  ~~sector 0.~~
* ✓ ~~The yet state of development only uses the left file list so~~
  ~~*copy* actually only duplicates files on the same disk~~
* ✓ ~~BAM is only supported for one sector, tracks 41 to 80.~~
  ~~therefore not yet covered.~~
* ✓ ~~BAM is not yet in attic RAM, therefore multiple discs not~~
  ~~cached.~~
* ✓ ~~Improve handling of DEL type files.~~
* ✓ ~~reading/writing .d81 always takes two logical sectors at once,~~
  ~~writing of a single one should first read its accompaigning one.~~
* ✓ ~~reading the last sector 39 results in side 1 and an invalid~~
  ~~next track.~~
* Modifier key handling could be improved/optimised to treat keys
  different that don't require modification at all.
* Flickering in Xemu when e.g. cursor up is performed multiple times
  because of how modifier keys are currently handled.
* ✓ ~~If a file is only read the drive's LED doesn't switch back off.~~
  ~~It seems this is done by _miniinit() which needs to be checked~~
  ~~anyway.~~
* ✓ ~~Multiple selected listed items are not properly named in~~
  ~~confirmation dialog boxes.~~
* ✓ ~~At some places the highlighted list item is used for the chosen~~
  ~~action instead of the selected items.~~
* If a disk has faulty sector chains (e.g. to sector 0) even [Ctrl][r]
  does not recover from that.

# C environment

## Additions to `mega65-libc`

* are in file `llvm/conioextensions.h` and are quirky because of most
  in `conio.c` being `static`
* `conio.c` was copied to the `llvm` folder and massively edited to
  get rid of not needed stuff. This freed 3+ blocks of code.
* the full removal of `KickC` based include files from folder
  `llvm/include`

## Additions to llvm-mos

* The following lines autodeclare `DIRENTPAGELOW` because such
  symbols seem not to be usable with inline assembly otherwise.
  Its values would be indetermined.

```c
#define readdir_direntasm BLOCKDIRENT
__asm__(".set readdir_dirent, " XSTR(readdir_direntasm) );
```

# Midnight Mega makefile
#
# To be used with the Calypsi compiler/linker.
# The files "versions....txt" are not built with this makefile.

# The following executables have to be set or be in the PATH environment
# variable:
# AS = as6502
# CC = cc6502
# LN = ln6502

# C1541     = c1541

prj = midnightmega
romlist = romlister

libcfilesdir = mega65-libc/src
libcfiles = $(libcfilesdir)/memory.c $(libcfilesdir)/hal.c
# before Calypsi: SET libcfiles=%libcfiles% include/memory_asm.s
#  %libcfilesdir%/llvm/memory_asm.s
cfilesmidnight = $(prj).c hyppo.c fileio.c filekernel.c conioextensions.c nav.c
cfilesmidnight += texts.c sid.c romlist.c conio.c
# SET cfiles=$(prj).c conioextensions.c
cfilesromlist = $(romlist).c hyppo.c fileio.c filekernel.c conioextensions.c
cfilesromlist += romlist.c conio.c

# Forget the git tag as it always is one commit behind:
v = v0.6.8-beta

calopts = -D asm=__asm -I calypsi.h -D VERSION=\"$(v)\"
calopts += -I mega65-libc/include
calopts += -O 2 --core 45gs02 --target MEGA65
calopts += -D FULLFEATURES
calopts += --list-file=$(@:%.o=%.lst)
depopts = -MMD -MP
asmopts = --target=mega65 --list-file=$(@:%.o=%.lst)
linkopts = --list-file=bin/$(prj).lst --output-format prg --core 45gs02
linkopts += --target=mega65 src/mega65-$(prj).scm
linkopts += --rtattr printf=nofloat

# cfilesmidnight    = $(wildcard src/*.c)
cfilesmid = $(cfilesmidnight:%.c=src/%.c)
cfilesrom = $(cfilesromlist:%.c=src/%.c)
asmfiles  = $(wildcard src/*.s)
objmidnight = $(asmfiles:src/%.s=obj/%.o) $(cfilesmid:src/%.c=obj/%.o)
objromlist = $(asmfiles:src/%.s=obj/%.o) $(cfilesrom:src/%.c=obj/%.o)
LIBOBJS   = $(libcfiles:$(libcfilesdir)/%.c=obj/%.o)
DEPS      = $(objmidnight:%.o=%.d)
DEPS     += $(objromlist:%.o=%.d)
DEPS     += $(libcfiles:$(libcfilesdir)/%.c=obj/%.d)

DEPOBJS   = $(wildcard obj/*.d)
DEPS      = $(DEPOBJS:%.o=%.d)

# "phony" are commands rather than files:
.PHONY: all clean

# all targets have to be here:
all: $(prj).d81 readme.md $(tmp)/$(prj)ver.txt

$(prj).d81: bin/$(prj).prg bin/$(romlist).prg src/$(prj)text.src
	c1541 -format disk$(prj),id d81 $(prj).d81
#	c1541 -attach $(prj).d81 -delete $(prj)
	c1541 -attach $(prj).d81 -write bin/$(prj).prg $(prj)
	petcat -text -c -w2 -o bin/$(prj)text.seq -- src/$(prj)text.src
	c1541 -attach $(prj).d81 -write bin/$(prj)text.seq $(prj)text,s
#	-rm bin/$(prj)text.seq bin/$(prj)text_binmake.seq
#	c1541 -attach $(prj).d81 -delete $(romlist)
	c1541 -attach $(prj).d81 -write bin/$(romlist).prg $(romlist)

bin/$(prj).prg: $(objmidnight) $(LIBOBJS) src/mega65-$(prj).scm | bin
	$(LN) $(linkopts) -o $@ $(filter-out %.scm,$^)

bin/$(romlist).prg: $(objromlist) $(LIBOBJS) src/mega65-$(prj).scm | bin
	$(LN) $(linkopts) -o $@ $(filter-out %.scm,$^)

-include $(DEPS)

obj/%.o: src/%.s | obj
	$(AS) $(asmopts) -o $@ $<

obj/%.o: src/%.c | obj
	$(CC) $(calopts) $(depopts) -c $< -o $@ -MFobj/$*.d

obj/%.o: $(libcfilesdir)/%.c | obj
	$(CC) $(calopts) $(depopts) -c $< -o $@ -MFobj/$*.d

# on Windows no "-p" switch to create parent folders can be used:
bin:
	-@mkdir bin

obj:
	-@mkdir obj

readme.md: docsrc/readmesrc.md
	pandoc -s $< --toc -t gfm -o $@

$(tmp)/$(prj)ver.txt: makefile
	echo $(v) > $(tmp)/$(prj)ver.txt

# "rm" is no Windows command:
clean:
	-rm obj/*.o
	-rm *.prg *.d *.lst $(prj).d81

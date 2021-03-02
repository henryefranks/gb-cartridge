ifdef ComSpec
	# Windows
	RM = del /F /Q
	RD = rmdir /S /Q
	path = $(subst /,\\,$1)
	htap = $(subst \\,/,$1)
else
	# GNU/Unix
	RM = rm -f
	RD = rm -rf
	path = $1
	htap = $1
endif

ASM    := rgbasm
LINKER := rgblink
FIX    := rgbfix

ROMPATH := $(call path,ROMs/$(ROM)/)
SRCPATH := $(call path,$(ROMPATH)src/)
INCPATH := $(call path,$(ROMPATH)include/)
BLDPATH := $(call path,$(ROMPATH)build/)
OBJPATH := $(call path,$(BLDPATH)obj/)
GB      := $(call path,$(BLDPATH)$(ROM).gb)

SRC := $(wildcard $(call htap,$(SRCPATH))*.asm)

OBJ := $(addprefix $(OBJPATH), $(SRC:$(call htap,$(SRCPATH))%.asm=%.o))


.PHONY: all clean

all: fix

emu: fix
	bgb $(GB)

fix: build
	$(FIX) -p0 -v $(GB)

# TODO: currently I can't find a way to get directory
#       creation to play nice on windows
#       for now just create it manually if it doesn't exist

build: $(OBJ)
	$(LINKER) $(OBJ) -o $(GB)

$(OBJPATH)%.o: $(SRCPATH)%.asm
	$(ASM) -i $(INCPATH) -o $@ $<

clean:
	$(RM) $(OBJPATH)
	$(RM) $(BLDPATH)

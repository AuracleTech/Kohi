DIR := $(subst /,\,${CURDIR})
BUILD_DIR := bin
OBJ_DIR := obj

ASSEMBLY := testbed
EXTENSION := .exe
COMPILER_FLAGS := -g -Wno-missing-braces -fdeclspec #-fPIC
INCLUDE_FLAGS := -Iengine\src -Itestbed\src 
LINKER_FLAGS := -g -lengine.lib -L$(OBJ_DIR)\engine -L$(BUILD_DIR) #-Wl,-rpath,.
DEFINES := -D_DEBUG -DKIMPORT

# Make does not offer a recursive wildcard function, so here's one:
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

SRC_FILES := $(call rwildcard,$(ASSEMBLY)/,*.c) # Get all .c files
DIRECTORIES := \$(ASSEMBLY)\src $(subst $(DIR),,$(shell dir $(ASSEMBLY)\src /S /AD /B | findstr /i src)) # Get all directories under src.
OBJ_FILES := $(SRC_FILES:%=$(OBJ_DIR)/%.o) # Get all compiled .c.o objects for tesbed

all: scaffold compile link

.PHONY: scaffold
scaffold: # create build directory
	@echo Makefile.testbed.windows.mak scaffold starting
	-@setlocal enableextensions enabledelayedexpansion && mkdir $(addprefix $(OBJ_DIR), $(DIRECTORIES)) 2>NUL || cd .
	@echo Makefile.testbed.windows.mak scaffold completed

.PHONY: link
link: scaffold $(OBJ_FILES) # link
	@echo Makefile.testbed.windows.mak link starting
	@echo linking $(ASSEMBLY)...
	@clang $(OBJ_FILES) -o $(BUILD_DIR)/$(ASSEMBLY)$(EXTENSION) $(LINKER_FLAGS)
	@echo Makefile.testbed.windows.mak link completed

.PHONY: compile
compile: #compile .c files
	@echo Makefile.testbed.windows.mak compile starting

.PHONY: clean
clean: # clean build directory
	@echo Makefile.testbed.windows.mak clean starting
	if exist $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION) del $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION)
	rmdir /s /q $(OBJ_DIR)\$(ASSEMBLY)
	@echo Makefile.testbed.windows.mak clean completed

$(OBJ_DIR)/%.c.o: %.c # compile .c to .c.o object
	@echo   $<...
	@clang $< $(COMPILER_FLAGS) -c -o $@ $(DEFINES) $(INCLUDE_FLAGS)
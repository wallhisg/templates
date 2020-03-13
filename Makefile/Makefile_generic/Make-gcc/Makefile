ROOT_BASE	?= $(abspath $(dir $(abspath $(dir $$PWD))))
PRJ_BASE    ?= $(abspath $(dir $$PWD))
PRJ_PATH	?= $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

PRJ_SRC_C	:=
PRJ_OBJ_C	:=
PRJ_DEP_C	:=
PRJ_TMPS	:=
PRJ_LIBS	:=
PROGRAMS	:=

MDL_PATH	:=
MDL_INC		:=

BUILD 		= build
BUILD_BASE	= $(PRJ_BASE)/$(BUILD)
BUILD_PATH	= $(PRJ_BASE)/$(BUILD)/
BUILD_DIR	= $(subst $(PRJ_PATH),$(BUILD_PATH), $(MDL_PATH))


include $(PRJ_BASE)/Makefile.inc
include $(PRJ_BASE)/Makefile.env
include $(PRJ_BASE)/Makefile.bas

.PHONY: all build clean checkdirs test 

all: checkdirs build

build: checkdirs $(PRJ_OBJ_C) $(PRJ_DEP_C)

$(BUILD_BASE)/%.o: %.c
	$(CC) $(CFLAGS) $(MLD_INC) -c $< -o $@

checkdirs: $(BUILD_DIR)
$(BUILD_DIR):
	$(Q) mkdir -p $@

clean:
	rm -rf $(BUILD_BASE)

test:
	clear
	@echo	01. $(BUILD_BASE)
	@echo	02. $(PRJ_BASE)
	@echo	03. $(PRJ_PATH)

export ROOT_BASE	?= $(abspath $(dir $(abspath $(dir $$PWD))))
export PRJ_BASE    ?= $(abspath $(dir $$PWD))
export PRJ_PATH	?= $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

export PRJ_SRC_C	:=
export PRJ_OBJ_C	:=
export PRJ_DEP_C	:=

export PRJ_SRC_CPP	:=
export PRJ_OBJ_CPP	:=
export PRJ_DEP_CPP	:=

PRJ_TMPS	:=
PRJ_LIBS	:=
export TARGET		:=
export PROGRAMS	:=

export MDL_PATH	:=
export MDL_INC		:=

export BUILD 		= build
export BUILD_BASE	= $(PRJ_BASE)/$(BUILD)
export BUILD_PATH	= $(PRJ_BASE)/$(BUILD)/
export BUILD_DIR	= $(subst $(PRJ_PATH),$(BUILD_PATH), $(MDL_PATH))


include $(PRJ_BASE)/Makefile.cfg
include $(PRJ_BASE)/Makefile.inc
include $(PRJ_BASE)/Makefile.env
include $(PRJ_BASE)/Makefile.bas

.PHONY: all build clean checkdirs test 

test:
	@echo	01. $(PRJ_TEST_OBJ_C)
	@echo	02. $(PRJ_TEST_OBJ_CPP)
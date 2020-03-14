ROOT_BASE	?= $(abspath $(dir $(abspath $(dir $$PWD))))
PRJ_BASE    ?= $(abspath $(dir $$PWD))
PRJ_PATH	?= $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

PRJ_SRC_C	:=
PRJ_OBJ_C	:=
PRJ_DEP_C	:=

PRJ_SRC_CPP	:=
PRJ_OBJ_CPP	:=
PRJ_DEP_CPP	:=

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

ifeq ($(trip $(PRJ_OBJ_CPP)),)
	TEMP = NULL
endif


.PHONY: all build clean checkdirs test 

test:
	@echo	01. $(CCX)
	@echo	01. $(CCX_FLAG)
	@echo	01. $(PRJ_SRC_CPP)



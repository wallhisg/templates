export ROOT_BASE	?= $(abspath $(dir $(abspath $(dir $$PWD))))
export PRJ_BASE		?= $(abspath $(dir $$PWD))
export PRJ_PATH		?= $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

export PRJ_SRC_C	:=
export PRJ_OBJ_C	:=
export PRJ_DEP_C	:=

export PRJ_SRC_CPP	:=
export PRJ_OBJ_CPP	:=
export PRJ_DEP_CPP	:=

export PRJ_LIB		:=
export EXTRA_LIB	:=

export MDL_PATH		:=
export EXTRA_MDL_PATH	:= 

export TEST_PATH	:=

export MDL_INC		:=
export EXTRA_MLD_INC	:=

export TARGET		:=
export PROGRAMS		:=

export BUILD		= build
export BUILD_BASE	= $(PRJ_BASE)/$(BUILD)
export BUILD_PATH	= $(PRJ_BASE)/$(BUILD)/
export BUILD_DIR	= $(subst $(PRJ_PATH),$(BUILD_PATH), $(MDL_PATH))
export BUILD_TEST_DIR	=

include $(PRJ_BASE)/Makefile.cfg
include $(PRJ_BASE)/Makefile.inc
include $(PRJ_BASE)/Makefile.env
include $(PRJ_BASE)/Makefile.bas

.PHONY: all build clean checkdirs test

#======================================================================
# Enviroment
#======================================================================
MKDIR	:= mkdir -p
RMDIR	:= rm -rf	
RM	:= rm -f
MV	:= mf -f
#======================================================================

test:
	@echo	01. $(TEST_PATH)

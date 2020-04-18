export ROOT_BASE		?=	$(abspath $(dir $(abspath $(dir $$PWD))))
export EDK_BASE			?=	$(abspath $(dir $$PWD))
export EDK_PATH			?=	$(dir $(realpath $(firstword $(MAKEFILE_LIST))))

export EDK_SRC_C		:=
export EDK_OBJ_C		:=
export EDK_DEP_C		:=

export EDK_SRC_CPP		:=
export EDK_OBJ_CPP		:=
export EDK_DEP_CPP		:=

export EDK_OBJ			:=
export EDK_DEP			:=

export EDK_LIB			:=
export EXTRA_LIB		:=

export MDL_PATH			:=
export EXTRA_MDL_PATH	:=

export TEST_PATH		:=

export MDL_INC			:=
export EXTRA_MLD_INC	:=

export TARGET			:=
export PROGRAMS			:=

export BUILD			=	build
export BUILD_BASE		=	$(EDK_BASE)/$(BUILD)
export BUILD_PATH		=	$(EDK_BASE)/$(BUILD)/
export BUILD_DIR		=	$(subst $(EDK_PATH),$(BUILD_PATH), $(MDL_PATH))
export BUILD_TEST_DIR	=

# define build flag BFLAG
export	BF_RESERVED		:=	0
export	BF_NOT_USE		:=	1
export	BF_NOT_INC		:=	2
export	BF_NOT_BUILD	:=	3
export	BF_BUILD		:=	4
export	BF_TEST			:=	5

include $(EDK_BASE)/Makefile.cfg
include $(EDK_BASE)/Makefile.inc
include $(EDK_BASE)/Makefile.bas
include $(EDK_BASE)/Makefile.env

.PHONY: all build clean checkdirs test

#======================================================================
# Enviroment
#======================================================================
MKDIR	:= @mkdir -p
RMDIR	:= @rm -rf	
RM	:= rm -f
MV	:= mf -f
#======================================================================

test:
	@echo	01. $(EDK_BASE)
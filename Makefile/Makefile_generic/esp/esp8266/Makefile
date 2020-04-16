export ESP_BASE		?= $(abspath $(dir $(abspath $(dir $$PWD))))
export ROOT_BASE	?= $(abspath $(dir $(abspath $(ESP_BASE))))
export PRJ_BASE		?= $(CURDIR)
export PRJ_PATH		?=	$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
export PROJECT_SRCS	:=
export PRJ_OBJ		:=
export PROJECT_DEPS	:=

export SDK_LIB		:=
export PRJ_LIB_AR	:=
export PRJ_OUT		:=

# EDK_BASE	:= $(ROOT_BASE)/edk
export EDK_OBJS		:=
export EDK_DEPS		:=
export EDK_MDLS		:=

export BUILD		:=	build
export BUILD_BASE	:=	$(PRJ_BASE)/$(BUILD)
export BUILD_PATH	:=	$(PRJ_BASE)/$(BUILD)/
export BUILD_DIR	:=	$(subst $(PRJ_PATH),$(BUILD_PATH), $(MDL_PATH))

# define build flag BFLAG
export BF_RESERVED	:=	0
export BF_NOT_USE	:=	1
export BF_NOT_INC	:=	2
export BF_NOT_BUILD	:=	3
export BF_BUILD		:=	4
export BF_FIRM		:=	5

# include $(EDK_BASE)/Makefile.edk

.PHONY: all checkdirs flash clean
test:
	@echo	$(PRJ_BUILD_DIR)

include $(PRJ_BASE)/Makefile.cfg
include $(PRJ_BASE)/Makefile.inc
include $(PRJ_BASE)/Makefile.env
include $(PRJ_BASE)/Makefile.bas
#----------------------------------------------------------------------------------
# Enviroment
#----------------------------------------------------------------------------------
MKDIR	:= mkdir -p
RMDIR	:= rm -rf	
RM		:= rm -f
MV		:= mf -f
#----------------------------------------------------------------------------------




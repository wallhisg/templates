export ESP_BASE		?= $(abspath $(dir $(abspath $(dir $$PWD))))
export ROOT_BASE	?= $(abspath $(dir $(abspath $(ESP_BASE))))
export PRJ_BASE		?= $(CURDIR)
export PRJ_PATH		?= $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
export PROJECT_SRCS	:=
export PRJ_OBJ		:=
export PROJECT_DEPS	:=

export SDK_LIB		:=
export PRJ_LIB_AR	:=
export PRJ_OUT		:=


export EDK_OBJS		:=
export EDK_DEPS		:=
export EDK_MDLS		:=

export BUILD			:=	build
export ESP_BUILD_BASE	:=	$(PRJ_BASE)/$(BUILD)
export ESP_BUILD_PATH	:=	$(PRJ_BASE)/$(BUILD)/
export ESP_BUILD_DIR	:=	$(subst $(PRJ_PATH),$(ESP_BUILD_PATH), $(MDL_PATH))

# define build flag BFLAG
export BF_RESERVED	:=	0
export BF_NOT_USE	:=	1
export BF_NOT_INC	:=	2
export BF_NOT_BUILD	:=	3
export BF_BUILD		:=	4
export BF_FIRM		:=	5

include $(PRJ_BASE)/Makefile.cfg
include $(PRJ_BASE)/Makefile.edk
include $(PRJ_BASE)/Makefile.inc
include $(PRJ_BASE)/Makefile.env
include $(PRJ_BASE)/Makefile.bas

.PHONY: all checkdirs flash clean

test: checkdirs $(EDK_OBJ)
	@echo	01. $(EDK_BASE)
	@echo	02. $(EDK_BUILD_BASE)
	@echo	03. $(EDK_OBJ)
	@echo	04. $(EDK_DIR)
	@echo	05. $(EDK_BUILD_PATH)
	@echo	06. $(EDK_BUILD_DIR)
	@echo	07. $(EDK_DEP)

#----------------------------------------------------------------------------------
# Enviroment
#----------------------------------------------------------------------------------
MKDIR	:= @mkdir -p
RMDIR	:= @rm -rf	
RM		:= @rm -f
MV		:= @mf -f
#----------------------------------------------------------------------------------




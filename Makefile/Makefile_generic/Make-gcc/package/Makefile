# build flag
# define BFLAG
# BF_RESERVED	:=	0	BF_BUILD	:=	1
# BF_NOT_BUILD	:=	2	BF_NOT_USE	:=	3
BFLAG	:= $(BF_NOT_USE)
#	BF_RESERVED		reserved
#	BF_BUILD		build or re-build and add to PRJ_OBJ_C 	/ 	auto
#	BF_NOT_BUILD	built not re-build and add to PRJ_OBJ_C /	manual
#	BF_NOT_USE		not using								/	manual

#----------------------------------------------------------------------------------
PRJ_LOCAL_BASE		:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PRJ_LOCAL_MDL		:= $(sort $(dir $(wildcard $(PRJ_LOCAL_BASE)*/)))
PRJ_LOCAL_SUB_MDL	:= $(filter-out $(PRJ_LOCAL_BASE), $(PRJ_LOCAL_MDL))

LOCAL_DIR_NAME		:=	$(shell basename $(PRJ_LOCAL_BASE))
LOCAL_BUILD_DIR		:=	$(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_LOCAL_BASE))

#----------------------------------------------------------------------------------
include $(PRJ_BASE)/Makefile.bas

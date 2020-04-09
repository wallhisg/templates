# build flag
# define BFLAG
# BF_RESERVED	:=	0	BF_BUILD	:=	1
# BF_NOT_BUILD	:=	2	BF_NOT_USE	:=	3
BFLAG	:= $(BF_NOT_INC)
#	BF_RESERVED		reserved
#	BF_BUILD		build or re-build and add to PRJ_OBJ_C 	/ 	auto
#	BF_NOT_BUILD	built not re-build and add to PRJ_OBJ_C /	manual
#	BF_NOT_USE		not using								/	manual

#----------------------------------------------------------------------------------
PRJ_LOCAL_BASE		:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PRJ_LOCAL_MDL		:= $(sort $(dir $(wildcard $(PRJ_LOCAL_BASE)*/)))
PRJ_LOCAL_SUB_MDL	:= $(filter-out $(PRJ_LOCAL_BASE), $(PRJ_LOCAL_MDL))
#----------------------------------------------------------------------------------
include $(PRJ_BASE)/Makefile.bas
#----------------------------------------------------------------------------------
ifneq ($(BF_NOT_USE), $(BFLAG))
SUBMAKEFILE	= $(foreach sdir, $(PRJ_LOCAL_SUB_MDL), $(addprefix $(sdir), Makefile))
include $(SUBMAKEFILE)
endif
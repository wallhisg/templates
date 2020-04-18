# Build Flag
# BF_RESERVED	:=	0	BF_NOT_USE		:=	1
# BF_NOT_INC	:=	2	BF_NOT_BUILD	:=	3
# BF_BUILD		:=	4	BF_TEST			:=	5
BFLAG	:= $(BF_NOT_INC)
#----------------------------------------------------------------------------------
EDK_LOCAL_BASE		:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
EDK_LOCAL_MDL		:= $(sort $(dir $(wildcard $(EDK_LOCAL_BASE)*/)))
EDK_LOCAL_SUB_MDL	:= $(filter-out $(EDK_LOCAL_BASE), $(EDK_LOCAL_MDL))
#----------------------------------------------------------------------------------
include $(EDK_BASE)/Makefile.bas
#----------------------------------------------------------------------------------
ifneq ($(BF_NOT_USE), $(BFLAG))
SUBMAKEFILE	= $(foreach sdir, $(EDK_LOCAL_SUB_MDL), $(addprefix $(sdir), Makefile))
include $(SUBMAKEFILE)
endif
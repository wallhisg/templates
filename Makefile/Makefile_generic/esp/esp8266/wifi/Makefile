# Build Flag
# BF_RESERVED	:=	0	BF_NOT_USE		:=	1
# BF_NOT_INC	:=	2	BF_NOT_BUILD	:=	3
# BF_BUILD		:=	4	BF_FIRM			:=	5
BFLAG	:= $(BF_BUILD)
#----------------------------------------------------------------------------------
PRJ_LOCAL_BASE		:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PRJ_LOCAL_MDL		:= $(sort $(dir $(wildcard $(PRJ_LOCAL_BASE)*/)))
PRJ_LOCAL_SUB_MDL	:= $(filter-out $(PRJ_LOCAL_BASE), $(PRJ_LOCAL_MDL))
LOCAL_BUILD_DIR		:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_LOCAL_BASE))
#----------------------------------------------------------------------------------
# c source
PRJ_LOCAL_SRC_C		:= $(wildcard $(PRJ_LOCAL_BASE)*.c)
PRJ_LOCAL_DEP_C		:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(patsubst %.c, %.deps, $(PRJ_LOCAL_SRC_C)))
PRJ_LOCAL_OBJ_C		:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(patsubst %.c, %.o, $(PRJ_LOCAL_SRC_C)))
#----------------------------------------------------------------------------------
# cpp source
PRJ_LOCAL_SRC_CPP	:= $(wildcard $(PRJ_LOCAL_BASE)*.cpp)
PRJ_LOCAL_DEP_CPP	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(patsubst %.cpp, %.deps, $(PRJ_LOCAL_SRC_CPP)))
PRJ_LOCAL_OBJ_CPP	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(patsubst %.cpp, %.o, $(PRJ_LOCAL_SRC_CPP)))
#----------------------------------------------------------------------------------
# header
PRJ_LOCAL_INC		:= $(wildcard $(PRJ_LOCAL_BASE)*.h)
#----------------------------------------------------------------------------------
# dependencies
$(PRJ_LOCAL_DEP_C): $(PRJ_LOCAL_SRC_C) $(PRJ_LOCAL_INC)
	@$(CC) -MM $< > $@
	@$(CC) $< -MM -MT $@ >> $@
	
$(PRJ_LOCAL_DEP_CPP): $(PRJ_LOCAL_SRC_CPP) $(PRJ_LOCAL_INC)
	@$(CXX) -MM $< > $@
	@$(CXX) $< -MM -MT $@ >> $@
	
$(PRJ_LOCAL_OBJ_C): $(PRJ_LOCAL_SRC_C) $(PRJ_LOCAL_DEP_C)
$(PRJ_LOCAL_OBJ_CPP): $(PRJ_LOCAL_SRC_CPP) $(PRJ_LOCAL_DEP_CPP)
#----------------------------------------------------------------------------------
include $(PRJ_BASE)/Makefile.bas
#----------------------------------------------------------------------------------
ifneq ($(BF_NOT_USE), $(BFLAG))
SUBMAKEFILE	= $(foreach sdir, $(PRJ_LOCAL_SUB_MDL), $(addprefix $(sdir), Makefile))
include $(SUBMAKEFILE)
endif
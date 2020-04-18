# Build Flag
# BF_RESERVED	:=	0	BF_NOT_USE		:=	1
# BF_NOT_INC	:=	2	BF_NOT_BUILD	:=	3
# BF_BUILD		:=	4	BF_TEST			:=	5
BFLAG	:= $(BF_TEST)
#----------------------------------------------------------------------------------
EDK_LOCAL_BASE		:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
EDK_LOCAL_MDL		:= $(sort $(dir $(wildcard $(EDK_LOCAL_BASE)*/)))
EDK_LOCAL_SUB_MDL	:= $(filter-out $(EDK_LOCAL_BASE), $(EDK_LOCAL_MDL))
LOCAL_BUILD_DIR		:=	$(subst $(EDK_PATH), $(BUILD_PATH), $(EDK_LOCAL_BASE))
#----------------------------------------------------------------------------------
# header
EDK_LOCAL_HEADER		:= $(wildcard $(EDK_LOCAL_BASE)*.h)
#----------------------------------------------------------------------------------
# source
EDK_LOCAL_SRC_C		:= $(wildcard $(EDK_LOCAL_BASE)*.c)
EDK_LOCAL_SRC_CPP	:= $(wildcard $(EDK_LOCAL_BASE)*.cpp)
#----------------------------------------------------------------------------------
# dep
EDK_LOCAL_DEP_C		:= $(subst $(EDK_PATH), $(BUILD_PATH), $(patsubst %.c, %.deps, $(EDK_LOCAL_SRC_C)))
EDK_LOCAL_DEP_CPP	:= $(subst $(EDK_PATH), $(BUILD_PATH), $(patsubst %.cpp, %.deps, $(EDK_LOCAL_SRC_CPP)))

EDK_LOCAL_DEP 		+=	$(EDK_LOCAL_DEP_C)
EDK_LOCAL_DEP 		+=	$(EDK_LOCAL_DEP_CPP)
#----------------------------------------------------------------------------------
# object
EDK_TEST_OBJ_C		:= $(subst $(EDK_PATH), $(BUILD_PATH), $(patsubst %.c, %.o, $(EDK_LOCAL_SRC_C)))
EDK_TEST_OBJ_CPP		:= $(subst $(EDK_PATH), $(BUILD_PATH), $(patsubst %.cpp, %.o, $(EDK_LOCAL_SRC_CPP)))

EDK_TEST_OBJ		+=	$(EDK_TEST_OBJ_C)
EDK_TEST_OBJ		+=	$(EDK_TEST_OBJ_CPP)
#----------------------------------------------------------------------------------
# dependencies
$(EDK_LOCAL_DEP_C): $(EDK_LOCAL_SRC_C) $(EDK_LOCAL_INC)
	@$(CCX) -MM $< > $@
	@$(CCX) $< -MM -MT $@ >> $@
	
$(EDK_LOCAL_DEP_CPP): $(EDK_LOCAL_SRC_CPP) $(EDK_LOCAL_INC)
	@$(CCX) -MM $< > $@
	@$(CCX) $< -MM -MT $@ >> $@

$(EDK_TEST_OBJ_C): $(EDK_LOCAL_SRC_C) $(EDK_LOCAL_DEP_C)
$(EDK_TEST_OBJ_CPP): $(EDK_LOCAL_SRC_CPP) $(EDK_LOCAL_DEP_CPP)
#----------------------------------------------------------------------------------
# target
TARGET		:= $(shell basename $(EDK_LOCAL_BASE))
PROGRAM		:= $(addprefix $(EDK_LOCAL_BASE), $(TARGET))
PROGRAM		:= $(subst $(EDK_PATH), $(BUILD_PATH), $(PROGRAM))

$(PROGRAM): $(EDK_TEST_OBJ)
	$(CCX) $(EDK_OBJ) $^ -o $@ 
#----------------------------------------------------------------------------------
include $(EDK_BASE)/Makefile.bas

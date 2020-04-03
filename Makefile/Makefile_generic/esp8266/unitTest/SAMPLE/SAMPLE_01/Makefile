# module
MODULES		:= 0
# enable submodules
SUBMODULES 	:= 1
ifeq (1, $(SUBMODULES))

#----------------------------------------------------------------------------------
PRJ_TARGET_BASE		:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PRJ_TARGET_MDL		:= $(sort $(dir $(wildcard $(PRJ_TARGET_BASE)*/)))
LOCAL_MAKEFILE		:= $(filter-out $(PRJ_TARGET_BASE), $(PRJ_TARGET_MDL))

#----------------------------------------------------------------------------------
# c source
PRJ_TARGET_SRC_C		:= $(wildcard $(PRJ_TARGET_BASE)*.c)

PRJ_TARGET_OBJ_C	:= $(patsubst %.c, %.o, $(PRJ_TARGET_SRC_C))
PRJ_TARGET_OBJ_C	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_TARGET_OBJ_C))

PRJ_TARGET_DEP_C		:= $(patsubst %.c, %.deps, $(PRJ_TARGET_SRC_C))	
PRJ_TARGET_DEP_C		:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_TARGET_DEP_C))
#----------------------------------------------------------------------------------
# cpp source
PRJ_TARGET_SRC_CPP	:= $(wildcard $(PRJ_TARGET_BASE)*.cpp)

PRJ_TARGET_OBJ_CPP	:= $(patsubst %.cpp, %.o, $(PRJ_TARGET_SRC_CPP))
PRJ_TARGET_OBJ_CPP	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_TARGET_OBJ_CPP))

PRJ_TARGET_DEP_CPP	:= $(patsubst %.cpp, %.deps, $(PRJ_TARGET_SRC_CPP))	
PRJ_TARGET_DEP_CPP	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_TARGET_DEP_CPP))
#----------------------------------------------------------------------------------
# header
PRJ_TARGET_INC	:= $(wildcard $(PRJ_TARGET_BASE)*.h)
# dependencies
$(PRJ_TARGET_DEP_C): $(PRJ_TARGET_SRC_C) $(PRJ_TARGET_INC)
	@$(CC) -MM $< > $@
	@$(CC) $< -MM -MT $@ >> $@

$(PRJ_TARGET_DEP_CPP): $(PRJ_TARGET_SRC_CPP) $(PRJ_TARGET_INC)
	@$(CXX) -MM $< > $@
	@$(CXX) $< -MM -MT $@ >> $@
#----------------------------------------------------------------------------------
# target
TARGET		:= $(shell basename $(PRJ_TARGET_BASE))
PROGRAM		:= $(addprefix $(PRJ_TARGET_BASE), $(TARGET))
PROGRAM		:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PROGRAM))
PROGRAMS	+= $(PROGRAM)

PROGRAM_A_FILE	:=	$(addsuffix .a, $(PROGRAM))

$(PROGRAM): $(PRJ_TARGET_DEP_C) $(PRJ_TARGET_DEP_CPP) $(PRJ_TARGET_OBJ_C) $(PRJ_TARGET_OBJ_CPP)
	$(CCX) $(PRJ_TARGET_OBJ_C) $(PRJ_TARGET_OBJ_CPP) $(PRJ_OBJ) -o $@ 


#----------------------------------------------------------------------------------
include $(PRJ_BASE)/Makefile.bas

endif

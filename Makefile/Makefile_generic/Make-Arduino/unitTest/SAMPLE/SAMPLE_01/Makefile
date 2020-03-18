# enable submodules
SUBMODULES 	= 1
ifeq (1, $(SUBMODULES))

#----------------------------------------------------------------------------------
PRJ_TEST_BASE		:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PRJ_TEST_MDL		:= $(sort $(dir $(wildcard $(PRJ_TEST_BASE)*/)))
LOCAL_MAKEFILE		:= $(filter-out $(PRJ_TEST_BASE), $(PRJ_TEST_MDL))

#----------------------------------------------------------------------------------
# c source
PRJ_TEST_SRC_C		:= $(wildcard $(PRJ_TEST_BASE)*.c)

TEST_OBJ_SAM_01_C	:= $(patsubst %.c, %.o, $(PRJ_TEST_SRC_C))
TEST_OBJ_SAM_01_C	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(TEST_OBJ_SAM_01_C))

PRJ_TEST_DEP_C		:= $(patsubst %.c, %.deps, $(PRJ_TEST_SRC_C))	
PRJ_TEST_DEP_C		:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_TEST_DEP_C))
#----------------------------------------------------------------------------------
# cpp source
PRJ_TEST_SRC_CPP	:= $(wildcard $(PRJ_TEST_BASE)*.cpp)

TEST_OBJ_SAM_01_CPP	:= $(patsubst %.cpp, %.o, $(PRJ_TEST_SRC_CPP))
TEST_OBJ_SAM_01_CPP	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(TEST_OBJ_SAM_01_CPP))

PRJ_TEST_DEP_CPP	:= $(patsubst %.cpp, %.deps, $(PRJ_TEST_SRC_CPP))	
PRJ_TEST_DEP_CPP	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_TEST_DEP_CPP))
#----------------------------------------------------------------------------------
# header
PRJ_TEST_INC	:= $(wildcard $(PRJ_TEST_BASE)*.h)


# dependencies
$(PRJ_TEST_DEP_C): $(PRJ_TEST_SRC_C) $(PRJ_TEST_INC)
	@$(CC) -MM $< > $@
	@$(CC) $< -MM -MT $@ >> $@

$(PRJ_TEST_DEP_CPP): $(PRJ_TEST_SRC_CPP) $(PRJ_TEST_INC)
	@$(CXX) -MM $< > $@
	@$(CXX) $< -MM -MT $@ >> $@

TARGET		:= $(shell basename $(PRJ_TEST_BASE))
PROGRAM		:= $(addprefix $(PRJ_TEST_BASE), $(TARGET))
PROGRAM		:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PROGRAM))
PROGRAMS	+= $(PROGRAM)

#----------------------------------------------------------------------------------
# create .a file
PRJ_LIB_AR		:= $(addsuffix .a, $(PROGRAM))
#----------------------------------------------------------------------------------
# create eagle file
PRJ_EAGLE_SRC		:=	eagle.app.v6.common.ld.h
PRJ_EAGLE_SRC_IN	:=	$(addprefix $(SDK_LD_BASE)/, $(PRJ_EAGLE_SRC))
PRJ_EAGLE_SRC_OUT	:=	$(basename $(addprefix local., $(PRJ_EAGLE_SRC)))
PRJ_EAGLE_SRC_OUT	:=	$(addprefix $(PRJ_TEST_BASE), $(PRJ_EAGLE_SRC_OUT))
PRJ_EAGLE_SRC_OUT	:=	$(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_EAGLE_SRC_OUT))

PRJ_LD_FLAG			:= -CC -E -P -DVTABLES_IN_FLASH
#----------------------------------------------------------------------------------
# create .map file
PRJ_MAP_FILE		:= $(addsuffix .map, $(PROGRAM))

PRJ_MAP_FLAG		:= -g -w -Os -nostdlib -Wl,--no-check-sections -u app_entry -u _printf_float -u _scanf_float -Wl,-static 

#----------------------------------------------------------------------------------
$(PROGRAM): $(PRJ_TEST_DEP_C) $(PRJ_TEST_DEP_CPP) $(TEST_OBJ_SAM_01_C) $(TEST_OBJ_SAM_01_CPP)
	$(CCX) $(TEST_OBJ_SAM_01_C) $(TEST_OBJ_SAM_01_CPP) $(PRJ_OBJ_C) $(PRJ_OBJ_CPP) -o $@ 



#----------------------------------------------------------------------------------
include $(PRJ_BASE)/Makefile.bas

endif

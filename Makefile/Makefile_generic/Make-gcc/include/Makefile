# enable submodules
SUBMODULES 	= 1

ifeq (1, $(SUBMODULES))

#----------------------------------------------------------------------------------
PRJ_LOCAL_BASE	:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PRJ_LOCAL_MDL	:= $(sort $(dir $(wildcard $(PRJ_LOCAL_BASE)*/)))
LOCAL_MAKEFILE	:= $(filter-out $(PRJ_LOCAL_BASE), $(PRJ_LOCAL_MDL))
#----------------------------------------------------------------------------------
# for c source
PRJ_LOCAL_SRC_C	:= $(wildcard $(PRJ_LOCAL_BASE)*.c)

PRJ_LOCAL_OBJ_C	:= $(patsubst %.c, %.o, $(PRJ_LOCAL_SRC_C))
PRJ_LOCAL_OBJ_C	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_LOCAL_OBJ_C))

PRJ_LOCAL_DEP_C	:= $(patsubst %.c, %.deps, $(PRJ_LOCAL_SRC_C))	
PRJ_LOCAL_DEP_C	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_LOCAL_DEP_C))

#----------------------------------------------------------------------------------
# for cpp source
PRJ_LOCAL_SRC_CPP	:= $(wildcard $(PRJ_LOCAL_BASE)*.c)

PRJ_LOCAL_OBJ_CPP	:= $(patsubst %.c, %.o, $(PRJ_LOCAL_SRC_CPP))
PRJ_LOCAL_OBJ_CPP	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_LOCAL_OBJ_CPP))

PRJ_LOCAL_DEP_CPP	:= $(patsubst %.c, %.deps, $(PRJ_LOCAL_SRC_CPP))	
PRJ_LOCAL_DEP_CPP	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_LOCAL_DEP_CPP))

#----------------------------------------------------------------------------------
# for header
PRJ_LOCAL_INC	:= $(wildcard $(PRJ_LOCAL_BASE)*.h)

#----------------------------------------------------------------------------------
# for dependencies
$(PRJ_LOCAL_DEP_C): $(PRJ_LOCAL_SRC_C) $(PRJ_LOCAL_INC)
	@$(CC) -MM $< > $@
	@$(CC) $< -MM -MT $@ >> $@
	
$(PRJ_LOCAL_OBJ_C): $(PRJ_LOCAL_SRC_C) $(PRJ_LOCAL_DEP_C)

#----------------------------------------------------------------------------------
include $(PRJ_BASE)/Makefile.bas

endif



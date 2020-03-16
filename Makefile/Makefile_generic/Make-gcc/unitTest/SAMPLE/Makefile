# enable submodules
SUBMODULES 	:= 1

ifeq (1, $(SUBMODULES))

PRJ_LOCAL_BASE	:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PRJ_LOCAL_MDL	:= $(sort $(dir $(wildcard $(PRJ_LOCAL_BASE)*/)))
LOCAL_MAKEFILE	:= $(filter-out $(PRJ_LOCAL_BASE), $(PRJ_LOCAL_MDL))

include $(PRJ_BASE)/Makefile.bas

endif

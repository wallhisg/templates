# enable submodules
SUBMODULES 	:= 1

ifeq (1, $(SUBMODULES))

EDK_LOCAL_BASE	:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
EDK_LOCAL_MDLS	:= $(sort $(dir $(wildcard $(EDK_LOCAL_BASE)*/)))
LOCAL_MAKEFILE	:= $(filter-out $(EDK_LOCAL_BASE), $(EDK_LOCAL_MDLS))

include ./Makefile.bas

endif

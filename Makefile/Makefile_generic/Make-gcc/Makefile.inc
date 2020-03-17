
PRJ_UNIT_TEST		?= $(PRJ_BASE)/unitTest
PRJ_INCLUDE		?= $(PRJ_BASE)/include
PRJ_CORE		?= $(PRJ_BASE)/core

__DIRECTORY_VARIABLES := 	\
	PRJ_UNIT_TEST		\
	PRJ_INCLUDE 		\
	PRJ_CORE


override PRJ_BASE		:= $(abspath $(PRJ_BASE))
override PRJ_UNIT_TEST		:= $(abspath $(PRJ_UNIT_TEST))
override PRJ_INCLUDE		:= $(abspath $(PRJ_INCLUDE))
override PRJ_CORE		:= $(abspath $(PRJ_CORE))

# Ensure that all directories are set and don't contain spaces.
ifneq (, $(filter-out 1, $(foreach v,$(__DIRECTORY_VARIABLES),$(words $($(v))))))
  $(info Aborting compilation for your safety.)
  $(info Related variables = $(__DIRECTORY_VARIABLES))
  $(error Make sure no path override is empty or contains spaces!)
endif

# Use absolute paths in recusive "make" even if overriden on command line.
MAKEOVERRIDES 	+= $(sort $(foreach v,$(__DIRECTORY_VARIABLES),$($(v))))

# include all make file
PRJ_INCLUDE_MAKEFILE += $(foreach sdir, $(MAKEOVERRIDES), $(addprefix $(sdir)/, Makefile))

include $(PRJ_INCLUDE_MAKEFILE)

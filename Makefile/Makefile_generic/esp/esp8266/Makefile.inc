# Globally set default goal to `all`
.DEFAULT_GOAL := all

PROJECT_APP			?= $(PRJ_BASE)/user
PROJECT_DEBUG		?= $(PRJ_BASE)/debug
PROJECT_INCLUDE		?= $(PRJ_BASE)/include
PROJECT_PERIPH		?= $(PRJ_BASE)/periph
PROJECT_DRIVER		?= $(PRJ_BASE)/driver
PROJECT_NET			?= $(PRJ_BASE)/net
PROJECT_HTTP		?= $(PRJ_BASE)/http
PROJECT_COMMON		?= $(PRJ_BASE)/common
PROJECT_STORE		?= $(PRJ_BASE)/store
PROJECT_WIFI		?= $(PRJ_BASE)/wifi

__PROJECT_DIRECTORY_VARIABLES := 	\
	PROJECT_APP			\
	PROJECT_WIFI		\
	PROJECT_PERIPH			
# 	PROJECT_NET			\
# 	PROJECT_HTTP		\
# 	PROJECT_DRIVER			\
# 	PROJECT_NET			\
# 	PROJECT_DRIVER			\
# 	PROJECT_COMMON			\
# 	PROJECT_STORE
# 	PROJECT_DEBUG			\
# 	PROJECT_INCLUDE			\

override PROJECT_APP		:= $(abspath $(PROJECT_APP))
override PROJECT_DEBUG		:= $(abspath $(PROJECT_DEBUG))
override PROJECT_INCLUDE	:= $(abspath $(PROJECT_INCLUDE))
override PROJECT_NET		:= $(abspath $(PROJECT_NET))
override PROJECT_DRIVER		:= $(abspath $(PROJECT_DRIVER))
override PROJECT_HTTP		:= $(abspath $(PROJECT_HTTP))
override PROJECT_COMMON		:= $(abspath $(PROJECT_COMMON))
override PROJECT_STORE		:= $(abspath $(PROJECT_STORE))
override PROJECT_WIFI		:= $(abspath $(PROJECT_WIFI))

# Ensure that all directories are set and don't contain spaces.
ifneq (, $(filter-out 1, $(foreach v,$(__PROJECT_DIRECTORY_VARIABLES),$(words $($(v))))))
  $(info Aborting compilation for your safety.)
  $(info Related variables = $(__PROJECT_DIRECTORY_VARIABLES))
  $(error Make sure no path override is empty or contains spaces!)
endif

# Use absolute paths in recusive "make" even if overriden on command line.
PROJECT_MAKEOVERRIDES 	+= $(sort $(foreach v,$(__PROJECT_DIRECTORY_VARIABLES),$($(v))))

# include all make file
PROJECT_INCLUDE_MAKEFILE += $(foreach sdir, $(PROJECT_MAKEOVERRIDES), $(addprefix $(sdir)/, Makefile))

include $(PROJECT_INCLUDE_MAKEFILE)

ifeq (1, $(SUBMODULES))

	MDL_PATH	+= $(PRJ_LOCAL_MDL)
	MDL_PATH	:= $(sort $(MDL_PATH))

	MLD_INC		+= $(addprefix -I,$(MDL_PATH))
	MLD_INC		:= $(sort $(MLD_INC))

	PRJ_SRC_C	+= $(PRJ_LOCAL_SRC_C)
	PRJ_SRC_C	:= $(sort $(PRJ_SRC_C))
	
	PRJ_OBJ_C	+= $(PRJ_LOCAL_OBJ_C)
	PRJ_OBJ_C	:= $(sort $(PRJ_OBJ_C))
	
	PRJ_DEP_C	+= $(PRJ_LOCAL_DEP_C)
	PRJ_DEP_C	:= $(sort $(PRJ_DEP_C))
	
	PRJ_OBJ_C_CXX	+= $(PRJ_LOCAL_OBJ_C_CXX)
	PRJ_OBJ_C_CXX	:= $(sort $(PRJ_OBJ_C_CXX))

	SUBMAKEFILE	= $(foreach sdir, $(LOCAL_MAKEFILE), $(addprefix $(sdir), Makefile)) 
endif

include $(SUBMAKEFILE)

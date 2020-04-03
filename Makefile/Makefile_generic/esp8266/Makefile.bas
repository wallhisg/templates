ifeq (1, $(MODULES))
	MDL_PATH	+= $(PRJ_LOCAL_MDL)
	MDL_PATH	:= $(sort $(MDL_PATH))
	TARGET_PATH	+= $(PRJ_TARGET_MDL)
	TARGET_PATH	:= $(sort $(PRJ_TARGET_MDL))
	SUBMAKEFILE	= $(foreach sdir, $(LOCAL_MAKEFILE), $(addprefix $(sdir), Makefile)) 
else ifeq (1, $(SUBMODULES))

	MDL_PATH	+= $(PRJ_LOCAL_MDL)
	MDL_PATH	:= $(sort $(MDL_PATH))

	TARGET_PATH	+= $(PRJ_TARGET_MDL)
	TARGET_PATH	:= $(sort $(PRJ_TARGET_MDL))

	MLD_INC		+= $(addprefix -I,$(MDL_PATH))
	MLD_INC		:= $(sort $(MLD_INC))

	PRJ_SRC_C	+= $(PRJ_LOCAL_SRC_C)
	PRJ_SRC_C	+= $(PRJ_TARGET_SRC_C)
	PRJ_SRC_C	:= $(sort $(PRJ_SRC_C))

	PRJ_DEP_C	+= $(PRJ_LOCAL_DEP_C)
	PRJ_DEP_C	+= $(PRJ_TARGET_DEP_C)
	PRJ_DEP_C	:= $(sort $(PRJ_DEP_C))

	PRJ_SRC_CPP	+= $(PRJ_LOCAL_SRC_CPP)
	PRJ_SRC_CPP	+= $(PRJ_TARGET_SRC_CPP)
	PRJ_SRC_CPP	:= $(sort $(PRJ_SRC_CPP))

	
	PRJ_OBJ 	+=	$(PRJ_LOCAL_OBJ_C)
	PRJ_OBJ 	+=	$(PRJ_LOCAL_OBJ_CPP)
	PRJ_OBJ 	+=	$(PRJ_TARGET_OBJ_C)
	PRJ_OBJ 	+=	$(PRJ_TARGET_OBJ_CPP)
	PRJ_OBJ		:=	$(sort $(PRJ_OBJ))

	PRJ_DEP_CPP	+= $(PRJ_LOCAL_DEP_CPP)
	PRJ_DEP_CPP	:= $(sort $(PRJ_DEP_CPP))

	SUBMAKEFILE	= $(foreach sdir, $(LOCAL_MAKEFILE), $(addprefix $(sdir), Makefile)) 
endif

include $(SUBMAKEFILE)

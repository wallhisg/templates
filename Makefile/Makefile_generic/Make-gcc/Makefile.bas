
# ifeq ($(BFLAG),$(filter $(BFLAG),$(BF_BUILD) $(BF_NOT_BUILD)))
ifeq ($(BF_BUILD), $(BFLAG))
	# add module path
	MDL_PATH	+= $(PRJ_LOCAL_MDL)
	MDL_PATH	:= $(sort $(MDL_PATH))
	# add include
	MLD_INC		+= $(addprefix -I,$(MDL_PATH))
	MLD_INC		:= $(sort $(MLD_INC))
	#deps
	PRJ_DEP		+=	$(PRJ_LOCAL_DEP_C)
	PRJ_DEP		+=	$(PRJ_LOCAL_DEP_CPP)
	PRJ_DEP		:=	$(sort $(PRJ_DEP))
	# object
	PRJ_OBJ 	+=	$(PRJ_LOCAL_OBJ_C)
	PRJ_OBJ 	+=	$(PRJ_LOCAL_OBJ_CPP)
	PRJ_OBJ		:=	$(sort $(PRJ_OBJ))
	# select compiler gcc or g++
	PRJ_SRC_CPP	+= $(PRJ_LOCAL_SRC_CPP)
	PRJ_SRC_CPP	:= $(sort $(PRJ_SRC_CPP))	
	# for clean
	BUILD_MDL_DIR	+=	$(LOCAL_BUILD_DIR)
	BUILD_MDL_DIR	:=	$(sort $(BUILD_MDL_DIR))
else ifeq ($(BF_NOT_BUILD), $(BFLAG))
	# add module path
	MDL_PATH	+= $(PRJ_LOCAL_MDL)
	MDL_PATH	:= $(sort $(MDL_PATH))
	# add include
	MLD_INC		+= $(addprefix -I,$(MDL_PATH))
	MLD_INC		:= $(sort $(MLD_INC))
	# object
	PRJ_OBJ 	+=	$(PRJ_LOCAL_OBJ_C)
	PRJ_OBJ 	+=	$(PRJ_LOCAL_OBJ_CPP)
	PRJ_OBJ		:=	$(sort $(PRJ_OBJ))	
endif



	SUBMAKEFILE	= $(foreach sdir, $(PRJ_LOCAL_SUB_MDL), $(addprefix $(sdir), Makefile)) 

include $(SUBMAKEFILE)

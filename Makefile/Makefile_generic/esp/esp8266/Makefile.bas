
ifneq ($(BF_NOT_USE), $(BFLAG))
	ifeq ($(BF_NOT_INC), $(BFLAG))

	else ifeq ($(BFLAG),$(filter $(BFLAG),$(BF_BUILD) $(BF_NOT_BUILD)))
		# add module path
		MDL_PATH	+= $(PRJ_LOCAL_MDL)
		MDL_PATH	:= $(sort $(MDL_PATH))
		# add include
		MLD_INC		+= $(addprefix -I,$(MDL_PATH))
		MLD_INC		:= $(sort $(MLD_INC))
		# dep
		PRJ_DEP		+=	$(PRJ_LOCAL_DEP)
		PRJ_DEP		:=	$(sort $(PRJ_DEP))

		CFLAGS 		+= $(MLD_INC)
		CFLAGS		:= $(sort $(CFLAGS))

		PRJ_OBJ		+= $(PRJ_LOCAL_OBJ_C)
		PRJ_OBJ 	+=	$(PRJ_LOCAL_OBJ_CPP)
		PRJ_OBJ		:= $(sort $(PRJ_OBJ))

		ifeq ($(BF_BUILD), $(BFLAG))
			PRJ_BUILD_DIR	+=	$(LOCAL_BUILD_DIR)
			PRJ_BUILD_DIR	:=	$(sort $(PRJ_BUILD_DIR))
		endif
	else ifeq ($(BF_FIRM), $(BFLAG))
		MDL_PATH	+= $(PRJ_LOCAL_MDL)
		MDL_PATH	:= $(sort $(MDL_PATH))
		# add include
		MLD_INC			+= $(addprefix -I,$(MDL_PATH))
		MLD_INC		:= $(sort $(MLD_INC))
		# dep
		PRJ_DEP			+=	$(PRJ_LOCAL_DEP_C)
		PRJ_DEP			:=	$(sort $(PRJ_DEP))

		PRJ_LIB_AR		+= $(PRJ_LOCAL_LIB)
		PRJ_OUT			+= $(PRJ_LOCAL_OUT)
		# build directory
		PRJ_BUILD_DIR	+=	$(LOCAL_FIRM_DIR)
		PRJ_BUILD_DIR	:=	$(sort $(PRJ_BUILD_DIR))	
	endif
endif
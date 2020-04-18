
# ifeq ($(BFLAG),$(filter $(BFLAG),$(BF_BUILD) $(BF_NOT_BUILD)))
ifneq ($(BF_NOT_USE), $(BFLAG))
	# BF_NOT_INC
	ifeq ($(BF_NOT_INC), $(BFLAG))

	# BF_BUILD && BF_NOT_BUILD
	else ifeq ($(BFLAG),$(filter $(BFLAG),$(BF_BUILD) $(BF_NOT_BUILD)))
		# add module path
		MDL_PATH	+= $(EDK_LOCAL_MDL)
		MDL_PATH	:= $(sort $(MDL_PATH))
		# add include
		MLD_INC		+= $(addprefix -I,$(MDL_PATH))
		MLD_INC		:= $(sort $(MLD_INC))
		# dep
		EDK_DEP		+=	$(EDK_LOCAL_DEP)
		EDK_DEP		:=	$(sort $(EDK_DEP))
		# object
		EDK_OBJ 	+=	$(EDK_LOCAL_OBJ_C)
		EDK_OBJ 	+=	$(EDK_LOCAL_OBJ_CPP)
		EDK_OBJ		:=	$(sort $(EDK_OBJ))
		ifeq ($(BF_BUILD), $(BFLAG))
			EDK_BUILD_DIR	+=	$(LOCAL_BUILD_DIR)
			EDK_BUILD_DIR	:=	$(sort $(EDK_BUILD_DIR))
		endif
	else ifeq ($(BF_TEST), $(BFLAG))
		# dep
		EDK_DEP			+=	$(EDK_LOCAL_DEP)
		EDK_DEP			:=	$(sort $(EDK_DEP))
		# build directory
		EDK_BUILD_DIR	+=	$(LOCAL_BUILD_DIR)
		EDK_BUILD_DIR	:=	$(sort $(EDK_BUILD_DIR))
		# programs
		PROGRAMS		+=	$(PROGRAM)
		PROGRAMS		:=	$(sort $(PROGRAMS))
	endif
endif
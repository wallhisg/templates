# Build Flag
# BF_RESERVED	:=	0	BF_NOT_USE		:=	1
# BF_NOT_INC	:=	2	BF_NOT_BUILD	:=	3
# BF_BUILD		:=	4	BF_FIRM			:=	5
BFLAG	:= $(BF_FIRM)
#----------------------------------------------------------------------------------
PRJ_LOCAL_BASE		:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PRJ_LOCAL_MDL		:= $(sort $(dir $(wildcard $(PRJ_LOCAL_BASE)*/)))
PRJ_LOCAL_SUB_MDL	:= $(filter-out $(PRJ_LOCAL_BASE), $(PRJ_LOCAL_MDL))
LOCAL_FIRM_DIR		:= $(subst $(PRJ_PATH), $(ESP_BUILD_PATH), $(PRJ_LOCAL_BASE))
#----------------------------------------------------------------------------------
# c source
PRJ_LOCAL_SRC_C		:= $(wildcard $(PRJ_LOCAL_BASE)*.c)
PRJ_LOCAL_DEP_C		:= $(subst $(PRJ_PATH), $(ESP_BUILD_PATH), $(patsubst %.c, %.deps, $(PRJ_LOCAL_SRC_C)))
PRJ_LOCAL_OBJ_C		:= $(subst $(PRJ_PATH), $(ESP_BUILD_PATH), $(patsubst %.c, %.o, $(PRJ_LOCAL_SRC_C)))
#----------------------------------------------------------------------------------
# cpp source
PRJ_LOCAL_SRC_CPP	:= $(wildcard $(PRJ_LOCAL_BASE)*.cpp)
PRJ_LOCAL_DEP_CPP	:= $(subst $(PRJ_PATH), $(ESP_BUILD_PATH), $(patsubst %.cpp, %.deps, $(PRJ_LOCAL_SRC_CPP)))
PRJ_LOCAL_OBJ_CPP	:= $(subst $(PRJ_PATH), $(ESP_BUILD_PATH), $(patsubst %.cpp, %.o, $(PRJ_LOCAL_SRC_CPP)))
#----------------------------------------------------------------------------------
PRJ_LOCAL_HEADER	:= $(wildcard $(PRJ_LOCAL_BASE)*.h)
#----------------------------------------------------------------------------------
CFLAGS				+= $(addprefix -I,$(PRJ_LOCAL_BASE))
#----------------------------------------------------------------------------------
# dependencies
$(PRJ_LOCAL_DEP_C): $(PRJ_LOCAL_SRC_C) $(PRJ_LOCAL_INC)
	@$(CC) -MM $< > $@
	@$(CC) $< -MM -MT $@ >> $@
	
$(PRJ_LOCAL_DEP_CPP): $(PRJ_LOCAL_SRC_CPP) $(PRJ_LOCAL_INC)
	@$(CXX) -MM $< > $@
	@$(CXX) $< -MM -MT $@ >> $@
	
$(PRJ_LOCAL_OBJ_C): $(PRJ_LOCAL_SRC_C) $(PRJ_LOCAL_DEP_C)
$(PRJ_LOCAL_OBJ_CPP): $(PRJ_LOCAL_SRC_CPP) $(PRJ_LOCAL_DEP_CPP)
#----------------------------------------------------------------------------------
PRJ_TARGET_NAME		:= $(shell basename $(PRJ_LOCAL_BASE))
PRJ_LOCAL_TARGET	:= $(subst $(PRJ_PATH), $(ESP_BUILD_PATH), $(addprefix $(PRJ_LOCAL_BASE), $(PRJ_TARGET_NAME)))
PRJ_LOCAL_LIB		:= $(addsuffix .a, $(PRJ_LOCAL_TARGET))
PRJ_LOCAL_OUT		:= $(addsuffix .out, $(PRJ_LOCAL_TARGET))

#----------------------------------------------------------------------------------
# 	we create two different files for uploading into the flash
# 	these are the names and options to generate them
FW_FILE_1_ADDR		:= 0x00000
FW_FILE_2_ADDR		:= 0x10000
FW_FILE_1			:= $(addprefix $(LOCAL_FIRM_DIR),$(FW_FILE_1_ADDR).bin)
FW_FILE_2			:= $(addprefix $(LOCAL_FIRM_DIR),$(FW_FILE_2_ADDR).bin)
#----------------------------------------------------------------------------------
# Output file
# Create final output files
#----------------------------------------------------------------------------------	
$(PRJ_LOCAL_LIB): $(PRJ_OBJ) $(PRJ_LOCAL_OBJ_C)
#	$(vecho) "AR $@"
	$(AR) cru $@ $^

$(PRJ_LOCAL_OUT): $(PRJ_LOCAL_LIB)
	$(LD) -L$(SDK_LIB_DIR) $(LD_SCRIPT) $(LDFLAGS),--start-group $(SDK_LIB) $(PRJ_LOCAL_LIB) $(EDK_LIB) -Wl,--end-group -o $@
	
$(LOCAL_FIRM_DIR)%.bin: $(PRJ_LOCAL_OUT) | $(LOCAL_FIRM_DIR)
# 	$(vecho) "FW $(LOCAL_FIRM_DIR)"
	$(ESPTOOL) elf2image --flash_mode dio --flash_freq '40m' --flash_size $(FLASH_SIZE) -o $(LOCAL_FIRM_DIR) $(PRJ_LOCAL_OUT)
#----------------------------------------------------------------------------------
include $(PRJ_BASE)/Makefile.bas
#----------------------------------------------------------------------------------
ifneq ($(BF_NOT_USE), $(BFLAG))
SUBMAKEFILE	= $(foreach sdir, $(PRJ_LOCAL_SUB_MDL), $(addprefix $(sdir), Makefile))
include $(SUBMAKEFILE)
endif

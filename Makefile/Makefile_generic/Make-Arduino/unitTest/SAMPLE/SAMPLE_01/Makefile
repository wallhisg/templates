# module
MODULES		:= 1
# enable submodules
SUBMODULES 	:= 1
ifeq (1, $(SUBMODULES))

#----------------------------------------------------------------------------------
PRJ_TEST_BASE		:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PRJ_TEST_MDL		:= $(sort $(dir $(wildcard $(PRJ_TEST_BASE)*/)))
LOCAL_MAKEFILE		:= $(filter-out $(PRJ_TEST_BASE), $(PRJ_TEST_MDL))

CORE 				:= core 
PRJ_TEST_CORE		:= $(addprefix $(PRJ_TEST_MDL), $(CORE))
PRJ_TEST_CORE		:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_TEST_CORE))
#----------------------------------------------------------------------------------
# c source
PRJ_TEST_SRC_C		:= $(wildcard $(PRJ_TEST_BASE)*.c)

TEST_OBJ_C	:= $(patsubst %.c, %.o, $(PRJ_TEST_SRC_C))
TEST_OBJ_C	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(TEST_OBJ_C))

PRJ_TEST_DEP_C		:= $(patsubst %.c, %.deps, $(PRJ_TEST_SRC_C))	
PRJ_TEST_DEP_C		:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_TEST_DEP_C))
#----------------------------------------------------------------------------------
# cpp source
PRJ_TEST_SRC_CPP	:= $(wildcard $(PRJ_TEST_BASE)*.cpp)

TEST_OBJ_CPP	:= $(patsubst %.cpp, %.o, $(PRJ_TEST_SRC_CPP))
TEST_OBJ_CPP	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(TEST_OBJ_CPP))

PRJ_TEST_DEP_CPP	:= $(patsubst %.cpp, %.deps, $(PRJ_TEST_SRC_CPP))	
PRJ_TEST_DEP_CPP	:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_TEST_DEP_CPP))
#----------------------------------------------------------------------------------
# header
PRJ_TEST_INC	:= $(wildcard $(PRJ_TEST_BASE)*.h)


# dependencies
$(PRJ_TEST_DEP_C): $(PRJ_TEST_SRC_C) $(PRJ_TEST_INC)
	@$(CC) -MM $< > $@
	@$(CC) $< -MM -MT $@ >> $@

$(PRJ_TEST_DEP_CPP): $(PRJ_TEST_SRC_CPP) $(PRJ_TEST_INC)
	@$(CXX) -MM $< > $@
	@$(CXX) $< -MM -MT $@ >> $@

TARGET		:= $(shell basename $(PRJ_TEST_BASE))
PROGRAM		:= $(addprefix $(PRJ_TEST_BASE), $(TARGET))
PROGRAM		:= $(subst $(PRJ_PATH), $(BUILD_PATH), $(PROGRAM))
PROGRAMS	+= $(PROGRAM)

#----------------------------------------------------------------------------------
# .a file
# PRJ_AR_FILE		:= $(addsuffix /core.a, $(PRJ_TEST_CORE_PATH))
PRJ_AR_FILE		:= $(addsuffix .a, $(PROGRAM))
# PRJ_AR_FILE		:= $(addsuffix /core.a, $(PROGRAM))
#----------------------------------------------------------------------------------
# eagle file
PRJ_EAGLE_FILE	:=	eagle.app.v6.common.ld.h
PRJ_EAGLE_SRC	:=	$(addprefix $(SDK_EAGLE_BASE)/, $(PRJ_EAGLE_FILE))
PRJ_EAGLE_DES	:=	$(basename $(addprefix local., $(PRJ_EAGLE_FILE)))
PRJ_EAGLE_DES	:=	$(addprefix $(PRJ_TEST_BASE), $(PRJ_EAGLE_DES))
PRJ_EAGLE_DES	:=	$(subst $(PRJ_PATH), $(BUILD_PATH), $(PRJ_EAGLE_DES))

PRJ_EAGLE_FLAG	:= -CC -E -P -DVTABLES_IN_FLASH
#----------------------------------------------------------------------------------
# .map file
PRJ_MAP_FILE		:= $(addsuffix .map, $(PROGRAM))
PRJ_MAP_FLAG		:= -fno-exceptions -Wl,-Map=$(PRJ_MAP_FILE) -Wl,
#----------------------------------------------------------------------------------
# eagle flash file
PRJ_EAGLE_FLASH_FILE	:=	eagle.flash.1m64.ld
PRJ_EAGLE_FLASH_FLAG	:=	-g -w -Os -nostdlib -Wl,--no-check-sections -u app_entry -u _printf_float -u _scanf_float -Wl,-static
PRJ_EAGLE_FLASH_FLAG	+=	$(SDK_LIB_DIR)
#----------------------------------------------------------------------------------
# .elf file
PRJ_ELF_FILE		:= $(addsuffix .elf, $(PROGRAM))
PRJ_ELF_FLAG		:= -Wl,--gc-sections -Wl,-wrap,system_restart_local -Wl,-wrap,spi_flash_read

LD_SCRIPT		:= -T/home/wall/projects/templates/Makefile/Makefile_generic/Make-Arduino/build/unitTest/SAMPLE/SAMPLE_01/local.eagle.app.v6.common.ld
#----------------------------------------------------------------------------------
$(PROGRAM): $(PRJ_TEST_DEP_C) $(PRJ_TEST_DEP_CPP) $(TEST_OBJ_C) $(TEST_OBJ_CPP)
	$(CCX) $(TEST_OBJ_C) $(TEST_OBJ_CPP) $(PRJ_OBJ_C) $(PRJ_OBJ_CPP) -o $@ 

PRJ_ELF1 	:=	$(PRJ_MAP_FLAG)
PRJ_ELF2 	:=	$(PRJ_EAGLE_FLASH_FLAG) -T$(PRJ_EAGLE_FLASH_FILE) -Wl,
PRJ_ELF3 	:=	$(PRJ_ELF_FLAG) -o $(PRJ_ELF_FILE) -Wl,--start-group
PRJ_ELF4	+=	$(TEST_OBJ_C) $(TEST_OBJ_CPP) $(PRJ_AR_FILE) $(SDK_LIB) -Wl,--end-group
PRJ_ELF4	+=	-L$(basename $(PROGRAM))

PRJ_ELF 	:= $(PRJ_ELF1)  $(LD_SCRIPT) $(PRJ_ELF2) $(PRJ_ELF3) $(PRJ_ELF4)
#----------------------------------------------------------------------------------
include $(PRJ_BASE)/Makefile.bas

endif

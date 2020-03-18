export ROOT_BASE	?= $(abspath $(dir $(abspath $(dir $$PWD))))
export PRJ_BASE		?= $(abspath $(dir $$PWD))
export PRJ_PATH		?= $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

export PRJ_SRC_C	:=
export PRJ_OBJ_C	:=
export PRJ_DEP_C	:=

export PRJ_SRC_CPP	:=
export PRJ_OBJ_CPP	:=
export PRJ_DEP_CPP	:=

export PRJ_LIB		:=
export EXTRA_LIB	:=

export MDL_PATH		:=
export EXTRA_MDL_PATH	:= 

export TEST_PATH	:=

export MDL_INC		:=
export EXTRA_MLD_INC	:=

#======================================================================
# 	base directory of the ESP8266 SDK package, absolute
SDK_PATH		:=	$(HOME)/projects/IoT/mcu/platforms/espressif/esp8266_sdk/2.2.1/ESP8266_NONOS_SDK_2.2.1/
# SDK_BASE		= /home/wall/projects/IoT/mcu/platforms/espressif/esp8266_sdk/2.2.1/ESP8266_NONOS_SDK_2.2.1
SDK_INC			+=	$(HOME)/.arduino15/packages/esp8266/hardware/esp8266/2.6.3/tools/sdk/lwip2/include
SDK_INC			+=	$(HOME)/.arduino15/packages/esp8266/hardware/esp8266/2.6.3/tools/sdk/libc/xtensa-lx106-elf/include
SDK_INC			+=	$(HOME)/.arduino15/packages/esp8266/hardware/esp8266/2.6.3/cores/esp8266

SDK_LIB_BASE	:=	$(HOME)/.arduino15/packages/esp8266/hardware/esp8266/2.6.3/tools/sdk/lib
SDK_LIB_BASE	+=	$(HOME)/.arduino15/packages/esp8266/hardware/esp8266/2.6.3/tools/sdk/lib/NONOSDK22x_190703
SDK_LIB_BASE	+=	$(HOME)/.arduino15/packages/esp8266/hardware/esp8266/2.6.3/tools/sdk/ld
SDK_LIB_BASE	+=	$(HOME)/.arduino15/packages/esp8266/hardware/esp8266/2.6.3/tools/sdk/libc/xtensa-lx106-elf/lib

SDK_LD_BASE		:= 	$(HOME)/.arduino15/packages/esp8266/hardware/esp8266/2.6.3/tools/sdk/ld
SDK_LIB_DIR		:= 	$(addprefix -L,$(SDK_LIB_BASE))

export TARGET		:=
export PROGRAMS		:=


export BUILD		= build
export BUILD_BASE	= $(PRJ_BASE)/$(BUILD)
export BUILD_PATH	= $(PRJ_BASE)/$(BUILD)/
export BUILD_DIR	= $(subst $(PRJ_PATH),$(BUILD_PATH), $(MDL_PATH))
export BUILD_TEST_DIR	=


include $(PRJ_BASE)/Makefile.cfg
include $(PRJ_BASE)/Makefile.inc
include $(PRJ_BASE)/Makefile.env
include $(PRJ_BASE)/Makefile.bas

.PHONY: all build clean checkdirs test

#======================================================================
# Enviroment
#======================================================================
MKDIR	:= mkdir -p
RMDIR	:= rm -rf	
RM	:= rm -f
MV	:= mf -f
#======================================================================

test:
	@echo	01. $(PRJ_EAGLE_FILE_IN)
	@echo	01. $(PRJ_EAGLE_FILE_OUT)

#
#
#
# Basic usage:
#   -- init mcu rules:
#   $(call init_mmcu,atmega8a)
#   -- include conf for MCU
#   $(call include_conf,atmega8a)
#   -- include conf for program
#   $(call include_program_conf,main.atmega8a)
#   -- include libraries
#   $(call include_lib,lib)
#
# Library rules format
#   -- init env.
#   $(eval (init))
#   -- add files mamamia.c mamamia.h into library
#   $(carr add_book,mamamia)
#   
#
# conf file <prgname>.<mcu>.c for program
# must be (should be :)) created and named as <prgname>.<mcu>.mk
#
# Targets starting with 'm_' are internal
#



# files for clean
M_CLEAN_VAR  =
# where i am :).
ACTDIR      =



# Functions for init. environment
#
define init_env
ACTDIR := $$(patsubst %/,%,$$(dir $$(lastword $$(MAKEFILE_LIST))))
endef

# init main environment
define include_lib
$(eval $(call include_lib_s,$(1)))
endef
define include_lib_s
$(if $(ACTDIR),include $(ACTDIR)/$(1)/rules.mk,include $(1)/rules.mk)
endef

define include_conf
$(eval $(call include_conf_s,$(1)))
endef
define include_conf_s
include conf/mcu/$(1).mk
endef

define include_program_conf
$(eval $(call include_program_conf_s,$(1),$(2)))
endef
define include_program_conf_s
$(if $(wildcard $(2).$(1).mk),include $(2).$(1).mk,)
endef

# genere target file name
get_target_file_name=$(2).$(1).hex


# Library finctions
#
define add_book
$(eval $(call addbook_s,$(1)))
endef
define addbook_s
$$(ACTDIR)/$(1).o: $$(ACTDIR)/$(1).c $$(ACTDIR)/$(1).h
	$(call compile_with_mmcu_rn,$$(M_TARGET_MCU),$$<,$$(ACTDIR)/$(1).o)

M_CLEAN_VAR += $(ACTDIR)/$(1).o
endef


# Init base rules for MCU
#
define init_mmcu
	$(eval $(call init_mmcu_s,$(1)))
endef
define init_mmcu_s
M_TARGET_MCU:=$(1)
%.$(1).o: %.$(1).c
	$(call compile_with_mmcu,$(1),$$^)

OBJCOPY_FLAGS  := -R .eeprom -R .fuse -R .lock -R .signature -R .user_signatures 
OBJCOPY_FORMAT := -O ihex
%.$(1).hex : %.$(1).o
	$(call link_with_mmcu,$(1),$$(patsubst %.o,%.elf,$$<),$$^)
	$(AVROBJCOPY) $$(OBJCOPY_FLAGS) $$(OBJCOPY_FORMAT) $$(patsubst %.o,%.elf,$$<) $$(patsubst %.o,%.hex,$$<)
endef

define compile_with_mmcu
$(CC) $(CFLAGS) -mmcu=$1 -c $2
endef

define compile_with_mmcu_rn
$(CC) $(CFLAGS) -mmcu=$1 -c $2 -o $3
endef

define link_with_mmcu
$(CC) $(LFLAGS) -mmcu=$1 -o $2 $3
endef


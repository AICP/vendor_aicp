#
# Copyright (C) 2016 The CyanogenMod Project
#               2017-2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifeq ($(TARGET_SCREEN_WIDTH),)
    $(warning TARGET_SCREEN_WIDTH is not set, using default value: 1080)
    TARGET_SCREEN_WIDTH := 1080
endif
ifeq ($(TARGET_SCREEN_HEIGHT),)
    $(warning TARGET_SCREEN_HEIGHT is not set, using default value: 1080)
    TARGET_SCREEN_HEIGHT := 1080
endif

TARGET_GENERATED_BOOTANIMATION := $(TARGET_OUT_INTERMEDIATES)/BOOTANIMATION/bootanimation.zip
$(TARGET_GENERATED_BOOTANIMATION): INTERMEDIATES := $(TARGET_OUT_INTERMEDIATES)/BOOTANIMATION
$(TARGET_GENERATED_BOOTANIMATION): $(SOONG_ZIP)
	@echo "Building bootanimation.zip"
	@rm -rf $(dir $@)
	@mkdir -p $(dir $@)
	$(hide) tar xfp vendor/aicp/bootanimation/bootanimation$(shell shuf -i 0-3 -n 1).tar -C $(INTERMEDIATES)
	$(hide) if [ $(TARGET_SCREEN_HEIGHT) -lt $(TARGET_SCREEN_WIDTH) ]; then \
	    SIZE=$(TARGET_SCREEN_HEIGHT); \
	else \
	    SIZE=$(TARGET_SCREEN_WIDTH); \
	fi; \
	if [ "$(TARGET_BOOTANIMATION_HALF_RES)" = "true" ]; then \
	    IMAGESIZE="$$(expr "$$SIZE" / 2)"; \
	else \
	    IMAGESIZE=$$SIZE; \
	fi; \
	RESOLUTION="$$IMAGESIZE"x"$$IMAGESIZE"; \
	for part_cnt in 1 2 3; do \
	    mkdir -p $(INTERMEDIATES)/part$$part_cnt; \
	done; \
	mogrify -resize $$RESOLUTION -colors 250 $(INTERMEDIATES)/*/*.jpg; \
	echo "$$SIZE $$SIZE 30" > $(INTERMEDIATES)/desc.txt; \
	cat vendor/aicp/bootanimation/desc.txt >> $(INTERMEDIATES)/desc.txt
	$(hide) find $(INTERMEDIATES)/ -type f \( -name "*.jpg" -or -name "*.txt" \) | sort >$@.list
	$(hide) $(SOONG_ZIP) -L 0 -o $(TARGET_GENERATED_BOOTANIMATION) -C $(INTERMEDIATES) -l $@.list

ifeq ($(TARGET_BOOTANIMATION),)
    TARGET_BOOTANIMATION := $(TARGET_GENERATED_BOOTANIMATION)
    ifeq ($(shell command -v mogrify),)
        $(info **********************************************)
        $(info The boot animation could not be generated as)
        $(info ImageMagick is not installed in your system.)
        $(info $(space))
        $(info Please install ImageMagick from this website:)
        $(info https://imagemagick.org/script/binary-releases.php)
        $(info **********************************************)
        $(error stop)
    endif
endif

include $(CLEAR_VARS)
LOCAL_MODULE := bootanimation.zip
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/media

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(TARGET_BOOTANIMATION)
	@cp $(TARGET_BOOTANIMATION) $@

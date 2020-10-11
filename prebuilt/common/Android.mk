LOCAL_PATH := $(call my-dir)

# a wrapper for curl which provides wget syntax, for compatibility
include $(CLEAR_VARS)
LOCAL_MODULE := wget
LOCAL_SRC_FILES := bin/wget
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
include $(BUILD_PREBUILT)

################################
# Copies the APN list file into $(TARGET_COPY_OUT_PRODUCT)/etc for the product as apns-conf.xml.
# In the case where $(CUSTOM_APNS_FILE) is defined, the content of $(CUSTOM_APNS_FILE)
# is added or replaced to the $(DEFAULT_APNS_FILE).
include $(CLEAR_VARS)

LOCAL_MODULE := apns-conf.xml
LOCAL_MODULE_CLASS := ETC

DEFAULT_APNS_FILE := vendor/aicp/prebuilt/common/etc/apns-conf.xml

ifdef CUSTOM_APNS_FILE
CUSTOM_APNS_SCRIPT := vendor/aicp/tools/custom_apns.py
FINAL_APNS_FILE := $(local-generated-sources-dir)/apns-conf.xml

$(FINAL_APNS_FILE): PRIVATE_SCRIPT := $(CUSTOM_APNS_SCRIPT)
$(FINAL_APNS_FILE): PRIVATE_CUSTOM_APNS_FILE := $(CUSTOM_APNS_FILE)
$(FINAL_APNS_FILE): $(CUSTOM_APNS_SCRIPT) $(DEFAULT_APNS_FILE)
	rm -f $@
	python $(PRIVATE_SCRIPT) $@ $(PRIVATE_CUSTOM_APNS_FILE)
else
FINAL_APNS_FILE := $(DEFAULT_APNS_FILE)
endif

LOCAL_PREBUILT_MODULE_FILE := $(FINAL_APNS_FILE)

LOCAL_PRODUCT_MODULE := true

include $(BUILD_PREBUILT)

################################
# Copies the font configuration file into product/etc for the product as fonts_customization.xml.
# In the case where $(ADDITIONAL_FONTS_FILE) is defined, the content(s) of $(ADDITIONAL_FONTS_FILE)
# are added to the $(AICP_FONTS_FILE).
include $(CLEAR_VARS)

LOCAL_MODULE := fonts_customization.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_PRODUCT_MODULE := true

AICP_FONTS_FILE := vendor/aicp/prebuilt/common/etc/fonts_customization.xml

ifdef ADDITIONAL_FONTS_FILE
ADDITIONAL_FONTS_SCRIPT := vendor/aicp/build/tools/add_additional_fonts.py
ADD_ADDITIONAL_FONTS := $(local-generated-sources-dir)/fonts_customization.xml

$(ADD_ADDITIONAL_FONTS): PRIVATE_SCRIPT := $(ADDITIONAL_FONTS_SCRIPT)
$(ADD_ADDITIONAL_FONTS): PRIVATE_ADDITIONAL_FONTS_FILE := $(ADDITIONAL_FONTS_FILE)
$(ADD_ADDITIONAL_FONTS): $(ADDITIONAL_FONTS_SCRIPT) $(AICP_FONTS_FILE) $(ADDITIONAL_FONTS_FILE)
	rm -f $@
	python3 $(PRIVATE_SCRIPT) $@ $(PRIVATE_ADDITIONAL_FONTS_FILE)
else
ADD_ADDITIONAL_FONTS := $(AICP_FONTS_FILE)
endif

LOCAL_PREBUILT_MODULE_FILE := $(ADD_ADDITIONAL_FONTS)

include $(BUILD_PREBUILT)

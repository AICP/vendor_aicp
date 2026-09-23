LOCAL_PATH := $(call my-dir)

# Set healthd_density to the density bucket of the device.
healthd_density := mdpi
ifneq (,$(TARGET_RECOVERY_DENSITY))
  healthd_density := $(filter %dpi,$(TARGET_RECOVERY_DENSITY))
else ifneq (,$(PRODUCT_AAPT_PREF_CONFIG))
  healthd_density := $(filter %dpi,$(PRODUCT_AAPT_PREF_CONFIG))
endif

# Map fallback if the exact density folder does not exist
ifeq ($(wildcard $(LOCAL_PATH)/images/$(healthd_density)),)
  healthd_density := xhdpi
endif

include $(CLEAR_VARS)
LOCAL_MODULE := aicp_battery_scale.png
# Rename it to battery_scale.png so the stock AOSP charger binary finds it
LOCAL_MODULE_STEM := battery_scale.png
LOCAL_SRC_FILES := images/$(healthd_density)/aicp_battery_scale.png
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_PRODUCT_MODULE := true
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/res/images/charger
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := aicp_charger_res_images
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := aicp_battery_scale.png
LOCAL_OVERRIDES_PACKAGES := charger_res_images
include $(BUILD_PHONY_PACKAGE)

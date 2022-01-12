# Include AICP versions
include $(TOPDIR)vendor/aicp/build/core/main_version.mk

# Override product info for Google Play Services and SafetyNet
ifeq ($(PRODUCT_OVERRIDE_INFO),true)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.tags=release-keys \
    ro.build.flavor=$(PRODUCT_NAME)-user \
    ro.build.stock_fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \

# Description needs special treatment because it contains spaces
PRIVATE_BUILD_DESC := $(PRODUCT_OVERRIDE_DESC)
endif

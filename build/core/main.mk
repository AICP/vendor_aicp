# Include AICP versions
include $(TOPDIR)vendor/aicp/build/core/main_version.mk

# Override product info for Google Play Services and SafetyNet
ifeq ($(PRODUCT_OVERRIDE_INFO),true)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.tags=release-keys \
    ro.build.flavor=$(PRODUCT_NAME)-user \
    ro.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.system.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.product.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.system_ext.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.bootimage.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.odm.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.vendor.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT)

# Description needs special treatment because it contains spaces
PRIVATE_BUILD_DESC := $(PRODUCT_OVERRIDE_DESC)
endif

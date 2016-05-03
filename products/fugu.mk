# Release name
PRODUCT_RELEASE_NAME := fugu

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common_full_tv.mk)

# Inherit device configuration
$(call inherit-product, device/asus/fugu/aosp_fugu.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE :=  fugu
PRODUCT_NAME := aicp_fugu
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus Player
PRODUCT_MANUFACTURER := Asus

PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=fugu \
    BUILD_FINGERPRINT=google/fugu/fugu:6.0.1/MOB30G/2723637:user/release-keys \
    PRIVATE_BUILD_DESC="fugu-user 6.0.1 MOB30G 2723637 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
        DEVICE_MAINTAINERS="Hector C (Zips)"


# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

-include vendor/aicp/configs/bootanimation.mk

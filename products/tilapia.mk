# Release name
PRODUCT_RELEASE_NAME := Nexus7

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common_tablet.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit AOSP device configuration for tilapia
$(call inherit-product, device/asus/tilapia/full_tilapia.mk)


# Setup device specific product configuration.
PRODUCT_NAME := aicp_tilapia
PRODUCT_BRAND := Google
PRODUCT_DEVICE := tilapia
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := asus
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasig BUILD_FINGERPRINT="google/nakasig/tilapia:5.1/LMY47D/1743759:user/release-keys" PRIVATE_BUILD_DESC="nakasig-user 5.1 LMY47D 1743759 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Kaan Külahlı (Rygebin)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800
-include vendor/aicp/configs/bootanimation.mk

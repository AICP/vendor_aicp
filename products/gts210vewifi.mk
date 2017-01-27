$(call inherit-product, device/samsung/gts210vewifi/full_gts210vewifi.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common_tablet.mk)

$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_NAME := aicp_gts210vewifi
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_DEVICE := gts210vewifi
PRODUCT_MODEL := SM-T813

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# Use the latest approved GMS identifiers
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=gts210vewifixx \
    BUILD_FINGERPRINT=samsung/gts210vewifixx/gts210vewifi:6.0.1/MMB29M/T813XXU2APK6:user/release-keys \
    PRIVATE_BUILD_DESC="gts210vewifixx-user 6.0.1 MMB29M T813XXU2APK6 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
   DEVICE_MAINTAINERS="genesixxbf3"
   
# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1600
-include vendor/aicp/configs/bootanimation.mk

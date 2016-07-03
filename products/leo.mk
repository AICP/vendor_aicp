# Release name
PRODUCT_RELEASE_NAME := leo

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/leo/device_leo.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := leo
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi Note Pro
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := aicp_leo

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="nian0114"

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440
-include vendor/aicp/configs/bootanimation.mk

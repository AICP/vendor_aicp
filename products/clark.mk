# Inherit 64-bit configs
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/clark/aosp_clark.mk)

DEVICE_PACKAGE_OVERLAYS += device/motorola/clark/overlay

## Device identifier. This must come after all inclusions
PRODUCT_NAME := aicp_clark
PRODUCT_BRAND := motorola
PRODUCT_MODEL := XT1575

PRODUCT_PROPERTY_OVERRIDES +=\
    ro.product.device=clark

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=clark

# AICP Device Maintainer
PRODUCT_BUILD_PROP_OVERRIDES += \
   DEVICE_MAINTAINERS="Hashbang173"

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440
-include vendor/aicp/configs/bootanimation.mk

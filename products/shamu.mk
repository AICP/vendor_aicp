# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/moto/shamu/aosp_shamu.mk)

DEVICE_PACKAGE_OVERLAYS += device/moto/shamu/overlay-cm

## Device identifier. This must come after all inclusions
PRODUCT_NAME := aicp_shamu
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 6

TARGET_VENDOR := moto

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=shamu \
    BUILD_FINGERPRINT=google/shamu/shamu:6.0.1/MOB30W/3031100:user/release-keys \
    PRIVATE_BUILD_DESC="shamu-user 6.0.1 MOB30W 3031100 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="doc HD (semdoc)"

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440
-include vendor/aicp/configs/bootanimation.mk

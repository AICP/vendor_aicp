# Inherit AICP common bits
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit AOSP device configuration for H815
$(call inherit-product, device/lge/h815/full_h815.mk)

PRODUCT_NAME := aicp_h815

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="g4" \
    PRODUCT_NAME="g4_global_com" \
    BUILD_FINGERPRINT="lge/p1_global_com/p1:5.1/LMY47D/151161552fef7:user/release-keys" \
    PRIVATE_BUILD_DESC="p1_global_com-user 5.1 LMY47D 151161552fef7 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
        DEVICE_MAINTAINERS="Sinisa (thermskin)"

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

-include vendor/aicp/configs/bootanimation.mk

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/htc/m9gsm/full_m9gsm.mk)

PRODUCT_NAME := aicp_m9gsm

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="htc_himauhl" \
    PRODUCT_NAME="himauhl_htc_europe" \
    BUILD_FINGERPRINT="htc/himauhl_htc_europe/htc_himauhl:5.0.2/LRX22G/506785.8:user/release-keys" \
    PRIVATE_BUILD_DESC="1.32.401.8 CL506785 release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

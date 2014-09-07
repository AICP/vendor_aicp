$(call inherit-product, device/samsung/kltespr/full_kltespr.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_DEVICE := kltespr
PRODUCT_NAME := aicp_kltespr

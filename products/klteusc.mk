$(call inherit-product, device/samsung/klteusc/full_klteusc.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_DEVICE := klteusc
PRODUCT_NAME := aicp_klteusc

$(call inherit-product, device/samsung/kltedv/full_kltedv.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_DEVICE := kltedv
PRODUCT_NAME := aicp_kltedv

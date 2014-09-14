$(call inherit-product, device/samsung/kltevzw/full_kltevzw.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_DEVICE := kltevzw
PRODUCT_NAME := aicp_kltevzw

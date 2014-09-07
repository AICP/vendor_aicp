$(call inherit-product, device/samsung/klte/full_klte.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_DEVICE := klte
PRODUCT_NAME := aicp_klte

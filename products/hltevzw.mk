$(call inherit-product, device/samsung/hltevzw/full_hltevzw.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_DEVICE := hltevzw
PRODUCT_NAME := aicp_hltevzw

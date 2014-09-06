$(call inherit-product, device/samsung/hlteusc/full_hlteusc.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_DEVICE := hlteusc
PRODUCT_NAME := aicp_hlteusc

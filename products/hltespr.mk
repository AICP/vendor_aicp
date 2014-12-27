$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/hltespr/full_hltespr.mk)


PRODUCT_DEVICE := hltespr
PRODUCT_NAME := aicp_hltespr

$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/hlteusc/full_hlteusc.mk)


PRODUCT_DEVICE := hlteusc
PRODUCT_NAME := aicp_hlteusc

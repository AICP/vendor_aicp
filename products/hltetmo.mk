$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/hltetmo/full_hltetmo.mk)


PRODUCT_DEVICE := hltetmo
PRODUCT_NAME := aicp_hltetmo

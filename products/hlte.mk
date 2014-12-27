$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/hlte/full_hlte.mk)


PRODUCT_DEVICE := hlte
PRODUCT_NAME := aicp_hlte

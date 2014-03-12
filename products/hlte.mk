$(call inherit-product, device/samsung/hlte/full_hlte.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_DEVICE := hlte
PRODUCT_NAME := aicp_hlte

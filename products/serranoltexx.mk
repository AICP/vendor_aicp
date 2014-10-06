# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/gsm.mk)

$(call inherit-product, device/samsung/serranoltexx/full_serranoltexx.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

PRODUCT_DEVICE := serranoltexx
PRODUCT_NAME := aicp_serranoltexx

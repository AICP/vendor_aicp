$(call inherit-product, device/motorola/ghost/full_ghost.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

PRODUCT_RELEASE_NAME := MOTO X
PRODUCT_NAME := aicp_ghost

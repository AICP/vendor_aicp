# Inherit AOSP device configuration for xt1060
$(call inherit-product, device/motorola/ghost/full_ghost.mk)

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Setup device specific product configuration.
PRODUCT_RELEASE_NAME := MOTO X
PRODUCT_NAME := aicp_ghost

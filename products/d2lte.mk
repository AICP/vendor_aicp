$(call inherit-product, device/samsung/d2lte/full_d2lte.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Unified device flag for Verizon permissions
VZW_UNIFIED := true

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/aicp/configs/vzw.mk)

PRODUCT_NAME := aicp_d2lte

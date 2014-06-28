$(call inherit-product, device/samsung/hlte/full_hlte.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Unified device flag for Verizon permissions
VZW_UNIFIED := true

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/aicp/configs/vzw.mk)

PRODUCT_DEVICE := hlte
PRODUCT_NAME := aicp_hlte

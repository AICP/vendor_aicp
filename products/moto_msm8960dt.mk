# Inherit AOSP device configuration for xt1060
$(call inherit-product, device/motorola/moto_msm8960dt/full_moto_msm8960dt.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Unified device flag for Verizon permissions
VZW_UNIFIED := true

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/aicp/configs/vzw.mk)

# Setup device specific product configuration.
PRODUCT_NAME := aicp_moto_msm8960dt

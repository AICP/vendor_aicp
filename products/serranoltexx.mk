# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit AOSP device configuration for serranoltexx.
$(call inherit-product, device/samsung/serranoltexx/full_serranoltexx.mk)


# Setup device specific product configuration.
PRODUCT_NAME := aicp_serranoltexx
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := serranoltexx
PRODUCT_MODEL := GT-I9195
PRODUCT_MANUFACTURER := samsung

$(call inherit-product, vendor/aicp/configs/common.mk)

$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/d2lte/full_d2lte.mk)

PRODUCT_NAME := aicp_d2lte

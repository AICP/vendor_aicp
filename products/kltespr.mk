$(call inherit-product, vendor/aicp/configs/common.mk)

$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/kltespr/full_kltespr.mk)


PRODUCT_DEVICE := kltespr
PRODUCT_NAME := aicp_kltespr

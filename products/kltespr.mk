$(call inherit-product, vendor/aicp/configs/common.mk)

$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/kltespr/full_kltespr.mk)


PRODUCT_DEVICE := kltespr
PRODUCT_NAME := aicp_kltespr

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

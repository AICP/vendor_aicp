$(call inherit-product, vendor/aicp/configs/common.mk)

$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit AOSP device configuration for xt1060
$(call inherit-product, device/motorola/ghost/full_ghost.mk)


# Setup device specific product configuration.
PRODUCT_RELEASE_NAME := MOTO X
PRODUCT_NAME := aicp_ghost

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

$(call inherit-product, device/motorola/falcon/full_falcon.mk)

PRODUCT_RELEASE_NAME := MOTO G
PRODUCT_NAME := aicp_falcon

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

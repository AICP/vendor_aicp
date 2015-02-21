# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

$(call inherit-product, device/motorola/titan/full_titan.mk)

PRODUCT_RELEASE_NAME := titan
PRODUCT_NAME := aicp_titan

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

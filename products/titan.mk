# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

$(call inherit-product, device/motorola/titan/full_titan.mk)

PRODUCT_RELEASE_NAME := titan
PRODUCT_NAME := aicp_titan

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := titan
PRODUCT_NAME := aicp_titan
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Moto G (2014)
PRODUCT_MANUFACTURER := Motorola

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

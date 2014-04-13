# Inherit AICP device configuration for v500
$(call inherit-product-if-exists, device/lge/v500/aicp.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := v500
PRODUCT_NAME := aicp_v500
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-V500
PRODUCT_MANUFACTURER := LGE

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200
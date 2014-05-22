# Inherit AICP device configuration for d803
$(call inherit-product-if-exists, device/lge/d803/aicp.mk)

# d803 overlay
# PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/d803

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d803
PRODUCT_NAME := aicp_d803
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D803
PRODUCT_MANUFACTURER := lge

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

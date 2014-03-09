# Inherit AICP device configuration for d802
$(call inherit-product-if-exists, device/lge/d802/aicp.mk)

# d802 overlay
# PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/d802

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d802
PRODUCT_NAME := aicp_d802
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D802
PRODUCT_MANUFACTURER := lge

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

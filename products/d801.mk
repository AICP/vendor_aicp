# Inherit AICP device configuration for d801
$(call inherit-product-if-exists, device/lge/d801/aicp.mk)

# d801 overlay
# PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/d801

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d801
PRODUCT_NAME := aicp_d801
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D801
PRODUCT_MANUFACTURER := lge

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

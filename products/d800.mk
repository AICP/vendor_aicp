# Inherit AICP device configuration for d800
$(call inherit-product-if-exists, device/lge/d800/aicp.mk)

# d800 overlay
# PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/d800

# Device identifier
PRODUCT_DEVICE := d800
PRODUCT_NAME := aicp_d800
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D800
PRODUCT_MANUFACTURER := lge

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

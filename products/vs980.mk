# Inherit AICP device configuration for vs980
$(call inherit-product-if-exists, device/lge/vs980/aicp.mk)

# vs980 overlay
# PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/vs980

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := vs980
PRODUCT_NAME := aicp_vs980
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-VS980
PRODUCT_MANUFACTURER := lge

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

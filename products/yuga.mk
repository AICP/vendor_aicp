# Inherit AOSP device configuration for yuga
$(call inherit-product-if-exists, device/sony/yuga/aicp.mk)

# yuga overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/yuga

# Setup device specific product configuration.
PRODUCT_NAME := aicp_yuga
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := yuga
PRODUCT_MODEL := Xperia Z
PRODUCT_MANUFACTURER := Sony

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

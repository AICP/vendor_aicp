# Inherit AOSP device configuration for dogo
$(call inherit-product-if-exists, device/sony/dogo/aicp.mk)

# dogo overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/dogo

# Setup device specific product configuration.
PRODUCT_NAME := aicp_dogo
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := dogo
PRODUCT_MODEL := Xperia ZR
PRODUCT_MANUFACTURER := Sony

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

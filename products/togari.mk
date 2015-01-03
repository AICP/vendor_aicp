# Inherit AOSP device configuration for togari
$(call inherit-product-if-exists, device/sony/togari/aicp.mk)

# togari overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/togari

# Setup device specific product configuration.
PRODUCT_NAME := aicp_togari
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := togari
PRODUCT_MODEL := Xperia Z Ultra
PRODUCT_MANUFACTURER := Sony

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

# Inherit AICP device configuration for odin
$(call inherit-product-if-exists, device/sony/odin/aicp.mk)

# hayabusa overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/odin

# Setup device specific product configuration.
PRODUCT_NAME := aicp_odin
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := odin
PRODUCT_MODEL := Xperia ZL
PRODUCT_MANUFACTURER := Sony

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

# Inherit AICP device configuration for mint
$(call inherit-product-if-exists, device/sony/mint/aicp.mk)

# mint overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/mint

# Setup device specific product configuration.
PRODUCT_NAME := aicp_mint
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := mint
PRODUCT_MODEL := Xperia T
PRODUCT_MANUFACTURER := Sony

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

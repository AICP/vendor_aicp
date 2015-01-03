#Inherit device config from relection
$(call inherit-product-if-exists, device/sony/pollux_windy/aicp.mk)

# pollux_windy overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/pollux

# Setup device specific product configuration.
PRODUCT_NAME := aicp_pollux_windy
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := pollux_windy
PRODUCT_MODEL := Xperia Tablet Z WiFi
PRODUCT_MANUFACTURER := Sony

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

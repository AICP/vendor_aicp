# Inherit AICP device configuration for huashan
$(call inherit-product-if-exists, device/sony/huashan/aicp.mk)

# huashan overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/huashan

# Setup device specific product configuration.
PRODUCT_NAME := aicp_huashan
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := huashan
PRODUCT_MODEL := Xperia SP
PRODUCT_MANUFACTURER := Sony

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 780
-include vendor/aicp/configs/bootanimation.mk

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

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

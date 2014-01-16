# Inherit AOSP device configuration for togari
$(call inherit-product-if-exists, device/sony/togari/aokp.mk)

# togari overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/togari

# Setup device specific product configuration.
PRODUCT_NAME := aokp_togari
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := togari
PRODUCT_MODEL := Xperia Z Ultra
PRODUCT_MANUFACTURER := Sony

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

# Inherit AOSP device configuration for dogo
$(call inherit-product-if-exists, device/sony/dogo/aokp.mk)

# dogo overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/dogo

# Setup device specific product configuration.
PRODUCT_NAME := aokp_dogo
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := dogo
PRODUCT_MODEL := Xperia ZR
PRODUCT_MANUFACTURER := Sony

#bootanimation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip

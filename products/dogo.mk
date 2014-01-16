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

#bootanimation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip

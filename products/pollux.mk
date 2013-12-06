#inherit AOKP device config
$(call inherit-product-if-exists, device/sony/pollux/aokp.mk)

# pollux overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/pollux

# Setup device specific product configuration.
PRODUCT_NAME := aokp_pollux
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := pollux
PRODUCT_MODEL := Xperia Tablet Z LTE
PRODUCT_MANUFACTURER := Sony

#Bootanimation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip


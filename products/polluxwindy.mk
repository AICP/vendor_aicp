#Inherit device config from relection
$(call inherit-product-if-exists, device/sony/pollux_windy/aokp.mk)

# pollux_windy overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/pollux

# Setup device specific product configuration.
PRODUCT_NAME := aokp_polluxwindy
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := pollux_windy
PRODUCT_MODEL := Xperia Tablet Z WiFi
PRODUCT_MANUFACTURER := Sony

#Bootanimation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

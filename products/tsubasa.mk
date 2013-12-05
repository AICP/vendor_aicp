# Inherit AOSP device configuration for tsubasa
$(call inherit-product-if-exists, device/sony/tsubasa/aokp.mk)

# tsubasa overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/tsubasa

# Setup device specific product configuration.
PRODUCT_NAME := aokp_tsubasa
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := tsubasa
PRODUCT_MODEL := Xperia V
PRODUCT_MANUFACTURER := Sony

# boot animation
PRODUCT_COPY_FILES += \
	vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip

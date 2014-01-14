# Inherit AOSP device configuration for tsubasa
$(call inherit-product-if-exists, device/sony/tsubasa/aicp.mk)

# tsubasa overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/tsubasa

# Setup device specific product configuration.
PRODUCT_NAME := aicp_tsubasa
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := tsubasa
PRODUCT_MODEL := Xperia V
PRODUCT_MANUFACTURER := Sony

# boot animation
PRODUCT_COPY_FILES += \
	vendor/aicp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip

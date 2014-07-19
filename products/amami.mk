# Inherit AOSP device configuration for amami
$(call inherit-product-if-exists, device/sony/amami/aicp.mk)

# amami overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/amami

# Setup device specific product configuration.
PRODUCT_NAME := aicp_amami
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := amami
PRODUCT_MODEL := Xperia Z1 compact
PRODUCT_MANUFACTURER := Sony

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation.zip

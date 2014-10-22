# Inherit AICP device configuration for odin
$(call inherit-product-if-exists, device/sony/odin/aicp.mk)

# hayabusa overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/odin

# Setup device specific product configuration.
PRODUCT_NAME := aicp_odin
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := odin
PRODUCT_MODEL := Xperia ZL
PRODUCT_MANUFACTURER := Sony

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

$(call inherit-product, vendor/aicp/configs/common.mk)

$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit AOSP device configuration for xt1060
$(call inherit-product, device/motorola/ghost/full_ghost.mk)


# Setup device specific product configuration.
PRODUCT_RELEASE_NAME := MOTO X
PRODUCT_NAME := aicp_ghost

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation.zip

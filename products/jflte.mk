$(call inherit-product, device/samsung/jflte/full_jflte.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# jfltexx overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/samsung/jf-common

# Specify phone tech before including full_phone
$(call inherit-product, vendor/aicp/configs/gsm.mk)
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

PRODUCT_DEVICE := jflte
PRODUCT_NAME := aicp_jflte

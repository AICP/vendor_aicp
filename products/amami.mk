# Inherit CM common Phone stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/sony/amami/full_amami.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D5503 BUILD_FINGERPRINT=Sony/D5503/D5503:4.4.4/14.4.A.0.133/k___jQ:user/release-keys PRIVATE_BUILD_DESC="D5503-user 4.4.4 14.4.A.0.133 k___jQ release-keys"

# Setup device specific product configuration.
PRODUCT_NAME := aicp_amami
PRODUCT_DEVICE := amami

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation.zip

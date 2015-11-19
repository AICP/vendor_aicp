# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/ha3g/full_ha3g.mk)


PRODUCT_NAME := aicp_ha3g
PRODUCT_DEVICE := ha3g

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=SM-N900 \
    PRODUCT_NAME=ha3gxx \
    PRODUCT_DEVICE=ha3g \
    TARGET_DEVICE=ha3g \

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Parikshit Wadhwa"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

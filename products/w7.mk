# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)
$(call inherit-product, vendor/aicp/configs/telephony.mk)
$(call inherit-product, vendor/aicp/configs/gsm.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/lge/w7/device.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 540
TARGET_SCREEN_HEIGHT := 960
-include vendor/aicp/configs/bootanimation.mk

# Release name
PRODUCT_RELEASE_NAME := LG L90
PRODUCT_NAME := aicp_w7
PRODUCT_MODEL := w7
PRODUCT_DEVICE := w7
PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := lge

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Moshe Bararsh (mosimchah)"

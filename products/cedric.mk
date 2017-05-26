# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/cedric/full_cedric.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# for specific
$(call inherit-product, vendor/motorola/cedric/cedric-vendor.mk)

# Inherit AICP common bits
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 1920
-include vendor/aicp/configs/bootanimation.mk

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := cedric
PRODUCT_NAME := aicp_cedric
PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Vedat Ak (Wzedlare), Kaan Külahlı (Rygebin)"

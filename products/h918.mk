# Inherit AICP common bits
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit AOSP device configuration for H815
$(call inherit-product, device/lge/h918/full_h918.mk)

# Setup device specific product configuration
PRODUCT_NAME := aicp_h918

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="v20" \
    PRODUCT_NAME="elsa_tmo_us" \
    BUILD_FINGERPRINT="lge/elsa_tmo_us/elsa:7.0/NRD90M/1625821141c30:user/release-keys" \
    PRIVATE_BUILD_DESC="elsa_tmo_us-user 7.0 NRD90M 1625821141c30 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Drgravy"

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440
-include vendor/aicp/configs/bootanimation.mk

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

$(call inherit-product, device/sony/castor_windy/aicp.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGP511 BUILD_FINGERPRINT=Sony/SGP511/SGP511:4.4.4/23.0.1.A.0.167/WP_3Rw:user/release-keys PRIVATE_BUILD_DESC="SGP511-user 4.4.4 23.0.1.A.0.167 WP_3Rw release-keys"

# Setup device specific product configuration.
PRODUCT_NAME := aicp_castor_windy
PRODUCT_DEVICE := castor_windy

# AICP Device Maintainer
PRODUCT_BUILD_PROP_OVERRIDES += \
        DEVICE_MAINTAINERS="SpiritCroc"

# Boot animation
TARGET_SCREEN_HEIGHT := 1200
TARGET_SCREEN_WIDTH := 1920
-include vendor/aicp/configs/bootanimation.mk

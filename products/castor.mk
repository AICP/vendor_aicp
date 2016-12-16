# Inherit CM common Phone stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

$(call inherit-product, device/sony/castor/aicp.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGP521 BUILD_FINGERPRINT=Sony/SGP521/SGP521:4.4.4/23.0.1.A.0.167/WP_3Rw:user/release-keys PRIVATE_BUILD_DESC="SGP521-user 4.4.4 23.0.1.A.0.167 WP_3Rw release-keys"

# Setup device specific product configuration.
PRODUCT_NAME := aicp_castor
PRODUCT_DEVICE := castor

# AICP Device Maintainer
PRODUCT_BUILD_PROP_OVERRIDES += \
        DEVICE_MAINTAINERS="SpiritCroc"

# Boot animation
TARGET_SCREEN_HEIGHT := 1200
TARGET_SCREEN_WIDTH := 1920
-include vendor/aicp/configs/bootanimation.mk

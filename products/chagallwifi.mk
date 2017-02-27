# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common_tablet.mk)

$(call inherit-product, device/samsung/chagallwifi/full_chagallwifi.mk)

PRODUCT_NAME := aicp_chagallwifi
PRODUCT_DEVICE := chagallwifi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=SM-T800 \
    PRODUCT_NAME=chagallwifi \
    PRODUCT_DEVICE=chagallwifi \
    TARGET_DEVICE=chagallwifi \

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
   DEVICE_MAINTAINERS="Darragh McGee (DarkExistence)"

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1600
-include vendor/aicp/configs/bootanimation.mk

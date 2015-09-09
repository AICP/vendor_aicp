# Inherit some common AICPstuff.
$(call inherit-product, vendor/aicp/configs/common_tablet.mk)

$(call inherit-product, device/samsung/klimtwifi/full_klimtwifi.mk)

PRODUCT_NAME := aicp_klimtwifi
PRODUCT_DEVICE := klimtwifi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=SM-T700 \
    PRODUCT_NAME=klimtwifi \
    PRODUCT_DEVICE=klimtwifi \
    TARGET_DEVICE=klimtwifi \

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Sean H (deadman96385)"

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1600
-include vendor/aicp/configs/bootanimation.mk

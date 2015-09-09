# Inherit some common stuff.
$(call inherit-product, vendor/aicp/configs/common_tablet.mk)

$(call inherit-product, device/samsung/klimtlte/full_klimtlte.mk)

PRODUCT_NAME := aicp_klimtlte
PRODUCT_DEVICE := klimtlte

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=SM-T705 \
    PRODUCT_NAME=klimtlte \
    PRODUCT_DEVICE=klimtlte \
    TARGET_DEVICE=klimtlte \

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Sean H (deadman96385)"

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1600
-include vendor/aicp/configs/bootanimation.mk

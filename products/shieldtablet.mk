# Inherit some common Tablet stuff.
$(call inherit-product, vendor/aicp/configs/common_full_phone.mk)

# Inherit device configuration for wx_na_wf.
$(call inherit-product, device/nvidia/shieldtablet/full_shieldtablet.mk)

PRODUCT_NAME := aicp_shieldtablet
PRODUCT_DEVICE := shieldtablet

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Trafalgar Square"

# Bootanimation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200
-include vendor/aicp/configs/bootanimation.mk

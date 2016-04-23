# Inherit device configuration for g2m
$(call inherit-product, device/lge/g2m/device_g2m.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Release name
PRODUCT_RELEASE_NAME := LG G2 Mini
PRODUCT_NAME := aicp_g2m
PRODUCT_MODEL := g2m
PRODUCT_DEVICE := g2m
PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := lge

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="MobiusM"

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
-include vendor/aicp/configs/bootanimation.mk

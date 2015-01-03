# Inherit device configuration
$(call inherit-product, device/lge/p930/full_p930.mk)

# Release name
PRODUCT_RELEASE_NAME := NitroHD

# Inherit GSM common stuff
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

DEVICE_PACKAGE_OVERLAYS += vendor/aicp/overlay/iprj-common

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p930
PRODUCT_NAME := aicp_p930
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-P930
PRODUCT_MANUFACTURER := LGE

# Set build fingerprint / ID / Product Name ect.
# PRODUCT_BUILD_PROP_OVERRIDES ...

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

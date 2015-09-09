$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m7spr/full_m7spr.mk)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=sprint_wwe \
    BUILD_ID=LRX22G \
    BUILD_FINGERPRINT="htc/sprint_wwe/m7wls:5.0.2/LRX22G/499067.6:user/release-keys" \
    PRIVATE_BUILD_DESC="6.23.651.2 CL499067 release-keys"

# Device naming
PRODUCT_DEVICE := m7spr
PRODUCT_NAME := aicp_m7spr
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC One
PRODUCT_MANUFACTURER := HTC

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Brian L (Chezbel), doc HD (semdoc)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk


# Release name
PRODUCT_RELEASE_NAME := flo

# Inherit some common stuff.
$(call inherit-product, vendor/aicp/configs/common_tablet.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/asus/flo/full_flo.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := flo
PRODUCT_NAME := aicp_flo
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus

PRODUCT_RESTRICT_VENDOR_FILES := false

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=razor \
    BUILD_FINGERPRINT=google/razor/flo:6.0.1/MMB29Q/2480792:user/release-keys \
    PRIVATE_BUILD_DESC="razor-user 6.0.1 MMB29Q 2480792 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Ali B (eyosen), doc HD (semdoc)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

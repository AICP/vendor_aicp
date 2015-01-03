$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m7spr/full_m7spr.mk)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m7wls BUILD_FINGERPRINT="htc/sprint_wwe/m7wls:4.4.2/KOT49H/337390.3:user/release-keys" PRIVATE_BUILD_DESC="5.03.651.3 CL337390 release-keys"

# Device naming
PRODUCT_DEVICE := m7spr
PRODUCT_NAME := aicp_m7spr
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC One
PRODUCT_MANUFACTURER := HTC

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation.zip

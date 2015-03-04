# Inherit from our custom product configuration
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/i9305/full_i9305.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m3xx TARGET_DEVICE=m3 BUILD_FINGERPRINT="samsung/m3xx/m3:4.1.2/JZO54K/I9305XXBMA6:user/release-keys" PRIVATE_BUILD_DESC="m3xx-user 4.1.2 JZO54K I9305XXBMA6 release-keys"

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := i9305
PRODUCT_NAME := aicp_i9305
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-I9305
PRODUCT_MANUFACTURER := samsung

# Inherit AICP common Phone stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/sony/sirius/full_sirius.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D6503 \
                                BUILD_FINGERPRINT=Sony/D6503/D6503:5.0.2/23.1.A.0.690/814068233:user/release-keys \
                                PRIVATE_BUILD_DESC="D6503-user 5.0.2 23.1.A.0.690 814068233 release-keys"

# Device identifier. This must come after all inclusions
PRODUCT_NAME := aicp_sirius
PRODUCT_DEVICE := sirius

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

# Inherit device configuration
$(call inherit-product, device/sony/sirius/full_sirius.mk)

# Specify phone tech before including full_phone
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit AICP common Phone stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Release name
PRODUCT_RELEASE_NAME := sirius

# Device identifier. This must come after all inclusions
PRODUCT_NAME := aicp_sirius
PRODUCT_DEVICE := sirius

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D6503 BUILD_FINGERPRINT=Sony/D6503/D6503:4.4.2/17.1.1.A.0.402/bf53dw:user/release-keys PRIVATE_BUILD_DESC="D6503-user 4.4.2 17.1.1.A.0.402 bf53dw release-keys"

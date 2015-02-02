# Inherit CM common Phone stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/sony/togari/full_togari.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6833 BUILD_FINGERPRINT=Sony/C6833/C6833:4.4.4/14.4.A.0.157/ev__jQ:user/release-keys PRIVATE_BUILD_DESC="C6833-user 4.4.4 14.4.A.0.157 ev__jQ release-keys"

# Setup device specific product configuration.
PRODUCT_NAME := aicp_togari
PRODUCT_DEVICE := togari

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

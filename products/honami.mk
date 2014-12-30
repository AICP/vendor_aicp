# Inherit CM common Phone stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/sony/honami/full_honami.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6903 BUILD_FINGERPRINT=Sony/C6903/C6903:4.4.4/14.4.A.0.133/ev__jQ:user/release-keys PRIVATE_BUILD_DESC="C6903-user 4.4.4 14.4.A.0.133 ev__jQ release-keys"

# Setup device specific product configuration.
PRODUCT_NAME := aicp_honami
PRODUCT_DEVICE := honami

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

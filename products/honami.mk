# Inherit CM common Phone stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/sony/honami/aicp.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6903
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=Sony/C6903/C6903:5.0.2/14.5.A.0.270/3750474323:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="C6903-user 5.0.2 14.5.A.0.270 3750474323 release-keys"

# Setup device specific product configuration.
PRODUCT_NAME := aicp_honami
PRODUCT_DEVICE := honami

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

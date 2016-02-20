# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/htc/himaul/full_himaul.mk)

PRODUCT_NAME := aicp_himaul

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="htc_himaulatt" \
    PRODUCT_NAME="himaulatt_na_gen_unlock" \
    BUILD_FINGERPRINT="htc/himaulatt_na_gen_unlock/htc_himaulatt:6.0/MRA58K/669696.12:user/release-keys" \
    PRIVATE_BUILD_DESC="3.35.617.12 CL669696 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Ali B (eyosen), Brian L (chezbel)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

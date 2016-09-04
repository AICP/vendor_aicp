# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

$(call inherit-product, device/htc/pme/full_pme.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := pme
PRODUCT_NAME := aicp_pme
PRODUCT_BRAND := HTC
PRODUCT_MODEL := HTC 10
PRODUCT_MANUFACTURER := HTC
PRODUCT_RELEASE_NAME := pme

TARGET_VENDOR := htc

# Device fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="htc_pmewl" \
    PRODUCT_NAME="pmewl_00531" \
    BUILD_FINGERPRINT="htc/pmewl_00531/htc_pmewl:6.0.1/MMB29M/770927.1:user/release-keys" \
    PRIVATE_BUILD_DESC="1.81.531.1 8.0_g CL770927 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Ali B (eyosen)"

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440
-include vendor/aicp/configs/bootanimation.mk

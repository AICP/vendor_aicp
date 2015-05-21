# Inherit AICP common bits
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit AOSP device configuration for hammerhead
$(call inherit-product, device/lge/hammerheadcaf/full_hammerhead.mk)


# Setup device specific product configuration
PRODUCT_DEVICE := hammerheadcaf
PRODUCT_NAME := aicp_hammerheadcaf
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5 CAF
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=hammerhead \
    BUILD_FINGERPRINT=google/hammerhead/hammerhead:5.1.1/LMY48B/1863243:user/release-keys \
    PRIVATE_BUILD_DESC="hammerhead-user 5.1.1 LMY48B 1863243 release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

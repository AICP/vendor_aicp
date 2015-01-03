# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit AOSP device configuration for i9300.
$(call inherit-product, device/samsung/i9300/full_i9300.mk)


# Setup device specific product configuration.
PRODUCT_NAME := aicp_i9300
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := i9300
PRODUCT_MODEL := GT-I9300
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m0xx TARGET_DEVICE=m0 BUILD_FINGERPRINT="samsung/m0xx/m0:4.3/JSS15J/I9300XXUGMJ9:user/release-keys" PRIVATE_BUILD_DESC="m0xx-user 4.3 JSS15J I9300XXUGMJ9 release-keys"
PRODUCT_RELEASE_NAME := GT-I9300

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

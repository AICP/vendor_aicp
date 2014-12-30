# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit AOSP device configuration for l900.
$(call inherit-product, device/samsung/l900/full_l900.mk)


# Setup device specific product configuration.
PRODUCT_NAME := aicp_l900
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := l900
PRODUCT_MODEL := SPH-L900
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=t0ltespr TARGET_DEVICE=t0ltespr BUILD_FINGERPRINT="samsung/t0ltespr/t0ltespr:4.3/JSS15J/L900VPUBMK4:user/release-keys" PRIVATE_BUILD_DESC="t0ltespr-user 4.3 JSS15J L900VPUBMK4 release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

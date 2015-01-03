# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit AOSP device configuration for hercules.
$(call inherit-product, device/samsung/hercules/full_hercules.mk)


# Setup device specific product configuration.
PRODUCT_NAME := aicp_hercules
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := hercules
PRODUCT_MODEL := SGH-T989
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-T989 TARGET_DEVICE=SGH-T989 BUILD_FINGERPRINT="samsung/SGH-T989/SGH-T989:4.3/JZO54K/T989UVMC6:user/release-keys" PRIVATE_BUILD_DESC="SGH-T989-user 4.3 IMM76D UVMC6 release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
-include vendor/aicp/configs/bootanimation.mk

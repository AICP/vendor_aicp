# Inherit AOSP device configuration for xt1060
$(call inherit-product, device/motorola/xt1060/full_xt1060.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/aicp/configs/cdma.mk)

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/aicp/configs/vzw.mk)

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit common jf overlays
DEVICE_PACKAGE_OVERLAYS += vendor/aicp/overlay/ghost

# Setup device specific product configuration.
PRODUCT_NAME := aicp_xt1060
PRODUCT_BRAND := verizon
PRODUCT_DEVICE := xt1060
PRODUCT_MODEL := XT1060
PRODUCT_MANUFACTURER := motorola
PRODUCT_RELEASE_NAME := Moto X

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=ghost TARGET_DEVICE=XT1060 BUILD_FINGERPRINT="motorola/ghost_verizon/ghost:4.2.2/13.9.0Q2.X-116-MX-17-53/5:user/release-keys" PRIVATE_BUILD_DESC="ghost-user 4.2.2 13.9.0Q2.X-116-MX-17-53 release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

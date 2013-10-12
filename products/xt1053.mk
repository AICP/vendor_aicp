# Inherit AOSP device configuration for xt1053
$(call inherit-product, device/motorola/xt1053/full_xt1053.mk)

# Inherit common gsm config
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit common ghost overlays
DEVICE_PACKAGE_OVERLAYS += vendor/aokp/overlay/ghost

# Setup device specific product configuration.
PRODUCT_NAME := aokp_xt1053
PRODUCT_BRAND := T-Mobile
PRODUCT_DEVICE := xt1053
PRODUCT_MODEL := XT1053
PRODUCT_MANUFACTURER := motorola
PRODUCT_RELEASE_NAME := Moto X

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=ghost TARGET_DEVICE=XT1053 BUILD_FINGERPRINT="motorola/ghost_retail/ghost:4.3/13.10.0Q2.X_25/15:userdebug/intcfg,test-keys" PRIVATE_BUILD_DESC="ghost_retail-userdebug 4.3 13.10.0Q2.X_25 15 intcfg,test-keys"

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip

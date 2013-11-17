# Inherit AOSP device configuration for dogo
$(call inherit-product-if-exists, device/sony/dogo/full_dogo.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# hayabusa overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/dogo

# Setup device specific product configuration.
PRODUCT_NAME := aokp_dogo
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := dogo
PRODUCT_MODEL := Xperia ZR
PRODUCT_MANUFACTURER := Sony

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C5503 BUILD_FINGERPRINT=Sony/C5503_1270-6697/C5503:4.2.2/10.3.A.0.423/WP5_rg:user/release-keys PRIVATE_BUILD_DESC="C5503-user 4.2.2 10.3.A.0.423 WP5_rg test-keys"

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip

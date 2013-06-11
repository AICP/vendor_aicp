$(call inherit-product, device/samsung/jfltetmo/full_jfltetmo.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aokp/configs/common.mk)
$(call inherit-product, vendor/aokp/configs/common_versions.mk)

# Inherit common jf overlays
DEVICE_PACKAGE_OVERLAYS += vendor/aokp/overlay/jf-common

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jfltetmo TARGET_DEVICE=jfltetmo BUILD_FINGERPRINT="samsung/jfltetmo/jfltetmo:4.2.2/JDQ39/M919UVUAMDB:user/release-keys" PRIVATE_BUILD_DESC="jfltetmo-user 4.2.2 JDQ39 M919UVUAMDB release-keys"

PRODUCT_NAME := aokp_jfltetmo
PRODUCT_DEVICE := jfltetmo

#bootanimation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

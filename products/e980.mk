# Inherit AOSP device configuration for device
$(call inherit-product, device/lge/e980/full_e980.mk)

# Inherit AOSP device configuration
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/e980

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := e980
PRODUCT_NAME := aokp_e980
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-E980
PRODUCT_MANUFACTURER := LGE

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=geefhd_open_eu BUILD_FINGERPRINT=lge/geefhd_open_eu/geefhd:4.1.2/JZO54K/E98610b.1373081564:user/release-keys PRIVATE_BUILD_DESC="geefhd_open_eu-user 4.1.2 JZO54K E98610b.1373081564 release-keys"

# Inherit AOSP device configuration for grouper
$(call inherit-product, device/asus/grouper/full_grouper.mk)

# Inherit AICP common_tablet bits
$(call inherit-product, vendor/aicp/configs/common_tablet.mk)

# Grouper Overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/grouper

# Setup device specific product configuration.
PRODUCT_NAME := aicp_grouper
PRODUCT_BRAND := google
PRODUCT_DEVICE := grouper
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := asus

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=nakasi BUILD_FINGERPRINT=google/nakasi/grouper:4.3/JWR66V/573038:user/release-keys PRIVATE_BUILD_DESC="nakasi-user 4.3 JWR66V 573038 release-keys" BUILD_NUMBER=573038

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1280_800.zip:system/media/bootanimation-alt.zip

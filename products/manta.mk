# Inherit AOSP device configuration for mako
$(call inherit-product, device/samsung/manta/full_manta.mk)

# Inherit AICP common bits
$(call inherit-product, vendor/aicp/configs/common.mk)

# Manta Overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/manta

# Setup device specific product configuration
PRODUCT_NAME := aicp_manta
PRODUCT_BRAND := google
PRODUCT_DEVICE := manta
PRODUCT_MODEL := Nexus 10
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=mantaray BUILD_FINGERPRINT=google/mantaray/manta:4.3/JWR66V/737497:user/release-keys PRIVATE_BUILD_DESC="mantaray-user 4.3 JWR66V 737497 release-keys" BUILD_NUMBER=737497

PRODUCT_COPY_FILES +=  \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1280_800.zip:system/media/bootanimation-alt.zip

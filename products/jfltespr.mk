# Inherit AOSP device configuration for jfltespr
$(call inherit-product, device/samsung/jfltespr/full_jfltespr.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/aokp/configs/cdma.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit common jf overlays
#DEVICE_PACKAGE_OVERLAYS += vendor/aokp/overlay/jf-common

# Setup device specific product configuration.
PRODUCT_NAME := aokp_jfltespr
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := jfltespr
PRODUCT_MODEL := SPH-L720
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jfltespr TARGET_DEVICE=jfltespr BUILD_FINGERPRINT="samsung/jfltespr/jfltespr:4.2.2/JDQ39/L720VPUAMF9:user/release-keys" PRIVATE_BUILD_DESC="jfltespr-user 4.2.2 JDQ39 L720VPUAMF9 release-keys"

# boot animation
PRODUCT_COPY_FILES += \
       vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

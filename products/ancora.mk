# Inherit AICP common stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit device configuration for ancora
$(call inherit-product, device/samsung/ancora/full_ancora.mk)

# ancora overlay
PRODUCT_PACKAGE_OVERLAYS += device/samsung/ancora/overlay

# boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
-include vendor/aicp/configs/bootanimation.mk

# This device is hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_RELEASE_NAME := ancora

# Setup device configuration
PRODUCT_NAME := aicp_ancora
PRODUCT_DEVICE := ancora
PRODUCT_BRAND := Samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_MODEL := GT-I8150

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=samsung/GT-I8150/GT-I8150:2.3.6/GINGERBREAD/XXLMJ:user/release-keys PRIVATE_BUILD_DESC="GT-I8150-user 2.3.6 GINGERBREAD XXLMJ release-keys"

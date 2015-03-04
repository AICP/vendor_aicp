# Inherit AICP common stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit device configuration for ariesve
$(call inherit-product, device/samsung/ariesve/full_ariesve.mk)

# ariesve overlay
PRODUCT_PACKAGE_OVERLAYS += device/samsung/ariesve/overlay

# boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
-include vendor/aicp/configs/bootanimation.mk

# This device is hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_RELEASE_NAME := ariesve

# Setup device configuration
PRODUCT_NAME := aicp_ariesve
PRODUCT_DEVICE := ariesve
PRODUCT_BRAND := Samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_MODEL := GT-I9001

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=samsung/GT-I9001/GT-I9001:2.3.6/GINGERBREAD/XXKQN:user/release-keys PRIVATE_BUILD_DESC="GT-I9001-user 2.3.6 GINGERBREAD XXKQN release-keys"

# Unofficial build name
TARGET_UNOFFICIAL_BUILD_ID := dev_connection_team

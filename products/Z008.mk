# Inherit some common CM stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit device configuration
$(call inherit-product, device/asus/Z008/device.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/Z008/overlay

PRODUCT_RUNTIMES := runtime_libart_default

## Device identifier. This must come after all inclusions
PRODUCT_NAME := aicp_Z008
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_Z008
PRODUCT_MANUFACTURER := asus
PRODUCT_DEVICE := Z008

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=WW_Z008 \
    BUILD_FINGERPRINT=asus/WW_Z008/Z008:5.0/LRX21V/2.20.40.138_20160107_6192_user:user/release-keys \
    PRIVATE_BUILD_DESC="asusmofd_hd-user 5.0 LRX21V 2.20.40.138_20160107_6192_user release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
        DEVICE_MAINTAINERS="Hakan (Nyks45)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

$(call inherit-product, device/xiaomi/lithium/full_lithium.mk)

# Inherit some common LineageOS stuff.
 $(call inherit-product, vendor/aicp/configs/common.mk)
#
# # Inherit telephony stuff
 $(call inherit-product, vendor/aicp/configs/telephony.mk)

 PRODUCT_NAME := aicp_lithium
 PRODUCT_DEVICE := lithium
 PRODUCT_BRAND := Xiaomi
 PRODUCT_MODEL := MI MIX
 PRODUCT_MANUFACTURER := Xiaomi

 PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

 PRODUCT_BUILD_PROP_OVERRIDES += \
             TARGET_DEVICE="lithium" \
             PRODUCT_NAME="lithium" \
             BUILD_FINGERPRINT="Xiaomi/lithium/lithium:6.0.1/MXB48T/V8.2.4.0.MAHMIDL:user/release-keys" \
             PRIVATE_BUILD_DESC="lithium-user 6.0.1 MXB48T V8.2.4.0.MAHMIDL release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Erwan Leboucher (genesixxbf3) "

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk
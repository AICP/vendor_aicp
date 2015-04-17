# Inherit AICP device configuration for huashan
$(call inherit-product-if-exists, device/sony/huashan/aicp.mk)

# Inherit AICP common bits
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit AOSP device configuration for huashan
$(call inherit-product, device/sony/huashan/full_huashan.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C5303 BUILD_FINGERPRINT=Sony/C5303/C5303:5.12.1.A.0.266/9f5_nw:user/release-keys PRIVATE_BUILD_DESC="C5303-user 5.1 JB-MR2-VISKAN-CAF-140119-1358 30 test-keys"


# huashan overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/huashan

# Setup device specific product configuration.
PRODUCT_NAME := aicp_huashan
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := huashan
PRODUCT_MODEL := Xperia SP
PRODUCT_MANUFACTURER := Sony

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

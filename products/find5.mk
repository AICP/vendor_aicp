# Inherit AOSP device configuration for find5
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit AOSP device configuration for d2att.
$(call inherit-product, device/oppo/find5/full_find5.mk)


# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := find5
PRODUCT_NAME := aicp_find5
PRODUCT_BRAND := Oppo
PRODUCT_MODEL := Find 5
PRODUCT_MANUFACTURER := Oppo

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=find5 BUILD_FINGERPRINT=OPPO/oppo_12069/FIND5:4.1.1/JRO03L/1362469752:user/release-keys PRIVATE_BUILD_DESC="msm8960-user 4.1.1 JRO03L eng.oppo.20130328.172033 release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

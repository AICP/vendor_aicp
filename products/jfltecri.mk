# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit AOSP device configuration for jfltecri
$(call inherit-product, device/samsung/jfltecri/full_jfltecri.mk)


PRODUCT_NAME := aicp_jfltecri
PRODUCT_DEVICE := jfltecri
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SCH-R970C
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jfltecri TARGET_DEVICE=jfltecri BUILD_FINGERPRINT="samsung/jfltecri/jfltecri:4.2.2/JDQ39/R970CVVUAME4:user/release-keys" PRIVATE_BUILD_DESC="jfltecri-user 4.2.2 JDQ39 R970CVVUAME4 release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit AOSP device configuration for jflteusc
$(call inherit-product, device/samsung/jflteusc/full_jflteusc.mk)


# Setup device specific product configuration.
PRODUCT_NAME := aicp_jflteusc
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := jflteusc
PRODUCT_MODEL := SCH-R970
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jflteusc TARGET_DEVICE=jflteusc BUILD_FINGERPRINT="samsung/jflteusc/jflteusc:4.2.2/JDQ39/R970VXUAMDB:user/release-keys" PRIVATE_BUILD_DESC="jflteusc-user 4.2.2 JDQ39 R970VXUAMDB release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

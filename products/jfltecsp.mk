# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit AOSP device configuration for jfltecsp
$(call inherit-product, device/samsung/jfltecsp/full_jfltecsp.mk)


# Setup device specific product configuration.
PRODUCT_NAME := aicp_jfltecsp
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := jfltecsp
PRODUCT_MODEL := SCH-R970X
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jfltecsp TARGET_DEVICE=jflteusc BUILD_FINGERPRINT="samsung/jfltecsp/jfltecsp:4.2.2/JDQ39/R970XWWUAMFA:user/release-keys" PRIVATE_BUILD_DESC="jfltecsp-user 4.2.2 JDQ39 R970XWWUAMFA release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

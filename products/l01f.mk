# Inherit AICP common bits
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit device configuration
$(call inherit-product, device/lge/l01f/l01f.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := l01f
PRODUCT_NAME := aicp_l01f
PRODUCT_BRAND := LGE
PRODUCT_MODEL := L-01F
PRODUCT_MANUFACTURER := lge

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=lge/g2_dcm_jp/g2:4.2.2/JDQ39B/L01F11k.1386142206:user/release-keys \
    PRIVATE_BUILD_DESC="g2_dcm_jp-user 4.2.2 JDQ39B L01F11k.1386142206 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Izumi Inami (droidfivex)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

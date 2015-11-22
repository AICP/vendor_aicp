$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/d2att/full_d2att.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=d2uc \
    TARGET_DEVICE=d2att \
    BUILD_FINGERPRINT="samsung/d2uc/d2att:4.4.2/KOT49H/I747UCUFNJ1:user/release-keys" \
    PRIVATE_BUILD_DESC="d2uc-user 4.4.2 KOT49H I747UCUFNJ1 release-keys"

PRODUCT_NAME := aicp_d2att
PRODUCT_DEVICE := d2att
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

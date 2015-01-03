$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/jfltespr/full_jfltespr.mk)


PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=jfltespr \
    TARGET_DEVICE=jfltespr \
    BUILD_FINGERPRINT="samsung/jfltespr/jfltespr:4.4.2/KOT49H/L720VPUFNG2:user/release-keys" \
    PRIVATE_BUILD_DESC="jfltespr-user 4.4.2 KOT49H L720VPUFNG2 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_NAME := aicp_jfltespr
PRODUCT_DEVICE := jfltespr

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

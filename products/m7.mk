$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/htc/m7/full_m7.mk)


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=KTU84L.H4 BUILD_FINGERPRINT="htc/m7_google/m7:4.4.3/KTU84L.H4/347097:user/release-keys" PRIVATE_BUILD_DESC="4.07.1700.4 CL347097 release-keys"

PRODUCT_NAME := aicp_m7
PRODUCT_DEVICE := m7

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080


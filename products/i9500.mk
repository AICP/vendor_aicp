$(call inherit-product, device/samsung/i9500/full_i9500.mk)

# Inherit some common AICP stuff
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)


PRODUCT_NAME := aicp_i9500
PRODUCT_DEVICE := i9500

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=ja3gxx TARGET_DEVICE=ja3g BUILD_FINGERPRINT="samsung/ja3gxx/ja3g:4.3/JSS15J/I9500XXUEMK8:user/release-keys" PRIVATE_BUILD_DESC="ja3gxx-user 4.3 JSS15J I9500XXUEMK8 release-keys"

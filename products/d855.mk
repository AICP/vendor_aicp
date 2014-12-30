# Inherit AICP common bits
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit AOSP device configuration for d855
$(call inherit-product, device/lge/d855/full_d855.mk)


## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d855
PRODUCT_NAME := aicp_d855
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D855
PRODUCT_MANUFACTURER := lge

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="g3" \
    PRODUCT_NAME="g3_global_com" \
    BUILD_FINGERPRINT="lge/g3_global_com/g3:4.4.2/KVT49L.A1404795316/1404795316:user/release-keys" \
    PRIVATE_BUILD_DESC="g3_global_com-user 4.4.2 KVT49L.A1404795316 1404795316 release-keys"

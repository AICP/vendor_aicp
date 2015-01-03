# Inherit AICP common bits
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit AOSP device configuration for d852
$(call inherit-product, device/lge/d852/full_d852.mk)


## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d852
PRODUCT_NAME := aicp_d852
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D852
PRODUCT_MANUFACTURER := lge

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="g3" \
    PRODUCT_NAME="g3_bell_ca" \
    BUILD_FINGERPRINT="lge/g3_bell_ca/g3:4.4.2/KVT49L.D85210b/D85210b.1405397224:user/release-keys" \
    PRIVATE_BUILD_DESC="g3_bell_ca-user 4.4.2 KVT49L.D85210b D85210b.1405397224 release-keys"

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1440_2560.zip:system/media/bootanimation.zip

$(call inherit-product, device/oneplus/bacon/full_bacon.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# Inherit some common AOKP stuff
$(call inherit-product, vendor/aicp/configs/common.mk)

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/bacon

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := bacon
PRODUCT_NAME := aicp_bacon

PRODUCT_BUILD_PROP_OVERRIDES += \
        BUILD_FINGERPRINT=oneplus/bacon/A0001:4.4.2/KVT49L/XNPH25R:user/release-keys \
        PRIVATE_BUILD_DESC="bacon-user 4.4.2 KVT49L XNPH25R release-keys"
$(call inherit-product, device/oneplus/bacon/full_bacon.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# Inherit some common AOKP stuff
$(call inherit-product, vendor/aicp/configs/common.mk)

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/bacon

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := bacon
PRODUCT_NAME := aicp_bacon
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := One

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BRAND := oneplus
TARGET_VENDOR_PRODUCT_NAME := bacon
TARGET_VENDOR_DEVICE_NAME := A0001
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=A0001

TARGET_CONTINUOUS_SPLASH_ENABLED := true

PRODUCT_BUILD_PROP_OVERRIDES += \
        BUILD_FINGERPRINT=oneplus/bacon/A0001:4.4.2/KVT49L/XNPH25R:user/release-keys \
        PRIVATE_BUILD_DESC="bacon-user 4.4.2 KVT49L XNPH25R release-keys"
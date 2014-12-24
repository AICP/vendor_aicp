$(call inherit-product, device/oppo/find7s/full_find7s.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# Inherit some common AOKP stuff
$(call inherit-product, vendor/aicp/configs/common.mk)

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/find7

# Inline kernel
TARGET_KERNEL_SOURCE := kernel/oppo/find7
TARGET_KERNEL_CONFIG := custom_find7_defconfig

PRODUCT_NAME := aicp_find7s
PRODUCT_DEVICE := find7
PRODUCT_BRAND := Oppo
PRODUCT_MODEL := Find7
PRODUCT_MANUFACTURER := Oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=4.4.2/KVT49L/1390465867:user/release-keys \
    PRIVATE_BUILD_DESC="msm8974-user 4.4.2 KVT49L eng.root.20141017.144947 release-keys"

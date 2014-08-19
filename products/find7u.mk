$(call inherit-product, device/oppo/find7u/full_find7u.mk)

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

PRODUCT_NAME := aicp_find7u
PRODUCT_DEVICE := find7u
PRODUCT_BRAND := Oppo
PRODUCT_MODEL := Find7
PRODUCT_MANUFACTURER := Oppo

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=4.3/JLS36C/1390381364:user/release-keys PRIVATE_BUILD_DESC="msm8974-user 4.3 JLS36C eng.root.20140122.170107 release-keys"



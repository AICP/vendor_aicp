# Inherit AOSP device configuration for galaxys2.
$(call inherit-product, device/samsung/n7000/full_n7000.mk)

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# SGS2 overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/n7000

# Setup device specific product configuration.
PRODUCT_DEVICE := n7000
PRODUCT_NAME := aicp_n7000
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := GT-n7000

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-n7000 TARGET_DEVICE=GT-n7000 BUILD_FINGERPRINT=samsung/GT-n7000/GT-n7000:4.1.2/JZO54K/XXLPQ:user/release-keys PRIVATE_BUILD_DESC="GT-n7000-user 4.1.2 JZO54K XXLPQ release-keys"
PRODUCT_RELEASE_NAME := GT-n7000

# Copy n7000 specific prebuilt files
PRODUCT_PACKAGES += \
    Thinkfree

PRODUCT_COPY_FILES += \
   vendor/aicp/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation-alt.zip


# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit AOSP device configuration for galaxys2.
$(call inherit-product, device/samsung/n7000/full_n7000.mk)


# Setup device specific product configuration.
PRODUCT_DEVICE := n7000
PRODUCT_NAME := aicp_n7000
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := GT-N7000

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-N7000 TARGET_DEVICE=GT-N7000 BUILD_FINGERPRINT=samsung/GT-N7000/GT-N7000:4.0.3/IML74K/ZCLP6:user/release-keys PRIVATE_BUILD_DESC="GT-N7000-user 4.0.3 IML74K ZCLP6 release-keys"
PRODUCT_RELEASE_NAME := GT-N7000

# Copy n7000 specific prebuilt files
PRODUCT_PACKAGES += \
    Thinkfree

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720


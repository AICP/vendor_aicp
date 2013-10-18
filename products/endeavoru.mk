# Release name
PRODUCT_RELEASE_NAME := endeavoru

TARGET_BOOTANIMATION_NAME := vertical-720x1280

# Inherit some common CM stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit device configuration
$(call inherit-product, device/htc/endeavoru/full_endeavoru.mk)

# Endeavoru overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/endeavoru

# Device naming
PRODUCT_DEVICE := endeavoru
PRODUCT_NAME := aicp_endeavoru
PRODUCT_BRAND := htc
PRODUCT_MODEL := One X
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=endeavoru TARGET_DEVICE=endeavoru BUILD_FINGERPRINT="htc_europe/endeavoru/endeavoru:4.1.1/JRO03C/128187.31:user/release-keys" PRIVATE_BUILD_DESC="3.14.401.31 CL128187 release-keys"

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip

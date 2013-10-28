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
PRODUCT_MODEL := EndeavorU
PRODUCT_MANUFACTURER := HTC

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=htc_europe \
    TARGET_DEVICE=endeavoru \
    BUILD_FINGERPRINT="htc/htc_europe/endeavoru:4.2.2/JDQ39/231174.2:user/release-keys" \
    PRIVATE_BUILD_DESC="4.18.401.2 CL231174 release-keys"

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip

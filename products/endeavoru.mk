# Specify phone tech before including full_phone
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := endeavoru

TARGET_BOOTANIMATION_NAME := vertical-720x1280

# Inherit some common CM stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit device configuration
$(call inherit-product, device/htc/endeavoru/full_endeavoru.mk)

# Device naming
PRODUCT_DEVICE := endeavoru
PRODUCT_NAME := aicp_endeavoru
PRODUCT_BRAND := htc
PRODUCT_MODEL := One X
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=htc_endeavoru \
	BUILD_FINGERPRINT="htc/htc_europe/endeavoru:4.2.2/JDQ39/231174.2:user/release-keys" \
	PRIVATE_BUILD_DESC="4.18.401.2 CL231174 release-keys"


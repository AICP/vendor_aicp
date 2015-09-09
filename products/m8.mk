# Inherit some common stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/htc/m8/full_m8.mk)

$(call inherit-product-if-exists, vendor/htc/m8/m8-vendor.mk)

PRODUCT_NAME := aicp_m8
PRODUCT_BRAND := google
PRODUCT_DEVICE := m8
PRODUCT_MODEL := HTC One m8
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += \
       BUILD_ID=KOT49H BUILD_FINGERPRINT="htc/htc_europe/htc_m8:4.4.2/KOT49H/325784.5:user/release-keys" \
       PRIVATE_BUILD_DESC="1.54.401.5 CL325784 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="doc HD (semdoc), Davor B (LorD CloCKaN)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

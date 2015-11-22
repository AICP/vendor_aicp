$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/htc/m7/full_m7.mk)


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=LRX22C.H3 BUILD_FINGERPRINT="htc/m7_google/m7:5.0.1/LRX22C.H3/434277:user/release-keys" PRIVATE_BUILD_DESC="5.11.1700.3 CL434277 release-keys"

PRODUCT_NAME := aicp_m7
PRODUCT_DEVICE := m7

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Brian L (Chezbel), doc HD (semdoc)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

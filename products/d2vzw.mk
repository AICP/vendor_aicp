$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/d2vzw/full_d2vzw.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=d2vzw \
    TARGET_DEVICE=d2vzw \
    BUILD_FINGERPRINT="Verizon/d2vzw/d2vzw:4.4.2/KOT49H/I535VRUDNE1:user/release-keys" \
    PRIVATE_BUILD_DESC="d2vzw-user 4.4.2 KOT49H I535VRUDNE1 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="doc HD (semdoc)"

PRODUCT_NAME := aicp_d2vzw
PRODUCT_DEVICE := d2vzw
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

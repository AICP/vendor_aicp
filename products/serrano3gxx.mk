# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit AOSP device configuration for serrano3gxx.
$(call inherit-product, device/samsung/serrano3gxx/full_serrano3gxx.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=serrano3gxx \
    TARGET_DEVICE=serrano3g \
    BUILD_FINGERPRINT="samsung/serrano3gxx/serrano3g:4.4.2/KOT49H/I9190XXUCNG1:user/release-keys" \
    PRIVATE_BUILD_DESC="serrano3gxx-user 4.4.2 KOT49H I9190XXUCNG1 release-keys"

PRODUCT_DEVICE := serrano3gxx
PRODUCT_NAME := aicp_serrano3gxx

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="doc HD (semdoc)"

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
-include vendor/aicp/configs/bootanimation.mk

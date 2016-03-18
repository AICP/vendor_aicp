# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit AOSP device configuration for serranodsxx.
$(call inherit-product, device/samsung/serranodsxx/full_serranodsxx.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=serranodsxx \
    TARGET_DEVICE=serranods \
    BUILD_FINGERPRINT="samsung/serranodsxx/serranods:4.4.2/KOT49H/I9192XXUCNG2:user/release-keys" \
    PRIVATE_BUILD_DESC="serranodsxx-user 4.4.2 KOT49H I9192XXUCNG2 release-keys"

PRODUCT_DEVICE := serranodsxx
PRODUCT_NAME := aicp_serranodsxx

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Silviu Avram (Silviumik)"

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
-include vendor/aicp/configs/bootanimation.mk

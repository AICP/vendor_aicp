# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit AOSP device configuration for serranodsdd.
$(call inherit-product, device/samsung/serranodsdd/full_serranodsdd.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=serranodsxx TARGET_DEVICE=serranods BUILD_FINGERPRINT="samsung/serranodsxx/serranods:4.4.2/KOT49H/I9192XXUCNG2:user/release-keys" PRIVATE_BUILD_DESC="serranodsxx-user 4.4.2 KOT49H I9192XXUCNG2 release-keys"

PRODUCT_DEVICE := serranodsdd
PRODUCT_NAME := aicp_serranodsdd

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Silviu Avram (Silviumik)"

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
-include vendor/aicp/configs/bootanimation.mk

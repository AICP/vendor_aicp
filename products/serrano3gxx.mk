# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit AOSP device configuration for serrano3gxx.
$(call inherit-product, device/samsung/serrano3gxx/full_serrano3gxx.mk)


PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=serrano3gxx TARGET_DEVICE=serrano3g BUILD_FINGERPRINT="samsung/serrano3gxx/serrano3g:4.4.2/KOT49H/I9190XXUCNG1:user/release-keys" PRIVATE_BUILD_DESC="serrano3gxx-user 4.4.2 KOT49H I9190XXUCNG1 release-keys"

# Setup device specific product configuration.
PRODUCT_NAME := aicp_serrano3gxx
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := serrano3gxx
PRODUCT_MODEL := GT-I9190
PRODUCT_MANUFACTURER := samsung

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
-include vendor/aicp/configs/bootanimation.mk

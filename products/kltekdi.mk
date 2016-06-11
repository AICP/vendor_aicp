$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

$(call inherit-product, device/samsung/kltekdi/full_kltekdi.mk)

PRODUCT_DEVICE := kltekdi
PRODUCT_NAME := aicp_kltekdi

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
        DEVICE_MAINTAINERS="Alex S (OptX), doc HD (semdoc)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

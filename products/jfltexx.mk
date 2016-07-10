# Inherit some common stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)


$(call inherit-product, device/samsung/jfltexx/full_jfltexx.mk)


PRODUCT_BUILD_PROP_OVERRIDES += \
  PRODUCT_NAME=jfltexx \
  TARGET_DEVICE=jfltexx \
  BUILD_FINGERPRINT=samsung/jfltexx/jflte:5.0.1/LRX22C/I9505XXUHOJ2:user/release-keys \
  PRIVATE_BUILD_DESC="jfltexx-user 5.0.1 LRX22C I9505XXUHOJ2 release-keys"

PRODUCT_NAME := aicp_jfltexx
PRODUCT_DEVICE := jfltexx

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
  DEVICE_MAINTAINERS="doc HD (semdoc)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

# Inherit some common stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)


$(call inherit-product, device/samsung/jfltexx/full_jfltexx.mk)


PRODUCT_BUILD_PROP_OVERRIDES += \
  PRODUCT_NAME=jfltexx \
  TARGET_DEVICE=jfltexx \
  BUILD_FINGERPRINT="samsung/jfltexx/jflte:4.2.2/JDQ39/I9505XXUAMDE:user/release-keys" \
  PRIVATE_BUILD_DESC="jfltexx-user 4.2.2 JDQ39 I9505XXUAMDE release-keys"

PRODUCT_NAME := aicp_jfltexx
PRODUCT_DEVICE := jfltexx

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080


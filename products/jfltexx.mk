$(call inherit-product, device/samsung/jfltexx/full_jfltexx.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
  PRODUCT_NAME=jfltexx \
  TARGET_DEVICE=jfltexx \
  BUILD_FINGERPRINT="samsung/jfltexx/jflte:4.2.2/JDQ39/I9505XXUAMDE:user/release-keys" \
  PRIVATE_BUILD_DESC="jfltexx-user 4.2.2 JDQ39 I9505XXUAMDE release-keys"

PRODUCT_NAME := aicp_jfltexx
PRODUCT_DEVICE := jfltexx

#bootanimation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip


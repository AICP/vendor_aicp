# Inherit AOSP device configuration for jfltevzw
$(call inherit-product, device/samsung/jfltevzw/full_jfltevzw.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/aicp/configs/cdma.mk)

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
  PRODUCT_NAME=jfltevzw \
  TARGET_DEVICE=jfltevzw \
  BUILD_FINGERPRINT="Verizon/jfltevzw/jfltevzw:4.3/JSS15J/I545VRUEMK2:user/release-keys" \
  PRIVATE_BUILD_DESC="jfltevzw-user 4.3 JSS15J I545VRUEMK2 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon

PRODUCT_NAME := aicp_jfltevzw
PRODUCT_DEVICE := jfltevzw

# boot animation
PRODUCT_COPY_FILES += \
       vendor/aicp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip
